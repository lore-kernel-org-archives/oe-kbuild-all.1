Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765D34BA42
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775367053; cv=fail; b=VVZC4cu2XOANd/R8S4cP6NH0xE8lB78Oysv2KBH+0zxWYhxYqMkN3vjoA9BVkGFmW8YcPwoG100hg7J8DS/BQ8SY93tKhZF8h4Ml2FHwiysRdppqG0jqLJulM/YH1vHl/X0KLCJmLDQeFW5WLiUOnsUOCtjH+jaIp2RzICjIl/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775367053; c=relaxed/simple;
	bh=CdWt/fH7cWoJvZAt20JNlA3azgxKHlic3SZBhRA7Fps=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LEYbmpFIbDHo8kjopBwfSsGsLOvleSWDxhDZLNonofRs3AMc4Y+3mLoncYJVDpRKqBHs5x2gXxbTumCmnsVO/YSEMwb+iOiZ5xNk4T/sWkqBwGj+JMcWLCb4LJVknzyFPu1oGppFRUXEikP44r6ccFaEqZ4MuVgJfgpTxVwYBrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGl89tWN; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGl89tWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775367051; x=1806903051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CdWt/fH7cWoJvZAt20JNlA3azgxKHlic3SZBhRA7Fps=;
  b=QGl89tWNOv0f6w7nwqnvNKejEGpxvtmiam8JiaiK9fzgEIBs71XhUISo
   OgQi8zfxOvd3BP62JXuEj6JhX+eBpV3oeC1onTfyPKlk3/NQwMzH5VxiK
   LKSI891UblOn7Yb3igXnuCny3skmzH5n3slee+49nIVImOvbSUPEYvd1A
   SDHS2ixRMsOyg+zUma+AiZieoKqirpvBY+PEHFDm9JvsvFtess8MmxjOd
   8yL8APZ6buV5/IXoWQHquERwEeArWffRp72/2VOzSKIgYvwmDg92x2kV+
   0vmW3J/im44SKH6czIXlc+WEVQuex842A1pZ/pFG82U9aTLShl47pc4DK
   A==;
X-CSE-ConnectionGUID: 9ghTs0dURYqyZEMthu+/tQ==
X-CSE-MsgGUID: UZlsZBI5QqGS4Z66HIbVQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76485071"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="76485071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 22:30:50 -0700
X-CSE-ConnectionGUID: QdLkqMYURp2DKC1urXuGVg==
X-CSE-MsgGUID: FhqgjtyIScOpyk1YdxZ06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="221005636"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 22:30:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 4 Apr 2026 22:30:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 4 Apr 2026 22:30:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 4 Apr 2026 22:30:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+l4J2Zubef0932F3dE3PbkVDFOZ82XzSbyawJALjm5g5rBVqCEgjzDBG+RiU+nxbpc8GuZJwyWkyNw1CJFz9uVcJ+gL/kl42Dts4Ookb6zvMtCMsPQV4PfEqyUPDA/Ieh1agEjE6A5z2G8h//2alJUNs/IQqWr66mR85RU/VpCXLUc0nALzT80e1f6PRKk5sD7R7zsyC4VzUqfusu7nxnYxbupLc/+fZd5DyaGYedeFsHbgvx2wjPwgfzejmEsU0dxsLtWrR3SfEK0w/ghOm7w3YFKQOVeBITuGC8hVkUDW31Lo1VqFBeqRJiJCPm2uiDVk5odh1VUgPixfhNcOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGeCXEilb4zmIIWatHsndIOxnUX3YEjOod4mJTZtNdo=;
 b=bnWF8KTiIsaieQDlay7ulxxayKEEVv6GANbZMXqClPbWxUga1TZOtESoYTlL6VGlsoZAZoGbz+rySjQY+9PqIDRXMV3ZNOWyiuQmZ/i/pL1HOVaCsILbYEqI8J9FbO5AxorDbgNc5q3i78+sFkVKt21I30cSr4zSfghSXgnc4uCHICGtL/XJLTuWMwvWL1u/9zObFQTn5usChNxIJXMluka3I9QFHfCtfdxCBLFpOWKw50Dm4Zd59NDabg4mDkQel/ltX11w9exS8cX/Gxg9ZxyGNBQq1iGdCmu/5dpsYVpKIxCwhcNONF00A1G9s0XXXySjQZIioXu4is9oZER6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DS4PPF267298081.namprd11.prod.outlook.com (2603:10b6:f:fc02::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sun, 5 Apr
 2026 05:30:40 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Sun, 5 Apr 2026
 05:30:40 +0000
Date: Sun, 5 Apr 2026 13:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:klp-build-arm64 14/35] vmlinux.o: warning: objtool:
 sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0
