document.addEventListener('DOMContentLoaded', () => {
  const selectedTagsContainer = document.querySelector('.selected-tags-container');
  const availableTagsContainer = document.querySelector('.available-tags');
  const tagListField = document.querySelector('.tag-list-field');

  function updateTagList() {
    const selectedTags = Array.from(selectedTagsContainer.querySelectorAll('.selected-tag'));
    const selectedTagNames = selectedTags.map(tag => tag.getAttribute('data-tag'));

    tagListField.value = selectedTagNames.join(',');
  }
  
  if (availableTagsContainer){
    availableTagsContainer.addEventListener('click', (event) => {
      if (event.target.classList.contains('tag')) {
        const tagName = event.target.getAttribute('data-tag');
        const existingTag = selectedTagsContainer.querySelector(`.selected-tag[data-tag="${tagName}"]`);
        if (!existingTag) {
          const tagElement = document.createElement('span');
          tagElement.className = 'selected-tag';
          tagElement.textContent = tagName;
          tagElement.setAttribute('data-tag', tagName);
  
          const removeButton = document.createElement('button');
          removeButton.textContent = 'x';
          removeButton.className = 'remove-tag';
          removeButton.addEventListener('click', () => {
            selectedTagsContainer.removeChild(tagElement);
            updateTagList();
          });
  
          tagElement.appendChild(removeButton);
          selectedTagsContainer.appendChild(tagElement);
  
          updateTagList();
        }
      }
    });
  }
});
