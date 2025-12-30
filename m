Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8EC145B3F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 00:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055897; cv=fail; b=rwGBuJIEiN/uLY/0cAyrNrp/JHmdm3UD5SRtqaIyxNv8woZUy/vie08Pi61rXn70dA4qmZaN7BRRyNNM7AFVn1+i2L6CgLZ8FsgQ9TYdqygcoi+ygH7dlJy5RuvsWpL189kVY/Fft5Yw9iRbBsDFNwrdD+UfcoENmA8AIayJA1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055897; c=relaxed/simple;
	bh=nNp+sK66ii2jlez1eIo6u2D9PPq94UZMrfd24EPaHws=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Q2YP2Vr9iCd9Y1FZSN0ydZS1vwHLZk6GaZd5HrRCLdZ16jF7Qsd1QaF2isut/UkQFGL4JAjDji0hHzWyfOYt1TBwkIMJbjjVGVpP6SHgadWSpeQ7opk9vYmbG52w6uTI57AE6dqqY3QS+t9ArDHrIIMJmPtajd62zry6fAFE+kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTM0RvPq; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTM0RvPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767055896; x=1798591896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nNp+sK66ii2jlez1eIo6u2D9PPq94UZMrfd24EPaHws=;
  b=CTM0RvPq60BebyDmaXnOVEFlVbr+pRQJ6dxRiXEJWUt+YkN1PY3dS9JE
   30hWp38nIzStPQhEHG3yI1U+pYkOr9sIX6E3n0uj9+VF7T4+rHy34JWaG
   VYEOVPG8WkWgdL4MZrFZ9e8wZko8ymfHhJzLnDI2JSuPR6CBpnLu6pigD
   ftkdjIflHCQYKt1nJjWsYRV8b+ZqJZXCCXQmVf+x5O1iwELxfYp2V6UXH
   Mg1Mec6Cce+nHuzsJqfzrgysdSFqlqPs80B5NLeJLJiLcg452oRkEPduj
   6ARI5L77Bp+huvptW7LLJ5AaWkns7bRL6C8JUil/RdtbEY87L26tewfDN
   Q==;
X-CSE-ConnectionGUID: QwvVtvJyRy+LuJm332Vp0Q==
X-CSE-MsgGUID: tHoPqoSGR9e6SKuNQZRDkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72278751"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="72278751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 16:51:36 -0800
X-CSE-ConnectionGUID: 83d4rxGuQgWAPuR/sRoLgQ==
X-CSE-MsgGUID: GOx2KV4GSwmfxz21dnLypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201063314"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 16:51:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 16:51:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 16:51:35 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 16:51:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY9L212SFR7ASpL0SB+bXlaLTiwwGAGGqCyu1ar0jDE5xzKt5wibQt4O7SB/7G77+xwWDjFIv5gJiEYOAq8qcL9p1A3BFgysYHwG82KT/HBFXcaZ03bLA+5c7ZIwgkLx+JKnKGcE/OtyHNOnCXCz/WL4CsRe834thEEE5p/IJdg0ioPUPxC5QBWQ5oxCZN/67g+4cGjYDxwE2HBs+hsKXqxaD5QHijMChMqAbdZ4wHEj3/HBHL5wxzDHa+UVEWPngsCecdn/AvRqUysCWYHf13kYQwbOw7jJ6f8h2BmWQg9I1i7dfJxKzbJUMkBVO2lNl22wvPreKpqkH8D+sP54Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yk+tfVMtOi58eiaT00S/SMtnEWIYEsOw8ROBBUDUM4U=;
 b=GbaEakWgOObqUPJmRW/uCC3mr/i9kgDwegAteeGeEG0pMqW+1gbiZYDwO6fVk7tOhSdn1gvZg/NJdBJkveqp7DIyLOlloMvxNyiO0iUwaF6R8l7Bv3UqL+1NCs0aBTNyaxe8nTyc0Z6MCaPTu4pbvp2JneRuYTFePGpJmzR0vW6dPtptgxTvhtAWkw4JwTmz6AnnOKKJLzhyySsP1PBTKKMaxR6dxBtwca4nJ/pMt1TWnwvmnoQFz1iyy6NWiFEJoi9Esvzq25t/QZYg7WlvC5x83Y6hu1y1aG816gC2clUPZppkmNHohd+rEIajhojTawip5g/d7JiFJi/dbOfM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 00:51:27 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 00:51:27 +0000
