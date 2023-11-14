Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA42567C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUIW57dR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699925557; x=1731461557;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g/fclymjVTcrzJ/waY6fbQc+13ltFaeq0nwju8shXlo=;
  b=fUIW57dRwXJyGQxDF3X1SIkdCjFtB17ez0jWFiDnT/NkzT3GSJH9X/nz
   ZKYqsjUFWl2S+e0YM0Ex34m4uC3avwmZsxYmjWkB87ejLV9yVrqq0tlWT
   TnXPK55Eq4TnqVoZGWKbH88bu9MLxLxVD8zjTxlaGFTgeAtz+FDcrPEJK
   N2cA6fq1OuH3yQ4gKEL+UE0zP/OQ96h/Q+PsShOXUX0/RFRQNiiaTXJS7
   azVYxjywQE2ZvOpvNq7rEDAK04dAXelPjT74NcA/eobewR1jLvh7Vr6y/
   mNmcliwf5Dq+e/G0ZI5cuL4VwSekQdehZjopO1pvYqosLRumCR8raM9Bb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9183514"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9183514"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 17:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12629272"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 17:32:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:32:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 17:32:35 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 17:32:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=estw8gIZIEbY7Ax+GHswvYDAxYQsRil+cCRn+o2N3Rgo/lqn9YM9xXu0gaXaUnilb3AM408TioTrASgu3bB9jJlti+XpKa9NUVYpxNNGsuVPLgLTY674BCXPHv4Gs8UOWsnDXB+y/7Cd233/FayaDkks7XeBkNX8BWmO644kCBAU2DEoLyFAokOgq+e8APf+1xFSCaN2GJPrgSsZ0pSvsi9pzswX3nKvc22lwfnSmp7ZRl2/3kMmdUUW7AV4+jPk1LKEiDxIelgrLyoPy8ZiSpUklFFRuqP0+32OqsnZxea+PKG0y7W2bqoqxCbAtHcmPa1bjRwViqM5KZw1BlQIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IJDojwtAeQaPOm9Vr5IdFGOn0Y1xR+uzC39sYwkKEQ=;
 b=nSO85XulO6cSouj9C0OjPabQKqd3+VWk81q9TxCstGkKeCpb9XASo0gy6R2HZTNVbqoNeKokRsIoX0vPkYb9wdHEOeYMdGp5GgSDn88h/t5XGYiC3VFIv9XH7h9pPe1LosFzg/xdxDEzlgsxpX9ZsU3DtYHkthdJISUphkzbsEqYX+sskWif8UrZ+3LsJLjWEdvkQprpjrbqUdkadSKXdOxkL/xVseWFmSFpGWyJIXUG0rru9XaefAtTtgcSbYReA+5uL6/EJeLzP/v0+JsvFyRDykiE/vhPW2ROvEMBc/8ywjAi8q1VSsiUeHvkBG5xZu+HM0kQ1/papbKAo0HSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:32:32 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 01:32:32 +0000
Date: Tue, 14 Nov 2023 09:27:52 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page
 permissions
