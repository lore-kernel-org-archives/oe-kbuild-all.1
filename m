Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D738F83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026619; cv=fail; b=rkxdPjy16GbiYIidzKlHPirZQOF8+7N7fhtVY5sZiVs5bcatxjDqYst4Z+AQVKYQTFq8o7DH3cZtpYf5mqZ+QhvKLwZycOnRdUtP66QOkzxIS5fcrqOwrM5Ftu3gC95rnu69UCoMLKAJ300ahW9bIWXE/C0cpSNm5nmv+UedXnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026619; c=relaxed/simple;
	bh=mwFUNztrh3u07G3rXF1VLcFLMcSh8VqYs7jHQS6Egs8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XltgvLfKeLMWP/CvEmhOOsWikDJLGOoeZkooc5axqLjFz0A06i53KpId6uIG8P2IRyni/m9fgj2SZOyZte1DvFVQEQNnCtdKDETlWPRWG7ehKe2VyYBWLqJZXxG/l1pWKHEY02coijAyvHJOcxoHjEHMLZ+m5Y2Nwd9qnmKCI7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL3ZOakF; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL3ZOakF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714026619; x=1745562619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mwFUNztrh3u07G3rXF1VLcFLMcSh8VqYs7jHQS6Egs8=;
  b=BL3ZOakFRdo0jv+5kP6g6mu6bgHWg05Ks84yvLcaHWBnxe2lr2RnlxfO
   zCtuR7/e0BXE0cm4+43C1CSM2Aoa4Er6z6os9/vPLx3ZalV67LptQMkJi
   nWr1mObjocycZH/ex/JM3qyaweSMkTp/CQPfWyc1B+LsM1bzVBhVxR2Wr
   r3tM6Da/5itBUeI4VM7LdFFWZxUsVG0N+xzOb/+bdfuU98SOLfRmQi4ED
   x7hcK8XvM8xX6ZxjkqYTRhvQ5bI0eL20RY2EZ2TivlVtL3S+8BD/9MTNv
   GX1pBRJWhu/rkuxWzoMR2fcjGkK/xjiwWatupfHEQ/q7V6yrdxV0jj77C
   w==;
X-CSE-ConnectionGUID: Z9gVqOQGT46aIJiqYFAkCA==
X-CSE-MsgGUID: 4eguiY7STLCf18Ir8TGm8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9802426"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9802426"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 23:30:18 -0700
X-CSE-ConnectionGUID: WGZblV4SRveNNgwb/BAytg==
X-CSE-MsgGUID: rQraELhOT1ier4zkRXjxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29422861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Apr 2024 23:30:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:30:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:30:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 23:30:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 23:30:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRNPSQ8NZ+YH7jgXudosqAOatfz/Yxw52LU50OZGDPwVjrMmoIlEBa1g7ajwvwEFNK3zmVJmPhUsGKSLSmF/rcnjnfs52a8emWmlXsXH0DuftOZwNiktp6Qe+MjxFeh4cHQ5i2aVlhxrveiqq/dUtsZZSH1wQs2SM7VLfuSSiqCbGsy0I4mbCzjhDRT+nQ6L9Np1Bc6vky/4Q7rUpoJnPHehCD2wDetYHGMVnOrY+hOOA/LEqP84J1vm6euoU6Y+dDKpmC/d/wEH8C5pOUXtZVkUIfigEAJKATdXIkKkJ+YL2ksua6g3eFAWjM9xbHeoeIr23PqkgoDjZ1LYpOS3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2W+1uopRfuqxRhrIdwNExS1E8eWA8csItKusCGaaeA=;
 b=Mu3b36pqSI4c0M8T1K91TdX1PGhbrZ24IDK98/6samZzI/4XvtWqtw0JK+m/AKZchs3rGax/sRS9aagVxxE+YJbMLfQBAkf7DdPlRFu6Nza8QarOy1++u1Dp8eQ1UQF4tumCTe2cO8jJQbRKDzI4+J1FiKAGlPKjZVBvBX5zCtVQ1lFgBK1IecG+la5OAAteuIKsV0alrQL6rZym929D5lAUFpsVvrXclmbz/wbfhh9IoQsDIAfubHgCJJJ2QTh1r3pT/xMzEJO4cE45rLo+pnzXIPP9Tzme453ihckDNozRn+xeurKhouSe8H2DwFvSyjrB9qg6r/nsb57Zw4GBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 06:30:14 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:30:14 +0000
Date: Thu, 25 Apr 2024 14:23:42 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Infrastructure
	<z1.linuxinfra@amd.com>
Subject: [agd5f:amd-staging-drm-next 2014/2033]
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c:
 dcn401/dcn401_clk_mgr.h is included more than once.
