Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C209457
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 11:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3u9CxjmEAc2u228SJvAcNrtGmYjDpT0oc1Sd2Z1+cMCxsYkC8/yl4lDUYAalcHpqPYUQP4yZhyxczb0Y3roLvNp5Zgi1JfQNwhg/zP5/YnntdanVDtUW6XroHaBEw9pt3hDzO/xBRzwWapnZBd38jzcfmSHvtJFLXMJgEfe8yuF1UUsDs7dCi/hCepvwi6d7MP3qGVZ8eE8RaSqas4rgl8lNmEX63sdUlgwmIYlH3l5NLymk6qqzBbRxsbF4e5RIoCTv6oKJU2BdCuh6QhAC8wNGddJmEASrg/62gy4pGBOyZW2YmPnMXggG2whDJd2M8subsxbnLceFB80YulJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAXyl6bf27p+1dPS2RJPBEZXhUI2zChtlpYIxhj00LQ=;
 b=Z9rvp9smwToLouTfsTdHVZ/uA9MPg1qqXYJNgCCxGx0+Pjp6gw7NymKGiyJ24KMNfqYCsJohncv6XCG1/lfns/puL5uaSx3h6E7R80kym9qGc7QXZrjhi+/zwA/bdeg1c2jerbtw+udm7u/t8is4PRJ4lXxCktkDCDp5J1shxsDMDusHKtQU2Cty8/TJzJwFJ9SPUFmOC5A9RGGD5xnVw2OSs3fKLEpY0nJdvspmsDBl0pPN4n6DkVjmg3/D+45lv2bsdbIgVI1etpkrprRjWAhfEW7RcZfB1JmBgOBCTbdSV5FtdLpjXxiY/DDRZ86YiPXd4UymEPdhHpuOoRdJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAXyl6bf27p+1dPS2RJPBEZXhUI2zChtlpYIxhj00LQ=;
 b=yTKZem1dJItvYTnSW4aPTQ7Hvrbzi7KR3btDuB+7Q9qagT5unEgMao8sE7RZZ/QNi4aTngscuszqGvBhRiXWw/urvL8PpXLQpGSaB25GXlL3cSh+U8Co/vQSGSWh+b6o4aowcyBd1hweKLtyBJbTg0OOc7REe9F/+tMkT3HghVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 11:59:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 11:59:06 +0000
