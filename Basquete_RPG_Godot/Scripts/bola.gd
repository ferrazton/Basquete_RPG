# -<bola>----------------------------------------------------------------------------------------- #
# Bola usada no jogo, controlada pelos seus estados, fazendo suas proprias ações.
# ------------------------------------------------------------------------------------------------ #
extends CharacterBody2D
class_name Bola

@onready var maquina_estados = $MaquinaEstados
@onready var aparencia : Aparencia = $Aparencia

var jogador_segurando : Jogador = null
var tile_alvo : Vector2i
var alvo
var pontos : int
var forca : int
var move_para_em_tile : bool = true

func _ready():
	Global.bola = self
	# Centraliza bola no tile.
	self.global_position = Global.quadra.cordenada_centralizada(self.global_position)
	maquina_estados.executar_tudo_pronto()

# Define qual jogador está segurndo a bola.
func set_jogador_segurando(jogador : Jogador):
	jogador_segurando = jogador

# Retorna qual jogador está segurando a bola.
func get_jogador_segurando():
	return jogador_segurando

# Define qual tile alvo que a bola tem que ir.
func set_tile_alvo(tile : Vector2i):
	tile_alvo = tile

# Retorna qual tile alvo que a bola tem que ir.
func get_tile_alvo():
	return tile_alvo

# Define o alvo que a bola quer chegar.
func set_alvo(alvo_escolhido):
	alvo = alvo_escolhido

# Retorna o alvo que a bola quer chegar.
func get_alvo():
	return alvo

# Define a quantidade de pontos que o time vai ganhar se a bola acertar a cesta.
func set_pontos(valor : int):
	pontos = valor

# Retorna a quantidade de pontos que o time vai ganhar se a bola acertar a cesta.
func get_pontos():
	return pontos

# Define o valor da força que a bola tem no passe/arremesso.
func set_forca(valor : int):
	forca = valor

# Retorna o valor da força que a bola tem no passe/arremesso.
func get_forca():
	return forca

func bola_vai_pro_chao():
	if jogador_segurando != null:
		jogador_segurando.set_com_bola(false)
		jogador_segurando.aparencia.atualiza_animacao()
		Global.bola_para.emit()
