Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13787E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669017569; x=1700553569;
  h=message-id:date:subject:to:cc:from:
   content-transfer-encoding:mime-version;
  bh=dJyY2A7BAyvEC7p+vUBtG4+1sKDeWrE8VHoFY4XWiYU=;
  b=ezWyTKUCRQuGy7wGuA9VbIxLBlnLHgOrU/VMr0dSu07RlPM7BOFtjwvh
   iUvRelJYjzIxJFSm642MMxT78lQi/fwL76dzTIJvW9MiuZ2ks7/iWSQ8k
   V3tv5uxZBc+juo0fckRGI69uum+IixinBWl5bsXpQv0lnesvLA5hYuEsq
   LdSG3X+RbyrSV2YmLyAROlP8FnTWG7UEY0kLlPDHEzVnblCECw5fHOE7I
   ExbTZGy1ztVvKqW2nUtsVJoFFLx/PS2loxQ6CsBA+rVYs7NJtwjpczZTS
   RANbEJKMcab5ES4AbKsMvR3Q0ClCilwi1RrJCgad8nRu5x36sY9d0zec3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="311126636"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="311126636"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 23:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="815623725"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="815623725"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2022 23:59:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 23:59:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 20 Nov 2022 23:59:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 20 Nov 2022 23:59:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoSlJzNws9rHv6+bsUUfQSKPc22ynCBVtFlbJ0CzMV1dGgCSr7e/t3p6CVyoRM4uh+EMSPCcP39DavDiOGhRNZ7gmxcFdOcoKBFkVjK1Q/p8zD2nW2izEVhGR4DIv+oNnWGm+XTT40vqRuu9rAa4hYdniD3n2ZTCYbWkRR8ZIesq7E3VgniINROytmFK9lbzNabJbaRsWE49yHFIf+EoCWp8qtUbo9tyZ4aNNLqTqm/fYrin/lwlm/7QXNfk8XW8ePRgSkaCU6ey+uMe9tL93MkWRO6mlORVZK/TRn0uOVCjmzw3oLU2VDfnrDnJpSZGxn83o+EbGvi1AhEdmsuQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YicVrZR5zjpofimCcsOR9nUvJmSmdEO4iLY0P2H/BVQ=;
 b=UC1xgDwfIY05rjss0CSvqVjKoKwoMkboFz7DMiuvMeAk7aw3dVjueZpEZnJI/7jPx9bGLh+TcgU/VuRvwhfevXD/RE8jSsTA+3DZknly/YugsOGA+w0Kbtw2hK/MgCnxSaLD69yo6KNgb5XyvWljIEpqnMOPi6ObDelfQ1MRU0vLEAyNMe9t41d49Cettn7fi2cc/OPuRop0N9RnQb8wFk20+TYJquDc0Fu9QQzZpuH6DDnc4HB4CiGFLV4whC2HL9ZYzkdRCajE64LYnjY1kj3PXqbdTaIRkmbRigy+mxokU7uRl2CgCerl8tkiZJAnXrrisIsNuXEqW/pCOxMpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:59:23 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:59:23 +0000
