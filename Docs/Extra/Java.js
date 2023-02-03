// Highlighting support for the library's functions, Enums, and string interpolation
const spans = document.querySelectorAll("span");
for (let i = 0; i < spans.length; i++) {
    const span = spans[i];
    if (span.classList.contains("p")) {
        const nextSpan = spans[i + 1];
        const nextSpanPlus = spans[i + 3]
        const prevSpan = spans[i - 1];
        if (nextSpan && nextSpan.classList.contains("n") && spans[i + 2].classList.contains("p")) {
            const prevTextContent = prevSpan.textContent
            if (prevSpan.classList.contains("n")) {
                if (prevTextContent == "String" || prevTextContent == "StringPlus") {
                    nextSpan.classList.add("nf");
                    nextSpan.classList.remove("n")
                }
                else {
                    if (prevTextContent == "Enum") {
                        prevSpan.classList.add("md-code-enum-data-type")
                        prevSpan.classList.remove("n")
                        nextSpan.classList.add("md-code-enum")
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
    if (span.parentElement.tagName == "CODE" && span.classList.contains("err") && span.textContent == "`" && !span.classList.contains("s")) {
        const inside = [];
        let nextSpan = span.nextSibling;
        while ( nextSpan ) {
            if (!nextSpan.classList.contains("err")) {
                inside.push(nextSpan);
                nextSpan = nextSpan.nextElementSibling;
            } else {
                nextSpan.classList.remove("err")
                break
            }
        }

        inside.forEach(Span => {
            if (Span.classList.contains("p")) {
                Span.classList.add("s")
            } else {
                if (Span.classList.contains("s2")) {
                    const matches = Span.textContent.match("(.+\{)(.*?)(\}.+)")
                    if (matches) {
                        const varNameSpan = document.createElement("span")
                        const leftContentSpan = document.createElement("span")

                        varNameSpan.textContent = matches[2]
                        leftContentSpan.textContent = matches[1]

                        leftContentSpan.classList.add("s")
                        varNameSpan.classList.add("n")

                        Span.parentElement.insertBefore(leftContentSpan, Span);
                        Span.parentElement.insertBefore(varNameSpan, Span);
                        Span.textContent = matches[3]
                    }
                }
            }
        });
        span.classList.remove("err")
        span.classList.add("s")
        nextSpan.classList.add("s")
    }
}