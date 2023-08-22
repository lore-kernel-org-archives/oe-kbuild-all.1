Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF927F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692709093; x=1724245093;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZVPVBO00dOFIeqTYNm0wPRrVNurWJodJ5kaU/7GasPU=;
  b=a553dHp4jV7mM9/8cBgYNk8LsM6n3FQ1ZVf3hC8yGBNsQbTuh7zRPqSm
   XWn8N/puyc6eXJHfeYy+ag2PbjyxPaGsqYJSokyiqN53WFtyUjpqzK5Sf
   G72KIJ/DVkLpYFm+/hMml9teM9xUZHp99DDYkdf/IOH/Fs/PdsvP85Vp1
   SI6H/fZ+xp2XuxtfbNmeR6+k0qnXt/zcmtqRHcW1RWM/iEX++V3TZ6a+c
   mSryq0SlGW6/UIVxAvK14HvijpDOFxeiwi2MJNtdqOfOl3bhek5rf0XlU
   zetjQGmlADjnXc0XFiWMoT4bNDdTYl4a2ZFA4tEW9W9OPo7/vuCb0xs+L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460238761"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="460238761"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 05:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765728615"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="765728615"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 05:58:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 05:58:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 05:58:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 05:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So3k6kSsfGgsgLPUpVZmSERnf3vrw8ONBvOvJhGZ96XJS7c+KEVWgqqWeMm2RkPMSLqnqlPHqqPj5qyDl1h0bIKCvhapFD9R7ru0a35/ga+BxqQiGmYoSw7RjjSK5gUgBIM269LISKs5KQfcoH5ZQa5huGCSHenztntH6sj6E8j38MvT+zT3NDMjejYZI7iv3Fv05x5AQajYwZ7ZpkBwdo+3HTN5Zr9Xssrx2/cToHftB7Lg4IEsy5hUwySERyrNSkdniqhS9KRiuWeV4GSTlNEzMDsIQEcIMpMM9nO4O5X17bB/+9V7U6cd2qPZc2pPcWVlRi21RagnCvCH+HEUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le/701TJWupaVqlvYXMpQrGd9xnsc2CfMjulhhJz2PA=;
 b=jetSRHrvcpx2DFxUgZ4MQzrpWTzSoUarmY8llSePstX+w2mSs5EyWLtDqSfY2S5TTgwXYOS3uEllmUuQbGK0c4+ybiGQCX/8F1QFThDAT/Y3199oSwYMlS8k20vvmuRkeYbr8k2Va5epUbFj3Uzjsd2kCmG3aTi5EKZ4IXVOWOUFgNwKNlKdP9xpv+MEYFELIi+RMQbZbaKars6+bEq0qalETCMKXSCBOut4b9tJpOwI7g5ioZDLKISZvcmcBszZPZPN7CJS0qEoKxM0YaS1ckUgVldGgAJbCTiFmic+rkKGw7Au7MFaB2BUeksa4I5kZBbs2nVzuiAnrLe/hqQQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:58:08 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 12:58:08 +0000
Message-ID: <c11b4d25-cc90-e8f4-4dc5-cfc9713e4384@intel.com>
Date: Tue, 22 Aug 2023 14:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [linux-next:master 7361/11453]
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer
 from integer of different size
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "kernel test
 robot" <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
