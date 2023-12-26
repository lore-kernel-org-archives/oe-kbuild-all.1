Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505057FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 01:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLWC3dqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703554142; x=1735090142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MhwU7MsHus/AELCaBMyrNj3j7/FrsPRyh1e+lntBOII=;
  b=hLWC3dqNBzXyptFzglsm/+BgUbSoa1NBoN9Umxjfp6J7HHM78OymLwdd
   YRuJ/i0RcigS9jCQXtCs4Dmpdp9LBGFfYwGY+ISYczO5cOyF2ZEUWix1l
   3GhNfTlrppLKmIRcTtN7A9/26KjDT4BiL0FsM6f8OkvzK7L62wzHzMdDS
   3lqQ69qO90CfY+aEn3WizrCAYs4zPwoyM8HF666npXQr6sHTFhQgnpKRw
   vXATqYZDC/Z6TI0Ha6HJ4emUoqkt81tIMQGgNnRhzTvrXsugY6DtYejJd
   UHnzz6t68CQ5bJCO9X7iol8um3VXz2NnaXACpgnvwcQ3GY+sw2qUJnQ1E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="17875756"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="17875756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 17:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="1109250609"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="1109250609"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Dec 2023 17:29:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Dec 2023 17:29:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Dec 2023 17:29:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Dec 2023 17:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJvvgZ5LS3AueFij3/DwGmCVN17jky00DVaTmHKoZWg3lOfS5o48NEhrs5A9YcJcLwbK0FIo9nUdmbnp2e9kLS8UERyVh3OqDFXghXDPSf72D1FYhXGWKscuU8ENghPX8vcgsqfg14WtfOvrJ+5z6zfGmGQ5UVFmpUZU3KKqIgO0Li8kItrunBnX3z0CxfIa1it5Hu3YUfuWvf4jjDjqHYAlQQxW8WRHe22n5BqoatVqKl9vzXuxqPsnv2FLP2RFAuRr8n4kJyUjy8Ew8r4F08iTlxqPatYPG53ZbUt28YlMT3/0Vp51HeRj3j/aT5bzctjXbEDQZttcfKIVnhOA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/+tyniw6t6AUoa2gbSWKxmgzmqY85nGxAAimq6+Jsg=;
 b=Y3Ult9zaLL2cUA/2sgFTt3OxcmVVBayfGhuBdQSD/ANLsz4umCO6ArBw7+V10DwWpv21j+zdMhU+0+K+1nA0dJtB8Dd8LJIxwuNIT1NAowtqErBU+mZ3wx9X0gPhZDZV4g0CFTfNRtpdYTiJ1liFkYgM4Fo+in1zjS7cqJjgDfTmswIs748XEvLbjRNO6gkNcDdqCV08pzBm+T8tFVedWeGHV4wBqLYBO9R83NJMknWhsmMdUGHxg6hCcuAP/PxFHvicTwAUnUaIjLVdiJHkwIHyBrRasbhATXor/L1/dMiMr9LNk781lJhwroQ4r34zBQJJwviKfIBuDqdll0kjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 01:28:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 01:28:58 +0000
Date: Tue, 26 Dec 2023 09:24:35 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 9800/9925] include/linux/sched.h: linux/cache.h
 is included more than once.
