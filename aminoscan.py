import PySimpleGUI as sg

class Screen:
    def __init__(self):
        sg.change_look_and_feel("BlueMono")
        layout = [
            [sg.Text('Sequence',size=(10,0)), sg.Input(size=(40,0),key="seq")],
            [sg.Text('Amino acid',size=(10,0)), sg.Input(size=(5,0),key="aa")],
            [sg.Button('Submmit')],
            [sg.Output(size=(50,20), font="Courier 12")]
        ]
        self.janela = sg.Window('Amino acid scaning').layout(layout)
        
    def Iniciar(self):
        while True:
            self.button, self.values = self.janela.Read()
            sequence = self.values["seq"]
            aminoacid = self.values["aa"]
            sequence = sequence.rstrip()
            sequence = sequence.replace(" ","")
            for i in range(len(sequence)):
                new_sequence = sequence[:i] + aminoacid + sequence[i+1:]
                #print (f">Newseq {i+1}\n{new_sequence.upper()}")
                print (new_sequence.upper())
tela = Screen()
tela.Iniciar()