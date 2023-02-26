CREATE or replace TABLE public.ld_node_selection_lov
(id integer,
    selection_type varchar(50),
    node_1 json,
    node_2 json,
    node_3 json)
;
ALTER TABLE IF EXISTS public.ld_node_selection_lov
    OWNER to postgres;

    INSERT INTO public.ld_node_selection_lov(
    id,selection_type, node_1, node_2, node_3)
    VALUES (1,'1node', '{
  "value": [
    "Publisher",
    "Proposition",
    "Keyword",
    "Journal Paper",
    "Hypothesis",
    "Funding",
    "Construct",
    "Author",
    "Affiliation"
  ]
}','{}' ,'{}');


    INSERT INTO public.ld_node_selection_lov(
    id,selection_type, node_1, node_2, node_3)
    VALUES (2,'2node', '{
  "value": [
    "Ind. Var.",
    "Hypothesis",
    "Proposition",
    "Journal Paper",
    "Journal Publication",
    "Publisher",
    "Author",
    "Affiliation"
  ]
}','{
    "Construct (Ind. Var.)": [
      "Construct (Dep. Var.)"
    ],
    "Hypothesis": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)"
    ],
    "Proposition": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)"
    ],
    "Journal Paper": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)",
      "Hypothesis",
      "Proposition",
      "Keyword"
    ],
    "Journal Publication": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)",
      "Hypothesis",
      "Proposition",
      "Journal Paper",
      "Author",
      "Keyword",
      "Affiliation",
      "Funding"
    ],
    "Publisher": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)",
      "Hypothesis",
      "Proposition",
      "Journal Paper",
      "Author",
      "Keyword",
      "Affiliation",
      "Funding"
    ],
    "Author": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)",
      "Hypothesis",
      "Proposition",
      "Journal Paper",
      "Keyword",
      "Funding"
    ],
    "Affiliation": [
      "Construct",
      "Construct (Ind. Var.)",
      "Construct (Dep. Var.)",
      "Construct (Mediator)",
      "Construct (Moderator)",
      "Hypothesis",
      "Proposition",
      "Journal Paper",
      "Journal Publication",
      "Author",
      "Keyword",
      "Funding"
    ]
  }' ,'{}');



    INSERT INTO public.ld_node_selection_lov(
    id,selection_type, node_1, node_2, node_3)
    VALUES (3,'3node', '{
  "value": [
    "Construct (Ind. Var.)"
  ]
}','{
  "Construct (Ind. Var.)": [
    "Construct (Mediator)",
    "Construct (Moderator)"
  ]
}' ,'{"Construct (Mediator)":["Construct (Dep. Var.)"],
  "Construct (Moderator)": ["Construct (Dep. Var.)"]
}');

------------------example Postgres select queries----------------
---single node
select node_1->>'value' from public.ld_node_selection_lov where selection_type='1node';

---2 node selection and 2nd drop down
SELECT  node_2 ->> 'Affiliation' 
FROM public.ld_node_selection_lov
where selection_type='2node';

---3 node selection with second drop down
SELECT  node_2 ->> 'Construct (Ind. Var.)' 
FROM public.ld_node_selection_lov
where selection_type='3node';

---3 node selection with 3td drop dow
SELECT  node_3 ->> 'Construct (Mediator)' 
FROM public.ld_node_selection_lov
where selection_type='3node';




