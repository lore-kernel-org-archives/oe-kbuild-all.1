Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025C854907
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379859; cv=fail; b=jYlrcXxrkE87/r69vgXGdKmQhVyhsbdY1xwMOfx72Eu7arhWzphe+1+g1AEPUrr0zRCRnwT7vw29jXTNzemq4DlvJLqIK9nuzEdTGxNf1uUAP3h4TjbA/po85GUS2nijuqF7XeAEyPSVSDPPvyHKrg90zxbxbZ4U7i4NrVleTuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379859; c=relaxed/simple;
	bh=S2XKdfpK2veXqlmh1TCP+YLbb2BEBCsImzl8fymtmYI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YJPXCKL8dDgff7NB4TSteuABP0QXidKnb8BY6IN1jFyNPMxspjE/H1RGEKe0hv7b0oZ7rxy/NwIq9uPPHQGz+P6kHSia58mFyHyOXnsWlAGHWkTvhuK91Gpu1Oa63ofSxCO/liMW4GySMu24cT/AXU9ZhqSYtYhu5u77zSCohAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQiR2xGj; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQiR2xGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728379858; x=1759915858;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=S2XKdfpK2veXqlmh1TCP+YLbb2BEBCsImzl8fymtmYI=;
  b=HQiR2xGjMB+U1iV9Outq3t0o3vNmt4Z+wq6uGRurHJDuagmMAz6jZcTr
   bZjUq5EcAo3BsXJxRhdZdR8AbsR6WNslPhujQPaSsYY7cXzJaAd7FgAuF
   rhFMT/nnwfsNvCRI1G8f1tX8j6oB+2jjmq1IwRwjP8aHgg19Joo5Oy0mW
   qTb79hwSf0OAQxS4gy35EudzBrBKiE4urGslbjPMaS1CIZXFS6hGkWzOn
   T8X77tEcPI3zF52QsfOSSwnzalAX8rkkeCJRs04upBrXV8rE0A21zMtnz
   h5fpxRLMaBZChia6dMRgGpst0PpCq3oJr6rz3YBUvlK8fjoNpcJ+bSSmK
   A==;
X-CSE-ConnectionGUID: FCumAHf/QxeRBvrehCUFaw==
X-CSE-MsgGUID: MbtnPLQsRNGDNIo13jYQ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38693801"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="38693801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 02:30:58 -0700
X-CSE-ConnectionGUID: 8A9GHzfYQFu8Z9l27sHrUQ==
X-CSE-MsgGUID: JzY9HTnVSm6DEq4WINfTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="106612286"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Oct 2024 02:30:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:30:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 02:30:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 02:30:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 02:30:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmkmV7ncUElv9toGNwsHSX5b/DMbTEkKY89iF+SUftDsdVqdoVo/uH8K+3qK3bbVECzkRgZZlles+ioqt6TFDZSYImEz4DKaP/SIi93zctjVOklzTMyDLDOELDXy6Ew0oCrkVucsaynVBCy2pJbwFyWEPs2R0UYGHfyCduXl9RY+FuXIr8rAq7iHGCMzhGapCNBGjyKO8MWSmeLetFJAfv4pRZmyNkcCh51FzAggywiUk+gW8lxP5qvkRs5KHRH+KdK/Ydy9ruSq4KmdIYJWVQmC66gookMiLf/wD2PtsGBE/R432FKzLXCZYyFwN0bMLQ6zutnQSwUbAo+s9t0Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruoegMvT4CwSBggYwjO5nBxdB6/EOG8W/3kdk+SukNM=;
 b=LnLE0yQic+pP9DK2kJXmx2XIFLIINLa0vogDhmLoduz55kmQErJKwFZ4zH/yLy0SlAhtGDE0BcyWQGF2VAnzRt1ePkZh2GGBtAkf8QMTB/7rtgFbMN+/QjvjfXgyPq5jsSJKoQitycbO6K/9V09aJz91DAF3wnHAQkLDfkvEmit2rLv5OfuEdoWp0JZaq0aPnpQg6oxEOg24XBFeJzp6Im0TBCi/bCc2/y3CdLnI8gZOYK6FfrGEwhGcFYgqST/EO5/WwPBspk4vNfq9V1ZbKd7kTkrAgRYngfYo8CTj3HlAXWPFsAWIArbIBUus5wmXyeV1B8g76kJsRiLYhiAbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 09:30:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 09:30:53 +0000
