Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B136B061
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047264; cv=fail; b=VNMusQKfb52pDQ0qvRE8iquHrM3/4uljAw60Bi5diuukUt3Sd5aEwC8E/jKaiS7vFRT1GQ3H4nKPC5X/9Oh3aZ+LYpJje+8klWL+8sNBq/JTC77AmPqfzGN5cCRlEsjddi3wqnqt7MWUgw8odyle8jAWH2H0AdA6uxRPBXwgxms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047264; c=relaxed/simple;
	bh=q0itwLqeu+EapGhP6jqrBRmpvQ8aaJZYm+Ne++iTnnY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ro0Ul/5zxWLYcDiEq4bZmEtzW9RFMMXGWiRofnGmvVK1P7bJ8VrYQrnVsL4+vzcqrc1WSYqKGGXoXrsGo6oo8HffAk0Y4OSjrkOe90exazMpyu/J9eNxLbmOpztX+KQa8ib89TaK0LrRKEIFlmc8Tq7/qJ994w8uv4grFy6s20U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrcVc2Ks; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrcVc2Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769047263; x=1800583263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0itwLqeu+EapGhP6jqrBRmpvQ8aaJZYm+Ne++iTnnY=;
  b=WrcVc2KsB2nEMu7zBz4D6D95V0Y6jXjibUQvQ5Upj7QGFQXDb9OUEGtX
   M3Zms8PWU+qvfuWsCCDq0m9NeBd4CAAlS76WyTNReyb7dtT9HvYh57+LT
   eywX3MCKYsSKcWmhGi7oAEtHtoJgLVh1FLGLaUbojU15iokHJaf9K6IWv
   PSAsnD0SJGWqMCbKThdraeSXxBX0IceHXnOT4XzwkASqlGxF9ftDTUVZ1
   w+FLFHStwN7YpZYSJ5sDFFHSVfl9kCtBv5KRU1hO+aZ8GaqM0lJNtIveQ
   I3J8KBz1+sucmlGJDQ8icuxx1yIbyEGCzet3exPPmokmEivjd6t0MiHlR
   A==;
X-CSE-ConnectionGUID: p9Tgi21YRLq8ZDv62ZBQpA==
X-CSE-MsgGUID: W8WJ2kyFR86QmlTjcSoejg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70191909"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70191909"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:01:03 -0800
X-CSE-ConnectionGUID: BCqZ/1GvQfygekV4Arf+ew==
X-CSE-MsgGUID: Wo18mbXGQuyNUqvivcTnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206656404"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:01:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:01:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 18:01:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:00:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBWy92/OppumWc9E8aOmzoubsKgEqCOKf8ZKfWjqJR2FmSlroB3KB0/lGG4dR2Rlh/43dy5YMIjG3hbJLreDhlmfNsJHpWFlguBhkdl8XfN/EwV5/O3FzKhrDKLpUNjaaER7VhaqtAR/G9QuEUz1Cvz0nue2JUyRIjKoRvxX3X6WtO/SGBGtxGKVGen8ZBPLMW0bUqIH6WEJLxpZ87SZUIuy950wa/M3zU1t+xOefDMjOuRaSkHGDnaos6F46VHjeQUrgVFU1tmvlOGIUB/4cbDuiJpi5XcvaV5J0RtKHNvxVVDCCaKnk4mkcNaCJysL5f/EQAJASdpcaV2pmaRVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lKsOzYS+WVrLQX5z/Vpk1AmHavAoiDlOUl0osoYQGE=;
 b=n6ded8eACdbvt43QcgVeXqFkZ/Csm9OU6WOyOyt2WAi1Q26OysMYTNP9gGCKyOIH/b8pUZNklYFti8FLuY7lpPYE/O4Vmp+YgFGUsiMCKc7IqabQhAN4mtDF6hL6iWZ781ETM6j46ToEdr9NW/HOjH9U3RhZCx6QZfvtRPrY3sN4X36nA85cqEJSFRQp/2CsivTqyjVO0ca174oEzH/SMUHBP1yM6bi15WzXjyfiIiHGuq24jZCz9fD7zFh8Pe6yigX6SNPBxD+M7CBQooTFNzpXvzXoY3ec/GpP8M8vZbuhyCUWks9NFDUwvx15xDdQN+wo6NvMq6iXkTJqk8CuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 02:00:49 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 02:00:48 +0000
