USE osbb_diagram;
SELECT res.resident_id ,first_name, family_name, email, ra.apartment_id,
ap.area, b.name, b.street, b.number
FROM residents AS res
JOIN resident_apartment AS ra ON ra.resident_id=res.resident_id
JOIN apartments AS ap ON ra.apartment_id=ap.apartment_id
JOIN buildings AS b ON ap.building_id=b.building_id
WHERE car=0 AND res.resident_id IN (
		SELECT resident_id
		FROM resident_apartment AS ra
		GROUP BY resident_id
		HAVING COUNT( ra.resident_id)<2)