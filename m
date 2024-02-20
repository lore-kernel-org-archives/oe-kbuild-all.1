Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09DC59B57
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708410545; cv=fail; b=Ht4r8g+EE0yjt+hF1o5lnZj+816jMW6+ab9lGGCzYCOmWEKfKV25JFlrS8Xso/HfaaVyvpHdle6Q4hhVxaXzOO75rkhecBI3h5cw5lGkvdzMop/JtPuCHkXo+Sk3eCKgNBV1bvU6+kkv3/6wO03QSF9fDJX+czbopGHGnjjSmtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708410545; c=relaxed/simple;
	bh=Hg2vo2ALovQdU/4HKbbnsEekZ0d6n+PrIfxfakLcHAA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bOH9SipLDW9xrm61JS+JPFS3OiO94rUPMEzWJbE65AX94X9RLWWSNA9eEuaUX+sjM0dSy6MZIUrd/RBra8BZ1MtZ/9B4ryuAvGzFLbSiEJghzCpAvXt477LUqB3pkM3ATsLLPY4jU2RenNDELiwhEpwF1pnyiuBQRsxpDwkiVhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnP4z1Bo; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnP4z1Bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708410543; x=1739946543;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hg2vo2ALovQdU/4HKbbnsEekZ0d6n+PrIfxfakLcHAA=;
  b=RnP4z1Bor5CTgnEFWQ2fdWLFakybBINm3gH+Z9k7tkPUkhXAHFAtVoNS
   zTZbtY8jp+ZiXrsPwBGtkT7nIPINwgaAdYhcx0zb10lNj54fDa9kE3k/D
   7zYfKyIX0iU4O3JPd5Z14taVeIcSbdObUzHUzsF6bWzDgUDoQtDxiAIj9
   s/QRJUq+zroST/4gMCRJQcedanTSD7WbH/GrhRYYaTE24k+4FBeHoeA46
   nZcR0zRu/cVr3YZ3Pm2fQ04w3u9xL8mLBGBb/nLGt0eelJoMKDYBnTg2n
   95hBrc29YW1cpYpd4KFkcirNV/CssWGDH16XvMLoDmdVyEPXVqAO3fdg6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13125157"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13125157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 22:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4972632"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Feb 2024 22:29:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:28:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:28:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 22:28:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 22:28:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEnfKQWoqUrTa0DwBdwScHzL6B43fT6LGTm81YUe94Fvf/iHgfSms6VlJMSOFN5PyxNST6HJV3gI9ar/wFDRs85ilTjJaQFbkO8DXNnbTqMKXpUmOR8B7dlFdMYbE+jNGsHhaQ6U2ZQCB322Bd+n6tsHGsoTSw9p94jhPj73JOHE+qPesMNS/VtnjauUBXkftCmTILuQVRSXik7DWGjVLf3zAluLMPbIUHUa5bgh2kFe/okFNxrtM3Vd3bTCBUU+oPOPLfZARvH5cIXgMKOV7sRogGkKxB8XhuPsJSjKzh0keQzM4na/cwVyFBkSnhzKw3fC4bloM7ZcI5DKIbBiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imMhRJ5n1FMHlv2VYoS+snq+oLSVdxMS/4m62Pmiti0=;
 b=cvwFFp1IudTbYeqlvJ5pT0U4pq5Nw7osEsViHIZHL2eJ/OI5Mz/WoiEagyWxsGF4W9I2za9qX9Gw3c5bJkq3xeKt6KqNROoaF2Nxz3ZF8gT4ipDv+Cub1hh1JyhOdp3jEc7R5cto2aoGkMjNpKwGG18QhrtQDAlsD5nTfovlWsdQ1skmrRDLJngxvwDD9FNkqCcupoua3hII2O0sl+cefDSItLt2aMd+J7EeLja1PYDArCNRC+DJGYkHa18mEJDQe9EZESYvJlwISJra/U4a9f0nOse+PGqIOVKEcnMRFIwZHyd+NlXmCx6saflZBs2HAxB5lTwwzBKXcKBxgKRrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 06:28:57 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 06:28:57 +0000
