Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61303EB809
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499678; cv=fail; b=NzRXT/2wXWyh8rkekdMKM0UZgZ1eEcV/wFEgdzpBUgrO1kXHmGucpPbJUdsM475mFQDs2XjqSd3/9hR+/uBSVlHDGNWzWDGpR59b9+VYrxoNBfZYRKrl3Tfth1zzXcnL17T9bbmMVvYcKELWmrEo2aWLmKEHMuiHOF6rismz2NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499678; c=relaxed/simple;
	bh=lRJ1pqz3zL/5uRVAc4eP1Ncpsqk+1AnbkQdbsqIYVTw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KCBMxgkIrjGqU/upYCBIbvKq0WqSs2dewIWV/wxWUxL6s+FABJJjgzcb5CnFNmH9XpmcPUdAx7iIaTDafe7jaD90DFVQ80t7kXT0gPtJ8VS86cUA+0/ktKpf+uwN1MkE5k+QKX0VfSOcYtc5iWuR4SmoPneqX0pU3eTnP8NEyRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4c1XbAq; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4c1XbAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783499677; x=1815035677;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=lRJ1pqz3zL/5uRVAc4eP1Ncpsqk+1AnbkQdbsqIYVTw=;
  b=R4c1XbAqt9/+mAbEQOYAwVp6MmJlwKV5cIiCVl/jMCjy1pny/BE5C3pb
   uw/xsMcK2BpVXMge7eyBNtMguUVONrMve7oYzz0syq+h6423105Zv75bP
   i71HGr3byuRc/yfegkcg9eX0O0Il6rsHddPJNDZIgkrcr/0RXZbWn+Kgs
   zW6M4E0X9iBwSB9K5dLnf+6vZKLdGlS9UMf6mc186749eoGLWOhKfOs5Z
   XMTrmKI/4uWzr87ZTA+KkfHf8C3LV3ikLUfKBNW1X/AZbBa7/pFwtbCj1
   2LaipX2FKnnZaAH74gtp95Xo1B9I0Wc+iEJTkcw4QGQM7rtKIF9hbXuea
   A==;
X-CSE-ConnectionGUID: kpIohMXmTcuTO0MYWQbzSg==
X-CSE-MsgGUID: HFG+yPYYTR6h3rp04UgsFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94799934"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94799934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:34:36 -0700
X-CSE-ConnectionGUID: /wC9w3k/TiitHUmwkv03yw==
X-CSE-MsgGUID: RcYPDFeVTJ+1dfG+r+N+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277435631"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:34:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:34:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 01:34:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukobemkzdUAgUVtPRwIOAQFeD8x+L2DS7hpAZKYCMRg63+YPpOS5B6FzUAwyTffgXYo3JCodFQ3JCgKbNKZK+wq4vxb9DTjnbTPyEwKzIfRwmZvHHvsaoO/bwJXCbkjwUolHwmEAZx2DUXqPALEPLOJMQNvrNU1JdIHIg892/Al7SQmC0Wry++F4ZZ4H68IwMeFZF/zjc7lajJVr9GuuN1qwxpPZ1h4EJJ0tO5C+xi3k/x9Lk9PEYbZCN3gdhIxYVorst8OC5EsZQUk5K3nwYS3VR0mpSUlGXkih70CjvWaLJtEiQC5lI67TDtp9z1vbhUIxHwkiJdSSYvfbJoL01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIJTgsGcejXd9JitRVClCdlRJqjd58ubW/GT8QQuVsM=;
 b=LLBIPPYm6xAmOw9KrqlpCmEPDGiVgFUAYEJlIoG6jd7P+kVOr6G/+Rh6HwK/nZfY5Zg7uiKZg6AH7D2eZNrU0sTWbcsm594BwoA65SfWaoSNl7orLtq0oIjmEjuTNX9tV8OmQHylHO3rQFtdMNi4ACEWWDbDcLt6VhEjJUO8uebNFeh2e4+26WGYjlg2cWdf1ABk1NRfdAs60GJg4Xt3+A53XoCNf3bPSpl033OnOfAuQXtEze3w40abSeUWwvh6/yfbU70geBiMQK44iwMbTR8+tU7nYLxq188ff0RujVIx7VW4sfr4YMw2YrrkjNM1/lfepBOv4gKhnMnYAEQl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 08:34:27 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 08:34:27 +0000
Date: Wed, 8 Jul 2026 16:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
CC: <oe-kbuild-all@lists.linux.dev>, Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:entry/rework 18/18] arch/powerpc/kernel/syscall.c:22:17:
 error: expected ')' before 'return'
