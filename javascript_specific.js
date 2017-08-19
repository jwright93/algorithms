// Get elements by className


const implementGetElementsByClassname = (className) => {
  let matches = [];
  let elements = document.body;

  const traverse = (element) => {
    for (let i = 0; i < element.childNodes.length; i++) {
      if (element.childNodes.getAttribute
        && element.childNodes.getAttribute('class')) {
          const items = element.childNodes.getAttribute('class').split(' ');
          if (items.indexOf(className) >= 0) matches.push(element.childNodes[i]);

          if (element.childNodes[i].length > 0) traverse(element.childNodes[i]);
      }
    }
  };

  traverse(elements);
  return matches;
};


const getElementsByClassName = (className) => {
  let result = [];

  const traverse = (element) => {
    for (var i = 0; i < element.childNodes.length; i++) {
      const classList = element.childNodes[i].classList;

    }
  };
  traverse(document.body);
  return result;
};




const getElementsByClassName = (name) => {
  let result = []

  const traverse = (element) => {

    if (element.classList && element.classList.contains(name)) {
      result.push(element);
    }

    for (var i = 0; i < element.childNodes.length; i++) {
      traverse(element.childNodes[i]);
    }
  }

  traverse(document.body);
  return result;
}
