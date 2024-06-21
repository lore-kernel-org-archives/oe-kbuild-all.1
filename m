Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA7EA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718945780; cv=fail; b=Wo40/mubwlSnuWmR3luqhiG1Jw4+o07d7IL7YwPPTs/muPJsx9WiyNtZMu/SMdMbOqNv0odQs9xqHYr0rVSe6k0kyotw34nmUtPmFupXBVnBJ6QG0Y3+hicyCaD9ObhYkkLUCfsR9b6Uj5+gk6ch3McN0lg6SZq492f9Z67Fq1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718945780; c=relaxed/simple;
	bh=TnBresEHMQ+3H/yktEnhtwyk4J3ucMaU+yxmW4GOnsA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MQTNtUA6Qp0UIaQxEYbvqVQ6jxah0QkGIuXWvalPHUdzuqERCnNxZnANwPZLsFKWTBPihoMCYvu2ZbsVa++Nqxy0IS9LgU81HZnmQSzzR2cRKcvuCE8/1dKKscrcqPS5pLMVdXnGmsWGTmDdwHrf2reO7fpUlMhyfLNX6RC1Q5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAWi57jh; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAWi57jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718945777; x=1750481777;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TnBresEHMQ+3H/yktEnhtwyk4J3ucMaU+yxmW4GOnsA=;
  b=SAWi57jhyNZak5+kGfRbtfVFnwoTDHtJp4ceVVjJQ+u0aVW2XZCQSsbu
   CWwM7WChpg5DEJGcGN3CjXDYOTWMdyP5f8JET6Lc4g99CvVv+3KhsxIPw
   c9/2trhDU9pbjmokSbUld5xEjCohrdq0+6jaji1d7TPd55TkhtPfpV+ok
   aYjhFDXCM5CVcd+d69M0WeW4KECsAvpn/4p4iRH65MOe5IAh2UcYSWmYd
   A2G54e6lVN6nOOPrpAqgcMjsuj/fhcUFuOXJwAmmhsMy9hpsTeyjxe4Eh
   QSkwUAdxYrXgYavQwPDm1PJBjNp3udF8Oq+97F6/DLHizQtPYmT1QaIgJ
   g==;
X-CSE-ConnectionGUID: l5/KvkLBRjqE9LKAcd1t/A==
X-CSE-MsgGUID: 3+gV5IzSSWSHQC9fJ5RSiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33506091"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="33506091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 21:56:17 -0700
X-CSE-ConnectionGUID: 0U053lqTShy/VPr42vJx2g==
X-CSE-MsgGUID: gpRR+wSoSOikCLJTbb8nuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="47662540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jun 2024 21:56:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 21:56:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 21:56:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 21:56:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 21:56:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9i8trmL0X8ML7k7//IzxDzv4pP+M87/1JQSigAB1PiC81jf8KWdFIEE2WjbvKYq+/ohD6QWLOe8I4ejhhUck45kOdtuH8PpR/5Nw1Lea3W5CsWLG59nbS2Pnmu8vtRC+wuqqrFNnz7HIvzcdMtWQy9XgzjvK1ALCGUPe6zQUgXoGpAllIF68AD6zq+J5CsSLIeMzNO9X+azsfGl3mGQprb30QcSEuitMdx0cGxOvdMrE//JIkvV2vK6KbFVezepTpWmSMeUyMsGaPTOMhYz+X5MCEOiqV9CPI9cBcovS8Rd0fLuEJH2y649n5i/RRQS3BZVy+sgat9HRb1liLZF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNQlxObsfA/uCmq24I7AuORD97s3BgttJs2UXEj9zfM=;
 b=Px+GKW6mAQhlBqmEZRnkzbwJZ5RvSDybYU2QJr1CzBbNWyC35NwSmqAR1SbONLXsAF/d0DuRN4KVUio2Rxi6DQYv7Fm5K6L9eMQQNWcLLPuZ/fed0ey7xOeaeqRyO9Mxx8liHQXAUhzu0hVsHEgw20LX66mbSFNVVwwaqFWXJCMHzECI7FcXXdZt17TvOnyvUVaCyctVK0WIx/pF7NgLmVD4RrTvMsCzX/9mXekUhWXppi0ohhop7DcU6qVu3VbWCOvPgtFo+7QRaYs7AmdThin9um2wdMOITG77YTncse5bkzT2RZiOL3wBeDTtPVYZ6a9qxDZStQLcS1toSF3KyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 BL1PR11MB5239.namprd11.prod.outlook.com (2603:10b6:208:31a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.21; Fri, 21 Jun 2024 04:56:13 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Fri, 21 Jun 2024
 04:56:13 +0000
Date: Fri, 21 Jun 2024 12:56:00 +0800
From: Philip Li <philip.li@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6447/7105] mm/mempolicy.c:2280:15: error:
 redefinition of 'folio_alloc_mpol_noprof'