Message-ID: <2d9b87d4-76fa-e7f3-0f39-711fe7e3110f@amd.com>
Date: Tue, 22 Aug 2023 13:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [linux-next:master 7361/11453]
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to pointer
 from integer of different size
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202308220932.nPQdTkIN-lkp@intel.com>
 <0079be8b-40ab-5c63-b04a-f5265ec3613c@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0079be8b-40ab-5c63-b04a-f5265ec3613c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d506b75-f48a-4692-0f3a-08dba3072f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BUoXwImu3SwwPsyqUEZPlD74dfr8oiT3eKv96ZXHn92IPikZKL/Yz0viPhpudpE37ADeNUMKUFElqinmeNV2wPHStn/Jg9QP2q5WuZxDnSxtK1y7JRAfDCidXyB9ToscxztkKSMwBncIRg+aDJikhzbUgOfnEkBSqPGoYy++wzIoBNj0fPHOPPgUl209FnkLPXK3tsX+og6/PwY4hnnnL7VeNWSUd4PuisZKY39FYu18F6QQFkxUv41iCZPJyMejqIE/fR6VdCNyhsv/DmaYTiwC8L0FERRkD4NS+hTkUzvRWBGyT3TwvJoMLRyKgPPWLIfyFcPV+J80Z+YY1NebVQgwG4c+OtONG61NIni3HIVBm4LRLbK5rLjr5OmKE0Q2VoQr2l2z3d+EhYr+af+DwUOiESr3kEi76UJWWR3A2juMffgRrUvAqWTqYWmdXxb4zBEh4aXavZqAngB2OSs3G09lTskwAK+QZQNwaX6PBtGPXjYKIDHriUDT0dPVcaYTjDgcbIFk4QZJy9NsZLBXOc+fC/g292UTq5hBHRNHwngQ4jVRs8tmt+VOBsBoBMQFDZkmEI2TllauLtR2Ep0rBZD1fYRSjuNnGddSOdPnnqxCXGd5Q55BBlST/aIjJvYyS7IbJph03FSWyW+Oo5ePOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3587.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(966005)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azRZbGRBaUp2UWtrc21ESEVZUU9aMUE3ckV6QVFzeCszVkJsZkFNM0xxK3Zy?=
 =?utf-8?B?N2RKaVVLaFd3TGxCaHNGODBxMTNINXRmZW5KNXZ2RnRtRUoyQmVyLzVNdkdt?=
 =?utf-8?B?QXd6LzREaE0xVnRUWkN2MXhVaHd5ZmtDZG5OZ0xRcDFaaGZleDNES1NPRmRB?=
 =?utf-8?B?L1pIdEwwZTBONEJXbHNTSkdXYUFrL09tdmZxMEgxOGJNSjJxNGJyZThicWVS?=
 =?utf-8?B?Y2RDZ1NLRnhOZ2JtZlRYZ1ovVEtqd3hnZ2JXVEpmTXRValIvcDh6NHhCc29V?=
 =?utf-8?B?Nk1sRVl1VnhOcDNibFljaHB5bkc1YTdnQU1RRk5zMzRsekZCOUNaTDN4ME8x?=
 =?utf-8?B?ZGIrYnRjaVVDaGszc0F6blZmdnBlMHVWbE9oUnVubk1SMEpxdVhpTTNLV3pV?=
 =?utf-8?B?RktuVWtoc3F5V3pDOVRTL1ZLWXNVNHVPc2lmVStncnVqaEE2UC9xUFBKRjFB?=
 =?utf-8?B?M3NvWHRXVmdtSjJ4bTVvU01mR0k0MlRSWmpjTGNJbjl5dXN3M296cUlxWEpN?=
 =?utf-8?B?T2JJZk1RWTdFbWZQK3huV1p2dDliaXpVR0kyQmJZMlNuQ2QyUnZyMXZoeWxp?=
 =?utf-8?B?eVJZdXNDWm9XMTdPSHhlaHNmTTdLd3NyQ3ltU0ZCWU84KzZNZUxBOE5DNW1o?=
 =?utf-8?B?ZVpXdXN2cnZhRWt5Tk9GbldvdnZkbXdpakd3R0xIZEJqSHgvamlaTkhKSnpW?=
 =?utf-8?B?SEhWS1FJendRUG1lQzlmRUpIRC95OWRLdUlybHFPTjE5cUlkVElicWU0Z1gv?=
 =?utf-8?B?T3hZaFZIckd3aW9LMWEwbk1OVGl5dnVnMkd2OFlKYU1BMkFqUlZac2dGa2ZU?=
 =?utf-8?B?dGtiUnJHQ01LSmFhUUorVWFQQUUrdEJId0tub29BU3JtNmtVRDMvcndNRGZO?=
 =?utf-8?B?Y3lWOWo2WDQ1MEhDM3hocEVGQ3pOYjIwTEhYN0FwUGEwVFBtTXJxc1ZxR2JM?=
 =?utf-8?B?b2RjLzhmQVNmTVBQY0ZIa2ttWWZvVVQrbGlZRElSV21UYWpmWW9VQzB4MzlK?=
 =?utf-8?B?MGMvOE5uWis4dHFQZ1ducWlvdG1EMEt4T3loZUpCMVA3NDcvclVZb0svV21l?=
 =?utf-8?B?WDNsRklUV0ticW1zZG90Sy80Q3AyOXNtWHh0VWoveXRNaFRtLzMvZ2RKZGZC?=
 =?utf-8?B?aFRLNnJ3UGlUVjhPOU44dVo5WjlPTjdNN1VRWXJ5TU5vUmtRS25oNSt6MlNn?=
 =?utf-8?B?WnhLaTRzdWc0MitiaG9FNktDM01iaytRd1p3blQyeDEzZ3RtMmFqRzJ6L2lX?=
 =?utf-8?B?c2Rkd2hLRTczdkY4QlJqcmNFNlhJbUhYTG5BaXhsRVFVTmZwc200QUE4RXc1?=
 =?utf-8?B?NU9ZVzBsMTdCVG5tdFZkejBiVkRYVnRzL3YrWkZjaCtac1FmdDljTEJrUEVn?=
 =?utf-8?B?bjdNTlVaMlBFQXd6ZCt2UmNBdEJWQ2lUaDJ3N0hZYzhsU1IvVHp1dGF1OVVT?=
 =?utf-8?B?TXFZUzF6cCtOb3lwcWh3dnFhYmhlT1RhN3ZYNTg5RWF5VEd4UXRtaklISTlN?=
 =?utf-8?B?MmtzT080S3pzMzduc0FaOS9EQ0JoQUJRd0REaUFra3d1d1p2YWtzS3U0TUpm?=
 =?utf-8?B?S282SVNWby9DNlBoeVFQQkY4eHR4TjJnb1REdFM0b0FpVDR6dFlDa2dHdS83?=
 =?utf-8?B?WkxsekN0cmxmOXVjeE1KS21PSUtHRGRYdTlnMDZtdFVyZTkyR05DRGpaOVcx?=
 =?utf-8?B?b3I4b0VJWFpTT0hTbzkyQm1WSDN6bFdWcFcvcTdOL29LY2lVRENvMlUySmta?=
 =?utf-8?B?b3lGUVRWRzV2ZmFjTWpqUmlvVVo4NUFXQktpdkdqYWFYT0M5TjFBU1hKUDJJ?=
 =?utf-8?B?UGpmd0E0T0I3ZGM5dHMyYlUwYlBxYnM4S1hHWG1SQUp5YVJZR3h0dGwzaE5l?=
 =?utf-8?B?N3RabFZBUHpWSEphbmloOWpkZmM1Wi96SkZUc2dZS3Byc2J4eUlwZllVL0h1?=
 =?utf-8?B?L010REkvcy80aWV1NGFKQkVzTENEbDdlRGNvVFhSM0VnaFQxYnJPdjZQZ2Nv?=
 =?utf-8?B?NUEwem9ldk1pR3E5SGN0anY2RzUyUTN2RGZ6NGpCNm5nUlZsM296Q2R0MWs4?=
 =?utf-8?B?ejU5Mm9yOHhvdndXWkU5SzZkYTlkQ3plaGNaczNDSzdTZ1cyMEJleG16aUdF?=
 =?utf-8?Q?V4nguxNotNCC/prn959/RGG+/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d506b75-f48a-4692-0f3a-08dba3072f4a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:59:05.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvyGgH8Rw25OSpX4mMnSvapC3XEbnYmU5AWxLRtuFeIRP6c8pEgSB3n7vjJvoNUQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941

