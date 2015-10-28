haiku = Haiku.create({"lines_attributes": {"0": {"content": "This is the first line"}}})
Line.create(haiku_id: haiku.id, content: "How do I write a haiku")
Line.create(haiku_id: haiku.id, content: "I can live with this")