References: <202308220932.nPQdTkIN-lkp@intel.com>
 <0079be8b-40ab-5c63-b04a-f5265ec3613c@intel.com>
 <2d9b87d4-76fa-e7f3-0f39-711fe7e3110f@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2d9b87d4-76fa-e7f3-0f39-711fe7e3110f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH7PR11MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 9945d860-e697-4b16-a64f-08dba30f6e50
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9H77g3A+wZc7AYl3onupExooFIpJ6eZEiQ1mtQICyxqsdQExZS0lJidpA/TI0qAULmsvfQWxTa15v+1Lt4xwgjD63PgFCr+VhlVOfJ0zm1GEYT84ievnrpLIJvdQLAgkSppA4IvTmOQKYxjgwOn6EYPvHQMHzaxPwNzUl/meVz5HxItzYCbDRi7z4aXd3XT2HUIsqbTBigsI3Lwh94l3DNdHZS3MriifC14FUaKrw7dHr9ZYMNS1i+TVreiDheS5dsgSL/wScBLucgyfyi+rRfTnYOrZbmMZf1jC7fxlYBCANM91UpPoCvdurrQC+KExjuPSctvHw0pEkZRtXnnlw/UEx0u+rJuNxN0KNXu7UvZmMaKjJNgn/FxQz0L8H9FaCkORfshvbpJwwZYi3Aq6Zzsv0BItFOsIyigqptS7fOTZ1rx3o7sojvOJRr5Y6KgdgtFjLAWdGuapS3Jk3OXZzUoubhmg9mU0iMj+MwFkKwdOue8adFGRfRj4uJajaPPDeM3b26vMmIn6ZesOODPVv5ae1UYEqSjQ+ZN1bePJpbvDC19jVch6QtsrorKb1khoFUnP8lLNXVKhhEeUC+aaCzT5rKqieirLkVpLsg3yNJ3gQ+edB64rVhtpjavQNt0xZaS0MZF+yjWOc+kC6bUMrP7spue3JQ3NBc+kQdvVwJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(66476007)(66556008)(6636002)(316002)(66946007)(6512007)(82960400001)(110136005)(8676002)(8936002)(2616005)(4326008)(966005)(36756003)(41300700001)(478600001)(6666004)(36916002)(38100700002)(6486002)(53546011)(6506007)(83380400001)(66574015)(2906002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkpUM3lmTzBQSHd3ZDFXWVBLYWtWdmpLdHZnUjlIaXNPK285OWt0a3MvekpI?=
 =?utf-8?B?TXA0dHdQSDB1MC91K2JTT1k0R0JLV0ZubzNYTkd6TjVTeTFHN20vcTVPY3pK?=
 =?utf-8?B?Sng2NXZlNk5uNC9uUHM1ZWxBZjNDNHhxZThGdWtIRlZuR2JaejFudHVhYjRP?=
 =?utf-8?B?OTZvRWpndzVGQ3gwTFVKa3pKYldBQ0o1L1lWNDlCWjdrQ0g3NXlESlA1ZFhq?=
 =?utf-8?B?OEFjWUFsS0xOU2kwRmlKbWFOWVF1SHVSZE84ejd5U1dRaUR3SkoxZzhkbHZk?=
 =?utf-8?B?MTlDblI4RVFMWTM3dXNZS1BqbC9hWmg1S3VQclFFVy95eFVqOG5WUzVHajdD?=
 =?utf-8?B?NzB2V1hjZTFySTJ6aEprMzcvK2VuNjNNdzVRRjhNeU1PMEZTMmZkd1VWT3p4?=
 =?utf-8?B?NWlVZXRYYmtvYmZYQnJCRnQwemJVd2ZsSkpLNTA3bnhycm51MSs0UExqN1FX?=
 =?utf-8?B?QTJQY01SUFd3R0gzUGFmV0NPeVNBTGFoV29laDhlSlBZVkRmRnRRMjhEdTVy?=
 =?utf-8?B?bnZHYUFtTkhDcHpCSDV5NU8yMlAzTFpLdGduR2wySHAwME9pRzV5T2Q0eE9S?=
 =?utf-8?B?R1hRcTV2Y2wyUWZ5b1p4bmN6czk2YWtqcEJUcWRuWjBYNnFjTW5TYzdnTW5I?=
 =?utf-8?B?enRaUUVOdVhSTm9kSWh1bG5RWU13KytCRFN2Zk1UNFdzR2VnR3NUeFBTVWM2?=
 =?utf-8?B?eHE2K05GR0JVbThKaEMwL1dlMVlTQ3N5S3hyVmlhMmxMYjZyUFY3aXBWMlBm?=
 =?utf-8?B?dGRnR1FxMmtLbS9GWHdiZGluVnd2ckR5bk1aaW91M3JSa1I3OHhCbTZhWTMr?=
 =?utf-8?B?SEhXU0pNdVFPanJIUlc5NjVQdXVPZGlkWG4waElUak8rNFA1ZHNTZ2NBRHhl?=
 =?utf-8?B?R3p5RUt1K2tYVUxhMmlNZUN5QkRvd0N1d3Z4NHN4RTFubjl5ZkN1N2daTk0w?=
 =?utf-8?B?T1p3WUcwVFArSWtGV1dmeHFxcGMramdnM1lnQnlmMVVZWG0vb0oyQ0Rxb1JO?=
 =?utf-8?B?RjQ0SW1QZ1lCOXZkSERNeVRWRXdKUFBMaG1UVHJhSlh0b0JWVmpXalRWVWJF?=
 =?utf-8?B?MTZydjg5U2srUGRmY1I2VFd3SldORDlORjVZQ0lBbm5oU3o0WUtOUXl1TjBw?=
 =?utf-8?B?ZzlKdjloNDhJdkNqTlBUemJxQUtBeXNuYURDUnlhckVodFg4WnJmdjhiQTJZ?=
 =?utf-8?B?V3gvSHRUdW5ZSWJxTlVmS01wQXZmL3ZOUnhCRERLRHNDZEU5cjlOTFpqNTRs?=
 =?utf-8?B?RXlPR01GK0NyLzdBZ29kK0VodFVyZzdTK2ZRK1Noek9xdXo5YlAwZFRmOTF6?=
 =?utf-8?B?QlJWU1FBNndCSkRCVmNIMG1LbHJoL0hrTFVRaUd4R0JOL3NFN2RyU01TMms1?=
 =?utf-8?B?OWFWSFpEdGVva2VUeUxPeTh0eHNldU5sOWZRODJqbGtXSXRMMDNTZFBoWEZ3?=
 =?utf-8?B?TGc2OXVHbFVpMDJwY1lLM2drODMrK2hNMDl5R09BRkNqOW5yTndjWC9hRFR1?=
 =?utf-8?B?NjhBazV0N1RDemVFa25vSlBxL0dKTjBSdlZaTi9Sai8xeUZ4ZzEyNDhRUnhX?=
 =?utf-8?B?RXFrK3lOY0huNzB1Z1BGT2VtNkVVRmpsS0tYd3Y3VjlTWmJSUUJyWk9FM2R2?=
 =?utf-8?B?ZjhFQmxoQ1V2YUM5dzRlbHBNUkJtYmRtM3c1QjVydlBFdC9KbXBGVlMwTnFw?=
 =?utf-8?B?M1lVYW1KK2lVaUVTZk9tTUQvbVN6Rnp5V0RQQ2oyZTd3MUk0YzNJL2dIY2g4?=
 =?utf-8?B?bGp2NGZWR3BjK2xLZmZyUG5WRUdzOG9YZW5WNlA0OTl6T1NrM1dMcTh2Qmcx?=
 =?utf-8?B?UUVub3NSVFBYMUxqNjBESE1Tbi95V3JRczFTSHhhWUhIS3BheFRpVzRvQWRr?=
 =?utf-8?B?S0dEQUxOckdleWpYRkpIbFg4VVJ6TGF5UlpVYnIydE9ORk1OTjlqM1kwdnd5?=
 =?utf-8?B?aW9rcm02Wk5WZGord0VSbmRQcnB2MXFkdE03V2ZnZ1QwOHlzQUJ6VFYydWdK?=
 =?utf-8?B?NC9ZSXpDUWs0Wm9oM09KbFhIc09JeVlpeVVWUUovemhrWFAxenFteXpKMFI1?=
 =?utf-8?B?WXFmYmkxcjlXTXhPaGIwYXZsWUsrYXRQNEhZaXFrV0RLU1lwQlJmVE1aVmxi?=
 =?utf-8?B?d1RnYmpTamN5SDlsdEtWTWVOdDg2bTlhR0JzV1JvQk5MMEEwWnQveTRUVmYy?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9945d860-e697-4b16-a64f-08dba30f6e50
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:58:07.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KDPR/zxt/X/vp6KbxmG+nIqoPqYoZtoFp4cV2uwnSrJu5QSOsdmxgyT80x6UHhKShaM01WfZz1uGQ903r7XABa0voZo8IwOOxIHIC6tY6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6796
X-OriginatorOrg: intel.com

On 22.08.2023 13:58, Christian König wrote:
> Am 22.08.23 um 08:46 schrieb Karolina Stolarek:
>> On 22.08.2023 03:14, kernel test robot wrote:
>>> Hi Karolina,
>>>
>>> FYI, the error/warning still remains.
>>
>> I sent a patch to address this warning in 
>> 20230816105508.1135410-1-karolina.stolarek@intel.com but probably got 
>> lost in the noise and hasn't been reviewed.
>>
>> Would it be possible to take a look at it?
> 
> Sorry for the delay. AMD has a new security policy and I now have 
> trouble using dim and pushing patches.

Ouch, I can imagine that's not helpful, especially for you as a 
maintainer. Still, thank you for coming to the rescue :)

