Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A533FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674116924; x=1705652924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JhiY90NWYlBHfSSfrD0rBPU0B4bk/rCjdQmLZxhBs8=;
  b=JG3TFZf3GYAwoXsYA3VM7yg/9CHTw0dCH+WuTvbK+/YKM9PVl8Rh9RLJ
   cP749LvmPCahjwkfKZdgmx/d38/4nyVyoDkrwwFjEFsr8c3tQ/1/f4UXL
   dCOWxHiETjhGXlSKQ4VNZzGc4sqYk2JnV2wxc3AkLdtyI3HSEfjKr4sD8
   l3pMJ8Dak3pE+k6dZeWm/dynoe0uUBxzd8DzT8t+myyOQdEGrHmVhlQoh
   Pw62Ck3Akse+IYycIh+0fmX6ACqakWRRWeF6nnTrDGmbrbH8RMZ6QYDJ7
   MN1fELYL9YWSa7mL0YONPNBf9NOXIn71zRu2Z6+SbqLd+gB3dTwJr0pUE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="313102184"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="313102184"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 00:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637613071"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="637613071"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 00:28:41 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 00:28:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 00:28:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 00:28:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhM9qchUgya0gxEyb6UBe06mAeT0vLVGUMpMSK/OB7ckN2BOukdgZ9/47xN13ffruD2K7X7LVMQPvMN7Frh2Vzbp8iMmiTAZ9tuMQqY91n5107HqzvsPsShCv4t3G6XQFSfZi9FpuBBo0cThTf0vJL1js7WMeDNGQfo8E1BvLquzs3JHCuojsmvSBX8M6cZJlQR3fALuwnht7U05YJQ/z6dWnJzR8V15TAK1TwFEbGPYsHFo5ug7J6TBMhUCZcXnBP3HGchHzmw2TbEYAFD1aaQsYbZ4NStipRqQtetIELLs4GpMerRm9CZhb4OTY0rfPYR/G8w6xU+TKz3NnK37NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpw0tdOpmyH8AjlnGhCSlXoYr69v5Ti3LEXOpkoZoZ0=;
 b=jRcXKjW5y9RqWj/SXa0cguIRf1QCrIMgwCDEZmOqaLwqI5Les6erM5LF5HA9iD/HzubttFjwxkLTVk+gjtV19iWsCzMX4BGHS6Awb0QCzxX6v80gZ9T2J9SQBQpiW73JSJSPqoPpeK2+omGQeRX0+WtexpzoFDYJPiqKww3u7XRk/VUpwRKhy8gSxcG5yZzAxcMLix2/4rMWTlNBFI7fFp0JpG3ijSMeGoGvm6Ih2HwGMudjknE9okYImCmy/AUwJ5o1Ee4M/Z+ZGjQhD1zpLgQyhijHes0SHjZh84nGKWqcQMlTVROQz9WmlKlMTOsOhzPxxT0QKQdewbinbLhRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 08:28:38 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%9]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 08:28:38 +0000
Date: Thu, 19 Jan 2023 16:26:44 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [rt-devel:linux-6.2.y-rt-rebase 14/46]
 kernel/printk/printk.c:2903:13: warning: 'console_is_usable_unlocked'
 defined but not used
