using Gumbo, HTTP, AbstractTrees

export get_problem_title

get_problem_title(pn) = begin
    p = HTTP.get("https://projecteuler.net/problem=$pn").body |> String |> parsehtml

    for elem in PreOrderDFS(p.root)
        if elem isa HTMLElement
            if tag(elem) == :h2
                return elem.children[1].text
            end
        end
    end
end
