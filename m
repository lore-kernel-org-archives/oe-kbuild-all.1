Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BC02D3225
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775758; cv=fail; b=ewJ5+4uxDzxzUYs6+OrJIhBYlPC4xCQcRCxNELw7csuB8q5Q3Us7CT3D7yIyppXh8ViYfaAzO9ajDP00mAdrZ5Tm8h8wTOfhcGyRPi3SXcV8zCBIGBKAIlONHrHcmvgvo7W1eoMAgxcjL8+Lfm8hHu0UK25Fwv6EAOt7x/V3yJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775758; c=relaxed/simple;
	bh=e9k+0RfXZtLeuVnvld5/dkRwtgkN/o0D1jSQuedJq4w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JHVXqhcKQQUC2aym2dADKCqRl7RngrMJu8A9s6s75E3ooZ5/74rbQBRyDtj3wxkCbCYCeYWyTr2ZXkAJv5hX8CvxNKJCq64GW3vnEdp13lRSZY2zBAmhP8/tSowT33/ZfCsbtXifPv3MyHIwSeEYLIbHpSm6DGW1RaeRjjSeevg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nr32osw7; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nr32osw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770775755; x=1802311755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e9k+0RfXZtLeuVnvld5/dkRwtgkN/o0D1jSQuedJq4w=;
  b=nr32osw7GGMoAZtx+LIKGKUudjK+gssO5G9pg3l5uZj4kL2zlaVtAyPM
   MGqOD/tmhkUzpcbE5U3LzsfK3epELupIqcl6PYmwbD/JovL8q0V0dWf9r
   Znwv6P46+6ZQxj6sh6Yjplr5+nfXFm6ZV+Le5YZWSvCnU7VG301nhu+Xd
   WV4q66D8Mn9Ze5uKR2q8d8z/UBlg+asqFBoXej5INyMdxXFEAH20Tafiu
   5+Ocvf4uG/6/rF6MVNsK/VblXkTUsMVaksrVQ+340XmPEavmwPFWt/Rnc
   3odJsT4kTm4l+mciQ/EiHbflQe/4rykZjjVU+8FqxMwMQNk1ood8GmvZ5
   Q==;
X-CSE-ConnectionGUID: 2MHD8jNrQ+Kfyomt5DuGTg==
X-CSE-MsgGUID: Cms0OxO9RkSgAGEm//o2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83019523"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83019523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:09:11 -0800
X-CSE-ConnectionGUID: oiDa0BAYTKadHRPR4bDawA==
X-CSE-MsgGUID: v8VhC0f3S1+Xzk37rLrpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="217048615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:09:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:09:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 18:09:10 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:09:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0Vhe4byFg+IzP36DEVDxCUsZQr+R2sjpOWFEShfkO/1km0OEE7Fzp1n8je+UUvue7pZ5YzvucpzECrAE/VHlL0/AL4G4jkqErXXwRECCSOgZGlxBq8TifitF0HCgdV0xZc1Xw89Xo0qcXQC1lT5Ia1g5qOqCRnwZLTP5fl0LCRPcKRaBXIxqrKutqpj/3BfL/m8hZ6obRBbQaSV0udVK+weyQYjZZWkmEQMkDYWYoZV9gV8lVgpKNWQa21Uwn5eLDiJaUQB6/x8R7YkgJguyeVab1+z9st99OB6t/rZ42YEeTfIOtXM51o/3z77Oouh+1qDdBMjuDFw1zzDYFWysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Y6YNI2adf+LchOrkL3FlbQJvTC5Rpa53k6UjUqcdhA=;
 b=AXyu0ysB+jCVRrjD4je2vbmLvayQpaHjlkNv232ffn8QaXJ8AR0JzPtFDepLFHX5xJrVl3ljDHu2kBGKgH6lsDtyVbv1Iw3p2dtzZQgT9SQosAQzI7YQzLAyDjCxLik/gbHGgBYBl2uHl+IRoyJzAgb1rd+2JROXZsF2/I3ll6kC8CeSpFptq0nixWzFngAVnQLvEA5A4IsKADJA4LREOnOIXimMgWWov65htbBzFpFNDnjYGqsv5gLm0NWr4zd7E9uUhl7XoyO/GBquZyixZNubeZ6MgCLsEDA3y2SbtbxFHFxwfscXngAhXih468lk7QzKbMcshKmAzmGd0jeL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 02:09:07 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:09:07 +0000
