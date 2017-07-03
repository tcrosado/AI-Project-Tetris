;;Estou a utilizar nomes em ingles para os argumentos das funcoes, e portugues para os campos
(defstruct estado
	pontos ;;optional
	pecas-por-colocar
	pecas-colocadas ;;optional
	tabuleiro)

(defun cria-estado (points pieces_to_place pieces_placed board)
	(make-estado 
		:pontos points
		:pecas-por-colocar pieces_to_place
		:pecas-colocadas pieces_placed
		:tabuleiro board)
)

(defun copia-estado(state)
	(make-estado 
		:pontos (estado-pontos state)  
		:pecas-por-colocar (estado-pecas-por-colocar state) 
		:pecas-colocadas (estado-pecas-colocadas state) 
		:tabuleiro (estado-tabuleiro state)) 
)


(defun estados-iguais-p(state1 state2)
	(if (and (equal (estado-pontos state1)(estado-pontos state2))
		(equal (estado-pecas-por-colocar state1)(estado-pecas-por-colocar state2))
		(equal(estado-pecas-colocadas state1)(estado-pecas-colocadas state2))
		(equal(estado-tabuleiro state1)(estado-tabuleiro state2))
		))
	t
	nil)


(defun estado-final-p (state)
	(if (or (equal(estado-pecas-por-colocar state) 0) (tabuleiro-topo-preenchido (estado-tabuleiro state)))) 
	t
	nil)
