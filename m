Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C93233722
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728577; cv=fail; b=u4IGGfzPBCY8NIWs1mTcU1j9Jp/oeUbggXOsk+KdcHh2zZHIUBnPT86b0eiEwNtsE6e9y/PMmTpfrHsnN+I748bD+NA7UMTJV6UbkzodoeGBXKHnv+84RVezCaaeJODpVJeejVKMzbTryTdbjekYEcc0H5etCnUfTasEZuq8P40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728577; c=relaxed/simple;
	bh=5Zuscez9oJ8uJsknHg5JltXyBfoKB+X5qYRAYPUoSsE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lE04WpBG0mwWvdBr6rkVCSXHSqaOjouhQYS1HRqSaKYyKrNRjS20vcIvYexhrXrsI+XutBAq23wcFXZXDXptjfTNqRLdwAg9hWBrnj3ThKwMNDWUmfY+qt889nRS806/PKFIDv+Cz9e7aWWx801UtFoivH1U6m0IYUtDPRjJ02g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRw+oHo6; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRw+oHo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728574; x=1796264574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Zuscez9oJ8uJsknHg5JltXyBfoKB+X5qYRAYPUoSsE=;
  b=eRw+oHo6XL8sZ/Honi49nkaMkk7rUivZA0EQC8eEpor+DlTjqQoEzOi4
   WHZp4Gttf8Hn3vhBQEVxvO3hLk8YOQfdOp3mI5lc/FVpnCKWXaXLEBM6N
   efNXXqANAI4+gScDTGGWvjTZd1K/scGnj/DBI5w1FA3UaUbcd9MyAnTg5
   rfkGOmcaYstYmHaecqk/W60gD5rArAvEabN1LSwqeww3qC3sPxNCbDUSD
   S+IE1gwoFuCx2XllUQSjt2Eih31Jxu8EZCl5k6iRI8ipjc2GiIbI0eZY2
   PMgHFR1jK2JJZn0lLvquCW3u2kNuyO40V8MlpQwsW7ElzIWlntXVSr87Y
   g==;
X-CSE-ConnectionGUID: d5OKEkv0QyuHg3WxGTYPmg==
X-CSE-MsgGUID: ren53xlqSYCuhi7URR9hqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66755252"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66755252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:22:54 -0800
X-CSE-ConnectionGUID: G2XHnewtRwW/mqGhRdppTA==
X-CSE-MsgGUID: FbUQSXevRxCadDTNLi7Rng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194360099"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:22:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:22:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:22:53 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:22:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/A/zopZXCaPTP5pp9OoyDyw2J+gXKbFdSTkHsC6ITYEaJf5P56j2Z+AguxOWhvvCU8bk1XqZqeVUOm9LKIy3s5h7Ao2MQA0ti6booXnDKc+QvFAHRX5mmX+S4bB7VIhTgCdL8v3L343b8ByR5CMkabKcRY46aMeX//ATTlcWfdm6qQOCUxpR7VepNyPEgH66lOK+MOzuj9QoAURCkgHbzAh9Po8PNWyks0g6ptLHgqfASIf7yUVdSjiwFOWE+jn8hpFi8HAczCwCrFfu+JSVZA++nNJ5PUT6bW6x17X70UBuGUVwFph9zz4wOGW9w2dtIgMfgBYPDp06sOcu2604w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDhn0LZLJkjL0fVHduvWUMIwYiXGvTx2+Bi9UDWioIA=;
 b=EdIfnrXEn/HycTkUV39Jlpvf1vEdUhMj1RV3ZdvW7bB0xXGcincOk+6hw0Y8LM2HCsV/ISSyg3BYR6KKxGIILohvZzY5vMXDNRJqbH6N9tXUd4Tyuy6B7hrpAHcOk7H1tkKQ2lQnuj1sEFIB+IsKhkD5UdYU2R9tPcycwBy41gwbKJCsVKxFOFcF6cjmCoPIuCflYjE+Bs2NnR+9jC8YaX29Qv8unBgelpbxTqc9TrMAjE96tEbHLzA0tIyXTZ3ryewzWsa8j895tmqxuVKr6lYyWU4CRFFXoK+1hdBuyODvXph7qp0yOnV73y87QgPLLBIr+0Z4QSG/zgTzfXiBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:22:46 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:22:46 +0000