Date: Tue, 8 Oct 2024 11:30:47 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: kernel test robot <lkp@intel.com>, Jani Nikula <jani.nikula@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell
	<sfr@canb.auug.org.au>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory
 Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2050/2483]
 include/linux/fault-inject.h:97:15: error: unknown type name 'bool'
Message-ID: <ZwT7xwD1A0xtpXJy@fdugast-desk>
References: <202410042155.On1ck1h8-lkp@intel.com>
 <ZwRHZVQr2PARUI86@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZwRHZVQr2PARUI86@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::23) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0019c04e-132f-4da8-a678-08dce77be7aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hRpQ6Wz/EtFhZdGnuOoN4ut8iv4jyCBu62EBvh5ZIhjLHFg2F5VA5mnNoCzj?=
 =?us-ascii?Q?Ag8SqO8srt/7al6ohlKtqCLx0S55F33r16yaV6xCgxFbUIGKdY6JWYC2E5cw?=
 =?us-ascii?Q?QG/jtmdhNkZ6p2+MqTzsUDIjUhsv/LbUcWWX6GRrjqBlg4iEkKK7jemFr/1y?=
 =?us-ascii?Q?p+sC9P/IzqnKn6P/GS/JWsi+3faepsv5tNKQoRtpwb7Ry9svBwA+sB52I4Zb?=
 =?us-ascii?Q?iOHjo16u4vMiJQlUHpgPmW2qj+AWIXmQ4q2Xw6V/QxMFvKSoG7eYi5rh+kyl?=
 =?us-ascii?Q?QfZ889XSlNLXVFdpAuMqKk36tPq1FWoe/lyn1vl5ikiZq6+iUAdjXC0Yc3+i?=
 =?us-ascii?Q?1DQtQ9iTdMXbxG2jzhuXWkuoYgeLg+Sdk1laPmT0wT6ATCAiLFQ8gdtrCAjn?=
 =?us-ascii?Q?yIz3KMvul/W6wAEJ7ImFSeQ4sXDvwCv5B2sczwadSkXCF5RSIWsU/T3IkocS?=
 =?us-ascii?Q?Dvwaq0UA24+ekoTQ5mZ9bBK6ea2htR4Tw49cWA9xGZXq1Ux1ggUktEw8zkjn?=
 =?us-ascii?Q?2aaVIsmM/HHdmtihC5uzKFn2ptEknbLQNe1I78EjJzSVS0hehES69WLyT1Jj?=
 =?us-ascii?Q?O20X2D81zJnyTEN/L1XRhI6MIBpGmo6016zDqKkaWEeVAlLbtXuUaDb/o0Mn?=
 =?us-ascii?Q?YyDQw9lYOPTEszi3MpQF5CI81V8bBXrGRNTr+HJx6SJGkae9l/U9PciBxl36?=
 =?us-ascii?Q?7nZH9CxxK8HS+kEsjWIs7vtjHnv2+Zw32cRvLYZVjGLsLVDZpxSxMEDsmTSE?=
 =?us-ascii?Q?zDNIed/y/JElhu1CXLlOUaudDPrvsQNjFhA3XqXgyJ3jBsgxdeHaMO3/t9mg?=
 =?us-ascii?Q?9c19WVKniYnaIXQfVr5s+ei6lgVcGcj4vdvC56RjC6KRCKAiV3xqaOP7GKOv?=
 =?us-ascii?Q?nsefKs4xxllvAMAudpKubVaVblfHkDmgGPWZrE+foE8GRu2MPIgH5Ceve+W7?=
 =?us-ascii?Q?4++4f5h/Doo7IGGwDAgitX82em7rkJ9oGYOi9HnncpYBsGtkYslHHR6gQs5s?=
 =?us-ascii?Q?rTi/UIQ/3PJ+jt2F5U3AJ3v7NC8PH2fOUo1hCCbzCgp+2DKmHAyG1uKIcoRZ?=
 =?us-ascii?Q?G69v0Rn8j54f7p5yzWcQnBFOXuQu36qhHlxWw9jHo7oxyAu4UnT1zI5Yyl6y?=
 =?us-ascii?Q?CaMS2F+JFrWo7NWkfkmLK4LJLz8icr2qE0VB8hSyvWdKeJVWT1eiw+ejzHDe?=
 =?us-ascii?Q?XA7p2T2SdjiQoi4K7XpWnivw5u/5y7g62tHqK9/mXMmDnH8IZootS9oMpsA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7828.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbNS5EJ299twqcWB6CjVFXUsjlCQ8Wk7qgb/XBs32N95ouUUrsaw2eEWITGQ?=
 =?us-ascii?Q?LI3gAW6VTJhRLLpR+TzLWEN99lEbEJJ6y5nhBSmv0nljSphNmyCe3Lj7q3N1?=
 =?us-ascii?Q?nIaj08YZUtRIeaq78SZNYk8hf1cILi28jQjE98pme7Kxs5dF8P64Y5vrVZ3S?=
 =?us-ascii?Q?PqaEZeBpm0tD0zj0ZHc94G1hVgwEr2Ofb+CDv1KRifkm/6PCnIdlJnED38Xj?=
 =?us-ascii?Q?NK5uxrU1/mvsRw41S3MOXOm0cidvNVmE5NgTsKlHwP44XPxwBjIFoLy4bQ8r?=
 =?us-ascii?Q?jzetGRxBOJbc6FrV2gDNxuTv40MkTAkTYDQIXsTTGDLD7WiEUJqT9BP+UluV?=
 =?us-ascii?Q?REWWRPPnGzicV+a2TC7gftBGA8+/qBmbvWWWzvLOI4x1kofuYnRjf2feuSJB?=
 =?us-ascii?Q?TLBsFfYxKSS0t4lilRB0efzLNF3u0kMd05jJztX6Yvl4paRYK7AQUlOQw74f?=
 =?us-ascii?Q?/MtFSoaQBjDo2AbASoCJGI0fozNY/D+OLS4EmLL86c28REfBt7xzW2ENXJ4n?=
 =?us-ascii?Q?k5ag1bhcc+3OYpymBoyonI1PmvC0leYgfPfz3tBxR4fO/iHgGaaP7ddF7Df0?=
 =?us-ascii?Q?+NdtgilbAVybzOPRN517eNeNAiJFX0S69Ey/J8dkH4quk68QTEGuF3eL9TbA?=
 =?us-ascii?Q?kdWNc4lJBIcJyK4zYjiX2XULiBab6ajmIT4R75SSVbInH6rne8k7aOAcJpS3?=
 =?us-ascii?Q?qSKB6yFPaJPpyw6XYPdjMHxXHF6fU0eljw+YYawQxVsff9G5c0W/szraRC6p?=
 =?us-ascii?Q?Ebkajv6BXrpdnPpV7KIDokk/F7CI+NNaq5zVBxT74ZNpE2HDX8iaz6IVfzfa?=
 =?us-ascii?Q?4KJNOsmuw8ZFpQ3yJNtB0F/tItY6FJ9aKZvkZnaLf0yq8OxxoMt62Pml+HSd?=
 =?us-ascii?Q?9Ihcm73lE8id33u3CgQfxgRgeysTGkS5WA+Z4s2BEbQAREHHt/JumEkWk/Fv?=
 =?us-ascii?Q?xgxbUSAAltuSQO+TlQSVE/j3N/Hnpx6exHb92RGoajKfkHBHdfgqt/LKTsPw?=
 =?us-ascii?Q?YrLU/X+J7lHtKDesTrsBag82+O7CatYNdYmDCtJsRzsxmKgz8Lhx1/d/d/RB?=
 =?us-ascii?Q?OozULosMZuwtMi72E39tgLPh+y7QGFgOfWKy7pf8N3OxLzfdyEcjqKZ7wMKw?=
 =?us-ascii?Q?nS2N4DbofOuQtWpF3Qz88pu4arN9hDIFRpjqoQWHt0eiUmSXjx++3kaUEGQf?=
 =?us-ascii?Q?O3tbd8mfMxUtotsb21lkxVStO23SERd0Vm7NVcu/3NCRf6d//CD0Bby6alvU?=
 =?us-ascii?Q?oT59GV5+x8rzIgc3nEP7dYL/w1qmT5IaOcLSETHY4f6aEujZz+5+SZ17RtBV?=
 =?us-ascii?Q?KaG9ddiC0tV9CYfHcVbn/SH36rXhgB53WtaUzvWmmdA/3h/qdC14Rygkd92l?=
 =?us-ascii?Q?tVVv+hm1xIBj8XkT3EBwmZFWt8DuAezaFTC6qEf4TUozpOYYAf/3WRP+c1kE?=
 =?us-ascii?Q?Po9stv/dHL73KDFXsgsPPYJxk7BGbXSX48+XA+Dj0JW4x6kCxr7jM2ok9TkJ?=
 =?us-ascii?Q?q1SYbDZvc/rYI39vEY/PKSOVc2NgrE2AojD8WRJKI6sn3HcFyqdoto6UDACR?=
 =?us-ascii?Q?aNEP5VeUFcq00/vym9gu3NBhzAjFCnwyF/923VaVQmt9otZGp0IC4ONLWO9Z?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0019c04e-132f-4da8-a678-08dce77be7aa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 09:30:53.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU06u2d2xQBHuA6K0+OY7/g6yNSANFBS0BoNQ6966qX1BEatoHDl8ZDGITXbqjhK73J+H7C2VG12jeK++KV/VFhuNZkRHjickOa1oCOUkTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
