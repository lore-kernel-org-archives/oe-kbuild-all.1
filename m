Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D5A93F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687163633; x=1718699633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vPs58xtZZVrEiKzPEHLoN6l8aB/hcwqZhf2wihmTPCA=;
  b=BSbOtvaSoKYMeA7yd4Kcy7bm2WRrYSL/QkRYXzOnh/AsywWqJ1nbbFxy
   XUc7EVasb7Eh+t3/GJPxMq8WYAacfe3SBcWxvKUwNuIFrFGUJ2Bs2i29A
   013q/zzMvBYWXr2aV+Ra4ZH2ayMquRlAdsILZXxxgmkjb1KnPL0vsYrI6
   LA4CIR6c+/Bsgiv8rojEgZ4vLgqwHRHYkW9SitXf3cLuVMMGmroeXNKAW
   nNePM7xRfvBP1QAQL3kijnJ2tnkxM0BhcZwz5WvY6eXKbJikRg8x9Dg48
   5Oj0dEKE0+fEaPXy+4Ga1Lw8+lUyOWXMQuV2Tn0iNmPg6KLOfsF0EwnuB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="358452186"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="358452186"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 01:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713594412"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="713594412"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2023 01:33:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 01:33:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 01:33:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 01:33:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 19 Jun 2023 01:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJmyVhVs+S65PHk4reAZCYGtSuPjif9OFfLKCqxMMXkiuNypdMIk2+3dTESe9MdrhHpNtFqIXe3ddyxJiZ24amCOvy0w94WjXb39tTgzUWvOPnQ4bpqdGGFVu1EZB3edbybnNLPPr2bWrZuSedmJT6ijMPX+pL1Fqop8OAFqxOGtaKiPFX2AVmVZapvlfz6HTBwxaAWFtoa0EsQ0j+O7AfE+iPn0o2fR4HPBSXeV+D2cZiSVtV3auLKPqVaULPoU7/HG7pVVhk2o/CKPrI4eAWxtgR6ucX/BOsroBXSMYuou997Z54ABdj+cM9Z5PWuaI6pIJtfz7Lwekze1wRxgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9QaWFFoRKYfEf6ojP7GEAcToZm52iwWFPd22/TnuC4=;
 b=iuB7xGCv4bfHVP0V7rI8NLFsJDXFX4txjYhizs5aSSfFpmx3EmHa8yakKarreq5x0qkI57rZOJtdiziCzyjwxCnkEivee3oWbPqD+s6tL3AZJeoWOFMwtRqFoWW3Sb3pOis/gt5hlw4LS5rVD/GIOTwYSJDUzunIOmEo4RXBp7W8t1EcvpRlcg20hmaXSeg2kEy/oGP/71AEEPSqJG6hCTP3Nm5TiLlUUkNIJ4/qkjImW9PrxlKIgvKVXnNAufOj5J7qZF1BLSHryLDn1zVw3ZP5v6fBLfDV8ufw2R/Z7nWSJOlrB/jVhgX8l7v4d0p3baRhb3gJt9oUz+1HsZfXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:33:17 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 08:33:17 +0000
Date: Mon, 19 Jun 2023 16:30:11 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Richard Weinberger <richard@nod.at>, "Sasha
 Levin" <sashal@kernel.org>