Message-ID: <202311131527.nBtS1Ewn-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113022326.24388-11-mic@digikod.net>
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a7a0aa-03ca-4105-8575-08dbe4b192b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYuKOruxIM9Em3FN7nT7zxjgkwOWInrra+Q4auuUxXCpel3lun68zfQ01G3jP9Q23yiNQ69sAI6X/NjLDB+knefPjKoLMrUqe+IyaFatOWxHeziM/+rv7JIs8wGfQOrp1ccSewl/qe0PMfxBerjlUPWychALtF589zSeEn/Klr6nEnbip8ANEM6KLH8XpSJzhFhqBGw/lSj2m728iqBWS8UBt1aox5L9B/qLFtsZSKa8pRa4E3Zsnt3H5dhweKaqBGIIyCxmi2k7ylHVDCzWDPenOnxn2CYwe9BR+ihi8A+NNJ4Cyv/OCgoa+PKih4RatnScO/9Gyox6oI4/1OthpXxvtLMTTK36aAUj05VY6w2Ll1FwskFbgmh9qOqpgPXWPQzQWUfT+MxkT8N3E+AaqwpeJObpY6SBa0ByUy3Ceu6esfIPzui0KVgJYqOn5D5AMfVy+N0DyPz7c6WLi1exYMy+s4Q3vhOu+5a2/+4XYSr/1zzmDBQB9GBCMl/AcKBnuivWMN08f44Rv23yCdDMHPwJD0u+q9IvKjgcBS9lQiryAW0PRhyiKWwD3jLrPh+ERQrKHakr9Kq8hnm0mTr4OvpF7qop1z5L1bGPckf7NXe5JTKGAanC7s1IYXpHbHiL0Syvd0/B8lNm0jTkKOxr/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(230273577357003)(230922051799003)(230173577357003)(1800799009)(451199024)(64100799003)(186009)(66946007)(6916009)(66476007)(66556008)(316002)(6486002)(478600001)(966005)(6666004)(86362001)(5660300002)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(38100700002)(2616005)(1076003)(26005)(82960400001)(83380400001)(66574015)(6512007)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DNTWou/jKW0iev/MWZVHj0yw2g+cxj/xTsHLiCojKygZbC1s3mNPzehxhC?=
 =?iso-8859-1?Q?pksuckOf2BgM8y667o70aQxgHYRxdial+5FT88C7A7OtmYthrLbUdrHAlg?=
 =?iso-8859-1?Q?l3tNBMa6CadK1U8YWHy5/Y/4AzhWvqf84MwOLyIVXxwQKusCs61HjJ8Jxu?=
 =?iso-8859-1?Q?7r47IF2rdzSfO7xqw2C7hrN5HVBLI80/lt4YYmjSxYvL2dXIqtDqmJAEJv?=
 =?iso-8859-1?Q?My8A5N/SetvtasEFhLz9abFlgeog3Hn3LGkFTSOa5/REeOIOLx2yiMg6nS?=
 =?iso-8859-1?Q?DFYNtdd0Ml5aGzLDK98QIFNhLsQ5Y7LOynn7vLm1FqtRC2YFaoOWDBTi96?=
 =?iso-8859-1?Q?IjMaKcX4McZZm/N/6NzIEQGuNIInmPNcKltF8RsYVm3l8a+DLLfQAPySD6?=
 =?iso-8859-1?Q?4CnhriiAMfLY0YU33DBU+TWUc7Ps/8C8pD0Tpcq9jvjark0li24FuPpuOs?=
 =?iso-8859-1?Q?aUD2apur5RHuAFnBRsI5FnRerQcfqS8fL2CcDVUqUJoyTOGLc/ArPOsT5A?=
 =?iso-8859-1?Q?lRuGOt9BU2gsBQlj4P/9LQvjsVo7c9xfrimojBZOsamSFG4x96ZNvuCZ2j?=
 =?iso-8859-1?Q?0RoCpDUpMvD6N+C3qfOnwR9E8HDxibTjBLuSnpUfwjPCz7D3XeLsuKjNJ6?=
 =?iso-8859-1?Q?1h/XOCzGrx20btl3tANDDRQyx+OLTnK52xNE40FrSEn6vDijUtFCkYAJCV?=
 =?iso-8859-1?Q?PgoXa7tqZ6Sv+IviBv8Bwye8VXmxsHlUZlmLkO2eMSKBTwy3mAf89gJoze?=
 =?iso-8859-1?Q?/mT/9UUbSEWqkF2kC3zDe5/jbX2tESQrmRqxREGVThvqDdjHyhmJQhH1Nt?=
 =?iso-8859-1?Q?4pnufw/+CVWsmhpya5FliiCvlqJTDEwM22X8vzbYmlb6udnNRWzz2UQ2GV?=
 =?iso-8859-1?Q?UrIbjNah0WbMOQoQzxeDBiybzaL2FcWhfGaWYjqmaqbtRfI84OMoZsDHoO?=
 =?iso-8859-1?Q?abf2R4nxtwj2ZTnKA2qhOUn1Gbw5f5cfgkT8S3C1RNSsv9ebgNPDKCG9IH?=
 =?iso-8859-1?Q?iLSvPiHoIbTfrAA/rZXG0YVLYY+2ZqxiLlcvICqTfv2L5qsC4l2tFntlW+?=
 =?iso-8859-1?Q?0td6V3/T29aTBxvH4aPqcL3kfo5SpVQL1z2B4Uh4At+gdy/qw9e0RLvDTY?=
 =?iso-8859-1?Q?c82Pw0WBaQevEEMgQX944vffDjpjgql3MTj/6p4TL9wkxX1DobJk6sTkj+?=
 =?iso-8859-1?Q?obBVx18abi7jVS2DlxwtUWkGmfFCZA+KVXLNN7ESKlEwiSfNLNcUekiLYK?=
 =?iso-8859-1?Q?hp4YGq5UHTU6VIdNZfI6zmaXe/0KO+f2E7n6NJB6qhdNkPh47MCphczrA0?=
 =?iso-8859-1?Q?5Y0SmUPdKypZCERRhygdMQPAg+nrh2m6z5sTFlNqUavaSTHCzKmh4ezQI/?=
 =?iso-8859-1?Q?w30ZkNC9MfsDb0lc7eadJSYY/EGybe9W9eQc1f16mkg84Jm7w/PgVTxMYW?=
 =?iso-8859-1?Q?HIzi53tKfR95e7TDaeyctK0hLpeqMnCiMcNYCw0XHbBFHCt2O0leb49gh0?=
 =?iso-8859-1?Q?K3h6paD2Rr7cDBu2aAxe0LUy7y1jqd0Pbzg8pCWWmDyHYvdFR0Xqqb8ABC?=
 =?iso-8859-1?Q?l1IRfcocMN0fedfMn/VxgDKK6VqYoADunK2AQafpGZf4w4BesTk0ga0XMj?=
 =?iso-8859-1?Q?zJ2/FcZISNKh6L94VX0R4YO1y59G5n3wzc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a7a0aa-03ca-4105-8575-08dbe4b192b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:32:32.6330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAhohMYNly4/v4IRmJ44/uyaNQgX3Bu1bNb4ol8k4a3NkUDOtASS+CjlDMKA7fmOZmrHySh/+BqSenzejyDWtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-11-mic%40digikod.net
