Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08AC15B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692686808; x=1724222808;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=op6D8/aI4GnFV8ovAFls9B+DvA///lmgiOB9S9Ih0NQ=;
  b=fEyo4WV/4gNMMg5tXsHJc1DUGteHMCZYej5aDnYhtz/Qk8+Gza5isRYy
   yr64RSzV/um1VRuK9x3i2rS7MQgY7YMXrPn55BROcrOwZLZVmAn6bVcek
   Gm06rTAWdrI4IbCVg6UmBsMwPve7p6onOpcO8hot8BgLfBnKlnHUl9XHs
   dnEpoeNXTfQ3bZylXEIwVC6qAKd5vofL40HpTq74zOhmGCPUj1KkHIEji
   kCM/6BQ4xZhCtFgcd2THyHSDiBYk9M0wi4SY9YbQ1yVFv9bXeCGwpdHb+
   WFCsoZ5fOE4ln5hX24cS9wgqx+ig7Xee7/ZKVQK9FWc3tBpWgae5PaAx2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440162285"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="440162285"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 23:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982763319"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="982763319"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2023 23:46:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 23:46:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 23:46:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 23:46:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMXMJSo4viQPW34tG5Koxj0Zkbi60GXpEjQH5fBzzFytHwEapJ9wn0n7FJ+N5LIrtIEsJUuDa028raxCrNRSBRoYK9Lqw9S5OBu/qAGMkF+W474TFFR7z3KfoN/1RYI8PeVKgEuI+kg9S141pvVNLZzi5vBEA4gcchb1u4QHnJAL5LvHDcCFCYb5yNWNwpEeJTqUGmTWIdFAd4JL5/B3vxmmZL4v7Ljw/6o0mAzrvbC9DrkwWcm7pgxI470kdWnz5q3Lozx8+WtJnXbJfgEgus35Ndk2PvWL7l4zUNoBevWl+OJeSWztx7BA1v9+El8FSqW6HGmC+X1QOO4ZxwcDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLZvjURN2kwVc51cBokqbZtwNY1o4JE2sNZC0HD6HiM=;
 b=Pg5pEyaJNz5lgs9uu2ICdraw0qIP7jvlZnN8FbxDKGLDKlMYR8dDuD7WdcQWhzFKRL6ysPd7woRSMYRPAcR3qr0ABfgost0HlIGB0C4lzukEgmDEiovJuZ0FSOjB+eCymDQc2jxfj53G+mMOonwWgtchfCkCdAgnPTNpmtNFpo+lsuWdN2jCK/OUNaUpxjpyQwI6whV7jcD+Inwz+VeJDgJKwFmWOsyxevwAsgpyX5CqlTLTNVCYkXF5b+ZoJ8vmxqwc+c0GYK4XXlvMWXqXYQ+0LI/4CrWJ94Ftza0DJAv+9bGDAOQCxtmXQTJtOlQo+1viWTS9qHASk/piEHcyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:46:44 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 06:46:43 +0000
Message-ID: <0079be8b-40ab-5c63-b04a-f5265ec3613c@intel.com>
Date: Tue, 22 Aug 2023 08:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [linux-next:master 7361/11453]
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer
 from integer of different size
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
	<christian.koenig@amd.com>