Message-ID: <ak4Libu/Susiq+TU@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To SA2PR11MB5212.namprd11.prod.outlook.com
 (2603:10b6:806:114::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 51901a8d-9a03-4a5e-375e-08dedccbb827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: e5Z+F8pD9VkNJ7DNyV1EIeZFTBPaiCN5iNrzj4W/OsBhhMvPhCO3RH4KMzLO1MnAfBD+Be4SJB/pTK7YCaUcBJIVBJhduWVIMyps7y0S1SDVogUa6mHfd29pFv5WrIVbDyuNj5lzRIgohLm4qDOYWfPgRajpHCO+z8cOG+gdbrRDm/pir6LE6k4AA2bp6NK0Wezb/hjgPeK5hz37IcqKOE+Vzz3qYlLQ8/BrGVxPvy59ztp7oLFCT2XgSydwUhB4cg0K/AKvyRyi5BGEbIIPgTnqb208MSy3xkwoxo6T4O3VcKKD7Rh8/rQjM7zQvFt/2bi0d6eF0PhKj50PRpHUm3LKE8mB+msDEPZ3Md6/DKc8OFns0lC9dkrkdHaAEfPDm20T8U0kVbrhM94qx6fxWjoU0M+qUaOZz/NT8FD7WCJU+2U+jPxM4c2TPSmlReI+5smEkn4V04En5AcGtCeBx8sDgisuN9o+3yzq8lYXxeG2fI+MstDm/5mwzeQ9V3/95dPn5mpTeyDDIDiy7YXJ8DYS+R+x/oyiPSqsD1PWxxqnjEvfJSWoA4FVxGXWtGCrfE5HOcAeQ3rDyHBJO4UEOOr0NUoHWWdQmHfRAUINgHF0MSJBHeu9jiG+3MXMA9af
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yFAzrXnjXzACdJSohC1iKeoS9yu7kFYAT8UPvbGMsoUZ2fHGgoPfL9PBdz?=
 =?iso-8859-1?Q?pksMsfWij+AauOKACJIdXf/pjroBhD8U8/m8o8/cBEVbUjgoUtM9jIuprD?=
 =?iso-8859-1?Q?LepvsGJht2c0ylLZXgoTXYiDKdA2l8Xs5lpIeTce7EID/zzYtz2Y5Q98CX?=
 =?iso-8859-1?Q?BdWjU/FNuUqzJ98ZIRxMFz7V1yaBHwkS1DAqvtEdYd9teGYvx9jzqJJNqy?=
 =?iso-8859-1?Q?1MjAZ/GTeilr6CpPGB+wuw2OXRB9n8qUkBeFuE6fRUHgXVbfhHncjs8Edj?=
 =?iso-8859-1?Q?UqRBwzKRLYXO74V5fZyfV1BdRVA7wyIBFz/OT29JJiGW1vygEiPBm5RXgw?=
 =?iso-8859-1?Q?g4GzoaqNho0g+Lr7+AxO2tAt0R+/4hturKqGVYgvmDuQvk7A4hQpMEFjzB?=
 =?iso-8859-1?Q?Kh/m8+g9NTSZVF4uh1C4sKrC7H4rAsOIstEWRnGIdH/E6f4YxFuY86wapL?=
 =?iso-8859-1?Q?hYnSrpXH7lOFnDm0OdyAcPpUlX3SEWANIu5UbEoXg44wzT1L4gHO0TAbNZ?=
 =?iso-8859-1?Q?m6M8+ZAQx4JnKqZWuRrH1NWy68YfbtxjOAd4YU8gxlB/AyVDVS/aVwmL46?=
 =?iso-8859-1?Q?hVfguUUiYkm4cz4mkRKTv+5a2ZKIN47vFRKU0p6UUsabgCD448/KItnlXP?=
 =?iso-8859-1?Q?AKNc2iUbd9EoQT1Oq2C50rrR7bOg3NYiEAnPLdWrEGic0QUEeybJTkfgTw?=
 =?iso-8859-1?Q?pAQQCF+wJVgKiXxDhNTNpd74zz0sx8d1gPPxCKkrDFnaKNUzgPVyIuJHLi?=
 =?iso-8859-1?Q?3ZWj40XhHBYvhkkLqJWQLxUF/Re9KRoOkJv21Jw9nceaWbjQUKqI2uh6GJ?=
 =?iso-8859-1?Q?Ahs7ocwB/chvN8ctuiliSfJJOdmaF/lvl7N4A9ZvynAW5O5H6G7kk/VwlM?=
 =?iso-8859-1?Q?tPsghUXLmsfuOQHpxJuCQhwVb6FjDWCeKmTdzIX5cV+WTrcg3UlR212iz+?=
 =?iso-8859-1?Q?hRSVWLrk6RiG++Y8dooKsI6daKHW/deJSpaJT37XWtJHRm4GrFRMLVNvO4?=
 =?iso-8859-1?Q?efKzxaWTkzCF8heB75JZTAY4aNTEUGOOhDRIc4LFnJrilouDIthzVxeuok?=
 =?iso-8859-1?Q?oXCEQa5H18z6VQyQ1pozDPR3/xsbCw/qTrxFM8gTOlqEQiaq01WGhWvBs/?=
 =?iso-8859-1?Q?86NTeJkXZRr5OmQrWwtvR+GEdPMuO7sISUMLBm+2geiGp1OeCa3cMNGiBf?=
 =?iso-8859-1?Q?3zhvnwgHvg5vr7XasFABLf3Kqm/O51/dlT8yOGvuJFoBf0FWm2RQfk9HHm?=
 =?iso-8859-1?Q?yzRP62ssSBlGGZRQCPsPgIkhzW34W5exlJ2kwxUZUCjLDWK6eE0VqGPyTA?=
 =?iso-8859-1?Q?yrcjbwwWfQ/2ZSlteiA/q9U5MiV0yq0iHIVZyE3Hw5+TFYt+SQH164eeFc?=
 =?iso-8859-1?Q?a9jdlkj0GYUZ4nySD6G4YL1pZnKk+SwFtTvqh3Xjn/pSIPgtnEiSd0fJ9E?=
 =?iso-8859-1?Q?ZISOMlcJUl1strh2pzNkemWY4h11tr7qyGSJueczcdqPNvBEvVbc+IoXAx?=
 =?iso-8859-1?Q?jOG7G/IQR2oatGJPRL50eRlq3ccmeWNeO3S+kX5AI9+LisU0kG3kFKI1eO?=
 =?iso-8859-1?Q?PXxIW8/JmjXlhAqfL1b4TLQ/Wo+M3lbDVAznz1VeaW3AfhDNuspWRqDdc+?=
 =?iso-8859-1?Q?9kqcnwP6Olbzbn1b44uM+4Ln8YAqu0n5CCQfoya0DLwe9n7DLBzVXfKMGi?=
 =?iso-8859-1?Q?T+vnRPT+5cJy0usYONdcnFJ8dCjoSofhy/UebP61SpNtHnkwInELqlqJ8M?=
 =?iso-8859-1?Q?F+tMxm8kEEiH+vPhkqJytRMappVS6zJaji0ISfAL19tHAd7sQ/YMYtLnk+?=
 =?iso-8859-1?Q?s+NtRjFnAQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: OjPrDk+5j2gOjyPQjaGjXyy5394nG/PO1Mc0K4qlUq0kMhvxNVQucBDGRtXdAuZI5AqW5YXHT3lgpUGK8u1mwHRYbwKr8EnM3BCfM/1XKllKAQOJScSLVsX9ZwMyzLcCOKrF0F7IQUO0YTNKmwx7Ie4cMiX0l0JNmaRYtZqMD5WD09Tjrv2pQNMsLQgkLPWkLrfJKg2XnRhj02EglFjXuXtJVhMsys3a7wGvzEZYhKkdBzTI2OVvDcn+xrjG/zb6iQfVP58HEpbQjTZkhPe2s7EX3fLbUrXIvbrpyEcfdkVDvRIpRM5S/xpDRVnBtJCSTZGUPSCWy/ws3fRc9JTtfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51901a8d-9a03-4a5e-375e-08dedccbb827
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5212.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:34:26.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wyg6Nc/z9D+MWoBdpCAi4ameduJq3IW2QXBJGK0G4qiAdC0V+y0rDhx6Dz3qufR3UMqnzeP6IlwEmsvRdFBlFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry/rework
head:   af0a53579c942e9d22020e22347b4bf94686bcf0
commit: af0a53579c942e9d22020e22347b4bf94686bcf0 [18/18] entry, treewide: Make syscall_enter_from_user_mode[_work]() indicate syscall execution
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260708/202607080446.aXiq0dpo-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080446.aXiq0dpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607080446.aXiq0dpo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/kernel/syscall.c: In function 'system_call_exception':
>> arch/powerpc/kernel/syscall.c:22:17: error: expected ')' before 'return'
      22 |                 return syscall_get_error(current, regs);
         |                 ^~~~~~
   arch/powerpc/kernel/syscall.c:21:12: note: to match this '('
      21 |         if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
         |            ^
>> arch/powerpc/kernel/syscall.c:63:1: error: expected expression before '}' token
      63 | }
         | ^
