Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC62AD39
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189821; cv=fail; b=UOzh2udf8JwijWev8egGNXHxeDQsXrXH6FhFGJWbsVfmfqGsQ+cxo/BjrqrR12PgVfscx5/tKN1avZ28E8jDEiesbwDeEulVX08TGltFPe/vmRoeNWUgX8FoL+8WYpRpVX9nOZNtt1EBCXO0+Gm6XYn8Xv4NVyK1p2t4fiyr0dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189821; c=relaxed/simple;
	bh=Z3I9yvb/lGoeXyLMvFvFKeO76/QB3T2UThtROLJ1sWk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Hqwf1yiuaGiwEPdne3IQgKt7YnFj9TaqzvLcf34P/YGX2K8pF5PZsUAI7ARltJCxbMgKBl+jmygqg6+KwcDn9M4vyKaYPRHVAvsW9F2jmSBMaexExew7SLos+RPmQZ8zgd3Fxj7gCMobMnCkhkIRd27pTll8OVjR4ZEStSbczK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDaTGlW7; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDaTGlW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720189820; x=1751725820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3I9yvb/lGoeXyLMvFvFKeO76/QB3T2UThtROLJ1sWk=;
  b=cDaTGlW7KO6l6YF7cpBNOqZWx8efju0AtwaAVlXv/Cqs9h69gaSRjJ7G
   laVxTMy61dyX/BjLOsB13MoWsjyomCATwBHuVRd2RB7yJcnOnqfyIOWJV
   2pghP9QdEDkW45VgKT4S5ci66lVlmszeJ6lRTM0KAHbgQcgGDJeh+E7W8
   BWf9vGdoQTOlvWpWIGrVcMK5whpZczQdI/deIVkNmukb1u3Itrf89u8Qx
   3gDDhO2tNSgWPYQbNEz895zOuUF4ijdRnNaDvHR022KGCiIKWrne1jSI0
   hKq9urpKP2MkOjB9Ga8G0NNJpInEGMtwE04lNSyZW3dN+mMGsSGpsacc9
   g==;
X-CSE-ConnectionGUID: nAsXykBLQsSeGNdN4p92BA==
X-CSE-MsgGUID: A2uConWlSSuKEkphWK/67w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17131410"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17131410"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 07:30:19 -0700
X-CSE-ConnectionGUID: nKbpEdACT+mJgFpXR8XrIQ==
X-CSE-MsgGUID: 5lgz8CV+RpaDDyXUetnWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="51313979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jul 2024 07:30:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 07:30:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 5 Jul 2024 07:30:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 5 Jul 2024 07:30:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4ECnXj6MttsS43IxQbFBxPywu/tUmCcIi4IHE8iUOyBXUl6StwUxItezLoX/rSAlFgLKzIamjzIesqLDItA5pZU0yBYOkP4K3aYWpZAITsQN7p9Mw8+gK3mJSvAc5vavJAZOkkuW7eqaz9WSeAwQzGQLbtfqynX1hv/0XT6zsu0XmImJcYV+gtxvGfkGdHVIQBVTVgs9b6iSSyBUChcYmRjfs55iWwhNr7uhr5wHaz56Z0pIKlHYEk8RFfJgiw6QRFakNqTE/0FYcIZITGfYTyTvNcGt4b/2djsIeXueLQaZ3ELD2I6tMytl2zJbd3w+LydJdqIoR+sasndK9a7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U2sGMgeK3IDS+sduZuYgjNChEXPKyrno8mIRFa93lU=;
 b=OZA6U9pgEwWpjqgYH9UjfeJ3L2f1EIku/bnxuHt8TD/6UYr5d9pYk/zRsE0YUcwjscPloFyrXr/0NU5X5RdEkiYBuWJrthweWN+5ucHmx6zExIGj2zCj0Z6Z9Uj+Rw13PLueTzdW1YhHvUVrAqqjaGLnoq+p2XBBlXsPSbST4kccSpFXbFYWamRxDhYRM5jJZU3BhUTd05ELClDuUr2dLSdvzdZkm2mxSf2Y769K6Wg49pEO5tOBQGxuITjiIC9+gCMVAdsazjPBjPPTFB6E3bvwz6qL1r6gpJSaVgZ5ayG5qAy6JzUd+JGziJ6x6bBC1Z7ODMwvXrOnAFYuQKbOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 14:30:15 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 14:30:14 +0000
Date: Fri, 5 Jul 2024 22:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <intel-xe@lists.freedesktop.org>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 1/2] drivers/gpu/drm/xe/xe_gt.c:
 generated/xe_wa_oob.h is included more than once.