Date: Wed, 11 Feb 2026 10:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-kiwi-5.10 203/203] util/annotate.c:1729:9:
 error: too few arguments to function 'init_disassemble_info'
Message-ID: <aYvkuoyYNNCoWdVY@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: a36b3c9a-3fd5-47a4-642c-08de69128960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5j2eXj+H1ldKKythlO4iAUZXLghCRyzfH2v/nzUsAXroy+ZP7N7bzIahfaHj?=
 =?us-ascii?Q?ZZQzVI2kQYUnmnygBSBpHG47pP9b2EzW9chS5HPLDdPfb8PJMVwN94KPPXmq?=
 =?us-ascii?Q?J0T/B3ozChNqednlhAWwXg6jo/GdL0kD1w4YtQsnUdu39kS7urCds/k8WInM?=
 =?us-ascii?Q?H10S/hzC5WC5LCkWCLvJo5Ouk2yCTZg5W91kL9hIxFPlpPivZVwGpiwmqYEb?=
 =?us-ascii?Q?MqPlWGwT2dRrdExbdj7OJLhy6LoatG//QMfwfV23o//ydsi5I8t9BE2lIxSV?=
 =?us-ascii?Q?rECbxAINcWI1tSgcC0ti069RRW+pvnxCfLZ/Xulug0mPFjnqqX2slv51wdHH?=
 =?us-ascii?Q?6NjSp3GaLqvx2jFkAw+cJJksWsD1i3pgJqusIIgXrEoJ/3fs1e5+hOeQl2I8?=
 =?us-ascii?Q?aczSr/K8MFPnSAhPCvpifCrMLKX7N9bTlbTKrh6SioMGZT2u/8kYnA3VZhrH?=
 =?us-ascii?Q?hEVyHQ8/mKTrNGiFmE3e2L9rfWgGkauHTFBXFv4Elnh49FroP8qXhaAxbY71?=
 =?us-ascii?Q?SP+72MrDnwojb6U76FtiPby19nxRibkkFEv6o0k5I1j9Vp/WhcdAj9MT7g04?=
 =?us-ascii?Q?ksp9ooSmIa+ooEa55woAI582acMM7RRZuG2cGyUEl8YRCKA0lZpkYLODuRU/?=
 =?us-ascii?Q?97VcS56uwOC2aS+T4OYZztOk8AFLOdZPhv+HxUY1NeEO442K+04ypl/t6CT0?=
 =?us-ascii?Q?mIcmPg4qnHQu9ssvV74IUIdv12v1Att6Q6fV9Anx/+/WIL/AlTGfiMUKByf1?=
 =?us-ascii?Q?Iye+hsxEl/uWTzhZdPjBhLp6y6k/oAWb1TxV14YgVO0po/9sqaR0ZYVc6IJx?=
 =?us-ascii?Q?DSNATQagH5NiIoCmD8Fr4XbQLwHhI9baRm4QManVvFEBxwPtH62WP97eGZ/1?=
 =?us-ascii?Q?D8RT+uUy2P87eUFPRLA6Xl3h3MeQJ7SXEmbJfEhTnOXuObObCyvesVuKvkkT?=
 =?us-ascii?Q?4Mpg7tJXLpVG5wDmI62oFltexLcgATtjCWgaEYCUywEG3ghLaBGbJGwRx3dQ?=
 =?us-ascii?Q?cH3ust8PUYqgT7Ip9pv66j53xeqBntMSHiGX63gTAHJWxsvcRh8v9qZDwXKJ?=
 =?us-ascii?Q?PF0L/vqyEoCcWfg2ktM8UXk7Po3d3UnQ2MKFsOI2iHgWaI/cOjw7rprgD9sW?=
 =?us-ascii?Q?T291vedr3z+qMSR915iz/GU3tt4A56BsFtrDOLvGtvoCBNHWtB+VJDgXs1nZ?=
 =?us-ascii?Q?yjIyiaGewLQkkow78OVsxlApUQ7uCjzoVTv1No8iyxr4sBEbSTirznCZ0Hwk?=
 =?us-ascii?Q?vWzEY0Y4qf+M2GttAX34i2vrOngvXEc2PBjRlqUHa/OmX/h7PSFhiXt0uhQI?=
 =?us-ascii?Q?79yJ3iWFvmngH0QyCzlxSt9ld5+33MYtinl7AD8a2KTxuY1LTxbBiktpYGVT?=
 =?us-ascii?Q?RFNaR2TgKLxiXGqeTIsiHiurKvoHKaFXp5O3MxiJs87FfZe3iP44qOJAe5G3?=
 =?us-ascii?Q?MuwJeIPga4wEu8nSgi8bG5CF7KTf6NyvKLFPpBgGloDLrTdO8qtQNvbOt2ce?=
 =?us-ascii?Q?5n4XU8+9Wb1JiNTUGetOV0B1wGnKnDNh0ztu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1lfjxKjVFwhQSHDaCnzaAHdTL+u8c24KSyK+hGow36F83up+lLuOw+YA0DrX?=
 =?us-ascii?Q?B1iPKR6xF8nNkiwSYWEaNQtxf1hA66pZt3Qr56/o8lYgR9iMArGrVhTwVBCG?=
 =?us-ascii?Q?jjhv3bqhj20cIdxM97CVjR4eRvShY1sCI2nHS6e8kiFUbmnduP1LlHimPCMM?=
 =?us-ascii?Q?A0QAtksCRhycnZGfMbXiUAUgU1lCDXJe1c/LAQ6fmEq6eIwQX7frE8j2M9jn?=
 =?us-ascii?Q?QNWHsoM4NpRrt98vm4aG5gi6p6g8s3ZSrI1qdVzm1jtMTlCkbZ2JST+61dCE?=
 =?us-ascii?Q?Ylr0lHkJjgmS1ILz5MWBM7p8Di3rs1N+ESB5xOHKawRg/dlTZ0rHSAw+2uOl?=
 =?us-ascii?Q?7NsFRtbktFU6BNNf0CZCpaXrjEGkS0QEWS75AoVPyvYMnRe2T2U5FW1Mk3r6?=
 =?us-ascii?Q?hxz+pRkRyABEACUf76iVWD35auAavffROaA/ge88DpC8Bsu7yWIcc/y5igtU?=
 =?us-ascii?Q?5jNx37f7ddThQOfmxRxIerKEFRnEkuElE+7uSgCyV0qKuSxDRdFxZrKXtukU?=
 =?us-ascii?Q?Kl2RNNB2weRBx2qBwuOA55233JySgIFEGwDAVaTWI1/HnTnJabsMMuwlH2Z7?=
 =?us-ascii?Q?cvDwyRinMWafzJ7huuKJI6nWOtbvNHLgQyj/acMTHpKiORwnIa4pms5pPXtb?=
 =?us-ascii?Q?1YzZEa2h4dUMphvRmMCgUpXyIhOvYEPQ3vR+f+ObuxCfogflNm5UemRIhbZP?=
 =?us-ascii?Q?bCYHb4MB28n8t/7BuUeMMJxmmsLyJ1M0GbM5/Pp0GHM9DNDyRTFcyMS7rs2E?=
 =?us-ascii?Q?i9uEky/XJ17cLqG5dN2eCBTgGgG1CvjkYuS7jfe3GO7XTmTGmtdujfW1xDKS?=
 =?us-ascii?Q?plqDpwQuMOmTWET2Voh0vjcC1Lm0uVrURy7VIeEGOiEqgG48ahgNYzFJQgn3?=
 =?us-ascii?Q?qOQTlSGgyNdpfp0RU0SYjzDHWe3Fv2H7ofGSqVVmnYpvHEdCIaI2y3O+BG6e?=
 =?us-ascii?Q?GqeiQH0SFdTaA4LEMi5sspdYGRQLsjJc6YR0bdL0L6oyCY1YBI6qEJvxM17Z?=
 =?us-ascii?Q?AAbghWaiyjPkOwZZ9Ju6HHkQsCXa7zfDKnH7EGSX6UEz5iNZ2p6sfdjj2TUg?=
 =?us-ascii?Q?gf2pfj4iJOjXlZaFblXTjbAjZn+LqToGH3Q1ACLqj61jcbE7dDgRfSwRKHI5?=
 =?us-ascii?Q?07f9ABZcAjHdwKpH0hSEa0dt1uX1Bl8EI8D3nEQ61J/uE/fh4PIL496T37mO?=
 =?us-ascii?Q?gTpZR86suOpN1gZ5yb/SPRpIbyOT6mm2W+wlbgT6QlMjlgJoEduVSeqGQYUn?=
 =?us-ascii?Q?fTfuhaLdBuVxAQyOP9lvNu/JTIEPcTbVSqWxAsYvHkCj6iOKt1MnXPRopGok?=
 =?us-ascii?Q?1cdcIgLl9qXgvFnF4tQtm4Cd5EiDtsMPtOu6qR2bWczZkPFViSlicBgRRWrW?=
 =?us-ascii?Q?aJwPxcefgapOMbBW07xPFjUMuEQhj/7iseIZX0b4yrGvv7iZpbJ48uJLlQQd?=
 =?us-ascii?Q?ggUGc96hVDRRIWsttqTJZG08fuyznJsKAxDV5A+04f5m1Oj91NC3Jd3pj2/8?=
 =?us-ascii?Q?STsYK03G2ZunV7oWn8SqvSlNm1dGy63EP1gocWIO68Yg0vKUs04cx2ZpknHv?=
 =?us-ascii?Q?feObf0yIvqrgXhJ6jh/Y+UEXWfmsLbE7HA0XSs+3Ux2MsH2oyLPtz7DTfrdE?=
 =?us-ascii?Q?b1OG7cdhwEkaOijFqVFbjWx7F5r4hw5vL5F7M/GaBaU2RsMiykyE2dhdf1vE?=
 =?us-ascii?Q?Vn0rbKD++ge7Gyk6xD2C7yuQ06avtzL1rt4a5hFc1y+NueXuYYMdbFMcHk+T?=
 =?us-ascii?Q?PDLKR9dzSg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36b3c9a-3fd5-47a4-642c-08de69128960
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:09:07.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+4PTWcJxprJmQFyb2nexYn81LN3vRng1t3UTk+vSBvHw8yxq3wnB4FbMXOYNwEJWutUhqiNGCL5kA6powIZbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
X-OriginatorOrg: intel.com

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [203/203] libsubcmd: Fix use-after-free for realloc(..., 0)
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110235.8IBa7lvS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110235.8IBa7lvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602110235.8IBa7lvS-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/stat.h' differs from latest version at 'include/uapi/linux/stat.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h'
   Warning: Kernel ABI header at 'tools/arch/powerpc/include/uapi/asm/errno.h' differs from latest version at 'arch/powerpc/include/uapi/asm/errno.h'
   Warning: Kernel ABI header at 'tools/include/linux/build_bug.h' differs from latest version at 'include/linux/build_bug.h'
   Makefile.config:602: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
   Makefile.config:695: No libcrypto.h found, disables jitted code injection, please install openssl-devel or libssl-dev
   scripts/bpf_helpers_doc.py:42: SyntaxWarning: invalid escape sequence '\w'
     arg_re = re.compile('((\w+ )*?(\w+|...))( (\**)(\w+))?$')
   scripts/bpf_helpers_doc.py:44: SyntaxWarning: invalid escape sequence '\*'
     proto_re = re.compile('(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
   scripts/bpf_helpers_doc.py:90: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)( \**\w+)?)(, )?){1,5}\))$')
   scripts/bpf_helpers_doc.py:98: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Description$')
   scripts/bpf_helpers_doc.py:112: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_helpers_doc.py:121: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Return$')
   scripts/bpf_helpers_doc.py:135: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_helpers_doc.py:290: SyntaxWarning: invalid escape sequence '\ '
     license string passed (via **attr**) to the **bpf**\ () system call, and this
   scripts/bpf_helpers_doc.py:372: SyntaxWarning: invalid escape sequence '\ '
     one_arg += ' {}**\ '.format(a['star'].replace('*', '\\*'))
     PERF_VERSION = 5.10.101.g50f3b00d4c7b
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werror=nonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/include/x86_64-linux-gnu/sys/epoll.h:148:12: note: in a call to function 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
   In file included from tools/include/linux/refcount.h:42,
                    from tools/lib/perf/include/internal/cpumap.h:5,
                    from util/cpumap.h:7,
                    from builtin-sched.c:6:
   builtin-sched.c: In function 'create_tasks':
   tools/include/linux/kernel.h:43:24: error: comparison of distinct pointer types lacks a cast [-Werror=compare-distinct-pointer-types]
      43 |         (void) (&_max1 == &_max2);              \
         |                        ^~
   builtin-sched.c:673:34: note: in expansion of macro 'max'
     673 |                         (size_t) max(16 * 1024, PTHREAD_STACK_MIN));
         |                                  ^~~
   util/metricgroup.c: In function 'metricgroup__setup_events':
   util/metricgroup.c:315:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     315 |                 metric_events = calloc(sizeof(void *),
         |                                               ^~~~
   util/metricgroup.c:315:47: note: earlier argument should specify number of elements, later size of each element
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:356:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     356 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   builtin-top.c: In function 'perf_top__prompt_symbol':
   builtin-top.c:391:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     391 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   util/stat-shadow.c: In function 'perf_stat__collect_metric_expr':
   util/stat-shadow.c:359:55: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     359 |                         metric_events = calloc(sizeof(struct evsel *),
         |                                                       ^~~~~~
   util/stat-shadow.c:359:55: note: earlier argument should specify number of elements, later size of each element
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:483:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     483 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:483:49: note: earlier argument should specify number of elements, later size of each element
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:2688:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    2688 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:2688:62: note: earlier argument should specify number of elements, later size of each element
   util/scripting-engines/trace-event-python.c: In function 'python_start_script':
   util/scripting-engines/trace-event-python.c:1642:9: error: 'PySys_SetArgv' is deprecated [-Werror=deprecated-declarations]
    1642 |         PySys_SetArgv(argc + 1, command_line);
         |         ^~~~~~~~~~~~~
   In file included from /usr/include/python3.13/Python.h:125,
                    from util/scripting-engines/trace-event-python.c:22:
   /usr/include/python3.13/sysmodule.h:10:38: note: declared here
      10 | Py_DEPRECATED(3.11) PyAPI_FUNC(void) PySys_SetArgv(int, wchar_t **);
         |                                      ^~~~~~~~~~~~~
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:936:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     936 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:936:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:940:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     940 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:940:29: note: earlier argument should specify number of elements, later size of each element
   util/annotate.c: In function 'symbol__disassemble_bpf':
>> util/annotate.c:1729:9: error: too few arguments to function 'init_disassemble_info'
    1729 |         init_disassemble_info(&info, s,
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from util/annotate.c:1686:
   /usr/include/dis-asm.h:482:13: note: declared here
     482 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
         |             ^~~~~~~~~~~~~~~~~~~~~
   util/bpf-loader.c: In function 'config_bpf_program':
   util/bpf-loader.c:331:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     331 |         priv = calloc(sizeof(*priv), 1);
         |                             ^
   util/bpf-loader.c:331:29: note: earlier argument should specify number of elements, later size of each element
   make[4]: *** [tools/build/Makefile.build:96: util/annotate.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In file included from /usr/include/stdio.h:970,
                    from util/branch.h:9,
                    from util/callchain.h:8,
                    from util/machine.c:7:
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/bpf-loader.c: In function 'bpf__obj_config_map':
   util/bpf-loader.c:1220:34: error: pointer 'map_opt' may be used after 'free' [-Werror=use-after-free]
    1220 |                 *key_scan_pos += strlen(map_opt);
         |                                  ^~~~~~~~~~~~~~~
   util/bpf-loader.c:1218:9: note: call to 'free' here
    1218 |         free(map_name);
         |         ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/metricgroup.o] Error 1
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:46,
                    from Context.xs:8:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_av_remove_offset':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/config.h:1211:17: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    1211 | #define SSize_t ssize_t /* signed count of bytes */
         |                 ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:226:5: note: in expansion of macro 'SSize_t'
     226 |     SSize_t i = AvARRAY(av) - AvALLOC(av);
         |     ^~~~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:7869:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'S_PerlEnv_putenv':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:313:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
     313 |     bool retval = putenv(str);
         |     ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_rpp_context':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:1074:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    1074 |         SV *top = *svp;
         |         ^~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:3329:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_is_utf8_valid_partial_char_flags':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'STRLEN' {aka 'long unsigned int'} to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:3160:12: note: in expansion of macro 'cBOOL'
    3160 |     return cBOOL(is_utf8_char_helper_(s0, e, flags));
         |            ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_push_stackinfo':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4012:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4012 |     PERL_SI *next = PL_curstackinfo->si_next;
         |     ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_pop_stackinfo':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4052:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4052 |     PERL_SI * const prev = PL_curstackinfo->si_prev;
         |     ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_newPADxVOP':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4094:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4094 |     OP *o = newOP(type, flags);
         |     ^~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_foldEQ':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4120:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4120 |     const U8 *a = (const U8 *)s1;
         |     ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_foldEQ_latin1':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4145:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4145 |     const U8 *a = (const U8 *)s1;
         |     ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_cop_file_avn':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4464:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4464 |     const char *file = CopFILE(cop);
         |     ^~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:7870:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h: In function 'Perl_newSV_type':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_NULL' not handled in switch [-Werror=switch-enum]
     433 |         switch(type) {
         |         ^~~~~~
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_IV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_NV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_INVLIST' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVIV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVNV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVMG' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_REGEXP' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVGV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVLV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVCV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVFM' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVIO' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:396:5: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
     396 |     switch (type) {
         |     ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h: In function 'Perl_sv_setpv_freshbuf':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4254:52: note: in expansion of macro 'cBOOL'
    4254 | #define UNLIKELY(cond)                      EXPECT(cBOOL(cond),FALSE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1724:13: note: in expansion of macro 'UNLIKELY'
    1724 |         if (UNLIKELY(TAINT_get))        \
         |             ^~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1724:22: note: in expansion of macro 'TAINT_get'
    1724 |         if (UNLIKELY(TAINT_get))        \
         |                      ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:1013:5: note: in expansion of macro 'SvTAINT'
    1013 |     SvTAINT(sv);
         |     ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4254:52: note: in expansion of macro 'cBOOL'
    4254 | #define UNLIKELY(cond)                      EXPECT(cBOOL(cond),FALSE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1718:42: note: in expansion of macro 'UNLIKELY'
    1718 | #define SvTAINTED_on(sv)  STMT_START{ if(UNLIKELY(TAINTING_get)){sv_taint(sv);}   }STMT_END
         |                                          ^~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1029:34: note: in expansion of macro 'cBOOL'
    1029 | #   define TAINTING_get         (cBOOL(UNLIKELY(PL_tainting)))
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1718:51: note: in expansion of macro 'TAINTING_get'
    1718 | #define SvTAINTED_on(sv)  STMT_START{ if(UNLIKELY(TAINTING_get)){sv_taint(sv);}   }STMT_END
         |                                                   ^~~~~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1725:13: note: in expansion of macro 'SvTAINTED_on'
    1725 |             SvTAINTED_on(sv);           \
         |             ^~~~~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:1013:5: note: in expansion of macro 'SvTAINT'
    1013 |     SvTAINT(sv);
         |     ^~~~~~~
   Context.c: In function 'XS_Perf__Trace__Context_common_pc':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:2496:33: error: cast from function call of type 'IV' {aka 'long int'} to non-matching type 'struct scripting_context *' [-Werror=bad-function-cast]
    2496 | #  define INT2PTR(any,d)        (any)(d)
         |                                 ^
   Context.c:55:39: note: in expansion of macro 'INT2PTR'
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4253:52: note: in expansion of macro 'cBOOL'
    4253 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:485:13: note: in expansion of macro 'LIKELY'
     485 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:487:28: note: in expansion of macro 'TAINT_get'
     487 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:556:38: note: in expansion of macro 'TARGi'
     556 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:60:13: note: in expansion of macro 'PUSHi'
   Context.c: In function 'XS_Perf__Trace__Context_common_flags':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:2496:33: error: cast from function call of type 'IV' {aka 'long int'} to non-matching type 'struct scripting_context *' [-Werror=bad-function-cast]
    2496 | #  define INT2PTR(any,d)        (any)(d)
         |                                 ^
   Context.c:78:39: note: in expansion of macro 'INT2PTR'
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4253:52: note: in expansion of macro 'cBOOL'
    4253 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:485:13: note: in expansion of macro 'LIKELY'
     485 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:487:28: note: in expansion of macro 'TAINT_get'
     487 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:556:38: note: in expansion of macro 'TARGi'
     556 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:83:13: note: in expansion of macro 'PUSHi'
   Context.c: In function 'XS_Perf__Trace__Context_common_lock_depth':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:2496:33: error: cast from function call of type 'IV' {aka 'long int'} to non-matching type 'struct scripting_context *' [-Werror=bad-function-cast]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

