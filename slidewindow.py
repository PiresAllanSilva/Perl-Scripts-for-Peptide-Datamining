import PySimpleGUI as sg

class Screen:
    def __init__(self):
        sg.change_look_and_feel("BlueMono")
        layout = [
            [sg.Text('Sequence',size=(10,0)), sg.Input(size=(40,0),key="seq")],
            [sg.Text('Window',size=(10,0)), sg.Input(size=(5,0),key="window")],
            [sg.Button('Submmit')],
            [sg.Output(size=(50,20), font="Courier 12")]
        ]
        self.janela = sg.Window('Slide Window').layout(layout)
        
    def Iniciar(self):
        while True:
            self.button, self.values = self.janela.Read()
            sequence = self.values["seq"]
            sequence = sequence.replace(" ","")
            sequence = sequence.strip()
            print (sequence)
            window_size = self.values["window"]
            win = len(sequence)-int(window_size)+1
            for i in range(win):
                new_sequence = sequence[i:int(window_size)+i]
                print (f">Fragment {i+1}-{i+int(window_size)+1}\n{new_sequence.upper()}")
tela = Screen()
tela.Iniciar()