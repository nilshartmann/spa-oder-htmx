@param String newsletterEmail = ""
@param String newsletterResult = ""

<%--<!-- todo--%>
<%--         - hx-post auf /newsletter--%>
<%--         - 🔎 Untersuchen: Netzwerkverkehr, was wird geschickt--%>
<%--         - 🤔 was passiert, wenn wir KEINE hx-swap-Angabe machen?--%>
<%--         -       hx-swap="outerHTML"--%>
<%--         - slowdown und hx-disabled-elt, z.B. this, input, button--%>
<%--         -                  ^-- ⚠️ das setzt "nur" disabled state.--%>
<%--         -                  ^-- 🤔 wie können wir Submit blockieren, bis Eingabe erfolgt ist--%>
<%--         -                  ^-- 🤔 wie würden wir das Formular zurücksetzen?--%>
<%--         -                         (Use-Case: erst "Subscribed" anzeigen, bei Keypress Form zurücksetzen)--%>
<%--         ---%>
<%--         -->--%>
<form
        class="max-w-1/4 flex items-center space-x-4 pe-2 ps-2 font-barlow"
        hx-post="/newsletter?slowdown=2400"
        hx-disabled-elt="this, input, button"
        hx-swap="outerHTML"
>
    <label for="newsletterEmailInput">Don't miss new recipes. Subscribe to newsletter</label>
    <div class="max-w-64">
        <input
                id="newsletterEmailInput"
                name="newsletterEmail"
                type="email"
                class="h-8 w-full max-w-full rounded border border-gray-400 bg-white p-2 text-gray-500 disabled:bg-gray-200"
                value="${newsletterEmail}"
                placeholder="E-Mail"
        />
    </div>
    <div>
        @template.components.Button(
        checked="success".equals(newsletterResult),
        disabled=false,
        content = @`
            <button
                    id="subscribeButton"
                    type="submit"
            >Subscribe</button>
        `)
    </div>
    @if("success".equals(newsletterResult))
        <div>Subscribed!</div>
    @endif

</form>
