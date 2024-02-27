Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E701EEEA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 05:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709011588; cv=fail; b=KWzLjCkAhW5oZqwAeRPWSo0jifzmt+auoZqP+0zHlHV9TDqfBAkpP3TVD4VDheLoemrPP4KLjV7Lfa9N+1+bSsRq8ogf8bQiHxjmBQRw7zf/GVhh2JKVS2TxbzSSxZKQlUsXsMry5wEaOgWRDlXHzrIgChlbkB4MRhvvVga9rOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709011588; c=relaxed/simple;
	bh=L1QKhkSv+DZh0n8duVf/vkMUiAve6v8AlzxIfAwRzA0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fmU9F75tt+Eh0ulvZIUyGSeu7ulhhN9PHKzXmP11PAM2s04ahklg2aLM1fxg1Gjk7e/k0SvWInBKQ6/Wgojt59DF+5uKRjnfR+JKYk74mUZgs5wYmHJQo+ib5/eB0bLXs7YqazLmqCd4HYTFUPGIXkeGw+EJhK62WX0mR5xp4yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4CPN43r; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4CPN43r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709011587; x=1740547587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L1QKhkSv+DZh0n8duVf/vkMUiAve6v8AlzxIfAwRzA0=;
  b=W4CPN43rrhxJQNknp5gUBaijX7lQUxRwnxzy8NLM/sE7/a3Ah9quAPk/
   iySml29MfMQY+zqKL9ypx3w4KwhKpEQarvXWLKuP6/MpHzoeJ3c2MGhH4
   x7epo69HYBAth+JrHb6cxGOLpxyE7v7unWiKQJ39KILX8TmjP1sygGonn
   PPIdjv+sQ5haBVlWNLEvsgfnwoaHB4RTORckjnKY5NV2IrdmtgTRBZpKg
   /y9ZvBwQL4irsllsZb6rTQiu3lOv8/wTr+8F0xzwbGwQG0kZ1dNTYf2v8
   mYYXYoZkjXpvlBY/HjwRwm/s5MisMso5anZxw9gvdKg0srGw6vdcdnjR5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13977666"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="13977666"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 21:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6792423"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Feb 2024 21:26:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 21:26:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 21:26:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 21:26:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 21:26:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD2YmfJdctAGOyRpsYR2/SzbHsvq6Vi8VVSPg8gTV/REzDq8Ty5N5UDMiHgiZL30bGxvXtBn00wXOsMVPYzd5C5iSyQbBjOB8VSVLvYoo+Q0qkmpuryLtOMmSO96em++XfvAVbAzNY9jpHUbnmYf37es19dychRfxsA84FD7QvXSoZM4MWTavjrqY2CQ7jk2z2AgWkN3Uj41SBsdUpW3jnfOUS/80SiB6k4d1CyMlJCDQ2wOrOyoDIXDZRXYOsvjf7cLtsvDoo10cAKf5/y/8AxQ0f1WWLy4Zcb0znn2a14xJnGUE7OQI6DXFnKSVqYwkMdfPz6s/UnoP62PucHXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHFNEkBMGY88fapQ4cFWXr94MaS3otNggxnaYyCeaX4=;
 b=XHu8V+slPw+u9Ld61QAYgRsm0FumvOSyCQb2N0G6xXGKf1fC7QmLvw3uGV40QfUBZyXSIobeEdr8DNxU6HakcAwCxN8iB6LbUx2h7nnglGcVpAKqeteBy3/Q7OOOz3qX1s/S1zSHZQ61LHyxaoSNucOTYmeAP7p+LuBU2Zc+xTjNJaaxlApH0lDjAGnG5niTCezvWgu/SK2e4iI+CEmj0Xed9rdxV8sO05JZCGgXgi+bQcPsUPxmjCLfFX9pt3HjlwLMTBlVdo0VELMJFtHPg5s2cPZVxY70hCGgVdByJVgrQHvoEKvhMAfEeva31rZqZC6fivL+FtofGM8/1xzlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 05:26:22 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::401d:af3f:fb1a:2c6b]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::401d:af3f:fb1a:2c6b%7]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 05:26:22 +0000
Date: Tue, 27 Feb 2024 13:19:30 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [ardb:x86-pie-for-sev-v5 16/16] mm/zsmalloc.c:223:32: warning:
 variable length array used
