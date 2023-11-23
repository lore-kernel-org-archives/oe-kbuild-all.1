Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2971C2AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD5/YutB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700729664; x=1732265664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvCxKUO+lX/YishKqUdue6ePNL0Sq1V1DdU15aqP0DQ=;
  b=HD5/YutBep4fHfO+7tOXkV5USLM1faKZJY7/RKaML7gNGQVYR/H/5Pow
   NsYV08/K/ONc3M7lG/02m8yMwwzqBJ8OIOqVgDffdetkoSIpkDjDTo5hs
   eVKaRh6LpD73acV6xQHKcCN7JePOaFQckjWOEMRyGPKkITe800G5sMeYT
   90jmbpojr5Om1pr5FFelYJlZRd2ClB1NFH8XItiECQziVfiEuemGj3IvB
   ad1vohSiAoJUNcq2mbxil6ju1p+gCLjUGH8YFY+++OmtcfZcA6SOfzN59
   TPBoJbcSVgUl3cnKB6AMC1CZxP3+BbTnTr9UNO83LVEK1GKFzoEH8Y65l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372385036"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="372385036"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 00:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="716988757"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="716988757"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 00:54:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:54:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:54:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 00:54:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 00:54:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTkxUd/JQgodqUgunvcmys91wTxo2cb3uUC4Yez/xdc8x+9SmaTuWbHUQRc6wRjduC4u7mfSScYGUyyepQA48QuMJmlIz1aI30J8TjXxxIvOoLKwEfc0yflpptAuEBgzKizzRZOZAgay473fbko9Qj5bLyyAcHn4tsZQUNU5L6RR/u7+aFa6TXUpOo8sFG0PP+KCqyCL5hHYXJX1cMet/rnRU7L6agZSd7fIBtqz9sicVyu2VSx2Sc7pv3C3ABEgNELVEE8sNCk/Jn48snUMUPONKoI5Ml3llTPL8WzoSqnln1Zbg84AFZJKnykqAoyA4OIC6HPC1Gut4s85J46iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oIeQ/1cca005u3pyhyAHuRNzQFZpkenSs+lHe4CYsE=;
 b=bwcq68YnIzVUF4KM3fOVUkmFXexfWs83N+N5j+QN2uZCxn8Q7nV9uRZ6yrX12JeW0+afh2J1IbAlR/I2Tel7sDPDg9utAfIoMBTcuyrfC4wx1YokAzwhe0MrO45h7X+5j00Yz7AWww+SvZDA5NLYT7NBXRyx0h8bbENE07aTrflLoBHKOpPfjwQjTXyKzF6cxvTOR/MiBXFBrAxdgMQOHLZynB3HACOjpA0jdVPJ+TZOChU4W8+MhsElAqwEpEPrPwCI5B/bpBKnLB9sqerHSh4UHBNT++gNtbCLjkry5cUtqEMGWS5/RUkRnsk7WZweh2YisyTbY6cVrCMI33kVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB5440.namprd11.prod.outlook.com (2603:10b6:5:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 08:54:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 08:54:05 +0000
Date: Thu, 23 Nov 2023 16:49:28 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Christian Brauner
	<christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-eventfd-signal 5/5] fs/eventfd.c:57: warning:
 expecting prototype for eventfd_signal(). Prototype was for
 eventfd_signal_mask() instead
