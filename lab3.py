from pyswip import Prolog
prolog = Prolog()
prolog.consult("lab1.pl")

def get_attrs(item):
    output = []
    for attr in ['agility', 'power', 'intelligence', 'invisibility', 'move_speed', 'fast_movement',
              'armor', 'magic_resist', 'magic_damage', 'hp', 'mana']:
        a = list(prolog.query(f"{attr}({item})."))
        if len(a) > 0:
            output.append(attr)
    return output

def get_parents(item):
    return [_['X'] for _ in list(prolog.query(f"needs(X, {item})."))]

prop = input('Введите имя интересующего предмета: ')
while (prop):
    print('Attributes:')
    for i in get_attrs(prop):
        print(i)
    print('Parents:')
    for i in get_parents(prop):
        print(i)
    print('-----------------------------------')
    prop = input('Введите имя интересующего предмета: ')