References: <202308220932.nPQdTkIN-lkp@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <202308220932.nPQdTkIN-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::12) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb02982-8109-45de-6e8a-08dba2db8c0e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1o4C1nj4vVziNtJWJ6mlSdTCF4YY3hO3xX/3ux5iMkSBIQx93BdG2ijWiS0vtLTu5PjYKefRhjbaUkAkIUwCRRZb1fwF6ZjM5gfcmgZawpwLm8VkCAb2TiMwtc6Dhj3VrRIiiZcA3MAmINyC5YcmypoWWhd7aMQK2CVX8JellagVEHdofsFrkquSphhmklA1SE51ZVuT6t7RSaVNbeCsdJiGdcnwb2UxHQU8G5hYF1pVbLNBz60CLhfxaKCPhdlF9Rp6TcmT2rGLo1nhFkn387wmHNrpJ+H/QaJbl4vsPGSK13QKhCxj05wGpuneIoOBFJ5ujkEte5zVITpne/2hUmoAfFR5GgaS7+28clNjscI7gOxikjU7NPc0Ws0VAEckmPNbBh0oRUttLoYzOvPb8bEQR17JxSzszebGVrtIpg5o6Z7UGnLNwNAGzEsOm8fYjpG1p94r3KXP0uiNpOuGbyAfbBV7pJ4/m0fNheGU6Z4anLt3wIlo9+QXdJsd5b4Z5AyVafnVoJZhUmmaXKYhj3wFF2s241Vs1tOHTwKJSpHxhzEki0K46voo4L8eLYlC3HIcEI2ZryQi7jmJDxYOA8IWh14H7f30JgDVlPQTsklaITBYVb8XrN6z4vZbYusjFc12OFYzmC4KW/s4LbukP5Q8we6gudCnpmUOFxqiww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(6636002)(66476007)(54906003)(37006003)(66556008)(6512007)(316002)(82960400001)(8676002)(8936002)(2616005)(6862004)(4326008)(41300700001)(36756003)(478600001)(966005)(66946007)(6666004)(38100700002)(36916002)(53546011)(6486002)(6506007)(2906002)(83380400001)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnRtazJOeG1xSFRuY0hmdGdPRGNtWHdDTHdhNzlqWGZrS2NTOVdLRFVSRWN0?=
 =?utf-8?B?cWhhL3ZEUDVsUmFMTzkzY1ZRaU9TdmNEQkxTQnA0Y3BvRTB2N2ttYTcxczRY?=
 =?utf-8?B?U2VHQ044Vy9SV3VDRFhKb1pSU3R5clg0Ym9EN3k5dFhxYzVtZzZpUGYzeGFU?=
 =?utf-8?B?Y1g4UDFKbmp6dnVxdHgxZWtlc2NCY0RHWlJnVmtCTXJldkducldnaTRmbzFq?=
 =?utf-8?B?V0R3aXhyeUN0TWhCR0NpbVNLUzVyMlRyUUQrSzVUY0NVRi9nNmtGSnRsOERD?=
 =?utf-8?B?eEMwL09DYlNlMkR5ZGlVeXIvKzhEM05zRE8yYm5SSzJvUktvVFNaSVE4OGV3?=
 =?utf-8?B?QzhzTUZ0NFNRV0EweWhZdWFDMDNVcndla3E5cGZidzR3MmV1Wld6SXlabVlY?=
 =?utf-8?B?MjI3M2tKbG1PSWtZcFdnVmovQUNmUUZSNkcxdG1ZR2dyZk81b3BISERkbEJE?=
 =?utf-8?B?UmxqNHRsbHljc2xiZjEwNGgwcWowMDdRV0NUQ3hwSWJFcGwwdEJDVTBmZEla?=
 =?utf-8?B?b3Z6Ti94TXBUeXA0MjVrdzdiYlZlaWp5ZDB5bHhPOUhaZjVyenNYMm5GV2Jq?=
 =?utf-8?B?S0JwR0xYODgrWGNEckUzRVhwMG9WRlF5WnFuR3BZWENsVkRhMFNkZlhoTXhk?=
 =?utf-8?B?Qkp5ZEkrNStOTFhoWDNyWmNMRjhidGZMRURrVS9jTUlPNk9WR3BjZkhlS3kz?=
 =?utf-8?B?MDdia0JvRmdLZlF6ZUtKbElhMzRZSkRMakJDUnNsMU1Mekt2OEI3dlBlM2hG?=
 =?utf-8?B?TnM1M2h6VnBiRWVPdTVkYWlLRWcrSUZlVjRmL0RQemxTcmMyY2FvWDlHNDI2?=
 =?utf-8?B?QklVQ3cydkV5UnhYcmZ3M0FQcDYwREdDdnk4emxvd3pJQ1VxaXhiR0F1b1F0?=
 =?utf-8?B?aTJoVm1wWDhwb3lLekNpUGdDMjYyZ1pQOUJuUFErL054clhzZWlGMk1OUEtz?=
 =?utf-8?B?TUZxbG1IRjlyVzdtZWJZSnhsb20rVnAwQ1pnL1lxZmpFVDQ5NDVSWHk2MXQx?=
 =?utf-8?B?aVZtVHF3SlN1YXFrMngrN3FBdis5a2FCUWxHRnZYTi9mMC9PcUd5N2JDNHRO?=
 =?utf-8?B?T2pudTZvb0lCbnZWRW5hbGxJbTI1UVpkeXJOOUNrRzFoMy9WcUpzSXZDYUs5?=
 =?utf-8?B?U3BCSGlNY3ZiK2dvam9URlRVc0ZKNXg2ZkRPUmVxampaZDFSQXByM291Y2Zw?=
 =?utf-8?B?citCQVJEVm5hQ0ZpN0FSbmdkSEh2SmQ1OFN6SDFVRlhLek5aelFrMnBtYWN6?=
 =?utf-8?B?R3FqcVZRRkpLZDF0eEpQSHdPUm05ZWNqcVZoVCthYnZBd1dGYVNpVGVZdkY4?=
 =?utf-8?B?cjF3RE9iUUpxR0ZHczVTTzc1bG02U1hESCt3OGVDQTJ1dDEvSTkvL2ZoYnFv?=
 =?utf-8?B?UkhOeXhQUmZ2cFR2VllQS2lSUm1SN3ZvVGQySUJjSEY1b29Ddk9wWUhwYzBs?=
 =?utf-8?B?S1I1WFp3UUx0ZGxtazN6S2NLOUM2RlBMdTNRclh0YXZ2dHY0T254emFsMVNK?=
 =?utf-8?B?OTdZbU1QcEdzU2c2MS95QWthOTl6Y0lTNlFuRnBsWGhPaGlVSFpzc2RDZ0k0?=
 =?utf-8?B?b1QwS0FDa2JXd01QNmVBU0RCcDhPQkZsaDl6V2o2Z05XTHNCamxMZmhjYmE0?=
 =?utf-8?B?WVA0NTROWG1qRlJqSWUrQWRpUGh0WlRJbnVRU2JQV2NpMkd4eTJ3bnNjWXQ1?=
 =?utf-8?B?UzV2SXdGczlKYzk0TytnZjRuNkgvNDEySlJSRTdxZkZuTUFhNnRVQk00SWxy?=
 =?utf-8?B?dlV0eVJjd3lRb3piNCtmUllHR3FuUXI5NW9qVjRiSnRncFJRWkdEdU04dVhR?=
 =?utf-8?B?dGhzR2hSUFVtRGZpeXQ5OHZxRlFhVVNsV3ZPZXN3UFpybjdjVFZZb3RPUXlO?=
 =?utf-8?B?K1dwWnJYa3NBcnFsK1YvY1JnZHlNdUc3ZXU5ZVpHNXlPMzBPRUtIenZ4RGZN?=
 =?utf-8?B?K3Y0M3p0OGY1M3REeUxHaUdzdFltMXdRRTNoNldPTXkxdkJ3dkEyV1pVQXRC?=
 =?utf-8?B?Sjl3VWQzRmcvRlB5a2FpQk9TNWY5ck1mTS85OS9odjZPU0p1OWI2Y2pOcUx1?=
 =?utf-8?B?eUtnMllxN1RQZmlOS1lzUWdmanlwRU9DS1A0NnVkenNqdU9RdEFYZVJINGNE?=
 =?utf-8?B?YW8yWFVXVnNuaUprOWlSbytSZ0NKMFZpNzdZckFCNlkwZzBhV3M5YThEeTdW?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb02982-8109-45de-6e8a-08dba2db8c0e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:46:43.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZ/e+XSCa5Sj1sGcojRIwvrYaG+WZZx3r0ZqO1AHQ70h3W9oFvdcoR104vbo+LmGm2H6rp2YMv+5hD2PvyBW8cennEOfDhNjNJ5XxASPr6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-OriginatorOrg: intel.com

