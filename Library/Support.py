"""
Support library for external utilities
"""
class Support:

    def Find_the_second_least_price_and_index(self,list):
        for j in range(len(list)):
            new_str = ""
            for i in range(len(list[j])):
                if i != 0:
                    new_str = new_str + list[j][i]
            list[j] = float(new_str)
        list1=list
        sorted(list1)
        for index in range(len(list)):
            if list[index] == list1[1]:
                break
        index = index+1
        return list[1],index






