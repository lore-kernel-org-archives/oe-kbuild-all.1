Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7B2F12AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920485; cv=fail; b=PhbYHpzD6EVqaT7BXV50eFkbUNYNrw4H1FZAsmu0AWurIQUcO4HyC5H5xallV5RCzbB8fJylV846Jp1aEUeqNjfb3PBbUeaz/XaRWLeVAYvLG1lHBwWOOySGGfsb9RUXitSluBPUCjDCTUt4MW8Ung5vNEESZpWV9lt8lfpdiVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920485; c=relaxed/simple;
	bh=3gkB70I6DU4kbH8prE1X/+RnXUULt/eDocDvvGRrNPQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ay9Cf9dnlxGtZchDovaaY5/FSwC5BUh3ocq7ZVwLUqZyE2vRM7aI31oF3gc/tMrwng889yS8JxE5OvEhLoO99FXSwe3DH3XZfzMl0tL8lGky4uEOtf5PWHWUVgF/9KMOLUX40O3HFFG0gajRGxCWIdq8evcHhmqSrEpnSg1QAo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpu7XUqU; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpu7XUqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787920478; x=1819456478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3gkB70I6DU4kbH8prE1X/+RnXUULt/eDocDvvGRrNPQ=;
  b=fpu7XUqUU+U1+sDo3Y+JzXgrM3Lv/uG4kW7gM3zkgvPJpXzKyzjKlqGD
   XLio01BEXBd2l2l8lPu/fQKrAllo2xzVxOB8P/OjeTJt//8148FS27Hwl
   kyd1vE2ZoVW1S0dTqN17rw8FDJ9xtyKZZmvUpNPvzvWwNa7muh5kLKCe+
   I9rULhn4mgCzw0cSYY6kfjj+3X/NSXKJuzHi/txvy1A8OBLafx4NQJvCp
   ALFG4sqsLCFPMZPRavsEXyf9TgwtcYbzlXmIHuRId1N+kg3l+/NLlFfUj
   pknWOYnx+cfRgPv126RqG/KTZCjwTyelOZNMvIvzOVhB4dBgNe67LYv//
   w==;