Message-ID: <202402210746.N0NANSKS-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0104.apcprd02.prod.outlook.com
 (2603:1096:4:92::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee1bcd0-aa6c-4bb3-93f9-08dc3754a2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJtnmTVXoAun6dNQIVG2Z4M2NZOoQmDUj63hf4vOShzEQO+kjCaWMKz6aepqIPEIUqH0CZIgCgzGO5jtGiPoPqa+K97fJCGV4jpd5ROpSEp0OxgUHkHvVIs2f2SHuucqK5rH66C7ITWjLnyY+M/GwNqZ4TakyQXCC8tDvl3ADJIndCfwHvzET56w3XyXzTZqfaR0TsdfX0DFHcplokMyRpykdghnioyav4i74EZ8+pIQ4UG0I6Uta2CeoUmEO818rBkxD5SweP2Ny1BSH0kASJy/VrH+ovjDdgDFoHaQ7ilMie2cHnuUx4r3ulQW8xuqiYWkOedLJk7O+TuQP+g81TyuNq+7k6ygjOpq109B2R0FCsxH8DVDa8Tnvlgkh4rgnLuMAG8yktoZ2TbLeRwY8nfpClgQy8rXbAlJ6YjlzqhUGtD6nM1kWb7JbiUn4tVFgYUnCEFJYsxok3loWJyIP+5Nkwx5/1YjxK6m1wvIiug66PZcZNCCN2yASN8jB+4keGHlH+SkzyqvBv18knNfYS2Cd/iCC1kATmSr5I30SLtijc/s0nePtl8sBjshmhPBqMrykCf9leFWUSjEzkyewnjV357lwQEedrbuHaf4vWgqGSqsdvxkJUPFPIEUfA+jBoNDt3k3HwZHkeubpRwgsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChvEaDHmV75dVZNO8eYag1XosFcu2xjg2svjSdvbFu4GkXLRXpCAhcEd7JxL?=
 =?us-ascii?Q?yvcUzGKB6bO0plyepb1EBJMjKAXBK/DHdKFnGPUI3WnJF7UHFqDu4KJM1cim?=
 =?us-ascii?Q?r45d0Z+ofPr1n4LkvLlf9jOuuqbGfmKiwF5OiJTtcdxC0FAlfSAeRUn+Slz/?=
 =?us-ascii?Q?F7WUfNTr8PK3NAeywqr3Od+OHOnCfSeST6imvD/8RrovjzxtIGemNecbv9hd?=
 =?us-ascii?Q?RKQ2Wd/KoGw7FYRQfyZKKpE3XWThMvRhSccm4a7tiFAzpx7kdmjaSmi8n611?=
 =?us-ascii?Q?Ht+j1/Lj6ktCsTuKQKvRPpmDJApo9h+cdDN8tDfU3Y86D4KfJcXfs8IjEJuQ?=
 =?us-ascii?Q?nST27IUp9PJTsbYjrmR2lizxRgHV2iVhiJjpXbsbSc2H+L8Jx5RDFreAaCrA?=
 =?us-ascii?Q?lySvDKYaJBaNarZ9Xr2GDx1Swf4ajtPeEhT5c140tL9w0VkTm08+2qfeKTnW?=
 =?us-ascii?Q?/YZKG/2SbQ9jCVOVmLwoCwaDd/9qaz0m5dsA5zI78+iC7hUAcb2tOyGLrrk3?=
 =?us-ascii?Q?8EBhp7QHpuhZqoR13Ebm4xcH4a5dArc2vt0WioxCTr9T/W91uG57nMvoVejC?=
 =?us-ascii?Q?CR4OSobJ8yX1LeIsz00knlvxtIpcuXfU60rhelVZG8hs7pwo86DnTj3TcLDM?=
 =?us-ascii?Q?IO02FCpUUMhr3Z5VjpEkWlO3JJWl+RD/YGyuPAbBCd5nT4pEnIRRd0ZL2KR5?=
 =?us-ascii?Q?41pcl228JH5TeHxCEPkUW0NZJfL3dDWvRQRV+6GrJSi8Bzh2OlbWKvzs6tXm?=
 =?us-ascii?Q?Xvt/a2KBRlL4s3XX9wgojMTCmot1yB1lhUrxBSM95gXXLSqsdz1rVfr9yMkd?=
 =?us-ascii?Q?n+hTrkFaahx44xbsgbFnvneT5xWFztBPkudSQCZpItxDdgVY5aL44mmTO2Mg?=
 =?us-ascii?Q?6h/HUZvE7YinusvPoZMtBJuv7wZYkHyrlzHGXAmrmMcPGUB/dSxFLPbkfpLa?=
 =?us-ascii?Q?ivlbeLLMNJ/+t2Y5JydiFvlub28w0MJVnXi9ks9zQcm+tZjAWskQ39IE84qA?=
 =?us-ascii?Q?JOnAISus5oTTS9AZUPHMnhW9i6z4AzSD4s+ZzMwOhTMzuqahQlmiv/ERwOMm?=
 =?us-ascii?Q?Le5keVzFYxsJ47RkpaCTmaSSj5EaoJCBb3VFUDlWCc7W7drwrfjJbgphW5ji?=
 =?us-ascii?Q?1eUQCNOVmNnit+DKd4cPlApbOwq3K6siErjcbsC75j6jJr5lsuLYUVGGZ4gM?=
 =?us-ascii?Q?NPChkLKo2sd08I6etVKUxeCUiOJXoBOwHfwVj+tUglQMYX63KgFVzHme+c8T?=
 =?us-ascii?Q?CMMBImO7s4Pfsk7ZDwA2N7eMBgu3nPHj0rStBG3TbGZ4FU/hxgJrBaGhuhjS?=
 =?us-ascii?Q?Aj4wtP5v+FIi5Zixy5u/cK7dAgc7s4bNPN2eu95KZ8ZYKoC51XuXt5ljXM/I?=
 =?us-ascii?Q?5McT1Z1tkrq9tTvZo39nCV/LS6yeKLa4lCO/Bl3ZBpjr680KAw1HAfUxEHmk?=
 =?us-ascii?Q?te5datJacvGArWpNjtvS1cvPmDLah+IrvxNlMnJlzowOuTDiSufJeOtGFOGt?=
 =?us-ascii?Q?+L4oAlqb1i7x/F3B3sMZy2bqWaU4yhqSM1eDSY4Hsisr393XFC0tNv0uF9L7?=
 =?us-ascii?Q?t991/gLa23R7vLWW6h2llJLEQpwAbxjfxcZHjNZB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee1bcd0-aa6c-4bb3-93f9-08dc3754a2b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 05:26:22.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StcMthhGqoU1HmWBuwfaOGHk3X16ijDbaO+X8vpV2rORvm37U2XSYKOP6CNifMGolXUHC3qeqjX2b04U/DAk8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   0cc3d2ea8faa59cc6406f95460e42ae5987ee35b
commit: 0cc3d2ea8faa59cc6406f95460e42ae5987ee35b [16/16] x86/startup_64: Drop global variables keeping track of LA57 state
config: x86_64-randconfig-121-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210746.N0NANSKS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210746.N0NANSKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202402210746.N0NANSKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:223:32: warning: variable length array used [-Wvla]
     223 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                                       ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:146:59: note: expanded from macro 'ZS_SIZE_CLASSES'
     146 | #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
     147 |                                       ZS_SIZE_CLASS_DELTA) + 1)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:128:52: note: expanded from macro 'ZS_MIN_ALLOC_SIZE'
     128 |         MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS))
         |                                                           ^
   mm/zsmalloc.c:113:41: note: expanded from macro 'OBJ_INDEX_BITS'
     113 | #define OBJ_INDEX_BITS  (BITS_PER_LONG - _PFN_BITS - OBJ_TAG_BITS)
         |                                          ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   mm/zsmalloc.c:122:28: note: expanded from macro 'MAX'
     122 | #define MAX(a, b) ((a) >= (b) ? (a) : (b))
         |                            ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   mm/zsmalloc.c:223:21: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
     223 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                            ^
   1 warning and 1 error generated.


vim +223 mm/zsmalloc.c

0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  219  
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  220  struct zs_pool {
6f3526d6db7cbe mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  221  	const char *name;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  222  
cf8e0fedf0784e mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @223  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim        2015-04-15  224  	struct kmem_cache *handle_cachep;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim        2016-07-26  225  	struct kmem_cache *zspage_cachep;
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  226  
13de8933c96b45 mm/zsmalloc.c                            Minchan Kim        2014-10-09  227  	atomic_long_t pages_allocated;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  228  
7d3f3938236b4b mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  229  	struct zs_pool_stats stats;
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  230  
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  231  	/* Compact classes */
c19b548b493455 mm/zsmalloc.c                            Qi Zheng           2023-09-11  232  	struct shrinker *shrinker;
93144ca35041b0 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  233  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