Date: Tue, 30 Dec 2025 08:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [paragon-software-group-ntfs3:master 16/16] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aVMiB5OhE7BSNky5@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM6PR11MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: 70bd530f-43e5-49d6-8bab-08de473d9021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KS5qBDmg9w8lFrqUS6M9QjGsFzaPmbpnuRnDvy6NU4OSEu+i552dzHuNBaa1?=
 =?us-ascii?Q?PuR+JUi5wj2KIUJTD9Hc/on1gsvXgMYzVGdlOmXIrrGyoUIOf08wj64qmC0U?=
 =?us-ascii?Q?v1Iqb6lELPRGaQjji9y41WTYmzRggePV2SBM1XGwp+JI/yJ6Hc/3SzNswOiH?=
 =?us-ascii?Q?LxNtaUqp+ILqzuwi8uWPE9X66bGRqaSO8ie0p1/cNDcwv4bxljmCIhvFgjUB?=
 =?us-ascii?Q?qyHLt+pOMFZXXHaz6sDAuwW+AJ2vBByrqd/bHhE6LB3vpvbcmyjxCxGA+xQP?=
 =?us-ascii?Q?pNis7vLiMrsrnQPcTKUQvcSQAepI8cBL2z7gLM3rjNkiC0ZBmhdUR0PDdyx0?=
 =?us-ascii?Q?6hySdL6vKSRrBmR2I1s0XlVytpfPzsyLgMWv5eUg3Tb+Q8OQs9y4AxzdEvE+?=
 =?us-ascii?Q?yLZPsJKcgmIvKEG+7V3/1Dx8KvQfzpkAHDCcTstljD4CaefBjQIy+/CmRKqd?=
 =?us-ascii?Q?u/0Tow9MoPapxg2LNsRhqUX9MZDu0k6yMosrlLkZeLx+OgEIfydOG9fsi2Lu?=
 =?us-ascii?Q?9wTMSvzL/1UD8syUPDdyj3BLmQefAqzE6a5y1yW2UL9xE4fPJkSx/eqk1EIw?=
 =?us-ascii?Q?x2AUgpEOlI1vFQz951+xqhEPMlCmMssgQv9XOb+Yu6x1GuNs8wamCE29zS42?=
 =?us-ascii?Q?OvK5SOg0ziF+XBDXfmtLKCAprZ5BZ1w1LoXVzHekWyA1SPZo2wA9ms7+M6U9?=
 =?us-ascii?Q?R0eKuDtU/ogAlLng3/qk87DAHseaIMt5HBATPWroBbkx9CpQ9XdEMDuJI+yY?=
 =?us-ascii?Q?Sz2kxWEu39eFsrmZ3kO0RCNCaUTnoQ8VwhA986DfOxIyYObfumRb/0toYYsl?=
 =?us-ascii?Q?WrPesrtYlhyN0XKt+5ABu/eSCz9N6vDmRkKmUBofu4G5ad36jCJXVjSqrqKx?=
 =?us-ascii?Q?G4rVsKuIHfkagWKlG+ICSoix1qaT8sL7JnpY2VuTXZ7kkI1emzYPUOFvbwtl?=
 =?us-ascii?Q?VxZq+wN3dPQsPrrFRYaS2joYOLtI6bn9eF+WkRLrxCLhG/jtHYFTaa7NYFbL?=
 =?us-ascii?Q?1F9Ow51JtKdFt+XzJYFbR/Dsp/MZ91wwP5Adl3V6enLVe9HEj0wUKRIgn2Hn?=
 =?us-ascii?Q?ftrB8BwzMJu1LZyg2ZwM+U0NA+JNsUSxhw9MdYaKqD0tDFm1swC+1KRnrBlb?=
 =?us-ascii?Q?vcQYlELJjcQ27PuMGEfgQqOdPlG3h6sTQfCO8Tn89fSejZBjJXQKr+RxSU6Z?=
 =?us-ascii?Q?YoFZRzhwTCPbZ7WIhaLkdEbL2z1nQnU8uheNF5arTVJl1rCyjYxYMHKV8tPL?=
 =?us-ascii?Q?BH5Koz3FBOEKEkARCgk0tbwBBWDeLdtETqDT6Iynxxo07xwlJWOGM4KFu01t?=
 =?us-ascii?Q?4nLWFu7LDoI0rQWP0RuwDvgUgiXOHiT4hYSeiv847vuqXR9WVdIrtx3U+YAo?=
 =?us-ascii?Q?qh7BFluX3Lj1wBcfgtSqkTuG5grMR/xs6ziY0c02Fsg8AYg6rDxpApEZ5PwY?=
 =?us-ascii?Q?bkQwxh+DmggrOp8vCQr7HvZ99E3JIBt27DrpuWIAq06EykZLKAuVcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YrdTt74+oZqzOeQxP4/alxZlDDiGErCAuj4IffrlTNfi4JjavUxMme/po2vB?=
 =?us-ascii?Q?IW1bpvEgR35FyJvA0xmCtKx/nD6b5xme6ptQlEl7rW/LwoISDnLYN/AnyT/l?=
 =?us-ascii?Q?sBlhhqoL7E+zFGkiYvzmVUVxFkIHwsbEEPvrNZdPC9TpLH0P9SDcwaWywWY0?=
 =?us-ascii?Q?LuSR6oNJ4cZar8m9ots7Z+oUGOo1DMx9q5NBOtM6Qdw7aKCXfdO2EZezh8/z?=
 =?us-ascii?Q?fsii8dvFl/5prUnHLEh8QrIfDbpZB6cW7m+SdGsWqb0caooDH0OGEQaESAYr?=
 =?us-ascii?Q?QQyLv1HfWgv3DEbSwQIBdeub5PP38oB3t9sQEwbwhz1Q6Vqk62hNrEb2Tiad?=
 =?us-ascii?Q?gZ/TI/01PHm5hdtDQt5nu5KUeK5Y9+Kr8tchMSwNRQerF0UYLg7uB1HxtYIS?=
 =?us-ascii?Q?52PYl+ThRbkiL/ehmi7DEZxYZ4RfRl2AyJzGf8kfsxFKm6hClM8OLF934kWn?=
 =?us-ascii?Q?gYv0ALHf53E4JXLSecIXlTPZrkSps67qAx3fKx04n7bp2sQi3RF7r5T1MRH7?=
 =?us-ascii?Q?AgJuTTCtdyEdWcppz5d3lvMeGpup/Pi5IxLTQJ0Q0W0uNBQDnJnJk6cld4Xi?=
 =?us-ascii?Q?nT1AL8ygLPegsm9318Z81MUt9oTqmfoAajNhPNUTZq5b2R8fiNnLdj8gdpfm?=
 =?us-ascii?Q?PhAIAPpoLL903ni+YADy/Q559RXGllo5xORN6DbYSUqe7XPz+YpnsiRuEzaP?=
 =?us-ascii?Q?GwcvcBCR4xS/NiHTYpOC3otavjJqctnXIiHreE2QKR1HphBy8B5HVHPP04h9?=
 =?us-ascii?Q?vGt3VAUjnwsHonv4Vda0SM91Az/9VUvGRgLShxUemwM7hcZ4vGqaffxEv6o6?=
 =?us-ascii?Q?707Z1Cucdp/F9hJADks7WjrgjnId6z+8FPlMMwyQJ8b8LIBbs5nAw0TGEp9p?=
 =?us-ascii?Q?BSFpMUZgI74jUgZMlmuYSQS+hX8k1nXeATlGJTuILeJpjsNmIcZmOhGelC0n?=
 =?us-ascii?Q?n+mA0TDEJKpYS2KzS0eso2qOHjjL3W9ktywntoT9K3QwcW+8qlzYF5VmDcs5?=
 =?us-ascii?Q?s+W7zIE51WJWEZsWBURxQsOOrhyV0MecoiEhanTa+7Zpn3pLKhMzWiYy5S9L?=
 =?us-ascii?Q?VxfXHdCzqs0kU+VcnYgqB5dlKYZH+OTPewTeuNdzNPfhif3xou8wgu9mIxwK?=
 =?us-ascii?Q?+PAjZ5+CAmQwdH2YOXn9wBaQhyXmtFg4TMIt4PmsEbQAs/k0i5CnPpQwBcAf?=
 =?us-ascii?Q?cJQNdqVvWpzCKW4s/hct/oZumURj5gFU+YXOVchP97RUiFAISS8WkcfNLiRl?=
 =?us-ascii?Q?wz6qkTc2CWZOLt/6nSZnLe9tlXGoFmWRe3aDgmPjdqB6Hgjyuu4gsxDMTyPp?=
 =?us-ascii?Q?Hi7iNObclPzV7VkWHXs5l0D3lFYEtCugMJ6ioR3hneOwlQr4K1Od8VZ760Yd?=
 =?us-ascii?Q?UHS+gbOT9rgJyK5m3yPpnk3hPSrsD+FCZQMb70Pb4LZkuSZ2hIPaKpUxn3Nw?=
 =?us-ascii?Q?DbTLpcFeyHS/LLEqe6Jz79h9qFuJIVzZXS1HQ7HtVk1vkHplxNnnY2lfBQrk?=
 =?us-ascii?Q?3eogGTaXRqjB8CfaOGKQ4By+p7QOufoZBSoQD6uXkNFECG1t+POz21Z6uyOw?=
 =?us-ascii?Q?XT16hU3LZRs7K+/DytD11fPMoJZoSXGs99fEy2tVTxoxm+q0pgrs3lJHkEK9?=
 =?us-ascii?Q?bvQOLaawVfWuGMzcHwu2XZxuddjBLNYOKKINhqz25JKdhKhSJd26XgCWMyAu?=
 =?us-ascii?Q?bXp/oGcOPBU+6HdMRJ0EgGv3z91/kSh8jluAo+BWoZ3ZSWZxwAKE3pe8+kuW?=
 =?us-ascii?Q?Km6BwzRdJw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bd530f-43e5-49d6-8bab-08de473d9021
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 00:51:27.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nuzq8nplv2QCH+nGqovLWB3lqGdPVXEcHa5YCBA53w3RMK13q8bzJnMPxnmiqIRdruYfs6gHDv7hf4qJwfN9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
X-OriginatorOrg: intel.com

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   099ef9ab9203dff327f2d61e44773f9acbc01f13
commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13 [16/16] fs/ntfs3: implement iomap-based file operations
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291918.ShiB9swY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#659: FILE: fs/ntfs3/file.c:1302:
+		/*
+		* We need to ensure that the pages within the page cache for

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

