Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4FF9F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8GCov0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700631456; x=1732167456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrzuBd4ev2keNN9NY7MOQqBF90WCpa5Xsu/ElWVqkHM=;
  b=h8GCov0xUOxz8HbbmNq6r5PoGf0kaiFw773TKUjMmiY+pm/5Pitk+Gck
   C6VdDHwY6peXAMy5pjzNo3f0kbQ0QhcVerxAGVP3eefhwKaUbmYQHyGfO
   5uIh/VAiObjvMuSiO7dxN0nEGevJmF6qmCHYJ45dIJh7/sZMC6DbSqAWQ
   zQ9z/zPH8OLe0L9ihPoFqv1tbVftnwe1yjmzUK0RAz6imXnSHHmTNj2En
   sgaxeHCGsmrp4muf8JAdzS3guira5fto9uheqTza3aVVESl7O+1FheH78
   YRrJn0oOfLi0JG4zcQyPkya4FczL9K6wS4Iq5lEyjfjefsht0l/3x7Qeo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389141524"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="389141524"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 21:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014135562"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="1014135562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 21:37:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 21:37:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 21:37:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 21:37:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V836JwuPa3hvqv3bSSNgCeJRdAWPyItpMeXitz5j2XjatG7DV2FmeggMbyXJYUHsBHQMXyHOiklU+K4lHBbUTXs/QADonPRfhi8v16zf2UJXt9+nMdOCa06spvdO5OvHFKWzc/cpY5i+Vk2w8Au9rT0qnfLxBQbmR8Oq18T5bjzxhY/gLgUJCF0i5tA+PA3ezQC1eWNiZAa6HdvpX5Oq0QibEKO/aVClH1zQl3SnbseT5YF6DJiUaUrSYwOQCaiIWmUPUWSQ4GlPW68s6i7KN7fNq0rDmgwc8W0Fh+Uqw2/r/1Y6AdckLhrrN3ecWzxsn3ubI4kMmik3PFFa8vzp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vb1B56vwm/Y3SFA5mx5JYTMLTD2pt54VSZNL70j925U=;
 b=mvlzi0o12c00AiwIxwktGHdrXIVcAx0E/LealtWIzoJuH8cQueZtGMSg/WinueOPtrPmVP5hNQzUsHhO0qyABJF8gBQSH/Zib51XgshE3YB5J3xrygqBcbrMjzqCcgpj/o6Oa92b4OjPJlI6lHGgiBLxVTJsTaLXaamGWYaxaKV3OvWyG1tr5EB67/Hqpm3LAs+MjWcLhnSHSDZ4914acUbJK9aEjO5KK6ncBiV9QdPT4w6+fzgwsjPzuq4Y+9imbGsWAwUAMtmKzfU0aoG+0oc2lAZkxB3CeyQ4x0pLZ9X1okLSoRWAldasmbXQRd6Ws8Yq+k9ENk7j+JiZeJmSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 05:37:27 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 05:37:27 +0000
Date: Wed, 22 Nov 2023 13:32:50 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Paul Moore <paul@paul-moore.com>
CC: <oe-kbuild-all@lists.linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>
Subject: [pcmoore-lsm:next 12/23] lsm_list_modules_test.c:104:22: error:
 'LSM_ID_IMA' undeclared; did you mean 'LSM_ID_YAMA'?