Message-ID: <202312221348.6vs4L8y0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CY8PR11MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e69b98b-d00c-4b76-7453-08dc05b20886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLPIRA5P5v1s7V9bwblYA7lUq2Z4JiRMO+VMKUyZl+IfWhHlp0u6QfOaeqET+QXkm84pkHzNYPfAlCHwtQiOfOMGauuyDRcMDaHqIZ/KgaL7bG9uM+exKgerfytmgp3dEwnfasGA6iBe2+YzSjT0mUbTPAZ99JrvPoxDOsxbcZOBsKEQUXzSeF01RVx2qMzXdPjsajMdxTZzCvkgOHmrIQ2WWqkrU8sOfASreY+OtIgL3qcw+R/KvcKzpnHbItWBXd6unM9pc9TW1NBU1G6P16XqHiiS9STIs3CIsw3rZGKlWQSlNWTaGHc82RhwHmQsTevevylflnpcet4pOpy06VFg2qQpBxQoZLDMheouL2HTuR1Wh9JjVjNXU6shY5YKQfNwj+4ikJurZjwvgp5Tsq19HbpgIs8XVptdfiEJa1CA3bj1vYPwJkP+/iIt+WvmDZtJR1BjdjRInfOPaXrGdyuXQvs0COB7BGEjYXsOPVgNski1W7mP5Sd5xeV08tjc15lOK6KFsd95vNSJOoWw0eyhAZS3A//95jMrZoH/KwakPDinv+vDt5kDnOuykb9jTaF4HnkA1HXloneTS0AOQ5WguwNIq7OXwkTUWlu+v2sUfjCZzcm+b5IiEC2lMS3OKjt4kekH+2iyiQ4a1ijJoSz39YQcqcotuO5s7C6Bffw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(6666004)(6512007)(6506007)(6916009)(66946007)(66556008)(66476007)(6486002)(86362001)(966005)(1076003)(82960400001)(38100700002)(26005)(83380400001)(2616005)(41300700001)(2906002)(5660300002)(8936002)(8676002)(478600001)(316002)(4326008)(72063004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x32oUX8eALm6KRkVI416aA2qMDJ65QQp8qhrFoAsbj3L96IqDo1X0mJI6jQb?=
 =?us-ascii?Q?b5ei0SqwNOiqe/5U1qJhJUjpESC/NzyV/feooECn8ioM0Eexinda1a6smm+F?=
 =?us-ascii?Q?zxCGik5LbTfFIQTSaFmOyr0ewYrCZz6GSuBdzlNP0GcDYoDIYOTkn8lmVhdl?=
 =?us-ascii?Q?eTlcp/uJpVE+b95e8t1b98DkpWaqy3wn6mekADYdPRA74sQNYMW1ZFJdSZOI?=
 =?us-ascii?Q?g5/+9uTXyubOZ5pCdjLt5sMCVHZFSJ8Jgb5HfB9tvSB0MGOohEiTf0mmRvRj?=
 =?us-ascii?Q?UE/A1aWzz2AprjbbRt/3poaxqvK26axjHf8kkPKRVMZgTONFL2JnZWia252h?=
 =?us-ascii?Q?p/H7F8ZMVNp/oW5T7TJtwRtmT8GFjySMPHq8+BwnolckTECTgnYmTrvoc5sm?=
 =?us-ascii?Q?2Qb59V8XNXR2jTme0bmciUKAdit7gnCtIsPyAGDxpmZihWoNf99NEnI1zGSi?=
 =?us-ascii?Q?/RXeUy3eePDLybPl5nFD2840fotrt6+dTgxe6EZ2fN3OD/5zhFT1GTKBHQIs?=
 =?us-ascii?Q?yc9ppCMfEG2V5Y2flXoCfvfnuHSgnfgD33PowaTX4HTYkaY2WxBgB+V1M2qh?=
 =?us-ascii?Q?wWcUptgdIc2HbD7MEdNZxJZk6VVnjkDa4YMmZRdVtzT+KSfo/MOSJEn7OEb1?=
 =?us-ascii?Q?dTi/aEFOwugiYBrn8Vx07YSAZl6WHx5IReGePFPgAAIBNMWNZcgNfQLbpxNu?=
 =?us-ascii?Q?/TjeiAHvuyrUdwklsqHLcTeS05DIWcSuqT9HlCqUIhLevm3ir+FdPIfTcbk5?=
 =?us-ascii?Q?TaUAS+tsBVgzWH3t05E5vQlpi0+she/Q4hAXedRYlAKobyGPubXH798RLhiV?=
 =?us-ascii?Q?01e9QbSigfwThEjSHMx2VEhM2R5jmgxgTV72pEGMFteDnDw50EWWLlV19Bdi?=
 =?us-ascii?Q?TssT/mkORH3ehRbO8tdoIVYtc6KLimPAJ88wVUjBJ26p3btdkgfyaG/DNbJ+?=
 =?us-ascii?Q?YcjKY+M8NdaV+XkMIQACbILgRIb1BWGzhVOPtUmbFGpLGvPTIkeEKzkPmu+e?=
 =?us-ascii?Q?fYFFu9DtzoKlD+yxP7GDEiB56B7JkKVRnmqiInKF0bRPfZzAZmepq7av3aD+?=
 =?us-ascii?Q?uj66arwDTKLSiEQhS+WKKlWEEf3mTvDA9w/azJPfCZ2CpAcshYXHHEWGufS2?=
 =?us-ascii?Q?dQsCLX9YKrzQoKxOqJGvROanM5Nd67NykEgr0VItaFN0qDtU35zXonJm+NEl?=
 =?us-ascii?Q?H5KHmikBM2Q8OgubPmj23QdGbTwf1jLalhn15pfgSKIoGJQFQUbmOuWM15bT?=
 =?us-ascii?Q?xLqfK3ElS2vWNeIH+1vZDZM5HteoM6OUOZjQE3yC1wYcvnkgeo95AiMvkRNG?=
 =?us-ascii?Q?c3pNi82PDFk8yD8fY7JyBOWlVPM8fq10yC/dM0fbS5YYkPfPXmZARIXx450b?=
 =?us-ascii?Q?L5leWSBclNTIfxYccMuPju83y8nmTCYQFlzpR4tVbLU7lKsFMTWU2KsON0XY?=
 =?us-ascii?Q?3p1jvH0rmb3k/BWCZZPnIWY69RVqjp5oc8V4GY3eJnj2QUquFa6WwOqilfKd?=
 =?us-ascii?Q?Akq+irY4sBP7cX4ej1Oj+RMkYplUyNYHfsUf8g3nqiJ7eFKYypbXvwp5kYTy?=
 =?us-ascii?Q?KZ6B5uaoM0iS0bpwO5yd9D+P1eBiNGhl4Npfwr6q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e69b98b-d00c-4b76-7453-08dc05b20886
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 01:28:58.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2zBSZDvq/bnQz2u7w87gGor+qfbp6+OOx/Xe8UBi2eWWLWcxPBpJwovziEm0OtQLSoG1qJe9WmCK2Oln6WfJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   857647efa9be89a13cf8963c7e167fab062b28bb
commit: cbc17801d0f5ebbbbf5cb222c0754d2a6c9135bd [9800/9925] Kill sched.h dependency on rcupdate.h
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202312221348.6vs4L8y0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sched.h: linux/cache.h is included more than once.

