const btnOrganizador = document.querySelector("#btn-organizador")
const btnEvaluador = document.querySelector("#btn-evaluador")
const btnPonente = document.querySelector("#btn-ponente")
const inputHidden  = document.querySelector("#input-hidden")

btnOrganizador.addEventListener('click', () => {
    inputHidden.value = "organizador"
})

btnEvaluador.addEventListener('click', () => {
    inputHidden.value = "evaluador"
})

btnPonente.addEventListener('click', () => {
    inputHidden.value = "ponente"
})