Message-ID: <adHzeBSAj/XjvQ/3@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DS4PPF267298081:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d50f1a-ccfd-445a-86c3-08de92d47934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2ZQ9jycLZXiTocCLNk6RSqSuK5BcgeLPPn+p3bX9bU+evyuNlsEKLziEcaF9takVkB+L9gnb+N/dLeRtziiCJQxyKNyjRD7x2kAKE3N+Teie/gc8iMcHnDcefkoH2kzdMVrEvQpixv6F1SEoRdPArfZNjyLJGVZsYBHmzJy2u/j5jlYmQl6WecRZywzY3RC46ZQIMtRKp6jc8rAq3mDE+OhEAdcXi2Lv9v9CajvEfqJ+zIHMCgtehn2z2USznWwWSkoWsX7CIKF9puHzucnBmaldi0HiIyUxkPJ3+hMLpx/mM2OeHqY0Ngxm24f3YIPRF9rcmx7TckgrG7HJz/COHZJrd/tjnuT921LwHEwtOr7O7qdZMCh6Gawkw2WblVJ807puLzTS7eVuMN34OK20JHyZZW5ibIbHXbGrq30WjCEjpENtNUDXECaNYqXJLZl93LpZ5URVOKqWVXxkwc0meSDyHmyEEWLmiYm9GGlCKpVYxgHm+dVRb9gX+ITB233n4n8riQjYvcbGQBKZx6WRDyu5MMiUy9G9SePC6IVrrF6wrXUaBDFZaoTmmo7ToSdlr7YTHi/93m9PxHjRQ5thZpTsNO/qcre/J75fXPBBycjbknugqlGfKk1sR28BoPI6I6X5Lt5ckxwDKetgiLLnb6GG54yxNZIwNkwFcsgSOZxtW0tyeu1ALqcWGaij84LKCtn0TYEFgx5n9xtdJsqhrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WidifN0lkOTjrTQgEf8Yz2YxKLB3gT2Wm0NZhkWsB22Au4+ctWskL+isScoI?=
 =?us-ascii?Q?c3tlnLj3mULP+wrL1ONjM/I9xMC1rmtFthPhOPuWXXQhwVSuDsvh5fEnh8b0?=
 =?us-ascii?Q?HF6kTzDbZtJUBdJGAl9i381OM6ltbtvZear+ZQrTamuq0dEc2dhmlG1gHVA6?=
 =?us-ascii?Q?y5O+ZTL3BhBeePfLNSndFKM/SEoFXzw+xYzyxho/Htjo0kwrHVtqSPIbnQB7?=
 =?us-ascii?Q?CXUM07T7IVs/xgVEAUYBfZrjpYkHWg5HmsyPBtmWxoYN1hpkEY/ORywLl2t8?=
 =?us-ascii?Q?pYwWgj0SFFRXb1vrmgrYJGkTvwlNW59+OcHXXRh6adAQVipK+zzq4lvcUB7N?=
 =?us-ascii?Q?jUXi+/N0mnHYfocYTDLMtxavTS8mtuSMLNwOa3cgO7YtcUJd9Prmv9ZOmUbg?=
 =?us-ascii?Q?QM7IpOoIqVxT6v5AxPac8tNshyL5rwyCKq0gGMcOemh9gMHIi+hFBngyaPkW?=
 =?us-ascii?Q?lp8k6/OCde6QH020fqBmWZknnybHhUmyegzxPCC5CmlTIOqneoNzliwctHuk?=
 =?us-ascii?Q?E1NxweeylWITUfVADDkOFuD57iT0wh1xbozxh2D9SkTAMZhPt/gBHMAxLDS5?=
 =?us-ascii?Q?RtljaY6Jw5F1BVEziDmlm4B2mgbOqcx592eqASLNGRJ0pf6xzQ4OCWTWVgz1?=
 =?us-ascii?Q?sa1QU6TziT7xZ/9fFCa8gDxweYcaLmy7WpS/4N0YiQrFjG8bf+LeOvjCn6sV?=
 =?us-ascii?Q?vR0/8Wqx9BIwnFWMituCicb84Gb0vxDebXMwWHXBr2fMdip22rn5ZUqgprSH?=
 =?us-ascii?Q?H77uBedPU8zU0taxqlz9WDHrM+YNBFBBY4XuwvzaDkf/17ADAhC+p+4NFeQt?=
 =?us-ascii?Q?Me/OoVkLrntjrH+qLfTB+t6wLZT1un1Xh54lRLYZeeq7Te4zax2ki/aOIycf?=
 =?us-ascii?Q?Vatzb4XqxT/UIK/9+Ub24nuBy7mNfVgojwIFHPz7fsT7iUzhm473QeUSfyaW?=
 =?us-ascii?Q?C2si4n2LqQFdwVd0qsKPvstCaMh5Uyt+5jSbP3ZgI4ax6CLwGCyPPwocvq63?=
 =?us-ascii?Q?e+lMiK6zlVnZGcj9MzgJMx6u1MFfsp2ibmKZ68UAVQhRRNoaXxnNMyoOn+Tv?=
 =?us-ascii?Q?d722EPaRvyjtqkQymLY7pNWr4pixLzJFTFQX/do0YDJ++BFmip43slsTjo55?=
 =?us-ascii?Q?ilFBBJ8c3RNW7stb8z8qkYNjvWCTbYiy18CbxriVZiPJ01vDEyKvGtpvWbah?=
 =?us-ascii?Q?yhcLNxUpXk94GbZOuHewLW6BpSJ8L6rmrSxkK7019Q16ahhaFOBldcLWDP8L?=
 =?us-ascii?Q?P5iB94wuuHHMdDrowpBa8zCS5kkW0wQdtlLlY0bPZM+PAhpEeRPrXmMrvUM0?=
 =?us-ascii?Q?zzM61fCsg5o8tpSq9O1KMEPeE+yIbT+0Y4yzBMpL9DW9miqv/5scbx10Z+Dn?=
 =?us-ascii?Q?BB7qTuwxKTr7T0uVw16rkKPw+z19EeDZMkDssXsk2nGXJcmHeG79I9o8q/7J?=
 =?us-ascii?Q?XCMhPLWCzRByXvZUWtqn44L996LiLSZ9AbB6uEsWyfZqaw6U19YoKqMKl63Z?=
 =?us-ascii?Q?tsxjA3Gxcmic7/Qme2XS92ezWUO1WrNgrNjMG7Z30J8jWmlMZIPBcJKlbVZ5?=
 =?us-ascii?Q?rL1D8iMdcAXZqQWa1L4SQcWXiCEN0o+AmHPsRNfBgyn9/Xkm6l0lNF67YAqP?=
 =?us-ascii?Q?UMyJosE9BmEWxCIRDHRWTJtMW9Ix1a913ViVRrO2Ucyof/nhOx09iSjS4Zui?=
 =?us-ascii?Q?ncfo4KYQZSIjl48CG4LSH3/30Pi7HGOSmiOBumgIoyPiJGhH2kp2wvsCdrXf?=
 =?us-ascii?Q?H3PlsGX1/A=3D=3D?=