Date: Thu, 22 Jan 2026 10:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xfs-buf-hash 1/4] kismet: WARNING: unmet direct
 dependencies detected for PROVE_LOCKING when selected by
 DEBUG_NET_SMALL_RTNL
Message-ID: <aXGEyT7nCTpR/Gdk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM3PPF6C1A2BDF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 323f92a9-cbd1-4290-9af9-08de595a1037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6wD19TmTtxrJ2W85MiJz7oEu4CLkwm2zyGXLYEJws10vEikMhMODTKXBVioz?=
 =?us-ascii?Q?pYiA3y5IoacVuVouuycDQjY4OcxDU/j6O6CSW18mjdSjqm2+tXFIBo7ctQkt?=
 =?us-ascii?Q?HiaMywB74udksNcYopZe6KKVZakSS/VrLOsuAY1Xu0HocvOMPAXGzTfL0I+p?=
 =?us-ascii?Q?TdRM/G+mRpSqOwiuCoMViKDlXBQ0gAibN2U7Ph5Q2pnBzSJ173x9ZJmOVkKk?=
 =?us-ascii?Q?vz0yN/6jMZ8Wo42RIv1po3LcyAnD2sDMPI8cBtbqhZnzM/hVFMFCP5gdRetd?=
 =?us-ascii?Q?UPRNAqvU2KOilGCqKDyBYtPFQN8K3T0kmm81pAn5HcYns/vFIFPbD3cMl4oX?=
 =?us-ascii?Q?MQGJtzud6Kdo/781g6z5SPP88Tdfh5KTt1jMpRf2TdCQrs0YkAqdmVPuW6xT?=
 =?us-ascii?Q?j4vnZUwdR1EvVUd5uar+/CuN6bNFjHEmxpcX5c9k8wYtDDMcLDiuKL3JHRJc?=
 =?us-ascii?Q?SYgmaK0iqHtsMemLw8zDyS2EXSU2jBqXTshy2Q2P0uWZIdD/JrHKidDWzoIC?=
 =?us-ascii?Q?tci76n+85kWgeD7anIPI13bQy5YjrQHJTf+nyCHgfQh643JuvuY5utSIHht/?=
 =?us-ascii?Q?InRpWboM1HxoD19m0PoiLGPhx5Nf9DKz0AwRWiBpTvSiktPc5KCEVfBIpvyl?=
 =?us-ascii?Q?HZipr3TQpQpSRaZQxZeO9vfzRTzmK+Cvdq0ItsI+3TD2OGBNRue6Ai7GE48R?=
 =?us-ascii?Q?RPTF3GJVQeRmSp9WiLpC3XkE8eXXCqpDtDPlAi+5OtgTXURj+0obr/x/tJmx?=
 =?us-ascii?Q?4Td/l+YqyazFQcNOhG92cf7guiLEifkS6yfRzDSgmOVEJngOpn20RvIkO/4d?=
 =?us-ascii?Q?S1FO8ZR2GQBrQlyhItXlrz2ehhiWMhaBimrKT/0sO3v8AQT3McptvlNw/g8n?=
 =?us-ascii?Q?8lfEQ22EoZUgzQiZKbaEixCc/EMR8HVNNmH8PqotSr5ReV8vE3HciFikrVhA?=
 =?us-ascii?Q?BTUGGAEELBB9hWLZtd3ASwqgWrOhEYzq4Wpzra+cMdpayEQgyXues8YmevR2?=
 =?us-ascii?Q?3Ycv2HhYzq0anPySPvqtGYzZmLVQBrMxXnbS42+AuBz16EEi/ytpLFXYUEvQ?=
 =?us-ascii?Q?FevEwU/V9JciDi0A3AL3XmTSOAcc+nMgtsw3omy/OJkKPB8gbLgX0XAbjdd/?=
 =?us-ascii?Q?qpnKRV2Nge0/AYDdp+5PM/zdliRl8uiQpnjA+J8GLkMkfDaG/h+TfEyw8Xg8?=
 =?us-ascii?Q?T8Gi/2bCo4TZW4WR5NeoDZ3eLW08RkqJppuJqS8jy81E7FdyxLGMDe+AyRP7?=
 =?us-ascii?Q?edMutyPh5vXuoN85yjuaA5ge06xbW0sFIsK3bM6x353WBTbmrE6R8UHJLLQZ?=
 =?us-ascii?Q?MZN5SXO6DH4r5gxNVyOIrYCkkkLTkXG/raPgltGe3nK6LcxW9N8s9TDW65Xn?=
 =?us-ascii?Q?KUSQvIogZJZWycTVSdmA/8nBsxg84kzBVeoygc2e+5PsG4mkUNjPhRTvjfML?=
 =?us-ascii?Q?xnZ43u42zjAHxetNMxIBj4N7JaGAQHNnFqkilyE9DAlDCTuwGoUBjof7wxky?=
 =?us-ascii?Q?pKTWeBdIFoUiUdiUTiJ7qzQLLygwRN8cB3Ni/Bsyx1DMWPPVjx1ss4IChi9w?=
 =?us-ascii?Q?kySthxcm3v1oIFJvu1EmQFpZvFAl6yLyDVFuOVB7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yiBrVvl3iFCjv+Ouu9K5LFKjKKSC1b2naRvLKuMaq6GBhSMmwwsfqPPNlLjt?=
 =?us-ascii?Q?kexcYKQXfa809Xf1ns4Td/iovS4ciqTy/9MlW/H3w+7oNuoA529z81z6eJro?=
 =?us-ascii?Q?BSNV3l0uizk/59HaVn5x07IWoIAo1XR2ydclU3g2PLEf78m0ic6OAndDgPuY?=
 =?us-ascii?Q?7drVzQl0Jer2IkE7v3JBbnLiyNvo9MoVuGpdK36SLg/ZSkSeOnIqvquNFlL7?=
 =?us-ascii?Q?XB6P2J0Bx7BDf1jr91ePVHOiD0C6HZ2QRJ0SJ1QNA3pQLZMYH0AQ7zVo4DnH?=
 =?us-ascii?Q?GWj+NP92kplruigpHn2L7jjKDRWKKrezn9NlcIartcA0IdqlKt9Uo1LZyUdq?=
 =?us-ascii?Q?0oK9zH+2F9Vx90U/S5GwAGjUSCCOB7HcCC/0u/VqqxnchGEBniIUHKb7x9RN?=
 =?us-ascii?Q?WGEPIwe0UufDLDcETuzSm44bVXHjFVYKyHKFYrY27PwQHJUAt0GwaokUiBJV?=
 =?us-ascii?Q?ivpXhehAGp3YTHYz8ZK/QSPpj7LSkhvkC3+xAPbfPJG9eFO6H2eXiyA9z8eQ?=
 =?us-ascii?Q?x3zZ6k7c/G4graL5r/fmMSf+49DUHpPY86QkR7ib794rAhN3SspZo1jbBSV5?=
 =?us-ascii?Q?hl+1xCkFvP6GpBSLCjRWR4utzKBP/KGHkFHgKnFJgwW0w+nvIk0s9Ad8byKN?=
 =?us-ascii?Q?n4H8/uRKQ5l7JpA5eXH4R2S0OvYWrnXITFFAMMe3JbviFTVAtog0+JBGzg+O?=
 =?us-ascii?Q?riYLUetz3Ppxyz9T/G2r0pu5FIp/qrbqcA6imoTFHQaLkTGeUOG+5gk46b/w?=
 =?us-ascii?Q?UnQTdS05Jc7lfwOFMx5B8bRSYxzrId6+lUOf57GjL+LNfS/WuKV0Kizg/zbZ?=
 =?us-ascii?Q?625dLXsdVGWq4guEfaxUsIuMW+E6K8qvSZGDtW5VGOUl8xAKT/RiQ/4gSxij?=
 =?us-ascii?Q?JXuCr7GkNSWRrPEE2Vnqt6GiTaXXnrXRDtohgDGNUYojRwpRC36PKl5iQUtt?=
 =?us-ascii?Q?m9NZ7qVygSBEDmitpHH9lx7OnNqh90Cf2zM5W7wARhoyaEcPfmNiCMSE+BZA?=
 =?us-ascii?Q?Z3NZwrdYiyUjfvd4LN5xq36wGKATJRtu4Ke67mma+Hn5c7bNIpmopQIZMRsn?=
 =?us-ascii?Q?qA988zYsja00z1HtD4JY2aLMmQC8OTTzqCRcB9LOwc1xz9gJDTPPusklU8UJ?=
 =?us-ascii?Q?eNmb/avucM/pkcm7M4KmEE4GvMOizcZJJdbC9hE+/X/FAGyg1C/qJYk3SBx8?=
 =?us-ascii?Q?irtUff/X51U2Der4S7HTHbA9UBBvR0yGlKgkPPIe9gBdE8AHLoA9Z0jprf5a?=
 =?us-ascii?Q?76iKr4ttmCyjec8+3V9kAqZiNbTYpNPbKetv1/mWzNwUHj2up9R1Tbvaljgn?=
 =?us-ascii?Q?feBvDNVv/orXWTWhbuUqMht7ztO5jfyHas/VC8pyw9n0+WwTfljRwNMLYBb8?=
 =?us-ascii?Q?+dhQ9B6VynRT4wROQq5fvJoo0vBJ9Mdx+eVgI3ihcaR15jqCGUSqO6FfZ7gF?=
 =?us-ascii?Q?o3dYDzYjB86Ff8HWE7aANF5pmiM6vEjN6+S3TiGok0AWWE6w742VhZcV5YRq?=
 =?us-ascii?Q?MnMliBUweNSCpSKeI1lhluUQksHZPY+Po/XVqj88Fvms4Gb3cCCvBF6EJI5N?=
 =?us-ascii?Q?9qQXli3Hp6P3oykmUCO4lVUvEqsHdjkOXw3q8Qy9dKJlZ3sP8jS/IZvZbbNM?=
 =?us-ascii?Q?/+9KYiekElZ0GuylMKx4jiYgZyGZZi+48GZQIKyNi/fvlpB3G3WaPqRo0+aL?=
 =?us-ascii?Q?DOJML3ekYD/udYxBzK/2mTb4lGOWjLU7cFKl1aMpnx+CHiwpeaZasntQYlTC?=
 =?us-ascii?Q?K/I6jecJCQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 323f92a9-cbd1-4290-9af9-08de595a1037
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 02:00:48.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0q8SEUPG6dVtNYY7VrSe7uNYnsi/w4R3oeUUrOfmQslMtTmvQ9oCyTOeTSapG0TbMnNrIyCWqJwb+sydxQFaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-hash
head:   980989721de907c1cf4031997df45f6a63ccf747
commit: 86793f36204d34531f49d904f9d92590dc965c23 [1/4] disable lockdep
config: openrisc-kismet-CONFIG_PROVE_LOCKING-CONFIG_DEBUG_NET_SMALL_RTNL-0-0 (https://download.01.org/0day-ci/archive/20260121/202601212357.fYu8quod-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601212357.fYu8quod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601212357.fYu8quod-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PROVE_LOCKING when selected by DEBUG_NET_SMALL_RTNL
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
     Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
     Selected by [y]:
     - DEBUG_NET_SMALL_RTNL [=y] && DEBUG_KERNEL [=y] && NET [=y] && LOCK_DEBUGGING_SUPPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

