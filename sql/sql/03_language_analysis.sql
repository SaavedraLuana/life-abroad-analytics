SELECT
    language,
    COUNT(*) AS usage_count
FROM life_abroad
GROUP BY language
ORDER BY usage_count DESC;