Date: Wed, 3 Dec 2025 10:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, "Chaitanya
 Kumar Borah" <chaitanya.kumar.borah@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_color.c:3966:47: error: implicit
 declaration of function 'drm_color_lut32_extract'; did you mean
 'drm_color_lut_extract'?
Message-ID: <aS+e7XXczTkFuyxp@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: be3d66b0-de8a-4ef3-ad98-08de3212d8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RBUc/MCVnQi5NjmKT8Cp599vu+q08v8HSQueWCapHy5L9Lwy6vzYoNQm9rm6?=
 =?us-ascii?Q?370nSewAXdQYWgVMzSKkrnfiZWoBMxv4Q+/Q1kPPDiskARZ3b0TEjZe3bfbB?=
 =?us-ascii?Q?f+pQVtbK5fMjBeX0pQ9wbHh2Mc6cNQ1Nir8+rR2OGPl3rGouPusfIotD+nRu?=
 =?us-ascii?Q?ZgvwB9jViBj1imjvhf7+Lcig3KVJ8/rOGp794Rb+zth0XeggkcJlY/Vi/GL6?=
 =?us-ascii?Q?6nmGZm6sV1h7XCLcWmw3wHQJOtVr34n8XKOU1iGGdK3DlZ8W9S4eY9L8C8QL?=
 =?us-ascii?Q?BmOeaFfll0Lfjz7EsS6vjcNgFgUU6ASUjZ1la7TRxWh6YOp+CLV+PHoz6Wf9?=
 =?us-ascii?Q?K+6edYTTbg3Byr/HRtz8m3XGN6Xps5SECgmu3HU5L17t/gSkkvEB4lzkZ960?=
 =?us-ascii?Q?Cc/afquiWvQqZTrntqwQhbIhtOZrcoge9ASEaQx9NaxPovq1sJ1+4KlbDqUW?=
 =?us-ascii?Q?BMBX2UtsRLSD+HzPrV8NM+ZzrKcJGDrlfIUVgqrkb5hCGSLPq5gOPSQcNL57?=
 =?us-ascii?Q?EnMdvuvzi3frVJWQvf2BMzRASaDt+WxKYqOTAiGifw3OW6mwyO9Gi1O5hdrF?=
 =?us-ascii?Q?YQU8KilDkaWv8sS1Wi/8GFCopXoc0H8LEkifRbc+lYZ9knw2pIOwn+wJRJI4?=
 =?us-ascii?Q?W5mr+ajZebi2ZENeHK12mI7K9dPYyHGFmKxVg7jTXuh5yFSWzaBTqwLtNN4R?=
 =?us-ascii?Q?6D4ZCmAFZ1PKnSLDSY6QbclHEFqCE4OGAMlO7h8tHxiDgoGJn2daekm/k0Fc?=
 =?us-ascii?Q?sebifLgwY7U+VuUs9hD/hhSuO7ZHStzs53D/CKnLNecAvaGi2V04jVCc3ggo?=
 =?us-ascii?Q?MCvCnS0kC8HJrKA1UIF1vF83iBvbc4bnQph1OMRb5wD529DHxuh5joK13Dmt?=
 =?us-ascii?Q?bzGayFysT/P2qWkX0ike43A9IJhmYRMZAS7wo8Afk1fqpx8ym0q3+G/4B0rR?=
 =?us-ascii?Q?i7TxPhzN2sIn36ti54E/QLXubyUdKLX/IwxXysbZZ6cfAJsl6BCX3rZV2Zym?=
 =?us-ascii?Q?BWpK1/RiAsxbY5EmZRABTwwG1R94OWoe0xAKjJif40ZtbJC6nVpSoVud55xI?=
 =?us-ascii?Q?hjyxeznbnWPkA9RuMFHPByAlK+sGjcG8L9eQjaWr6Wu/MbtaLwg+2uuh75qX?=
 =?us-ascii?Q?le4tILgNtwpUUAYmpubMhdn62Ge5pmbjE3I88nAgHDlvuhwc1R6PjLhua+uF?=
 =?us-ascii?Q?I7jcDQ7swFXnoa/ym2cr57hlWphGRfPrJaeVgLNgbuNrvF9LoHNL9RZDvVlA?=
 =?us-ascii?Q?B9t+mOTUtJw/y4Ggst76qrppzIluH8BMLEcoJDgi27i8ohR59/GcwqvmQJc5?=
 =?us-ascii?Q?E+2qgHd3wGcSLrqCR+8zwmMtaoqEPcIrMWtpmbu8BZOrReCJxfnDbbFhNVoN?=
 =?us-ascii?Q?q/VlRFbv4pACSuWLl5oNcOLLNbiGv6nmwZcMTWzMFJ6bzdz/jRJGU1RNSUYC?=
 =?us-ascii?Q?uWFJ9OR80E9yp4YTxmTMG/Pau/biIQvmRH2yHJd3+THlU/Bc5CO41w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?17nfoFBCDdL1xnXhjO/oz0MWTTEOfk+pmCKqhjn2qSVMYiiNWdXqeChTmpgZ?=
 =?us-ascii?Q?62ghvozrGSdN4ygca55WVoKJvbjNSnmD7/yl96qvlk1y9LtQphDkEJQFXjnE?=
 =?us-ascii?Q?zG5H3i6BCqO9C/x7qXqfW87EV4GoeyzSBmvuX6opbvEIsxrfWQCXM0EboVMZ?=
 =?us-ascii?Q?PKsVvHn3jXYSSfwCig2s/l2599AqU4ztz+tXlCT7m7sh9U7tgz8wX1u3/rfZ?=
 =?us-ascii?Q?PhoOzTn2psKiygSYHPNxjrPxuKbhrARkdw0mDoigqJMACKfaR3cpMb3OIV08?=
 =?us-ascii?Q?KFBq346Bid7NBAo/qwBPfjTeuaAIUZKmh0f5ZF04w5Mad2p9DF6r2qFD1Snk?=
 =?us-ascii?Q?gP0XWsOPBujh+TLU18qYIN4lPxUMxjtwUFw7EEGfnFrHfqhvcB1RVpGrDIh1?=
 =?us-ascii?Q?Zsv9LR+KFHJCvSXCfiEKPOk85XELaDEvXq69/i1vAcjDelLLYdTHLo79ghIE?=
 =?us-ascii?Q?fhcNmhrb2cvYgmEOLeUvCrVo2yBIGZwAmoR8QTqXqTlSyHpOzEW0oqtQEnJD?=
 =?us-ascii?Q?AyW+/2yfTsa+mi1nYvFEDIK/fUzYxhYHSVnjdanQQDJkwFJYnhd2hyMp1x7o?=
 =?us-ascii?Q?4qF82KS/zYaPJ2TPWKS2zZ7zT5ahXocyWFU9U4Ul6m3EbrMvXUrCtIjdGeA4?=
 =?us-ascii?Q?B3rX17Dt+aW3vcCgNG8WFL/i0LRcMXB9kcYelfXAiqAa2vgUvWszQq4tGRia?=
 =?us-ascii?Q?HTZwRmKRFAVZvc4LJvE7e+q1mBA4zngmBFLzyoQYHcRNP3IYBt9lviuG9HK0?=
 =?us-ascii?Q?Xoucf84Hha/M35dptke9/0SnRGzhVjpT4ixHxy0foCgG/VhJBL9OJ5ukkDGf?=
 =?us-ascii?Q?sUp0XJ/spdDQKZQSLcQMoaTVa7MoJgCS73qZC48YkZPpRGZNVrvjlRzsaMi2?=
 =?us-ascii?Q?HklHgAg4xCsXYdQcfYwZUMwl2w7Wy+FII3Ljj97Iai5ZsPHX1grbx9fmuUAb?=
 =?us-ascii?Q?VYCZHlg05okW60pn36HFL2gIanJK9lSbryYs/la1/Ijn0EzSExFOcK0Enc1z?=
 =?us-ascii?Q?RdxqgfXDXDlJhK8hPn2zBi6ox7JF9r95uofjykG7CNjdNU5n0dDtcfJYb72j?=
 =?us-ascii?Q?7re4sQ/QuxiQqN61LtlYlaAtpZWGmMv38SM3Iy/eVld/UbV/Af4S/YnQLJGE?=
 =?us-ascii?Q?gcMwNFBFdhFjBXi8N8LMbO7DX49Fdkl8/60JmDsO4fvPVbUGSkIg4jnD4Dur?=
 =?us-ascii?Q?VKRHoaNZ9cULQ2tNceS9gcl0q1Y03+IsKIzOtzD+9MAGIMerggcUI2zVF/Fk?=
 =?us-ascii?Q?ltB5IszcUAVGWSEWPUiSp7sA10zyhbgj853I4CJYo2DoK+Pq5Cl1OgjztHXe?=
 =?us-ascii?Q?E93nz7AwacuYi3KIB81ia1kYqW/FZMZF4G4DpyutLXL0AFwhlB4M4hYCWrCo?=
 =?us-ascii?Q?3RyCYhpjWFgqaUK96vi1NyTz6jQ9kwZ0mhLGu8TVLs3eP10Ok9FKQ9gf1AWd?=
 =?us-ascii?Q?7uNyegVTkgFz4VrCbHGvo7E1lcBGbMU6jnDTQig/aEU1+ovVIMIyGXs4M2qX?=
 =?us-ascii?Q?b/IZQ/Bc6lzRTtQ3P0LKgwnBPDVIqFiY/JR0uAHLMeWyXw06HDwv9eC/NXsd?=
 =?us-ascii?Q?yUqwu8uadt+tnzVgkUZqPPWQhcMqFlL70XSKXSsBQVfP+3oj84JjLIH6uxAh?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be3d66b0-de8a-4ef3-ad98-08de3212d8e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:22:46.6335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYcmZweDQ8Ysh1lgvwwZaUfkV8i0Obk3QMvTDn60Sd+9R6/Wj6CQLQtXkWMD51YIsU+LMkTiH+2bgwiXs8xUEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 560aac84e09db2e0d1f762c53f406e8c096cf0f2 drm/i915/color: Program Pre-CSC registers