X-Exchange-RoutingPolicyChecked: tc4MrcgKc48e52239Jmna5I7sbcKUmRXFfz4XQ6CwYmX4M/WBXawiLkt4NgTBUhi0ljgnCxERjDYEA7fHws+Xgg5xmrLYL8Xqi2TACxtcVrXhNTar8Lxzmx3Q0E7aQqSamxNyCx5/p4g4JUOAsVs9Xa/WPqB0p3LVhlEKkX1duJL6ivfl491UzFPlwvWZEAEh2rLJ4nGpUIXRHNTUQEc/laILHh8XVqU6xD8oIDHmFg+4XJv7wK5kjoRc0iUCd028gi07t8nClLEDLM3hEJryqcyzW623LoktmICRcuh9ahvJ/a/nSQSq0LrP48bJ02F7BxNg8FATmJri2uStv1H4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d50f1a-ccfd-445a-86c3-08de92d47934
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2026 05:30:39.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1w34FPyCC0sAxd/aF1P57ssb3OZZ6kn2uobl2qILfrMVTEfHTomdv9E4b4GuVpJMMaO9RqbOtwBqz3Y/ypItA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF267298081
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   96a27804fbb34c0e19f217848a8cbb91841bcc35
commit: 34289a9c265ced49097f0b40855c8b19a0cd62e9 [14/35] objtool: Don't copy insn->sym for alternative replacements
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260405/202604050712.kxAt4Ah9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050712.kxAt4Ah9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604050712.kxAt4Ah9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

