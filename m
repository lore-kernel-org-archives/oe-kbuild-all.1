Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED82564
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681891313; x=1713427313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=At/Kwdz5hy4CpFll6BQhpmUTpXHHQ/zlVR9zV9w8T9Q=;
  b=e6965EovJ34FfkhOpSLp3/t2uJrfToXdkIZYYQraWEcLLegxfAky3nLb
   wogW1q3Z8eZ/sjReH11XvOIVu7GoriJCNolwsbJ7U10hPr56EHleU7q8U
   Xftiqel4Vh6oYaMCHZcEfVbEkFhvfTP/W05kl0MJTUKW8fH4dVSB/1m1Q
   mY7foJEJc31RjqPlqMubCJA4nVfLcPz9n1sdPt6+7I98WnpU0nHxXGeXB
   S3h2alq8CZ1OMBKBXrzK3iuswslhR43+1ESnsvJYfKKZ9OCpWyPL26E9B
   7B/9BsW+gUBuHqVsCta0GE10zTvWpi+tNnmAKHrareUeD0mjo0vo83MjF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344131550"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="344131550"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 01:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691406652"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="691406652"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP; 19 Apr 2023 01:01:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 01:01:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 01:01:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 01:01:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 01:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoHOB7bKTB37yc13Szu8FSE2ummExTtnRWbiXRcHPspoZlFQmCrtZKTuq4Elatr/Q/UgZoTRiH7oWVXiyH6Vr0caki69IotLeZg7UUAfFUdmTELYA5mpD5VPRpMVBl5m3OCyFXADRnz6xUZsTvPCwGzUUX6Gk7JtwKkGOP0puXZq/8l6b6z7YSEjCTLgIuko+4b5hta39SaDfpdWSU+yUsItYhacy9BrCNrsaFRstt+E6G3uTy4Sitd6hRLC63fyemGiajgB2T2naa9BkqKDjBJBOivOLbQSHKUQ1vHlav9u7f2O1bcJG2LfRIBob65wdf1ISqh9yg7yNTvOq1ZUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD/8imaee7jhK4L/KwRfVDufl4R07ADRvCs655/D4ss=;
 b=Bc219Hq02pxwbkKR4UJ+karQCUWUUMtAjpx6m5NngQxGcRZ0TOSkHIRduX2IZVPA5xhglk3kjQhrzJdSpuOmCF/u5nUf6CzVloXwAjX83dhAaBj1UB6E4mlBCFhX72SZtxQqqWSOhPa+lkE+tz9xP/hvoXep9LTiMRDzdyDThyCeFvBjmj/11Z6BlE9MBfM1dQrLMknaV9i9oQ3ZOhHq+sZQ4ysP4spRgeY+bhbfCVPfyxKZ+HbZBMIZlUgs8i8hzTOFs5tZ7ZHq4XHtDZoWJRGhQJ9q/jae4iyMgNTR+HTWtvrB+fbt2QTaqhJTiOMNbPm/wsYlk1NTwMX1Acwypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 08:01:50 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 08:01:50 +0000
Date: Wed, 19 Apr 2023 15:58:44 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [intel-tdx:kvm-upstream-workaround 100/335] arch/x86/kvm/vmx/main.c:
 mmu.h is included more than once.
