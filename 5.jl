#= Задача 5
Дано: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные 
перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
Результат: Робот - в исходном положении и в углах поля стоят маркеры =#

include("roblib.jl")
    #=
        invers(side::HorizonSide)
        movements!(r::Robot,side::HorizonSide,num_steps::Int)
        get_num_steps_movements!(r::Robot, side::HorizonSide)
        movements!(r::Robot,side::HorizonSide)
        moves!(r::Robot,side::HorizonSide)
        find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)
    =#

function mark_angles(r)
    num_steps=[]
    while isborder(r,Sud)==false || isborder(r,West) == false 
        push!(num_steps, moves!(r, West))
        push!(num_steps, moves!(r, Sud))
    end
    for side in (Nord,Ost,Sud,West)
        movements!(r,side)
        putmarker!(r)
    end





    for (i,n) in enumerate(num_steps) 
        side = isodd(i) ? Ost : Nord 
        movements!(r,side,n)
    end
end







