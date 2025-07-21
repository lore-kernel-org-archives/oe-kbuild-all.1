Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D17219A6B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 23:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753142051; cv=fail; b=PUmoKgBLUTEhUxWpVOxIQW60o5GbwhIhpM+dTLbRdO2quPiYOz+Qif5ywO6E73gFBSBDiwd87VmtOU93EcQj6Qh6w+3qv7jgWvZJkmXHLD2Wx5cLPzwhJEdyrPicJARginBK8s31FHjl+X9g+g+PIjbidpYKcKe0Z63Z+7kTvpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753142051; c=relaxed/simple;
	bh=6ZMzPCDTfVLkK7ElmrB4BHKJn/8Os5pVjuGdieu47QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A8Ic1WOCDy7wH60hK2vf4cbDRHqGN6E1EHKa/bpoy2AzrHB8rq42yN2IMrhR1KFZBC1fytb7ZRxdPf+98IYD9Q555ivEU8YXFdyJN8JdF1UZQBmkJ5mE5yr6FxkaBDb+j6suIM0RhMTzcN7AUyz2T0Qo75IY8KK34DszQGR6VQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q86T3WqJ; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q86T3WqJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL7QrC0ha1D0A6oQjN0Wo3BNSxwHcAZtYvropbrBayABfTIEhV/9MQMytmkxSK1UORhoMmML0TgyY9cVhPuz0AkM6gpaAcNYWTv1Q0KZHkaDAHpCsoMTLmpFcpoNtUvAvgziaev8t9ynzNyliNM5J7TBjKUzTVVf5UwEgKlc5BVh0ZNf3U2cFSUbrv/IJE0X641WYdT5n+XUpOEy0w5amJGuKjRUokYGCYiTqMbsQLZROIqC3EM9ZSUp9PyvE9q7G++wEX3ff4/bp2tOHI3VF3FNBGW12yCc8pHTZbQaAqjyx5WDpGafTX1OuHRuPYZsSCS8gf2G1PBN301nKE7ZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HfTqBlkkaUTva5bAp60SPF33GtzLj7FTzIBuHXnGng=;
 b=RXR8uD5wwviRYX7D/IRmWpe6Y+hCArBsHj77Lte4N2W90m5IIawSHlRZIrg+1x7iYbl6qSLXz7kLjR1ed8eHGzfvTtU33fw7zLsIX6MQObFsoa17FUrniuWbJ29MHzKshVLsn9rG066oHdbbmW+VdpxlyQtDi2xLWERBSn3XXLQAEm0raNc5De/w39pYcsRVTqxpiDrYENOx8vIuNYkMZFUEutO5fN+sXeSMYg7Qz6lcloX5449XKpm1za+kBUwDZ7pQZyseKguze+J6zzrBoKUOM8nEXjpPVBokO1/m5+na/LRpcYFqTRJ+fSyqGehMdzzEw+DdAhKVKre7mhkOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HfTqBlkkaUTva5bAp60SPF33GtzLj7FTzIBuHXnGng=;
 b=Q86T3WqJeiYQQURwpAvNiCEvXQ+CClzZ88G+T8hLItJxGSFgB0eBIq2912Hi+nCbTFosDXFMMPlkHa7PLvUjUh1wAcPKNvZjfxvm4UZmCsNRZoajqJmmDbTH3DznXvYe7XYmW7+b97kuQjYfSUSLl1gRVSdC97wgxfl538KnAVm2DVyHfm3StNE4An+6uv+BO4riJlVlLmoDPVPcm6YIkHsyC7iGORJsoY1IphCeqS8EwC2uaFhU+od6B+NDkvbmwY7MffuQ20wcJR+Z8YBh2udTmUw0OoO6gWha4yjjtTLc9nhw+Rxw5f0FhIprgknncuPy/BEFPC6qQp7TGgG1eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 23:54:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8922.037; Mon, 21 Jul 2025
 23:54:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: Richard Chang <richardycc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Vlastimil Babka <vbabka@suse.cz>, kernel test robot <lkp@intel.com>,
 David Hildenbrand <david@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [linux-next:master 8632/11398] mm/page_alloc.c:6773:62: sparse:
 sparse: incorrect type in argument 3 (different base types)
