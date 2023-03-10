SELECT reg_number
FROM public."Car" C
WHERE C.reg_number LIKE '%#_%' ESCAPE '#' OR (C.reg_number IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
AND C.reg_number NOT IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'));