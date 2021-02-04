require('easy-autocomplete')
const colors = ["is-primary", "is-info", "is-warning", "is-danger", "is-success", "is-black", "is-dark", "is-link"]

const createTagChip = () => {
    let tag = document.querySelector("#tags-search").value
    let tags = document.getElementById("challenge_tags").value.split(', ')
    if(tags.includes(tag)) {
        clearTagSearch()
        return
    }
    if(!tag.isEmpty) {
        let tagDiv = document.createElement('div')
        tagDiv.classList = "tags has-addons m-1"

        let tagSpan = document.createElement('span')
        tagSpan.classList = "tag"
        tagSpan.classList.add(colors[Math.floor(Math.random() * colors.length)])
        tagSpan.textContent = tag

        let tagRemoveLink = document.createElement('a')
        tagRemoveLink.classList = "tag is-delete"
        tagRemoveLink.addEventListener('click', removeTag)

        tagDiv.appendChild(tagSpan)
        tagDiv.appendChild(tagRemoveLink)

        document.getElementById('tag-chips').appendChild(tagDiv)
        clearTagSearch()
        setInputValue(tagSpan.textContent)
    }
}

const options = {
    url: (term) => `search?q=${term}`,
    getValue: "name",
    template: {
        type: "custom",
        method: (value) => `<p class="p-1">${value}</p>`
    },
    list: {
        onClickEvent: createTagChip,
        onKeyEnterEvent: createTagChip
    }
}

const removeTag = (event) => event.target.parentNode.remove()
const setInputValue = (value) => document.querySelector("#challenge_tags").value += `${value}, `
const clearTagSearch = () => document.getElementById("tags-search").value = ""

$("#tags-search").easyAutocomplete(options)
document.getElementById("challenge_form").onkeypress = (event) => {
    if(event.keyCode == 13) {
        event.preventDefault()
        createTagChip()
    }
}