Date: Mon, 21 Jul 2025 19:54:02 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <FB67B6A6-8691-4AA3-A418-CD19C881D74B@nvidia.com>
In-Reply-To: <202507220742.P3SaKlI6-lkp@intel.com>
References: <202507220742.P3SaKlI6-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN0PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:408:ed::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 9068edbe-7669-43f9-9f92-08ddc8b1e034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2EpFM5mJuy9nYrIKt6Kmd6cGn7MRAM+kQKfTsunU+fF+Tt1gYgnokKfSz0A?=
 =?us-ascii?Q?LKsdBLX9Hw4vfDY+kX0KeNdaBvFjsnzj+NitBOIQFGWxH3LFiC6dblvNdEUV?=
 =?us-ascii?Q?yy/wHSSQyT5Rc52+gEHPIXaek6lXe645QwAOBAOZRctrSlk4VNlQyZEn2xbl?=
 =?us-ascii?Q?Upsg7g1zh77yDamC/qzadAV6U4jn7dYTvA4kq6zbIq2jEvU1+lkU1EdQa/GA?=
 =?us-ascii?Q?4nK14GmZumx2Ac/r5M6RS9g/ZlTo1Tr4dfoH0ifl43Ng+pRndk2dZLU3/QIb?=
 =?us-ascii?Q?1imF7e5H29zXDVd0bbaY+3AWRe6HqYVOwdGb1na/7u+V3hBJ0F4kIwMU6F1E?=
 =?us-ascii?Q?Qj6vJ/O7zX5HLFyu2n/ypWW8X361HjhPel2FNwScIGXDVZ70Wmlhikolb6DF?=
 =?us-ascii?Q?+cOMlmAOuYpA61k9eX5Xr+nX/iOoiRLbH+p06StPWQszb1NPdaNKI469dlH9?=
 =?us-ascii?Q?3F35X6vrKJCnR/8eMqM+BNthBFZqeuTufbsb5mWsB8eS7j9n1Dn5Ty1IdEua?=
 =?us-ascii?Q?BYUFaz/YrV+Y74fsoULAHCCb9RXlz1YKs2WnV1/YgBt5ktf2fMkqVmQfQijz?=
 =?us-ascii?Q?JgVwjxQNobn7euk2uTsfVYAvYcTVfCsQgiyabvDqwuCF0aAcCmdxvOk30d3u?=
 =?us-ascii?Q?3ThhttI0g50RJQ4rhlB4UxZnbL6pI7enw4vNJGGRiEWSAPHr7sinxLiFrdLr?=
 =?us-ascii?Q?gld8wjh0D3QdrF48oRi7Tq2WgVBPCiFeQyoXQWkX5u/kNTOk8gjzktaJCtom?=
 =?us-ascii?Q?T2PZBqJy0lYL3rqxLjoZcyHzRDg4MMoNlIy5qC9XFZU0LWdNuhozSSynyEy8?=
 =?us-ascii?Q?VafebZW5jjkuNYtbW1eTG9wOzEyObDQSASowLiQItOVts7IgBUBaSr1fQbUZ?=
 =?us-ascii?Q?qZYkkJMdl1kTN8awK8NpG5fjPHcLvC/dhm3RWgsXjSHuBxRYQV6gBNy/k/oN?=
 =?us-ascii?Q?JshgFI2EFicPh+PAaNCRu/K2Zj5ci2U9SuBiVYQz8VRe5cTzY2VjHYdG2Ewx?=
 =?us-ascii?Q?qwmFLl0Q4UwvkM7znwLf+1JjU40nKMhislM5jh0tKuP2QWiR65WTSz4n78xh?=
 =?us-ascii?Q?TO87iEAF9r0nvjqNDByUf39+XOgURGKMHrtW8JFxmhDiNdTWH1+zZ2HwJp3z?=
 =?us-ascii?Q?383JNMSkprkzYAe7CPJG2Yd9KcF3aIvsmJNlz3LhZi2rZREHLHqDFpRrV3W9?=
 =?us-ascii?Q?7KtZkRFCO3CFbjTP8GQnPdggkSh4xiYDtmc181xcI9ECo6MKTc8UdJNiOGGF?=
 =?us-ascii?Q?VJmwn3B9i/lRTD/3vebwi/qxvcIktkvp2dSHILMlSbF3Pfvh7zjJ0kRhMQyd?=
 =?us-ascii?Q?f6poBRpEVjqwf7FdGOLiepotj8kHhu86aKLPzl9y9bYhtxzAiV29Z35gk1TS?=
 =?us-ascii?Q?VlebNYNjIqLVRbx1uuHsmLI1enW70TEmrKC+PkKTBV2Z//oyrtK+T3Mqa4Z+?=
 =?us-ascii?Q?npFGZPb8qBI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7d/qnRinUwj7YYlvLGYDp0Zd140yAQEkhSK8QtW8Hw6uOekXUkZzByECVvkh?=
 =?us-ascii?Q?lLhzpJ/q+dO0yt9S5FafHrtuulTTNQbvjQ9eDRhMPH1fobpwrhymGNp6kDMw?=
 =?us-ascii?Q?0uG3bMMAO507UnsLw8Akb6MSluu0gQXAlINy9XizCvE6EccrJjajTmaEGfh1?=
 =?us-ascii?Q?AIFbUyvntL58OB1oMTg8Ijq6ys8duf/6/xwrBP3rflLYJHRpe8k9NQV7+VMU?=
 =?us-ascii?Q?YfpyCDpXFdC6ZEtGLzXEe1R8OTzEXvUqFiJXtisS2doJ7KA0B8i3u0U4G/uW?=
 =?us-ascii?Q?K36AGqi89k38qBlHHDrKv9l+/+TcgsL+vqosFP9iJDdukIvtH35Ipx3VnG/i?=
 =?us-ascii?Q?UFTj6njb9bIx4nuvjkdi+5ReBAz+zeHfTbPCND/U3mhKK2SckRndlyfVjezq?=
 =?us-ascii?Q?LtxObRitQ9ZmZdEUnbpkUbw45aNENlu7pNjAn6Nl2TjcXe33dZafynySwp7P?=
 =?us-ascii?Q?uhRdPN1EAn2qBx7CNGpUUXKQ0XP10cT9MRGjzqcJPf9MAkpBeE9GLF1paoc5?=
 =?us-ascii?Q?XC1CTUV6Mjxu/47s7rG6rt3M47RPWwgu2qaDyYTxlEL+yAjO+hj8NejPAaif?=
 =?us-ascii?Q?OSVKLC7w9Pqr5L3ybi3HHGwB6uBnK4fP6D80ShOa3DAfTcbdCCRRWBK1aZHT?=
 =?us-ascii?Q?h2GbM9wTbdU3rqWf5arxxBVE12E8jr9AvUcKxhcWlQGFPmAFO52zbMi43Aw0?=
 =?us-ascii?Q?wOCCeVFNY57u2/Q4YNtuJjvytNWn5EjTLQAZDleYPpHStki+HtWKi1x0rM6O?=
 =?us-ascii?Q?5vfaww4DE9nZENiO3k7a3dECYwpjH5XKUAZYd1kPdaF3xEU5/GhpbQn+WzaS?=
 =?us-ascii?Q?l1FJXqbjQL02mDM15SD194CnZSITAN+MYtdhUFuTkNCwqntTncW0yNmFVGz/?=
 =?us-ascii?Q?3R3nPu489Dhs7nfndQUBnpXH47g84oMpp0HMkFHjeD3K5CzK0z9iWP8S+z3W?=
 =?us-ascii?Q?sMIJFM+tuuimiLhIKVkwyg3ZQ6Gk4UuRW0qK35bNY1PTht/KfxicP90bar62?=
 =?us-ascii?Q?zQe1SDR10Qk2cfVPqb9TNXf85yuEBMWS8+qFy2Ontx0CqhP/sEib1WXe43dG?=
 =?us-ascii?Q?Igi7HQ3R8nMTsWpxxNSDid7giZFz44cuCnN1p7PLyvRguT3XTd9rhQSg1P77?=
 =?us-ascii?Q?6ErOaYc1TkT4vMA1B+FdL8aI1ZBNyRIjl3X+ZSGVsZv+Bp2Dil95BoGyMJdt?=
 =?us-ascii?Q?adamRCOcYKrJM3xNjZiO8O0QUix6Ycskdl0pu5WgRYST+IFdy5zv2eJearce?=
 =?us-ascii?Q?Jk96PMsAYEQEHIup/yIRfSqnVm/lCAYBmCwPK+nhgvspKwOB6vqO3mWmcHY3?=
 =?us-ascii?Q?YuV5hhPdzvpzq+DIZDpSO1qkr+WZ2KbLCgHoR1rEUS2EB9T5yeN/RbaXJrXj?=
 =?us-ascii?Q?7Yy3xWgWAVLjjs96RSr2dQ7VdJ78nLq5Dajuv9vk5432HmAubNg3OJPGnlqW?=
 =?us-ascii?Q?ByIeT5C3BN0BPbVZAzsOL9GkJnuji0F2/Gs64tDfGg4BzloroYPRBpL+6fqR?=
 =?us-ascii?Q?/TmmWfKbzqEonEbsGJtasWui8Do19ebHXNLunZ7qU9vW4LqtQEmItdabXB9M?=
 =?us-ascii?Q?0pJhs07hXn30BUZGdoylrGbRGoJDvVGrRS6XVska?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9068edbe-7669-43f9-9f92-08ddc8b1e034
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 23:54:05.4240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCp7MfS2FY4EZoumtOWkuhgGBzNj4ten81UW9Gh3H8PARwesqjF1kvl7L7YudnQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945