Date: Tue, 20 Feb 2024 14:22:02 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Baoquan He <bhe@redhat.com>
CC: kernel test robot <lkp@intel.com>, Paul Gazzillo <paul@pgazz.com>, "Necip
 Fazil Yildiran" <fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 82/320] kismet: WARNING: unmet direct
 dependencies detected for CRASH_DUMP when selected by FA_DUMP
Message-ID: <ZdRFCu3Uohd6wtml@yujie-X299>
References: <202402171431.MzqHz3g2-lkp@intel.com>
 <ZdL+sSSFghXttSqR@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdL+sSSFghXttSqR@MiWiFi-R3L-srv>
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a82cb6b-5d0d-418e-e5f7-08dc31dd3792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eu9sBB00n5WJS2PPwbdvMvGASqdlcT9imKz94GsuR8v9mx223URXMYzPK6F0HXt2PBNsc/fayUuYr2qArh05l6o+O8LYPoLqZ1yfcbdyQC31VFi/0Tat14PyBvDtkM59DuylEBw7u5dXl97J2T8Jc5reE8/6WiZ5walv33v3ly5jFTVvwy9va4IMId5Ug41DQuT15DueMWjm07MGOqCk7b1Rcga2XQrOsFhWbj8Y7DwFeyUmgmIpDabe1KQMGnHaYD86HMzpEJit6wbMzJRGA+aRpmmTo+0UZ+IiL9KFlyiF5qvuuXv4slNeflP3l4tmYj/r06V1D3Z0kNL8kPMZGas0phTCbGNdQCGjC3YanBz7Uh4WuU5JrpK1j68q2CdfybXsNSBpssSPbPcb4ZOltQVd8cbKXnSjALO2A6ymo9qGDcSCpsmlhmSFrr3T0K/7U7Ghl0lwyoODoHM99BF47aFnjYINKezTtm2kBNrT6fx/kkDFDyDxGrlGt4ouaztbIIloRUqW96A/qt6S1f0nznJqS7yg/s4HMvJbWaBMa6Zu1LNXUM0bj0HlzhjxlgK4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckk2eFVsRWlEbkVqK3V2Q3drOEY4M1pJOXNSbW12cTZ6Mnc0RFNIOFN5YkpW?=
 =?utf-8?B?Umlya2RHTk8wN3lmQzlXUHpKdFpBSFpEVGttYnJ3VTJuWmRVb3ZCWHlHMk9S?=
 =?utf-8?B?ZmhTSW1zdFIwL0dzZHB3UTJFLzJjeXZVc0pGSXB4ZnN2bnNSK2JLOVFsa2Zt?=
 =?utf-8?B?Y1BTbXZuVnAraWY4VXhCUHZ5bzgxSTd6VmlmandvVGhhZ1RPWUJCdi94OGJn?=
 =?utf-8?B?L0U5OTVVZE9PejB4bi83NHd6U0h1Q25ONVpWWjFkUDZseU5KRm93SEVtVkhG?=
 =?utf-8?B?QkpTQ2U3SjZjTWwyUWtpSDRJQWtCTndvQ2h2cTZIUCt5dEQ5ak1sQnVzYzQ3?=
 =?utf-8?B?OGlYTWxtVkhtRHRvL09iUE1vL2o2VTZ6U21XcXlMSjFvOWRGaVplaklmL3Rl?=
 =?utf-8?B?cHF3Y3NnOUZidEJuOVNkVXFqc01JM1QyUUxnaVJHZGg3Q2gwVDJ0L09hS1VP?=
 =?utf-8?B?M2hDRW9DV2w1MGlzT3J3T0FzZ3BReE01ZXR0ZnYxb09YVEtRbDJkbXRjdm1M?=
 =?utf-8?B?d2x0MWplZUpMcWR4VnZZaTRpM2tDeE5ybVRrSHZid0p3ZFU4TXM4d2x2cnN6?=
 =?utf-8?B?V1Vmd1VlaVhrR2M1cmI5TnRTVEVtU1R0M3AzRDNJNWxqVHNkZkdkZFhtdk9v?=
 =?utf-8?B?dHhFY0Npc0ZVOEJqSE54ME1XSzhQdkI1Ym5yeEROVThvQkM4bmVzczJBcHl5?=
 =?utf-8?B?U29tQ1dlQkNMUUoxVW9vRTQ3cGpBZWJHUU9HT0Mzc21NdFpXYzEzb3lYQ2N4?=
 =?utf-8?B?bFZQa1E5eXA5Wi82R285WEVXbWh4L1J1dG5PYkoza05HTTdIbUJZNDZvRzlU?=
 =?utf-8?B?cWJHcEljc1ZOL1BtdW5SVy8vbjF1dTdsODdKc1RGQXNla0NYZWZHYld6Z1kx?=
 =?utf-8?B?Y3l0V2xMeUwzMWRqbkF2a2VDclhuWTd0V0pQcXZIYkc1WStaOWV2Z050VFZI?=
 =?utf-8?B?aUFpK293NDlTekp1QWF4U1RhcVdmRVFaTTd3eXIxc3hyUWJHTkdLcTBNdkpP?=
 =?utf-8?B?MDFHZVVsQjVkTUtYVmxSMjZ6SjMxOE1DeHZLZlMvajU2cmlpRWhzN1pNYUQ1?=
 =?utf-8?B?cDBIVHVPMThGdkk5Ky9HRHZvVUtwTXUxam5Qbkd3ODFaMVdvSTMvTElVL1Na?=
 =?utf-8?B?RnlJMVE2TTB1MzdVSlFPM1hWWTkrcWJ3UjFvZE1XdHEwdmljK3BTMndDZ1VY?=
 =?utf-8?B?dHRhT2NpWFRZSExRdDc0V1IvRkUzL05sVy9LTWNDbVNGMmdlWmpybGdPVHlN?=
 =?utf-8?B?VjROVVFkREQzTXhDZ1JFL3RLVHJOWnhUUzU2WlJrOEpaZHR0VDEyTDZid3Zm?=
 =?utf-8?B?R1JzZXljdHJuRTFGNGVWd09adC9HS0lxWGQ3RjRMQ21rTTBSTmc0KzNYN3VG?=
 =?utf-8?B?ZVVobUhhc2d5aUF0MUcyYm9Cb1AzbjhFMWlEdERvSWpwOFlnaXUrV2lia0Uv?=
 =?utf-8?B?RTJzdlVqek9jRC84Mit0U1NiK3U4aW5xejRhcWcxUTFGV01PamJBN0VQL0xJ?=
 =?utf-8?B?d1AxSUlSWnpUL2VVaCtPMHJTVjYvYzBVd0lVci90ZE11dXR3UFFlNVBId0Q5?=
 =?utf-8?B?cksyMHZOYmRJZVZlaWFJYmNWc1VNVityOU94OXFmS0JnZklWS0wzbTJmT0lP?=
 =?utf-8?B?cDY4ek5aeUVGR2tBSlRYZ0MvSUIyZVEzSi81a0ZJSGNDRXU0d3hWcXVuMWx1?=
 =?utf-8?B?MlF3bml1RW9UejQwQU9Fa0h2SlpkRjlCMlR6NFNMREdZMktySUhEVTJhQ3Nz?=
 =?utf-8?B?TXZUcVZ5SXErVkNjMldwcmNIRm82VzVudHNGWTdGL3h6VDcvNTYvMFhCeWJm?=
 =?utf-8?B?bGJVWjg2NHQ1OW5DdVJ4TUJWS1JPeFNML0NsUmdBcEpkVEJvSW9iZHpyc3pz?=
 =?utf-8?B?czdRekdKTGxHSXV1M09mellrVjZKNUd1VkJTeVc3cmVjMm9tbTYrcjJuQUdY?=
 =?utf-8?B?cFZwYWNUT1BUVDdpNFRNYWt3NnVIWmd4NDkwa1pDS2JodkYycUcvMlgvemQ0?=
 =?utf-8?B?UHhwNW1US1gwajNBUGNtQWFScTV0ZzU1bXE0MVNFUnUyOENIZytWUWR1Znhv?=
 =?utf-8?B?VDBBYkhLd0tkdlJ4MGFoRG1BVlk1bzAxSkhPc0phYXFNUW5kc0hQcWlrMEgz?=
 =?utf-8?Q?kf7WGJr+nmWfg7aUMrMKgahFt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a82cb6b-5d0d-418e-e5f7-08dc31dd3792
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:28:57.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpDRkZCXjfSfNdc8KytTvU3shBC365QeJfUSLder3mWaIaZgKfvfBOtMpdZHJ1qt+fBRRm4XyUpIJYCBAJAhng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
X-OriginatorOrg: intel.com

