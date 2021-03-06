<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax/upload_form.jsp</title>
<style>
	#holder { border: 10px dashed #ccc; width: 300px; min-height: 300px; margin: 20px auto;}
	#holder.hover { border: 10px dashed #0c0; }
	#holder img { display: block; margin: 10px auto; }
	#holder p { margin: 10px; font-size: 14px; }
	progress { width: 100%; }
	progress:after { content: '%'; }
	.fail { background: #c00; padding: 2px; color: #fff; }
	.hidden { display: none !important;}
</style>
</head>
<body>
<section id="wrapper">
<style>
	#holder { border: 10px dashed #ccc; width: 300px; min-height: 300px; margin: 20px auto;}
	#holder.hover { border: 10px dashed #0c0; }
	#holder img { display: block; margin: 10px auto; }
	#holder p { margin: 10px; font-size: 14px; }
	progress { width: 100%; }
	progress:after { content: '%'; }
	.fail { background: #c00; padding: 2px; color: #fff; }
	.hidden { display: none !important;}
</style>
<article>
  <div id="holder">
  </div> 
  <p id="upload" class="hidden"><label>Drag &amp; drop not supported, but you can still upload via this input field:<br><input type="file"></label></p>
  <p id="filereader" class="hidden">File API &amp; FileReader API not supported</p>
  <p id="formdata" class="hidden">XHR2's FormData is not supported</p>
  <p id="progress" class="hidden">XHR2's upload progress isn't supported</p>
  <p>Upload progress: <progress id="uploadprogress" max="100" value="0">0</progress></p>
  
</article>
<script>
var holder = document.getElementById('holder'),
    tests = {
      filereader: typeof FileReader != 'undefined',
      dnd: 'draggable' in document.createElement('span'),
      formdata: !!window.FormData,
      progress: "upload" in new XMLHttpRequest
    }, 
    support = {
      filereader: document.getElementById('filereader'),
      formdata: document.getElementById('formdata'),
      progress: document.getElementById('progress')
    },
    acceptedTypes = {
      'image/png': true,
      'image/jpeg': true,
      'image/gif': true
    },
    progress = document.getElementById('uploadprogress'),
    fileupload = document.getElementById('upload');

"filereader formdata progress".split(' ').forEach(function (api) {
  if (tests[api] === false) {
    support[api].className = 'fail';
  } else {
    // FFS. I could have done el.hidden = true, but IE doesn't support
    // hidden, so I tried to create a polyfill that would extend the
    // Element.prototype, but then IE10 doesn't even give me access
    // to the Element object. Brilliant.
    support[api].className = 'hidden';
  }
});

function previewfile(file) {
  if (tests.filereader === true && acceptedTypes[file.type] === true) {
    var reader = new FileReader();
    reader.onload = function (event) {
      var image = new Image();
      image.src = event.target.result;
      image.width = 250; // a fake resize
      holder.appendChild(image);
    };

    reader.readAsDataURL(file);
  }  else {
    holder.innerHTML += '<p>Uploaded ' + file.name + ' ' + (file.size ? (file.size/1024|0) + 'K' : '');
    console.log(file);
  }
}

function readfiles(files) {
    debugger;
    var formData = tests.formdata ? new FormData() : null;
    for (var i = 0; i < files.length; i++) {
      if (tests.formdata) formData.append('file', files[i]);
      previewfile(files[i]);
    }

    // now post a new XHR request
    if (tests.formdata) {
      var xhr = new XMLHttpRequest();
      xhr.open('POST', '/devnull.php');
      xhr.onload = function() {
        progress.value = progress.innerHTML = 100;
      };

      if (tests.progress) {
        xhr.upload.onprogress = function (event) {
          if (event.lengthComputable) {
            var complete = (event.loaded / event.total * 100 | 0);
            progress.value = progress.innerHTML = complete;
          }
        }
      }

      xhr.send(formData);
    }
}

if (tests.dnd) { 
  holder.ondragover = function () { this.className = 'hover'; return false; };
  holder.ondragend = function () { this.className = ''; return false; };
  holder.ondrop = function (e) {
    this.className = '';
    e.preventDefault();
    readfiles(e.dataTransfer.files);
  }
} else {
  fileupload.className = 'hidden';
  fileupload.querySelector('input').onchange = function () {
    readfiles(this.files);
  };
}

</script>

</a>
    
</section>
<script src="/js/prettify.packed.js"></script>
<script>
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>
try {
var pageTracker = _gat._getTracker("UA-1656750-18");
pageTracker._trackPageview();
} catch(err) {}</script>


<canvas id="__gesture_canvas__" width="0" height="0" style="z-index: 100000000; position: fixed; background: transparent !important; top: 0px; left: 0px;"></canvas><span id="__gesture_preview__" style="z-index: 100000001; position: absolute; background: rgba(255, 255, 225, 0.85); margin: 0px; border: 1px solid black; white-space: nowrap; display: none;"></span>
<canvas id="__gesture_canvas__1_" width="0" height="0" style="z-index: 100000000; position: fixed; background: transparent !important; top: 0px; left: 0px;"></canvas><span id="__gesture_preview__1_" style="z-index: 100000001; position: absolute; background: rgba(255, 255, 225, 0.85); margin: 0px; border: 1px solid black; white-space: nowrap; display: none;"></span>

</body>
</html>