> 
> Just picked this one up and pushed it to drm-misc-next-fixes.

Sorry about that warning. I'll not only double but triple-check my next 
series to avoid these...

All the best,
Karolina
> 
> Regards,
> Christian.
> 
>>
>> All the best,
>> Karolina
>>
>>>
>>> tree: 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>>> master
>>> head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
>>> commit: 204042049a941d2a9a7d49bdcda768578b5f88ec [7361/11453] 
>>> drm/ttm/tests: Add tests for ttm_pool
>>> config: arc-randconfig-r011-20230822 
>>> (https://download.01.org/0day-ci/archive/20230822/202308220932.nPQdTkIN-lkp@intel.com/config)
>>> compiler: arc-elf-gcc (GCC) 12.3.0
>>> reproduce: 
>>> (https://download.01.org/0day-ci/archive/20230822/202308220932.nPQdTkIN-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>>> version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: 
>>> https://lore.kernel.org/oe-kbuild-all/202308220932.nPQdTkIN-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>     In file included from include/drm/drm_kunit_helpers.h:6,
>>>                      from 
>>> drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:12,
>>>                      from drivers/gpu/drm/ttm/tests/ttm_pool_test.c:10:
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c: In function 
>>> 'ttm_pool_alloc_basic_dma_addr':
>>>>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to 
>>>>> pointer from integer of different size [-Wint-to-pointer-cast]
>>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>>           |                                     ^
>>>     include/kunit/test.h:598:22: note: in definition of macro 
>>> 'KUNIT_BASE_BINARY_ASSERTION'
>>>       598 |         const typeof(left) __left = 
>>> (left);                                    \
>>>           |                      ^~~~
>>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>>> 'KUNIT_BINARY_PTR_ASSERTION'
>>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in 
>>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>>>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to 
>>>>> pointer from integer of different size [-Wint-to-pointer-cast]
>>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>>           |                                     ^
>>>     include/kunit/test.h:598:38: note: in definition of macro 
>>> 'KUNIT_BASE_BINARY_ASSERTION'
>>>       598 |         const typeof(left) __left = 
>>> (left);                                    \
>>>           |                                      ^~~~
>>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>>> 'KUNIT_BINARY_PTR_ASSERTION'
>>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in 
>>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast 
>>> to pointer from integer of different size [-Wint-to-pointer-cast]
>>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>>           |                                     ^
>>>     include/kunit/test.h:598:22: note: in definition of macro 
>>> 'KUNIT_BASE_BINARY_ASSERTION'
>>>       598 |         const typeof(left) __left = 
>>> (left);                                    \
>>>           |                      ^~~~
>>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>>> 'KUNIT_BINARY_PTR_ASSERTION'
>>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in 
>>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast 
>>> to pointer from integer of different size [-Wint-to-pointer-cast]
>>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>>           |                                     ^
>>>     include/kunit/test.h:598:38: note: in definition of macro 
>>> 'KUNIT_BASE_BINARY_ASSERTION'
>>>       598 |         const typeof(left) __left = 
>>> (left);                                    \
>>>           |                                      ^~~~
>>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>>> 'KUNIT_BINARY_PTR_ASSERTION'
>>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in 
>>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>>
>>>
>>> vim +231 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>
>>>     195
>>>     196    static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>>>     197    {
>>>     198        struct ttm_pool_test_priv *priv = test->priv;
>>>     199        struct ttm_test_devices *devs = priv->devs;
>>>     200        const struct ttm_pool_test_case *params = 
>>> test->param_value;
>>>     201        struct ttm_tt *tt;
>>>     202        struct ttm_pool *pool;
>>>     203        struct ttm_buffer_object *bo;
>>>     204        dma_addr_t dma1, dma2;
>>>     205        enum ttm_caching caching = ttm_uncached;
>>>     206        unsigned int expected_num_pages = 1 << params->order;
>>>     207        size_t size = expected_num_pages * PAGE_SIZE;
>>>     208        int err;
>>>     209
>>>     210        tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>>>     211        KUNIT_ASSERT_NOT_NULL(test, tt);
>>>     212
>>>     213        bo = ttm_bo_kunit_init(test, devs, size);
>>>     214        KUNIT_ASSERT_NOT_NULL(test, bo);
>>>     215
>>>     216        err = ttm_sg_tt_init(tt, bo, 0, caching);
>>>     217        KUNIT_ASSERT_EQ(test, err, 0);
>>>     218
>>>     219        pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>>     220        KUNIT_ASSERT_NOT_NULL(test, pool);
>>>     221
>>>     222        ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, 
>>> false);
>>>     223
>>>     224        err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>     225        KUNIT_ASSERT_EQ(test, err, 0);
>>>     226        KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>>>     227
>>>     228        dma1 = tt->dma_address[0];
>>>     229        dma2 = tt->dma_address[tt->num_pages - 1];
>>>     230
>>>   > 231        KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>>     232        KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>>     233
>>>     234        ttm_pool_free(pool, tt);
>>>     235        ttm_tt_fini(tt);
>>>     236        ttm_pool_fini(pool);
>>>     237    }
>>>     238
>>>
> 