Message-ID: <202311230426.b0wY1x1o-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: cb302910-5a4c-4238-7523-08dbec01bf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXVGnJLD5exSCUsrzRf/UZVEZBN0vUvb5BMjN7mv5rPJIob0C9PyYbTql8AwW52PQsU3jANNNd8N0lkH7VZlYVtUKQqJRTQ1k+UZ8P4mkp5ldBOlR4GJGA0NcktG4Nhf5ZrJdeQtUeoG+RgK/c6Wp8P1XKT/DF7iHiE0KWS4nQyQ3cgL9+tMIXUr5CLAxL2CK/QPoyvz4kO3dE1DkTBkyCoOxiSp5ujAPOJcVt9aWwV/qhO2EYQ78Lfgud0c1Igk/q71gm0xjRqiGe9eSiHYCYZ/ev6hq5wt0vM5ncVaITAJps81sDqKiN8W3qf32FkVpOn5OrTx6ktRUljslZQg+7DWLgdk+Q86/6jMrLhDgFEcejOXr+GA6Dj49onYUL8AlVQ7h687gFkXQhbvuECp414fF9xeE6egPPFHAlKz4r0ehInZY2afANrwlFXzV4oKkHL8WyzulyX5fU6BWRpcgBhxcla4GtZojAKtmkorun0ySJ6vHAtbrHVnhFswdV9682hnBmOSGZopEGnuKS3xsLaM0FT6nrQ7VPaImQfkdZReMv9fuG95VEjm0nGpbZba4eTi/zDLg42CGuAIaCRq1Jpj+rp8HvwcwWo/f+CrYl0erN1PbvG89RWROHjpW6eBaD6N6TYiwlGMyL4d1ZCNGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(186009)(451199024)(4001150100001)(6666004)(4326008)(36756003)(8676002)(8936002)(2906002)(86362001)(5660300002)(41300700001)(38100700002)(82960400001)(26005)(6916009)(83380400001)(6512007)(1076003)(2616005)(478600001)(6506007)(6486002)(966005)(66476007)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DG79PbfHl36HHX3F/eM7DQAQHqQmqjgU1ZdVKlBjkK/9e3STvpaqg0+hT5ZF?=
 =?us-ascii?Q?KvnU1QAWbAevFJHEGfIAMBZFuyR1E7fLd3O6Ex7fFRTQajntqNF2BjKhJbWQ?=
 =?us-ascii?Q?8SUVDdEhs1FvRLLtshVTRkiwyafaphqyAWGYniL0viQ5R+1PGB9pArOJDCTP?=
 =?us-ascii?Q?N+QscfbZ2CMY2i/wQkUXA82q7/NDWlhSKxrQHJYJmwlmvlQxO/QNscqkCMlu?=
 =?us-ascii?Q?cP+kGU9Xjg3tBCFuBGNf22Gt0oNdZTqgS8fv3hR2G2XjhDwlk8MXyEn+vekb?=
 =?us-ascii?Q?mz6/sRYphd67Jn/Pr6T7M16PpsIgqPcUL2JPXAgxgj8NryjEuPHZjgnZAnIJ?=
 =?us-ascii?Q?VH66oft5biiLuWYzRV0TRgH3U5Bl00FKMr6IoDhUJiIaqS0uNY2a1kfTIeD/?=
 =?us-ascii?Q?8Uwt+9eYEb/ZfnpCpSq0ub4LVMc93crF3nI68JD1VE7U20vzALf9W7yfoMZr?=
 =?us-ascii?Q?POZROb5DO9bRxz70jaYaeMNbj+3Z55NC1vZtMw3wSnU1cr0eoyqRdUFRxKKR?=
 =?us-ascii?Q?QMY10aFJNmZVu9JI73+tswhjrMPEDsVl9OiK3313w24h7K2Ps7suzKx3f9jh?=
 =?us-ascii?Q?aFDCe5V5qF8K2fId17Z/rSyqpayvbwt1zhhMfvBYYxlYU+Nqa+HiFeG8AuGH?=
 =?us-ascii?Q?WU0o9ehUudPfE3pmz8lbMkeSOEv8LjBUCUp7Y7/ZAnzb/tlV792JlmxvbIjX?=
 =?us-ascii?Q?RnDHAobmdsizPZuIr2gwi4/TUtTZGbJoYMD2LYvMZTHhfmQn5nC5ILgBGKM4?=
 =?us-ascii?Q?xBcl631vxRHTy2tUXFqe0dJmmh56ivRiLuqre4QEghSNO1oUTe/g9CYjNeah?=
 =?us-ascii?Q?J+9ZpUMFGl3RW+wr/LSxjx7PTPl8trfypWBG1o6+m5FHjvcAFmTOXgcGHdoN?=
 =?us-ascii?Q?++ofWvF2IF5iBddjefo+D0S3X8ygV4q0WZe6efZS0kXnd8uYD+woOdKdHNBx?=
 =?us-ascii?Q?HDqE/vmgXmP7/EHl57u+sGluEpOchZpnT3kArk7/cvjl7DBmvjJl0PK+Xj6x?=
 =?us-ascii?Q?43iqKJtvqjDsVjCwb0pTd4pnSJI4Amav09kXbRTNNyQsdMmndXT6lwbKySpz?=
 =?us-ascii?Q?pFtCs4T3AXusek/2vM8Moe758NW0FkvHopTTthOg+5mwOXKmqov25CxKDz9M?=
 =?us-ascii?Q?aIi4LwYdZ5lHIzrbrIzYlEPjyjU588Tluch6yV458XhChpzOkK4RFfnG5+YB?=
 =?us-ascii?Q?nGNo7O7iI7rNx+r5jAgtEz4fZ+UtmIkFLEopRsE19w3dlgJ/lbMljUKmiAiN?=
 =?us-ascii?Q?a/JLDZ+sPbxr7+N1FHjfw7DNm4pKcqh7Shj/dEJySkthQdVbTn1GR9CtSXzT?=
 =?us-ascii?Q?nRpyKa17dOJAtirWHFL21Ebe3YjpsnMB4PPhcPwfnfwbCXKmApdEDyn+5joO?=
 =?us-ascii?Q?bQadKINRrdO6wFbZ9IeSZlu2ilnMRwtCvxdMx3Xa5taz1Isbn04DwzyItDex?=
 =?us-ascii?Q?YXsMVKOT9Cj2dMrJd+uxxu7nmnAGQOgn/1fEB3/ZaFc7x/XURXPy7DzlCVhv?=
 =?us-ascii?Q?kcp2eKhHIG/z2sDo3lqPCUmvs9eCTjMm4HSLRGddhJYqnyWphgUFQh82e60A?=
 =?us-ascii?Q?MlIQ6nmxNSDUJRy5GyawgryvtiMaCau7Gq2qp9g6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb302910-5a4c-4238-7523-08dbec01bf24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:54:05.1778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpP9wm7zByDGih4zY13seCGkKDrygHsnHDHyeTOv26ixsvNeSFtzYvSkoHwYCZLMqJFftvooTdcJ/lW2yvQZwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5440
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-eventfd-signal
head:   57ceaa6ec25fff4e0d916e587377a96ffa209507
commit: 1e2d01f4ec1da4b0a16fc8c3b28f6db33c9672b0 [5/5] eventfd: make eventfd_signal{_mask}() void
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230426.b0wY1x1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311230426.b0wY1x1o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/eventfd.c:57: warning: expecting prototype for eventfd_signal(). Prototype was for eventfd_signal_mask() instead

