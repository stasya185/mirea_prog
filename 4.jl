#= Задача 4
Дано: Робот - Робот - в произвольной клетке ограниченного прямоугольного поля
Результат: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, следующий - весь, за исключением одной последней 
клетки на Востоке, следующий - за исключением двух последних клеток на Востоке, и т.д. =#


include("roblib.jl")
    #=
        invers(side::HorizonSide)
        movements!(r::Robot,side::HorizonSide,num_steps::Int)
        get_num_steps_movements!(r::Robot, side::HorizonSide)
        movements!(r::Robot,side::HorizonSide)
        moves!(r::Robot,side::HorizonSide)
        find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)
    =#

function stairs!(r) 
    movements!(r,Sud)
    movements!(r,West)

    
    side = Ost
    num_hor = moves!(r,side) 
    movements!(r,West) 
    mark_up!(r,num_hor)
end






function mark_up!(r::Robot,size::Int)
    i = 0
    while (1 <= size) 
        for _ in 1:size 
            move!(r,Ost)
            putmarker!(r)
        end
        if (isborder(r,West) == false) 
            movements!(r,West)
            putmarker!(r)
        end
        if (isborder(r,Nord) == false) 
        move!(r,Nord)
        size = size - 1
        else
            break
        end
    end
end







