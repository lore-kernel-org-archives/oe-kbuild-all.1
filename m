Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B27C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682302394; x=1713838394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHo/tCeLJvsx5aTQPAOpluBITFv0aqIeNY9o/0+i/JI=;
  b=Zx11ctXQ+5TO58UGPLoqZp6NK2rwhon37FSUVVGBrzoFyNFDn9YZbSG7
   yCF085mxfMStGqN4EnjWJOnmI+cXCfDDKVJzUJwWN/RsKteRMQNnwpkZE
   bn5lxsyfyvr5sl8ab5pP0UpB9I6JmVVyWb4lEQje8s1boXSa37TQmXGSn
   b5x2YXseAb+aPtf4TEcPsqKVRm3biciQCgeirze0gj4MNEP7Aqn5beGrt
   uhR1JrOp4AjQFI3emng8cxX3mmeyt4uJzT3WAChRTM7KZJwo5GGOIx7Os
   RS/eg8SRszEYXPXc2CrPFLM0JkUrK/3A5idW2wJD7R2kJ7N5mrYBoQ9g+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="335225740"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="335225740"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 19:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="723418053"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="723418053"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 23 Apr 2023 19:13:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 19:13:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 19:13:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 19:13:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 23 Apr 2023 19:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgiYhVvwBlTxd0zgJQSvlQ9Ezy4iVYNwpXdc+ZnMmLPuCzEUlJSSJRdVGZbTEvYHbwmw4aoPg10jNLuQc1TGKA7Y37HiG2ELqc8P8BmiuA16jwaxkx8aCmMazxIWvavilh9Bs0XkxEO0hJB+lpvXR3E7oXVFnJcjpz+5IrMRsYMPYIZnliPyqCRKWJiCpkMrujoDgmHG05FDolXk8tXa9Jlnb4kbyXX9tPYzGeYGZbkUHODYDMJ9ggKdO+rW8otKvbIdiN4KFwd3dqzqNEjy6Lfab+Iyk4tLyziL0eGqHsS9iB7Z9SLLavJgp1UU4vqa70wKobS2IN7x5iLzUMsSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTgGNmmptnXrK1VRSoVoeC9lRCmkfAHlu/45anQsjY4=;
 b=MKSBhgZz4DhEocThOq+sXYXSsfK0HZ2NKLmr4bDDps0G9svp/3e5EqA7ryQxxzZVTZ4uefmLhkjqhYc5EvOLCOcdWZ25m4EWaksRyc4dqrOI41cPpdM2Y+Ichkbrl0mD7Orc+IAxvApUVqXtsNNE4jDHYiw34MiOv2AlPqvg1UDfpIX1Zgq3v+N2GEBNds48gBLuVrdTVYQxtSlVfW9CfEakTVJ2weXdfm3P5v6eAk6M68Lf/oj/i74yKj9W50B5btVOEGu3jLo3lKQtPGakPJMgKo81D8Hriu6b1mgQkPegx3WnfMP2EOZp/oBN4haHBQ6sfNm9HPLz/OXJ2LbcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:13:10 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 02:13:10 +0000
Date: Mon, 24 Apr 2023 10:10:10 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-6.1 7355/8168]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more
 than once.
