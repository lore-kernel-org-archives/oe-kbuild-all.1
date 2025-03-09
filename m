Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36B8F6B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741540835; cv=fail; b=QaFiiIU+84eUQH5ZzPw0neHUiRzRBu+pZdmudT/jwsP936pPBwH4tI+/IjOaiQ3DycuXi1ghLYb1ZRKY65DXJktR6hdwhBptsWOTRAqgD0h+RYSczF6eV8lQqgenlcu/5/xFREPDsKTlqi3TssF9KzoMfITPdzFdss0okwmd0Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741540835; c=relaxed/simple;
	bh=wQnZ91t/3uiIGckpTuyiwAnnOhhYtDO7MHhyl0a0kuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YS01bDK/LIhmXviPQdxOrba8gcx0t4StqGptX0oblsYTA8BBsajunJc+NXLeYkcr5TYOt9KyUS68JHlbXcYmSlgNUTrOAWtIP3Dhb8GIbJS8UZi7J3+upINw5AJl/Lx9QmXoSjBVCiOI1wzgG/4pSwpbR6zRbOksTqCMQGRfad0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TI86Tul3; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TI86Tul3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwNeKoXSe2VL2C50kGGB+n3p6GOHpsx3DY537xE2MeMn41tmg69zlOMYyylDdHk9bBbjzmSg/JqEu9UnkF8dvnrsvKBcIW7OoWZ/zovotuOZ6nLFWRZ+SIsLZ/VY601xY5vZCOgU5NdFgOtxJeXV0QrLKKHqcGHmM65Y2ncb00sC8x8csUYAdNCWqj5lz42+h1RME7k/kcQ+6CkB9/rqiW0M39R1q0/YcdThmT4uelgSL0EOx6ODslRtCY6BFXac/+ma6+DjApstdEtgI9NBbowtn2ANnszuAODhZN+OCrK2tN/cg4ehRN368sXI+542uIH0mhLJ0IysCWQtGexkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MM9p8o0B+dO2S16ihSzpJlOyCz19XpAn6cuWQofEgD8=;
 b=TIETTrRd4jDrvIT1Q6XSzA7k7WLgmh0kHXIEYV2+cGjg6cLVmjWrOfUZsvpDNa+0/rj0gW2nbErKNUjEX5/XMxI/pVHBC84IulnltKKn5bIJ3NzjiZsuzoF3fHjfIsJBHajkMYNBB+SoR5XtgUqPiIV2yWnhuB0Iqg5Ra6FZPDXdH2KgsbhMROTl2ewBpmzH+K8m8cjoAAlX+NNEpGxcFg5guUVJ6lodCtmcS69IAflHFqj7PCvHzDDVjeIuG9ChGo6plvcKLTKaN2Gg6I+kNmXSsA63C30TD5UkRXYB0oh/pbiRLJqsf0lT5y9BL3WkUPVFs9BHoyGrT1ozZhy53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MM9p8o0B+dO2S16ihSzpJlOyCz19XpAn6cuWQofEgD8=;
 b=TI86Tul3o8gB25R/QPfhnFnY/CDq0vpBgOC+ik3E6TK9c1FT40gJZRPymq7zeeWS+RMK8SXP3mfbb76aIMwvlERokknrOmVHXkPO5rQ6aAcNUXQiZXUUkLRGPfSTeQaYoH314dXc9+9MiRXRo1q9R7bI6HqxLBv+HYBL1GSilY9SsCXjBKVwBvtOXyLd3dZqkSGu/ejuN8sBhMmfYi51ZktBgjr6C0w6SX09q8DiSF9IXx4ZYETKPkwbK3Yc5pikXcl0aOQnEvwGX+TTi1krgH5dqHZNc36Zc3raa/Z7cAKZZdNiJO9RdE+y7AZFUwCcxRJPodidYhVWCOW5bD2Rtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Sun, 9 Mar 2025 17:20:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 17:20:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [akpm-mm:mm-unstable 481/507] lib/xarray.c:1251:14: error:
 redefinition of 'xas_try_split_min_order'