vim +57 fs/eventfd.c

e1ad7468c77ddb9 Davide Libenzi    2007-05-10  45  
1e2d01f4ec1da4b Christian Brauner 2023-11-22  46  /**
1e2d01f4ec1da4b Christian Brauner 2023-11-22  47   * eventfd_signal - Adds @n to the eventfd counter.
1e2d01f4ec1da4b Christian Brauner 2023-11-22  48   * @ctx: [in] Pointer to the eventfd context.
1e2d01f4ec1da4b Christian Brauner 2023-11-22  49   * @mask: [in] poll mask
1e2d01f4ec1da4b Christian Brauner 2023-11-22  50   *
1e2d01f4ec1da4b Christian Brauner 2023-11-22  51   * This function is supposed to be called by the kernel in paths that do not
1e2d01f4ec1da4b Christian Brauner 2023-11-22  52   * allow sleeping. In this function we allow the counter to reach the ULLONG_MAX
1e2d01f4ec1da4b Christian Brauner 2023-11-22  53   * value, and we signal this as overflow condition by returning a EPOLLERR
1e2d01f4ec1da4b Christian Brauner 2023-11-22  54   * to poll(2).
1e2d01f4ec1da4b Christian Brauner 2023-11-22  55   */
1e2d01f4ec1da4b Christian Brauner 2023-11-22  56  void eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
e1ad7468c77ddb9 Davide Libenzi    2007-05-10 @57  {
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  58  	unsigned long flags;
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  59  
b5e683d5cab8cd4 Jens Axboe        2020-02-02  60  	/*
b5e683d5cab8cd4 Jens Axboe        2020-02-02  61  	 * Deadlock or stack overflow issues can happen if we recurse here
b5e683d5cab8cd4 Jens Axboe        2020-02-02  62  	 * through waitqueue wakeup handlers. If the caller users potentially
b5e683d5cab8cd4 Jens Axboe        2020-02-02  63  	 * nested waitqueues with custom wakeup handlers, then it should
b542e383d8c005f Thomas Gleixner   2021-07-29  64  	 * check eventfd_signal_allowed() before calling this function. If
b542e383d8c005f Thomas Gleixner   2021-07-29  65  	 * it returns false, the eventfd_signal() call should be deferred to a
b5e683d5cab8cd4 Jens Axboe        2020-02-02  66  	 * safe context.
b5e683d5cab8cd4 Jens Axboe        2020-02-02  67  	 */
9f0deaa12d832f4 Dylan Yudaken     2022-08-16  68  	if (WARN_ON_ONCE(current->in_eventfd))
1e2d01f4ec1da4b Christian Brauner 2023-11-22  69  		return;
b5e683d5cab8cd4 Jens Axboe        2020-02-02  70  
d48eb2331595224 Davide Libenzi    2007-05-18  71  	spin_lock_irqsave(&ctx->wqh.lock, flags);
9f0deaa12d832f4 Dylan Yudaken     2022-08-16  72  	current->in_eventfd = 1;
1e2d01f4ec1da4b Christian Brauner 2023-11-22  73  	if (ctx->count < ULLONG_MAX)
1e2d01f4ec1da4b Christian Brauner 2023-11-22  74  		ctx->count++;
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  75  	if (waitqueue_active(&ctx->wqh))
03e02acda8e267a Jens Axboe        2022-11-20  76  		wake_up_locked_poll(&ctx->wqh, EPOLLIN | mask);
9f0deaa12d832f4 Dylan Yudaken     2022-08-16  77  	current->in_eventfd = 0;
d48eb2331595224 Davide Libenzi    2007-05-18  78  	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
03e02acda8e267a Jens Axboe        2022-11-20  79  }
1e2d01f4ec1da4b Christian Brauner 2023-11-22  80  EXPORT_SYMBOL_GPL(eventfd_signal_mask);
e1ad7468c77ddb9 Davide Libenzi    2007-05-10  81  

:::::: The code at line 57 was first introduced by commit
:::::: e1ad7468c77ddb94b0615d5f50fa255525fde0f0 signal/timer/event: eventfd core

:::::: TO: Davide Libenzi <davidel@xmailserver.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