On 21 Jul 2025, at 19:35, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit master
> head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
> commit: d1554fb6302093d353c8bf4601f9bf994b836904 [8632/11398] mm/page_i=
solation: remove migratetype parameter from more functions
> config: arm64-randconfig-r132-20250721 (https://download.01.org/0day-ci=
/archive/20250722/202507220742.P3SaKlI6-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce: (https://download.01.org/0day-ci/archive/20250722/2025072207=
42.P3SaKlI6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507220742.P3SaKlI6-l=
kp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> mm/page_alloc.c:6773:62: sparse: sparse: incorrect type in argument 3=
 (different base types) @@     expected unsigned long nr_migrated @@     =
got restricted acr_flags_t [usertype] alloc_flags @@
>    mm/page_alloc.c:6773:62: sparse:     expected unsigned long nr_migra=
ted
>    mm/page_alloc.c:6773:62: sparse:     got restricted acr_flags_t [use=
rtype] alloc_flags
>>> mm/page_alloc.c:6776:50: sparse: sparse: incorrect type in argument 6=
 (different base types) @@     expected restricted acr_flags_t [usertype]=
 alloc_flags @@     got unsigned long [assigned] total_mapped @@
>    mm/page_alloc.c:6776:50: sparse:     expected restricted acr_flags_t=
 [usertype] alloc_flags
>    mm/page_alloc.c:6776:50: sparse:     got unsigned long [assigned] to=
tal_mapped
>    mm/page_alloc.c:1526:13: sparse: sparse: context imbalance in 'free_=
one_page' - different lock contexts for basic block
>    mm/page_alloc.c:2520:12: sparse: sparse: context imbalance in 'rmque=
ue_bulk' - different lock contexts for basic block
>    mm/page_alloc.c:2878:13: sparse: sparse: context imbalance in '__fre=
e_frozen_pages' - different lock contexts for basic block
>    mm/page_alloc.c:2981:33: sparse: sparse: context imbalance in 'free_=
unref_folios' - unexpected unlock
>    mm/page_alloc.c:3271:20: sparse: sparse: context imbalance in 'rmque=
ue_pcplist' - different lock contexts for basic block
>    mm/page_alloc.c:3143:13: sparse: sparse: context imbalance in 'get_p=
age_from_freelist' - different lock contexts for basic block
>    mm/page_alloc.c:5099:9: sparse: sparse: context imbalance in 'alloc_=
pages_bulk_noprof' - different lock contexts for basic block
>
> vim +6773 mm/page_alloc.c

<snip>

>   6772	=

>> 6773		trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags=
,
>   6774							 total_migrated,
>   6775							 total_reclaimed,
>> 6776							 total_mapped);
>   6777		return (ret < 0) ? ret : 0;
>   6778	}
>   6779	=


It seems that the original patch only moved migratetype from third parame=
ter
to the last one[1], so the trace event has been useless since it was
added. My patch was just a mechanic change.

No one seems to notice the issue so far, maybe the trace event can be rem=
oved.

(Add other page allocator maintainer + David)

Hi Richard,

Let me know if this trace event is still useful to you. Otherwise, I am g=
oing
to send a patch to remove it.

Thanks.

[1] https://lore.kernel.org/all/20240228051127.2859472-1-richardycc@googl=
e.com/T/#u

Best Regards,
Yan, Zi
