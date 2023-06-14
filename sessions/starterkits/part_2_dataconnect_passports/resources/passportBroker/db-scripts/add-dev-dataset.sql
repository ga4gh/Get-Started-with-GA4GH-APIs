INSERT INTO passport_user VALUES
    ("85ff5a54-48b9-4294-a91d-2be50bd2a77d"), /* access to all datasets */
    ("46d40e07-8d51-4e4d-a93a-e3438271172b"), /* access to alpha, beta, gamma */
    ("90c81ca0-3705-465a-97fb-b535022217fd"), /* access to gamma only */
    ("7421926c-d816-401f-a039-8992aca9279e"); /* access to none */

INSERT INTO passport_visa VALUES (
    "670cc2e7-9a9c-4273-9334-beb40d364e5c",
    "StarterKitDatasetsControlledAccessGrants",
    "https://datasets.starterkit.ga4gh.org/",
    "Controlled access dev datasets for the GA4GH Starter Kit",
    "87A3B5D68FD88197254D9889B4AAB"
), (
    "39e6e359-e8da-4193-92cc-2eed421fe729",
    "DatasetAlpha",
    "https://datasets.starterkit.ga4gh.org/",
    "First simulated dataset controlled by GA4GH",
    "BF4BF43A157FB51B49F7AE13B7216"
), (
    "51db203b-ed6e-4de8-b196-011cae5cea15",
    "DatasetBeta",
    "https://datasets.starterkit.ga4gh.org/",
    "Second simulated dataset controlled by GA4GH",
    "C5911B4A7BC2B343C6B7C55FED19D"
), (
    "4ed80481-dd73-4984-bee5-8e811a330102",
    "DatasetGamma",
    "https://datasets.starterkit.ga4gh.org/",
    "Third simulated dataset controlled by GA4GH",
    "6893F3226CF379E52281CCB4584F7"
);

INSERT INTO passport_visa_assertion (user_id, visa_id, status, asserted_at) VALUES

/* USER 0 */

(
    "85ff5a54-48b9-4294-a91d-2be50bd2a77d",
    "670cc2e7-9a9c-4273-9334-beb40d364e5c",
    "active",
    1652187600
),
(
    "85ff5a54-48b9-4294-a91d-2be50bd2a77d",
    "39e6e359-e8da-4193-92cc-2eed421fe729",
    "active",
    1652187600
),
(
    "85ff5a54-48b9-4294-a91d-2be50bd2a77d",
    "51db203b-ed6e-4de8-b196-011cae5cea15",
    "active",
    1652187600
),
(
    "85ff5a54-48b9-4294-a91d-2be50bd2a77d",
    "4ed80481-dd73-4984-bee5-8e811a330102",
    "active",
    1652187600
),
/* USER 1 */
(

    "46d40e07-8d51-4e4d-a93a-e3438271172b",
    "39e6e359-e8da-4193-92cc-2eed421fe729",
    "active",
    1652187600
),
(
    "46d40e07-8d51-4e4d-a93a-e3438271172b",
    "51db203b-ed6e-4de8-b196-011cae5cea15",
    "active",
    1652187600
),
(
    "46d40e07-8d51-4e4d-a93a-e3438271172b",
    "4ed80481-dd73-4984-bee5-8e811a330102",
    "active",
    1652187600
),
/* USER 2 */
(
    "90c81ca0-3705-465a-97fb-b535022217fd",
    "4ed80481-dd73-4984-bee5-8e811a330102",
    "active",
    1652187600
);