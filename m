Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D91F0E32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746882490; cv=fail; b=Sznda03lHFUEMSdm1QK5ePbiCaJxzupRcwo1OkJqaW+RZVxIxNyooEw32mwoL4kJU6hzD/ir5qFC3qfTzB/Z6tPdpJ5LZRq6Y1QXBWjl5jl/YuU6ILyOSe0uxtm1qQ3uvcsLNXdJZ0DitjGusrbSFkBXyvBwNga2GWZQ389/gD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746882490; c=relaxed/simple;
	bh=GwADlEznXPPHZ2iuLqtPDR1x2azK60fvQq9FICGZV4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IbM1EkDpw6/SrCIHalthQ4XGs2iw+SlnxvHQfMor6M0oG4MebhZ4aF2JIXlPBmXrSA9/fqtbFcFeo7aImTyfk1siyHVFZYcUPF+j/KznMa2IhLPNtACwbApS3lnDNet90iT4TO9QjFAtv2c7gp+9Pid+PMUdOjiuKYbf8Pg8tEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ojLOhErW; arc=fail smtp.client-ip=40.107.93.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ojLOhErW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCn+NIqQLfSgoGNyI4c1MBxI1jVgZFSSPs4Q1of9TsdbV8p+NM1n3uZxVjaIjua7x5g/dTFDcAKs1eyLzJdUT7o4P6yqsDy8QaQ9IhJ8sEBL5BlOu6GBo84Vi3rhHEjZf7+YMo+CAM7gNkbmqGOiNsg5t/sPsLqKfoYmE1UdGxc0kJrv/MXji+cEx5Vd1BhTCu96nJoHRgRAyUfsLJLZDlzBjhv0hAsvqWul/BEdKUQM+COZ2jKXSzn3YiFZckGcqODchgqkVx8dsCkXpvLi8PGLkx8FILe6SsRnKx5vpqwO31MhGRUsjc+9qihidN1FenRNCwg+qts+G3mYdI+qNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGNeJlAFQQDvGkgk/28eVp4XFXDOQTUBvkIINV9ASCU=;
 b=c7q4uboZ7VNtAwS73U0Zcrp2crcWP9DxF4XXyL/LO4yBtLSNIN2Yfwoe0Vd8HrlCY7PwAZBgllQp1rFWwTFUCiQF77vTYSq0TY+PajwaGQ9dY7QAaRIo4VsCX1c52TwhAwDradRiIeB6y/DERWNu/UYA7NyGDRvqCr20uYVOhRcqBEnR2xgLeJEAXb0xZMZuNjfg1tTVCMYJuGIpplNBqoWPVFOOVttnV3oSKB3GQ0VJVhcQCmc7Unzf2x7El9s3/zyWRG2V3u5cR4exmfAbvmCng6E0JtF1F60M3XJxnKq+gpoHkMtO11dqfy/1J8+R/ZgP36qEXon0mvAs681QZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGNeJlAFQQDvGkgk/28eVp4XFXDOQTUBvkIINV9ASCU=;
 b=ojLOhErW2dg4GaXJ7GyIz2zyX8KSUOXdinkfjpuOXe6BNpny70HojIDVSrOan87FJidJFlGuPrHKzM2gbUgsZesvjUmvEThpAySxkOjvFnIwCyEsqLowgfzsodeGFEgaHBrhvDJfUZotCDWL17vbUwpyFhAC8xXgNqtixOMuX6MUYNlx77UyLBq6TAf4ERODzwILzxj3vXfo5Yor3rEFH1UvR2f3xRK8ViDlebXvGxLJB+DvVD++91UqvXtkRj5dXRGGT8TekLqbi42bjTQse2KtxOaKVIL0pL/2zTUb2njPUQA8tQlUX4MAn6nELDdICSP4rPHaR4uFEXvihIZDfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.27; Sat, 10 May 2025 13:08:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Sat, 10 May 2025
 13:08:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Sat, 10 May 2025 09:08:02 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <E8B1A041-C572-4606-A983-270A4EFA2BF0@nvidia.com>
