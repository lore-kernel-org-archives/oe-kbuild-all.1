Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF2E14D6F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735980953; cv=fail; b=afGBj23LdaqE9OC9BjXwqNo1TaTUQ+RwCm7ZX/cRx1J8kxGLHxdUBASkc8ljj64J9nKuxjVv1Wl2QdcHE3bFL1Su2P/9ySmw6JWGTCzDPhH/oPE46jHv8RjW+MnoEPTQQ2DVKxZYtKtBMUza6Cu9RSHe2m/p1Azce8y1urZDoy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735980953; c=relaxed/simple;
	bh=TCYqJ2lVSLv2sHa9b7GTXthsB5Acp7F/K0vVogMEUFs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m8gubrXPMbC1+nQlPfFQo7iFQaxutMYNpjc3gx8ST+EkqENrD6tyGudO9DSe/Q/fsH2yIWDkCAqKjQrNbuaNpMQE0ozR+O5+pGQLdffkzDk98qfbRmH1uh77AQEsLUqSeu9ALIAzrxeMSdYCJDgZH9cljwGGMmn2jkH1RWEWZf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gI2bl/8i; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gI2bl/8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735980951; x=1767516951;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TCYqJ2lVSLv2sHa9b7GTXthsB5Acp7F/K0vVogMEUFs=;
  b=gI2bl/8iohxxHX56fMFKvdnzezLo7DP8trU/ADiLKlcnVcgeZ/aEA+rF
   BlyHSOdHKcRPn3/LZADDTMecAenfkMj64qEZr79XZm4gOgbnBmMsrrh/t
   s1NfajRy7ktEPUmVqy99/szB/psoqOnBzU/sAiPXUIUq5U8tdogo0KnvF
   nJFvv2Q6XuXFsotqt3bSyCk/ehcC4xXh3dWmwbERppw5/1kQ2IGluh/Ae
   r3cz2m40DHaFuhe1gVMsw7QsraixdLpHRa4AAUGncUlbfnHDpBDr9Pg83
   RsKEqf3KKbWI7lFPNoVZEtAvPFEN5E9b5Ng9A/IU7hkOLHzp7ZtHowIAd
   Q==;
X-CSE-ConnectionGUID: oh+GWvZpQeupUFQw+r7vEQ==
X-CSE-MsgGUID: uGPgjQuGRHmI1ug0pjv1Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35449391"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="35449391"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 00:55:50 -0800
X-CSE-ConnectionGUID: Xd9t1zQdTe2JD9mdeM2Pog==
X-CSE-MsgGUID: ISMo91U/Qk6HZFvqugzTSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102850964"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jan 2025 00:55:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 4 Jan 2025 00:55:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 4 Jan 2025 00:55:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 4 Jan 2025 00:55:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6rzKdueBA0zt6RfaSDFrKRCnYaUtdYhx2rJ7SS3OTbkXTv5/MU3hnxIfGnWaDu8VabFwDiH+WdNW7iL5KUgxum78iBoBKxCMrs3yvUyCgJMn9Utv9rOxCzlYJ7p+oaJ1R/51n/xxYE3bqkJ3N9Ade4cEfolkdT3GL3B7pRhexIB46cSPz2LVsh2+n3h3YUuIDxnj2F15p1HO89zMdqJYw7j5BFqemK59cojzuM6APjxHRnZRlfRPMWwwWLdt9QoCFZWC1Ko1VDP1B8XJER67I3UKhQnDtB6kFT2yGfaxcf3+x+So2bWK9O1KqC1QO24Z17tci6ShwMfcTdqNsTwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYhglo1xfSUVtyPoRbO4r2o/7jb8qewu2IDfmH0yTB4=;
 b=lUdS65Dm9nk9PcVV6rrtJwLuNL38XxPV/lt839Xuo+VQlVCs6xWEtMfKWCpRbazAOnJVSm9YYRn6QrT5F2OOTeb3ZH3fHvPs90iyMlDwDKMr/CfngHZCNDjV1c5ffxgNId/Jh4fasuTVPUMsuybMq94HUtj8IaeLDsBlDeWQNSly6l9qCivt5Vt+fOE9k7oqEcpKvSJp0yE6bp7VPNnGv/vHlEZAPIDo+b7YIHNwHXdRWY9UFQ50Yf10Q0Z6/O2wbOqmuchPBT+2vu3ers2MjWTjLkgTxex9yZcwEmRtTzeRReDtmUprr2B6BdfVGrgyh1HctlpvAts+S8hxsz/1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Sat, 4 Jan
 2025 08:55:38 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.013; Sat, 4 Jan 2025
 08:55:38 +0000
