Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A517722
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 01:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706578989; cv=fail; b=hRTptoaE+f2jw1fQ/19rGM2T6FsFqNPtMFYy1/y6uc2HDJnc5SnP/zKLv6FLAz11UGwEakhOxrS3vdROyHIlh1ZKGFrSf6876vYP8vqnlTJg9+nl95FMrZhzTCsLiBEQJvesudlzju3gQ/lKG1m1zDintbn0nHPC3Rdp+SQLEN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706578989; c=relaxed/simple;
	bh=3qpKnglLydD5UQkso8vaqQE/EBNYdYrro5QvtStL9ng=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DZ033eM2LooyV/DCUf+SM4v80I72uvPouWfWnAR5GTITuq216kHY48jubKydf2rc85H8P7A3MckNEgsUjb0ZnjhKe6DJKvxLK9YxHgwHBIDtBX2KIwmlK61IA5H384qX+Pb7pXqH/ho9RwHt25VYBRA4iVxt9QG8YopcaXCutw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1PInzff; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1PInzff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706578988; x=1738114988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qpKnglLydD5UQkso8vaqQE/EBNYdYrro5QvtStL9ng=;
  b=R1PInzffboTW5TtYl8AZeZaU4o7UD2Fjsc//sLUx6+tSujB3DfyfbFcu
   PYqcpwPbzFEnnf9Vs7pDVYRST5GCa/k0SPC10YyTU03Z9qrDiJw8pHQL1
   ToBfQAvUPUeRF19O5ee9y4Ca7RmtCMN4LY+XC/anLf4cbJEeTILf/v3LT
   SPcNh/cQtv6L5WrafS5BfPw1Dy/M16nCN8g+9iBeR/VfhCdBvC+RIYQSu
   xRDEaUYEqRVSvBTLR9c1TSbB5MJwti12DyibQp0gqPGk7az1Cm2fsZbMi
   EQrif19bCXlpieQ9QWfPKENxyDTQ4wO7mowk0GFsFFJaKzph7YXngjb4D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24614129"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="gz'50?scan'50,208,50";a="24614129"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 17:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907314353"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="gz'50?scan'50,208,50";a="907314353"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2024 17:43:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 17:43:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 17:43:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 17:43:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hswzA9L18dlkXMGS12BmBPJ9oMNYzqBjqs/F1RHinxLSOWmmUfhU8wUKSvyE7s4dJP1TCKpPNsywzqpdQ7c1rKaoIyizCB2yfAgUMpr4IU9aP2dHoeCRPkMmSWJmZRFnbpGzNZSllsnbcC2xTT5N0nZaq+mwnkz1cy1bv2kONMkGptWlfDXbSnNkIJrqdCGMOIhs5zzIiMnGXiXht501NL3RFDA2ToU/yIUZJzPbLlnNV7McwDxg+20bbe8EEKV8vVhLGYqZAME7E9gIN8pKnMAwT6JJza+bjYmKG8f5xOnLVoqXtaRHCGr5stVkVYOwDkKAcNY/JxPHNWVLkoJ+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsLkp4vLGG8vlARQZAZWMrtJv4vg8ut9aGaco2M4iek=;
 b=bND3K9WydVBlQpgmUlPb1834ini2p9vH0BkZvFxiZOfptBd+qyU1ZPtbdR709dsIZm9jL/Qx47NUve8jMkgje4iSQShPtwQ/pFcL0VqK/qkn8bhD5xgDKn+Qf3AQD8lcoweRDYpRFsj85clP4AeM1GcEVRrMT13IWn070ERBFHbXgdSrXtke78ejY5stHG3aHLvPyUt1NJWETkiZWpmTaOAUPlc06l+cYbWCtSs5x5GVvn9XLqXUTfu1RRHnX/06REUV6ietURwnigR5Dvo4JkREKMwJ/RQU2OBFv7h4E8XopbDal+yBmcla9guMPazBFENPT52YcfGyxdjdKBwasQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28; Tue, 30 Jan
 2024 01:42:56 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 01:42:56 +0000
Date: Tue, 30 Jan 2024 09:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, Xie XiuQi <xiexiuqi@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:openEuler-1.0-LTS 5766/21589]
 arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <ZbhUGLALFPS3Mz7F@rli9-mobl>
