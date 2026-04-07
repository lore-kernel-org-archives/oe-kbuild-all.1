Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA311FF1B4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775538489; cv=fail; b=rpCfM9WRxIsm1env1cxMtx0VJpvlBot8zP9+ZOoSQsmAM9V6L/h9nprGDyvnQP4htsAG83mJOiCiCKBnZQ4kRtOIxRJrNe02rM2/vmAGy38j3XRLkOMeoS/avb5NgHf7j2zR/KCzfCC1A4U8zZwvZKq767jGgnbb7o0hcSDHdbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775538489; c=relaxed/simple;
	bh=hif3Vaix6ISJAJmjXW2xICMn31lADGkGM+XltcmLkTo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NDOgRcqn/GFNeAvEGwD5hr50mV/60awB2j5P6CGmB7h6JBNw8vSL37y5B8hPr+h4rNFQvvNjrpk9hl8S6bTod1CL0NqCcID8J5dxhrYSc/0RGjKv5fP6syhuEtAMdVsZFLpTwkT+riomaN1Q3C2V+MtQRmlWQY9z1HyYpTh91p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCc1dC/0; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCc1dC/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775538487; x=1807074487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hif3Vaix6ISJAJmjXW2xICMn31lADGkGM+XltcmLkTo=;
  b=YCc1dC/0z6dGByz+fCwE/u45aG/mUi/JATYKUHmSjkwy+fKlGfwCfJaN
   lWApbJ1o8y0NfWDQWf5dXABYddWxqmXs4GKmiw0xhvBLCaOnx3vW39qKb
   x4935qkvVrGD7nQYLrefm+ac4oVEhvPdaI15BYy+XIbQh3FmZ4oatIoLl
   8/TNjJ0fCpdwXv2BlvNQ1SjrbWBbd0wIybKBqINeGKjepRagllsAGwNxw
   WjwSDFaOLpL+4O12BWsPYo54g8bfeQi8uPpORlGXIK7BN4grNmL8Tqq+S
   DjpsAGTcBFuMTtQZjLj19fUIFvGTu20tF3fy94+hCZlS+W2jlGrSz6jh0
   A==;
X-CSE-ConnectionGUID: 7FvHYfsFTQOfNmNsDV2gRA==
X-CSE-MsgGUID: ViUK0agsQOKhZ6d1CZQhKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="79084929"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="79084929"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 22:08:07 -0700
X-CSE-ConnectionGUID: esAOaOWKR/Sf0HL7ut9z8w==
X-CSE-MsgGUID: IxA2OsCVRgiKWnkjo9oWYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228331964"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 22:08:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:08:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 22:08:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJybLpNnZZod+kp88qqsrMKgCXLsWkPIbM3VzSSZLwIeIdASbYaZRckHygSeaS+A6hp3LlzdC7QHeLtGNNM+lamtfBs/JoOFpLl4qCnVN3bn9i+AgwdTWYNLd00Cl5H+i3c9w9NxZdong4HbpPR782wPzsX21p2xpchz1MJ1hsWggdkJI1HHPCbBRkL7FJ2mTrcMPJMhLY0bambFM1JaSLuzL5Jytw754o4/Zz44F0F5LgaG2nCX3tg9F0+RY4PhTIglyrmkLlGaUv0U+7GV5fwW0aUZxNOeP/1ubLwBYxZmjoPzYtIa7KAExd4g8vTTIpaHW4O9+cphx0Wj5URqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wA/hqW+nYOByovtnACaNuLDL6by9Irs/ALdQM+IGslA=;
 b=Pc8lfBoVjb3jVabYYldDTnOQG2B6caRzBhh0vMia8adDj94kjtntSKxgJmPfzlPLK+LzIN37mLDcyZkLCtWvQeavlqRWACz/DHtjEq/NDuqAQJWiMfIGcpkWSUuS6xlNCvFjG6wATmV8KoymondRISh+CLLTbXtm1f2ylGRwBKc+Q+pdMV+WD0xiEPsiV9moKJ/WP6oTquHjdqUTN/QFftg4smgBahxeq5K24L/rLeJKnnKUkD3OXp4IvhnZD9OrB+1NagVZFnLJrlw3CgPLcXeePVoaiZHeE3n4UEkpYA+M3pNzHGaPILSGhQeTi6OztgbTl5iXutWsttWPHW26jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 05:07:56 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 05:07:55 +0000