Hi Baoquan,

On Mon, Feb 19, 2024 at 03:09:37PM +0800, Baoquan He wrote:
> On 02/17/24 at 02:48pm, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
> > commit: a5af0b602e5ecb379fd2470669654a6abe7e97a2 [82/320] crash: clean up kdump related config items
> > config: powerpc-kismet-CONFIG_CRASH_DUMP-CONFIG_FA_DUMP-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/reproduce)
> 
> When I tried the step 1 of reproducer, I got failure on installing the
> kmax. Is there other ways I can reproduce the issue? Or have you tested
> the latest linux-next/master because there's some udpate about the
> config items change?

It is not necessary to install kmax to reproduce the issue. You can
choose either 1 or 2 to reproduce it. We will update the wording to make
this clearer.

If kmax installation failure is blocking method 1, could you please try
method 2 to see if the issue can be reproduced?

$ wget https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config -O .config
$ make ARCH=powerpc olddefconfig

WARNING: unmet direct dependencies detected for CRASH_DUMP
  Depends on [n]: ARCH_SUPPORTS_CRASH_DUMP [=y] && KEXEC_CORE [=n]
  Selected by [y]:
  - FA_DUMP [=y] && PPC64 [=y] && (PPC_RTAS [=y] || PPC_POWERNV [=y])