Subject: [stable:linux-5.10.y 4576/9999] signal.c:undefined reference to
 `uml_pm_wake'
Message-ID: <202306190324.eHhGGnWP-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ccd960-3986-4cd1-85b0-08db709fd469
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boBsEVq011v7tOhDrcCcreQhP7mFd9XJ6YavP0t4Pb/kFIMovdovKNj7SoWs6Oaqy8i76w993um9YdeeP0g9FUB/xUcie3il3F2PaHrbl+Sqk/tDGoM9aEG9Q1UmgGbp+xm5fv4zr9eyluXBPrrynon9bB9kaF05YL+yuM1Tlsd99ie0xiq6rK0oQRbRljENC6mMHjwfbbuql5OwcDXa5tHdcZatvKduifyEsLIPmPA/dwbsMQBg3MbohwDc3U8gwbF/7JHrPrYXBWKBSWZNQ1jpIRouQ3/SsWzx52kUd/ofepLYOZJYkpYXMzhS9DNniVMZy9mZ3WR0Gzi/zmzYCjWYgAoLyGrvwVeCQ+CTPNwVlWjdU9BTtxMnawRelccWVoG9FIBeTpNOPi3gYONOzVpU/qvikyHiDs5olSTzavxUEg9a5loK58HibpOPFd0mYYsF6p9RSpbqP0l8kkaNXJLz25dPQx/lwL3ia79L/ws//eSdg3dCss8ANbDs/Xfnb/aSN1ly1gVUjx36Rosjx8oFG5ZBOEhvVtZdRhyIp7cfgm1S4AhRfwdC9VbQPs6EPtI+1YxMq7cBL++2NhhKZ2DdVrhlr3jN3okWzCtYAXMHay3pNG0OCJtkBw+WHHXVvN4mAmJxEMzMJ2tvIPP8aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(41300700001)(5660300002)(8936002)(6862004)(8676002)(2906002)(36756003)(86362001)(26005)(1076003)(6506007)(6512007)(54906003)(37006003)(186003)(478600001)(6486002)(6666004)(966005)(66946007)(66556008)(6636002)(66476007)(4326008)(316002)(38100700002)(82960400001)(2616005)(83380400001)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OaSzsxr4nZpOtClerM2OmtGGmPzOFcxHBi4/ONIhZxexFlEYj5q2epOfcOZD?=
 =?us-ascii?Q?sFo2QzswazmksTIGhHmW/F2DaDYtcvwTr3S5kwKzbczM2q1iBSQrtS4O+t+O?=
 =?us-ascii?Q?MLvgIYLaM53bbxpFKqtler6rzPuYBAjVdIdoqmNsErAGegZ/9FG9QTwIIJzx?=
 =?us-ascii?Q?bAjSdX5xo1dSXeVcuW85w7zeZggUUDJYw/gS+TYgTWWGEW7/NvXJOrCMRzqN?=
 =?us-ascii?Q?bL6D5y5pPEFbI5cddhSlWB1UTD4t+nSw08+GgB9vk6G2oOxbeMNUJVc3AGrP?=
 =?us-ascii?Q?RkDdyqiSx+srXxB1VghDX5fQnwd/4ZvglljlMofCSGNeXTi0GjrEyMhE4haF?=
 =?us-ascii?Q?laAiDbAT54juUkBLmVdRneWRrcPj4L2xhWgMEIzyKdWo4PmcMoaCO7ZbIFbj?=
 =?us-ascii?Q?ASzOVW4n9PYihcz35oAgN3NjP402Z2xLKp3zymPw1iT/CC+hAnonFpLohJk6?=
 =?us-ascii?Q?YbY/9v3TFYEGeKqBbJtT2A0BzaRCLXVYfQAG7YsLjju0nCh10VClO1l3fwx3?=
 =?us-ascii?Q?bsqZWAtbmEFPhSun52sS2og0zpQeLOT4NoX7N3bUcLZKEuWhhD4/mo9yHDPs?=
 =?us-ascii?Q?rspJA9g8Fgxmeek1cvitmM2yqTFy+jeNfIuSZRbdL896Pr3mSel/P/eU8OIW?=
 =?us-ascii?Q?iGfMf2nBoHx1482Z/KFRXF0IxBaND65AGIasgsdz1iA/ed3cgmCFoBvpUjq+?=
 =?us-ascii?Q?zRZo79Dvs4yZ9i1jErAZ9Q7LHq5VwrVcnGyzzU3z3dA2lK+7tTNIokzVOyCo?=
 =?us-ascii?Q?+GZ2rEfZhsIvWK/qj1XTneXlrJUGPnX+CHfNPBgbm/4k2YkHYPFUNX4L3PA2?=
 =?us-ascii?Q?5mLCJpAePbPuH8+bOWaJTyT2bgSY3BLEQTJsvL3yh5vFFn3eM/n9+6oemfvt?=
 =?us-ascii?Q?RMdOvDf+vu0mLoe9FrLoi31mVhHRlyzvaLE7vPjJfngH+EDIiFFUdbsKC12r?=
 =?us-ascii?Q?WtCLIURJK5+v3xqFJVSWsaUXKhSzB89ZBWpcet4IJkICHeXnJD4qLikJk4NY?=
 =?us-ascii?Q?trl+bvvrqSppQp2tuEwPaJaZIaUBJhQ0ElDJ8iyL44nAefpTED0GLenFpiRX?=
 =?us-ascii?Q?1Fb92bLYD6X8Boy5pT1TvPXnKCYafsQHEM/TTF99rwcPED/boXu/xAl2ud5Z?=
 =?us-ascii?Q?p1IUmS7rsd8rhnYbgMiVxhv0nnyo1ACUWl86je9IQZv42JJQcZ+dSjGN/BQW?=
 =?us-ascii?Q?wGRE2+D79rmkiegfksxot3/XS6Hm6fsiIZhyzp44KycYmqLvhyOZUOUrkqzA?=
 =?us-ascii?Q?+Zz9u1s/gmxZ3w9hDbu382vN5YEsykjuOnYq9qcKncDxLC2MfAB4tDJUY3VB?=
 =?us-ascii?Q?eXWfOaAWCA7AFl5SIeOke6Y3s0jUcRMRbpGXDXPORgPUoUqzUbRXIg9f91gx?=
 =?us-ascii?Q?5suO6UjToUp7T5J0dbxe2Nkqn+kZeeg87DFLBNGYCTHL0puHOyQnHNEmaT1t?=
 =?us-ascii?Q?INeselx3zzST24QmuKXSGCyfmFp/ya7g+IyX05QLcncDWowMT7zJvE7VI8sR?=
 =?us-ascii?Q?kE0mGuDUPJlwd8RR8KRrBJTsR3SP6+HUauVDkN98lHBtjZs6TEaWgCNj0uoQ?=
 =?us-ascii?Q?+91xTw2yTkaGMpT6qrWuTtMcRBp9bO2oiDce3EcY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ccd960-3986-4cd1-85b0-08db709fd469
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:33:16.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNV91Bnyz7Q+nxfw/OkhnZNkO3eM+hhtG75wMPbulImHzu8gevzyiTll0LiEyayKM++TgW1sW1mzNKpRe5WDVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   a1f0beb13d9b8955e00caa48f909462fb70e6f73
commit: b58294ce1a8ac8e234abd991255b1d1905520aed [4576/9999] um: Allow PM with suspend-to-idle
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230619/202306190324.eHhGGnWP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190324.eHhGGnWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306190324.eHhGGnWP-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/um/os-Linux/signal.o: in function `sigusr1_handler':
>> signal.c:(.text+0x231): undefined reference to `uml_pm_wake'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