Message-ID: <fda17d42-5770-ea57-0ba4-07acb56efc4c@intel.com>
Date: Mon, 21 Nov 2022 15:59:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: [hverkuil-media-tree:hdmi-dbg 2/7]
 sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than
 once.
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>
CC: <oe-kbuild-all@lists.linux.dev>
From: kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fdef94-6b34-41c1-3165-08dacb964cd6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRleLTLV9AoadgYTA6yUKL9R+JCe21G58sSUSjaRTD15eOaThiXp4bP1H5CnbOrbKSCFxVawL/o7z1veKt5q5KbVTx1/je1dBb8WMUFdd2gzPWkQLyQCyjEwGNNeCKwIGF5gqkY6lGLQ9eqt3siutR0juj6P1TMhwPqErT2AXUmpDkKRIgEDNNue7vxelcPVOLAhH9HQlDisNmTbtdhEkmLLBzNklVEglR0zrAMhEmQzdXKbMN4Q3hX17Eh0iWK5ihJ2ILEtsAOVyB5KHoGgcU878EwCDiYoc7v/96IgsYNOOW2NL175J+VmxDy7vANn++szPlHaEiCJH2xv7ppHAhxIjelm/PQKp/XcynV9obnmCIFmk0dTMCuPZB3KB2Xv75MtbqscXZCtY4C/TM9hLkY/Z8bgnFIJTYqEd07bwBmihCktdZsqPi894ywpT4Np+VI3C5NR9vOGJGMwvPN3cMqWtmw5al659id750Jw+zVIAdaMhH2NUnYQssECKFmi7n3Spm26/K2BMCFMK8KgfVgFRz1KhS0eHoW+xiJDYkK/jRX/2fIfQ7+fmATFw0yYZ6EtCQLHChlblRGjpyI98cCmoTG9mF6X/jaieqf+w6k1aPiWYjpYxUGbN63uby//9vDy+x6EcfNR26NZwxmbt2DQG35wgCxqSffFrrv1VRHMC452SMuz1KfI7D5ELnA8evhi2hz/di+Fv3pyIPEqaNJFRLtqkYSaRCTBry4atUXCBYLLdjQ5dU9TwutM5j0uRv4zx2PPw7Nbx6EzS15jiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(41300700001)(26005)(31696002)(66556008)(4326008)(6916009)(316002)(66946007)(8676002)(38100700002)(6512007)(2906002)(86362001)(82960400001)(83380400001)(186003)(2616005)(36756003)(8936002)(66476007)(478600001)(5660300002)(31686004)(966005)(6486002)(6666004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWUyNTVQNGoyTUlEWXE2TDk3QjVMZ1FXa1NqczN4ekNYcXJqMk0rL0EvWXc2?=
 =?utf-8?B?VVF1eGl5ZE5rT2NDdEU0NnZNN2JUaXQwcTlid1dzcEZCYS91aGdtNUplRURL?=
 =?utf-8?B?aWd5L01PNEtneHJYZm91MWcyclZPVDhBdEd0ekIvZTUvM2lyOVM4bmtTSHp0?=
 =?utf-8?B?NC9XUHdwT2k3NUhlRjZwUzJpdnd5Y1Z4SjZoWXBlNzFxQVZmOXpLQWJiRlI1?=
 =?utf-8?B?K3RaQXVKNFNxT1k5eTBGd0J2R1dTUk13K0JWaDNiVFRiQ0hQWlp5dnBuRHpH?=
 =?utf-8?B?SFZnTmNGL3lNU2NjUGI3TzZRMElYbVpoRTFlT0YvV1VHd2dxV1A2bmVNT0NQ?=
 =?utf-8?B?dlZlaUtZa0Z6VUl2UkQ1OU5Id1Jpenp1cS9lZWFyRytVY3R0cElYQVNSaDRq?=
 =?utf-8?B?bEkxN1N4WnBNYTEwd3JNU3g0NkZxZ3JzMkFsczZpa1ArTlcwYTdZS1VkV3E3?=
 =?utf-8?B?VGtCbURnQVo1djV0V1hLNUovd0hhSU0xT1BjelRIRUlMVWdmSkJCM0lzVTFL?=
 =?utf-8?B?NXd6UHkzNjhLR2RkOXpkeFNyM0RSWFJSZHlmUmpOK244eXYycGlqZUh5WkpL?=
 =?utf-8?B?cHdzVlcvYTRxMHNjdHhnTFdhWVNCTjAxQnZXODFaQkh3MGxTT2diUUpnTGY0?=
 =?utf-8?B?UUVKNTNzZEVSMXhVQUtSaUtSbGZuTTZMbjBQRGZKYll1UE9oN080YUo2N1Z6?=
 =?utf-8?B?cko0M1Vzcks3ZGg0VWFsM3Q2dUhLbElVK01hNk0xNW8rWnJYL2NtSWJ1RXNz?=
 =?utf-8?B?aFZMeUFRMjJONWdIZjRLdlFURGQ2cXVKOUg0M0lld1NUb011NGk0MDZlU3Bq?=
 =?utf-8?B?NjJVdGVVKzBNNnd6MHhTSGZmdlQrS2JRZnBZRytkWldDUncybE1GUmw4ZDlL?=
 =?utf-8?B?ci82Qld1VWdRSWdSTDU3SzQzTG9YWnozWmF4elhyRzZEakRjSUR2bHZlTVlO?=
 =?utf-8?B?c2RDQ0g3b1I3Z2tXZGtEQzBBZW90eVNXZEloYmtmeEtCQ004bFE0QVBGeGR6?=
 =?utf-8?B?N2RTRFVuUlByTDc5eUptUDliR1JKY01sNm4rZ1JSTW94TklHOEtIY29wK1ZW?=
 =?utf-8?B?cCtHWHFMU3VwS3ZHVGxhYjNLRUEwck55VXpDTkY0dG9IMDAwRndRa0ZJaVRn?=
 =?utf-8?B?NkZOVE56K1lYTnVUUU1VdFF1a1drOWVNRVNWV0lGa3lGYmM5UVBNeUJxMVpE?=
 =?utf-8?B?eGRhaVk0SkR5Z2I2OTlMRmFoVDAyVTZEcEFDaUJVUDBDYmZMNGxQUG9Kcnlt?=
 =?utf-8?B?d1pYMnZHRzlaa2tYckMyQk1aenZxS1ZMY3d5MG5vSU5WNzVDSXpGdld1TzF5?=
 =?utf-8?B?NDgvOUUzSnNPdVlWSmFzOGdYMjdGbUZMdWF2Y29oSGcwRUx4bkk3bW5RcjZt?=
 =?utf-8?B?aHI4QitnYnpzRkRBTkhlTkJhdHQraTJ6endlTlB6N04xZmE0aVNIK0dGaHQz?=
 =?utf-8?B?MW5kRy90WTVseHR6RGNkSDZVdUZSOEdERFdlMVdNUWFQMHVkbFJyVDEvby93?=
 =?utf-8?B?aXhpUTBnTHlXWUc4R2ZuSUREbVFqbUtndi9sUUU2WWxxcTBvQkJsVTRBMWVP?=
 =?utf-8?B?T09nTkhzN1o2UHhubm1iTEVvNS9sY2xDaXNobXlVSmlrL3hZaXIyVEdtTGs1?=
 =?utf-8?B?SVBmRi9qdU1jUjdEd3gxUmJKcWg3RGhuQnl2THNhMC9OQVp6ZG8wMTNPS1pq?=
 =?utf-8?B?Y1JQRjBBKzZwMXpqOW9raE1aKzNBTk4zNVB6MWxHdUhTY1gvRlp6d0RNemp3?=
 =?utf-8?B?QVlGbmU3OTAxVU5POXYxQ1M0b1lPenRaTE1DcC9WaGJ4YXIycHZ3MVROcFo4?=
 =?utf-8?B?ZElZTStRTGFGNDdnWklxcFNhNVR1VVBRTHFucm5rL2c0QldVRU1ldFlvbUhh?=
 =?utf-8?B?QXdhUFZDTUFmMjRzSnl6d1pxSmFHdGZFOHB2V0hYUHB0TlltUnRSKzV6L2JD?=
 =?utf-8?B?VTYxSitEQk5yKzdSMUF0ZTd3WFJBUlFmWnRlMW8zc0YvWUJNMWRHV1V4WmNE?=
 =?utf-8?B?YlFlWms0bmVxcTRtMk5tUVRCVURoaFNhblNoTTZWeFpLOEhwOXBSbHNiLzRu?=
 =?utf-8?B?Vk5OQ2hBR0pBVHB5L1pPZDVUUkUzVnNkZk1FbGV4cy9MSnFqWjNsaFhXUndp?=
 =?utf-8?B?b3FoOTVNZlF2TTMxd0M4ZHUzVHBFOXU0Ky85OEV0c1lCR1hHLzNSbDJXUWs5?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fdef94-6b34-41c1-3165-08dacb964cd6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:59:23.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmYvSbjVbtjB/GbS7Q/s6DAVMoKMQZcjwAjw40fuBmxekXIvCDrtswslufIJVkeiN5LUu3/f74cFkrMr3xqWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-OriginatorOrg: intel.com

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   6b29cad21000797f343b14bdfb8c690a01c13fac
commit: cc8a6ed85aab1edbf83a9f3547a97d1bb3c3974c [2/7] hifiberry_dacplusadc: add support for the Hifiberry DAC+ ADC
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

includecheck warnings: (new ones prefixed by >>)
 >> sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than once.
 >> sound/soc/bcm/hifiberry_dacplusadc.c: linux/module.h is included more than once.


$ git blame sound/soc/bcm/hifiberry_dacplusadc.c

cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200 @20) #include <linux/module.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200  21) #include <linux/platform_device.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200 @22) #include <linux/kernel.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200  23) #include <linux/clk.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200 @24) #include <linux/kernel.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200 @25) #include <linux/module.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200  26) #include <linux/of.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200  27) #include <linux/slab.h>
cc8a6ed85aab1 (Hans Verkuil 2021-07-19 11:20:26 +0200  28) #include <linux/delay.h>


If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