Date: Tue, 7 Apr 2026 13:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:klp-build-arm64 14/35] vmlinux.o: warning: objtool:
 sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0
Message-ID: <adSRJLJ8+j+Xg4p1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdc52fd-88c7-4db7-e58b-08de9463a0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Byj/5dF2NDs098Bg8gWppa8uczmzXW2VGMkbTip7ZvLU/Z4RrV2zyKZBBfCuUSpdlZ+hyYjEE3tUHxPQ4d8xywkXdZvouwuSXtj+WuvHjZvP2I11jLeQEpPVyMhi0rjOxzZFhd1vvIFj+NeAytgySMFous/Gy7S1LjO9tDjEPAARGT8Yq/VFyh3BVOneQ12re4Y4FVTmz3F1pDkO7DQz2Vxqta54B/8d5l0tOTwShArRrCAMykUrfU8lRU0zXy41bUuk01/ywYqJHYq0YtASvQjulD4cciq6SSXbfCkrOH+6ApWLh+2QtHuqV79AwhFMwb9SZGqWgJ4igFmgb5SlshuuqFLXh70waKNjcAehW7eZz5YgsIsbDJAFrHMXdZ7vXVCC/qN05XYjX9X/Sy/YpElxRpt0eCXWdj3izVWVYu8J/TxkCQOSo6HsBSt1TGIr4gn3X9tfrLbqScz5xmdLMJMDEsd6HwWvWeYzvcdHS/xkgPcPwSmwOAA6bzaqy2m/Nhu2D01DjrwCaHSAegsnuQB+zRA0aB6h57hO+4Syns7PkN5TzgnMMWM7WYWgalatGdLw/tqXD0oA9LUZyKsRX66zQQgBhB5ngOwfE1Y+dtheB+g3Zji8diFPfHXYRM2g7aD1erOQQfhxQhpBVl8F4/AmaGuawNFcKoSRZMZS6kcikldgHzoeOZkQAsgmyLU1zvuXCXsrFmpH6MllL1tqeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mg+eGf7Hk8dIiiIRHhoO5DupqndZMmf2tOUdl/hrrTr3spZrVjR2iMh3JO+4?=
 =?us-ascii?Q?gMzeZJ4Xu+JoPvQtwQU1M8TSS8o32XxkPRHrvgQ9JgRywMm2u7wdiXCLP0ns?=
 =?us-ascii?Q?eqB5beSg3QRpi1GmNWI91rWPaMK5at5ZSa3iNluheadENFs/G5lHbj8+psq9?=
 =?us-ascii?Q?2gzhUYybMdXJL2+pVvbaPUC60X/MkNDVwq0WHun4u1m2pOeWDh2V2HzNf2oM?=
 =?us-ascii?Q?2r76DM2Am/IwI6z5NWtwQnulM2BZTMDlwmX46GBb/QHfyVd/mJL1ZPPIPW6C?=
 =?us-ascii?Q?Cmqxbpu6FShzOyaI1u/hnI9+6JyMv27oWPk6/lQIp4dum5h/wGKju4zDmiEf?=
 =?us-ascii?Q?bIdlrMhvNlFJAOAkEVdAn9Nf/OZ59LqJmZReNRMm7j+sZ/M/HE9G2OI1zYtn?=
 =?us-ascii?Q?ucCrhn9kj8J6Qx0mFGy5W8Y1ar1mo0cDKJPf1RlqUpm+FaKxpYNLD7kiWNw4?=
 =?us-ascii?Q?bDqAJ3T7LxL9wSA0d/lVuqezIzPfwaV0oDN7UTrwpV4bcbjZ5I32vlup0ynm?=
 =?us-ascii?Q?biDzqRf869fY3i/i43Ih+7/5zBl6QMHCnyRhwJTKSFmBsmWommSQ0oZblEwR?=
 =?us-ascii?Q?FdgiipY61vSNabFGsXlBF7JksdGE5Bo45A7gJEv2f8l8AvkiSueVj68J/EpY?=
 =?us-ascii?Q?XAr8Lje5yThFCxAAf5XXrzhC1dh1Sv3miscNqZ35MCQJ5t8GHRCmpNSS2/qm?=
 =?us-ascii?Q?I/xe7ki7w8vWfDAX0pebbYFOk1HqHg9vZHpIZWCYCPQiuUmgCPDsUo10mEED?=
 =?us-ascii?Q?jsiX3wL46I48PbPSKrf3K4ah+y7QnHceU8qpnXcq9jBUdYVl93FwcKIm5i5x?=
 =?us-ascii?Q?WmgqEi3gHbmVCYZU0PhKaFuhvQCw8TLgcWvJPQrds+SJLfR+ZP8dhXD6KiMj?=
 =?us-ascii?Q?I/olA8Wr3e9OUTj7jl5/CeCbgr2MmakLIKXlW4X9Rsoxg+dU5tvcJxKAqJmf?=
 =?us-ascii?Q?pL98Ttnu6ni9woyQW2L81tJvaaFjPnwj9hhxapDuEzyNSrVlD2HYk6Q4Tvbg?=
 =?us-ascii?Q?7aU9z+NyIZ6Ekb6RtlZBn5ExnuhmQYGyEZ4a0ZeZJ2HMWISbvgqJGO0FQyLc?=
 =?us-ascii?Q?qMTzVONN85h2B1pH6Im+7dtLDsjXx1rmgzcSBAnMeKhSZ/dzYPgzCyXNWfk5?=
 =?us-ascii?Q?Ez6bqAS50t2TpwF2v85GCEm1FxFw4TMyF+1zxVRDBulNAY8oA9gtwWUyVKSz?=
 =?us-ascii?Q?DtPjUbEFrks5iUh6nok5FE7bknn/WAiOS0358P7NV/2QCdAGyYFStUAtPfvd?=
 =?us-ascii?Q?SsK3lLQkYqKUgrP6x8D4z7BHxZG+jg4PdMZRoXn+YksNr7xtXa1Wo7q/Yez/?=
 =?us-ascii?Q?MQ00LCDHRerlpgfFdM5HP6lGHdOV/ebRJ0iPJTgrAWTOEWdzH8BKohdMotzy?=
 =?us-ascii?Q?ybDBh8GzyGRJX1KDwhHUAehhBtAN5acbFalNmhYTReHt93SIxr7C+6sLUKYw?=
 =?us-ascii?Q?aYCxG0XET6zGjFlvTHWbaV2QQyrP+uui7jxm/YbK1afSkog0g3iavUXOlw3F?=
 =?us-ascii?Q?T6vMwZ0VWBAHe7X5uHsNWOLZ4op6tJhtQ+w2vjSsz1DvkSPNHQTHot7VrAvT?=
 =?us-ascii?Q?ZjmAaXs59dH2nOyaErTJoYH7JeQz6xgQTP111VN7VDycAb6N3pfQJnpja4DK?=
 =?us-ascii?Q?M6XFHbTZzbvEcfjnxCMFe+QEcuxT8wNnII2CV9GhBvL+FSPj8Qe8XkBtjWSt?=
 =?us-ascii?Q?g0imsPBAZDgRN43YY85sS7t7XUfiOR46YvTMFpdjivfYud/kSj0cKUz7UzBs?=
 =?us-ascii?Q?WuY172Rk5Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: j3EIgU7c3PhWHEHgwp0q66uQRF6bDdhxqFjRIivbQs2xSG7ViD9L47aoo3gO9bE0qYJkPna0/0aJ6eAB4IGUDoExlCnz9cTSGtQryJWrnM4niwPi2puEEkVO6MzB9bQXj1y1MlnTHSmECJhOarZA6nvhbHyaqJriJ6JvcQuME3ehJxJ/gxNPDkWQLItR8g0P5jvUzSn7PzNuOti4XZ5cAgvhoIo/9h2Qa4EFwd4/yXw3aAKt2Oo7unCMkemr6fCHcNd914vOdhv4FiLy1CgwIsOPjNuUnos1FEG3wKsrqajIX92vdtThYB7zR3yi5tXST8EM81jkEb/AraNMnLsDJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdc52fd-88c7-4db7-e58b-08de9463a0ee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:07:55.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0h7PeMqkGJP2Ahk0RmnGGcHYNXNfVfYN6R1054Ku2Wp1my6jeC4eBQl44rLDXY+L65HuCRi+x7sOzMNSZoQFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   96a27804fbb34c0e19f217848a8cbb91841bcc35
commit: 34289a9c265ced49097f0b40855c8b19a0cd62e9 [14/35] objtool: Don't copy insn->sym for alternative replacements
config: x86_64-randconfig-072-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051228.dMiD9PgD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051228.dMiD9PgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604051228.dMiD9PgD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

