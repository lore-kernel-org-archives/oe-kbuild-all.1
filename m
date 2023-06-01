Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F064B4C83
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 03:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685589872; x=1717125872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QppBSbnDOB4oS1tn1trTDPqbzfurs5k/IiXef/zAagQ=;
  b=HsV4fq2kn54PFHMCl6yZjTPwpaHhZjHJq7YYx3bUvJFvg/qTCX7X1v/e
   jBy8l0d0uS/wdl1oG4ZftFlpqAe9zQ2uQ09rPnIWHUCy80BkXRIMDtcw7
   Z8C8ScdTrTScQ5rOUh+BcxNJRrWp7QqpOKLxAPFjU/6cinESXZN1eef4X
   McBMoXz1wHT5OSfunDgSU+I0hx4bkvBKRSsKPrTPoEJ9T6VSsAP0GQAit
   F1WnFzT1L1qI4EVRdJjfONNpQ+MB2/LPdrw3NtN0xNkuZxhkiQPSo4PwQ
   Z+czMlTSj7hWZtjWGP0VS2liVILmvuvOTPE9qG/rFp6l0ydW7QBsDriMW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383704851"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383704851"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 20:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684670916"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="684670916"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 31 May 2023 20:24:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 20:24:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 20:24:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 20:24:30 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 20:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6gquSoulqGJDIFB1n3gJJkyKNbJlZUUMNNrQwzyqih/s3gc9H3OhtLjr6ensNKEHsbBSpKRtOrsIz2vaY9E+IEo0GsTHB/aAUuL1kqx3iBe4YqWtx/g1+doAUkZeAzBmPwJprJJ4cx+nHhs6HR9gaqGtDfTKc4EjLREThFFoiSLVeM/XXr8arqmnclWwKHWqZJ99fSSwFxInezsEL2R5hp1z1KusJ8rhE8s0QiP21bFEcuVTl96bCvT5GP9GNmKYklm7EjkEYX7LMjxnZjJvbPTe5oAuGT5l+feEuD+LtPOCozBj7MHL85IjTqQy4ZMu7t0PmgXntZ1x79p6w3N9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15yobOv28SIcvfF+uPJKY+bnJ9yHVDbxypg7VDlViVs=;
 b=MB22K0OLq0gcAqvylVNUC13aF2dFwG2+gkzP4qa2fGh6SzbvxacfEkP9fol/i/XTVzZ0eTPXq4TEP/VQCW0RRoyEFkF6Orqz9OFfwmsKKxLbyXRNVOo+HZNf/ZlENYphOIHnd4/ndGhIXnyY//QGVB6sYEchKgiMBdXg61c+2CBY8uagIrrogizEauZYc7CKceSA+fEzAoahfgQuVumuENefwuq33EzzGfPcs67pGiZRhvX87YYl12qzU1heNl89wKEUlf65FCJJSoc5NdewoSSxaHx/Rwv/GLJ1iY03bcIz4IFyeOdLvvzt0jI2CCY8jUtV6jpJNk5lETcgccYwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 03:24:27 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%7]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 03:24:27 +0000
Date: Thu, 1 Jun 2023 11:21:14 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Yael Samet <yael.samet@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Zhou Furong <furong.zhou@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [intel-lts:5.10/preempt-rt 5518/30000]
 drivers/misc/mei/dal/dal_class.c: linux/device.h is included more than once.