Date: Sat, 4 Jan 2025 16:55:28 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Masahiro Yamada <masahiroy@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
Subject: Re: scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts
Message-ID: <Z3j3gLrRE+I9MGf/@rli9-mobl>
References: <202501041653.ehAbBy13-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501041653.ehAbBy13-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 5367c7b8-88ed-4731-8b68-08dd2c9d8f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e2GEXNlUHWlmi3BwT6hM6vkr9GKWCHH/XFclshxtomp4luwuAfmZ6mfY7UJ3?=
 =?us-ascii?Q?KBxa+p9cRzIp9cJAPr5tCoElx8KG3Xh3TFs29fZi5JWRLllxE0WKe8xctB/X?=
 =?us-ascii?Q?M99tMy63O2P60aoRDeaT8icGOBSigArO6IhFVEPmt1CtaOMmoc4nBiGsmef/?=
 =?us-ascii?Q?p3gXLil6H7cTWf0k/DdWcU2JzUqIlYXjAhqnJymWzhpUi//+MrZs9EsO5bme?=
 =?us-ascii?Q?BFE1q6Fpj3WGcxz1lDsADZVWQ9tDU8tmuWSISvAyhspuSxp4nuuJ0sGfYw8K?=
 =?us-ascii?Q?YHEVO2DjiXDx3a9ROGNli9ulWUagD5V+zqdNBfXopRcH4dgBy58gF/RDts38?=
 =?us-ascii?Q?qnBf679TtK6rNT1/HkL3R2U2db9SQO1DqNUSvq3kX1d3Hq5hbGjLSwKcSQYJ?=
 =?us-ascii?Q?ZUU1NKFiU4W3DJHy6Lj4SgCigQPlQHhje6UrJ7d3knlLyGeRMTsjDw+y3jKD?=
 =?us-ascii?Q?4/ZFz5V8/svqQppaog3smC8gWNDZz06hTywbyCyY+499UjUBGyc3mKdMlIrH?=
 =?us-ascii?Q?sX3PWmmtL4TCy1V8hMI66Wq9E67y8Y11i+lRwwfvnSc0EYr/BdUKrOK+m6qq?=
 =?us-ascii?Q?eQj+5iV1jQX1Fiaj30mHCQjjUkHHwmSGGO8+MzGC7Q/8nsqLd145nic0JQMK?=
 =?us-ascii?Q?+lr6kWqMg55x2GLoGr2NC5IYrEIxEDngGPNbbZKiQoAsxNHhrXuaDBqQjdt5?=
 =?us-ascii?Q?z75/vLdb6IK4/rVGwU5andgszYP6AhpZ7z6pBc/pruOmtl3kZT5R0xCFouwb?=
 =?us-ascii?Q?8YDRz1TVL7FcJ/4N4zvtfbZqV68f8D7knK+4dLrgkVfYMadk0Q9pnCHaB6Vg?=
 =?us-ascii?Q?Cm55BcsgAU/2KPx2rc8kd4w+4rbjmNgXw0Y2V99jv6xA63m2oWdPGEEmkeNC?=
 =?us-ascii?Q?pLcrS+rzzf0NzXXyksSOcq2ZoSnKkODjcNfOskVl5QVVCPJQ1WP+rJB+FNSf?=
 =?us-ascii?Q?i0zhtxp8BwX+zpDzGzT5hyEUSPc+9vtVzp2CUjqo4ro2d7QinZBm6sCw9bgZ?=
 =?us-ascii?Q?MVHuSPrM5ssRDG825iZr4q+GGoJ2Ipk3Xpu1DrDeSeTasyYCDiokT+q3DT55?=
 =?us-ascii?Q?uyGAio3QKF01kTpMkXd6iZeFGhSqoqABsPx0ug42f1+jGaHznsH3cDhG+5BV?=
 =?us-ascii?Q?gGwXYs9K5SCglHaBLMw4YKTjaeaHjvgCJmFK9a2KTP7ZIxJcuuSKnfI9An8L?=
 =?us-ascii?Q?XZq5fEDLrdmdoeipapiewh8EQ/qGrIK0Cu/2gweqJAt1ajLspcX3t3EQ+vE0?=
 =?us-ascii?Q?r7n0cPol/Tac/iWhbjzigDVU3XTpjmG4XXuYLjDoXUEO3dnrBRMNi7/XvKIl?=
 =?us-ascii?Q?MjdLFBNgF4xpOv0IuBh95IsQO3C1Zyv+Ysgw6T2qc7R7Zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFFDDU0OZ2dOATd0rMiiA2KEEUlYotncR2fs8GoVfykCdptGnLw4+gIAauzY?=
 =?us-ascii?Q?2sOG4d4ReZDcslQ37aIn+WHF0GNHa40LPnkaUT/wc950GP63BzGMtFKxhaI9?=
 =?us-ascii?Q?7OojHVN7H7axI490e8JuR9QwLsfk0Ex0DuElvHboI1G4r5NLUdQ9EqiRly+2?=
 =?us-ascii?Q?dhKCroQkgpu9b+oIsSrSVnVPVNe5bA5r91I2H1Jz8HFMWwIgI1RM+KHg7lPs?=
 =?us-ascii?Q?D+Nv26gZecES5MAeZrR6FJRGdr/L3hTvFA/dexfSienvU9UwXjs/7V8KE7Kz?=
 =?us-ascii?Q?0CZXpW1BZ9Tvk6Nnec0DRQ8RcbxjwocggdJRUC69Dp+VvBgIKYTeW+eFJWMd?=
 =?us-ascii?Q?yRNGpG3Ev2q9p78qa67M104FO39Yr9lN3elPzQIZTRlBF2ih5yAZ/sVJv7x+?=
 =?us-ascii?Q?fN8bYgDxYPGq3HqGhwGkgK4xges33vvF4zCKsi0wHbEWOmMp1TstMRKeptBY?=
 =?us-ascii?Q?0eHjeXRq/RAxUls6TJRwaKYtmMxWRCjN7N9KwElrDAlJDtYKX32olFZ3UGhy?=
 =?us-ascii?Q?g956vqNIVx8zEerbh5JfyuoTX9vV2gsKfgpPfwdO05o3T1eezz8UKB2Sa32o?=
 =?us-ascii?Q?hK7Ba80pjy2gvHQh19zOLjZaOtfIDnSGEyTLu4tFuQpvGwC6omoxTx3+GCDh?=
 =?us-ascii?Q?w7JxeN8h3bGCgCfh5MWZE8JHeKj81fbrO7MlBi62lAghOPJlJEqQerlQ3Iel?=
 =?us-ascii?Q?pFvA/PhHtKQB0R+3RrmGyesfFKBl7Q7OKWi9aNRBTdjgvmEiZl/XW/aYuUIO?=
 =?us-ascii?Q?jw05Uh86+ETNqWfKcbpUNTUVbwiI2GYl51ZSAvNcGR3y4WM8jpBiEZwvPAR4?=
 =?us-ascii?Q?xcIzivlxoCq+8hXlyQMsxqeKr98vDNdKB2SksBqF7OUPSI3QRlOCmD9o9xB7?=
 =?us-ascii?Q?vWXGCt+zzzNsrbpbSkGCEXmM3tXeIa5VKkXDPPogFzAqd9Y4LxyiCxpYe7EY?=
 =?us-ascii?Q?ej42z/cKTmt/4LwHpRIzpM8IkgiLrCE+VKDLF+kV4hn8ilCKGDhKl2uPVdIe?=
 =?us-ascii?Q?nZaxfP/qs4mxWBRocshZcQKan2FZZUzLWZK2K1oGYIyYoO4N7qBniaUH8DhO?=
 =?us-ascii?Q?fI5e3rh5CymEH6Y+7oAF6ZHy54YKkPVTnFwMzkcMPOe5ZnkUXKgRuQhCTBzs?=
 =?us-ascii?Q?+Km+Me6Yji9uOOC3XF+JYrIJWkmhIbOg1ZSsDds9shBTtzCC69MDh/dUnI3m?=
 =?us-ascii?Q?J6721Yxl+cmUgSo7fr+eb8e1WDrZ17+6InS11zt8ti+5QQDVtWiz20knI6IS?=
 =?us-ascii?Q?0inMjgbHGilobz5UlGsK3kTQ01CTvBeNZATu/lN+eM2kIACog92bpi1WLOws?=
 =?us-ascii?Q?u2CcOb6jTl4Zxghek2T3LKuwD/wY7eTvTYPZ+7Ms6h/PHXsMtzJYFolM8jC7?=
 =?us-ascii?Q?k0jBfnRli7/GhohuUvBbyXZ5m7nMwdvLmCeV4A6/wpz7V0cdIaDp/b1CtkTF?=
 =?us-ascii?Q?0Lhx63y1w06FEiB0kkwHcmGjwQfjMuAQHAPNq49Qtw0LUxegwKTfiQcc05qX?=
 =?us-ascii?Q?Aqf6mfpMRWyOLgAILfTSEYXD0R0QyqSAuUU3olVa3izcwIWVjZbKNHj1i/Hw?=
 =?us-ascii?Q?reIIXBeooa0xyNwYknbg3x4WqK5bd59aB6L0NNgB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5367c7b8-88ed-4731-8b68-08dd2c9d8f25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 08:55:38.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLMjtnuQwJO2XFl6wY2XfjYm/pZrYPzgr28mhHeYh2yPe/Adal57R7dS4aRgnOfGu2pg5Ex+Cb+CVNSbbKqs+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