X-OriginatorOrg: intel.com

On Mon, Oct 07, 2024 at 04:41:09PM -0400, Rodrigo Vivi wrote:
> On Fri, Oct 04, 2024 at 09:50:36PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
> > commit: 91b2c42c214f570efaff80a666e30b8f6ce4f12b [2050/2483] drm/xe: Use fault injection infrastructure to find issues at probe time
> > config: i386-buildonly-randconfig-003-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410042155.On1ck1h8-lkp@intel.com/
> > 
> > Note: the linux-next/master HEAD 58ca61c1a866bfdaa5e19fb19a2416764f847d75 builds fine.
> >       It may have been fixed somewhere.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from drivers/gpu/drm/xe/xe_guc_ads.c:8:
> > >> include/linux/fault-inject.h:97:15: error: unknown type name 'bool'
> >       97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
> >          |               ^~~~
> > >> include/linux/fault-inject.h:97:43: error: unknown type name 'gfp_t'
> >       97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
> >          |                                           ^~~~~
> >    include/linux/fault-inject.h:106:57: error: unknown type name 'gfp_t'
> >      106 | static inline int should_failslab(struct kmem_cache *s, gfp_t gfpflags)
> >          |                                                         ^~~~~
> > 
> > 
> 
> I thought that had been fixed by commit
> 6ce2082fd3a2 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=n")
> 
> but it looks like some config case missing still?

