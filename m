Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536CC8BE2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 02:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778694; cv=fail; b=U01+rCkJIsn35f4G621YWtvAv4zpBn3k/xKwEmUV80iDs2PMHt1l7YaD9jvQCcxvXjHZFL+o+BL5/oOouxbpvDe97CpseTknxfG3uQrB/6sSWxkfrh9XvPjluwfUW2rG8xPu1lvLCy36p3AM3228Gz9C+s7F2D+H0t2I7jUYATA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778694; c=relaxed/simple;
	bh=bHglaBAnwPB2ph5pgOTkmnDtQBCPAcqc9ccJxNsUrIU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YAa2CTgzFvwxV8Recqg2RUJjhz54CbXwUs7qRld2nHPa/VRCfAP6XAJWKPn274VVdnrmTC3ESPlmaEhza74jDc3ufdkZtEDDwtZp92pZmMbiAysdfrozIao/9dv2mceGBY16889cjGASV+y+8FUa7zF+H4j3csoPyH+fIBXLK5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XK/2TtMd; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XK/2TtMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716778692; x=1748314692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHglaBAnwPB2ph5pgOTkmnDtQBCPAcqc9ccJxNsUrIU=;
  b=XK/2TtMdKu5Vn6rdZKs54mZYxAd3nitkyDmXRCOVcV5nq/8LuJN9+fFn
   pDOkvr3/mTJgghPUn+tujRMA8oPLr5BMzFuop9U9akCdK6N9CW2Wvz6lG
   ymExsdPERPbKDs0FXg57V0a2I9uEan6Xiy/OnVZZqx1XqnOuogWV6QRQI
   qsWnz82/C2coOaHto5XczYIvkOKcrzsjZ0L+zYBJHW4eRFuvD+U88vycY
   7gayklpRVqg+gkdD59TWNpv964ur5X3lVnCou5BESSSTRlVpd16I9kC2u
   gAfAcOufLTMiaitQbEJTrtwAU3jUYLFLk+zMeG+ya4eSGTDWWek87/3EE
   A==;
X-CSE-ConnectionGUID: Gj/kuOuBQPWTREpvLRRKHw==
X-CSE-MsgGUID: P04hbYY1Q0i1OApj8UTMSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16022939"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="16022939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 19:58:11 -0700
X-CSE-ConnectionGUID: RFno7zNgQTuuX1SJn8eqLA==
X-CSE-MsgGUID: XtLW0qoXRYG8bdXYWTxfzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="39579301"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 May 2024 19:58:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 19:58:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 19:58:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 19:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnDetTTXLDF1v346cH76kGyHswsihZlP6sdfffNya3NKJCSLLYyOhEaJegx8AsLkZIzR3lQUz3xmFBryQwA+e95XSLjqbsVkZJ7H8AityqHwcJMA70ajMBkVp9WaPMpgSPR6lUkmBATUuR1rsJuatfTx08HNheKm/i2W9ULLl0a8cFbi/c8i6tPUPctJsD6isAJx10c8MysiA1gpKxerU5Se7g/SxfvM1j53/SrE0OnvnEsPxJjEy48Wg2ZduS2CwYgkjrrjcAbnH1JZink+Zs2DWhAZWK2wSb+/w1aZYBgAsBnyzvZIsgM13iQtxI+lP8gaLk7aR0jC1F6zlEbTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGOfMp+dzlZ/tmQdRYM0LlVp3h4j15ELfPW0xwbqH5Q=;
 b=OmbdQMle3a4Y5Tn3fO6f4pljU+DZl/kzbtDKynNXRJ6wgpEjk11iE7KDB6oUVK3PI4/VfnaZlk73C68ezElD09assnlCPGl6vuQLc4CjihFos9hOgKaIausSamFSPOQxcbVFtTP6rjraWI+NKMmEL7GD5h+tO3rC1b+yE/Scuk61RhCLfuSBfR10lEzuY1Nx3fBs4YsFevyBKmR62LGgsMnmoenJjVKAOW+WpVFsI8AclIxeTn4jUjfPoeEY4995xuVLMsCjMYRWNOub3P8fn2xA+5zn2/mlrP82xmZxzuMUv8bz7cetER67XLigaHaZMuPpXpmcsS6KqHXNLA0qMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Mon, 27 May
 2024 02:58:08 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 02:58:08 +0000
Date: Mon, 27 May 2024 10:49:50 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <kernel@openeuler.org>, sanglipeng <sanglipeng1@jd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-5.10 27119/30000] dtbs_check:
 Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml:
 ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties
 constraint
