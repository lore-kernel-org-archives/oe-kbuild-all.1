Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA764A23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769323534; cv=fail; b=ReSnBIZAgUL8gOpNLj3hdznPnIJ9QO7vuOr5k/pwLJfTkVq2NYxU/FL17QQbGyfy34B6m3kWPOZAvYoZ5pVMHCdGiu47gzpwiowIU6TukOmU54qL3Ee46QtIGIxlXxjLtdlUTKrufgvKAjYqP7U8/CmNLXkhI+TGti9vk6bcJrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769323534; c=relaxed/simple;
	bh=Ph2BpqOCezEmML03E6Zs+WZt+w56xjP2jFLDAZDF9Xo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BRRgIN7S+hBWOBHqdW8XL6gJ9f6Niu9/jC427WQEcEx8pm1bp4jWzIQJ42fDirKAW8oOl8PX050GZoH/kAsiBh8Ulz0VkTaszfswDc2qlEZMCX0N8DL/yJJ0ivcR+N5TETVlJ6HuLj+SKJ4jpbKACW0sjmHt2IbVu06lR4OVBO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIa0t0ZR; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIa0t0ZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769323533; x=1800859533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ph2BpqOCezEmML03E6Zs+WZt+w56xjP2jFLDAZDF9Xo=;
  b=nIa0t0ZROaSrGPVhokKlH1HjvO9yC9NriAz1XHljCKAi5lD7hv6+Z/7K
   hV1S/ld/PtpLgvlp0Z6P1C58UUl1Dtn5Xfv5AAnw6if3E8kTZlEYreSkX
   nuyikhvmzIPjOQAnBoNPNE1bnJV6/hm5P2PNTZio35VrhWzgZEEVcvzY4
   LQGtyZhoUpci6WHcnnkreFGkQuDHJ1RLPDApc2mSF+l7/o5kx8buXCueM
   X13g9Sb3vdx78CC2ZXGbo9cwWcZDQnrRKOmamNc0ByyhLr5BYOgsUoMDT
   9vS+SHuCf9y48zJ0B7ZORY92YDTZeVNiRj0R3wDWygoEUKFf7+46pxRLb
   Q==;
X-CSE-ConnectionGUID: nbbeZIaPSGeRosd7MnuCEg==
X-CSE-MsgGUID: lc0Ki18GSuCfK6B4UZoU1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="74387364"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="74387364"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 22:45:33 -0800
X-CSE-ConnectionGUID: BdRpRBL4QOq09c8OKsCWeA==
X-CSE-MsgGUID: XyY9dvmaRDGXmdE8kKOYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207421109"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 22:45:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 24 Jan 2026 22:45:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 24 Jan 2026 22:45:31 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 24 Jan 2026 22:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPkF4YXgJd1QHXTGlo/s6aISRUktYlNN6l7h/lqGXbA0btYzAFI2+3eHGMeJIrp0KETC7Cj7AlrMDnfprCMymLWqH/9dKW1/V0/86sNw9aURMiorkTYsyX59IiYpI8cRzsyt6dNVQUIO615fKBPn2FbGH210ZFrameTJ52nDwYspVv6tYDLUSuy3Zb3p1XUX4sjdDbdY7wWp8KNsBE0CB7M/kBe6kQ49c7eEnDov/dIa9JXeQ74d5DI+3IT9YQcZAulUG1rmdgkATUbXh7Fa3Gcb8TyaJQATtAZ7DVuPgUhw+qlV/qwDjNNel6xSnu+/qCeXgWGbE1OMRIuYbZTrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei9fROdAChSuVxEsPr0tVmPn2Bu0IOsB8hz7hvA2bi4=;
 b=C5/GVNONogXtzhDfKsrIZWc8E/9ljLnnE2VpWN0u9G6Mqxdyux0g0qkhS0S1dBfG4Oy1/EQhz4Md+MPHCJI6t7CqSdb5tOmKG+uCvyGg+Hu4yUuOVdJR16j5N08XOGedFqNv0h62etbe1VL6h/AoGco/9Y7yHrjb8RZH1fmjbdSm1cfCjOqkrU7h+aGu1cqLhdp3HLAI0GNMA6Wrh5ROWJXjDmAE1LLA012LlgcmDOojQ44jTpOL73lIBi/+0iazAIuc1618wtiqjjJbo1dOhy/ZCg9iw8BOad9/2Awus9HkfMfNZPKhhuUCOzNS4ln+sQR+hOCAADgv+Cjs83CPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sun, 25 Jan
 2026 06:45:29 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 06:45:29 +0000