Date: Sun, 09 Mar 2025 13:20:27 -0400
X-Mailer: MailMate (2.0r6222)
Message-ID: <0D80D44D-E4E9-42F6-96A7-92BC8A00583C@nvidia.com>
In-Reply-To: <20250308201223.3462273207d0086da22e2044@linux-foundation.org>
References: <202503091121.RktXlKnp-lkp@intel.com>
 <07CB0079-5D7C-4438-A9EE-03A72904CD12@nvidia.com>
 <20250308201223.3462273207d0086da22e2044@linux-foundation.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:208:134::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2d3ce3-3947-45f4-03a1-08dd5f2eb03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+FlRsCfJufJOg7fXy2bisqVTnTHRbJD9cRlLGWQSvGCentLH84JzYradNxzH?=
 =?us-ascii?Q?iy3bgZDg18Uba/8bIlYcwIxusadyrp08L992G796ix6tQigCUwVmtIt4MLXh?=
 =?us-ascii?Q?VctmcSvoag5b4NyzyOGQTB4/2E7kqDgX6d5q+xVh6Y85biP0f8Bnqmn6aIxb?=
 =?us-ascii?Q?I2OI73Q/ividWH5Ol+qQFPPTo9pQ4nH90z4BDPXweCggUoVT3hA5TpfAxANl?=
 =?us-ascii?Q?qiRDax8R3Lg2lndSCjW4qOq1Dju5si19k/4F1ajGHdc56KpA1l/nGEvH1iF8?=
 =?us-ascii?Q?JP6CRAzCO8aecuQod611GeLcws/8Czj9zDljUDddIDA4DJH9JFoChwx2IuZJ?=
 =?us-ascii?Q?3YYIRwQtrGxep6QaLJ+hWDJ8Caq3XkIrFnND3C74WfstTTfq9Tfo5TVPilkD?=
 =?us-ascii?Q?2bzmdT9v5EGAI2qLxSnzxQ7qzKkBbZ/tdv/XZUffBFF9JujGQX+VhhAwDf2o?=
 =?us-ascii?Q?jHloAjDybnKrybnQPU/HLBohsEu6PApN6qfcHuN4YbS7lZ/9bc7AeyExzAcr?=
 =?us-ascii?Q?uDG7pxN+kxWQEReccSyjrk3NUWTk1teOlBzBiVzhizFGC8VUm3bMvC4xLxBu?=
 =?us-ascii?Q?L71XzdpyET/6Aw5LAOQtuBhU1Z/P5ygmYeEmSRrNxJ6XlkstG+ScwRVcd4sc?=
 =?us-ascii?Q?kXBiMIgp0wNXclU5gXVIjh4fmwubI1kgr/f9UFUP2betEfQmzrYkvR/9DZbK?=
 =?us-ascii?Q?O4JS4EtPscOV/c1fKTKCsksqkFZa5qOtR/4dA/4HgP7bH7Ln2+RSQti8SWRi?=
 =?us-ascii?Q?AbHRa79udVC8c/9jdyDtb4Osb525glvDawzdSi577Eg6TMuZpphWHpSXhbdZ?=
 =?us-ascii?Q?5laudOa9F8sbJ72QN51qJ3Kbb5WpplCTp+iqMhmt7haP//UKaJqW4cZmzo3N?=
 =?us-ascii?Q?3ztEGPkzwWS3aGW5TfJv2NQYfA5F1iOsLiARqGF21OASGrTaRlH2o7aZpktM?=
 =?us-ascii?Q?gTLZFGqRfIra9qebftB/xG3Tf8xqA5wNuWiRuTf24dC8aLRnlH+LhrIJ6VmL?=
 =?us-ascii?Q?YcRrh70aO2zyzfCGfGS77s4fsvK96ATT667DqtZigR7n3r7MMyZ4ztrmPZfu?=
 =?us-ascii?Q?dpLGUHNvZ0sLtXUOdB1E+u2le6Z0tF0qgNG6YHclLtcMAFdL5bKGJ2xGkrp5?=
 =?us-ascii?Q?GvDzOfl0aClLZrRfYqhuTcph8Yowo1Uy8Al9vEx2JwqxMwacLH1+/ZjqwGvQ?=
 =?us-ascii?Q?wLDU3vIcNq40SX0tPpLR8fgq9Yoy7rNp0OnKZmsaLuDsLkGbwuxvVro5BQbo?=
 =?us-ascii?Q?/XWyCuZQBHVcOeXE6vQ0sYYNIQX2xF8HovaHZ2I6wCNh6kZWSpP9kH9vsjre?=
 =?us-ascii?Q?N2Y72k6GG647NuBdT1wTm28bSN3a52QpFKl/+Fjo9XN/V2XeSKlUb4NTEB0l?=
 =?us-ascii?Q?ZtisGa3d0miiVyy7Fg1pixx9wzY7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2tLBM0BUKXFoXW+6pu1burw+K8/sZrrniWyFhZehP+Qv7TuBcjV9JItgKhZy?=
 =?us-ascii?Q?4wPxcd/pHmVDfF/0JpVcoethjFboqM8/4TMZzYYjAUbRgTiw8f0qUORlmeab?=
 =?us-ascii?Q?Z2D6iC1u9kzMdncTGXO6YfEJhCY3Gn/2ai9EJbfc5SJCvZ3N76VOLLBSnE9D?=
 =?us-ascii?Q?ST+yab8lZaR7Rg5b36J1VT7Cv4tpT+t+b4P0HQSSLT0yX1N/Tyk22ear2LJ1?=
 =?us-ascii?Q?3jTNLt7eIHc3uN7yfudYXoepxSQ8mS4i9t6No9p3ghTZ5/QBKkcyqujrdadR?=
 =?us-ascii?Q?puM4NBKbh8ZAhosR2/pvnAZj+3+xdVi2omdlMOhGntA6hl6VlmkHT3u3gDTf?=
 =?us-ascii?Q?AE3z+MH9pnV16Y9YFQHFFIE1ib1pYadcOQAze55YZL29rfwxDdEq3Wu/cy84?=
 =?us-ascii?Q?S3HO1mf1ERZekSCalOG+0p0ZlpMh6WmsaeRyOgz2xR8V9XhEv+wXtsqkjB40?=
 =?us-ascii?Q?DNNeyje5D+v1g/sowo/P+GMftRowK8M5Wg+hNW8mJoyliQUGRglYnO9D+JTt?=
 =?us-ascii?Q?PLuwac9MligaqYjZNzBU1MsaIznl0OBmZSlQQ/o5YAqZmWuUXKtdJcNjZt/i?=
 =?us-ascii?Q?B9RYhvEDCOKDU/9Lp3qC4JPczFPm0PO5NexNNxdFwKileIz6XrjVSCDHcR30?=
 =?us-ascii?Q?43eQHvEHMJ9swlZu8XsZiPvI4BtKG6ZSEI69aNAyCeCmVildmbYmpM+avus/?=
 =?us-ascii?Q?zKwEAHuTt0q98YTdPCLEXIigAmrsvaMh1rGU+d1tmjzWILtc9D0c70zddVoK?=
 =?us-ascii?Q?JiMAGyONaIZC+QM1rPCiURxjFPv9nIR4SP8YD5CD/brQuseIEuEJOqq53bhC?=
 =?us-ascii?Q?7IglJW5A9ORBM+VA5enRO4HdoTvLapd6tYMtIsNr/87xUJxuElKj/LOLaYGK?=
 =?us-ascii?Q?K5Xm0yhwfjgReBFrSw7pNpIJzLalcSPzCVrR+i5tSxT+YgQViBylMhvEzCYj?=
 =?us-ascii?Q?MXVvTeLvwHwrBJsIz/qIKIMAMUAWDkCRy+cgQs9smL1LUHMigjOkK5EHLbRh?=
 =?us-ascii?Q?QQpz8Zv0rTOQgi2DraDQp3ofQkqhG6G6TZ/IpAzO2k/gudHoDLI3gBu5ux1I?=
 =?us-ascii?Q?ojbrbySN5cQlsPXJslS1EaVjARaylQEEGuA96vpukiYuhEv17Iy/PpAt0wdx?=
 =?us-ascii?Q?8HiQJ4XqOt1L1m26/29WsuMbIlWhM/1CsvS6D4uYfdiCCGAIx26yiZBYh2yV?=
 =?us-ascii?Q?lCiYgxTjFEZArMh6BsCSNn+rAWxnXxPXpST5NNjs8e0IdIINyMYOhJLsY+v1?=
 =?us-ascii?Q?qasiWOaVlxPSW3Xvtc+QHzfVF9nYzWw62w8cRgmEfm6VjxneSljksaQC4xkR?=
 =?us-ascii?Q?hYGP83P3yS+43bJVWPC5m73LDX9fju1gwB9jKJd2EusMEQ9rZq59C4qXrp1j?=
 =?us-ascii?Q?6XsZCnsAHnxCdImslWS2iC36xzuu+QBKqc/1Irkk4Z2H7H26B5SJTbO6NQLh?=
 =?us-ascii?Q?O9vLK9aabQ29NeQIjY02mPOxOgFCSqa11tQT+UbpWMcaey1j7qpCrrhNqBUi?=
 =?us-ascii?Q?HDJcQYy0XoH8vTMDz/BphHQrI/uMcIUqwOGrACo90Zmp8ET2vySaUEuVqQr/?=
 =?us-ascii?Q?50gXXytTWJHSP5penrQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2d3ce3-3947-45f4-03a1-08dd5f2eb03b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 17:20:28.7253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqBFBH+sBRc2tTIlqwJ/fE5tYurp+DBJ3Dm4ufNxz+9v72hrzteMtHPTaHeYpjJt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718