Best Regards,
Yujie

> 
> -------
>  # 1. reproduce by kismet
>     # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
>     kismet --linux-ksrc=linux --selectees CONFIG_CRASH_DUMP --selectors CONFIG_FA_DUMP -a=powerpc
> -------
> 
> 
> ======
>       kextractors/kextractor-3.19/bconf.tab.c: In function ‘enter_if_branch’:
>       kextractors/kextractor-3.19/bconf.tab.c:150:5: error: implicit declaration of function ‘bconferror’; did you mean ‘ferror’? [-Wimplicit-function-declaration]
>         150 |     bconferror("MAX_IF_DEPTH exceeded");
>             |     ^~~~~~~~~~
>             |     ferror
>       kextractors/kextractor-3.19/bconf.tab.c: At top level:
>       kextractors/kextractor-3.19/bconf.tab.c:2064:1: error: return type defaults to ‘int’ [-Wimplicit-int]
>        2064 | bconf_parse(char *file)
>             | ^~~~~~~~~~~
>       kextractors/kextractor-3.19/bconf.tab.c:2107:1: error: return type defaults to ‘int’ [-Wimplicit-int]
>        2107 | bconf_test_lexer(char *file)
>             | ^~~~~~~~~~~~~~~~
>       kextractors/kextractor-3.19/bconf.tab.c:2119:1: error: return type defaults to ‘int’ [-Wimplicit-int]
>        2119 | bconferror(char *msg) {
>             | ^~~~~~~~~~
>       error: command '/usr/lib64/ccache/gcc' failed with exit code 1
>       [end of output]
>   
>   note: This error originates from a subprocess, and is likely not a problem with pip.
>   ERROR: Failed building wheel for kmax
> Failed to build kmax
> ERROR: Could not build wheels for kmax, which is required to install pyproject.toml-based projects
> =================
> 
> 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202402171431.MzqHz3g2-lkp@intel.com/
> > 
> > kismet warnings: (new ones prefixed by >>)
> > >> kismet: WARNING: unmet direct dependencies detected for CRASH_DUMP when selected by FA_DUMP
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> 
> 
