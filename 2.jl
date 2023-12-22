#= Задача 2
Дано: Робот - в произвольной клетке ограниченного прямоугольного поля
Результат: Робот - в исходном положении, и по краям прямоугольника стоят маркеры =#

include("roblib.jl")
    #=
        invers(side::HorizonSide)
        movements!(r::Robot,side::HorizonSide,num_steps::Int)
        get_num_steps_movements!(r::Robot, side::HorizonSide)
        movements!(r::Robot,side::HorizonSide)
        moves!(r::Robot,side::HorizonSide)
        find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)
    =#

function mark_frame_perimetr!(r::Robot)
    
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    putmarker!(r)
    
    for side in (HorizonSide(i) for i=0:3) 
        putmarkers!(r, side) 
    end 