>> arch/powerpc/kernel/syscall.c:19:20: warning: unused variable 'f' [-Wunused-variable]
      19 |         syscall_fn f;
         |                    ^
>> arch/powerpc/kernel/syscall.c:18:14: warning: unused variable 'ret' [-Wunused-variable]
      18 |         long ret;
         |              ^~~
>> arch/powerpc/kernel/syscall.c:63:1: warning: control reaches end of non-void function [-Wreturn-type]
      63 | }
         | ^


vim +22 arch/powerpc/kernel/syscall.c

1547db7d1f4481 Xiu Jianfeng            2022-07-01  13  
1547db7d1f4481 Xiu Jianfeng            2022-07-01  14  
1547db7d1f4481 Xiu Jianfeng            2022-07-01  15  /* Has to run notrace because it is entered not completely "reconciled" */
f8971c627b1404 Rohan McLure            2022-09-21  16  notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
1547db7d1f4481 Xiu Jianfeng            2022-07-01  17  {
f4a0318f278d98 Xiu Jianfeng            2022-07-01 @18  	long ret;
1547db7d1f4481 Xiu Jianfeng            2022-07-01 @19  	syscall_fn f;
1547db7d1f4481 Xiu Jianfeng            2022-07-01  20  
af0a53579c942e Michal Suchánek         2026-07-06 @21  	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
af0a53579c942e Michal Suchánek         2026-07-06 @22  		return syscall_get_error(current, regs);
a96ef5848cb096 Ryan Roberts            2026-03-03  23  
bee25f97ad2464 Mukesh Kumar Chaurasiya 2026-04-27  24  	if (unlikely(r0 >= NR_syscalls)) {
1547db7d1f4481 Xiu Jianfeng            2022-07-01  25  		if (unlikely(trap_is_unsupported_scv(regs))) {
1547db7d1f4481 Xiu Jianfeng            2022-07-01  26  			/* Unsupported scv vector */
1547db7d1f4481 Xiu Jianfeng            2022-07-01  27  			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
1547db7d1f4481 Xiu Jianfeng            2022-07-01  28  			return regs->gpr[3];
1547db7d1f4481 Xiu Jianfeng            2022-07-01  29  		}
1547db7d1f4481 Xiu Jianfeng            2022-07-01  30  		return -ENOSYS;
1547db7d1f4481 Xiu Jianfeng            2022-07-01  31  	}
1547db7d1f4481 Xiu Jianfeng            2022-07-01  32  
1547db7d1f4481 Xiu Jianfeng            2022-07-01  33  	/* May be faster to do array_index_nospec? */
1547db7d1f4481 Xiu Jianfeng            2022-07-01  34  	barrier_nospec();
1547db7d1f4481 Xiu Jianfeng            2022-07-01  35  
7e92e01b724526 Rohan McLure            2022-09-21  36  #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
7e92e01b724526 Rohan McLure            2022-09-21  37  	// No COMPAT if we have SYSCALL_WRAPPER, see Kconfig
7e92e01b724526 Rohan McLure            2022-09-21  38  	f = (void *)sys_call_table[r0];
7e92e01b724526 Rohan McLure            2022-09-21  39  	ret = f(regs);
7e92e01b724526 Rohan McLure            2022-09-21  40  #else
1547db7d1f4481 Xiu Jianfeng            2022-07-01  41  	if (unlikely(is_compat_task())) {
7e92e01b724526 Rohan McLure            2022-09-21  42  		unsigned long r3, r4, r5, r6, r7, r8;
7e92e01b724526 Rohan McLure            2022-09-21  43  
1547db7d1f4481 Xiu Jianfeng            2022-07-01  44  		f = (void *)compat_sys_call_table[r0];
1547db7d1f4481 Xiu Jianfeng            2022-07-01  45  
7e92e01b724526 Rohan McLure            2022-09-21  46  		r3 = regs->gpr[3] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  47  		r4 = regs->gpr[4] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  48  		r5 = regs->gpr[5] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  49  		r6 = regs->gpr[6] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  50  		r7 = regs->gpr[7] & 0x00000000ffffffffULL;
7e92e01b724526 Rohan McLure            2022-09-21  51  		r8 = regs->gpr[8] & 0x00000000ffffffffULL;
1547db7d1f4481 Xiu Jianfeng            2022-07-01  52  
7e92e01b724526 Rohan McLure            2022-09-21  53  		ret = f(r3, r4, r5, r6, r7, r8);
1547db7d1f4481 Xiu Jianfeng            2022-07-01  54  	} else {
1547db7d1f4481 Xiu Jianfeng            2022-07-01  55  		f = (void *)sys_call_table[r0];
1547db7d1f4481 Xiu Jianfeng            2022-07-01  56  
7e92e01b724526 Rohan McLure            2022-09-21  57  		ret = f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
7e92e01b724526 Rohan McLure            2022-09-21  58  			regs->gpr[6], regs->gpr[7], regs->gpr[8]);
7e92e01b724526 Rohan McLure            2022-09-21  59  	}
7e92e01b724526 Rohan McLure            2022-09-21  60  #endif
f4a0318f278d98 Xiu Jianfeng            2022-07-01  61  
f4a0318f278d98 Xiu Jianfeng            2022-07-01  62  	return ret;
1547db7d1f4481 Xiu Jianfeng            2022-07-01 @63  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

