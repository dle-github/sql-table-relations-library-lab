def select_books_titles_and_years_in_first_series_order_by_year
"SELECT title, year
FROM books
WHERE series_id = 1
ORDER BY (year);"
end

def select_name_and_motto_of_char_with_longest_motto
"SELECT name, motto
FROM characters
ORDER BY LENGTH(motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
"SELECT species, COUNT(species)
FROM characters
GROUP BY species
HAVING COUNT(*) = (SELECT MAX(Cnt)
                  FROM(SELECT COUNT(*) as Cnt
                  FROM characters
                  GROUP BY species)
                  tmp);"
end

def select_name_and_series_subgenres_of_authors
"SELECT authors.name AS name,
       subgenres.name AS subgenre
FROM series
INNER JOIN authors ON author_id = authors.id
INNER JOIN subgenres ON subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
"WITH titleRow AS
(
SELECT title, COUNT(title) AS cnt
FROM series
INNER JOIN characters ON characters.author_id = series.author_id
WHERE species = 'human'
ORDER BY cnt ASC LIMIT 1
)
SELECT title FROM titleRow;"
end

def select_character_names_and_number_of_books_they_are_in
"SELECT name, COUNT(book_id) AS cnt
FROM characters
INNER JOIN character_books ON character_books.character_id = characters.id
GROUP BY characters.name
ORDER BY (cnt) DESC, characters.name;"
end