X-OriginatorOrg: intel.com

On Sat, Jan 04, 2025 at 04:38:11PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
> commit: 1e860048c53ee77ee9870dcce94847a28544b753 gcc-plugins: simplify GCC plugin-dev capability test
> date:   4 years, 1 month ago
> config: i386-randconfig-002-20240720 (https://download.01.org/0day-ci/archive/20250104/202501041653.ehAbBy13-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041653.ehAbBy13-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501041653.ehAbBy13-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Kindly ignore this report, this detected commit doesn't look like the first bad commit
that leads to the issue. Sorry about this.

> 
> >> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> >> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>    scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> --
> >> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> >> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>    scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>    scripts/extract-cert.c: In function 'display_openssl_errors':
>    scripts/extract-cert.c:46:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>       46 |         while ((e = ERR_get_error_line(&file, &line))) {
>          |         ^~~~~
>    In file included from scripts/extract-cert.c:23:
>    /usr/include/openssl/err.h:423:15: note: declared here
>      423 | unsigned long ERR_get_error_line(const char **file, int *line);
>          |               ^~~~~~~~~~~~~~~~~~
>    scripts/extract-cert.c: In function 'drain_openssl_errors':
>    scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>       59 |         while (ERR_get_error_line(&file, &line)) {}
>          |         ^~~~~
>    /usr/include/openssl/err.h:423:15: note: declared here
>      423 | unsigned long ERR_get_error_line(const char **file, int *line);
>          |               ^~~~~~~~~~~~~~~~~~
>    scripts/extract-cert.c: In function 'main':
>    scripts/extract-cert.c:124:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      124 |                 ENGINE_load_builtin_engines();
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from scripts/extract-cert.c:24:
>    /usr/include/openssl/engine.h:358:28: note: declared here
>      358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    scripts/extract-cert.c:126:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      126 |                 e = ENGINE_by_id("pkcs11");
>          |                 ^
>    /usr/include/openssl/engine.h:336:31: note: declared here
>      336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
>          |                               ^~~~~~~~~~~~
>    scripts/extract-cert.c:128:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      128 |                 if (ENGINE_init(e))
>          |                 ^~
>    /usr/include/openssl/engine.h:620:27: note: declared here
>      620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
>          |                           ^~~~~~~~~~~
>    scripts/extract-cert.c:133:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
>          |                         ^~~
>    /usr/include/openssl/engine.h:479:5: note: declared here
>      479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>    scripts/extract-cert.c:134:17: warning: 'ENGINE_ctrl_cmd' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
>          |                 ^~~~~~~~~~~~~~~
>    /usr/include/openssl/engine.h:450:27: note: declared here
>      450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
>          |                           ^~~~~~~~~~~~~~~
>    scripts/sign-file.c: In function 'display_openssl_errors':
>    scripts/sign-file.c:89:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>       89 |         while ((e = ERR_get_error_line(&file, &line))) {
>          |         ^~~~~
>    In file included from scripts/sign-file.c:29:
>    /usr/include/openssl/err.h:423:15: note: declared here
>      423 | unsigned long ERR_get_error_line(const char **file, int *line);
>          |               ^~~~~~~~~~~~~~~~~~
>    scripts/sign-file.c: In function 'drain_openssl_errors':
>    scripts/sign-file.c:102:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      102 |         while (ERR_get_error_line(&file, &line)) {}
>          |         ^~~~~
>    /usr/include/openssl/err.h:423:15: note: declared here
>      423 | unsigned long ERR_get_error_line(const char **file, int *line);
>          |               ^~~~~~~~~~~~~~~~~~
>    scripts/sign-file.c: In function 'read_private_key':
>    scripts/sign-file.c:142:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      142 |                 ENGINE_load_builtin_engines();
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from scripts/sign-file.c:30:
>    /usr/include/openssl/engine.h:358:28: note: declared here
>      358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    scripts/sign-file.c:144:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      144 |                 e = ENGINE_by_id("pkcs11");
>          |                 ^
>    /usr/include/openssl/engine.h:336:31: note: declared here
>      336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
>          |                               ^~~~~~~~~~~~
>    scripts/sign-file.c:146:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      146 |                 if (ENGINE_init(e))
>          |                 ^~
>    /usr/include/openssl/engine.h:620:27: note: declared here
>      620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
>          |                           ^~~~~~~~~~~
>    scripts/sign-file.c:151:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      151 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0),
>          |                         ^~~
>    /usr/include/openssl/engine.h:479:5: note: declared here
>      479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>    scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
>      153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
>          |                 ^~~~~~~~~~~
>    /usr/include/openssl/engine.h:638:11: note: declared here
>      638 | EVP_PKEY *ENGINE_load_private_key(ENGINE *e, const char *key_id,
>          |           ^~~~~~~~~~~~~~~~~~~~~~~
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