Message-ID: <202304221942.sCJx2Sxv-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0228.apcprd06.prod.outlook.com
 (2603:1096:4:68::36) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6e5a93-c6b1-4ed4-6631-08db44697370
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rbj3Wld0wqzfYBIraCwwPpoxJyumo1y40Db+HJkTtCHGqAjrsIocj1iQE1wy2qtce3ANBDELp/bziYCh/hzenD851neWRdjk/JduiOmLM6pZNT2CRsFx2F6B7qbN2/R/2RxlwW1a+b/Uoz/2I8iVzfJCaSon7pt5mXvs3oPTLxKb62vm2sWTUr04MkXYDbF3C7f3DYi2QalsJXWlWxhH14fSzD5EaIgUI5cZOPxA3/yVmg0dX+t3sAMOXXOPChU9p+D9IMmj/7nqLn+IT5NeZ+crnfHYcodCZybeNiV04l+/gFD53kKAHaeuTas4qAs9Sx5fdjhLvfGWbYnHA/as9MSfLG2Dq67UBg8v4roCMYyrfegQfEHcMl2wPt4ydBEJZRCVt7rccdr+fdlJIBiy5Upf82OpkgvRHzIYKfrQzc32EAPZWBcQVf/DjpkzIZUY+4se8hW6Mam3XxRJZK9KYyIPP6UzaRoHSZh8ttgH4XtRkRSo7H9wdfmK4lstDS7V/j3dUwR4V6gk1oaPJn6P3BF82rfIsiMrnVeE4y/cBPvHpaUX1cth55vkwVgHF6qjgYebuOXXqeAHunhlEhCK4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(478600001)(6486002)(966005)(83380400001)(2616005)(6506007)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HCXo8xVI/ouEDsr5jDCu1nz4E1MpsWFd7AG3JY0qCKLkVSakhCKjTjoMOH/Q?=
 =?us-ascii?Q?dQQLS8XOZutp3wP9P3glrpLIlw+rk+VGg/WXbo5BZT9HmzRxfuwbI0+NbOjU?=
 =?us-ascii?Q?fvRE6Z0XX7iA2oTDtC7OKLfLJwhn2yodwB2b+SmrsR/rQFfHssCynJrbyQzh?=
 =?us-ascii?Q?1X8Gfzk3tvN5ahIAOsHtd0ZrwVwgxa8t9AJQyOBF+Qa+7C5NEzEy0DW839nB?=
 =?us-ascii?Q?xUOsNGlMifXmLtYNQiMD7KqlcZj5WKeeTxgMS3g+2luUemP0blrnXQm4FV9b?=
 =?us-ascii?Q?HZ6I+KnrDkU6OKgJLi9O7l6u7sZVyUyVUQcRNg3gCwPioLr6cIp4ltHfYZRW?=
 =?us-ascii?Q?LseLimkvS8SA5rtdoj7Zvpc1H0cBbXAk0Ourb8E6tlp7e6U+JOhk/6M2eLUe?=
 =?us-ascii?Q?QU3SEUI2oQtbl4qmszrL5/ScfeSdSUIE+vHDAYPz0YI8/dgXcjv7E7Y5EqUw?=
 =?us-ascii?Q?WBO1ydquyxmtxrD/2TV6Rb5xhNwKcr+E7Wk+ic/WeG1jaDvop9RwGxzUb7Nv?=
 =?us-ascii?Q?bddcHmv2mOrpuao2eARaBI4IE9OznidqCb4sR2UMFrv+e4vQc+R5NMgR8n0Q?=
 =?us-ascii?Q?elBGI3ZUIBbKoobN9CQ/kxBYYMyTrkQL+YppyhNggi5M0H66KBSRphfYy2Zy?=
 =?us-ascii?Q?+myDIBWn5RtcSkZ+/D8me2TRChAEyCle9oTnErsDrxX6BrvEnTCWTnSbtngY?=
 =?us-ascii?Q?I2re5hzckPfkhSfNeeomjdqtGx4n3Lc3c45oxl/LHjNMthcEm/ZftUJIKIzu?=
 =?us-ascii?Q?iCulbik5J+OhiX/Zdhf2rV48UiuELSs3TojAUPlUe8fWqUaUozGnq+tMF7g7?=
 =?us-ascii?Q?Ckdh/2AASzimVy/UsisZBXMcdTDLWnGN753wPqeZznKm1uzwFtvW3DhuKXpk?=
 =?us-ascii?Q?4fyzd5XM0HB8oU9XLzHVAEQPQS0JIz2Jee3pzLHyJJiT1tFQLUabw6HerQMh?=
 =?us-ascii?Q?sksmE6nqRRE/iNJq6XQ86zULr7H6nYIhuasBNMjgNFh7M0mbZQw/24D7g2Rb?=
 =?us-ascii?Q?RvjcBW6oem6zML2GdVID6Uo2Wii8PWmpaqWMuGlCymV6+1EhfwMWULlSwUer?=
 =?us-ascii?Q?V0FgM8PsruoqnT/2inKJlvGk+86+7Iytuyv0ZbmOIp0MUrsi2Is8sqzwnEIe?=
 =?us-ascii?Q?2vOPxe+7Zin0QH5yJkfJiG30BrpoIn6uDl4EgG/qqtPEqDCRXjesyEDEoybQ?=
 =?us-ascii?Q?fMTEx+YZ8/GZR6WXsnZHIkyGn5C7DCHv673sOxcrUpsrG1c2i75or+WLsyeZ?=
 =?us-ascii?Q?tJXAYRPGhfZKOMg7o7KbqesCtq4i3d4iC9dgyvkzOI06Lz1wLELs01ddITYO?=
 =?us-ascii?Q?X1L5Qg8m8PFffih8uBkIYteJMjoU8i2BQq4bTJfn2KuOtlzNf2EagQjnZkQr?=
 =?us-ascii?Q?MaEufMJ1qMceIrU8I76x7D60TYiGNkE+97aKDo8Q1/b8UpVyuBI/AkxBN07q?=
 =?us-ascii?Q?iO2W5vvLyPGVKj8m/QFcU61wplIInotzymqNs7zoJcONgm6qoHnYs8x5KqJO?=
 =?us-ascii?Q?2OzE3mn7Kj49d3UH2oiAomxB8655LegaUqDcf0nYXiZ/UWFYBZagSmjdXbNC?=
 =?us-ascii?Q?Qbqin7JaGt94n64z+dwfCKxGX3QlacqGl/PxmI3K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6e5a93-c6b1-4ed4-6631-08db44697370
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:13:10.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5m9PcbU+s5I8s559xkG/hqSKno/pqsQvGy24fsVyExo1e1G5B5H4bNjFeaHJeMAc6JF0jhsVo9941UlfvsFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: intel.com
Message-ID: <20230424021010.9CCBmvdsXIYUCe8pBhh0FcZggGC9eeqH46EmzFIUn4Q@z>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   04e59759943e2cafd39e628f46bef090f2e0c228
commit: 21f40a9a49c1caa0305c22b83e3609e92b9a5979 [7355/8168] UPSTREAM: drm/nouveau/fifo: add chan start()/stop()
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202304221942.sCJx2Sxv-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than once.


9a65a38c456eb (Ben Skeggs 2015-08-20 14:54:19 +1000  24) #include "chan.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000 @25) #include "chid.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000  26) #include "cgrp.h"
67059b9fb8997 (Ben Skeggs 2022-06-01 20:47:32 +1000 @27) #include "chid.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000  28) #include "runl.h"
f5e4568991f60 (Ben Skeggs 2022-06-01 20:47:21 +1000  29) #include "priv.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
