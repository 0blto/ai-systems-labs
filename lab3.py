from pyswip import Prolog
import time

prolog = Prolog()
prolog.consult("lab1.pl")

params = {
    1: ['move_speed', 'magic_damage'],
    2: ['move_speed', 'power', 'hp', 'control'],
    3: ['power', 'hp', 'magic_damage', 'control']
}

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

def get_children(item):
    return [_['X'] for _ in list(prolog.query(f"needs({item}, X)."))]

def search(params_list, depth):
    items = set()
    for stat in params_list:
        for item in list(prolog.query(f'{stat}(X)')):
            items.add(item['X'])
    web = dict()
    for item in items: web[item] = [i['X'] for i in list(prolog.query(f'needs(X, {item})'))]
    first = set()
    for i in web.keys():
        if not web[i]:
            first.add(i)
    if depth == 1: return first
    second = set()
    for i in first:
        for j in get_children(i):
            second.add(j)
    if depth == 2: return second
    third = set()
    for i in second:
        for j in get_children(i):
            third.add(j)
    return third







time.sleep(0.1)
print('\n'*15)
build_style = int(input('\nКакой билд вы хотите собрать?\n1. скорость+урон\n2. скорость+выживаемость\n3. выживаемость+урон\n(все билды включают скорость+выживаемость+урон, просто в разной степени)\n'))
build_time = int(input('\nКакая стадия игры вас интересует?\n1. early\n2. mid\n3. late\n'))
results = search(params[build_style], build_time)
print('Рекомендуемые предметы\n')
for item in results:
    print(item)
    print('Attributes:')
    for attr in get_attrs(item):
        print(attr)
    print('-----------------------------------')
    print('Parents:')
    for parent_item in get_parents(item):
        print(parent_item)
    print('-----------------------------------\n')



