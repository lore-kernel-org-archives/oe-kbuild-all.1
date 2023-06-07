Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4EEC7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 05:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686117370; x=1717653370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zOYADgULnINIoXi3u7tbkqtveU39VkVizQtKBE/yaC8=;
  b=cZ3izuktb6LwFdHc9QN92G9BhnMr4pmBnT/MSgoS8osBBFuU1kLkNI18
   oD4MWv6ySAsfwtNHJ9JvfXNUydANR6uL6cQLq2/XtszftFh+/YIWQ5HFI
   sjS+S+D9fVPlPf18Sa8cLQgxFHXShPed7DUlbgO6zD6mhpKpNvup7VUV5
   cBqAeMtcp1ppdagdnNwfOwa7giNoZU5QUBDHn45KucZknJSgpqvmRmJFm
   74OV7Yocuh6g4FDcsMlEFocrJzjrINvSnc7ICdwige6EbOyEfcBvbOSR7
   ptFxRksfDshdA/L58q8XXXaQyc8TMuTBpwzvlXepEgrc1O1ajsj14mlcN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359361693"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="359361693"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 22:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039467047"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="1039467047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 22:56:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:56:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:56:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:56:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAQShqnWy0TDzLewUY5DYN3ySv+SGAYyhoi5VXIMcYlSpWOp3TtBjeA3V6R2o2ohUJn+0N+ol1pPpwWbaxspBZZOqc+1ICTSuLwyjMNC9t5dJxiy09/ulckVedbb/DXjk3WyaubOCk0d3SFUjkN8/75qNIxxaGi9CA99dE65je7AJ1yr5giQT6MtyXkOrepAfisM2CKyX1QYiDmnprFs/s8A7jAmgUFb/7TRfxjXWr8AAbkVhyf/A82Xp9EB8VFws2wCI5ZuSEY41LEbst3aGUQHAcMpFyE0pf+add2HbRtZ8406p9ebMu7DytBhPZPa2i9W+Ti8khAJ+4IPq/I28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlSh8Ly7PevfIrKDLaQG5cj58PgFt3mL6Er/2dIFzp0=;
 b=jGtacqIQ1iRyJKTcXK29OuxvfRhw0JMYV00mivisF5k16dzjHai8v6EFpsTy4ptMq9G9Dqa0FbC5ewEOhbZuliIUST95UGeXkhcpYt2EK9cesSfKM/dK4+vVnfM9BBpKcF8dw17hmt7oKM1lOPWH6IIJ+4BaJa7WHS+Qv2Zkke8PuYEdIqm3dS55kdHOBw26irLruy4G6T2etBhsBxPkyMpl0UZDM7OA18yiIUhH7tVSQRBPI9yOEYj0+BoFqNoeikb374XgyVqrh10AWKT4YRZ2BpxMm5/0pveFzoddRHZ3/ENuBPWofX+wecuejt96JW3/QCCq2aO4SZJzKbnlnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA3PR11MB8023.namprd11.prod.outlook.com (2603:10b6:806:2ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 05:56:07 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:56:07 +0000
Date: Wed, 7 Jun 2023 13:52:58 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-misc:raid-stripe-tree 23/31] fs/btrfs/raid-stripe-tree.c:
 disk-io.h is included more than once.
