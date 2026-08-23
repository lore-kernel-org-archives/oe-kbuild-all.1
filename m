Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D13D4125
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488142; cv=fail; b=sgXzWywx9HcITTeD86yPTiJVYN7VrlfshmEWI9Co3UD1zXkCmDN5y4u4oOLc1AbEBVb3cndvGy6QZPE/9XimTT9h9ygda3Glpo59wBLTX5tuwcSkERi0byd5/6u80oiVuW7n+wvglXSBY2qYgjRxxWJLzF9NhTHvGK1t5aiUx/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488142; c=relaxed/simple;
	bh=md/RLRFZqKQDhEjNQHAtMgfEi26erAx86IZrFU7ShrU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JdWSpmMMUghAr/LykvQRYabFxNZtfEbykn/pSGdae0aaOY+Ba+2mT6tuRQ9EhRPA9fXSdW1dKgwqDq2odceMNpJi4s3dT7nof87P/eaSGwQQx9e6dtwB2HTijid65zz9DTW4ZJpnc+SJGtvA10lBVKEpkSo1o8Z0xZNXrmU2wUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3ARxBty; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3ARxBty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488141; x=1819024141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=md/RLRFZqKQDhEjNQHAtMgfEi26erAx86IZrFU7ShrU=;
  b=O3ARxBtyDGulpn3HWqeNnov3IzaCbGOT8sAyUxgy8bMG2Jd9NdMS7tJz
   bi+dg+htrdJesfFYzzZDd53hCLZoFHCr5IFEjpH8wzC6qifmOS4kINFFh
   A8OHgoSCbDQu6mJKnZsf+BvtpJbT1iZjc3hYzkncOSjYRTziveLmrL/kY
   oVgzMSb4jjmuUqeXhaVOInjltr86p4HFejzL9LD1ESR+28QiTN0Tgtpry
   2J9c9DlkqeYW99n7OlFRlnloqnrHeoECR+2plXVIPX/gcBSL9nAfSVR72
   7N6PYad5Wf+izS7OBGzVRKLIi/Eq19eYmiP+2xm3QjL+ybIUsXjSMLUnR
   g==;
X-CSE-ConnectionGUID: h68CpZkcTfiVLMkkwttqOw==
X-CSE-MsgGUID: Ffn77/H2ThqSzjLqyaii4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87974812"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87974812"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:29:01 -0700
X-CSE-ConnectionGUID: jmxNU4ltSImUUbxwmuJvVA==
X-CSE-MsgGUID: 1DptLlTTTSOPFJb2xfc6dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264993345"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:29:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:29:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:29:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ns9NUTGOpgbYzrvEVOXjirw31Yvl85z9wqeo5N4q0CHsnCk6fITbb7ShW3yBhVGZJhsmrYNCLpekLQ+RZzLM4COy3ClF4V6OPwPJGkUSKZjlR/CSDj+O7Uxh2O+Wwifh30FIDSR4BYXnQI3Ao0xuFPqYvkp0aechWNjHTTwS+WciFpIdXM/kb+nvFxmX/1/uun/U3tcwJ4JbVAChgWjs6Tw4Qc9btGhcJan17pCdzF4CCIxiaKaSqzcn17GWtx2vEsqSHXX/5/76UPLJrko5kT3HU3K4t4Ckc4BDOaDOfQc+F1sVZF8B8H3PVUPZMAt/1+pzT/vfzqKNCX/bRMxpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKVFX3f4Vs4icez+IP1236mJ/AHZL5zqAWsXVaIVs1M=;
 b=o0G4BpTBErSiRjDiPb8e7pEyKv5AtEMkJ03Vz8XEyIvpc+3R+TBH+1Bd8ZPVdMQ/EJy8B6Z0qfWWurZZDPqCr6ogKuBngqwg9d//3D0ebLMqi6QhEbV4VzDTAgOfMlM2s6XYwd/ytesmc0Zq8WbIO2SgCyAJOBxBsCzZgDWbXNs65w1WmAn+VxXglF9FYMhVJ7y4henUd685Gx+sbDB6ZrbaguDszUNB/yPy6ufNZdHCGvNxhKCU/33UAz/hNnQD5G1dCK92uD5Y581Yqu55Hu4EoZMpz9rrXcyaFVARAzcdqWagWV+xswwdnwRcJMn7x6wzgv0DTWUvkAVfIXmNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:28:57 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:28:57 +0000
