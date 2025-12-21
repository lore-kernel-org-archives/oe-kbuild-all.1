Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AF1CAA78
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333642; cv=fail; b=bTCNrk94Z3Nqn0RslmW0fXxxEDGE37/0IliqN/8gT6kuLazOf7qnlOcJhWYz4sqz2joxJ4WJFcMSU/sMoeZV0rpJyqTSh3oKCGgAG7X0Ii/VLqkPoedot2sn94n1+ws1sXRiMXgqgoktaqJReB7IcQYYPL1t95FOWzeRVD1HBA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333642; c=relaxed/simple;
	bh=fqow+s34I4t2AKNHswHPiguDJ46MclItZqrT3IjzzaU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BRoJ9Fdt2mTQkBqKlK2mYA885byMEvge8RsUt9BGvg679CdMOvVs0z91WFVWCKCcHe29pBccZH32z4p7RwowcaZXSkpGva9miZj5e8nqEp+ZPTLXoyqJxcMPAlqEh0wg0pS0TO/5tirk9RZpkcRDjgy57XcGTqL6AGFRAt0wXg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6d7xng5; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6d7xng5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333641; x=1797869641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fqow+s34I4t2AKNHswHPiguDJ46MclItZqrT3IjzzaU=;
  b=d6d7xng5hqMg8QORmNWUsCcksbeXEeDvb5bULTSi09rV2UNmngyXGnf9
   Rb7MgTh5ZMc+4Q9Fw0VNoMYcCJOiSjG/c6MVagjrDqWf+3OVeOLhwXDtM
   f/SqzfgPv8cIGe+za+ArVm0vaVCcgzusZ9XcivFCoaRhN8BzDSsrEZJZU
   bgtar5K+92po8/pU4Fv6REdxWQdyD87KhGy1TlrFsAqRUP0tExxTaBHzO
   xrFkazbNcBTRlbqAReaTYsPqStK5pK1ES/o4X7W0upfAhWnUerI2/OAdG
   IYbUBQ8tBsSr/+2Av+uLineWzuMj6ae/CJxjECCcecJ+YMV0pJFrdoEse
   g==;
X-CSE-ConnectionGUID: G/kdbWgqS82AWjnbH/kMJw==
X-CSE-MsgGUID: iLvil0/eRpSnTp4Mm+Iecw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85626973"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="85626973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:14:00 -0800
X-CSE-ConnectionGUID: LSekbwI2RymVXnrvt8GXNA==
X-CSE-MsgGUID: F6LEpd8aSyaQzrrAgnauNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="200206883"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:14:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 08:13:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 08:13:59 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 08:13:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7iBjcOHDb6KjhoxwZ7GVNlWaoy8NEfO+sWfPif8NUk3ifEvpMq7YJVJ/bSQ5vlCCHJKMZSi1sG9GDZ7JSnlIihfyeNzrV3QugrXmgl2+DXNNw0iPQZ00xphm+0UACSCD1oDyT+7uaK1/ey3+bqBBJGjBbdZYrAajfYEBmXwRdWUi0Wf1R+K1hxSTdoumZHGUBFlB/ITxY82zkyLL2UfJ4vixs3z9vXXBNjaeiICEXx+TUDVOae5P7erXb7TXSeEz4pq1UtxomcA1SSj4fSsJGVBZEvahIpHxeQ/4hUaajfjDN6pJjwHNWngX0pjfP4DfzGBPhRFrtJhNSNvfvbPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+kNCuhX3LYiVVpy3YCgIyVr7y6/eumvc9wreAm1xKA=;
 b=coJGrcdAvF2HFNOthX0ynuOJ/F1x99dxX3abTaCg1XsU9bvAwZ0oVKMAFfQD6xwflKUTN6Vib2SHgzZs0wSOn31xuQV5ZUVjdZ+QqMN+DGAmJyUYiAUwmG4eWBzK01kM0T2nma8QBcrmW8acFemJ7upYzN9oA5SmxFcpB/1OlpfMgfn9+alFtah2nWjQjTSdjfNmVMIeeFqwvmBcPQGu4jBFOge9XpLbxiopiKCC0fIJAVg1dPia8cnb8Fjw37gxTEBWLigWZZMdMBEGupoOWBjEAP5RMn6bFitOC1peHx5+3ZDaY7YJqGdWXZeLaGYBuYTJIlXcfWrL+p2T5PyEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 16:13:57 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 16:13:57 +0000