Content-Type: multipart/mixed; boundary="rl4MiwGQ6L8ug766"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd2eff0-ef7e-4ce8-899e-08dc2134c7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUaN3fbLZkm5fxIozwE2doTQJUf/S1WvGbp+FT8Sc37wAtqaEITi4aVcMNVcqnPkSDIfIX1vDGK4fu1+OOUAJkYJW3hEfSc5dEiJjH9b00bZLNBjavQy4pyRbdFPs6xu3PMAG6uQfDxMSwR8piv2L+c+RfC00N0g00qR/g0ASiy/6oBAXMmltt3MgVGFxUJCon4X0cwZXWtI50KzRDE5LCjIfbICKmfOIsjae9HT2LC9jJHRRJmvEyKgXaZLV2w6TynLHnvC5gT+FM743VkUyTGV8TK+8iOJo5BvR/u8EwhR+tXjJdfovfCw5lbaFv/XY9sLI4YuQhAXHsKP0bu0e+fEKcG8/CEm6G6XJj0+Vy0mKnLF1LRCnEEvI8w31TIuT3p60aaT4C8y+2rBZCjeHvdsqXnR9tv4FnSjA3ZII0G41rwc+Qsrs+mG9qci9hknpFQd2nUV+ZifaeOfve/OLrYrmUTCAF4aHOHtwkmYxYWV0gQmDOb4uH8EoGk4C6ZMWVxTpmHwxJpkWmNYMSB9inBZfcxnVKo61ooAiLKTfNCsZo20KB5ehMjnbRX84pu1jFoUSbP7p51vHZ/ZSMCgPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(366004)(376002)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6916009)(66556008)(8936002)(5660300002)(66946007)(4326008)(8676002)(235185007)(86362001)(2906002)(6512007)(966005)(316002)(66476007)(38100700002)(44144004)(82960400001)(478600001)(6506007)(9686003)(6666004)(6486002)(83380400001)(41300700001)(33716001)(26005)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ezgZ7xiEQC3FAzimGmkT0DCofTEYXH499zTqZqcltDuZKewmKQ7wRszlB2M?=
 =?us-ascii?Q?0EGM+QUaFtHkNsEa3+j3JiNVWs9RJC1sgRZcEZYvVH/DyPTZi3JlV0+ufkhM?=
 =?us-ascii?Q?37+mpjCGqjogCTiofx84NNlaa/Msckfy5Nw86GOlw+RG6JTNPvZttM9GgPzz?=
 =?us-ascii?Q?A5HAM6cHLdN81Cs+uhzFAR8McF8Aty1P8QoBzcBE5JKachwiBwEq0LMg5jx+?=
 =?us-ascii?Q?kR48OIw4aFgNljVcs8iBRcYyb340PPgMK0MVIyw1Ssbw7dD8ow3cFDLks8rv?=
 =?us-ascii?Q?3eK5W2VE2i4JgtiBeFZy89riyFdpb6C8Zyf78njSTQuoDWcI5KfiNf8TqHif?=
 =?us-ascii?Q?0Coe/yO7mzxpZQzQxwi6cuBMgdtgQwrjdb/3763+mjGqN+caTiw4acIeAS0c?=
 =?us-ascii?Q?1ammnCnzsRhcKIZVGo9Ifr2k/7yKUM7P9CPE9FO4sNFM/MGkDnlEKDbK2NxX?=
 =?us-ascii?Q?7/VIL+jD2KgqCD77wPT3ZBZ726NkcxxD/zr9+aSfamwo9fJG1Swz79Rs/sbA?=
 =?us-ascii?Q?sJO4Qn7ziW5VOky65fnoh2jKNGPENHINLjZFwmSCxkw2CKCPUY9L8aexZifw?=
 =?us-ascii?Q?MwDnr0skrLKAjljgpSPA965TKRpgWtb+OFaCey6Y8DQ78Q96IJ2uscnyI/fD?=
 =?us-ascii?Q?LM3BmjKGT90MtWHWHUEXxQNyxyggDj4pVs5XBWb1P7YjTfPVnHEvsk5Vsn3l?=
 =?us-ascii?Q?8LHep3Nwv93ZfVLjm2fQGm9CIawaf0m1Df9j9YqaqLsNZ7mg5Sg/etYa/MQW?=
 =?us-ascii?Q?6IjnDiGqGz/mPycermaGdsLMS6N9tMY9/USfFzbabyUeKSqr9sTR+6s/ayBD?=
 =?us-ascii?Q?kfKUWu35mLJMxOUyQclejuBmob20z6mzq+3ROTnDk0QVohzAmIQw/QhTWBmR?=
 =?us-ascii?Q?kNjM2key7aDG0lVnwSJSdXtTi96hwlTNE+CrTYcYkQK11An4w3ZT8gY4YrZo?=
 =?us-ascii?Q?d0AKsKQgDk43VaEoExYTAICXGSyZHQAvGyQdo21c1YKmlXi6b7l0py0x4GiS?=
 =?us-ascii?Q?T8VmfHtGwsY6ZxOv2SlyblPjlokG8c+lcJ9ibR1d9+qDmWgVZY7WVbAk8qzS?=
 =?us-ascii?Q?PWRxdcQjdL4ZU463wAzeMMUnA7K6XGjzz1QnNk8qRmjauMYZ3Mf2/o7iQJjE?=
 =?us-ascii?Q?DVGeZZa13XjpG8lMiSQfM2VX80omSXkO7+lrD6bkhazOZ15D14zbn0ntknuQ?=
 =?us-ascii?Q?G3MSJKxdfpMO1r1uaGp4+nf/8oUsiR8tfjjLBDd50SIRGVRdhUxQGo8DxE8S?=
 =?us-ascii?Q?loRP7V+cVl9WfhPC/ixxax8AnF8zR/twm6RpAPG7NMLP4S/ffAuR7xDVvT4t?=
 =?us-ascii?Q?N8uc1Xm0zYCy88B/EQwJX7wZI1i8dfxXnGCOHcF+hs5XfK3ed0U0Jb8ciNeT?=
 =?us-ascii?Q?V+bqf6IkcychkctyQts79yxwdFwAiYOcFlnGjTVXiA8Wx0+JaWgO8+++WL92?=
 =?us-ascii?Q?3mSAqVV1q20yGdbDkj8+D/SUF07oa9+FafozhZsJQQu02aNRbyFxBvvPSuus?=
 =?us-ascii?Q?SNatUeG8fqNjn11myGEpyg0PK4AbGPFTF6wQel5pqYBrkpoVXEeXKWqLyv4q?=
 =?us-ascii?Q?tp3nllpGfu/4HgoVfWtEj6Y4XJdbQxJCdN5fOaFDiBFSdrleoDTmfvVPmDS2?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd2eff0-ef7e-4ce8-899e-08dc2134c7cf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 01:42:56.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iHFOB1MdBRIw2Qa3ZVvQT/L33Fghcvo48OCZrPMiBOxTyBj5aFz7lJenwyPF+lOwqy3xWSQ8wtdLc3RHmk4yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
