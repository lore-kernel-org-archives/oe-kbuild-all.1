Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652944;
	b=FXjLykoVBaRw/HK1osLWtkwBs6xE1p/A9BVr/JmvVMJNFe0forma8zgxpO3fsCmg3mrU
	 ZWkA2HqhuhDf4L5FLqxZH4YwZnNGVeWztRYi88XsZQqJVf1OpLtiZspLZO88vaecpGYxz
	 4g5KGF/FCfZf5qYLYh39MLDeqq08wsdTw0pU2wIUbsHmXd2x7h+i1J4ZVNCRdDMJ48l34
	 w3BLYOCcpJl/FfChcRyFe+ozidvxJWF2oBAXE828thlPwIsSAsEQFtGLvtWlfFg0RGea3
	 JsAFKVd/7G5CuvvMsk5Z6hFuBWzH3GDHrW2B/o2oaKzlz4FEhYVfJCwnroYgKIRTS3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652944;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=1Rp/xDTeVvfJlvIRv80HASUXGcLgTQAR73Me2JbJ9II=;
	b=nen5uOUNYjmqEr9PNsDKn1wJRXXN/XOpoLa9X+pVwa4yWC7NY5hElksKFzdf+WPYTbDl
	 qapQVfQJqNSwuGleZwnliqXx5yF54FXB6qbkFQdr2Y9YqCbYIZkiyJi8pKUEiwA3yX6jf
	 maTmJFsc59kCwPkLJ88WY99NqQFyBnnmeNWVLmWbW5ohgHRdUHJ0fPduH7VfgtKIrnz2l
	 UYrnWGXZBuqotofRFJA4oAj/87CY9Fv+6om4IsVa8BnQdBctLk+RkoIAmdSNmTaYFObJ0
	 gVe6YwLIQp9ow5Ei00jdtFepk7td0XVMvDo0X1c2hHUKLs9ZvROKBMkt0a1x+uKJ/iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="P/J9lewM";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mHtBrPiG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C2606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 00:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P/J9lewM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mHtBrPiG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795652944; x=1827188944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4WOBzJjWFpyEplyEfFbiEdHPIP8GjYl9dK2St27sYuI=;
  b=P/J9lewMqKb4PywsL/zCbTO+L5LLZzFRC+wp9vlPWwNPs3FySqWgbCIV
   V8vhLoPbY9WLYqitEUCttOnZDy1SlAqrn/tSuQeq9Gec3Qm+85JYTr8YU
   TvQOpiil7SVnPRbs8yZ2nnc4JPeN0IsyQST+0lKra56oP0EYWt5YCiILj
   Gu3VR8HorS7S1/ezjP6u21fhysSCQ/iXcOqlNsU54doo0FIaii9Cw1a+S
   enLaJXh2jfoQ6eBhQNI4CRheyPGxPd7VKdSBFg4+oXGfMabQnHqN1vEuu
   8htiYfe4JEFHFcxn62q3E43kECqCj15vOgd+JwR8Ez26QnpmcAhjeJh1k
   g==;
