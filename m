Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050813EFF3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741541889; cv=fail; b=spdvwmIFQoSdL6yfnpq/mHL0fbrJgzl/GZum7djxsf6MUG/oIVWv1HNBpKJAqfneiiWmp6KZ5EQhzC0kxbuKGuxdtOCtfY2fQUuhu6RqPu2lZOI5qdz53bjyjCwq4IpglnwHalr3kKSTlZIbXsxpztIsJmVq8PmPrcEsqoThrA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741541889; c=relaxed/simple;
	bh=rNtpWG9dh5WuxA0a5wa3w/ZkJiiU7r7sXw078h/egpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XxLM/kEwO1eQR1+YgCHHAKvB/xS/s8XlmLWgimgdDNriytDcwyzzGdhK78TON3InEMmYCY00IsOe5Ri/egjznhnh332SX+ZIvUDYqAnPEU779Fu302FmgCLr3YoojpAdSdyDxjmhDx3GE9OGY9S8Kw7Y6y904kGNWysMf9p8cWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jd/U0NZ1; arc=fail smtp.client-ip=40.107.102.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jd/U0NZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxTvn0tJVvl+jNjYnOQFjwg2brGLMpknxA+0rEuQZ/qTvB8FKcllE2Gec5ziazjuKStYPDi4V4obx77fghB5ynOjRMA4LplagfPtOTqfDnK+4mJEwC1Ra5h8kBMuLDKs4ii6MHj7Wh+oixN1illriU9qnOHpivj0xvWaqSYtJ+yikCJATHMntgfC1Bvf+DDt5CV6ocWSo2zTldMUgOy75TjcdtQMaOY40ShwYArcLDz0u4C5ab9YO/zZF6YYO0HqS3BBTltZ4GPotAuG0KBlcajpfXkjRGmbF++RrdLZrKe7guBLpLkbOgquWNn0e5WPy7VuWex8vO5Xg8MBDfawsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzZH3xpVtXc8CzXp7iDj0yGrs182nf2Euq+R5eeebsk=;
 b=KZColD8ZFPi+bVlzl2FQ1lmLLo/H6OHEBsAakNahWuqUVUSulaZHvtNNpH7Jqq6lnyWrvmO+3xRMXG5s2gN92c6gwc/y89z49QdPh3R+tD+fgsIhEauUbfVdSTmEe3nDty9YV5iEytoO4LLGUlhyqLXlObLHsQyCPTPy/WHk9KCKErBeaBxxm4lRtlPzl7laR5wIAVUfU7xeqlC9VHG99RXr52MYvsdn9IN2LdmjIyH3YzzJBxOje1htxN4Wi6xo1T4chZ46HX3qnJsu7R9uUeuqHLn7YnJj1ADk7zoRi6FDOx9cr1efDf5wQzGbvBaVa1PsxlA9cVHZljIBSDrJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzZH3xpVtXc8CzXp7iDj0yGrs182nf2Euq+R5eeebsk=;
 b=Jd/U0NZ1rZDKUu1AHd97M4PpJt3EEm9gZTGqeY3enMsj9x8UdvGrd2YToK0qGD7FPZJpjQhhhHaLb09XvIYoMK/DQC/5civ61uSn81bYfS4tsZr0IjoiLHhi31H6fXAn0k2jE5C81+Nam5GhhTycpO5M04ssHIGhS2CRGjg4vfdQYFz6nlEJDem3PDw1QEoTi0jouqHGBwpiiEoggtskQXw7JPjfbXzPPCX7KxgbTkMKqw8uQz+D4KIUEZIBB9CqzG5OGpuKdTdp8YJzp4Q/CeW6uBde98muIJZEWVm0VfuDW68C0/oWN5iFP9FFP7ytAiSc0LRPdd3T2Zy4U2GcyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Sun, 9 Mar 2025 17:38:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 17:38:03 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-unstable 481/507] lib/xarray.c:1251:14: error:
 redefinition of 'xas_try_split_min_order'