Date: Sun, 23 Aug 2026 20:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: [mhiramat:topic/wprobe-v2 9/12] htmldocs:
 Documentation/trace/wprobetrace.rst:98: WARNING: Block quote ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <202608221637.9mMBIBIB-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c54c21f-e604-447e-885c-08df01121a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|3023799007|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: MHI5u3TUP4U+fy/UxDW2WyLxqkfo7SdC2RyjId2fyUNUBw+iErvzrr5i9bwSWRj5yPZBQNFNze35UcRPb2r0ZpAq0uJa3sZA3FsmqpesCwXNMMFwtBUEI5p8dYYcr06DLszjv8oCHac3HesLZ57usUvXzqfbMTqg/xWi1LHINk9stCxdj5mi0PwT9qgLbg8JGb+XrpRwn4NrghQXJbhXlhgzCUDcbGbjdcwe/zqFj/GxH2vjUt9epJAj9GsEFK5ZPAOP8G99ryCgFfn2oZJ9qIgf9lz+B4TEqimvZ6/zbVak8JMWn9IdGJ37ZGTOQUoFEQIY+Ntzky8mRV8EtbHbbFWV+/IIIkbBRpGfxhNujhb88aQsHBXdaFhk4cMX2dbT771mW4YKewG2Ter6/mseXy1tNY9nyosH3U8SSpw2wzlEMuzvndXnO4qHSz5hCwDO4+VNcMWzdX7uB6YdAIuPdz6QwBe0ngOTHFN+ak2u8vbwUMmCRCL8cXsz3RPKUhVGWxW/qHDlvsK6MtzmuKQYLzD5BfvKJoD/tEGxqJsRR5tHfTZJti+SiNpEI1dynrIwdgrYRQPRI7vBOuxHxG4YCVdg/UOa6ZTPstscRRJGqqgyyU427f6F0ZvDESo2L0xAbVh5F7nGDNrBH8S1dVkmBQGgpwTgmCJWa5/3r7QyKdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jm9vfZbFF/jg5JsNYvxXh0sVanytaqyo6QLmRC/SV3FiSJDLF/drGBNr6Lsf?=
 =?us-ascii?Q?chjoonYTI7MOAQgfq+cd69aE07JGmuhzi4dZU2vSs8VUCDtVbHTsRk7LaBzL?=
 =?us-ascii?Q?uP9NC5twCz1Dn4AmFJMgogoR2pHJnmIlIfBHP0Evwo4zSsl7v30wGC3v8fU7?=
 =?us-ascii?Q?h+Ypjt8zNfTwmcsjgIt/yv7kpvxs/2d3+3w+pTqHxDDmAjA3KE3a7oBVCCEU?=
 =?us-ascii?Q?bivXsH0naesgblbOcXwR4HCINy891Z+J2/lxIJqtPBg9oWAtFmsYVApMWp0l?=
 =?us-ascii?Q?HdghSiUnsZKRrh6QaiERe1BgziYeays7+POMtgbBAuJYj49lYG0em4n32QKG?=
 =?us-ascii?Q?YYVZMhYMaqekH+PnYDiHXA0GfDLeiQBibk6CjmrmOo7L896PSMy3bWgJ7vub?=
 =?us-ascii?Q?u9g/jf7uYhXlBX5jTAmyM0NhEM5n0aZEWGhwi8xlJ9vIiP02Qr2pEovK2fQ4?=
 =?us-ascii?Q?vhtbB3FMNd8D5qRv7Uz1XHTUhsgATmR01EtZGcVJ2ZIAAsF1/9LLbQzJOa4Y?=
 =?us-ascii?Q?0m8hT3xHDLFf1zAAVsCwqQh4QyiF+u7F+qYkMcBtW1E2uqMOf5ayPgTNXdv/?=
 =?us-ascii?Q?z++6mUmz/STE9KMUHln4HKnc1D2qAe6Hm0+41k1cFnBuW+nDgEIGBQwyPgbH?=
 =?us-ascii?Q?3jiQ1lP9oFCGPHk280PifWBv6kTR2j8rX5x7FFb8fvxhCiS1aa17jrsi7AzT?=
 =?us-ascii?Q?LG1mevXzE2qudTBMWT/xcQQl259OdQ9Okapthj2ngltdngQ2r5TcNRQjdUyu?=
 =?us-ascii?Q?JoBZnlmHxY7VQIzFg1FbQezuKN62A8kRbUkD+jLG0e1s7p/YWgp9B/XfyAm0?=
 =?us-ascii?Q?DuHokEePhJ6qHHCbEqbooucw0OL5TRvu92hLgZdTs9vRUlg+SQOCGoffMvcV?=
 =?us-ascii?Q?7th/RsEWvz+1zB4Nt3iECkb2e9PevW/pWzxb2FDBXJVfF81kpaJt+c/rBEQl?=
 =?us-ascii?Q?NlpToI1Mvs4NqrAj+u8X8pvXvTuh3txcktUiF1S7jD+gL1mumbiYsH71FJcb?=
 =?us-ascii?Q?d65S2BRQ8sEW46ACPsR9wD+YueLOAoMZnAhpG+64lH2bZHJLf4rROaM9vbvn?=
 =?us-ascii?Q?KoB9xIfutG3ur+CWXzP4Z+CpYVNVuYqji6FBDOdWctA18VGrK418kosBXXtJ?=
 =?us-ascii?Q?eQS6u9/La8kj0xJrPCa60DDLiEZKN/nHsU7GIBT9pa67qejpWb/ZvqGRGCdz?=
 =?us-ascii?Q?fQ2T8ydPlKGDPZXAUroQ4NEv3pBNakfevRz4zi5ebLJH6d7kYMVBZSNzA+Cd?=
 =?us-ascii?Q?TCPTM3DcoQ+7AgzDTxp3nY+ADyRinE4m/k9x+b04BXjikTrJRM+pQD8ygJi8?=
 =?us-ascii?Q?3N0/LFyvsHZp7tRL3Paowv6qMegkEEogw1VRY6clAXogWYdEVuaFY/aiOVQ0?=
 =?us-ascii?Q?2L8NQNiCFAhduU0tqjO/uCpKJe2EvUpdl9mZCwfY6yFMRJiXvOibAf5fk0T6?=
 =?us-ascii?Q?erbaOkqxdlOBI7AXOXMKDPSyrRrzeUyyuzwF4WseinUSnpZGmoyUgdFa+SSZ?=
 =?us-ascii?Q?T+uOk7GAfpv/6ZjNDvMhsNaA6cksYzZrqhV2zvk2zaDNp3ozNBbSFk+Ljtdr?=
 =?us-ascii?Q?Vx9GeQrdcHZrRGXrZY228Wfje33w8fWEnnAttpjrTaASjfU/8ihXiFow8cc+?=
 =?us-ascii?Q?snovf+XFvkgc6B49Retg4tVxEmq0op5sXdacflgB8xM44hhF8Nfm0EKuO+QB?=
 =?us-ascii?Q?KRu5H8GP66UAURAEXcbLAU3KutFzoFGnXeSxNlrxNmOObJpg0plthJE6tMBg?=
 =?us-ascii?Q?x4lTiMc9gQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: DqUM0m46KNbGTjyizuORGsAHxvpEuEnIA3+KneMY1CAtOL11bJVHfnL1zz7IAIqXSxKzdtfvly+m/yIlclXZ431vAx6/wauBxNnvP4eoWFRJNjvRpmCwF0tiZCcwceBagT3+0OryON2e2qeBkIcqUAmYa8umwuf247GZCb3wfbW2mzyx+GlGAFwWwe1moOgCIzulMFqt3S4OSlrlQDMQkKOXGhgwdYWAq7Zu6ptSp/3/RBXSav1/OGbN4ZcMkunZSR84wi9e3bZrLhWtWHNze0xaheBRwPcJaFfTDwM71R4cbMEzgrsoTOydlrlHK+mx0Mk95FFZgrKNnY1o0capRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c54c21f-e604-447e-885c-08df01121a88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:28:57.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFHhWuzPRNdn+Jo6ex37KbxShT5+Yvju1nOToozv7AVTsPoNHt3j5U6Ld7Vv2rWS6qzoHCYy/i7QsrrdQDa6OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/wprobe-v2
head:   62b542a406f310bd51ef29952e64c4568b7e4487
commit: 37e9f8a5dc817c116c8088bf30cfae6516c1f478 [9/12] tracing/wprobe: Add set_wprobe and clear_wprobe event triggers
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260822/202608221637.9mMBIBIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221637.9mMBIBIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params'
   WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'
   Documentation/trace/wprobetrace.rst:97: ERROR: Unexpected indentation. [docutils]
>> Documentation/trace/wprobetrace.rst:98: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:550: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +98 Documentation/trace/wprobetrace.rst

    94	
    95	Notes:
    96	- set_wprobe only works on the wprobe which is NOT set a valid address yet,
    97	  and it must be enabled after the trigger is set.
  > 98	- clear_wprobe only works on the wprobe which is set a valid address, and it
    99	  will be soft-disabled after the trigger is cleared.
   100	- Therefore, if a trigger sets/clears a wprobe, other/same trigger events
   101	  will not work (on the same event) while the wprobe is set.
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