Message-ID: <202404241420.gx1LAd2A-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0095.apcprd03.prod.outlook.com
 (2603:1096:4:7c::23) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SJ1PR11MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b71e0a6-be19-42cc-033c-08dc64f12a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eM2Rs6h4z7IqAksBiHAmL+dx5Cdb3yn7LUF+WsL2uXKk4AUCNyGk2MRU4xI+?=
 =?us-ascii?Q?4aOsfAhHDtaiguKeNyqWYZ9pz5i0xnVsqjOfXsJN4Phc0a8kjjHu6mAt4MVm?=
 =?us-ascii?Q?Y1yL0q8cQexadJRdW/pHDhey0y3sNxoGKw9hcq/jOEo/xM//dNWSBZgb6wGt?=
 =?us-ascii?Q?/9WClhlwnksuJNnukXx/V8jLHdaDzPL7yXpAX6vHyiQZA9OUg9AOWSsnKOQZ?=
 =?us-ascii?Q?+ziMBg+f9ow389po8eZ1mKiGSB9h9f45CCw+BJxAIXqZdpgGQejPLT/M5V2i?=
 =?us-ascii?Q?R49RN6lbcRIi+/E0xSmxiAtdJ0OdXt3ol1KG1xmlVPUrprfJUd+JefcKsRgo?=
 =?us-ascii?Q?Xt+ge/b4qPf3l5jh73BpyIY8GtPDYk4L1TvJIZqeV1xUULRb1kD81umj1ksN?=
 =?us-ascii?Q?2n3/sKTnN+HcG8a0zPrzqGEtc2YIH6LrqxdWWqsVnyQVwk2Zmi/4T7n5dORf?=
 =?us-ascii?Q?25/2KX50Wnwtkg03JvqZwoCzQLTsJo7wmNLTEzTVKZr9/Wc1moEZvqCPNdUi?=
 =?us-ascii?Q?9WxLPrO3tOtwubCV9pYT4ADRMMHThKlsqUWMBp5Ma/55jcfG1K7iQiNqlaTi?=
 =?us-ascii?Q?nyUa9W2qjvMtOA5AXNZH/VRZSLJVVqip7/XettGtEvkm3ZiMs1OzzOmdeI1x?=
 =?us-ascii?Q?Lpje7li/3L0Wn9v/zDoBkgQ8skYarKo2Yb0ASeT2Cn4QwrSBOjMeEa1R3oSs?=
 =?us-ascii?Q?BQS1NJwhFWkw9cl/ZIdOj9HaAsRiEjB1Ad4t9hhatfywYSpYQNU9g5cpz906?=
 =?us-ascii?Q?U4zwXaTPoAfz0UqrJNJjBIbP8D1ogDEtN83yr1oMAX3pPRDktOY8vsWtCHWp?=
 =?us-ascii?Q?4txiZbEP5tLxPbhRsTGOdh4CwAJ4NdlhaFUQCqHcE7XlCcx3U0K5Cdz0kh81?=
 =?us-ascii?Q?3e+w8bfOqGVcDHBomDiY2VvYUeyyf6DZZpKz+YtBYhfM6GLQFhYfzdsz/p/m?=
 =?us-ascii?Q?wjlsB6MeJcbx3apsIVaOdoosfYXQuREJoavm4JHwmtOm5BgkzQ5+hbXEkgbT?=
 =?us-ascii?Q?npf6tAVzMVZPzkoqsyJbIE1U6xvs+k+O7gXDG1fDWbmrWI3o8v/03T/nhNdy?=
 =?us-ascii?Q?8y7IefjywzY5xvsfYzFTIea+hGzpak89iy0fecD3wbnnGX7QdHNlKAJPxztN?=
 =?us-ascii?Q?2hqBhs5SqyaIyz2ySxzzWNizCvcX1azGv6IFM8eUQDm7AAoOd5AQtyil8RuX?=
 =?us-ascii?Q?Ha7K08WcyiCfc6yQNryo13BcOGqVbhde6aqdpC7nh4ZxgsLcfnVHBPnnCOI?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3qTeRg2NgOycx5+rtUo1Zi7o7b45nEjrYvisEwpoN9z/8PGLo1RwMvmW/LpK?=
 =?us-ascii?Q?SetMvZyv0Y55BMGVHPpohVzFuNtzaGaF0NXf/H71KNAI2OJZXNK9X/hFtbvw?=
 =?us-ascii?Q?gZ5MYObveZv12TmuqqPjrWNClj8T6XIrgs99weu+gemVkCU68UTcTNdY65Qj?=
 =?us-ascii?Q?ATLSMfsBq8JnGHJM9U1ihwqz+jVN66VfvrdgaxC4yinvEOMy5SslG79nrinm?=
 =?us-ascii?Q?k+jFqqnK9f94JLwG+fWZNQWApBVOm2k+HF1cGXdkek2d8u8q1lsa3iQuLlHp?=
 =?us-ascii?Q?smj1Vzc3dS7mWphi5b0jJyNaps149VXBpF3bf07hStN4lkjX9ISMZPwgFIwG?=
 =?us-ascii?Q?FzmkvwPlV2ZsVHF+B9x/QvoR/x89JV6v5YMI6jZyzxeDTbCEzn9zs6MzFFAx?=
 =?us-ascii?Q?KwokHOaqW7FjTMOhNl5QKDqs9EUSEfq6hB7yukvic4jUyLB9U78yNtjicXNr?=
 =?us-ascii?Q?usY3wnKXTzo/z9R7luIFn7Et4w+lWeUGpl42Ya3AsYiC80Aif/8rP+Ytff7w?=
 =?us-ascii?Q?aTxBPO/d9G6D0AxFUM7KfKhHf+9rim8zr9e0fzgUHfiqBckZh4WGY7g2ETW8?=
 =?us-ascii?Q?QRD6rOmRJLcj+ZAXN0tjAdfn4AdcXoZjY2TwN2uM/m1dTs5DM9cJ7Di4n4Ar?=
 =?us-ascii?Q?KVAP1po6/uvm/KeJkdsxkN6fmm0pXaON7/uIKZXO8VZlpKfS35wHOuKKD2H9?=
 =?us-ascii?Q?iAiGygN62whKPh6z8uoSIgkhM9mnhTcPssn5qIWZDpn64Z7AQsseF+ilz85b?=
 =?us-ascii?Q?Py78ffshJcpceqSMo3NZukWDp4ipy0f3yw7FWxHgYEsb3qhtBAvPV8DbA0bL?=
 =?us-ascii?Q?2IWqByPxlD9QWqqdObgpSBvdZXcQwkkspHvESxI78Rh81rLlf4aEnPUDuP1l?=
 =?us-ascii?Q?U5TY37vPo+hM6NOFhRLVJONPdXBcWGH7FomKQrHQtfIWWSleOEGIp1a8IsK4?=
 =?us-ascii?Q?UzO4NF/2Z9XLB4KKItvEo5N5PVHf/FNRVmfafIiWnAqDMhsaJTr3bdsjg/kn?=
 =?us-ascii?Q?y5b9HBg5CGNvK6lxVm4AF3gvWj89o4ibM46ZlOmKZBxAEWFVomcDg5ZOXm2J?=
 =?us-ascii?Q?IIDqVpxC76zezmo79vZKGBwBwtDdnNOmOzP0a7u3wYz8uQqcBkSep7RgJZO0?=
 =?us-ascii?Q?VBHFHDvnWqqcGmt4xj0TwCeWs3eYPYd9LdTXdYv7q7WT27gTRBbcIKnS8O2o?=
 =?us-ascii?Q?zUNdHBLnxH7Y0+XVse07oIlRX1SrnkbQOjuTM/oDOEXxW8YwFVgo5TwMqYQF?=
 =?us-ascii?Q?XhyIyyV52kBzpDtdNeJ7H7lIdvELEmPLdRa7/uf3fDLy0MoACxczmj85Toxa?=
 =?us-ascii?Q?noeAQC/VfdOjEN9E+HGXO8T/yBRlZJ5vs2RTpXMVYjO9lXeL2zpPsWtKLL5z?=
 =?us-ascii?Q?Jwf0tW9j8mlzkg0Lo3ZySgpBwddhQ4IO9PdDoZ2R9lZd2z/sRdZ6YbC54Cc/?=
 =?us-ascii?Q?e6+GB7qUg2VUKkzCe4MHDRv5ZUcX78kw0LpI3w3eDPCA6YYmV1dAGhlE8+M/?=
 =?us-ascii?Q?fTONOHYESn6ZGSS9SQeCMpbHJTXbVTt3icTfbpHTLQVgZ0YKxYdgX8s3nWq/?=
 =?us-ascii?Q?FnIi7dPYgim0Z14vFtxnsRRj/5BOOTXQohUEcZ6P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b71e0a6-be19-42cc-033c-08dc64f12a65
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:30:14.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVtmdpzzuzhQw0Eh0ypr7wgdULOZJs1DG1poJ8tZIUTHkxERmTaCucgLJHiQsV1bJFpaZ4fvIfR+pDkDc+uP2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6204
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   5550c5defbdf958f2df459be74f87afa9eb0bdde
commit: 96c23c8cb3fb82f50d75df0dca6ace9788bb7eb7 [2014/2033] drm/amd/display: Add new DCN401 sources
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404241420.gx1LAd2A-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c: dcn401/dcn401_clk_mgr.h is included more than once.

vim +12 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c

     4	
     5	#include "dccg.h"
     6	#include "clk_mgr_internal.h"
     7	#include "dcn401/dcn401_clk_mgr_smu_msg.h"
     8	#include "dcn20/dcn20_clk_mgr.h"
     9	#include "dce100/dce_clk_mgr.h"
    10	#include "dcn31/dcn31_clk_mgr.h"
    11	#include "dcn32/dcn32_clk_mgr.h"
  > 12	#include "dcn401/dcn401_clk_mgr.h"
    13	#include "reg_helper.h"
    14	#include "core_types.h"
    15	#include "dm_helpers.h"
    16	#include "link.h"
    17	#include "atomfirmware.h"
    18	
    19	#include "dcn401_smu14_driver_if.h"
    20	
    21	#include "dcn/dcn_4_1_0_offset.h"
    22	#include "dcn/dcn_4_1_0_sh_mask.h"
    23	
  > 24	#include "dcn401/dcn401_clk_mgr.h"
    25	#include "dml/dcn401/dcn401_fpu.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

