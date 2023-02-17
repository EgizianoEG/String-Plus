const spans = document.querySelectorAll("span");
const contentLinks = document.querySelectorAll("a.md-content__button")

spans.forEach((span, index) => {
    // Highlighting support for the library's functions and Roblox Enums
    if (span.classList.contains("p")) {

        const prevSpan = spans[index - 1]
        const nextSpan = spans[index + 1]
        const parCBracket = spans[index + 2]
        const nextSpanPlus = spans[index + 3]

        if (nextSpan && parCBracket && nextSpan.classList.contains("n") && parCBracket.classList.contains("p")) {
            const prevTextContent = prevSpan.textContent
            if (prevSpan.classList.contains("n")) {
                if (prevTextContent === "String" || prevTextContent === "StringPlus") {
                    nextSpan.classList.add("nf");
                    nextSpan.classList.remove("n")
                } else {
                    if (prevTextContent === "Enum") {
                        prevSpan.classList.add("md-code-enum-data-type")
                        nextSpan.classList.add("md-code-enum")
                        prevSpan.classList.remove("n")
                        nextSpan.classList.remove("n")
                        if (nextSpanPlus && nextSpanPlus.classList.contains("n")) {
                            nextSpanPlus.classList.add("md-code-enum-item")
                            nextSpanPlus.classList.remove("n")
                        }
                    }
                }
            }
        }
    }

    // String interpolation highlighting support
    if (span.parentElement.tagName === "CODE" && span.classList.contains("err") && span.textContent === "`" && !span.classList.contains("s")) {
        const spansBetween = []
        let nextSpan = span.nextSibling

        while (nextSpan) {
            if (!nextSpan.classList.contains("err")) {
                spansBetween.push(nextSpan)
                nextSpan = nextSpan.nextElementSibling
            } else {
                nextSpan.classList.remove("err")
                break
            }
        }

        spansBetween.forEach(insideSpan => {
            if (insideSpan.classList.contains("p")) {
                insideSpan.classList.add("s")
            } else {
                if (insideSpan.classList.contains("s2")) {
                    const matches = insideSpan.textContent.match("(.+\{)(.*?)(\}.+)")
                    if ( matches ) {
                        const varNameSpan = document.createElement("span")
                        const leftContentSpan = document.createElement("span")
                        
                        varNameSpan.textContent = matches[2]
                        leftContentSpan.textContent = matches[1]
                        
                        varNameSpan.classList.add("n")
                        leftContentSpan.classList.add("s")
                        
                        insideSpan.textContent = matches[3]
                        insideSpan.parentElement.insertBefore(leftContentSpan, insideSpan)
                        insideSpan.parentElement.insertBefore(varNameSpan, insideSpan)
                    }
                }
            }
        });
        span.classList.add("s")
        span.classList.remove("err")
        nextSpan.classList.add("s")
    }
});

// Fix for content edit & content view (source of every page)
contentLinks.forEach((link) => {
    const pathFromDocs = link.href.match(".+master\/docs\/(.+)")[1]
    if (link.title.startsWith("View")) {
        link.href = `https://github.com/EgizianoEG/String-Plus/raw/main/Docs/${pathFromDocs}`
    } else {
        link.href = `https://github.com/EgizianoEG/String-Plus/edit/main/Docs/${pathFromDocs}`
    }
});