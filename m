Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D428A2EBBA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953039; cv=fail; b=UVg4NYD+WgehVrBL383SslPbZZQ3+bVoM9fWuKE5y91lxgtTl4JP1C7LJ+45l4sG/rjWuvKmNpEiP5ykHUMJiuf0dXGghJe5pTwkmOPI0MMEvDFtEo2xH6F47zes9Qdd+c/sCyl6mhs5O0GkEZuFSXxKoGIgwrVgEbxQhNofcjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953039; c=relaxed/simple;
	bh=AtpufXTRqbjTlqTHE1L3Dd/QobF0j4lK24+QerJ3Ocg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JpvVVu/fkwbtFev8LZ+xqZU7NnZ4bX3wsi7306SzYhyddmMgA6wIsIaEZTTxHAkjByhaTB7TpcRquP5U4FnAnV6sZ6iJX2BxO7VNwPJfJDSp5T5LC0ZS9cwZxZEk1EpWcHpN3QKYFL8EyaO0ra+JB3KoRtOLhKdkD8aN4u/Pk1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U+fV818k; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U+fV818k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHiCDd9JqUohAEnqc6NRo+g2vEsiigQzl5FWlqdkwV+I+fHthBNLvboDzWQH/1CiHcDvYtLfV08ypzDCddJEERaUdKWjtvZ9TKfc02hDo4dVdA5PdQWyIQUpTqk43TmXinKR2z0df9eNVVxKTdKoPN6/tb3qbUg/hCpKxiKyLoI+Ca3kHZARZNVTfaz98Q2Kksfn90CTqkDLoXzf9yyite9Hm7WRqay2pJupZQKzEhMQOhvazRb2MkAEtozYPUknpoOW81Y5fsxJ7bQ/HlRPds0BaGD5qeAaI+SKubtqTsRtJvlmTHml7436VoITbKPVzjpg3RikTOgVR1xRrs1VkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0lwc8aGoKZ/Zgfp/M4RR8qIMjjtMvdNNVjqK/UBgBo=;
 b=M1DujYvfZp9BrYpT6nxHiNvgW5W8woXlsO1NxyC7JI0IPgBPWXf0l49lksSQliy0vgXf2G9A7OjFXncWQ8iCcJNxmpX1lnTpEY7Y36Kiq7WXDx+6DvbrA3+utDSqS8nVPD8cag/83dAQk8cMD2qqmge/hRYHAgQululV6FsctFnQPja9WhZNzxqDnGOOtx2f91U9PnulcFSXMV+XwpZ3Kqmqyh4wpH3qQvewoAKJcU+I8gX7aYpx0so0mBx1RQfN7obNQ7Q+m+lJxhiaC8a7zZmqfhBY/8oDExIkcqxfX+hq0c98LETP3grDT468R/Nkam5WlgcNHm240e13hrmDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0lwc8aGoKZ/Zgfp/M4RR8qIMjjtMvdNNVjqK/UBgBo=;
 b=U+fV818kP118ucTfpymhSlXe3fUuWCR9RDKbcolWyIQHn0aAB3y7VndYOKOqF2PKaFXVpGF/OCuss2khfgV4Vrf/dMFEZg51ZU1Le3ZxLGFszDcnz8hXjzUW0G4ks9wBwq9KIN4kr34hIMX2blmVscOuUtTapEJmN5M2bwFo/5oqvOpnPeD069/W3orUpHehiw2OUPze6Kw2QvTy4ZfOj7x0mgU5MztczlzZvkkbaObwr8G96GW8n/+2k2blTTAoYYxtlipKEfHNg+Aqk8Zp9tpWNbIFGzw6FaTP2ZhFq2uak7A+eBpake8s3vFTrhhyfYM9aCH+WQrPMGsYvu6hrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB7034.namprd12.prod.outlook.com (2603:10b6:a03:449::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 15:50:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Thu, 26 Jun 2025
 15:50:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: David Hildenbrand <david@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [davidhildenbrand:migration 19/29] mm/migrate.c:74: undefined
 reference to `zsmalloc_mops'
Date: Thu, 26 Jun 2025 11:50:29 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <6B5E3CA4-CC1B-4F96-8A45-0695D7477914@nvidia.com>
In-Reply-To: <202506262314.sLjaWWCY-lkp@intel.com>
References: <202506262314.sLjaWWCY-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:208:335::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: efb3865f-52af-44d2-40cf-08ddb4c92def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oES2CNFHxGjIwveO2xE9h936oR9n+t8hB/vH7Tp6ELHGIcIcwNudTBYKVyPA?=
 =?us-ascii?Q?mk/QfeEs7zvX3aHF/LUUAjsvtRq2/JbiEzpkyiFuvW4Of8vZ6XjLJANMX1ao?=
 =?us-ascii?Q?2LH8p9zHnXMmsxPhVGe7o/XH+xqBomybCfLDJ/AHLPvukEgBkh2zZJR3d9dq?=
 =?us-ascii?Q?Ghvg4kPZey4U6XgyUVHF5FlzXJsEh6Z34SsvhJ6Py/I4lFaqeVgHc5KFi0LD?=
 =?us-ascii?Q?ChlfpTRXxshO6J7hUxW1BDSIZgiv4Eq3PN/Nz1yXRWtHDixBvN8raFb21Tjy?=
 =?us-ascii?Q?MSLpkMD5PeSLhuPEbadtz9cH4s+MADNn+lC0QGLRxg9v1bk2EqMy+07R+2Z3?=
 =?us-ascii?Q?0bt3VJICEHuKL3SmExYc6jbgbHOp4akBAzhdJQWX6yf7EqrjRMwCcAgn4VtA?=
 =?us-ascii?Q?01e8FFxMYxRs9eW1Wxz5+V7czPKBgrJ6Heyt93z3Kez8Az6iHEKhtWhWapsA?=
 =?us-ascii?Q?5+9L5/pbZQFNrDYK9uM63L2CFfqD7gGEsDqLutyGXfSGo1fMDBi694DVmQfm?=
 =?us-ascii?Q?OBTLzOc3ikSrCuUY+GYNBKb9YrojR1M1eP5+HPiQSYTsfb1LSqEu6yeAUNOd?=
 =?us-ascii?Q?e/VqtlOCc38w2BilfFeX5o9E+Uo5Yu/0pnLXj9nhl/ZwFZ3HmIjZtuTUMs8N?=
 =?us-ascii?Q?kA7JmcHgr90umCf+UzkE6MlAN3faSbRBYcKAiEPVCDjjiydLKleRZ+lqH6Gw?=
 =?us-ascii?Q?yN8ILMDr2R7edUW04bix+lP2mQfFiDpcyetkQ+8mKrHjtxr6Kn4MbAi8N80h?=
 =?us-ascii?Q?Ikz3jljKCiK6fc+RLEje737tXc9uUoKkS3BuwqYMbXrLn5LBatUFa4L7KD14?=
 =?us-ascii?Q?i4KXJ8h5trAMf0Wg0obUHhp1s21aocmc2bmrG1JLsJPBxRSjOy/Q53VvLzYi?=
 =?us-ascii?Q?saQRXG7Mutf3N/ULiK3aZcdM9DM3LDJlXvQ0hZuYzG+LHHacBfIBAbslwhzS?=
 =?us-ascii?Q?kezHDoEIoSCJka2sxO3PCDs4p8eL8Ogs+bDxHKCK6sD0NzivmLN5AR7pEYk4?=
 =?us-ascii?Q?c3+e9rngIbELMXBkYixpkBEoPvwzGOFkc+C+WHP8thEem3hdERIpni1Am8w0?=
 =?us-ascii?Q?UR16jMZ6tLLGEkBcM8R5v+yhfAxo2QzcK5ycekoPFyhvlEbtMK6fTjiM/h6Y?=
 =?us-ascii?Q?CqVb+HsuImn+e7helPragDyDz2SDEw08MuL+9cpscVgzmVOXEDECvSe9fy1s?=
 =?us-ascii?Q?Ak4FXMFablk3V+UuO3OjxxXV2dPQlyL2l93VYul2IcKJrPBp6OUCfO7xm7UF?=
 =?us-ascii?Q?LF9HdEQcgQn29iZNronE2ropyK+HGsLvuKWeGkpvE47Rjs4qelKYpNMDSkl3?=
 =?us-ascii?Q?aenVqzMv07wEvxHT1GclqrToxLIAAwKlWyTMs1Dt2AykwYHPOw6BJkfvgRej?=
 =?us-ascii?Q?Yso8W50=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4QFV7V9PgKZ9adrX7Skqkxx5f9yonSbjbUJ5IFsC+hVxBMSHwx277SXDX/6?=
 =?us-ascii?Q?DmpKxrVZgtk1GDNd2YsyM0i6seyH6lWNJPpAH7Ppv8oTlH6XpVqJRqInOH5q?=
 =?us-ascii?Q?WidKEZF3MS1gfJ4mbT6GBpOBF1FYbRMsLEH25eqHUmOqwKEbyLVtLjwM2XJz?=
 =?us-ascii?Q?kYdj/8zSLp18dyEHwwccLBslzSUzmWyYlg4hj0g0loigJ3Lts2Xzpwzp+4Hv?=
 =?us-ascii?Q?JxjDFFuTPNcqGsvKQxHRfvjmd0s3PNV+fQhKdYDSpAQpNJOj6qKrnlp8GmL3?=
 =?us-ascii?Q?oWcBEJZgxWkNM2/HlPCjMa6TR0IypYGfpwvGCTrSjx0jJLow073dyk6W6vxI?=
 =?us-ascii?Q?jkEhogMa7d97sgDlr7vq9wJOuvjTLVQSgjzvnLcAnsBBiFCNpSHD8ZbsL7SS?=
 =?us-ascii?Q?0d5TVWVOmGjiCX0svlA85jSF4TSfFEEUuHYb3inFrJ/YLOMkJx7wKVzupIwq?=
 =?us-ascii?Q?d9+hK8dYLxa1pdLo2ybpsKAP6XA2W6aqHX0oKrqapR6NqSHYa742H19JQc1l?=
 =?us-ascii?Q?j3eGt7JHLlfl9oQ9I9dQRNLl01YUCfnW7iC/XFtUod6APH1zy0HY9QHMFQ2s?=
 =?us-ascii?Q?ccVdkNQTvs77spdDQvd5LV4O41k6dpWdVcG8u12jst/V1BiRDRuZCaU4tiu8?=
 =?us-ascii?Q?o8GfJPqXyiNvvQz1rkSFYOwGImG76hAoN1neSfV0tATLlmoUMGjGaYlE6B/k?=
 =?us-ascii?Q?jZrWqJMAsGJ4j8x2j5bi+4j3toLLTN2SeyBN5vzyNkHrJuKQ0lxESYKRqR7h?=
 =?us-ascii?Q?FqRAzdMxd4cwj8PsR1h6OiOoCqEiKp/Mpv0aqmPJoJlJi9s5tm2bCn1Uu+WT?=
 =?us-ascii?Q?eqqGU5KDRyJHJKgE3wyfCWxYqwX9Q/pAzBfgbnX8lbwPsC+u2pRMJ04xKL10?=
 =?us-ascii?Q?xlocRMUPRGnZ0QfIND6lwmLlK69u1PLgsFc4/JfD6gQZSw8r7US/tGEvC0OI?=
 =?us-ascii?Q?HivGIa7LMn4dG/imKrZ2w8xOEZO6GJJS02n4AUvQGkMzMf88GmwsTqbmbcht?=
 =?us-ascii?Q?keMINXcacBBilhDVbs3InZotTTGdVc/lNK55puIyyx7xI7tN8UZqw7o8TkcF?=
 =?us-ascii?Q?s6LSb0R5UuhyCnTn/yfMWssTGEEMpXeB79QAq8EtQpE3YAL+TeyfvpshTZQO?=
 =?us-ascii?Q?6uc8/giI0ZaSNzmWelM4ktuHvVrjsoFMePkLmQSRVQwdIFlSz3NgO8G8jpya?=
 =?us-ascii?Q?LIsnL2aQ7dM0nyAXfn/gdYHRkvgTQJKCSqQ1kMMIyNq+cuNVRmWesW7oYU4a?=
 =?us-ascii?Q?PFYmI/FXVVYbLs1rfbdr2snvUXzKr0dI7aDihhfL/ht/b3mq95Fh7384y/+P?=
 =?us-ascii?Q?yNrYKg02X20BN602V6PdMFBfZqNvJRZqmG8557HodmFYpVFRmRibHENbJSDq?=
 =?us-ascii?Q?SbPHa0d1ctU9x75Ijxp5n9OptryLMVUlQU49EbNm7foXeftVkktfko+DKf0o?=
 =?us-ascii?Q?IpPV7AmjWI55feJBiIjy0m1qVeu8hMPhq+DQ/+1KrsUHAHGsTEbhtEsR07Yw?=
 =?us-ascii?Q?ESA/QqL0hiPUkhmLxoAh5SgopeRY0OgrQCf0PpH432SkubyTg9Db3k6GvDMO?=
 =?us-ascii?Q?520IaequCH4EMIftR1Y5PnzRb6/NB+XqtPP/H3Cp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb3865f-52af-44d2-40cf-08ddb4c92def
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:50:31.1628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8MpFSU8u5oFBPf9OrtYvwFZ5DDI9i5YBiXJkBg2H8V6IbZJ5RKQyY5yxg9rrucq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034

On 26 Jun 2025, at 11:39, kernel test robot wrote:

> tree:   https://github.com/davidhildenbrand/linux migration
> head:   2119af6765ea1ce921ab4e6dba8ee4e651e42a59
> commit: d9cf33cabf3b3027973522362e9198273c7abffd [19/29] mm: stop stori=
ng migration_ops in page->mapping
> config: i386-randconfig-141-20250508 (https://download.01.org/0day-ci/a=
rchive/20250626/202506262314.sLjaWWCY-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250626/202506262314.sLjaWWCY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506262314.sLjaWWCY-l=
kp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: mm/migrate.o: in function `page_movable_ops':
>>> mm/migrate.c:74: undefined reference to `zsmalloc_mops'
>
>
> vim +74 mm/migrate.c
>
>     55	=

>     56	static const struct movable_operations *page_movable_ops(struct =
page *page)
>     57	{
>     58		VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
>     59	=

>     60		/*
>     61		 * If we enable page migration for a page of a certain type by =
marking
>     62		 * it as movable, the page type must be sticky until the page g=
ets freed
>     63		 * back to the buddy.
>     64		 */
>     65	#ifdef CONFIG_BALLOON_COMPACTION
>     66		if (PageOffline(page))
>     67			/* Only balloon compaction sets PageOffline pages movable. */
>     68			return &balloon_mops;
>     69	#endif /* CONFIG_BALLOON_COMPACTION */
>     70	#ifdef CONFIG_ZSMALLOC
>     71		if (PageZsmalloc(page))
>     72			return &zsmalloc_mops;
>     73	#endif /* CONFIG_ZSMALLOC */
>   > 74		return NULL;
>     75	}
>     76	=


Apparently, CONFIG_ZSMALLOC does not depend on CONFIG_COMPACTION.

This should fix it:

=46rom 6eeb27030931cf8dc24dac2d7d16f57853a162d6 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 26 Jun 2025 11:48:39 -0400
Subject: [PATCH] zsmalloc_mops is only available with CONFIG_ZSMALLOC &&
 CONFIG_COMPACTION

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index f87a998b696e..f7366bfaeb32 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -67,10 +67,10 @@ static const struct movable_operations *page_movable_=
ops(struct page *page)
 		/* Only balloon compaction sets PageOffline pages movable. */
 		return &balloon_mops;
 #endif /* CONFIG_BALLOON_COMPACTION */
-#ifdef CONFIG_ZSMALLOC
+#if defined(CONFIG_ZSMALLOC) && defined(CONFIG_COMPACTION)
 	if (PageZsmalloc(page))
 		return &zsmalloc_mops;
-#endif /* CONFIG_ZSMALLOC */
+#endif /* CONFIG_ZSMALLOC && CONFIG_COMPACTION */
 	return NULL;
 }

-- =

2.47.2


Best Regards,
Yan, Zi