Date: Sun, 25 Jan 2026 14:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 5/7]
 ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has
 incomplete type
Message-ID: <aXW8AH+eYxNZ3QwU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: bee89448-2e95-4afd-f8f8-08de5bdd546a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cVm4r5dZCYaL9inRXUEFQJjrNu3SB/FNNg+QsuapA1JnOFUQjjtYuu4Zax36?=
 =?us-ascii?Q?IHUKBImiBaA+IPPuXgPsp/PCgXN8Y/dCxt9nbVPeunkzMofU1P5+8Ju9GX/m?=
 =?us-ascii?Q?orG/Bq9tZkAVlAiw972zDrh9bd1H/1gVaVKsYGBt/wRoBuyJrlDVsSrRGmeo?=
 =?us-ascii?Q?yAe/uUrHo4oinLIEfsj/BEX5Cm7Q2YXyfc50SCxmKhFjLAnjMiXbZMu78U2V?=
 =?us-ascii?Q?ukXQ+e6KrQKO8niB4Jw+s1x9jFqNTnBXElPyms9xec37/oHcei/QwX1SlJJU?=
 =?us-ascii?Q?vfToUkRwLCWunL8uZ6LbDb6SyQCvfGGDKjsYVMYxvkVytElG1Crb/mTspEcv?=
 =?us-ascii?Q?NamtJJDaMoUC/i6rZYQxy7rPSMTzghf5uMsFQVQnzeSJqm5qxkcHZ+wLJEmx?=
 =?us-ascii?Q?2LZUnR7Oew34KulVZSlfPd5e8VCHDzsrPOqKDJgAnwc9id6J5pB6QsVmmBcQ?=
 =?us-ascii?Q?ixTgx9OttY3+K9EyKmVeXLmNgqU2GcYuyZmncAFVtND7aI2mV8MpShSzmcZc?=
 =?us-ascii?Q?7IB9LuYZTufSMcw1m4TnKd/qStTIXqEADie1etArlEzVAKCO0qhjBcbniKhr?=
 =?us-ascii?Q?qWLZhie92yzzI7QysInV6rf4o+aYzIEY1lHTWDCadEaUmS+gRhNETcZVYDY/?=
 =?us-ascii?Q?3wgSI7ByxecszH17s4LDYozmS+wAsKPqcvVwGx7XNC03jI7s/t8VuGdos+Hc?=
 =?us-ascii?Q?mPnJPrdaAPElmaLfeUrsSqNgWb6IVF98lFw9zGUnIq7NYMcF08rcsub+/LJ+?=
 =?us-ascii?Q?Geq/Z09sqNM58CZQrrMm1TwjCfjdschApUUgSbstEIY8ep+qgha5DcAol/hI?=
 =?us-ascii?Q?o6DFVKG4svJWAkJFeoi1cCyfsZddYa6/zxdPb/a5u38Lr3Jfsh/+78hHbHS5?=
 =?us-ascii?Q?t9Ut7uuKnsAREFHWNbZGDTMOhW5omBQYrwKROmqUPOCNDMzoRovvdUDiBNV6?=
 =?us-ascii?Q?d4ZIi1JaTwm65nkZT2BPXb/CPOCivCD9992uWYqQVcML11wV71EC9uQV0BwI?=
 =?us-ascii?Q?arQvUI00O/I0Thipn5KhSRlA2fwJCXhqfqWy1J710Y1O2bzNnR9g6mQo+m2b?=
 =?us-ascii?Q?4igJ/L1DvugyG21IFh43dFP9fWKVTVHM73gh7awtBl4aOB2/W2skEecmI83s?=
 =?us-ascii?Q?c2FqmlGYxNz2VHYHTGkAzJr1fYdK9ybrv8zkL+moCL+5czN9LpmnrCPEv6CU?=
 =?us-ascii?Q?FPoKEIEkQ70TZ+vg5ZN+ETZKtb8ns6zaVdkT7c4twEfTovb006Srdnjq9nfU?=
 =?us-ascii?Q?h2PpaUt/kPhS3IVerE+j8mUgrXmhCcyaKvbBzPp9vl67EfO5ZwKsse0r3CU4?=
 =?us-ascii?Q?5LCKUlGeqFOScQAxSpqdq1Uy79nQ0lwvDvlY6GDZ84s1rxhWq7rGW0qGt89s?=
 =?us-ascii?Q?OlH/Gccwf6aLTQBuzG39o+2HK73EQicUZxWmm+PiFIsKIjjeNUEPaLyTygo3?=
 =?us-ascii?Q?H1gR6dIAHmB2fhRW89vvKRG88m6GR/8i1JWgrYRpvnFHOFz6m/0qQYsYSWIC?=
 =?us-ascii?Q?v2fG24twfjrgMVcRWdPAExMnQ7mm9rpVY1OsFAES0COrit7tbCO1iJRXb7oe?=
 =?us-ascii?Q?WQQTUIwqgEaYF7IOmt3/c/l27c8BY080tHrTIryI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4yRL3XDeKsee6hx+tCAH4tlW+oJrBXPprrXDd4qY1Ir2IsTTJdTapq98H4hR?=
 =?us-ascii?Q?m8L3JOkddEY88bbCXiOpfKCPulWmRJN3eIJxE2eAfpMYna1V1Nmc3W/wUGCq?=
 =?us-ascii?Q?WptuFoKdwqtizmiPOlfxIQOONe1/EM2+0O88sGZ02QHMGEjcaWqiCLLwAEOU?=
 =?us-ascii?Q?s11yaNkRajVBMXgCePqy3hjqlL6Nof1pmt0BkuN+uPWUNf24ezffyAJeioxY?=
 =?us-ascii?Q?NGnA2Y7fjGn9AUu2rAsOzekr7u68AvQ+GdL0ngvPXjXBAQmImaP5j8JRwUg6?=
 =?us-ascii?Q?XQBubI0cTbx2+oFiOgaQ2wk8aCEHVPbzWlV6xMEk5nBZncven35Irabb0T8y?=
 =?us-ascii?Q?CsjedgWn8OSS2Cf9396vVoucRagmrHBkIWms/Uh+BzDmn4FRfrIbdhIZJt15?=
 =?us-ascii?Q?6yeN7eAnXNOmWkc94Rveb+7fj//igS251T3hcKZdaAHEz9lB/8Q44NzmOmZW?=
 =?us-ascii?Q?rWz4V11chGeVay3YWpzdjiUf4M7pKGCps64p0DFHclwu+tT8Pd+ZGQ5b7j0O?=
 =?us-ascii?Q?wHAzOhU72FqBCN8yAAMRiHF7FQPjqu68ff7ukCwihkunMUF07R9j56e97Tqo?=
 =?us-ascii?Q?7N+UEI8Hbq4C5KdmCy4BBIw6RkFSJfqoCofsUdRr+SuZbNNuxjG9Qtjktzfi?=
 =?us-ascii?Q?nBFy1SSN388ewRswGSPEx86vE2TPtHWSngAlXW43UXoMW6ag0l6EFgILI6Xu?=
 =?us-ascii?Q?x5mCHbYwpc9xilj+4fabC4f/vJ7v380qgmbiA63oZXrXP52lgXsLusAIOuS8?=
 =?us-ascii?Q?4KR9kFjEeANUBC6JJ6vgnClyXTT4mT+NaZbtGGGilfxkH1iXrWfX+wF20+Nb?=
 =?us-ascii?Q?geXbvGorzVRCD3NxmDb/1MDEZ1MJ0bjOXvgxJMPuEDbB49+T7cuKAsXYhL1a?=
 =?us-ascii?Q?Kr9ZkT1lGsWpOj3YEHWDdUO5/lT4O9+wn+gJpgQ/HRccytn7lU/WNupKDX4M?=
 =?us-ascii?Q?NilHcHVNfRJ4yFWyYXSZEmRkeSUfdf7EPOqgFmzu9Y4m4kjQluokenZrO7tI?=
 =?us-ascii?Q?FfuQrYj7fq7ycL8ftkZr5X54HdHHCAkrxNyMkjMdIVlYB52c9nqDid3vas+3?=
 =?us-ascii?Q?SBnCiuAtCqvKGp2GAqCurxn4f3hcaCoEe1o7D+3svPUceZNorsB67Ay37KJu?=
 =?us-ascii?Q?FHW8IiW/424L3zTCaYcirx5w7kiVtOmi1FuwDhqflqOkbW7MPSjrzud1ctHO?=
 =?us-ascii?Q?IuhHmlhnDuwiBgWgwrDfhblB1rsBkha1RNTBNLUfkVmr9/J+5m2Zz/UJNmd2?=
 =?us-ascii?Q?256mjrmk/fQo2oFzbl9fwR9JxaBsXsxA/W0dru5yZSbzTd2tcUXzgpgvqovY?=
 =?us-ascii?Q?FTdS0H/Ate94zWhmVvAv8My1fAJWri20oQcMzUkq9c53pT/EjpHSEeL25Spp?=
 =?us-ascii?Q?c2ltsZssvRJvficsy6j9AM9lzCT5B9jNEXa7M46N5ebqjbpy0jGP8+gnu4FK?=
 =?us-ascii?Q?w5Xio8sgmAC5682c1mrw2F9mUM+JmIYtM41icNrOhfe0VX6OoXJCU7juf0Ec?=
 =?us-ascii?Q?NaQTRQcXJe6Ncu93fFDOBKuDWBFhlefNbd8a/4/ptne6t+3rbwbnHhwjdB5P?=
 =?us-ascii?Q?LGuA8eNlUobKjmM1AqC8/pO76LtNJ6ghaglz6FGjG67+mWUBbWaasKZAMBT7?=
 =?us-ascii?Q?8jfZBwGRqzuWB8dDr0puboKmwzdendrVPAjCsJT12TAO97DWzIUtn3pAhanL?=
 =?us-ascii?Q?3V85xN4sOrYgrnERL6Vv4Z6jKrhAsejTzCs/pA7WHhXmeA1+MyovcC4RY5Gx?=
 =?us-ascii?Q?J+KTIsSBkA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bee89448-2e95-4afd-f8f8-08de5bdd546a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 06:45:29.6740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blEmqxMGlL6Xjtc3SCWGZzAd4UL1B2DiIMTyvxpxvtl4+TJ9+SqTGgSDeVPKTPUvAfq1Q1cW9uBOqb6AzN548A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-uapi-libc
head:   42f8899f5959bce93a899d194c5b14d2a809bd31
commit: dad08d57845cdf10080325af1084b1a1f6bfc05f [5/7] can compile
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260125/202601251402.Eifyo0nq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251402.Eifyo0nq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251402.Eifyo0nq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type
      14 |         bpf_user_pt_regs_t regs;
         |                            ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

