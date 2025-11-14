import itertools

# Distance matrix (symmetric)
dist = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

cities = range(len(dist))

def tsp(dist):
    best_cost = float("inf")
    best_path = None

    for perm in itertools.permutations(cities):
        cost = 0
        for i in range(len(perm)-1):
            cost += dist[perm[i]][perm[i+1]]
        cost += dist[perm[-1]][perm[0]]   # return to start

        if cost < best_cost:
            best_cost = cost
            best_path = perm

    return best_path, best_cost

path, cost = tsp(dist)
print("Best Path:", path)
print("Minimum Cost:", cost)