Message-ID: <202305210951.PW2i3owL-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: acba45cc-f1ca-46f6-281e-08db624fb455
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+jN2E6Ze4OrPDvAOqRLvwudPMoho6F51DKDluzpYCRCZIy0QeurCuZepk6Tl2poVgODJxTp+JBIWXv5On19vvLyBL/jR6KyWHj6vPzyCFEkpOqXQXrhMMjRFdK0Q6X+o65UwbVMOH25ATMDnkTjgT2HU0s6k+0k7rIFpRLGZteCUlFtBJCmURVQ0L76gviA0re3Wrm+QKxDGjlfb/wdXnezWKbUFAdV2N4Dv/MA4SzcTcsCfbvD75s84q/jKvtcNoTgRlSHAyehloeIeGQzD6wPOV8HOZMgAvgRTHJHx5TBJpQUBQxHCwtdUZYHnuPuqp6RMctVTgAdh134dG7o1ZZq+UIQ5XbGKhkD6FQSwe3EKVZqxypvZWPGweSLNdIgMGRcdeb5u0AMrcyTDUXZO/ItQZrukAwQ2nX0YK3+jiM/zgUeXdKvlfqAa+FDh4LzyhCcnxiQSWiCCC2iGNQAx5I0eRI7ddUd6Agwu5v/LCMf5R0TfwLVqgcg9DyMbWyZCwP4OIIwnOdK3SiYPsPxEqWjXRLa3nnj0Hlyz+EpbzBFuhKBV31KijH4kSvOxZnFKVll2uxNVGu3dWruUtfT1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(37006003)(478600001)(54906003)(8936002)(6862004)(66476007)(8676002)(5660300002)(36756003)(2906002)(86362001)(4326008)(82960400001)(6636002)(66556008)(66946007)(316002)(41300700001)(38100700002)(1076003)(107886003)(26005)(6512007)(83380400001)(6506007)(2616005)(186003)(6486002)(966005)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ULcqUNuUzmWrUgNqp14QL2UipBhXy12qJothWOLhbLlw59T601PdLUPfnfT?=
 =?us-ascii?Q?a+/qP4d52Zy5P5QJ2kPJJLGBlmu1dI35m86avBx47bWo9I97ygwG+767fkou?=
 =?us-ascii?Q?/juX9Mcm1ywViKhTHwtUWy67Vc3Y/axpo1/b1fnSnL2gfOnSCutE1aomuXKV?=
 =?us-ascii?Q?bFnM8yrpd2wtF8S4wczGKQVmThj0Ot7v1CKNVIaBCSlHIvLKKb4ngYrWkGLl?=
 =?us-ascii?Q?E92HJbWNllNo5FWsIMB4EW3NtPcEWjjMvOyAaI+EpsnwLmRCe8n/FVT8MuoY?=
 =?us-ascii?Q?F9+ntts4oXy5nkbIIUbBNa+yen+bwxclTVA6Z1TzAe5lh4GwQSrAY0NQH2w8?=
 =?us-ascii?Q?vqSvzwluQtlXp1AYgMxirLVJ9SN61hOvIVTEwey6KpekGcaGM3+TYoF34sMi?=
 =?us-ascii?Q?dRVlitISqpYxnvex0kqNi4/lpKC51K7SXqlmKgJ0xPrufV2LQA2My8P1ydU8?=
 =?us-ascii?Q?VAyBD4jQzQBXpkB3aGLQoL2zDhmKeR83KYfyVGhpjGol+bcEZcI+mLxp542t?=
 =?us-ascii?Q?a6yy71HvgObzDtug7RG8YX8L6r3RI3AhE4JLryIODYfhXevObUIdQ668rsps?=
 =?us-ascii?Q?GmqecjS5xlgl9cxxx6o4WF7QzTyGkRtmiypP5x9NP+0t3MNoWBBfBkHgjs5j?=
 =?us-ascii?Q?jspp4yn0rEp0/f1I/Lg2O0pOsvalqSRd9b0d+3qpvb7fl74ZMhvwaA8FzmLe?=
 =?us-ascii?Q?TS84Z7ADI+umHLw3ksMpMGTnUDc8HDrz6Ng3P9Cl/dGUAoRnNG/QRujMFwsN?=
 =?us-ascii?Q?S+bgbxlmYTNId8PLqGRxOzBXNNaAUqbX9G2kFqGp/huIIgwjb2pMatw1a9su?=
 =?us-ascii?Q?sBRlP82/z5P7xtz6ZkDHOIMgxGk1npKJOrVaeCxMEAi8k1ZQ/lsewMHwUuwq?=
 =?us-ascii?Q?WVhIBaors8OLlw0DBOWnLQMoIvbFhdlSA1m1ID3K2uXZN87y717dn/4Cnvjf?=
 =?us-ascii?Q?KJq+zLAY4ARnTuu0OIV3LpC048MKMryHYtHevQ4l5DCNpabyX3hC3Gz8S5Zh?=
 =?us-ascii?Q?eUCCQNwGTwr7C5ixXO10Cl9ye7HTsAOLaZAgtGUoK9FKzyj6JXHtxDqha6bY?=
 =?us-ascii?Q?8UdZo0iO9kDNX3dSEZeBnc4vJZZcxHTDSnM/hbEe5pkowGa74dNOE1Ottsec?=
 =?us-ascii?Q?srdIeQBPDYDje25iXlmtFcEkTyhTBDYs5FOu/j6oupNObqdnbMwsMTpznRC9?=
 =?us-ascii?Q?8XPTRFHTjB/fLtfMhGwYZLHA6bQJoniudqD77sCWtPuPx8tV6S5utheKeqvh?=
 =?us-ascii?Q?qIaZazy0QsYKpfCRh4D1oeyYZFu5F3LPZhziEHAV3biSoJvM3KNHoFmFZ6PN?=
 =?us-ascii?Q?659utw28EDEti48lBtGvZiRRv6kOlSEdy09hOlJr0seUNLM+k7XOZ4mE5JXV?=
 =?us-ascii?Q?2xRH5Yljj9g3Kc2BQohHWVHnA19FMs4WihL5lcAnqiWWlvl2w8QUiBOs8F85?=
 =?us-ascii?Q?pmWlgDgLX/dH+mrMsywGeo9VyZRm47ZuibZsZqb4YTjiJ4JV/aI7Yj5bYJga?=
 =?us-ascii?Q?UkjytJETaZnCWvxq0gmVeaWMVY8vqR+6Egi8Qi+XGMExglZUDJgHR/Slk1uo?=
 =?us-ascii?Q?CAn3kfFUEbyg9PGzwOVKM/Y24Cwh6qZMSHyksMQv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acba45cc-f1ca-46f6-281e-08db624fb455
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 03:24:27.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YJnXRld1UOgk/L8fBL7lFcfRRpID1Agyr/CM63DbDbdGu16eRXhCaXi5E227ORJBDeVa8vYalBsnlfbGQ/0ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   6f211f0eec79ebd4a63616dd92fe79e50e39b81c
commit: 26329679d1a0646f9ea74c24bb4573d180e1dbd6 [5518/30000] mei: dal: dynamic application loader
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202305210951.PW2i3owL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mei/dal/dal_class.c: linux/device.h is included more than once.


80425cee0b016 (Tomas Winkler 2020-09-22 13:42:58 +0300   8) #include <linux/kernel.h>
80425cee0b016 (Tomas Winkler 2020-09-22 13:42:58 +0300   9) #include <linux/module.h>
80425cee0b016 (Tomas Winkler 2020-09-22 13:42:58 +0300 @10) #include <linux/device.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  11) #include <linux/fs.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300 @12) #include <linux/device.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  13) #include <linux/init.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  14) #include <linux/mutex.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  15) #include <linux/wait.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  16) #include <linux/poll.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  17) #include <linux/slab.h>
26329679d1a06 (Yael Samet    2017-09-05 12:21:49 +0300  18) #include <linux/sched.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