Message-ID: <ZogDbequBUxgcgMU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf88ffe-b4c4-42c4-238d-08dc9cfefc39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z8USmjpYZ9JSdA7c0P3VYDMWcNOW5bSgZ1NHT/pVKF5TX+zPFQf9LEAp0xkG?=
 =?us-ascii?Q?NpMK/ihTMGHm8oiBrCwl5o/qUOKHblUK85xfHLkbWp6uOlJGNs9QOhLdcbMk?=
 =?us-ascii?Q?TRPQiEw0mXuqE1lpr3Oko4ccZIDl/D4ZzI0E3fDtrH3jpqSEXrs1bllH1uju?=
 =?us-ascii?Q?XxsNGBO1d1nsxcQI8ErtLu2b0yKwzR+lf4g9JL5AXJ70bQ80uXiitckBc4f9?=
 =?us-ascii?Q?XgMsL3GXYat1f5uF+dY74YzgNGXRoXdCBpAtQ0d/w+nxrNlXkL4EGp6xEqui?=
 =?us-ascii?Q?UslfBZl3poh+uFAuILkI7ouqsqB6qFxaMHGyvEeh+YMVYsg5PsAplYTD4SQe?=
 =?us-ascii?Q?6aPGrtJag/sbbjdisUBLKKWlwt80D7Exu9hWFVw1TadExxypJaeze6p0Fr9a?=
 =?us-ascii?Q?DsVjykncQEenyiP+rMsLIDvpsQwF9siQ4/WccTo0WH6sIE9Pra/9pJHJ9Cjz?=
 =?us-ascii?Q?ClXycY0zYptEB3o+TmaFjsdFJf2GFX8B2iW/6v9y4Hg77BjxiPgJdZrcZh6D?=
 =?us-ascii?Q?0Wf4R7NuGFbOwY8HCqkGX3Thrg2guS9h+oFrb2d7Ar+PlVgYzLEwcyMgRVgh?=
 =?us-ascii?Q?he40mDXLDdTn6LvbAPwX2VoJVMd2XVVFE7HFOziio4W2BwbK1Vy0I+BPlu9X?=
 =?us-ascii?Q?YmxcWuud6iR4jE4tAeMduAXcRNvCBFSjTtSvDbHfpgRgn7X3la2zzQoSxbNa?=
 =?us-ascii?Q?gY5otJS5+afPS8LTkpV9cW/GcOCcvNnVVEU5Uh/Qm4WTrfaDekYi1SQ2JHid?=
 =?us-ascii?Q?oVPYtf1KHPN6MNBqzGZ+arwiY5es00Hg/QBOPt0Fz4XkkPeDGp0NtvHnHQ8T?=
 =?us-ascii?Q?MI5wEtwzwPRLKZ82U5VtgPMEQIz19EEmnfayHgKqsBV+T9WAeERevh9iMc9N?=
 =?us-ascii?Q?zvdvmwCVZGmbh3e5UAm71+JxSfYyU+aPWHqRR+kfc4h/86GAqw6bWivv4iqP?=
 =?us-ascii?Q?UzERbPh6C370Zw1saMcdIGOvs3SXiILSGFS+8gpU03T2hlsq2Gz6hGHOEGfh?=
 =?us-ascii?Q?6lmKIc8183zwNBs+2OlGiuPAyCGqG/g2pbdye2wbX/2RIdp+slGWOYJinN/S?=
 =?us-ascii?Q?Ztpkww6RWXri9zbj+FMwFWtthCoW06dEQxerfd7ByJUAVMZN4wtDPyJHYu+b?=
 =?us-ascii?Q?jDyVK2xqAWrme2jpCxRgfZKow/+8y8t8CkO80qp/3nFnE2GHcTUNPVEBc+SA?=
 =?us-ascii?Q?gTQfQl3qca1aNAtYG9AsT746GJbon3IuKkIVZkfrKrSDMyriiR8pyUgcGnbC?=
 =?us-ascii?Q?FX39Zj0GGGZa+RFCcL6/Y2BxdAz8+5g70Uy2nmEUyqCc+UQVXPbcjBKKQZKA?=
 =?us-ascii?Q?/mI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jM/g7CKbOgGGTuQeJJKWjofzE+6P4CYtD0X0cfcHDXM6Ub+qiVr0842jrMb?=
 =?us-ascii?Q?eeiYYcvXYxI2UyFIS+p3iIq1i2gLcd3VgZGsCpdSoimX6ETx8Kh9BXeCYRyX?=
 =?us-ascii?Q?kwFnLl2ir3timPSYbYp4jtCie1OVXXPwFr2A6BDpx0Tm+20ZYELjcTIcVvyy?=
 =?us-ascii?Q?bSVEsTtGWwIGc/eGVOvYWTTgiHCQphKX+V8l7r0SdInhedB9f2R/ZUHMswX3?=
 =?us-ascii?Q?TfyevQ9gF2k6CSv9u9F2omm/3Y2qmElu6iscOUVhsdeiRSDYyVlsDSgEVoU7?=
 =?us-ascii?Q?eb3YYyCMA4Y4FbziFU2o7AY/al0jqi/lHtnvtt0HBo2xQ059qstKrX+wfTpQ?=
 =?us-ascii?Q?uN779dw+I3n6g+JSdVjEqbJU+83WpM2s9lxkzvDIKVg20N67PtzTZ+bNgTz5?=
 =?us-ascii?Q?9XLkDew9z9I6lwMtB2/Ge3qfszZtW9Wb27lP+jeClGyTCVFCm5SoafTigbSX?=
 =?us-ascii?Q?E7BcRqsA7o6zPkWAqKtFJwxuuKF1Qxk4SYl8Snyc46JZjdfoH5cBN9rcm1pr?=
 =?us-ascii?Q?vDVHzoVI2ixXvazGMtJ2slxepaA/FHm0a8eIoCzDVZykJCzx5AM1V4tlMEPF?=
 =?us-ascii?Q?xFNtWiDlnzP/ekDh05XyB4lLOx4cfhBRq7iHKfbNtVbEacW80O2qOuksGQ0Z?=
 =?us-ascii?Q?JzYZlfiLBdtrC2FibY8rMoraqV1GxPZdfU0U7RgvznfNeUEZ0gfFrLCfEM2p?=
 =?us-ascii?Q?Tsjdo1bHDu6Kaokz/mPYoj8mNcKZcNT6U9KxSMtwT6ExfgHevxgxcJSaPKNX?=
 =?us-ascii?Q?LeLplWVB6SXrKA+W+s9W5t6tIPCwmCCOXSx2lbI+AL7EUfaychjPZRvkS/LJ?=
 =?us-ascii?Q?JJns0iFoyAb5wMuzBBehCB2RzrAzIMDZN8NRCVW78K789XLtoH6WMzBkNtD2?=
 =?us-ascii?Q?o+niOFDI0/Pi17UklNLunlt4wWhoF49Nz1o3dk28YQVXKOaRMJNYoajUOwxv?=
 =?us-ascii?Q?cuTmpMfGC1uCsDD3iQ6Sy51oMSqPIYmztghnYm29KyPEJJsLAYKNrcNpMFuE?=
 =?us-ascii?Q?yFi68kOcshcA3HDlKikBcruHg7B1qXFFwgWo2OBJ0Mmskk//TIAgf+oZED1Q?=
 =?us-ascii?Q?LZ9zih+dJrdSzv+7ovG88PKVkSCdcMb6Ew1cbO/NrLraF3PYnEZX4UNEtEl0?=
 =?us-ascii?Q?u8tVodhSbzuwrhjztJvCzbYXq7tQCWLX+4bzDOlXcvegfUYCrPEe2xnwiL12?=
 =?us-ascii?Q?nyf+BSjPu666cX+wLmTsE5lgo0HfmSpZIMbuIH/LrC8cTbx90x7inSWIfhUc?=
 =?us-ascii?Q?dS0NRS31RTklKwgffEBY5oElFWoVIqrn7tqiLo8Z9oYvaL3aMzEDQ+P3uqhU?=
 =?us-ascii?Q?Kfr3ApVlgmp6D3nHB6oyvf5edSQ3qAaWdWtTU2WF/jwFmA3g+IWPDNE6lg+E?=
 =?us-ascii?Q?4Q7qQkj35zsJO7ZoYb2hjUqYVaTh34bpz5rv+JzPH0fcXRsRFvg/K+mndbe1?=
 =?us-ascii?Q?3NJgeyurYidJ8bNvShl998khNwct1VHmXIIAOuIeAX1t8Dc7mUXMPmH2Cz4Q?=
 =?us-ascii?Q?N8BGO3aJC5WH2orxEMwFUQMDoogjZ6CzNqcvfQ3D5nTMKYVSaZwG3ELX/poI?=
 =?us-ascii?Q?tT4eanZJTxtNWUdCOg7LF/cAt0nuvvszIbytcN6JgYx/jkbalXuzB5q676dw?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf88ffe-b4c4-42c4-238d-08dc9cfefc39
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 14:30:14.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQbfpIoO94Pi1KjFuzhuUQxjWbDp/sdTYVGsHnq+mr8CkptH2EW3VbStelinv2b1BCFLAYbeBgBudGkE+/uN5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   c55f79f317ab428ae6d005965bc07e37496f209f
commit: 01570b446939c3538b1aa3d059837f49fa14a3ae [1/2] drm/xe/bmg: implement Wa_16023588340
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407052122.AzuWSPuo-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gt.c: generated/xe_wa_oob.h is included more than once.

vim +12 drivers/gpu/drm/xe/xe_gt.c

     9	
    10	#include <drm/drm_managed.h>
    11	#include <drm/xe_drm.h>
  > 12	#include <generated/xe_wa_oob.h>
    13	
  > 14	#include <generated/xe_wa_oob.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