Date: Sun, 09 Mar 2025 13:38:02 -0400
X-Mailer: MailMate (2.0r6222)
Message-ID: <64585513-5122-442B-9ED7-B5CFB41DA023@nvidia.com>
In-Reply-To: <0D80D44D-E4E9-42F6-96A7-92BC8A00583C@nvidia.com>
References: <202503091121.RktXlKnp-lkp@intel.com>
 <07CB0079-5D7C-4438-A9EE-03A72904CD12@nvidia.com>
 <20250308201223.3462273207d0086da22e2044@linux-foundation.org>
 <0D80D44D-E4E9-42F6-96A7-92BC8A00583C@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0270.namprd03.prod.outlook.com
 (2603:10b6:408:ff::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf7b0c8-6577-4342-65de-08dd5f312503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?52HzJmHJCpHUrLCJTCMDQPyoUqNE2mqQQZZapybR9ur3CyG8scdAF7qdThF6?=
 =?us-ascii?Q?voufi+R/X97Ru3v32l1q+eh6BB1zMD2mUU117PiiSmECXU+sw+h39T7puRPH?=
 =?us-ascii?Q?D8LCQzQx6nuD8IlpQsllGVyglt0D1l/+1ROKo7vqpET6wgt8O11akjJSsr0A?=
 =?us-ascii?Q?m9dn7m1cfhzhWxwx9TanyLD2LhUZRwood+BV/3k3pzBAZFaFZJGvfU49t2Q4?=
 =?us-ascii?Q?lyLKoLKsS235bZj3CsqD7ItuzFR477uMmxvuBFXrKmZRs/YoBjKH7faDqTxp?=
 =?us-ascii?Q?kH+kRUsBXy5o6CtNHCASgZvu8TDZcgOeNuOw4KqPgUxePCvBvPTd2RKLPwyC?=
 =?us-ascii?Q?MEvqb0K2jpUyPP7Kuz7Mk+3SAFGDRTtjltAfYz2fWp2rbhFBHDnHlAKxP1C0?=
 =?us-ascii?Q?+3uC3L+Uw4KQ/jPCl6b4DlrVfEs5CScuWhww+hJ38Vp6ZWdujZYXK9abFQj7?=
 =?us-ascii?Q?6T0l6or84wRL+KqfzAa+Tfruw7FUnc1u1Qjk+o4XnIdT4k+PxF0iPmxxejX2?=
 =?us-ascii?Q?ZRIMNbiPkvho6H/yywQAcg+FcMv9ebwLwHKQXlillVPEEMEcVK8TLFVKofa4?=
 =?us-ascii?Q?u0AxAHsn5ic/n3gNfr83fhI/uki8LHWUTjkkvAMOr4rF+3BalAYht+R77+dX?=
 =?us-ascii?Q?39cDyXZRJ+FEcIXjPkLj/+RuUzGP3p3smoRMh+Wx0+wwVacJ+lZnFcOp4Lar?=
 =?us-ascii?Q?7k2aIkqXrRM6doI+RQYtDGZTAT8mqM1stBcnKZm2SA7MRs/xdcZQcYKjMXrS?=
 =?us-ascii?Q?p+9dUsVekOSW/OIWXekxATxD4yJSvn/XEzXe/hghHU3wRtVrCHbKLy3VNPs+?=
 =?us-ascii?Q?oZSRKvHLipOQgS840WeNOfDVcv09wE0ZtwmpJMbru1axMzmgMRnGzuxmNYsu?=
 =?us-ascii?Q?tc7PK3K98eG+HYNAMkMPg8QSkTYPbUzgYJ/2/bqnFys/egQSyn1eyxp7SD5p?=
 =?us-ascii?Q?isO5R0N+tFeo668G6bOht3ba912idaxZUpmSFWBRSwWwNrnxX3qmA7IOZjmC?=
 =?us-ascii?Q?wnH/E1+7u6Kmg8Gr2RCbnNoXJEiQrNS8JSqp8ld4mxnG4gcF+tNxmWF5NJ/n?=
 =?us-ascii?Q?ajSzD2H/JiMiXONsUnMlAi867xK8SLuUu1VvDryMYCESRCWj/NQUaUOl09b3?=
 =?us-ascii?Q?6ISuywyseVCry51kQo6E782IkLmmIVcll7RUPGS7yPpPC2p5zoMTZdGRXZEg?=
 =?us-ascii?Q?3LZ6HeMtJBBTcCHaOwE8sb++sZeUU7NAhWOpDO2z4qxuMmIrA7G0/Q4LkeBg?=
 =?us-ascii?Q?85fVmxrHsBpvA4RCOd4gcHKw7Go7vVsTGXHKPHM/Xk9JfhyS3GeVMsmkOQ7U?=
 =?us-ascii?Q?lZqLV/ZMuFED+CEzU12+R6WoO8iNOpILeFzwYuy+/Qnio4YQrc4vKJrxLDd9?=
 =?us-ascii?Q?JPHm0cSmamfed0/CwZb4CV/RTgko?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Zy7zw1LZ/D72Dz0nxvjFHUB4Nf4mjglZanbcg3lCthhng1Fc++b5w8ibbMh?=
 =?us-ascii?Q?WR5Ktsq9T4taAHsADOiqvmOLTTfPfNWjpj//OybHRt91vh+ZDtLGjutRg8S5?=
 =?us-ascii?Q?t/3z7qc3tJi6+n/hlVGa03scWVib/IW5iNeOtrC0ssFMkjNDAoWEkZBsMKdU?=
 =?us-ascii?Q?TAuZS3ic/h17467T4bwA7nC0Py+CR8z4uxbVafezUmVXnGa2DTw1kBi5cywF?=
 =?us-ascii?Q?YHzS5KiSYYUnGn1cN5SjpIB7H9OjQygMv6oU6Ne7Pe1BtYCoZF1IivrwVhBH?=
 =?us-ascii?Q?tJDApK+YCjSFTwp3hTaqMuFmmw20ZIerHpO5CrdfrNNNd8L7noThezNRdOnU?=
 =?us-ascii?Q?H1xpndb+e6simhCPDqswwx4x+LmLXsA2qN92BuXnV1G5GswVc6TJCyU5E6z5?=
 =?us-ascii?Q?0AqhcHyzwNgLOhjwpEz6nZ27BRuTqy6T0rDXkcjFn10gDSV9ClZaLcWSXDt3?=
 =?us-ascii?Q?E0Y4y/eQRMBxP3bwfp0ywUE6jIpCMcSGkGO8Sg6FRaUfNgkuQG2GsVCMJ8y6?=
 =?us-ascii?Q?+8N2iYtfqaXeTMn2oKUeyddM3T0U5c97c86mQPGhcz821a0W6Qk4XI29eP6n?=
 =?us-ascii?Q?XQUceCGmVU1y6ZmtUpasYSMP10CRtryGbgmbzdoYeVDaKDJ8Nc6B8O6IuDE7?=
 =?us-ascii?Q?NcLhnTWiHsawPqM6+FZjWj13y9BkbKOkFmCEuT5gB2s5Aghcm3kvluDO1SyV?=
 =?us-ascii?Q?izcS+/awY3IpyQuJMzhLfvskcvOCgQREVmJAhCeIdkCfuupSI1wZFl2lR4EJ?=
 =?us-ascii?Q?20f9lg1K7RGGL21rIti9Aushtopk0WK+94ACn59CpFbj8iEhj58Jd/ZJEmaE?=
 =?us-ascii?Q?WTpiwjGY4nIBDy8RdZ6TRPv7yD621jj1Tq3Y3AFHcr8aTqrKXdohyYvO0RzF?=
 =?us-ascii?Q?t/qvSvMWxM6a4Skmuzw4TCY0rcEYgvzk7Dk41p8Q1qggUAMNmnUf9WhKzihz?=
 =?us-ascii?Q?Zpi6EZDNMsXpwxNVmneW4LRh2Ig5tI4a37q9YNlhvk0/5TxorhSry8lRiIxl?=
 =?us-ascii?Q?6BLwqVh3lXVuf62GgyqZj8SB/HlLaaTdXX3l8d+HPBFIxLjnYPIWrqtII0OS?=
 =?us-ascii?Q?w2MWPXfRzL6OwIfv4kUTefjRdGq1PjdQB4uhJm3I3cShfEEkzMErg5NysW/G?=
 =?us-ascii?Q?kvRM7ny+4prBTVu2xarMtUbfKbgyjiQ53U8S+C25HVDUzd92RHowa9YB6eR8?=
 =?us-ascii?Q?dmi/xqnL4f8Zl1VKmPmxOA6DJH322GNI5Y87LWh46SHxiJpWN4bnKNoMhqQ8?=
 =?us-ascii?Q?/RaEvJe5M132/ITmt55ozB53MhBjza2rc6Nxga8mUMgGe+mJ84tq4uq9IEC4?=
 =?us-ascii?Q?WR6mUeGev3JI/DBzsQpQFQNQ7Ed51EEZ084aqTxCi1naC9lChlZ68TrQ81V4?=
 =?us-ascii?Q?LM9tF31gAQnY3qmSjnxUid0D7g3jjYHPAKEqwnpRzNMdDPcE99Njy7rlV+r3?=
 =?us-ascii?Q?1CcAO+oeLHohnXEtsaE4sbpIZepDj3zOpFCXXRCOKhOKJ7jqKVht05yx6llT?=
 =?us-ascii?Q?5Xoc5c7935l36k++7/eWdtY0rsYAoRcxtvX3Ju3OdVmeW7UHi+4U5YXUxbOb?=
 =?us-ascii?Q?AQ/Wjxh1K3te1bnZFuM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf7b0c8-6577-4342-65de-08dd5f312503
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 17:38:03.7011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6w9Q4uTpUtLU3DeyBW+iN5q06yXQnD+w0vJAOV3AQSTx65kxJjDOPKyAXFayOlpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838

On 9 Mar 2025, at 13:20, Zi Yan wrote:

> On 8 Mar 2025, at 23:12, Andrew Morton wrote:
>
>> On Sat, 08 Mar 2025 23:00:31 -0500 Zi Yan <ziy@nvidia.com> wrote:
>>
>>> On 8 Mar 2025, at 22:52, kernel test robot wrote:
>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git =
mm-unstable
>>>> head:   2f0c87542d97822659e81f55ae5e5cc1994f3339
>>>> commit: 835714732ae42a4b4f590316b06d06826bff2483 [481/507] mm/filema=
p: use xas_try_split() in __filemap_add_folio()
>>>> config: i386-buildonly-randconfig-003-20250309 (https://download.01.=
org/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/config)
>>>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20250309/202503091121.RktXlKnp-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503091121.RktXlKn=
p-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>>> lib/xarray.c:1251:14: error: redefinition of 'xas_try_split_min_or=
der'
>>>>     1251 | unsigned int xas_try_split_min_order(unsigned int order)
>>>>          |              ^~~~~~~~~~~~~~~~~~~~~~~
>>>>    In file included from lib/xarray.c:13:
>>>>    include/linux/xarray.h:1587:28: note: previous definition of 'xas=
_try_split_min_order' with type 'unsigned int(unsigned int)'
>>>>     1587 | static inline unsigned int xas_try_split_min_order(unsign=
ed int order)
>>>>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>
>>> It seems that something went wrong when the patch is applied.
>>> xas_try_split_min_order() is not included in the CONFIG_XARRAY_MULTI =
guard,
>>> whereas the original patch does. Moving it back fixed the issue.
>>> See: https://lore.kernel.org/linux-mm/20250308213400.10220-1-sj@kerne=
l.org/
>>
>> This series took a lot of damage as "Buddy allocator like (or
>> non-uniform) folio split" was added, dropped, added, dropped...
>>
>> I have just dropped the series "Minimize xa_node allocation during
>> xarry split".  Please leave it a few days then resend against
>> mm-unstable.
>
> Sure. No problem.

Hi Andrew,

It seems that you only dropped the second patch of "Minimize xa_node
allocation during xarry split" and the offending
"mm/filemap: use xas_try_split() in __filemap_add_folio()", the first
patch, is still in mm-everything-2025-03-09-05-51.

--
Best Regards,
Yan, Zi