X-CSE-ConnectionGUID: LjgxKs+iTkOnbtbnnDCHOQ==
X-CSE-MsgGUID: qoYA8190RLWCouLsU9PVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4561956"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4561956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:29:03 -0800
X-CSE-ConnectionGUID: nms/P2ewQZi3uQ8NrF875A==
X-CSE-MsgGUID: OYF4F1sMQUujuGPYbOxdlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12598247"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:29:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 16:29:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 16:29:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 16:29:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQW6TveWJ9cYouiA7LmRNq4Y7QazESdCeELdhHnMPWwzoTajuT71TznnQhap1QqSygys+CwnpSLRPBhq6wL/vza4u+vuZUaiZjJ+Od3LEveYWQBH48lgVFMR0XoZSF1ohecnYRYzrddkKvEOT31IGiWNJgbSN58oBS0+B4q6Rg7a0OCZIVq2uCXq0NZ9DmJXC5+R2yd/u/s5zvSQD/4RK7KADG1ERVT5Va2kLsgwCiyj4xyN54RkGADYy0IuxHRSIGyW3oDP80Sm8i5Jk7QevM3qsGaA/2ATNxFNwSym9BPC6XhHHwumgaTbIrCi7EpCrOlZl6ZHcVSCANiVDOiuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Rp/xDTeVvfJlvIRv80HASUXGcLgTQAR73Me2JbJ9II=;
 b=jkCUl/njphCYKMFDDii6fC6kLIFw+DeKzSZ7mEzR7Z15xYhKz4Swh4fg0UYErzPV0qExNm5CRaxqvY50VBj2Mc2LnTebe6KEOOS8O0g+ixZ2EtI0Ysgrfy7qqNXHMyjKd5eny5MgdqFPXIGm36FcMcxZfbz2GgA8bDWOxEptrKw/j75WjiAnFbKye89dhhsGo04cGpFLTzYN0YPm65+UoUH27PxlPXriQ1L+el0P8wkTOZnC5tAkLgNhTquS8NsHUD/zo5+KnM+a8MrDDmOFdppAd15KiZwXRD9QQ+JWnyM3e7Ypmk8i6fQdIAPaq26Kdg8dJNm814kaxNE0HeY8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Rp/xDTeVvfJlvIRv80HASUXGcLgTQAR73Me2JbJ9II=;
 b=mHtBrPiG921Glh9f5eO5pvj4tHRwkeksF6LODYVyUPQsV3kYFZfg5yiiUvFUiWaVHEIfdyPMDiRqyhLakw+zvKe6hqYCjsBXTimI2khZzl5sLD+AdKbCXxAu0H+nyBylVSdOHnyiB+Y2YlhPI+QaRsK+fFRye0f/hh5r1ECGc4k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SAWPR11MB9712.namprd11.prod.outlook.com (2603:10b6:806:4ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 00:28:59 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 00:28:59 +0000
Date: Thu, 26 Nov 2026 08:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>, Anup Patel <anup@brainfault.org>, "Nutty
 Liu" <nutty.liu@hotmail.com>
Subject: [avpatel:riscv_trace_support_v6 49/115]
 tools/testing/selftests/../../../tools/include/asm/../../arch/riscv/include/asm/barrier.h:13:10:
 fatal error: asm/fence.h: No such file or directory
Message-ID: <awd9RZTUxoEb0P3r@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SAWPR11MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: f017d694-27a9-4454-d75d-08df4b5443ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|18002099003|56012099006|11063799006|261022075727099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: kl8iXEPvlLC2bc5Fbs9KNWu4umg4JSonZu+0DSGyBH/uTB8/VxsfJ5XKAVZkgNR8MVltrhf2cv3xPYA6tkrsb66V6gZSgltY7vZWd+7MeUsWBnx2PjfUgCL4xKIgSSpW8a13V3R6x7Ok/loGfvRDzeRbewpQ+CyFEKcdL6VljsOmgFm9GuAd+JAQA05j6dWA5K9VfdK7pkDS0d+pw0FPYtJDLGusNJghQiQ7551uEs2Yc3/AQGh7yCDrB4G3a0vLOKE3dzshZBnF+l/mfk4epjbR1tUGKDXpk7cFLUwlX8WVhZtXynuPROKE2Iz9PtNbDfeXfnaP89NZ7zQGlm0VL1ESL4TNsaWEUneSsZxmoMBE9ZVfjFxO3wNRHgAK6Ib2fByuQ1JaqoEHUJh+3aCAxea4hA2cfow1QSttcFI36vpbqY+yDcHQTsZshON9w/jelTOblvbL0l/yNahNTjYmIKL9OVWmXHDszEaDeMrCFgbDDo/OrCZQUdi89Ms8+TDPfp42TXVyrAE3MSjrf+/WEVEGEGAjI2s5L11vh90rqVue7Ee3/6lmIFAZ8/DS6RBqqpnU+611PZhB8aJCfnJfsaPqSD5z7Mw7h2WYiCOHaGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6JaUi7KHv7rfbXjnh4mIev3tP3FdfOoRvhYAn0/7H1EGA8sFYYkcWCXrh2Pg?=
 =?us-ascii?Q?LjPfcEn/SkJagpyou8NA3qFL4PLa9ZSU/dhf3B8iYQAb3YKtZ6gAQ3dXVaxZ?=
 =?us-ascii?Q?QOIGuMjYYBSmqa/WP78Qsj0VCIvu9Pjn65ECPjcVfc69hF34/99zfPSkb9G2?=
 =?us-ascii?Q?eRtusFlTVpYE50k5QU+N43Cc32FYtjwAz8/2pObdQjisxGIwr2BOyBFs5Izt?=
 =?us-ascii?Q?O3xL7ZFuJFbl5xvuDOORwvjxFokFa5/aBfT8Ini184PGDPdJezhG5offE6W/?=
 =?us-ascii?Q?7SPEmZIr+Qb7a9zCnnkNwccZlwIRnXBxbrfy4aG/yBtjRdyrhO3q0FRWH0fC?=
 =?us-ascii?Q?VR1MU/PHnxuQVmCbcUJEqWjUshZcXZm88VhwbVeDEHq0aT8eONsMjA4WUHsc?=
 =?us-ascii?Q?PQcbZ1ryPGOprT7WfGgf33ylkvTcqsk838Xfi9yX5y0Q/3nYY0F9w8zyxWjP?=
 =?us-ascii?Q?l8HhoxTcoOJz8ID+Acmcnja98ixOWl+dvUj+1jlbOLXbr/I9sJSXdRC8Tg6F?=
 =?us-ascii?Q?wRr+gHNDaVrMNlffXDwaERrYg5HE6FBReYq3cxvXfW+YCRCuR5FA6Wf6sg+W?=
 =?us-ascii?Q?q0lb8mtNQUIfLMjFeqizABKVF5PdHEJ9403mnyFBu+KkM/un02CSVE3Vfj7H?=
 =?us-ascii?Q?wb9NdUKZVGF7xpHQ7YtqJL8BdMR8XfuSv5QYlX2oJgPpQ3b6sthBfhx3u33K?=
 =?us-ascii?Q?7RlgjEvWhtX+zFhIVsRnL+kO6kMgKW7ErB/cKqSXSOA7otY9aJ6g8Psxs7dW?=
 =?us-ascii?Q?imMd483HGrsixnWvr6Vq5Go5Vruej1dnygnSePuPO6Ui5Xhi76NHv9NynJ2S?=
 =?us-ascii?Q?4/i4JXRgddwM/s8WDY9tDkssJQHSF32sd+iE0VI52bptj5nQ53BQyEKxzH6E?=
 =?us-ascii?Q?TTneUc/rgymYhxZ2L6Mb+sIBfSr0lQqWkG1/aj/L5JXc0Txb+THdZH57hoGn?=
 =?us-ascii?Q?gYjgxsCQnxsuPks84mpWcO/vrbsrIkrB0Yxz1uP5nLvJZMQVQbCNS8IwReCK?=
 =?us-ascii?Q?bm/utvbV8+noyukpKeGVuOoMwYlBGQAxFCzaD0ZLjds4xVtGsgkOvvVOWQHc?=
 =?us-ascii?Q?En4DqqPGZK4pCp+FXDkZsbQ20QN8hzVOMsslBARfuAiJFRuZ2YTvArhQUPWf?=
 =?us-ascii?Q?VErq8hoqqq70XM5YyuYRZWyRbvwjRu8IlxmggQrmAQGcMHRK5g9cB53yF2di?=
 =?us-ascii?Q?feS9qzeIhr3+p5R1/xmYfb11oV9A2bff08Xu4QN7RMfjKYclPs/ny28Q4ETm?=
 =?us-ascii?Q?oKLZ5wyIIe/mjN91sNT12nv0p3iKbIlPDdkh60bV/l3z/x0Z7c0y+3lGNHRA?=
 =?us-ascii?Q?dTgr77IfBisqtGJfGknvr7InXOmSC55IXskWZ1hhC4ZeJ/PU/ciMY+K+1dtq?=
 =?us-ascii?Q?4lACUXAJet+gvnyQfHQD53QeaPkpq8qzMvV+8tqYqq1jtkTGyNdognl+piTf?=
 =?us-ascii?Q?J9NngTj5pL5rKJOetJVix8fy4w7DRkwj3YeMlDoAcN0k2ioCN0K5L/Mmk/rG?=
 =?us-ascii?Q?tY96s75xBQVb/jr5KKmhWEjSPWF4fknBlLt6A7Sbyfg6lSNuY2Fz0jL3W0UD?=
 =?us-ascii?Q?C79KrQWNkYiibgkbg9UKGWUGNIHREyUahwgauZyMcvzbmXlFV4wqX9BKPoJn?=
 =?us-ascii?Q?U5qP2d/kPR8OjpoVV0fFlcTagX+CLLlwDwJ461VPnV2PhpxLvEd/scjelS7X?=
 =?us-ascii?Q?NONz2YEmeglWzVhYeRmMJS3kkK0dD4SLGpFG6Wlrh4PXsr/keVfcJitdmuD2?=
 =?us-ascii?Q?4bVdSrptXw=3D=3D?=
X-Exchange-RoutingPolicyChecked: oDF8FiFlMzsc7vw5YhvPN6/EdX2zXGOtY78VcnRD8JYPEdlxCaXRWJBWLPIlXIec3j/G3QhSIqIJJ/iUBslIke/REuaQ19Oxy+6WmUK+4rHMHw9fMRGLAgqzC9xbQsW2qh/ADdYrzf9MCc+uRFSSceaVj7qpHWuAaguG6mkIskUjHT0oU/4ZG5OraJZ1I2+IEOkEDLCd0vD6yHBd6RFYi8KH6K+vaqq7+mruI0XTa1q5cnB+C3Zw5HXy/7rUPEMXiy633NR6rLjEGwKjQ6922hYoC1I5VpsiU3cArTxMDQ7ligfVRwbJCLbr1UQTDwwKVUnZUtgSHRjL75AEBUIHgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f017d694-27a9-4454-d75d-08df4b5443ba
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 00:28:59.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6LXYy2/VjBb7GzTC0nyysaxqL/jOmYoEsEoZ6BeQKblQPaE4aCPhWIAgSJrgEhOab/MvWYqkbKxJz+lW+4Kxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9712
X-OriginatorOrg: intel.com

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   d77c0270e18de0b01434fec8027d8a61ae1f7c00
commit: 11a204761f086e2384b6bbd0da75bfe9fbcc8c7e [49/115] selftests/vfio: Allow building on RISC-V
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261126/20261126004426.rvJWeyRj-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126004426.rvJWeyRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126004426.rvJWeyRj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/../../../tools/include/asm/barrier.h:12,
                    from tools/testing/selftests/../../../tools/include/asm-generic/io.h:5,
                    from tools/testing/selftests/../../../tools/include/asm/io.h:8,
                    from tools/testing/selftests/../../../tools/include/linux/io.h:5,
                    from tools/testing/selftests/vfio/lib/drivers/mlx5/mlx5.c:18:
>> tools/testing/selftests/../../../tools/include/asm/../../arch/riscv/include/asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory
      13 | #include <asm/fence.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +13 tools/testing/selftests/../../../tools/include/asm/../../arch/riscv/include/asm/barrier.h

6d74d178fe6eaf Charlie Jenkins 2024-08-06  12  
6d74d178fe6eaf Charlie Jenkins 2024-08-06 @13  #include <asm/fence.h>
6d74d178fe6eaf Charlie Jenkins 2024-08-06  14  #include <linux/compiler.h>
6d74d178fe6eaf Charlie Jenkins 2024-08-06  15  

:::::: The code at line 13 was first introduced by commit
:::::: 6d74d178fe6eaf61e384f3be6ba64150bddce8a6 tools: Add riscv barrier implementation

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