vim +16 include/linux/sched.h

    11	
    12	#include <asm/current.h>
    13	#include <asm/processor.h>
    14	#include <linux/thread_info.h>
    15	#include <linux/preempt.h>
  > 16	#include <linux/cache.h>
    17	#include <linux/cpumask.h>
    18	
  > 19	#include <linux/cache.h>
    20	#include <linux/irqflags_types.h>
    21	#include <linux/smp_types.h>
    22	#include <linux/pid_types.h>
    23	#include <linux/sem_types.h>
    24	#include <linux/shm.h>
    25	#include <linux/kmsan_types.h>
    26	#include <linux/mutex_types.h>
    27	#include <linux/plist_types.h>
    28	#include <linux/hrtimer_types.h>
    29	#include <linux/timer_types.h>
    30	#include <linux/seccomp_types.h>
    31	#include <linux/nodemask_types.h>
    32	#include <linux/refcount_types.h>
    33	#include <linux/resource.h>
    34	#include <linux/latencytop.h>
    35	#include <linux/sched/prio.h>
    36	#include <linux/sched/types.h>
    37	#include <linux/signal_types.h>
    38	#include <linux/syscall_user_dispatch_types.h>
    39	#include <linux/mm_types_task.h>
    40	#include <linux/task_io_accounting.h>
    41	#include <linux/posix-timers_types.h>
    42	#include <linux/restart_block.h>
    43	#include <uapi/linux/rseq.h>
    44	#include <linux/seqlock_types.h>
    45	#include <linux/kcsan.h>
    46	#include <linux/rv.h>
    47	#include <linux/livepatch_sched.h>
    48	#include <linux/uidgid_types.h>
    49	#include <asm/kmap_size.h>
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