date:   2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512022117.hWNdILOG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022117.hWNdILOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022117.hWNdILOG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:31:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_load_plane_csc_matrix':
   drivers/gpu/drm/i915/display/intel_color.c:3869:20: error: invalid use of undefined type 'struct drm_color_ctm_3x4'
    3869 |         input = ctm->matrix;
         |                    ^~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_program_plane_pre_csc_lut':
>> drivers/gpu/drm/i915/display/intel_color.c:3966:47: error: implicit declaration of function 'drm_color_lut32_extract'; did you mean 'drm_color_lut_extract'? [-Wimplicit-function-declaration]
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                                               drm_color_lut_extract
>> drivers/gpu/drm/i915/display/intel_color.c:3966:82: error: invalid use of undefined type 'struct drm_color_lut32'
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                                                                  ^
>> drivers/gpu/drm/i915/display/intel_color.c:3966:85: error: invalid use of undefined type 'const struct drm_color_lut32'
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                                                                     ^


vim +3966 drivers/gpu/drm/i915/display/intel_color.c

531d2c65d4e35c Uma Shankar 2025-12-01  3945  
560aac84e09db2 Uma Shankar 2025-12-01  3946  static void
560aac84e09db2 Uma Shankar 2025-12-01  3947  xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3948  				const struct intel_plane_state *plane_state)
560aac84e09db2 Uma Shankar 2025-12-01  3949  {
560aac84e09db2 Uma Shankar 2025-12-01  3950  	struct intel_display *display = to_intel_display(plane_state);
560aac84e09db2 Uma Shankar 2025-12-01  3951  	const struct drm_plane_state *state = &plane_state->uapi;
560aac84e09db2 Uma Shankar 2025-12-01  3952  	enum pipe pipe = to_intel_plane(state->plane)->pipe;
560aac84e09db2 Uma Shankar 2025-12-01  3953  	enum plane_id plane = to_intel_plane(state->plane)->id;
560aac84e09db2 Uma Shankar 2025-12-01  3954  	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
560aac84e09db2 Uma Shankar 2025-12-01  3955  	u32 i, lut_size;
560aac84e09db2 Uma Shankar 2025-12-01  3956  
560aac84e09db2 Uma Shankar 2025-12-01  3957  	if (icl_is_hdr_plane(display, plane)) {
560aac84e09db2 Uma Shankar 2025-12-01  3958  		lut_size = 128;
560aac84e09db2 Uma Shankar 2025-12-01  3959  
560aac84e09db2 Uma Shankar 2025-12-01  3960  		intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3961  				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3962  				   PLANE_PAL_PREC_AUTO_INCREMENT);
560aac84e09db2 Uma Shankar 2025-12-01  3963  
560aac84e09db2 Uma Shankar 2025-12-01  3964  		if (pre_csc_lut) {
560aac84e09db2 Uma Shankar 2025-12-01  3965  			for (i = 0; i < lut_size; i++) {
560aac84e09db2 Uma Shankar 2025-12-01 @3966  				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
560aac84e09db2 Uma Shankar 2025-12-01  3967  
560aac84e09db2 Uma Shankar 2025-12-01  3968  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3969  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3970  						   lut_val);
560aac84e09db2 Uma Shankar 2025-12-01  3971  			}
560aac84e09db2 Uma Shankar 2025-12-01  3972  
560aac84e09db2 Uma Shankar 2025-12-01  3973  			/* Program the max register to clamp values > 1.0. */
560aac84e09db2 Uma Shankar 2025-12-01  3974  			/* TODO: Restrict to 0x7ffffff */
560aac84e09db2 Uma Shankar 2025-12-01  3975  			do {
560aac84e09db2 Uma Shankar 2025-12-01  3976  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3977  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3978  						   (1 << 24));
560aac84e09db2 Uma Shankar 2025-12-01  3979  			} while (i++ > 130);
560aac84e09db2 Uma Shankar 2025-12-01  3980  		} else {
560aac84e09db2 Uma Shankar 2025-12-01  3981  			for (i = 0; i < lut_size; i++) {
560aac84e09db2 Uma Shankar 2025-12-01  3982  				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
560aac84e09db2 Uma Shankar 2025-12-01  3983  
560aac84e09db2 Uma Shankar 2025-12-01  3984  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3985  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
560aac84e09db2 Uma Shankar 2025-12-01  3986  			}
560aac84e09db2 Uma Shankar 2025-12-01  3987  
560aac84e09db2 Uma Shankar 2025-12-01  3988  			do {
560aac84e09db2 Uma Shankar 2025-12-01  3989  				intel_de_write_dsb(display, dsb,
560aac84e09db2 Uma Shankar 2025-12-01  3990  						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
560aac84e09db2 Uma Shankar 2025-12-01  3991  						   1 << 24);
560aac84e09db2 Uma Shankar 2025-12-01  3992  			} while (i++ < 130);
560aac84e09db2 Uma Shankar 2025-12-01  3993  		}
560aac84e09db2 Uma Shankar 2025-12-01  3994  
560aac84e09db2 Uma Shankar 2025-12-01  3995  		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
560aac84e09db2 Uma Shankar 2025-12-01  3996  	}
560aac84e09db2 Uma Shankar 2025-12-01  3997  }
560aac84e09db2 Uma Shankar 2025-12-01  3998  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