Date: Mon, 22 Dec 2025 00:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [asahilinux:bits/200-dcp 128/246] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aUgcvVoUWQHxFm9P@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 1567f5ef-34cb-4bb2-cf88-08de40abf1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LxKkNoPNVKfrGc/G4G3eKfGQP9+rfVtp3qjzlJBP7ISUTzK+ReV7UNLdaRSI?=
 =?us-ascii?Q?68Wr5fKSrvT/GMiaSvHd3DPf4WNNvtb0fNwRtYuNTaKeerdeq1PSleZwoRng?=
 =?us-ascii?Q?bdp39W+cTNkg8+Y0sTpOa66NpLDxjsnypoF+/ilRfUtxtmxNJlS7L8Zrb5OE?=
 =?us-ascii?Q?OGGlk8ujer7Pmij6VWeA/pRmgPcG4vZpbePxr1+l8ne6ynP9Gk9+3d2B/ISj?=
 =?us-ascii?Q?OiCRQ/94NJjFB02ujpE4mnvK7rA6Xl0xYqp6L+viT39EeKflHI6bX9v0CzMS?=
 =?us-ascii?Q?7j0ou8gc5le12hUn0AaHdRKLp7YtAgzhVIMyJ9C3IgXHu0BgAmZ1jatPd/sg?=
 =?us-ascii?Q?SxXLBaCJwYN/kqnVTRkNlO7wgMgigmauiazXT+Mnbi5me20xi+ONfgPVv6ZY?=
 =?us-ascii?Q?aZcLK02+qXX02TLl3clOTyp283v6o5AieBs/fzYKUh88ERa36xG3di5ceP10?=
 =?us-ascii?Q?pLtPVZJgAuH/R03qY7HObhmbUDxNVlaFX7eGoV5aNUjBm0GVtGaPupRtAwbX?=
 =?us-ascii?Q?dO8Bar5rhvD2Op6zFiCDnsB91EAoZ/rF7nAC2A1v/uM/SQ+Dwwul5yVTGoGO?=
 =?us-ascii?Q?7Z5UlS3i1AnczV6khZXBbQcNZ6WlpHeUQqCdxFvDRy/qSIm/JLJwhq8JvYHx?=
 =?us-ascii?Q?sSG7tBnra+9QRRCEelDi5KXr3FS49C9RwQ7Ut8TXmN5Fh0wJchhoY0nRvXvg?=
 =?us-ascii?Q?+TcsY4jRHMxOANdTMv/c6t4T/kmzosaz/YGJAxdQtBwCdydAjF5J0KRpS6ra?=
 =?us-ascii?Q?ZGQ8tyteyptFeox4y7uKKvtnB3ICSodpQI4LBtlIn84Io8UYJ3TCIjqjYod7?=
 =?us-ascii?Q?guA23JCOULvYN/JNXbds+cSjwyn1UltE8rXrPc8mDOhizSCGSxt5BVGMX1O5?=
 =?us-ascii?Q?aNmAOSN5wjaFAcsWWXtuZBi1mXYAU4G4Le6vAasqtsCOnYj0xeCghMyJ8DYQ?=
 =?us-ascii?Q?bHiJ/otvFEg8erdQiYRqgxs+WukKdPohhjRj/hc27nCmg2UcAL5SQSStYAKH?=
 =?us-ascii?Q?5phvHBQJ4aCFbF0zbcWxrVUOEqy3wxwgm/SQuZpagUb9hWpK6iLOYCZKdjdB?=
 =?us-ascii?Q?Xev/j9DRCfAjq/KTaEw7Kjq2P+pPoOhvIFnGWeTAubQyR2+cV7s5PtDMTEXB?=
 =?us-ascii?Q?QM2trqYcTTfw3yZC0UCvfBI86een9Lmw8Lhrr6KCYb3OHVvhCd19EiaX9fDN?=
 =?us-ascii?Q?A18LBBZc65jgYKP1N3fqLLqX3+AzzPA02daN/orvuGsgAVM63Mx/4Up7KDE3?=
 =?us-ascii?Q?hhG4f29FCH5ff3l+F7Dvlz7uxVzFaGreqxCemAoUdflDe8uwSu1+EvD0NPve?=
 =?us-ascii?Q?5APhsUGjXrPRAN9cyuDE8x23VplFvjTVpp7uM6zxrvZ3rTRdwn9Xikq38CIn?=
 =?us-ascii?Q?ZbT4olzj+yXx3ExQcLsvEeO0a1Y8L9U3289VFvEfTRabG4HaeXROVfvnrjxe?=
 =?us-ascii?Q?SaZg6edIlxu+ZREKbJnEyL5mBk2bMoTeZB/GB1EcvZMnaa6rPJrLgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lIjtVH/fOCDEmRAAVXlrpHhm+2FvbNh/Wg+vyU4VyFIUyhw8Br/Z/68U56nD?=
 =?us-ascii?Q?lsdZ+ea8qz86UHOesH3eNTEAPUNOIazpwbmpc/MOzuZmXdVLuvr4KNrZFlVO?=
 =?us-ascii?Q?2uNc6PKMkfFXbhd+xWU/iMqEJhSQe5aAJJvncSVyVct+bZvfo2OCYPfibvpV?=
 =?us-ascii?Q?HRcbOHUSSBCwqAx5v2CRnqjGlk+UzxqS7smsRZglFNRqudH8aLcRVG5V22an?=
 =?us-ascii?Q?Db3bgNPTlJEvcVK5ppbgN+w37wyBNXeU//y3kLZzwn6brCngQILQqJKXmHwL?=
 =?us-ascii?Q?8CddYUF3KOICVWUCXFLQNFcU4/RwHRCgC6uMiYc2N7DYInAVIkWHS/Xw+CBr?=
 =?us-ascii?Q?3FtOKiijAwkRgxrEVJjE8fL49377QSXdSJBcYsbfn4mpNs+HCVsCXTxPiWOI?=
 =?us-ascii?Q?WLHqwUpOZYq8YWXq2ZezWOFsQqWAAgs/zdqf1KGU8H2SGSuRLhj0Rm9IV+bK?=
 =?us-ascii?Q?tMPqWe4Bzq3RzvFTKu/4Q2BWn8FHNGzSvRUkx2pXqZgjyM917H2wlTMvJ9XN?=
 =?us-ascii?Q?1f2+eFDxX3pUI3Pn8ZylFJvfLETiw+uvrgR/W+NFPbFTPAgDKMmNHD49sW+x?=
 =?us-ascii?Q?Aa5YI2A6mp4OkXlQ7gNUGIqduDF2MhJ3yc/DVtTPxz5RLoOEb2dKmdgaP2cR?=
 =?us-ascii?Q?x89S0ayC6vsCXQEstjKPLHfyE9qwq4hurjCM5VjG1lqzjRW+AfEkqVo/4SLt?=
 =?us-ascii?Q?KpAsSxaInlT5Q/KVNjofn3qxVL5eYx9d+ph3G6Jk7+M5VlolhdWkIK7oA2S8?=
 =?us-ascii?Q?SpjoPn0LfViBdpjOcZqraeOeInIigqwijReAT7CKUEgNTuiOUEhUymVlfOAa?=
 =?us-ascii?Q?mlJ/In5SRMTzH12uINZN5AV5bGQNUAiHAfXTh6+vby8xqWJcYhNMAdCsKLg6?=
 =?us-ascii?Q?i6lnSNU4u6WNKwrXA2S5GCza1Aj23zRS9BCNpAX1889fmKbFuRGM9C21NYYQ?=
 =?us-ascii?Q?GPRNmIPxNhjuyd8wXl2hFhsx4t/hy2hj17sslq075upMY86iNKsrUovNgEKL?=
 =?us-ascii?Q?ztXMPLoTJGzXzqYvnyi/2hhg2QzbPRygEPYMGVS0qI9p1YVAtmpydXWjK74i?=
 =?us-ascii?Q?MzQ6IF6EtbIcDdUJAGlu8sHG2Nh1pMzqn1sZkhvN5AqqVDXUoUpCSQZToGew?=
 =?us-ascii?Q?1yQHqI1+6zprpm7cJ3jYcr6e51T6huZ8KW5gU6Ij3K/8yFn1upBOmAdED9EA?=
 =?us-ascii?Q?RT/5pnGAeMxZW7qjM92lRGwkGQou80nq6ne6eOalHaK751ajXg88st3H8T7z?=
 =?us-ascii?Q?i9JqV1m6VVKp40c9DmyQs0Q8w4kJT7FzBRaPanZa+IHL7ahP74i7kUuqrSJL?=
 =?us-ascii?Q?uIjGu8eBBS8/jnDkSxWfIPo4le0S5ctcVO60JsT28kWMB44wXWJDPGcJrtrL?=
 =?us-ascii?Q?xsG4qE5Esb8qR26C4/v2X7S3AZY8g+ypUJ4FgUe5pR4qaqNvgvsPo6I0ZhBi?=
 =?us-ascii?Q?rF/AGT1kpzUTr+ebNlFbcaHezRpqOiIb280MZIcS4UQ2btxqnRz9X/xONczn?=
 =?us-ascii?Q?vezbxgknxgeiHUtB2GHjLw2L5KEN8kFs2GVaF1R3MuFanYOWPZusS85Uw1G2?=
 =?us-ascii?Q?NgtHhseS1c+fDIGbesRlSIrBuAiJvquM5iXlEiaRXKqDL9lx+AK84jOjLiyz?=
 =?us-ascii?Q?TsZn+X3dc7FW17ge78zMNJuQKRMnYGFNklsqQVZDFgHJy7iiwa5+P6nmRnAU?=
 =?us-ascii?Q?r9hIAllWTSH/022vBey20Xt0XTgdzkRJUBu8mhcxUamt/3zzGLwYlixtQGz3?=
 =?us-ascii?Q?a6nUrDA9fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1567f5ef-34cb-4bb2-cf88-08de40abf1f9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 16:13:57.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kldZ/B1zPyxcWiOeRgAh08nApg6yl/Ca6H/k79AIFjNa97kCkXE/9MuyJnNp0zWsh1UjmVkfxzkp8xmYyRLd1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
X-OriginatorOrg: intel.com

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: 5f0c8cbe3240fff6a7b74957ae8cc80432ef1153 [128/246] drm: apple: DCP AFK/EPIC support
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211625.aUj0RAS8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#599: FILE: drivers/gpu/drm/apple/afk.c:554:
+	 * which will contain the real data.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