Message-ID: <ZnUH4B6MlKEKDM0A@rli9-mobl>
References: <202406202319.pBcCfVar-lkp@intel.com>
 <0c35a647-caa4-4451-b74e-65c68c83f0ca@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0c35a647-caa4-4451-b74e-65c68c83f0ca@huawei.com>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|BL1PR11MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6fcba7-3367-4ff0-cbf6-08dc91ae79c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2bw5VhoDBwFoureNynb+wSTiThd6hB4NOMg94+M5W2p00wENs7hZ3dsfzC+1?=
 =?us-ascii?Q?z/ARy4QWI9m64gyPDauX0R+WwvEzWoFQT/MCHFkKyK3LA0dw8SE7Kp6lrIwW?=
 =?us-ascii?Q?zc4aXfuNjCB2Rj7StiJuuSWa/qVneUlygYvvhZYuIL7zlyrSbuwrmz+hV0R3?=
 =?us-ascii?Q?zVuXp3baPToS0j2/8r/+cF9lGEk/WIU+LhJXKXUJJrOpGv9P2xQdvKXQh+bi?=
 =?us-ascii?Q?ax1DOezoiDAiT4bnKMBndPPwrFWv1FN5uqTNg1cRM9nlEHQjhkePnLh6DJog?=
 =?us-ascii?Q?mSYCe44apZ4Ie9cm/+u1EVr2teFlYUY5eqcn73LGcRCYd3AOuvGyVg5W/86o?=
 =?us-ascii?Q?4qlMGbYdZ1FEwgv4rEASqUZozkY+ngQDQpDZi85UdAwMt6mAcFq9ukkx6W+j?=
 =?us-ascii?Q?2IhvM00TzLAW7WP4j23VL2zEq/lm6PAzPorZc8hBLCQDuxMETSDXvu8B/0+C?=
 =?us-ascii?Q?7d3AUHEFmDBEV/35XejVF5tnUz+YHy/7Ha8/j8URsknJix4tEbIw8dpFOBiX?=
 =?us-ascii?Q?hhKN2FrnkfA6jW024HnQPWU2PcldyWwu7KERICsSrGf0GHj8hFeqmuw6kEGx?=
 =?us-ascii?Q?YwQoj+U4FL8U0oDuCVwlcPgmbj3X6iolG8WqDokxd5q5llFu/YGYQ0nUxwRJ?=
 =?us-ascii?Q?XKpnKRhTwCE0VYIpSdGDEW/kySCEckPoPs1PFb5IW1r7Yku20fQDjAoSK4Sv?=
 =?us-ascii?Q?ME+0HQ11UlHehSALII32XjboUGy/UJm/DLBiHE9QYAeM2tEHraFQ3X0+nssF?=
 =?us-ascii?Q?ThdMEXbiEvduPKTC90gSvLb3FIYuv9wHBfBfdD3bNVI/F5HTw/SVV+OvKrxt?=
 =?us-ascii?Q?0TF3W3QQobVMhHtY3WoYEagXIUfvfWnWSCopNO5bxVrPFMd3z197H9X8SAID?=
 =?us-ascii?Q?NTVpbRq9PrTGXi2glERdIL0iYuwojUN24xVD57VXkgN/qlMMG5ssR7imcZFV?=
 =?us-ascii?Q?YHfReEAqnC+o0ekH034hUIfnN4pbth1UGXUP5PZeHGgkFEED0wmmLTvvMjsE?=
 =?us-ascii?Q?sO8oX/xUSrXfcdb1q3gCQlQYxrX5ecRSECzNTZQGjDnz18HZpnzGokFg3bmN?=
 =?us-ascii?Q?KyrRYLRQVgBL2fZdxb62luJqtzoyNgCITuqlYuSDJX1tfcMVeUW8XW2WJmGv?=
 =?us-ascii?Q?N/vnazne1ZexbyKVCsvAf4cTfCmR+bSEAJGSUJwpo/UD8E7gtiHmk6lt6yvJ?=
 =?us-ascii?Q?Z884x2qR3xVp9OgmXHzhm6CoMA89h0+rfcbOAwMnBF9wzj7riZGl2KbDXShU?=
 =?us-ascii?Q?nHu3i5TIBUudvJKXRVKglS/Skx/mTBUjMeeps4dnDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXojcgBALz5t/UUaRHQI3Pm93xpVU7/Z6iYvnGB/cDUJH1UQ6YRI5IN+sZy+?=
 =?us-ascii?Q?rG2Of5GkhUG+XXAvgLv91XiNr+1kfUlmyLz92INAuWe6ObRRJ7QI4BVEF8Si?=
 =?us-ascii?Q?Ko7PewOru9rpqfaBw59Pe9HlRYAcwW33SCKTJHw9WuUvc/S8xgyZta34g4sD?=
 =?us-ascii?Q?gdK8pLa9ucU2W6klfXQx+zoL1MITatkXpNYtq8fCMMxXQQFd64EqaOgji5hc?=
 =?us-ascii?Q?kfcNZFo1uRTTkwkowHLh7jUkOMKdrFB7ZqrTYcNN4Y+GJHiyDMqPdRl96sZc?=
 =?us-ascii?Q?p9TlEhfoXHCKWN3VGmndxSVD80twlo4ysNiLmoYVhHPkZLOYEhrb4u+/Z/ui?=
 =?us-ascii?Q?I4jEltRHdz9xm/Ns3l7mxjuJ3DJNyWV/OtRmZ4xaWXlFI8A0EotgHiqGi8PD?=
 =?us-ascii?Q?3lMXGVpe2SlNzbkXZnmUpVaqkIlPObOYXwQSAraLPDv3NQK+LbdgW6Dw0ny+?=
 =?us-ascii?Q?woQcJ4oTeG+UxcDBbQs00sX+jFFodlap9oXXbyFhXUtatsVxmaYL/sKO9iGP?=
 =?us-ascii?Q?gmpJ4cXjIOGE3kyoo1lG/tsdJb4DGYLpW3dfps8OWBPIZdKL4wMxJhW+AnE5?=
 =?us-ascii?Q?X/ADXxdjMcM2606hvwOQe96Eh686HzQi8gdiF4t1aDN9fQCeSJODPyVPidpA?=
 =?us-ascii?Q?H6ciJJLtAQlhFysNXHOQf4/9MFw5f547uvv41bdI/zWpVli+p80hsLwRt6Qn?=
 =?us-ascii?Q?B3Vd2sWtenHXUvqmnskVvW1fveAPQz5jzPehchX49LzSYJH4O0mmaB6UzoZs?=
 =?us-ascii?Q?f8t7biiHQANWXsBZqHnZ8XVHk3+4saR4ujba7gyua/BqVBl+h2bowkPUWUto?=
 =?us-ascii?Q?duHkusEBTClB/q1I8SD2pormGPXteo6UnxjjzZ3RmC/9+jjyGLrfK9gdSvy5?=
 =?us-ascii?Q?SqZN16yhVX5TT6YLdaWB4fMCJKyYIesSxQTyLCAFFsQv7gkFnviSvq/r8nK+?=
 =?us-ascii?Q?Xvw8E2S3VO9uxVHLdiNocpt5bcJZ+KWyzvgpteKVkBs6qb6DAZS6gFHauwlW?=
 =?us-ascii?Q?78Ar7/p/X0KMqi3hE1aJY3fgZQ1nU7fo/nKNlNUsttFDwaP5F5vjsc+cZCu9?=
 =?us-ascii?Q?k6wQsU2qFC7IG2AnlxbbEuM0z8OdwnT8vrVpRWkDrNu903wpzrKaj3CwsWpt?=
 =?us-ascii?Q?Y9SiMTv2HcvLuskZGVm+rR/fxEJr1GLOi5xnhinv0oNfkJuqL8a6KM2ORzHi?=
 =?us-ascii?Q?G42aRV98vtT/z3Zp3o1QvNQC4AkYcweEgSVrYbQnkJAxiAyEtgTU+QHOQNGM?=
 =?us-ascii?Q?D79UV7JVzEIzYB1U5+nfkoIZZxREHQ8bHX5DosdEIw1ECuLAkT/rAvPjMdUW?=
 =?us-ascii?Q?lyvvU6cBuTpAhW6HoYHnQ8f4Yyhp9L8uESTKvDV47xvQlhq2w+FnW0g88A2M?=
 =?us-ascii?Q?LMK15vvWMKGVpO+FHQMW0FrP/dU+iQ7Mq2oWQuK8aaJ1MdXMYlWW2WdUBFeO?=
 =?us-ascii?Q?tONWR0cJUsK7fOMRumKdo2uA99qrL9QJ6VUc2hHyZeYBLFo9wuOwjp7aIguv?=
 =?us-ascii?Q?f+XDhjaVKu2xEoxmVmCX1CnjyVBQpJMncgQrS3OmZK1ZvZ3XtImbI6skw69W?=
 =?us-ascii?Q?7/ZxD44ZiJcwE3h2baqSifa/POqteEbpqBX1SRQH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6fcba7-3367-4ff0-cbf6-08dc91ae79c1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 04:56:13.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XemdvNvPHvRDF3xrdGrs2qV2OZ+T59B5Q2bPRAuoYYqf+iCIIfmQrHB8Ld1w2sYCoMaopmcUlL/BEO7D6N6AIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5239
