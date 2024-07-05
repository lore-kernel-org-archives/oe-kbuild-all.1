Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E14596E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720169294; cv=fail; b=DDytMc+Jz52o++OVVQSKS8aoi5u+8mLzRopaQqcF+kkXhgT0YcFeE4I2e5NOiYDyxbBkg02yvRmb0dqS+1ERfCjoCxZ93ia2cWVkigyTiNEYDptim+CkecU4W3H3/RA14s87PFpMQWi6hiLTz9Wxc27HcqJVPz0qireBUVyMBsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720169294; c=relaxed/simple;
	bh=6PlAKjHkM+zz3ny6VrRyl+oI+f9nX0VFJV7sFUf+jzs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nVGxLXZPJxafqqFvz7PcuJcuIHnmGYURfqIzFnnS6oM8bA5tyBUouyLYOjqV9QtaR7LHdO6gZW0CL+iWmkZCOQO0LkCCIWh24/S2eEFg0uJnVFYB+Czv6ELcbofOqcHnDMivW5L46PhafkiPkwnS7VfWN5aANtmNZvB2oFwQjmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDkppTuo; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDkppTuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720169292; x=1751705292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PlAKjHkM+zz3ny6VrRyl+oI+f9nX0VFJV7sFUf+jzs=;
  b=lDkppTuoEdp0LqvTK9DaGuVUuqbsW1NG7sxTKwkqSdhTSMYFpzR3Cmrg
   U0wKJFOawcSIjHZZDI8K1Z9H7CEic7a76Bp0mQyXCjFTNkc34OKm4ZBGF
   XFLqoFaWk46FP34Tiioq1bWqoVc38FkpEpLAdcO/46URJFuo8KOM8Bdii
   Z7S3AVresjOEqCEZVOkuiWDrZE+3aoytbXy5S+O3cIf68hQ0FQ6t01sNL
   oZkQ+q+T4qmcdu3ojmgtrVuqdoz1qeITuCl0ov3XRQuxb0uWds6R0Y1R2
   yCFravNqhqu4VqBKVQB1gAfg0nVbugjGeTiCCU+LlJpQ7ur3VYCNNN48p
   g==;
X-CSE-ConnectionGUID: 73uncmnzSIKQbKfr7SwZSQ==
X-CSE-MsgGUID: 3Oe/+FDTRfOib24HJ09qcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34995470"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="34995470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 01:48:11 -0700
X-CSE-ConnectionGUID: tiLUxvumTAqEWhj0UhcJgA==
X-CSE-MsgGUID: QL85wNXbR3W3UI2sqNewkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="51672731"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jul 2024 01:48:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 01:48:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 5 Jul 2024 01:48:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 5 Jul 2024 01:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/ZvDlhM1epVQfmIRxsbgR78alPq8WVq2Y40Cy32r1liVpJ2b+vUKL0e5wa//5IGnIOgZ0605XBZBKQgmKwoei6ppT+nMQAM/eTq/GvNEpLbmVw0nzo9kW4vWgfcVxg5uLnpYbEcjIi4h2T5ZgtPO+XqcRd1NSh8k6qs2xIvMwnGY9paeiYnRHAcqZ0b1dEfGWZxwBozZcx2kbsvVvYJ/4RuXKhx/De/IYRguu710afCdtqJhPDGDtAqe1B/3yS3JIHifhwVCzHGmH1pSgNcrwHKviEttjNIyJj3UhzAlVXIEgofBdFbQKxiqz9ZolJfj/QtjPjwZCVP64pczREaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh17t6MvMHDvqO463hxOviBcXErzfKdB+VF01aPth8M=;
 b=APrV4aVjFyWbkidJMuGK9wWPiB6hWn5PiMDbmAfEiflJGZe9D/vtHOC5MSOzxXNwwPnSsZWGlcy7PzshRUPhcV9YPybR3R54BOgwEs/7UyskrdADEsz17IsLbylC2BjzVr1ElZEOoLcdi8NWQRxBvWLGnCTaPxO5q56C9grYbDjPR4ZF+TQcmJX8ZkwbL/SwtCKq03CjNxoabaIHtn8qifNsCuXSy0boLUgNpRu69BK99MNigMcjTJPe84RRoy8zKMhEXI5r0E/C8vm86RRC36dPOG+bkLZtkaFHryaiRsRp5QZoKaW2r9VQ/jLLcDhOBDJmYPCskI9RU3mdRPUMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.29; Fri, 5 Jul 2024 08:48:07 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 08:48:06 +0000
Date: Fri, 5 Jul 2024 16:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@sandeen.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [sandeen:f2fs-mount-api 11/11] fs/f2fs/super.c: linux/fs_context.h
 is included more than once.