Not sure about the sequence here but the fix 6ce2082fd3a2 was indeed
missing when building from 91b2c42c214f, see "commit:" above and [1].
When building HEAD, the fix is present before the new commit, as it
should be, which explains the note above "the linux-next/master HEAD
58ca61c1a866bfdaa5e19fb19a2416764f847d75 builds fine".

So it looks fine to me.

[1] https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/reproduce

Francois

> 
> > vim +/bool +97 include/linux/fault-inject.h
> > 
> > cc689c5b352d4a Ingo Molnar     2017-02-01   93  
> > 0866e82e40fba4 Kefeng Wang     2023-05-16   94  #ifdef CONFIG_FAIL_PAGE_ALLOC
> > 53dabce2652fb8 Vlastimil Babka 2024-07-11   95  bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
> > 0866e82e40fba4 Kefeng Wang     2023-05-16   96  #else
> > 53dabce2652fb8 Vlastimil Babka 2024-07-11  @97  static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
> > 0866e82e40fba4 Kefeng Wang     2023-05-16   98  {
> > 0866e82e40fba4 Kefeng Wang     2023-05-16   99  	return false;
> > 0866e82e40fba4 Kefeng Wang     2023-05-16  100  }
> > 0866e82e40fba4 Kefeng Wang     2023-05-16  101  #endif /* CONFIG_FAIL_PAGE_ALLOC */
> > 0866e82e40fba4 Kefeng Wang     2023-05-16  102  
> > 
> > :::::: The code at line 97 was first introduced by commit
> > :::::: 53dabce2652fb854eae84609ce9c37429d5d87ba mm, page_alloc: put should_fail_alloc_page() back behing CONFIG_FAIL_PAGE_ALLOC
> > 
> > :::::: TO: Vlastimil Babka <vbabka@suse.cz>
> > :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