Message-ID: <202405250844.2wAXaBNe-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1P15301CA0042.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::30) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d488a49-75f4-477b-2cf5-08dc7df8d63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6J5ysHRzrkXPkqEbwItJrnOgLGh1QfHgc9B4v++qLl+NCPgh4uTqBNzYhJi8?=
 =?us-ascii?Q?hXXrWrGoFTXV3C9FfAtYb73zRAJeecR6OFHhzNAzJIM685+EQhsjukBtDGHz?=
 =?us-ascii?Q?Ea64nUFiFrzrPCNvqKTneiRcYoTaS4/+fQ025ZvFPQOi/yWPqgGXcRa+wu5g?=
 =?us-ascii?Q?zt4xP+Kpx9vOrB8+5b9GlRQ3xjBji6cT0/ZvqSrQxv5kFJ1oaeq32V73JWX5?=
 =?us-ascii?Q?EuOk6yFWu/Dwpu3j2ASQch9f7U9Q5rTsAJDOuLyq6X/gI4d0L19u/AG7tKNK?=
 =?us-ascii?Q?I72NEje3erUv/wVDmC2X7wbaK1B4t1mhu1QggpG5kSZ+dNPrCySer55QXqcn?=
 =?us-ascii?Q?JRoeoP8yrwA+egha1EJOwzTyG3vPp2fdrr4HLH0zof/M/Ocga/BOAh148els?=
 =?us-ascii?Q?uRJgsHv74ZQYj3ESxO2NMMc/8aQvgepqGs4/8/pMnhAq18feGytNdWgekWVT?=
 =?us-ascii?Q?AlNrI3fnPU3JaKl+d6jwIU81o04EeauhFcrmIJxWo+sQTHadGptnkpRLPXZd?=
 =?us-ascii?Q?kxXMsLRo498MoJRgPTTfiuZamccD/CKUo+0XnKkE/4L3Lbuf2lG0hwObe0tw?=
 =?us-ascii?Q?thglVUl2qx5nu4gKSWVsdJ2T4W+JSXLK5f3iAt++T+2GMmLDKxsrt11IUrPx?=
 =?us-ascii?Q?mBB4l2owvkmR5neOLiKdN4A/CWY7JFY+nf5CnchiokQr+Siw1bGZ2XGSbngX?=
 =?us-ascii?Q?8gI5CXlq5vphV+BRDxdHmrYk6leAbeZN9/QSbPrOLO1wIsF5ADokWhZsmzlZ?=
 =?us-ascii?Q?H+RdvlnKPyOz66TqP+WRIRGNpUk9ZA1xAssu1i78V9FjUKyH1hD+FCVJ+8Hq?=
 =?us-ascii?Q?k2xQ5803G/wTvXS9n3dBiZMdlVqKcAgZ1lzxfXTJKoe6Y4ZoSR1UvVrKvsse?=
 =?us-ascii?Q?TsX3xUaBRkCs1ctijT+LG79n9syDEC9mWIRgb0WPPgZdbW4VZMbWZdUGM4bk?=
 =?us-ascii?Q?GPbC2vJn9VXC0GFeCj5ZN9B4w4ysLB2fKbglWxyRAGMJFaj6khynOHaEj8Yp?=
 =?us-ascii?Q?8SlYyadW3fhFpwXbw7byz575Nm1NItBjnMfZG2wggDzUcKLjtKBHy2J4IO0c?=
 =?us-ascii?Q?i2Zvf+UDdbR/sIuKjRYQ+uK15hHolXqOxtAwlat8uKjtAwxZPjEA7PAMM2Pa?=
 =?us-ascii?Q?ah3DD6k3Mzs67s6S0wqmd/Gt6+30dXidmjYNtgk0pA6IPt3PDqgUfAMRY08u?=
 =?us-ascii?Q?BCJD4v4MpmqQx8Ip4Xhib9HJLSjf6BdqHC0aWxIgV3p0kOsftfCH0dC02Wo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jxYdk0wmmOXyxj/m1MImAjckjGcOgFxrGxN7O8qpzuHGQbYMKxpYgypvU2Pe?=
 =?us-ascii?Q?j6NE7tK82rNS+qoAFZgBtYausbLG5Y15ED4BG9wd3b/NfWx9Qa+RuHF5RwEL?=
 =?us-ascii?Q?+yOfeigIqaK25+9bHaZ7tMrgMwtLEnWfyabHJY1Tj2Ci4qAkieS04Ooa0ncb?=
 =?us-ascii?Q?MrJRN6rAPFHar04KMglixILgDTZARUNwZqq7T7us2Bxz6BdNrl58MrQzSpDm?=
 =?us-ascii?Q?XnaKgV7s7IVK84T0zYvgEO308ei3eedVuQuAmvcTkVipbaEKwQqfXxtX52Rp?=
 =?us-ascii?Q?4HGhr4OwrvTVaaBpo/u+ozAzGKNtaOn7PKIN4Zc0PYm8OiHuD4QYoPi4eHpJ?=
 =?us-ascii?Q?2Hcx6vZ0cQaill0s7V1T1w2dRj65jmxm05hCJ5JQ/r6VHxe92vjgIAdCQRba?=
 =?us-ascii?Q?p04277HMkQ/2sSoFnDb8H2+u27AtSbLdwBD/huGcGoZUDb6JxHx5PJCiB0cC?=
 =?us-ascii?Q?/xb2i7A3KqCdi1kxuw9glbaPQTcGX4/+VrkgMlUPEwBDUVzWaBZc8u/8iK4Z?=
 =?us-ascii?Q?tZcYNM6OIRAbqNT15svHQtfI22HAdholT8lvihE5HNMdfU9jxOiTSOSuMZ1d?=
 =?us-ascii?Q?g2v7aoiCqPDim7+NGRWCi3IrblWida5aH4kP07tiqcSFv3MXC/HH8eiSo4ST?=
 =?us-ascii?Q?PpvvIXc5IzX9n2ZXqRV7abeeyMtKspCLfozXtsSjOoGcmFQrBm4LssbZ+S96?=
 =?us-ascii?Q?JZxP60PAY7+sJAQJZ3naTh27iIGMgokuC7VECgUILkoBXIilZJA9VGpgKQ84?=
 =?us-ascii?Q?xJoeb1p4nKHswjGxGLRsqWtx5APUhlYds8Fvx+fDhaWYfcY2CBhFFpDt92xs?=
 =?us-ascii?Q?MPQLnGLBe4/RzEChxkQ+TG/jqJmgAoj7oCM6N/svT/gnOq6A4aCRCXD9D19f?=
 =?us-ascii?Q?tXA2tuZZDNROq+0eG/Rt4L4c3h/0RuUFcFgyHO9qJZ+Shj52dkS+Z0Vsxgh3?=
 =?us-ascii?Q?HY3LlG7DTPZvlf/xBwuQRdXLQvwmL7S3p5jUGcaRen+8Zaqi5bhygYItBwu0?=
 =?us-ascii?Q?VcGhtSYEuKWv9w93f0fHPhw1s1VnWt597l7E8oLrkvBMcpeTKpPJFCxHxQa0?=
 =?us-ascii?Q?5Cjqg4uNqurfStqEvZsM9cxK+FTGkGwFGrTZx4iwu6+2MZhfE12nmU14DAj7?=
 =?us-ascii?Q?eKMwOkrWaykLxXaR9FfgkfFerKYdWU39uN+HlIwFjE6b3jKQEolfCQQn+4Y9?=
 =?us-ascii?Q?Fq4S58YZXszFmhD5ijYTdaaEva0YjKe/yqQBMueMU9sX45/iAXMcFVz43Lon?=
 =?us-ascii?Q?BmqVV0PwCF4eKDhHiJeV/5irtMaHkc/lwt753GTbRsaOj9vXUvfXBocAFKXK?=
 =?us-ascii?Q?a5HLnRtvilyaRiS3qAV4iZ0NALLxmMq4Hxe1mbWCf2oO1v13SWRnA1x0nS3H?=
 =?us-ascii?Q?YJjRKzqTnBPCp6CLg3cxCuEIbkrNSZJ8fhQVNQsDROyU0tBDy4Q8xFkKFq91?=
 =?us-ascii?Q?vSTMgAzjElXhSBNvWDtqZtfPXxvU7ZouwZCumiI6SszcI3VXwTyaGFYvW8lx?=
 =?us-ascii?Q?poEL65htsM6AOI/4+Jb22Ou+ydGbJ1YEcR3EMjbRuRaU5wVZj252/NUJzzUU?=
 =?us-ascii?Q?fwOZrpag8NesToKt5bdth7BEACL+Bc5T3cruEcrb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d488a49-75f4-477b-2cf5-08dc7df8d63c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 02:58:08.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7nR7w09xNWflDWE9Tuuf/M7A80I3+G2QFunTOFa6Gr8luwocjhEkWkSqLhX114E38UFtUgV07hOYDRaiLe2IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8d7f48064dc365d3e6bfdf6b71a9561d5aa6d3eb
commit: e25e57f7c34051c1abec1fe6060a4af915f71b5f [27119/30000] dt-bindings: iio: add AD74413R
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405250844.2wAXaBNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405250844.2wAXaBNe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml: ^channel@[0-3]$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