In-Reply-To: <202505102037.qTxGl3jk-lkp@intel.com>
References: <20250509200111.3372279-5-ziy@nvidia.com>
 <202505102037.qTxGl3jk-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:207:3c::46) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: b01ef4a1-e98d-4702-d95c-08dd8fc3b346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BqKKxI2ZqWZZ402166r9LRCMK6lOX9UIxWMoiqplqErFGIfOtzk0cg6XMze2?=
 =?us-ascii?Q?32Z0CLOdtL6KisQxKj9H1r/1rl1eVeI5IyOjQScYSN1C0LLCA5WLDffeZkPb?=
 =?us-ascii?Q?ThkzTQ3x+86cXe5+z0x3ffaN+Ge7367SXyVvoFkAHj89U/fAC4uxbnqJXDpJ?=
 =?us-ascii?Q?ZAsFM0Mm/HHmZqqsTmJu0w1h4YMi7QO46oqIdgoj6SJWkhDC0QDuQ5ethFNV?=
 =?us-ascii?Q?fTcvBxAEjuX4/uQSRwZNjuUZS7+1EQP75kPMyDBpjiV7w+6zmJEGowFnrGnZ?=
 =?us-ascii?Q?QejzqsvqENYx2fLzDv3r+JEqXc+odzqN4meqo8jo+zmGoUNvTyAPTkWxdJAX?=
 =?us-ascii?Q?Z6Qwozzyqo2hY9A9W4yfxhufxoD2YqhjoOw//atF46+TSh8V1PpZSY0eP6io?=
 =?us-ascii?Q?uTW2hKRnEdsN99cXq9ZTxs7buLbXcR8kzXQAIReyLZNOArwR6SxN0YoV31c1?=
 =?us-ascii?Q?PMYInQK1KaR/jqGpoO8jZ2oxMyyVKDsN49WWFzIgErNqrkkstPMpQ0M3TZib?=
 =?us-ascii?Q?wX4zKqteCa9U2Eh5ttzBJmVaoSgG6uOb4zVpNl7vBaCjPZrDIzXrU9/1Z6NG?=
 =?us-ascii?Q?g+u5JTvJdXUmy+DH6GKOUWXNJTveZ0/MjXe5KjURyF7wW9pLc3Oj0tnAMRJ3?=
 =?us-ascii?Q?5/ESMiZGTZbSZwaq4OVNqFpPSUzd54YJH16dO01tSKPODuytDVO4pWAxsMzB?=
 =?us-ascii?Q?sKczvr5heFYtPh++3oymFmybvtslgAll4747LNa08GrjU0FuvN5bzDpFIKSg?=
 =?us-ascii?Q?/P1uvWAHY2YRBXOS0qktynraXmZVYhsMIGPvjPMvRQOkbKN9jx/P4EI1QQJe?=
 =?us-ascii?Q?SghsMP1A8tYP+3oP+7Gx783Wowt/3jx2xx3cMtdrAh3AqfZ390ONeWSJkO/9?=
 =?us-ascii?Q?7qjjkPziMamAfyDV0zHb5wDWIcs0jHRfKdobvFZUsz8xdwaKlrGzryfL14yU?=
 =?us-ascii?Q?9I3UfNdedTRC4sV4FZEs8h3SHIksPa7pZTAgrIADnIA7chykG7JjyG1MBoaD?=
 =?us-ascii?Q?ftLujE6Fegs1pii587BMpDWLWFdANFul3ocQPAVXNY8LXGkfMiQ8+/KSeYkQ?=
 =?us-ascii?Q?pSpLA8k72g0Lv1AnAIARJQkakMjLDfqskEEvaQaCxTnGiXR2J7g6qzefGwSZ?=
 =?us-ascii?Q?guijq4EGJiN3Qtc5fq4VkziLPpgXuzg/2838xnosmJPktfYfPICaa0L+xADN?=
 =?us-ascii?Q?Tt9cSD/AYRBQciiTPr+dKTZIv6CH2tIrjnDcuIwtQ5oOeEBkXffdpPdOYxux?=
 =?us-ascii?Q?vCMDfQe0RpiV/HwN/Vkiy4psIWDWTzjMbuvU9WxrsEkZh46lVcYeugedAB2v?=
 =?us-ascii?Q?vKkZFvfHxwHL2X5AR2vcVAwMsKhYbELNLvqH8VhrveGOOKND0mNxVBBee2Hv?=
 =?us-ascii?Q?DR6uRZlA0fDkII10SW0L+KYuuMMf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mwahoNaPWLwLic+T5yzxE7b6yIut5x/YDJ2VlAybfUKM0v+TqvyCeMOmCIeP?=
 =?us-ascii?Q?kdNOc1/4NIn9N25Sw2vHC8SYJiseNYX9YrEGiMgfbXDZ+ccvc5JsBBqS565D?=
 =?us-ascii?Q?g7FV7qC5WB2mf9L+rA7ekIYANXHRbz5KJHUKwluqAHdNoKGcoXmERQr3fG+9?=
 =?us-ascii?Q?JloaLsk76ugOIh9tdXYvrYk4pLibQgWD1nI38jl3ePQcNnS0IG5m6Jkjhi2H?=
 =?us-ascii?Q?n0gDg53VbdhSbwNpvlwfIu6LZRkTsCXEtBQRFl3JKvlLC4p3mOJf2ei1eSUV?=
 =?us-ascii?Q?bLwO5Y3UCmeEweWYgFcmktXtzo/vS447iWXpeDfvEHCzsTTPTVViZVFQqvwv?=
 =?us-ascii?Q?sC0BtR7Kw4Q/+QsfbWONjQUEDQy/m4okQYCjPWTw+dB/naMscFR8RFTOFBHF?=
 =?us-ascii?Q?J6f2RX/Dj3gky++gMnPE1QuQNJ0h7mPykdd11uuMD3YgjkxjFiscHfIQi/Mb?=
 =?us-ascii?Q?n/FmQJrZGpwwmyncgwTOTd4Hmz8/20lcRzczsFGt8mwXeGVqgIAXNT6golHp?=
 =?us-ascii?Q?UV53XYNLHSCm309GABxT0zyUR0fSS07Xvzpq2Xu9maURHlAxKqZKBhzVTrAA?=
 =?us-ascii?Q?zafcGtmT191XCVqX06bS80woT3OQMK9jYCnrzR9++Dv0DJlR/45sQCsqzig2?=
 =?us-ascii?Q?Rvsm1TA9yK1gxHi6Y4CexJS7rW4zz4qzIF8jWYCETQANJkPrYm73Arc+Uu4f?=
 =?us-ascii?Q?Gsw2D7n2MwmUZaUNYrKPStk/jf5LZWSqciE/NzGHvNHe6N6SyR9TLeah74jj?=
 =?us-ascii?Q?6ZQQCp+1mTX0U445LrJc4lp8dcqR7m0rZqlllexDhnlPDesb1iF2m6kxfaUZ?=
 =?us-ascii?Q?Q7LkFouKAvxrP9I/PxfBECsj8zK/RZOXzuSnYWyJ/7z2K7mkazW8z+ovwvKC?=
 =?us-ascii?Q?1lDRsg6AnGEsQnfWr0r3P2jdFJXik6tB/lKeTMyivaEuQzRDKPSRbtto215p?=
 =?us-ascii?Q?+w/Drpgqyk87x1B5GLOYWaIXvzLtdKeVqvt08BbhM1ZcQwtkreXUwsOXxb4d?=
 =?us-ascii?Q?C4/fH6CMxssmOgycqAQhXi5sf6ZLJSIqc/FPlUskNBrFMzJLqvQLZcOplx/W?=
 =?us-ascii?Q?WWJZeBcNh4dogozySNYJeDqjKTD+/cIKXDGG7kTieEa+LfIiiIug4KeJeGQz?=
 =?us-ascii?Q?dMDN8F08qJR6278TqVz/i6HRSHgDtP+FY9Mxjq+DyQoAQbWoeomh9o6aVLdN?=
 =?us-ascii?Q?XH9TfoyT+XRQ/O2VS1wRpso6T9KojYEgePZ0v7cyLKwNAzYMoDbw3ea0iXrX?=
 =?us-ascii?Q?XP/zO//AYA3mXQP0+wp8we9TXHBupV3h3L3zSxsU0Sdii9oulLZhkRWbFmjX?=
 =?us-ascii?Q?DEgK9mKBsauWP6YkgclZRs4xuzL/a4CvzWiDMS9QIqjqtdw7RQ/idzMDjoaA?=
 =?us-ascii?Q?G38Lzav45vpKx0in00eC9UqbnGiuewPqpz+UjGVnyL56SFupStJxaR9md3ln?=
 =?us-ascii?Q?6wTWkp2sUeKmKkACyPQB7W27sQe78eow72IhQZQs5mUA/w5WwaE6Tv/K7j0F?=
 =?us-ascii?Q?I61/eJiBbOdbkx64BBqf3r7Um4g/tgB3Z5voTtykvINmmrJXQQ4Vno8Jf0UX?=
 =?us-ascii?Q?N4O+adSt6z7Wn3PKyeItajcTy6v73DW0WgaSxFQP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01ef4a1-e98d-4702-d95c-08dd8fc3b346
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2025 13:08:04.6629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXP5JH4FtduZXu9U9wl1NBCJdexjfJfAJByOVOPq7JpAvpov8s57osg0HtiBPYyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090

