Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4AEC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445700; cv=fail; b=fVbN0fF61gy/BNdi2Jm+GfmQz6HBf6JYsw6KU2RptoJ5gq2LzZBgOrOEdaDC6xHh02ZFveqptxx5iXCHVtZ3koY/dSVn/QDPencG4ZRiuj68LA0qaImLOCEnnpZXxqpwGtU129rbEB2U8Jq5uVOmrA1nMKDCsYSiSF/mZGb/zGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445700; c=relaxed/simple;
	bh=MNKMrHhnqyKNQeBBLCxog0GQkdgFom0sGJfoNb/hk3Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ai8nia/QPJ2sR8OF2VdqP4PFFbMkrxTS9oJegia9bzSF2dXYj9IpuymHBTC4mpyt9zCe3+so3i1//vUV78QZouKvgVCNU/rRFZFsy40iXuiJ5HBpOsCSrv9XXZJS5848pJr7xAL3Ue/BgHQpmwnwYKhSaMzTPv4FNVT2trUeKvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCi+3G5c; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCi+3G5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445699; x=1758981699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MNKMrHhnqyKNQeBBLCxog0GQkdgFom0sGJfoNb/hk3Y=;
  b=QCi+3G5cXXGrN9Ix6CRf42pQIVE7Vh5eiXsXjkldl80pKEQxlPyoPuty
   zKdDUkiXPWgc+gRd0OjK79/oQQZUxVqzE3R3+gPSk/Xukp7/6kFWY96M+
   gGNQ/3CmvVqA67x7gJQtAnc/SFpL5Eqw+jsuNTP/OXTwrRbe5AQdPIgxR
   zYqVa3PR1UMPraSNO7+j6FhIVjepvpjovzmnTKXk7pLtw2CM/81NwijKK
   3mhpYBROrXdxbT4rd6E/aVFR7idz970MTaZBehfWNImXYpTIsrGkHLX89
   pc0EyU6b4bLl+74CfNK8BwT6pwzr4djosc+TQaeGlZUs6iQEKmYJQBcs6
   A==;
X-CSE-ConnectionGUID: VkrZRSk9RMSXiGZbhMGLRA==
X-CSE-MsgGUID: 2J8pNN/UTQWtzuQCByyiRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26763178"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26763178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:01:38 -0700
X-CSE-ConnectionGUID: Dxa0y8dzRGyoVCJTuc8ssw==
X-CSE-MsgGUID: h1l7vnhpQyuujZivhda49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77486899"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 07:01:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:01:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDkyb8Uz/C8VAegn7qH8utO2FDQ2fhAynw6sKo24PQICSXRxnr6Hwa1wi4oxaBo+K3+w4wfAGyRDI5RjH4yBS+DFgxNK9qFTF0ZRgN9XDelPaBrMOVtfiQUvTHtB9aDyysjlYumy0PU4p3kUuBnjIsanjSk7oGTRX903ADqV/M06f+yZrRIeTrCgL81sbLftyjDLjLqckFP8dO3Vo5DE5nWtEpqwsVL342pzZpm9MFPErN+5T8VnFNSuNbyMfr9td5dEELHyyj5VmSEs7eTAjOYJ6hxCgDG6dqd7r/To3RAY4aMytoFi//ASGTxNqhx/YMKYDsZMB3wopu93VEeKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wuw+7PrlZ+uzPgxd1evNy8w/B6wmlrTyKCoVXBr0KGE=;
 b=t7TR7KXDdV2phV78I+ENIL03oDvyibMUU0rtDuSRI0bq0lL/aV/ej5NGdTMDC7LaHiElrgL1gWfjj3hMdkaMs9nKxmhoRgcCJIk1QhyJu7Ms2MrvX+QWAby6QNW3l+h6AT0x9ZG8vIsbwfNWs5zh4L1yy68LqaHRUqSs4XZ4fk5c3BeV0dUSAT60sJsZK7/dwmbPP8z6EjaafH7qpFy/5pp1ldRqeTKCQN2+8JJLwHTgDf3vuHbT5qhNn4nu1p90oG+VZR87TyblNgRvmtBOXI1luzIflGgqB6u+ByiiVtxbXUvkIqiMRLL2gTIaGLQGN9zo/8apJLfOyVE52dHB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 14:01:32 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:01:32 +0000
Date: Fri, 27 Sep 2024 22:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt 143/30000] mm/page_alloc.c:295:30: warning:
 'pa_lock' defined but not used