patch subject: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page permissions
config: i386-randconfig-002-20231113 (https://download.01.org/0day-ci/archive/20231113/202311131527.nBtS1Ewn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131527.nBtS1Ewn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311131527.nBtS1Ewn-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=y] && ARCH_SPARSEMEM_ENABLE [=y] || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && HAVE_KVM [=y] && HIGH_RES_TIMERS [=y] && X86_LOCAL_APIC [=y]
   In file included from arch/x86/include/asm/page.h:85,
   from arch/x86/include/asm/thread_info.h:12,
   from include/linux/thread_info.h:60,
   from arch/x86/include/asm/preempt.h:9,
   from include/linux/preempt.h:79,
   from include/linux/spinlock.h:56,
   from include/linux/swait.h:7,
   from include/linux/completion.h:12,
   from include/linux/crypto.h:15,
   from arch/x86/kernel/asm-offsets.c:9:
>> include/asm-generic/memory_model.h:31:19: error: redefinition of 'pfn_valid'
   31 | #define pfn_valid pfn_valid
   |                   ^~~~~~~~~
   include/linux/mmzone.h:1987:19: note: in expansion of macro 'pfn_valid'
   1987 | static inline int pfn_valid(unsigned long pfn)
   |                   ^~~~~~~~~
   include/asm-generic/memory_model.h:23:19: note: previous definition of 'pfn_valid' with type 'int(long unsigned int)'
   23 | static inline int pfn_valid(unsigned long pfn)
   |                   ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=912718013
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=912718013
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=912718013
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=912718013
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=y] && ARCH_SPARSEMEM_ENABLE [=y] || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - KVM [=y] && VIRTUALIZATION [=y] && HAVE_KVM [=y] && HIGH_RES_TIMERS [=y] && X86_LOCAL_APIC [=y]


vim +/pfn_valid +31 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki   2006-03-27  17  
67de648211fa04 Andy Whitcroft      2006-06-23  18  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
67de648211fa04 Andy Whitcroft      2006-06-23  19  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
a117e66ed45ac0 KAMEZAWA Hiroyuki   2006-03-27  20  				 ARCH_PFN_OFFSET)
a117e66ed45ac0 KAMEZAWA Hiroyuki   2006-03-27  21  
e5080a9677854b Mike Rapoport (IBM  2023-01-29  22) #ifndef pfn_valid
e5080a9677854b Mike Rapoport (IBM  2023-01-29  23) static inline int pfn_valid(unsigned long pfn)
e5080a9677854b Mike Rapoport (IBM  2023-01-29  24) {
e5080a9677854b Mike Rapoport (IBM  2023-01-29  25) 	/* avoid <linux/mm.h> include hell */
e5080a9677854b Mike Rapoport (IBM  2023-01-29  26) 	extern unsigned long max_mapnr;
e5080a9677854b Mike Rapoport (IBM  2023-01-29  27) 	unsigned long pfn_offset = ARCH_PFN_OFFSET;
e5080a9677854b Mike Rapoport (IBM  2023-01-29  28) 
e5080a9677854b Mike Rapoport (IBM  2023-01-29  29) 	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
e5080a9677854b Mike Rapoport (IBM  2023-01-29  30) }
e5080a9677854b Mike Rapoport (IBM  2023-01-29 @31) #define pfn_valid pfn_valid
e5080a9677854b Mike Rapoport (IBM  2023-01-29  32) #endif
e5080a9677854b Mike Rapoport (IBM  2023-01-29  33) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