On 10 May 2025, at 8:45, kernel test robot wrote:

> Hi Zi,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on next-20250509]
> [cannot apply to akpm-mm/mm-everything trace/for-next linus/master v6.1=
5-rc5 v6.15-rc4 v6.15-rc3 v6.15-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.=

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-page_i=
solation-make-page-isolation-a-standalone-bit/20250510-040418
> base:   next-20250509
> patch link:    https://lore.kernel.org/r/20250509200111.3372279-5-ziy%4=
0nvidia.com
> patch subject: [PATCH v4 4/4] mm/page_isolation: remove migratetype par=
ameter from more functions.
> config: x86_64-randconfig-122-20250510 (https://download.01.org/0day-ci=
/archive/20250510/202505102037.qTxGl3jk-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250510/202505102037.qTxGl3jk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505102037.qTxGl3jk-l=
kp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    mm/page_alloc.c:6656:62: sparse: sparse: incorrect type in argument =
3 (different base types) @@     expected unsigned long nr_migrated @@    =
 got restricted acr_flags_t [usertype] alloc_flags @@
>    mm/page_alloc.c:6656:62: sparse:     expected unsigned long nr_migra=
ted
>    mm/page_alloc.c:6656:62: sparse:     got restricted acr_flags_t [use=
rtype] alloc_flags
>    mm/page_alloc.c:6659:50: sparse: sparse: incorrect type in argument =
6 (different base types) @@     expected restricted acr_flags_t [usertype=
] alloc_flags @@     got unsigned long [assigned] total_mapped @@
>    mm/page_alloc.c:6659:50: sparse:     expected restricted acr_flags_t=
 [usertype] alloc_flags
>    mm/page_alloc.c:6659:50: sparse:     got unsigned long [assigned] to=
tal_mapped
>>> mm/page_alloc.c:6760:55: sparse: sparse: incorrect type in initialize=
r (different base types) @@     expected restricted isolate_mode_t [usert=
ype] mode @@     got int @@

<snip>

>> 6760		isolate_mode_t mode =3D (alloc_flags & ACR_CMA) ? CMA_ALLOCATION=
 :
>   6761								ISOLATE_MODE_NONE;

mode is getting either CMA_ALLOCATION or ISOLATE_MODE_NONE. Both are isol=
ate_mode_t
enums. Is sparse giving a false positive here since it does not read ISOL=
ATE_MODE_NONE
in the newline below 6760?



--
Best Regards,
Yan, Zi
