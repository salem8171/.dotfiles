const origin = 'http://127.0.0.1:3000'

function loadCss(url) {
  const cssElement = document.createElement('link');
  document.querySelector('head').appendChild(cssElement);
  cssElement.rel = 'stylesheet';
  cssElement.type = 'text/css';
  cssElement.href = url;
}

function loadJs(url) {
  const jsElement = document.createElement('script')
  document.querySelector('head').appendChild(jsElement);
  jsElement.type = 'text/javascript';
  jsElement.src = url;
}

fetch(`${origin}/api/resources`)
  .then(res => res.json())
  .then(data => {
    data.css.forEach(cssFile => loadCss(`${origin}/css/${cssFile}`));
    data.js.forEach(jsFile => loadJs(`${origin}/js/${jsFile}`));
  });