On 8 Mar 2025, at 23:12, Andrew Morton wrote:

> On Sat, 08 Mar 2025 23:00:31 -0500 Zi Yan <ziy@nvidia.com> wrote:
>
>> On 8 Mar 2025, at 22:52, kernel test robot wrote:
>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-unstable
>>> head:   2f0c87542d97822659e81f55ae5e5cc1994f3339
>>> commit: 835714732ae42a4b4f590316b06d06826bff2483 [481/507] mm/filemap=
: use xas_try_split() in __filemap_add_folio()
>>> config: i386-buildonly-randconfig-003-20250309 (https://download.01.o=
rg/0day-ci/archive/20250309/202503091121.RktXlKnp-lkp@intel.com/config)
>>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250309/202503091121.RktXlKnp-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503091121.RktXlKnp=
-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> lib/xarray.c:1251:14: error: redefinition of 'xas_try_split_min_ord=
er'
>>>     1251 | unsigned int xas_try_split_min_order(unsigned int order)
>>>          |              ^~~~~~~~~~~~~~~~~~~~~~~
>>>    In file included from lib/xarray.c:13:
>>>    include/linux/xarray.h:1587:28: note: previous definition of 'xas_=
try_split_min_order' with type 'unsigned int(unsigned int)'
>>>     1587 | static inline unsigned int xas_try_split_min_order(unsigne=
d int order)
>>>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>>>
>>
>> It seems that something went wrong when the patch is applied.
>> xas_try_split_min_order() is not included in the CONFIG_XARRAY_MULTI g=
uard,
>> whereas the original patch does. Moving it back fixed the issue.
>> See: https://lore.kernel.org/linux-mm/20250308213400.10220-1-sj@kernel=
=2Eorg/
>
> This series took a lot of damage as "Buddy allocator like (or
> non-uniform) folio split" was added, dropped, added, dropped...
>
> I have just dropped the series "Minimize xa_node allocation during
> xarry split".  Please leave it a few days then resend against
> mm-unstable.

Sure. No problem.


--
Best Regards,
Yan, Zi