Am 22.08.23 um 08:46 schrieb Karolina Stolarek:
> On 22.08.2023 03:14, kernel test robot wrote:
>> Hi Karolina,
>>
>> FYI, the error/warning still remains.
>
> I sent a patch to address this warning in 
> 20230816105508.1135410-1-karolina.stolarek@intel.com but probably got 
> lost in the noise and hasn't been reviewed.
>
> Would it be possible to take a look at it?

Sorry for the delay. AMD has a new security policy and I now have 
trouble using dim and pushing patches.

Just picked this one up and pushed it to drm-misc-next-fixes.

Regards,
Christian.

>
> All the best,
> Karolina
>
>>
>> tree: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>> master
>> head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
>> commit: 204042049a941d2a9a7d49bdcda768578b5f88ec [7361/11453] 
>> drm/ttm/tests: Add tests for ttm_pool
>> config: arc-randconfig-r011-20230822 
>> (https://download.01.org/0day-ci/archive/20230822/202308220932.nPQdTkIN-lkp@intel.com/config)
>> compiler: arc-elf-gcc (GCC) 12.3.0
>> reproduce: 
>> (https://download.01.org/0day-ci/archive/20230822/202308220932.nPQdTkIN-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202308220932.nPQdTkIN-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     In file included from include/drm/drm_kunit_helpers.h:6,
>>                      from 
>> drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:12,
>>                      from drivers/gpu/drm/ttm/tests/ttm_pool_test.c:10:
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c: In function 
>> 'ttm_pool_alloc_basic_dma_addr':
>>>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to 
>>>> pointer from integer of different size [-Wint-to-pointer-cast]
>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>           |                                     ^
>>     include/kunit/test.h:598:22: note: in definition of macro 
>> 'KUNIT_BASE_BINARY_ASSERTION'
>>       598 |         const typeof(left) __left = 
>> (left);                                    \
>>           |                      ^~~~
>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>> 'KUNIT_BINARY_PTR_ASSERTION'
>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in 
>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>>> drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:37: warning: cast to 
>>>> pointer from integer of different size [-Wint-to-pointer-cast]
>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>           |                                     ^
>>     include/kunit/test.h:598:38: note: in definition of macro 
>> 'KUNIT_BASE_BINARY_ASSERTION'
>>       598 |         const typeof(left) __left = 
>> (left);                                    \
>>           |                                      ^~~~
>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>> 'KUNIT_BINARY_PTR_ASSERTION'
>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:231:9: note: in 
>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>       231 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast 
>> to pointer from integer of different size [-Wint-to-pointer-cast]
>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>           |                                     ^
>>     include/kunit/test.h:598:22: note: in definition of macro 
>> 'KUNIT_BASE_BINARY_ASSERTION'
>>       598 |         const typeof(left) __left = 
>> (left);                                    \
>>           |                      ^~~~
>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>> 'KUNIT_BINARY_PTR_ASSERTION'
>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in 
>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:37: warning: cast 
>> to pointer from integer of different size [-Wint-to-pointer-cast]
>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>           |                                     ^
>>     include/kunit/test.h:598:38: note: in definition of macro 
>> 'KUNIT_BASE_BINARY_ASSERTION'
>>       598 |         const typeof(left) __left = 
>> (left);                                    \
>>           |                                      ^~~~
>>     include/kunit/test.h:1384:9: note: in expansion of macro 
>> 'KUNIT_BINARY_PTR_ASSERTION'
>>      1384 | KUNIT_BINARY_PTR_ASSERTION(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>     include/kunit/test.h:1379:9: note: in expansion of macro 
>> 'KUNIT_ASSERT_NOT_NULL_MSG'
>>      1379 | KUNIT_ASSERT_NOT_NULL_MSG(test, \
>>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/gpu/drm/ttm/tests/ttm_pool_test.c:232:9: note: in 
>> expansion of macro 'KUNIT_ASSERT_NOT_NULL'
>>       232 |         KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>           |         ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +231 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>
>>     195
>>     196    static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>>     197    {
>>     198        struct ttm_pool_test_priv *priv = test->priv;
>>     199        struct ttm_test_devices *devs = priv->devs;
>>     200        const struct ttm_pool_test_case *params = 
>> test->param_value;
>>     201        struct ttm_tt *tt;
>>     202        struct ttm_pool *pool;
>>     203        struct ttm_buffer_object *bo;
>>     204        dma_addr_t dma1, dma2;
>>     205        enum ttm_caching caching = ttm_uncached;
>>     206        unsigned int expected_num_pages = 1 << params->order;
>>     207        size_t size = expected_num_pages * PAGE_SIZE;
>>     208        int err;
>>     209
>>     210        tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>>     211        KUNIT_ASSERT_NOT_NULL(test, tt);
>>     212
>>     213        bo = ttm_bo_kunit_init(test, devs, size);
>>     214        KUNIT_ASSERT_NOT_NULL(test, bo);
>>     215
>>     216        err = ttm_sg_tt_init(tt, bo, 0, caching);
>>     217        KUNIT_ASSERT_EQ(test, err, 0);
>>     218
>>     219        pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>     220        KUNIT_ASSERT_NOT_NULL(test, pool);
>>     221
>>     222        ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, 
>> false);
>>     223
>>     224        err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>     225        KUNIT_ASSERT_EQ(test, err, 0);
>>     226        KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>>     227
>>     228        dma1 = tt->dma_address[0];
>>     229        dma2 = tt->dma_address[tt->num_pages - 1];
>>     230
>>   > 231        KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>     232        KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>     233
>>     234        ttm_pool_free(pool, tt);
>>     235        ttm_tt_fini(tt);
>>     236        ttm_pool_fini(pool);
>>     237    }
>>     238
>>