Message-ID: <Y8j+xOTCbdlgI80O@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4911:EE_
X-MS-Office365-Filtering-Correlation-Id: d9249a17-882c-41c2-dc40-08daf9f72992
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +o0f/o4NKGgVLgFaTf8hN+7xaXchakjHkhekYl7nY1wwSuMFysW9EKVOp8jkwLB8Nl8OpuM1n7Z7XM7Xi0XUv36x3DqjRprfPWgGynYdKGOToWcg3Em/cabbskDvN+raC2pUqOUEk5UMZv2XvDlNERLZVbD3k0QJlkGoPRrTpp8664/FUnHfPUhUlacPi6lCdZpxNOMdAgdfuSLJtYV4ce3VF3VLaLRex/ZeMP3R4fDQDMuTCWd4UNDfl3/pDn7EOgKDkBMh4GSFbCIQS2A1yKaMb9ywfa+4X/hGUvZkICceR9/wfOe53lYCpy//tqSs5gOB4tXtJxu+8mjMb1aAOIoF0EbzKUIfFiZ7Pha/Ol6HUIsKGelcZzZ8gQLOvJn7RI1O/uksMlWETMhVKMxCg/DWx/1nHmrC1zHfjxHfQkVmTTA13fpVOlj5s7yRlj7KbcxWSC5xgCS+wdC659hYs9diWvOdq4/epqjcVCWYWplAkto1aGyDBxTQkfSG7lmCSS1T9ehyX41432tRHaWiumCOUshVXXiHMHEIQrYAX6fXaKYqoIweae+C9ZzIJRW0KTBN/20UEp/ri+l/bnEeE+7hqdUqirPwi/IGzg5XRj3HnOcWk0EYITPFEQCOxGsy5h3L2l0S3lcsjkDmbnfoblUqU6Km+WnJdf6eIPTNV5ppCPV/bdLyXWxhAnRlGlkug96kLuEzUrO/sp69pCVc0Dpn7FahWzDWa4oFqAqgDCvgi2siRR9FafH9GI+VM+DJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(316002)(82960400001)(4326008)(5660300002)(8936002)(38100700002)(41300700001)(6916009)(9686003)(26005)(186003)(6512007)(8676002)(83380400001)(66946007)(66556008)(66476007)(6666004)(33716001)(86362001)(2906002)(6486002)(966005)(6506007)(478600001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xg2tF09wu7vhmNGpuZ+EfUkJMdeZKql3G012jHCFCgVPYIfVjm2hmzoMSe5u?=
 =?us-ascii?Q?RYMn9GmDtzgpY/d/8lAvQFGhk4TjbVhaoV3hjVAf51W39dTgFtExhC0rPvEj?=
 =?us-ascii?Q?6GEJhB/UYAAeHK/5KS4vCMkZ7TwFtv/Df6GWJZ73159lsRtRMgYi3yzfGVfG?=
 =?us-ascii?Q?ciEw2ggWncrBg5wZ1oM98T8DdibAQmVSFd89Lrj/i62rSZhti4zCJTT8gtiZ?=
 =?us-ascii?Q?bQf/nZO9hc+k3Hu/cUhPY30tJTzYSo4K+C36W0VE6dsjWHbzdJdW3fQZyS/S?=
 =?us-ascii?Q?mY5zmxFYLRj/Qn/2HYYLQsQkdkryUzb/moFJAWBv4LWBYI86k/W9BUL6WOO5?=
 =?us-ascii?Q?cpWb8sW7KO7y8QRRmY7rTVQxGMoAkQD1wU0QNUl6WFfhFzlsN6CLasqgslX3?=
 =?us-ascii?Q?CoKd+wv33cIdzsRoRaxJW5thYh7cFGREqhMw7ZBSepnWAeLhWTI/UKurN4a8?=
 =?us-ascii?Q?E57bwC0V75hR6UJ6ItrYy4n8hjWjdglB8oM1MRP8DPYgq+NGevtoQqLcZY3e?=
 =?us-ascii?Q?PIBhAPbvbPxG8nPH1ou+N1RyGLylfiFCAGcpdru9XA3MTdo8D8Xkt2B/gIPR?=
 =?us-ascii?Q?ZoLSzOj9t8hrzYDdNGkm4NEWWuu+46ZBYdrdUCMqqNaocIbwkBdYp6JuuOVh?=
 =?us-ascii?Q?3wvhhXrsgCfQ4eNi3z0Mep8QFdBDhPmHVfrco7ORWCS4msQK9qjaSCiExzvZ?=
 =?us-ascii?Q?alTUGaPq7vSXbX9T1W9wVNcEI+8x6CsvlQFQuDWvAECpRIXWk9hHVPo1t6Ej?=
 =?us-ascii?Q?rlxsj4/i5eKrIuqURWb/atVeVuhkNpwjR4xEppM7913FRGC68rKGTESPHyf5?=
 =?us-ascii?Q?K2/hTauF9TNb6pHxn9riTv4hg9djR6hhsnLw8R0tR5HwtSL3+05+UGT0hkIV?=
 =?us-ascii?Q?0rgeSwkFsS8m76mdu87NG8TjpApe/gNY4gPfZPvx0nfWONanBPi0c3lyTh4S?=
 =?us-ascii?Q?zD+x8IBVeoE3gGqu/GpV/QZBipMPciKrUFTZaixgo65BZHUF9MP1KX4kRTxP?=
 =?us-ascii?Q?LSU9tX6wOK1M+3qTTrsNSjK+7VA5i/i2JJgKZdowLUm0MYZrAymwnfYtc4Gg?=
 =?us-ascii?Q?ZZPrjRR49Ft2WJ7Zi+ZLya7PiuYP/feHp/tBL4wIif8lorqWzSvvTL9qdGLE?=
 =?us-ascii?Q?xEe+Q+Xca8oOViVp/R+gBDrzhK3HVeIiLIU37ivnwu6xQJZb8XqkktJK2ipe?=
 =?us-ascii?Q?cQ4cfaEvO25FbZTO8RcqV7Q6h0ccluOheBp+kG4cFEr7Id97wMa1/XFEHpca?=
 =?us-ascii?Q?YTBGKowIeIKom+GflzegQVEmKwSqzSKXPdJMM0+4kO+vjylq+EGuNel6TsA2?=
 =?us-ascii?Q?MWBHqILl3+YVR0EoMaTu+fL6K+J0mymOEndEsZSSucb4vCJixbSkxibpyaqs?=
 =?us-ascii?Q?XsdBn2b0t2hrTE4W/xrV1QIvm4jvJSRrohr9NeE+3O90S2p5YEZvKIRZnwaz?=
 =?us-ascii?Q?w0AbN4BgIsWChZPt/8IssRJJoIaGQ6V1+Eyte+g4NbDE/K1XO++hFrr+LtiH?=
 =?us-ascii?Q?fr/2X47ZrdMpZ1/+3Kwfee8n5DZsMwLrfATJv17pAZHltDaycYuVX3eOqx+E?=
 =?us-ascii?Q?DQcQP8x0s0ul5Gme1d4jHqY+pMb0k/FrK4ppt1hE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9249a17-882c-41c2-dc40-08daf9f72992
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 08:28:38.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiSw3QiJAbh7iH1oNDACoUhK6Mj55IkRCDrPxR97V3wMbD/viEivyedfIvA7ZAqhDSC4D0DmHvfi9O0eckqY9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.2.y-rt-rebase
head:   bee0efc1fe1add1df7d677cee5a9c4c325196403
commit: 5342b8e20b15e5fb37e49de2435e62dd00ff20fe [14/46] printk: Bring back the RT bits.
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230119/202301191434.kRWtbfc2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=5342b8e20b15e5fb37e49de2435e62dd00ff20fe
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.2.y-rt-rebase
        git checkout 5342b8e20b15e5fb37e49de2435e62dd00ff20fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:2903:13: warning: 'console_is_usable_unlocked' defined but not used [-Wunused-function]
    2903 | static bool console_is_usable_unlocked(struct console *con)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/console_is_usable_unlocked +2903 kernel/printk/printk.c

a8199371afc279 Sergey Senozhatsky        2016-03-17  2902  
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19 @2903  static bool console_is_usable_unlocked(struct console *con)
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2904  {
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2905  	int cookie;
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2906  	bool ret;
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2907  
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2908  	cookie = console_srcu_read_lock();
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2909  	ret = console_is_usable(con);
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2910  	console_srcu_read_unlock(cookie);
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2911  
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2912  	return ret;
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2913  }
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2914  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