X-CSE-ConnectionGUID: IejQLe7QSO6Gi3KCLuMN6g==
X-CSE-MsgGUID: +FCgDFaWSLGQpf66lNzvSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105951255"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105951255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:34:31 -0700
X-CSE-ConnectionGUID: HdGQmPSsS92wHUWdKrMW1Q==
X-CSE-MsgGUID: bKdhK3BDSKy0BCJRYCQxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="261994932"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:34:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 05:34:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 05:34:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 05:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofKr5zeRxjBgP12UcuGzY7XLBNfL6wqyW3DlB6DD+a96EIt0FYCQrjdMOzHs/vUrszVu5o1NA9y+YG9JzWiHIt/QZuHqYjLXiJyMc/HtaD+pDuVc30Ns+ZZVB8Txfl4j66D4BWV/RGErsQt8gQwQU+QVWbHk3pBL2TH73jvC21vK/m9NSVQGwxH9sV580MmnuxncBFpl1HYnj7ZASFWvxv8oNeC/JMTMe7YOQ5uUTP/70okZIgf3d8enevK0y8YR9krRN5C8ShEWbvnrkhCs9uwjZDu9kHAfx0mI9PydTFYEWM6UunNZ1ylQc0rs8xcrcEtnq2Q1Enjqz60rb09FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5qCVsn4MV9+PAoJ5bOIs0wSIhrhmT/Sb02mUc5Pwc0=;
 b=D18ExyAchSqDPUKwDB56A56jJxro3E31UKrX+KpG6Dc+och0iXwOJAfaD6YBWMin64Tfzb+QqP+u2BF7yjj3J4jbfTF/oW7tf0y9mw8Acl+syYGWswBWw2JI4skz5tDnj1U/LrPz/tkIL2BurJxQzLyjfs2wzKeJh+/xpZLyFvEFyuGLj/FLRvHiItpklfCPDyqHvhfk38HNdKIXns7jFjq/XGzvgTZ/biT7njq4GBay2I6NwugQhMaDFgDqNr5aPXxoM2PB9Yi0VhIShumrpI3SiJi3rczuP+Kx6i1T95W6iFYUY5evqkk0QtS2DoJ7k1QUlJZ/20Nrrj5jYrJO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by MW4PR11MB5822.namprd11.prod.outlook.com
 (2603:10b6:303:185::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 12:34:28 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:34:28 +0000
Date: Fri, 28 Aug 2026 20:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [anolis-intel-cloud:devel-6.6 254/254]
 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct
 pci_dev' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <apGATB5gBnGs5BfU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0004.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::13) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|MW4PR11MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d71594-13bd-45f1-10bf-08df0500b342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: IQG/mr1VEl1je+mWiG2AzS6luG/0Ur1vO3bVMdlBf4NAYP07gvV3LYMAsMUugyTP/lGcTHL5BMsJAgNQLi4qDkO7N2WxCjE7jbhcJkXQIDULUeAtkpCF0x98CFoCUidNdYPS+fwnbYd1i2076fiq2mF7Yg4BOC0K+QwYt45Z+VsSgrHAGozimPB/7aKvaP9kLGqN2pNw6qk5P6+53bb5btJrlsYS1hpMIIRW+DGmrqn6cxCK9vG58J0zDV2xDSsUG6tcqkZ7hZNQ4VEDI+I2zCCUx7q0CBEldnO9LCsan7d2T/mylydFWSzys2W1+EV1q2QWuMO2HKBWQYufsa1C2CduIxRX3SW6J8DEMbmYpXk5/ydsUe14pd8zGG5K6RocgiTSVSLc6f8+GUZoyzocndNiAXoqUNoM0xPgrLVD+mCTKB7y93aqno+lo38akqhMaZMJGckBleljR4K6CzCz7EIACmJdv3l2dJm235cpWbi1A/8pNoWtuFJkKYjh2ZNgy3KHUN23WCpRyLtwceZ59vpX0YvW0I229S/g43RxufTXV9La/iO8/9LPuF2Fu8AaRX+G1RHc1v0+Mhtf2kb96VmI3wNatKB3txb8WymcfSkz57fA8EOkpdblBBF1Hc00
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZD8bJ81DruOtOUokNkL2qXotfewRr8tf99a7l2tNXr/aqP1RecCCPGWZCfRd?=
 =?us-ascii?Q?V5xYoVqXobAcpZ8X/hrqIIm24BbHt3ohTofgqfrI7yGfYkRyJ/iYRIIYwyPN?=
 =?us-ascii?Q?A42sHq6wexW9Xeie9Ia/qGf2RfYM4rTLMPzcsONHJC2u34/Bol8JANbiLI4Z?=
 =?us-ascii?Q?3oZuo0xD7sBDQ2zg/5c0vcBI8nahknEQQzV9l71YhhVPRBzSpcXtCfrbpArr?=
 =?us-ascii?Q?VUV3U5qINYrL9LUdLbBuWo2l0x38kw3lIss5bFKLNOYBg4cp2hlZ0p7gjtnF?=
 =?us-ascii?Q?1XEMkgECWBQ7ay4smf453FViFQTG+17T1E5XPFtTwzIWL9LxHQxRlfdxqbMd?=
 =?us-ascii?Q?zkiZPtIF7BjtEK5ayMFAeGqCemzYScuMqq1p+uDLlFsWKLgrkpaeB9fBcrN/?=
 =?us-ascii?Q?c1fJ1KhmdD3vlbepbXDS4Mu8/48DeIgypQ5VVsyf3LSczFbOIzedz+LmdKWe?=
 =?us-ascii?Q?C7P24RKnrTR5bw4bTKKznbpCsaWOSIedc7Fkt3cZMoHmDMc0WeK4pC3nBjXH?=
 =?us-ascii?Q?pgC5NvMaCssw6sz4jzOJMDEJzTmeYb0YWgrqrYZ3lqZNSx4NCXzuFnSOQDvA?=
 =?us-ascii?Q?ftli4JOvhDnIsyMHJEz+AivMWfijBOXULaTHWwhRXnukbzNgWnO1SKZKHJSx?=
 =?us-ascii?Q?2FlTw6nP/fZklZUfCZxFeiCpar+OSoKLWOPl1LXCcXw0zOqiCh9mooSMrQ2X?=
 =?us-ascii?Q?5QUxdh6g5Tu3kDsmB0KBU5Dt++vVAdF6TfrQspmAHnD/6gWlipqa9cg85nFa?=
 =?us-ascii?Q?nfQZRZcBV2k3TyaKT7Vl4DUGEeWCiJ2Tq4qSifyxCRCsyjXYJw5dbwuvY/oo?=
 =?us-ascii?Q?XNvvErgkDOwAPtK0c3ZLglmOdE7pB41IHicpz6dmawAbkoK69VS3/+eYPakj?=
 =?us-ascii?Q?F5/uSWbwADhAMaoZokK6FrFECpoQ7XC+/JZsOl5VApZQvX2aUeFgj+OEdl5L?=
 =?us-ascii?Q?Lnowc4TCWuEHcc2csHCAxwPMQ2XErLR3f+287VOpyc5jhJynuAKug9Vu9Utp?=
 =?us-ascii?Q?pCr2SKxofYc06UnxzqCs43Jun4DwPX9RSf91P/xBvcoN7IoJsf6TwECWmm5W?=
 =?us-ascii?Q?SjSPpVNaSCvBV7GRBZnCyEDIKIVsJvCsFYV6P6zeQwS0kgNtoyN9EUK5BLZI?=
 =?us-ascii?Q?O+qPqLHyYp7TYhubQg3/3SBt0cuNVRXZ0J98CyOU+Gpm9C1f1MGs0Rmy8GGK?=
 =?us-ascii?Q?awGvChkRpZJ0Xu0rTdHkzeTDjUW23NVjmDwULlzKZsw8QZM0eXJXZLq1z089?=
 =?us-ascii?Q?FMUFXKCpi30eLDpaONLK4zO0BcEgvuNBKFfFdl1LR+7xl0Bu6pY4NnZh6xqf?=
 =?us-ascii?Q?2gPL+S0Ui6/p0KKed5gaP/ohVoGfuCifjZiIwt/ToaoqIEAJ8lfqQRdGr2l1?=
 =?us-ascii?Q?qwKJCtdopoYwhvAqs9JUVLQMTv/OGVRRzCZ9VHn4lS/hcoC204qWo+j5AW7L?=
 =?us-ascii?Q?3O9Yh/Vb+bIlxBQTyfAwHbe1oZ0zH46+3KCm4U20CH+AvIArxCUPnK+/oKon?=
 =?us-ascii?Q?Wfq1uNh+VuSocAlOsZ+Fj4l3RqqRGXk4qGIkbaR552eS38EN6XF4/sNYy4Gd?=
 =?us-ascii?Q?vaLB6T11n2EolV4T8Ftcq+loUMMnV6EdQwdJDfwxHgFC3JpO52/i0S2G4uzF?=
 =?us-ascii?Q?ZvjLjVYGPq+1wbobGu0vnxra+HuTzz4ulKy1vN5AZ6jzgbYKT/FYusNseUil?=
 =?us-ascii?Q?Ba4uW3McHiA25IMsGJmuL1CfZ6l9qRvJzWAKbkxfp9l4IMgDTBhIdkOLncgn?=
 =?us-ascii?Q?3I1c/kIIbA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ArO8Y/Ksf6FPDyvvhDWT0uloA6/7M/QkNualgIQak79TZKCVVXY7Ys+zB5uQBVzEPfwoJ8CCqqPK5uT39OU3EeO/jINU2cSa+ySfddoq366XfYmA3EmG2Kw6PHwnS08klXD+JFK8AchY7gNyjsXQ9A2c4pmtdUiA6qyiFAHDSQqoDAVg/kxEKUkis7pdcM4WcxOK//ClSlloOX5AC2W+3R80fj0DwC6fHAsBum0SIv8qm0CO0x8gOOl805T2E4D4nguYIJrExGPa/LPlGIGZ1wyDTMB7OQggun+A6yb7+w0oAuWNK3FJN66K10w5Bn0UpfTRlRdGQvipqdPFNBfWTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d71594-13bd-45f1-10bf-08df0500b342
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:34:27.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFtDWcM6MMY3fptTMUdu3O36ueVEhAHFCDEVzCPXWkYRgcgMTKy+bSm2wn9x6TwDAgFnaUN4QyKK3UbCFsoFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5822
X-OriginatorOrg: intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1cb14b8ebd706a55e3cb0251941355687e595e1d
commit: ea3a4739b72d7d986abc880bf040ce542dece955 [254/254] anolis: tools: selftests: Sync vfio tests with upstream
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260827/202608271249.TkPRlEiu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271249.TkPRlEiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608271249.TkPRlEiu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:14:
>> tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration
      67 | int system_has_dca_enabled(struct pci_dev *pdev);
         |                                   ^~~~~~~


vim +67 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