X-OriginatorOrg: intel.com

On Fri, Jun 21, 2024 at 11:17:05AM +0800, Kefeng Wang wrote:
> 
> 
> On 2024/6/20 23:55, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   2102cb0d050d34d50b9642a3a50861787527e922
> > commit: f85385e70cb4bbb569298830fdf0a3d8325de36d [6447/7105] mm: add folio_alloc_mpol()
> > config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/reproduce)
> 
> Hi, thanks for report, I try with gcc-13 from 0day[1], but can't
> reproduce with above config.
> 
> [1] https://download.01.org/0day-ci/cross-package/gcc-13.2.0-nolibc
> 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406202319.pBcCfVar-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >           |                        ^~
> >     mm/mempolicy.c:2058:35: error: 'struct mempolicy' has no member named 'home_node'
> >      2058 |                         *nid = pol->home_node;
> >           |                                   ^~
> >     mm/mempolicy.c:2063:60: error: 'struct mempolicy' has no member named 'nodes'
> >      2063 |                     cpuset_nodemask_valid_mems_allowed(&pol->nodes))
> >           |                                                            ^~
> >     mm/mempolicy.c:2064:40: error: 'struct mempolicy' has no member named 'nodes'
> >      2064 |                         nodemask = &pol->nodes;
> >           |                                        ^~
> >     mm/mempolicy.c:2065:24: error: 'struct mempolicy' has no member named 'home_node'
> >      2065 |                 if (pol->home_node != NUMA_NO_NODE)
> >           |                        ^~
> >     mm/mempolicy.c:2066:35: error: 'struct mempolicy' has no member named 'home_node'
> >      2066 |                         *nid = pol->home_node;
> >           |                                   ^~
> >     mm/mempolicy.c: At top level:
> >     mm/mempolicy.c:2172:6: warning: no previous prototype for 'mempolicy_in_oom_domain' [-Wmissing-prototypes]
> >      2172 | bool mempolicy_in_oom_domain(struct task_struct *tsk,
> >           |      ^~~~~~~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c: In function 'mempolicy_in_oom_domain':
> >     mm/mempolicy.c:2182:26: error: 'struct task_struct' has no member named 'mempolicy'; did you mean 'policy'?
> >      2182 |         mempolicy = tsk->mempolicy;
> >           |                          ^~~~~~~~~
> >           |                          policy
> >     mm/mempolicy.c:2183:35: error: 'struct mempolicy' has no member named 'mode'
> >      2183 |         if (mempolicy && mempolicy->mode == MPOL_BIND)
> >           |                                   ^~
> >     mm/mempolicy.c:2184:49: error: 'struct mempolicy' has no member named 'nodes'
> >      2184 |                 ret = nodes_intersects(mempolicy->nodes, *mask);
> >           |                                                 ^~
> >     include/linux/nodemask.h:211:46: note: in definition of macro 'nodes_intersects'
> >       211 |                         __nodes_intersects(&(src1), &(src2), MAX_NUMNODES)
> 
> 
> 
> The above error is strange, my change shouldn't affect them.

Hi Kefeng, sorry for confusion, usually you only need take care of the issue
that is prefixed with >>, which is the new issue being introduced by the commit.
Other issues exist due to existing commits.

> 
> >           |                                              ^~~~
> >     mm/mempolicy.c: At top level:
> >     mm/mempolicy.c:2221:14: error: redefinition of 'alloc_pages_mpol_noprof'
> >      2221 | struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,

[...]

> >           |              ^~~~~~~~~~~~~~~~~~~~~~~
> >           |                         __count_vm_event
> >     mm/mempolicy.c:2272:61: error: 'NUMA_INTERLEAVE_HIT' undeclared (first use in this function)
> >      2272 |                         __count_numa_event(page_zone(page), NUMA_INTERLEAVE_HIT);
> >           |                                                             ^~~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c: At top level:
> > > > mm/mempolicy.c:2280:15: error: redefinition of 'folio_alloc_mpol_noprof'
> >      2280 | struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,

For this report, you can check whether this issue can be reproduced or not.

> >           |               ^~~~~~~~~~~~~~~~~~~~~~~
> >     include/linux/gfp.h:324:29: note: previous definition of 'folio_alloc_mpol_noprof' with type 'struct folio *(gfp_t,  unsigned int,  struct mempolicy *, long unsigned int,  int)' {aka 'struct folio *(unsigned int,  unsigned int,  struct mempolicy *, long unsigned int,  int)'}
> >       324 | static inline struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
> >           |                             ^~~~~~~~~~~~~~~~~~~~~~~
> >     include/linux/gfp.h:330:9: error: conflicting types for 'folio_alloc_noprof'; have 'struct folio *(gfp_t,  int)' {aka 'struct folio *(unsigned int,  int)'}
> >       330 |         folio_alloc_noprof(gfp, order)
> >           |         ^~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c:2303:15: note: in expansion of macro 'vma_alloc_folio_noprof'
> >      2303 | struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
> >           |               ^~~~~~~~~~~~~~~~~~~~~~
> >     include/linux/gfp.h:320:29: note: previous definition of 'folio_alloc_noprof' with type 'struct folio *(gfp_t,  unsigned int)' {aka 'struct folio *(unsigned int,  unsigned int)'}
> >       320 | static inline struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order)
> >           |                             ^~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c: In function 'folio_alloc_noprof':
> >     mm/mempolicy.c:2310:30: error: 'vma' undeclared (first use in this function)
> >      2310 |         pol = get_vma_policy(vma, addr, order, &ilx);
> >           |                              ^~~
> >     mm/mempolicy.c:2310:35: error: 'addr' undeclared (first use in this function)
> >      2310 |         pol = get_vma_policy(vma, addr, order, &ilx);
> >           |                                   ^~~~
> >     In file included from include/linux/linkage.h:7,
> >                      from arch/x86/include/asm/cache.h:5,
> >                      from include/linux/cache.h:6,
> >                      from arch/x86/include/asm/current.h:10:
> >     mm/mempolicy.c: At top level:
> >     mm/mempolicy.c:2316:15: error: 'vma_alloc_folio_noprof' undeclared here (not in a function); did you mean 'filemap_alloc_folio_noprof'?
> >      2316 | EXPORT_SYMBOL(vma_alloc_folio_noprof);
> >           |               ^~~~~~~~~~~~~~~~~~~~~~
> >     include/linux/export.h:56:23: note: in definition of macro '__EXPORT_SYMBOL'
> >        56 |         extern typeof(sym) sym;                                 \
> >           |                       ^~~
> >     include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
> >        68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
> >           |                                         ^~~~~~~~~~~~~~
> >     mm/mempolicy.c:2316:1: note: in expansion of macro 'EXPORT_SYMBOL'
> >      2316 | EXPORT_SYMBOL(vma_alloc_folio_noprof);
> >           | ^~~~~~~~~~~~~
> >     mm/mempolicy.c:2332:14: error: redefinition of 'alloc_pages_noprof'
> >      2332 | struct page *alloc_pages_noprof(gfp_t gfp, unsigned int order)
> >           |              ^~~~~~~~~~~~~~~~~~
> >     include/linux/gfp.h:311:28: note: previous definition of 'alloc_pages_noprof' with type 'struct page *(gfp_t,  unsigned int)' {aka 'struct page *(unsigned int,  unsigned int)'}
> >       311 | static inline struct page *alloc_pages_noprof(gfp_t gfp_mask, unsigned int order)
> >           |                            ^~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c:2348:15: error: conflicting types for 'folio_alloc_noprof'; have 'struct folio *(gfp_t,  unsigned int)' {aka 'struct folio *(unsigned int,  unsigned int)'}
> >      2348 | struct folio *folio_alloc_noprof(gfp_t gfp, unsigned int order)
> >           |               ^~~~~~~~~~~~~~~~~~
> >     include/lsinux/gfp.h:330:9: note: previous definition of 'folio_alloc_noprof' with type 'struct folio *(gfp_t,  int)' {aka 'struct folio *(unsigned int,  int)'}
> >       330 |         folio_alloc_noprof(gfp, order)
> >           |         ^~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c:2303:15: note: in expansion of macro 'vma_alloc_folio_noprof'
> >      2303 | struct folio *vma_alloc_folio_noprof(gfp_t gfp, int order, struct vm_area_struct *vma,
> >           |               ^~~~~~~~~~~~~~~~~~~~~~
> >     mm/mempolicy.c: In function 'alloc_pages_bulk_array_interleave':
> >     mm/mempolicy.c:2365:33: error: 'struct mempolicy' has no member named 'nodes'
> >      2365 |         nodes = nodes_weight(pol->nodes);
> >           |                                 ^~
> >     include/linux/nodemask.h:238:49: note: in definition of macro 'nodes_weight'
> >       238 | #define nodes_weight(nodemask) __nodes_weight(&(nodemask), MAX_NUMNODES)
> >           |                                                 ^~~~~~~~
> >     mm/mempolicy.c: In function 'alloc_pages_bulk_array_weighted_interleave':
> >     mm/mempolicy.c:2423:18: error: 'struct task_struct' has no member named 'il_prev'
> >      2423 |         node = me->il_prev;
> >           |                  ^~
> >     mm/mempolicy.c:2424:20: error: 'struct task_struct' has no member named 'il_weight'
> >      2424 |         weight = me->il_weight;
> >           |                    ^~
> >     mm/mempolicy.c:2433:27: error: 'struct task_struct' has no member named 'il_weight'
> >      2433 |                         me->il_weight -= rem_pages;
> >           |                           ^~
> >     mm/mempolicy.c:2440:11: error: 'struct task_struct' has no member named 'il_weight'
> >      2440 |         me->il_weight = 0;
> >           |           ^~
> >     mm/mempolicy.c:2498:11: error: 'struct task_struct' has no member named 'il_prev'
> >      2498 |         me->il_prev = resume_node;
> >           |           ^~
> >     mm/mempolicy.c:2499:11: error: 'struct task_struct' has no member named 'il_weight'
> >      2499 |         me->il_weight = resume_weight;
> >           |           ^~
> >     mm/mempolicy.c: In function 'alloc_pages_bulk_array_preferred_many':
> >     mm/mempolicy.c:2514:73: error: 'struct mempolicy' has no member named 'nodes'
> >      2514 |         nr_allocated  = alloc_pages_bulk_noprof(preferred_gfp, nid, &pol->nodes,
> >           |                                                                         ^~
> >     mm/mempolicy.c: In function 'alloc_pages_bulk_array_mempolicy_noprof':
> >     mm/mempolicy.c:2540:16: error: 'struct mempolicy' has no member named 'mode'
> >      2540 |         if (pol->mode == MPOL_INTERLEAVE)
> >           |                ^~
> >     mm/mempolicy.c:2544:16: error: 'struct mempolicy' has no member named 'mode'
> >      2544 |         if (pol->mode == MPOL_WEIGHTED_INTERLEAVE)
> >           |                ^~
> >     mm/mempolicy.c:2548:16: error: 'struct mempolicy' has no member named 'mode'
> >      2548 |         if (pol->mode == MPOL_PREFERRED_MANY)
> >           |                ^~
> >     mm/mempolicy.c: At top level:
> >     mm/mempolicy.c:2558:5: error: redefinition of 'vma_dup_policy'
> >      2558 | int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
> >           |     ^~~~~~~~~~~~~~
> >     include/linux/mempolicy.h:232:1: note: previous definition of 'vma_dup_policy' with type 'int(struct vm_area_struct *, struct vm_area_struct *)'
> >       232 | vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
> 
> ditto..
> 
> 
> struct mempolicy is empty when NUMA off, but  mempolicy.c won't be compiled
> if NUMA off,
> 
> $ cat mm/Makefile  | grep mempolicy
> obj-$(CONFIG_NUMA) 	+= mempolicy.o
> 
> Any though ?
> 
> 
> 
> >           | ^~~~~~~~~~~~~~
> > 
> > 
> > vim +/folio_alloc_mpol_noprof +2280 mm/mempolicy.c
> > 
> >    2279	
> > > 2280	struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
> >    2281			struct mempolicy *pol, pgoff_t ilx, int nid)
> >    2282	{
> >    2283		return page_rmappable_folio(alloc_pages_mpol_noprof(gfp | __GFP_COMP,
> >    2284								order, pol, ilx, nid));
> >    2285	}
> >    2286	
> > 
> 