X-OriginatorOrg: intel.com

--rl4MiwGQ6L8ug766
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ef2982312942ba96fb8217df5d832051bae4afd2
commit: ca67230a79f23abbf552a5cb3471d46ff8b672c8 [5766/21589] x86/uaccess: Dont leak the AC flag into __put_user() argument evaluation
:::::: branch date: 12 hours ago
:::::: commit date: 4 years, 1 month ago
config: x86_64-randconfig-121-20240125 (attached as .config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300305.gYla1O9J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/kernel/fpu/signal.c:94:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *__pu_ptr @@
   arch/x86/kernel/fpu/signal.c:94:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/kernel/fpu/signal.c:94:16: sparse:     got unsigned int [usertype] *__pu_ptr
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   arch/x86/kernel/fpu/signal.c:101:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/kernel/fpu/signal.c:101:16: sparse:     got unsigned int [usertype] *
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:101:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/fpu/signal.c:116:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *__pu_ptr @@
   arch/x86/kernel/fpu/signal.c:116:16: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/kernel/fpu/signal.c:116:16: sparse:     got unsigned int [usertype] *__pu_ptr

vim +94 arch/x86/kernel/fpu/signal.c

b992c660d3b316 Ingo Molnar 2015-04-30   79  
b992c660d3b316 Ingo Molnar 2015-04-30   80  static inline int save_xstate_epilog(void __user *buf, int ia32_frame)
b992c660d3b316 Ingo Molnar 2015-04-30   81  {
c47ada305de380 Ingo Molnar 2015-04-30   82  	struct xregs_state __user *x = buf;
b992c660d3b316 Ingo Molnar 2015-04-30   83  	struct _fpx_sw_bytes *sw_bytes;
b992c660d3b316 Ingo Molnar 2015-04-30   84  	u32 xfeatures;
b992c660d3b316 Ingo Molnar 2015-04-30   85  	int err;
b992c660d3b316 Ingo Molnar 2015-04-30   86  
b992c660d3b316 Ingo Molnar 2015-04-30   87  	/* Setup the bytes not touched by the [f]xsave and reserved for SW. */
b992c660d3b316 Ingo Molnar 2015-04-30   88  	sw_bytes = ia32_frame ? &fx_sw_reserved_ia32 : &fx_sw_reserved;
b992c660d3b316 Ingo Molnar 2015-04-30   89  	err = __copy_to_user(&x->i387.sw_reserved, sw_bytes, sizeof(*sw_bytes));
b992c660d3b316 Ingo Molnar 2015-04-30   90  
b992c660d3b316 Ingo Molnar 2015-04-30   91  	if (!use_xsave())
b992c660d3b316 Ingo Molnar 2015-04-30   92  		return err;
b992c660d3b316 Ingo Molnar 2015-04-30   93  
a1141e0b5ca6ee Fenghua Yu  2016-05-20  @94  	err |= __put_user(FP_XSTATE_MAGIC2,
a1141e0b5ca6ee Fenghua Yu  2016-05-20   95  			  (__u32 *)(buf + fpu_user_xstate_size));
b992c660d3b316 Ingo Molnar 2015-04-30   96  
b992c660d3b316 Ingo Molnar 2015-04-30   97  	/*
b992c660d3b316 Ingo Molnar 2015-04-30   98  	 * Read the xfeatures which we copied (directly from the cpu or
b992c660d3b316 Ingo Molnar 2015-04-30   99  	 * from the state in task struct) to the user buffers.
b992c660d3b316 Ingo Molnar 2015-04-30  100  	 */
b992c660d3b316 Ingo Molnar 2015-04-30  101  	err |= __get_user(xfeatures, (__u32 *)&x->header.xfeatures);
b992c660d3b316 Ingo Molnar 2015-04-30  102  
b992c660d3b316 Ingo Molnar 2015-04-30  103  	/*
b992c660d3b316 Ingo Molnar 2015-04-30  104  	 * For legacy compatible, we always set FP/SSE bits in the bit
b992c660d3b316 Ingo Molnar 2015-04-30  105  	 * vector while saving the state to the user context. This will
b992c660d3b316 Ingo Molnar 2015-04-30  106  	 * enable us capturing any changes(during sigreturn) to
b992c660d3b316 Ingo Molnar 2015-04-30  107  	 * the FP/SSE bits by the legacy applications which don't touch
b992c660d3b316 Ingo Molnar 2015-04-30  108  	 * xfeatures in the xsave header.
b992c660d3b316 Ingo Molnar 2015-04-30  109  	 *
b992c660d3b316 Ingo Molnar 2015-04-30  110  	 * xsave aware apps can change the xfeatures in the xsave
b992c660d3b316 Ingo Molnar 2015-04-30  111  	 * header as well as change any contents in the memory layout.
b992c660d3b316 Ingo Molnar 2015-04-30  112  	 * xrestore as part of sigreturn will capture all the changes.
b992c660d3b316 Ingo Molnar 2015-04-30  113  	 */
d91cab78133d33 Dave Hansen 2015-09-02  114  	xfeatures |= XFEATURE_MASK_FPSSE;
b992c660d3b316 Ingo Molnar 2015-04-30  115  
b992c660d3b316 Ingo Molnar 2015-04-30  116  	err |= __put_user(xfeatures, (__u32 *)&x->header.xfeatures);
b992c660d3b316 Ingo Molnar 2015-04-30  117  
b992c660d3b316 Ingo Molnar 2015-04-30  118  	return err;
b992c660d3b316 Ingo Molnar 2015-04-30  119  }
b992c660d3b316 Ingo Molnar 2015-04-30  120  

:::::: The code at line 94 was first introduced by commit
:::::: a1141e0b5ca6ee3e5e35d5f1a310a5ecb9c96ce5 x86/fpu/xstate: Define and use 'fpu_user_xstate_size'

:::::: TO: Fenghua Yu <fenghua.yu@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--rl4MiwGQ6L8ug766
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICCvat2UAAy5jb25maWcAlFxdc9s2s77vr9CkN+1FEslxHOc94wuQBCVUJMEAoGT7hqPIdKJT
W/Iry23y788uwA+ABH3aTKeJsIvvxe6ziwV//eXXCXk5HR43p9128/Dwc/Kt2lfHzam6m9zvHqr/
mUR8knE1oRFT74A52e1ffrz/cXlRXpxPzt/NPr87P5ssq+O+epiEh/397tsL1N4d9r/8+gv89ysU
Pj5BQ8f/TLYPm/23yV/V8RnIk9mnd9N3F5Pfvp9OT8//ef/+2+70/eXru+3h8f3Dw1/mf2+fjof/
rbanycV0+vnT9PLr+YeLT7NPs+327uv9+dePn6cft18vNpfTD58+frivZpe/Q5chz2I2L+dhWK6o
kIxnV9OmEMqYLMOEZPOrn20h/mx5Z5+m0+lFS+OZVKIIFReyq8HEl3LNxbIrCQqWRIqltKTXigQJ
LSUXqqOrhaAkKlkWc/hfqYjEynqB5nrBHybP1enlqRs/y5gqabYqiZiXCUuZuvpwhuvZDCzNGXSj
qFST3fNkfzhhC03thIckaab05o2vuCSF4r0ZlJIkyuJfkBUtl1RkNCnntyzv2G1KAJQzPym5TYmf
cn07VoOPEc47gjumdlXsAdmr0mfAYb1Gv759vTZ/nXzu2ZGIxqRIVLngUmUkpVdvftsf9tXvb7r6
ck1yT015I1csD7vJ1wX4d6gSe/45l+y6TL8UtKCelkLBpSxTmnJxUxKlSLjoWi0kTVhgt0YKOPSe
ZvSuEBEuDAcOgyRJI89wOCbPL1+ffz6fqkfrPNKMChbqs5MLHtCuZ5skF3ztp9A4pqFi2HUcl6k5
QT2+nGYRy/QB9TeSsrkgCg+Fc5gjnhLmLSsXjAqc681Ig0QJWHKYPxwt0BJ+LkElFSvdcZnyiLo9
xVyENKp1BLNVk8yJkHR8OhENinksbV3Gw6XkBTRYrokKFxG3mtN7ZrNERBF/5RVJGFBpmRCpyvAm
TDwbphXeqtv/Hlm3R1c0U/JVYhkITqIQOnqdLYXtINEfhZcv5bIschxyI4hq9wi2xieLioXLkmcU
hM1qKuPl4hYVa6rFoz0GUJhDHzxioecwmFos0uvT1jGlcZEkY1WcHth8gTKiF1RIT5VcUJrmCqpm
Tj9N+YonRaaIuPEqpprrlXZDDtWbhQvz4r3aPP85OcEKTjb7u8nzaXN6nmy228PL/rTbf+stJVQo
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
W0u3N5XL5xBiIjYn/D/VOLyGKbEBAA==

--rl4MiwGQ6L8ug766
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-52-g1cf3d98c-dirty
        git remote add openeuler https://gitee.com/openeuler/kernel.git
        git fetch --no-tags openeuler openEuler-1.0-LTS
        git checkout ca67230a79f23abbf552a5cb3471d46ff8b672c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/fpu/ block/ drivers/i2c/busses/ drivers/md/bcache/ drivers/pci/ kernel/cgroup/ kernel/sched/ mm/ net/sched/

--rl4MiwGQ6L8ug766--