Message-ID: <ZoezPtioHjEwFfjk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b01275-e936-44b3-bf0d-08dc9ccf302e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?91vC1TVsnRPwBwsKCPQGnZJQ6jbsRGFWDj2F2EAD/NNE2Z1Gk3JxWvv1koWw?=
 =?us-ascii?Q?4/SKprvPelMR35veFvUSB23BXBVWAYie4cPBbScfwKbmUNE+2Ixn/MliMRzd?=
 =?us-ascii?Q?VGvnRrpbzVCJWhUqdZJqMxia3gJkvfTBJg2YInLmvOTnTFZEbkn7zrhQCxRD?=
 =?us-ascii?Q?l5GqKrKb3UGPecGGICpzNI0CCa3QUVD09i58VtQuAOBaF/Mj9yE3Wn/LBUrT?=
 =?us-ascii?Q?nDoqWXf+XtFUemlJB/qLlcFNSwKbnqSHea4wrKoeLXusriAiHy2sDHSv1Wc9?=
 =?us-ascii?Q?3nwCH4pnfbe2Dh4fKXULKqWCwjLQdBI4CRKE6NSS5WfpkJcD1DaQNWma9xsQ?=
 =?us-ascii?Q?0Y7YUbGkHH86H9pNow2QPMEOe+P/OHVXJ7C3a50x9MbRPGWNXpOldkzyqk5J?=
 =?us-ascii?Q?U9foD7WIV9hEjMPzzxrMcwCPjcPVWXUaNW2+exdqUnCF74OziR6Yc8uqdBM/?=
 =?us-ascii?Q?BqzNBVSM/iOtu0XQwZc1yWOFfUrU6iiQtx8C3V6B47gLxYE5luKqtw92ikMt?=
 =?us-ascii?Q?i4xpdzcIg8h1IVmKSixeHyJmMxZMzUWEnJVD+qEs6xiO/sXl0mxXL9P1OoTB?=
 =?us-ascii?Q?U90iPJiydKA+OzIFvw2PZu3tVnWeN7B61rntjV/uhimJg1GtVe4JEVVHfhEk?=
 =?us-ascii?Q?eF/vsg8u5xb/GddMxJIid6XnZaygrfKYayDc3lxBlVX6dEu1BDKuEOwUYLXz?=
 =?us-ascii?Q?nSaB0hZ/rP+N/NritFD5aYhpTnmLRyU6R9vqD31Gsm6axhPZDDxnQXTqYsgp?=
 =?us-ascii?Q?jCo9DdW/knAVQ1vwzR2Em69G50YyF5nce0Zezbk7Er2Ne1EcCs9FvdY97fZT?=
 =?us-ascii?Q?xVzbZHfi1sCgnoBpNT/3n9HqBXsv+NETuOBM1/RcqTqRXcc+m58QLvcPgRBU?=
 =?us-ascii?Q?3WrHnPrVJEs4N14CEzBMt5DYDWx2iQLi8rKZyqizKHCsbL3c9xs0R/Aus3JC?=
 =?us-ascii?Q?sXNYEll/PDVZ9tkYiPmTF+6M14buRuvN4K2+YIuWKm+nMD/eORV8ZtusdlyG?=
 =?us-ascii?Q?+uX0f2LQB79csTw/iawm198amvIAkRz4hBy1qNzL+hIh97ixVBwqCYC7ImJs?=
 =?us-ascii?Q?9qx+FuXYLnmk5gFCWXWSwmwQmGP22k06FARc8dhPYUyYwDbc7I9FF0+6dwY0?=
 =?us-ascii?Q?iEz2lGgCQT+irDcXp7POTnwXC7rxKfbd6kPZ+9Wti0yR4qB8DYwFRkyHfHet?=
 =?us-ascii?Q?GSqyZND8j5QHolGRtgtIU2vAHI7nidp2PbKONkqZ0CZ7UPl6fug5a+ogrnbs?=
 =?us-ascii?Q?01cDCHCgsr+LdeGEackcFssbh+kfnumoF/m3LCK/wbMCJa58F/B/Fl7Yjurh?=
 =?us-ascii?Q?D2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4YEhuodqdfEznevza2JGeSFT0F6BZJMqRdITy6kNAv7ERRHwWxX3Vdvrol6s?=
 =?us-ascii?Q?6zjxbjAsZPP6HMys+nluN6IQHSXocYwmiZ0AsdrDhM3iqTx5Gjl3TcAPF+in?=
 =?us-ascii?Q?cekmRYzOzjRVlxwuOlNAOtZM2QyEP40K6ROD3WkpCXRXqn1fwoE4caIuXhfR?=
 =?us-ascii?Q?t48uwwWmZsZ4yuMFqRHaJJ6v9i4yEpsQCENn3i1AD0cVVZFw4oLPHAen5jsB?=
 =?us-ascii?Q?J9AhWxKggVE/rxpeXZsyRF+eXuP7SAOVjIoW24Om5vBU+OU2vusGDEQ4zNiy?=
 =?us-ascii?Q?HL+NmFqpCUiDL89+6EWtd1CS9PFnaMNNWD3btdSeVLFerZLTss16QU3wpzrH?=
 =?us-ascii?Q?3kfnF6PJDRbDf4HfQUCp2+fQ7iuTXTYP6Az6b/6HPnN5Wvb1WVTXy03Lg8D+?=
 =?us-ascii?Q?xLBiwdUgA5Ukg1u0EvEzVWWZ6isMiECPToAtvfy+b5dDRkxhxk1g0LXLOFWj?=
 =?us-ascii?Q?Cf71BfzLjj7xI5bR03rmxtiZz/I7KJ3vgW/MeegQLw6zGFmcZZcY8F1eJ7Eu?=
 =?us-ascii?Q?RQsMbrDBcqm2oaiyxA55BNEvAhFZjyJzvhlRu4ev0LgL3Fei6BaaGVJpU/RB?=
 =?us-ascii?Q?I4FhOKOdKrOxN95U2mwtigPblbzaspUnOVz+jFMyaTbP1zZkxOSk/puhAPF2?=
 =?us-ascii?Q?YJlQlZnKS4ui182ZBXq/sBhwaoju/4oRqDLc0f7kn0kdw6AIVxjhr74Fo6TD?=
 =?us-ascii?Q?2LS49pgV9nwVRu1rg8JOqHk/dIiFPvCeWQk+fxkzH8IGKE5WEy1PWXgzEtp0?=
 =?us-ascii?Q?Us4EHbQY+Odm1GTZTzHUT2RdyCLszerAFmbeLxl/XMg1M1M6uEzIFBe9OMGy?=
 =?us-ascii?Q?59MK1oRxD37HoiWSds7an5bhzZrGh9iKp39xMfNGzy4aQd0eGuvzFTg627Qj?=
 =?us-ascii?Q?D7aUNx6CWAvg5nDLqRZgp2KZI1trI7BMBsx050oriIvCgvW1fcSYJ9d6UCvy?=
 =?us-ascii?Q?3h1U9/05fAWxWTMnQCQ4+X2CHXeZZRUCwKver4aW3u1s/2+iM3iJyQ6gC64z?=
 =?us-ascii?Q?L/cDMXLaAXzFlFXcqDKtS1oq+ERwHUWWwADuQVxaPhoNwOU1SYKbFrFf2R5o?=
 =?us-ascii?Q?1dXz107ywSuVhkZ7RzasmAlVOMuFstTRGcgERtyx4+Vz0bta0DP/40BX66B/?=
 =?us-ascii?Q?G8B2eeqspobCsvQ4voSUKTP4WEbBhqR9QwTb7UKem8hEhrtzRuO8FbFu5fDz?=
 =?us-ascii?Q?Tv0x+gn3BX+gJJ8tiYgGSuB8zZMjklPSbpm+joix8/9AnRjfec3oP0KVR5PO?=
 =?us-ascii?Q?Z5IOgMgDJn3z7bWBLPHOV0LAtPDg5zPDkXu1ObswT/C+Llb/PRbXuSilCWPw?=
 =?us-ascii?Q?GaQlqDMSq2qNdhTx2cCSR9qDrDAVn4S8SNxMt9dG/0GxRZITatYUD1U6wpHD?=
 =?us-ascii?Q?ekByV/rtBu8JrQ2gSwFQRPYGmYReceX9u82HVWWfl+GOvWkJcYMqGqGDurgP?=
 =?us-ascii?Q?h4WygDUG/GLRK1F7uS1rNW0PrMmx7Q2fW3DgT9CotEqcluU3jO5Vb+f7zDWG?=
 =?us-ascii?Q?US64CjhUVkln3Jg/OcdvooCFECFHVsrbq+FfkIB/hi1baMQxrj4a6oOKLbME?=
 =?us-ascii?Q?SG5GRfhETP7SA0a+h0+BqGg2W6YbpT7EhtqJTEMvrgr2DD8Vi2Tad/fvW3H+?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b01275-e936-44b3-bf0d-08dc9ccf302e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 08:48:06.5466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfXvAac6jfdMwsitI6Ap3KGZf0y18uNpA2wHOTW4wSamon35TvIlWeJyEZbAgKQ8YhJ66yXXYNg1rhOhFSBfhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git f2fs-mount-api
head:   bf51728fb8134742e7da61ecff42fd585d05f264
commit: bf51728fb8134742e7da61ecff42fd585d05f264 [11/11] patch f2fs_convert_new_mount_api
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407051312.4oyOGM40-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/f2fs/super.c: linux/fs_context.h is included more than once.

vim +11 fs/f2fs/super.c

  > 11	#include <linux/fs_context.h>
    12	#include <linux/sched/mm.h>
    13	#include <linux/statfs.h>
    14	#include <linux/buffer_head.h>
    15	#include <linux/kthread.h>
    16	#include <linux/parser.h>
  > 17	#include <linux/fs_context.h>
    18	#include <linux/fs_parser.h>
    19	#include <linux/mount.h>
    20	#include <linux/seq_file.h>
    21	#include <linux/proc_fs.h>
    22	#include <linux/random.h>
    23	#include <linux/exportfs.h>
    24	#include <linux/blkdev.h>
    25	#include <linux/quotaops.h>
    26	#include <linux/f2fs_fs.h>
    27	#include <linux/sysfs.h>
    28	#include <linux/quota.h>
    29	#include <linux/unicode.h>
    30	#include <linux/part_stat.h>
    31	#include <linux/zstd.h>
    32	#include <linux/lz4.h>
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