Message-ID: <202306031816.QBGkEO6j-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA3PR11MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4253d386-a5c6-4c45-9a3a-08db671be31d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCv9hIovAUWsnmNy2cFgW4sRgU+Kt8MYsNMqYJ4NHGarI11lftYFNVA/fF6GU4X7uqgtZ9VgX4Uh8ij1obYz5BuseiAffLixXamNYo9OTjxBA4hG/tyzVi+pQC2y1Qqyc3AKDAVZ8yo46eQT7VnH0tJtRGjDC/IDpF3kjKeWiv/hR79+Syl8SBXmmjD6MIrqff2YLRZNn6/79/8LdBeyvqV5O1LGrpoV4BZ+xGQLNsFx7Zn5b5svJhK2RENcbxeFO+zM8HiSpFBgva1EQlh09/iYs4D3+tVqK9k6YZpAg0+4R2MPWYSIRh7hAgG/7fFVTM43fjWiLL2I9ZuHSjuXUarPf1VSfdIMoY08nxjTc8ycTz8NQiobR0rX0rNaU+a5HNN6b/z8EUgxCfeyga3XGrFKVB20pzT961S8kcDO7sm3gj1fkyENQ185nDXk9ZNHvVxcgC/w07doNMQ9zPNgCFCJagk5V3WEPCL0Z5iJboRKHHisZbjUfkWk7wr/xmSm7K8U6WFCGZxEoXD6F9BKfDdAhibyRQHOY2/AhFOYeGlOfwBXETnC+zEFc9UGKeVW4JV0B7YzHW3SThrV29dY0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(82960400001)(38100700002)(6486002)(41300700001)(6666004)(5660300002)(316002)(8676002)(8936002)(478600001)(966005)(66556008)(66946007)(66476007)(4326008)(6512007)(6506007)(6916009)(26005)(1076003)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbYTw2ffzeEvJWnCKfxogt5CAF3yTa1S26gXpRii9nZ0oROQUF1tHvHaC5Da?=
 =?us-ascii?Q?iI8hCkf8Aamc7JIGc2nZF8U0Q00V+ezUtcpI0JERfAPr+9rC3GDbIV5lt/+Z?=
 =?us-ascii?Q?CNgILeAULES3OS4rGjSDi2vduzZ4sOAgUizOM3YSDlNgsUcR5B+vI/6ezAid?=
 =?us-ascii?Q?K9mNof6N1CxeTgaAYT4pB9zSD61mWahmle/3akpO0tWgnnYL7d5qZ6AqH25F?=
 =?us-ascii?Q?Ta7syqlVeoDpS98H60B1UKV+UUQOwFlNLs+qzoM6N18aplUJBwcv4HWYCQCp?=
 =?us-ascii?Q?aiD8xeaC2Az+AnBfpOp219VwuxvHY1ZJO6+VJvbJFxCV2fxgLvzkVU0cy2ct?=
 =?us-ascii?Q?gqNX9Epmx0LIbalFe0ZXgb/3q7ond2DxpW20A0Zwg72eSUkKewHPH5IR2rLe?=
 =?us-ascii?Q?viwLlY66dKrr4w+XIkHtqajptgzeE2GuuMhT5gQAWv3JXxLBgLRu8lqD55+5?=
 =?us-ascii?Q?F2CO2cvQYOHHkouR78eolKqC3HECQOy/zZAvNiushT3tmnbDCsFiKN8iCY72?=
 =?us-ascii?Q?BoMVInND3O0KsDkI+b5Zyeb/U0ypouVC2tFzqC2fjs2+tWF4bSbm3ov+IbQw?=
 =?us-ascii?Q?5jZXt4Rcg74UpXsXz0l6hBhcyM9ACYTFbGJ3zDBBverMhKc3sPDF1hWkCroe?=
 =?us-ascii?Q?Jgh3NRoK+qd2vGsGsHOytGWhvvaeqGBUXn0HMrCDPgqJbcmjqCyiOwjINiFJ?=
 =?us-ascii?Q?xOwpAUqepZc2cMP3XeyWK7BMiKoCSARsfi2Q3yItIz5Ns5h+9vzS/3kqxCJG?=
 =?us-ascii?Q?EJckuYdczFCds4Qh2LbvHAUU71NxQ1//YPx1Tfp2PtxDCmti78fluwt+WDbB?=
 =?us-ascii?Q?UFJ3KZ7LEY0k4MiRno5fJnz0wSq7L4rGiEeNZIta3xbrcwxiBWLnBuYuCLPa?=
 =?us-ascii?Q?8C/IscDxd/ISDlJG78HpIG6F5SchmwBUqJdVLEWwZkTSqokj60lxLU6Y+238?=
 =?us-ascii?Q?OZGAaPjDqQL5RWofehIkYtndqr21mOxsstigSJ4TpOGQy+y2fsXrzjEY6AwB?=
 =?us-ascii?Q?jK8XfvQyjz1KUXyFR11L91BXHFDnRUxx4KMVx4yR0avQWxEoEwapaLDvcvJI?=
 =?us-ascii?Q?5kJSPIycUejjmbcI91eTDxFCIGI9u+QyKIrbAhJJ6wiNTWu9BhkvRaxUk75z?=
 =?us-ascii?Q?iB8lB0ckYCXSye+2bS1S9g2qVHdGcefI+ZKTUhjJLRgldmbYS8ScFpMupJG+?=
 =?us-ascii?Q?XnYeBmFAzJmyMXHbHPlBhXzRfaqpgI694ceb7gmVRgNLRr1f4UJcRoLRv23o?=
 =?us-ascii?Q?eWL8Eua+CEvbokiym1xFhKmFiP5/XLlK4/VwFPz4fIVkxBW7ahahC/FLx1os?=
 =?us-ascii?Q?Mz6mKe4VJ7I2aHaYV8DCd9ZFBZu2tCRYuIZcDfkN2EXefbne0CGwX0WugjFa?=
 =?us-ascii?Q?jw+tJ67Dhx/WGdu7CbbmuGduQLbAqFOTev3XfBsHl6DKpniLw+3VlYO4GCNG?=
 =?us-ascii?Q?ianr9zPEykz75yk7HuwjQpqodFu1NGwTFJ8kMEJBQn357uaO55poARm+R1js?=
 =?us-ascii?Q?Lol/RyXn592obaWFc5qqLwY8tU3DrI0xOh+IVOUJw3cZPpDQ96scrhtdhQOx?=
 =?us-ascii?Q?pfNd4xCYFouh0NIiwM5AtSXKOBG8wtKbtI1XH4EL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4253d386-a5c6-4c45-9a3a-08db671be31d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:56:07.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0x7+gmfHWK20VxkT1rdiW3ach1okgAQQLOdDD3+0OaFrQbtmMJxnf+f3Xf9AkbrdZT8IrWtxYQaSAZPE4upSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8023
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/misc.git raid-stripe-tree
head:   7f755507b2a1f921afadd2b041bc46829e2bda2b
commit: ce887cbe59dccd694a7de29794258d6973d2f42c [23/31] btrfs: add support for inserting raid stripe extents
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306031816.QBGkEO6j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/raid-stripe-tree.c: disk-io.h is included more than once.

ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200   8) #include "ctree.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200   9) #include "fs.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200  10) #include "accessors.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200  11) #include "transaction.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200 @12) #include "disk-io.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200  13) #include "raid-stripe-tree.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200  14) #include "volumes.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200  15) #include "misc.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200 @16) #include "disk-io.h"
ce887cbe59dcc (Johannes Thumshirn 2023-05-31 10:30:39 +0200  17) #include "print-tree.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