Message-ID: <202304090410.iQ7sU94Q-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0079.apcprd02.prod.outlook.com
 (2603:1096:4:90::19) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f482e54-a2ab-4864-5aa2-08db40ac5460
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylLPItwR3NOIU7CoBgsx9QHZ6oqUqaiuByqzuYYadUi1yhQUKUyW6NNz5lypiGoStLsB8AwC6HXYg8/desWb1OKqo/9h5cOZJLM2F3rb11BoI/kEtrCIxw0K2JvVdH+uGdr9A9XVxUjh17fMCXNKGt/79vk9K7FCyIOyiv6WFWR6R1nEWPWGh93bJCDYQzGCX4Sk63aqlpTNMpL63jbcGPo9NdD4r6bMJHX8WGEhvis8wEu/6t5CHwSu9OAYuriR6UQam/hvGVDwoqi3An4TBtSMk+EOs2mfzbEeV9GanEGzIaS8QfX+WPqjPzqia+Ouk/+KqTdIgbhGIhbW4GKZ5uuIUJ38gfRIiqMhVohbF1ILMSYjc6BCL9n8xq40T/Ydq1wzf365pzRln7DqsFG41y1Za9bnAOWxDPxPsl4WvI2HqflkDWRaPuXuDvqUA4IuJuTz+i1ZsQ7+2o/GgxYcrNihiifa+JeHdLuXLlQTOZy9QW9GQ1vWpG2NvI8oIOCD2YCvHRmE8TIjPhePyQcK/MLinvC0llegEfnL7ZwJ45h1upZj69cuH0LJNPEt/IZ+jz6+b7ZjNdg8f59QMFsJMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(38100700002)(2906002)(82960400001)(4001150100001)(966005)(478600001)(6486002)(6666004)(2616005)(83380400001)(26005)(1076003)(6512007)(6506007)(6862004)(86362001)(186003)(36756003)(41300700001)(316002)(5660300002)(8936002)(8676002)(6636002)(66946007)(37006003)(66556008)(4326008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MxUi7db1yO8TyGRumfp/7+fgLWZv7GwxoNH5EQ98iT0IxQO5QRdWxlKNJlxs?=
 =?us-ascii?Q?dwFWoteRmax+s5I0j/ebR1y1pJP5YpH4k82I+okoeUhZx1+uF+oUFoB9zDvu?=
 =?us-ascii?Q?/DxKUtTh8AWBO01jfISF+DVlgWYfJtFnB0MggKJQqe16hGsnWED3ppMRbe9B?=
 =?us-ascii?Q?lpSJDZkLIbyJlWI2BoNJw7MugTiMkvGnVfeBeN5Du5yMbSKdedSlIvzOCUAV?=
 =?us-ascii?Q?48OY1qrbcMBBDi5MvXHeZENJzczfXkHUK6LjDfONZTQsUaw2DPvXsnFCLDqU?=
 =?us-ascii?Q?5AEiQq8blSpxhBck+A6YeY76otkU/CZUCuc2+rMXQnhYuLj0QPqgCUTYlxLC?=
 =?us-ascii?Q?b12dH49SbKZXWIAqjkMXI0ffMni9TAWPqlRQjiCRXTWhOkWLZqCQHBOg3Xeq?=
 =?us-ascii?Q?FUYrejAVkfSRgyOJdU5bFRawCVtRM/qMPYdvVH3WfB6iHmYHPapLBEIwWbKO?=
 =?us-ascii?Q?7s3HYr3mX4dZ2XDOJTGb8g/F2oSICfDXvqHkBuZco7wzp1cdiY+zdd0S+TGj?=
 =?us-ascii?Q?AygXrq6tbKgX0knAvfEussRFY2/LJYlmVIO1jFIyZhvke9Gnvzx66xGP4RjF?=
 =?us-ascii?Q?vA8z7MandNffDDXQFIqkEnCYbtr7uYwN7+cXhoduT6Twj5R4eUd1FsDTmgMo?=
 =?us-ascii?Q?RXS8dJ8VNMSvc/B19w9Aj3oaHKUoW2+pNSLL1yhhOFYT0Ir0kjaaGT9d4PaV?=
 =?us-ascii?Q?WtuRawoWjOszi6anD/R5mrRSiailbmdZPjU18I6SZYDSHw4ocJWwFLEUStCz?=
 =?us-ascii?Q?byVxUaeUf/2tYMKgnggHJGCq/HiGab8P6t5viR48JFsgKpPnxSqarQu8TPhU?=
 =?us-ascii?Q?oJBJqoPJ3RUJBKR8+WL9omUFIZba8BiIt+E4OvGTmq2+G/TTPXJr/xfIg7BT?=
 =?us-ascii?Q?uFZwDFlydGjpiQ7r5UnShLAj62ra5ECXXKSe3qf9TUVm2q6iV8zPCAAWSNQ3?=
 =?us-ascii?Q?4iC7+Ul9fOwFikyb1WJ1IV8Y9699/58RG8kJztFw2fdY4/ATnKFV8KgSlnYy?=
 =?us-ascii?Q?Z/f0PT5AS75bumMhdyid9jlBURt/63Ca2QvkHA2XBqx0Y3YhKE/JtsBxRTdM?=
 =?us-ascii?Q?AGs+rfuTduNh8lm4BaU1Ra9rp1tagL2r9r6HxcIxBJqiWNrpw8sqdh2rkMsl?=
 =?us-ascii?Q?FXzkUme9Vkfs8LlBXknMbBWVN4sNoC/zSvRHBdyhyPnWK2KXhUYD8HorFX01?=
 =?us-ascii?Q?staqRysUy343elZH8l1Hwcl0Cxq6zz+tZfcjIBQz41M77A6cqrd9atmLBlpO?=
 =?us-ascii?Q?2Vr/wg4TpLCDLYqey9cvAYmETwZpbWSd2nj83foF5NPBkuf9GYytsEOabTLj?=
 =?us-ascii?Q?mvSb89DCXzy+nUwmWEVBMXUoWzFgON5OlXHjUwP4tlqU2ZhvZGbXa7xyIoXj?=
 =?us-ascii?Q?+3ZFNJ5lFeSI7Pr8AtXMuxAIuyrBE7oIMjYRk/+EeEfzqCnPziAHNrrKfaMW?=
 =?us-ascii?Q?d3RLAUUfnr0GsZIvT0ZGHDhgPwZLKw4CtfcAJ/xXZbKzkMqDBEBW++pOsLMA?=
 =?us-ascii?Q?uOpY/SYayCJpnwtg5j6d03KjSaP738O302NulI9Gp1uOjt9teCzrEETb/nR0?=
 =?us-ascii?Q?KHkNS7/RZJyr0ViyG7d0Aba2WmsWnKBBeTB5hUqW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f482e54-a2ab-4864-5aa2-08db40ac5460
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:01:49.8658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbSQBEtnNrrkv0bAgW+gaBHsRw57Lydk3ZnkDVnB9h+mCLeKVGYYKwKNG0RbnZ5KY3oy7dJYbeY5cODwZhCa+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3e6762343e0ddcb90b2e49af3a341051541d1a3a
commit: ffa7348a84c3a30f5ac09367f0a2136ad75a85cc [100/335] KVM: TDX: Require TDP MMU and mmio caching for TDX
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090410.iQ7sU94Q-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/main.c: mmu.h is included more than once.

42b7f124e0f9e (Sean Christopherson 2019-11-15 09:11:12 -0800    4) #include "x86_ops.h"
ffa7348a84c3a (Isaku Yamahata      2022-01-21 02:21:35 -0800  @ 5) #include "mmu.h"
42b7f124e0f9e (Sean Christopherson 2019-11-15 09:11:12 -0800    6) #include "vmx.h"
42b7f124e0f9e (Sean Christopherson 2019-11-15 09:11:12 -0800    7) #include "nested.h"
5eb7a2e3cfd26 (Isaku Yamahata      2022-05-16 17:30:09 -0700    8) #include "common.h"
b3ecdf6976d7e (Sean Christopherson 2020-06-02 21:48:09 -0700  @ 9) #include "mmu.h"
42b7f124e0f9e (Sean Christopherson 2019-11-15 09:11:12 -0800   10) #include "pmu.h"
c532688145c4c (Isaku Yamahata      2022-02-09 15:38:31 -0800   11) #include "tdx.h"
815700df01fb3 (Isaku Yamahata      2023-02-16 17:03:40 -0800   12) #include "tdx_arch.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