Message-ID: <Zva6tB0IxCvBIS8Y@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: f20274d1-e3eb-43bc-f95c-08dcdefce443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z6SW5A4rVjhut7rn8ZsSNkU1Vq0OquTrM3XHhdAxI7M9L4u6Hxws8pbP1gP1?=
 =?us-ascii?Q?FKXUhXm+zM3rD+QFsFVPy9sPP8C5s1w+PD8i+FhPP5b6kMvajx6xIsE8kub3?=
 =?us-ascii?Q?ml0IlTEu8RmJVomxcGU8TYcojdutoyvOKJDhGgf99rIXaO2KWXykaOW98HMH?=
 =?us-ascii?Q?fngHXyUmhGoITN4JTnNlrHURaubmQ2YRMniJ/x357ALSq4K7VuWsZOgpAIKX?=
 =?us-ascii?Q?rLDW6FpjiqO4ednBLJpQHoJPa4rlpYbgJhi/3JD05duoFNxoP+KAqjHOnm8C?=
 =?us-ascii?Q?Kf2+/PqRPLhaT8g/ox4oW73tCybBF5m80mtXM24HsxXl/wiO8ZcDIJMhhJZO?=
 =?us-ascii?Q?WAIYcDz9iU5yLsppfKpCGJkHn1khehV4KmAK3Z3Zmpnv9610IWvX9r5GQNsO?=
 =?us-ascii?Q?88X6tNYhVlHeQKrYgrO4lqw0cmeIlCGKdAey7bglxLBqKgUXyzM5WI7tHotM?=
 =?us-ascii?Q?UKfqFE5P9Deb9X7YLX0z9ln8HJJuw2r+pnj6ko9Axy7/hhq6j6jpJQGnkMvZ?=
 =?us-ascii?Q?LqR4yXF6Gcito9+9vyEnRMfIXCCsoaVyYu43SHi/utPH6nZBD4MAitVQnpb+?=
 =?us-ascii?Q?oQ11VsqCaVrocwMcFHjG5c22JAM2a07R9ROlcSM3I8BU1bsN1e65GzNQHS79?=
 =?us-ascii?Q?hR44rkfftAh/9iQ/KCgw+CKlrnu6DIKwHFflcgZXr1IgCkfBNQbSjKvbtmJI?=
 =?us-ascii?Q?+FKebIBcXr0O5SBOqI6SinSU16r+TBIf3ZjcubWwYSae040cVyUrnLPX2YV1?=
 =?us-ascii?Q?QJs+/Tvb8r7awdZE5zATGzFCotJfKUZjWSVP1OnmZ+BGORO6p19czOlL64fi?=
 =?us-ascii?Q?Ar6lvyakXMNsX6wTBKSpcWOVrEe8fwWPzTMsVxMO8cBBEvb2Jg8AdftTA4ki?=
 =?us-ascii?Q?JMmQW1EUunGNXcVAxH1WnLoaQVxaaIjPwPIn3joGvIng2RcqNSsvOKLcgDxa?=
 =?us-ascii?Q?ilXn7/WWGJz8mA2/N+hWZU8iKV9CNBc5zBJH6tqFOnsO0zUXAWpvBRECwKFV?=
 =?us-ascii?Q?HOqfPhAgrpfRUrQ5nTVCP/gGzY3gVsy5tnphpHWR0mfrkiauMFuRhLdHRm+M?=
 =?us-ascii?Q?5o8ta3mm2GNctF6s/qm70g7t/GCr8vIAsNJHfHxqtk94Jk4ThznpGqwn9ioG?=
 =?us-ascii?Q?KhuamvHYSPy9OQysSU9Qr43S0pNdgSJ8LRTaEFtVfo553UAtOy19iEiMbu+C?=
 =?us-ascii?Q?QxcCqEdMTmhKIevAqJLlZM4XRvTMDmnzZ44RriCFzSn7cTjEsGE4D4qt3Wc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RTMfIvNS+uxBgs2W7K6qg5gjRIIS2LzjCLuZF3WzO1IWjcHvyp5WQwGdTLye?=
 =?us-ascii?Q?IHPCGUd1+gUwLFlMgw0PXhykAgC7C4VlKryELwtb+wX6aPkPmpioQUXsvbap?=
 =?us-ascii?Q?HLIP37L0VaH+AfsDFuToV+vXxt8k6FqRdYEpvKc3uSbfACtYGZtPVD33ZpRU?=
 =?us-ascii?Q?+HLKDV9d7hHVdJxpvEF9lpFVtzmfQ7JZ+HX1/CDkdP2hHXY6eFa1g3afIt44?=
 =?us-ascii?Q?AnRvigoXRnBZwPQauc9auffp2ilSwYzaNzIhwDYj0D/OtczFC5KJ1H7oGC70?=
 =?us-ascii?Q?Hw+nI/k1bUswUp11brBviWBKn6YJw6Ik9KvO0pRuNA7+T6u2y+6iF3seudBU?=
 =?us-ascii?Q?uIuY4c4cnay/qLaSODhhbqeFv6ddq6ZpsT77xsLhodZ2E9EpTIsc+b/kjXhE?=
 =?us-ascii?Q?Vpn4H0MXN+fOaw8odEI3nFJTnpoBcqMABRMbutnl7aXuKAVcT2r91B6BDGSj?=
 =?us-ascii?Q?9ChMy7V7T4+uowO+JmxDJ06wNdi+zO58QwdrOURMb7/U/t+lQAOiyEZiYFlL?=
 =?us-ascii?Q?vvr/nrhUG/CdPynQ/Dz35aLFtfksozrxy1fFCA42O8fnWZd7geet/JjHeMVZ?=
 =?us-ascii?Q?UC482mltcjj0aRoWs49pRNovN6CeToO5NbfKM0TgyaVWJPf2kzDru73R4EmR?=
 =?us-ascii?Q?rZUxNsfMsEZl7+XobCwWp6kiQ/qpiawbjslcl+Z7OZAAJPBwCjwHvLPm2exf?=
 =?us-ascii?Q?KrTLZUc4IrBhswEkz159qzY4OMpjIqVXCFSFfcxc3e1jo+TPUnTk2wA5VYT7?=
 =?us-ascii?Q?IMFw7ofCaWkY1Jf7Izqg5j13Vfgn3vReS1NEK5uaNNJdujLzq7ycfDhQsKR6?=
 =?us-ascii?Q?m1k7WDMzuq+/PfnNAGoZtQjZOxH75L16geFgyHUo0KkTIjMCNPv/EGunt4Yz?=
 =?us-ascii?Q?Yb0kc+5zOMgdVZUMU7NFwkDXdUX74B+ga2mhTDqwxvpTV9bM/DCWg02bxG7M?=
 =?us-ascii?Q?5pRuNTtvgweD64iEpqo6JqlMa3Zg2tWSorKx+lOkQugfo2eOL/vv9xDtkVVK?=
 =?us-ascii?Q?9ptH3r/q1zIgnW7afragPO4pDsuyLOdy2bHZoTVwLwC8ame7s6hljMSIQ1ub?=
 =?us-ascii?Q?xf2K80zofDD3z+IfuYwh4l2M9U1X1RtMJLkQIgm50yd7higINBVAu64mt7yT?=
 =?us-ascii?Q?ypombVS+ximBqV3vZEkDTRL55Cf6Ut2t6Nqjiuut606WS8BbFfQVOpNQ/ERY?=
 =?us-ascii?Q?bJPsu9W3ZwtumTNfp6Tr8WwDs4HRDPE/apFdCsUlSE/w0c6fYMI6KKxd3TO6?=
 =?us-ascii?Q?IsF4yaQmxdZQh2qG9kor1UkkDyniRwRtjWhJIASQKZP4FKbpR06FfKWu2cHA?=
 =?us-ascii?Q?sMLF252gi1bxdc9wOYNY90dYt/aQs83b301toPKE6w4V7tmE4GgEgeinvz7H?=
 =?us-ascii?Q?0rN0ZwBLFk6TGmPyc0TsW/vY+L/Z7xsZL6j7S3igw/R5nF1RncDG21Pkctbd?=
 =?us-ascii?Q?zJsWbMvV1U/PC4rSKZGUMIDcOy6Tto/kbIlHq90H2/sIh/3RqHR5s6ShsgXM?=
 =?us-ascii?Q?o59BZgs5AjYYyXKivhgaZm+fPL/22uNhVbvrK7JFVLUKE8M1jfvoZLkMVnF8?=
 =?us-ascii?Q?AHeUYguMK0NYOb4zqTrU6JFAOywM6uYoDEpP4wUF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f20274d1-e3eb-43bc-f95c-08dcdefce443
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:01:32.4240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLfPStXzd9cynPNOlT6vzDxSyz6gxMHCooHaxZO57ktrLQqEvzi3I25335pUzjaRWX2GGcNBknjIo9V/C2i3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 6229d1db10c8d1a57b0a927e996b78bc9dcb7bd3 [143/30000] mm: page_alloc: rt-friendly per-cpu pages
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261542.9A2DlXpU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261542.9A2DlXpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261542.9A2DlXpU-lkp@intel.com/

All warnings (new ones prefixed by >>):

    7148 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7150:9: note: in expansion of macro 'adj_init_size'
    7150 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7151:9: note: in expansion of macro 'adj_init_size'
    7151 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7152:9: note: in expansion of macro 'adj_init_size'
    7152 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:27: note: use '&_sdata[0] <= &__start_rodata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: warning: comparison between two arrays [-Warray-compare]
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7144:41: note: use '&__start_rodata[0] < &_edata[0]' to compare the addresses
    7144 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7153:9: note: in expansion of macro 'adj_init_size'
    7153 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   In file included from mm/page_alloc.c:63:
   mm/page_alloc.c: At top level:
>> mm/page_alloc.c:295:30: warning: 'pa_lock' defined but not used [-Wunused-const-variable=]
     295 | static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
         |                              ^~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/pa_lock +295 mm/page_alloc.c

418508c13222dd Miklos Szeredi 2007-05-23  294  
6229d1db10c8d1 Ingo Molnar    2009-07-03 @295  static DEFINE_LOCAL_IRQ_LOCK(pa_lock);
6229d1db10c8d1 Ingo Molnar    2009-07-03  296  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