Message-ID: <202311221047.a9Dww3vY-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5815d4-93c2-4dfa-56a2-08dbeb1d1ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0N+Qkh48hxXxEOxuYboxj5Au1b8z/KRxomDWHxNmVG/AuhQsHgPGzzGoS5MLnBeZES02kYMh0jOBYQXplO79yIS5dCnz0/NpYBMbHdj1jWIoUBhzHLbQIXzPp9OOaOseqtNw+hVacJF7wHKTyYmeWxjqbPcoxNOqg2WBBWVgmwXEie2gebtqcL9Pz6hOAt4meVnEGNScRA2inpIaP22T/S+u83QVZzL+a4xgRfRGgE3+7PfqaFPbciVnitmuINOFw22WmXnCadBSw/CkfsPwN9HHbH8B9Ce/nHDCqCxzadPw8kJJhk9I2EBVZ4LJu2e8MK3YudN+/j0ctZT/sTIFT3WvqILqsz3KD/fG+V4dUCH0wfKKTLRTk1rctkxRwdjszeH5engJo7LejLh6oHewQB/KIz9z7sq3UEkbkkDYxyATTW8ckUwT1+apJqB4JsqT/IkDQ/eYgJNqGFJDf7WSbI0jBU4JsIlOpsLAVm7zVCdRz4swIzoId8yoBVJI6Avg3CXB8g6I63tXXKAiTVwLV4XnI97/2eYaxrvUPYnZbuxQJ5rnMOs1XDquBPv7M0wUyvWRxgH2P7fCbhg4HjLPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66476007)(66556008)(316002)(66946007)(6916009)(6512007)(6666004)(83380400001)(6506007)(2616005)(1076003)(478600001)(966005)(36756003)(6486002)(38100700002)(82960400001)(86362001)(26005)(5660300002)(2906002)(8676002)(41300700001)(4326008)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/iTZual7EaNblV/svAiRptSvlOsgaKHy72sNwn4JFgnWfQzpwgttN6DHHy9k?=
 =?us-ascii?Q?u5r6Tr7WWVZWltw58507e2EWkxQOHKHbDpJLAKBygwAIcrxLROIA316lhoq6?=
 =?us-ascii?Q?4fb8usRn8+ev+gCWXNWcTtX0qqSKNiLA+zGGTwAT8/FSe9AdN4UKiVOcjtQM?=
 =?us-ascii?Q?fIRbS9Pe3xkSw/l5v6w8pybIpmocQBIXi7wEqkX17nhI2iNP8wVyNm2p4H9S?=
 =?us-ascii?Q?UvMT8To3S86pbN6n1vs0Kp1L0mxhQYN3erjPci/EjQ3T4gZyKIg1Eqt/JT5j?=
 =?us-ascii?Q?e/ty1UFZBEIVxQi6fQ/q9MF3E7BRjpkqao19yvUVMEg/E3sQilydNFZLj8/T?=
 =?us-ascii?Q?Ixus4YChJIdn+lMe6z4VZatIcDw1f4yIATJxX2KLC1P1lPLB/z3Qr0yKjZqB?=
 =?us-ascii?Q?ucnk2/2amZeZIuh23Ja/NuzwT6tFf2INCs02Tkvg/a3f8wejGXhzjKAclci0?=
 =?us-ascii?Q?85AxtXsxdW1tcN+c8B77wGCo9cG1hs5bJlS5X/8lT2VJL5zJ8YU89iy/NYoG?=
 =?us-ascii?Q?yFYM7XuwSpHTtB1SEMN5szTnlnb6u9Ugc6SFAiLb8ftuyxS4B4+Va4EuEYkH?=
 =?us-ascii?Q?kWlmDW9ohIta6+r0zpZdArgPA062vacnYZehKzhArgBsAqAs8tMUKPCCbjqy?=
 =?us-ascii?Q?ssUsrT+1dR5KounOLFTdJefgymcOI+1jKj8HWv5fw88n2dABejwlkOQVbevW?=
 =?us-ascii?Q?KIIgpSRGMsubVpirEkevZyIjXA9qBHCU3Hq6yqle+siAvty3mv28KW5vAMri?=
 =?us-ascii?Q?U66JrgMEpMd709maChd4zCpOGd+PdHAt4p4H/FUUfhAQoaZvS54LtfuytecM?=
 =?us-ascii?Q?Y4bJei87HghKvfbMoCftEcRPn8OxwQBaoNojNxrcCJU6jfsKLW54GMN2wEtr?=
 =?us-ascii?Q?hz0Yaf7Fva+d8c5j9l9jdWo01YG/iEJi+Rr5W9vnPY8yXXwSKG5EkkOyef2x?=
 =?us-ascii?Q?qRQ3v7+nDeakOtePu7wo+sFxHDNMA7YX1ZXl1cjiyYvusNROWEDdO3FC8LM/?=
 =?us-ascii?Q?x4zCJDPCcoahJKvRtlwX6tT9DvdM9AZgMM3x4scxjMJ98xJf5h6/Vxz0SpO2?=
 =?us-ascii?Q?iL5u+IP4vN3eucOD/xWd7uEBcUMuistVoDmpDJPntHJDclQqeMRgNae6+xqH?=
 =?us-ascii?Q?WAPWg3fxOcXrS3qlIY1AjU3bx+ep0RMTqod1B+NbZyZkl6DqMhn2JBiDZDeb?=
 =?us-ascii?Q?4hC5ir+B9LqzTFCFt7kKxAgZIeZZmgLRYaFi8KWdzkJDrDBhvzqv+yMjL7zc?=
 =?us-ascii?Q?Bk2Cpgy68+P+fKT8Ma7227bhydkB14auesD+H3BfygyT2be21IL4puJ4dwwC?=
 =?us-ascii?Q?TA8hABee4T3J6VYSpcfVIP5IykYGaXM+Ll8rB2VJFRmAfLmITG99LYSD7e0x?=
 =?us-ascii?Q?CzUGC6HrCr2zh+R2rpuWifJFgw30YYSMr+nTxH1CvJZ4xMjCNKZqQZ89UbSf?=
 =?us-ascii?Q?VRX7wI34oyGjM9CuhVqeDc/YFnz2JXUFNpSiLJvwWCYug6QnnL+Ua63vTUki?=
 =?us-ascii?Q?U3i1Gwhhh0ayhYgDGSMbTbUbXSPeKHksoOTSihnSIPQSsfCWyNyLhXNs/OCr?=
 =?us-ascii?Q?6BDDzXZ0L/qePw8fOveU9ousbpGWM3EANLCKKa2b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5815d4-93c2-4dfa-56a2-08dbeb1d1ce1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 05:37:27.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaIAFhO0LOV6RxqdUE44XpAhmnWbN/xgKfv208+cWo7UAIS1VcCc3uyw8Iuw7bCWqA8dnd2VQVhCfZ0eklhTsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next
head:   afe576a62062cf944372fff2b6510b621ec454f2
commit: edd71f8e266c7ba15eedfec338864e53ddde1c25 [12/23] lsm: drop LSM_ID_IMA
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221047.a9Dww3vY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311221047.a9Dww3vY-lkp@intel.com/

All errors (new ones prefixed by >>):

   lsm_list_modules_test.c: In function 'correct_lsm_list_modules':
>> lsm_list_modules_test.c:104:22: error: 'LSM_ID_IMA' undeclared (first use in this function); did you mean 'LSM_ID_YAMA'?
     104 |                 case LSM_ID_IMA:
         |                      ^~~~~~~~~~
         |                      LSM_ID_YAMA
   lsm_list_modules_test.c:104:22: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