On 22.08.2023 03:14, kernel test robot wrote:
> Hi Karolina,
> 
> FYI, the error/warning still remains.

I sent a patch to address this warning in 
20230816105508.1135410-1-karolina.stolarek@intel.com but probably got 
lost in the noise and hasn't been reviewed.

Would it be possible to take a look at it?

All the best,
Karolina

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
> commit: 204042049a941d2a9a7d49bdcda768578b5f88ec [7361/11453] drm/ttm/tests: Add tests for ttm_pool
> config: arc-randconfig-r011-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220932.nPQdTkIN-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220932.nPQdTkIN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308220932.nPQdTkIN-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     In file included from include/drm/drm_kunit_helpers.h:6,
>                      from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:12,
>                      from drivers/gpu/drm/ttm/tests/ttm_pool_test.c:10:
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c: In function 'ttm_pool_alloc_basic_dma_addr':
>>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>           |                                     ^
>     include/kunit/test.h:598:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>       598 |         const typeof(left) __left = (left);                                    \
>           |                      ^~~~
>     include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
>      1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
>      1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>           |         ^~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>           |                                     ^
>     include/kunit/test.h:598:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>       598 |         const typeof(left) __left = (left);                                    \
>           |                                      ^~~~
>     include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
>      1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
>      1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>           |         ^~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>           |                                     ^
>     include/kunit/test.h:598:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>       598 |         const typeof(left) __left = (left);                                    \
>           |                      ^~~~
>     include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
>      1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
>      1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>           |         ^~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>           |                                     ^
>     include/kunit/test.h:598:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
>       598 |         const typeof(left) __left = (left);                                    \
>           |                                      ^~~~
>     include/kunit/test.h:1384:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
>      1384 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/kunit/test.h:1379:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
>      1379 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>           |         ^~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +231 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> 
>     195	
>     196	static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>     197	{
>     198		struct ttm_pool_test_priv *priv = test->priv;
>     199		struct ttm_test_devices *devs = priv->devs;
>     200		const struct ttm_pool_test_case *params = test->param_value;
>     201		struct ttm_tt *tt;
>     202		struct ttm_pool *pool;
>     203		struct ttm_buffer_object *bo;
>     204		dma_addr_t dma1, dma2;
>     205		enum ttm_caching caching = ttm_uncached;
>     206		unsigned int expected_num_pages = 1 << params->order;
>     207		size_t size = expected_num_pages * PAGE_SIZE;
>     208		int err;
>     209	
>     210		tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>     211		KUNIT_ASSERT_NOT_NULL(test, tt);
>     212	
>     213		bo = ttm_bo_kunit_init(test, devs, size);
>     214		KUNIT_ASSERT_NOT_NULL(test, bo);
>     215	
>     216		err = ttm_sg_tt_init(tt, bo, 0, caching);
>     217		KUNIT_ASSERT_EQ(test, err, 0);
>     218	
>     219		pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>     220		KUNIT_ASSERT_NOT_NULL(test, pool);
>     221	
>     222		ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>     223	
>     224		err = ttm_pool_alloc(pool, tt, &simple_ctx);
>     225		KUNIT_ASSERT_EQ(test, err, 0);
>     226		KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>     227	
>     228		dma1 = tt->dma_address[0];
>     229		dma2 = tt->dma_address[tt->num_pages - 1];
>     230	
>   > 231		KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>     232		KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>     233	
>     234		ttm_pool_free(pool, tt);
>     235		ttm_tt_fini(tt);
>     236		ttm_pool_fini(pool);
>     237	}
>     238	
> 
