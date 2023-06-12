Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685591FD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686552329; x=1718088329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kevnPU6jwKje6X+2h3FAUFtJ9pBHvJBkYH8GigT+Rw8=;
  b=ImDp4qHkP4Mp4LvfvuKyHzOzylvTxrX84CEAAvaKqBqFAWSbB5sY2hYQ
   2GjiRyN+SzhAoy6mEUElS3zXHmH6PBsR2U1NjYtP3pljLPJXjUqf1Fa2V
   OU2mHL3M3dWGHUwXtXtR9JMtVM6iQTa5BzFZkJcVwT4CdtGac9CehlYLQ
   UVNy7+kEx1301KoU+itQi5dzZunvlz/KQlyXqUCC3aANAls6W3uNqLu5x
   4Nk0RZatRBtup7i55ObW64ugkBk0DeIMTGq5/kuhUH+PRL4ylYFQWuCHG
   mJE3tiPHma6t0jKJzgETZRtqni4SlvooIv1wyRb1UHWq8aV9g5KIEhd6r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="355456158"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="355456158"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 23:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="661459251"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="661459251"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 11 Jun 2023 23:45:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 23:45:26 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 23:45:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 11 Jun 2023 23:45:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 11 Jun 2023 23:45:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBt7bvZ1SB5ME2PaarE9aXpH9iyI9V6ujoFOyzOTMZ+6Yx0wwEEBioi6V+slt0Dx+edf9jjm4xcaIruZQkQSS/NLtYAfBfhzimP0IdTGjokz5AY31nPFky40NxruRKEp7dUw6A7O520Mr61NkVm0SF/6fvM+OFP+A5W4U97o5LnPu8qbg8Vt9NAAXgALA4MV8F32fQ/+bBUbCw4sDGlDowq1VDkahc3iaN7ti1ENfKwo+7X4ApfIFhSctVYAxOT4r1VOZ54z2gnYOvaOqsmA1r5vB74hu2R4adpO80rtToaPo0cDqFmWp8K40VfmpduI1hCOQFEY0gC+sZmY+Xn28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8CrR3oBhrg024FX+8MuP/hn+GymKhLIQJnFL9CrzKA=;
 b=AVDXtMWJZDDm6e0oI3ZMp7JtuABKcn48IWF4GDq+/0mjxyHyjgPo32pCSRWncQMUvt36D/Ly1l5ttVQZC79cYYYz6hQKICpGCs0xAfGaMhh0hJ9sddONphacZxTflmIZCOjdg7spJ/5iVL8/qXhXSbBt42L+NnisZsiKf5NEL4ZdwRlybqumvNEI8OyUp/Mjbm7gIfoBGfyWH7+ub34aOPH2ePlHq38R3uKcSKbugNRCeyCqHOYgfc06M9kA6Ip2fE4rMa8fg6z4yFQyJEzs2uEIWLCY1bhCIKod35lNbD7SHWLneZ9lA9FpvvRePJwa9ZxNeYbF/H4xmvBv7QBUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 06:45:18 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 06:45:18 +0000
Date: Mon, 12 Jun 2023 14:42:10 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Rob Herring <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [robh:dt/header-cleanups 19/20] arch/powerpc/sysdev/of_rtc.c:
 linux/of.h is included more than once.
Message-ID: <202306111337.g3HQW5b3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac34a8d-f90e-40cc-4218-08db6b1095ed
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zT+BvmmgS/D/r61hELcs5flvj/Z0qUILbWxRR++S/Tj+C1f7JdkZLyrCpf9iO/IbAESwClStq3cfVKyzY7/eZIld+KNN9x4Y53t1vhnFmBKy+Q/G1xvU7joEZjEU2AMfOb8TCvNuUKSl6l1e4A+8uib/2eOa9t2JLcsKTgr6Gn/VRb2WNO0MZMPY42MpuClraEJ5AxtdQvlWvJTom2tW+lXCjyhpKrvzVNz2hA9Zh0DbMb1L5hblFS4rdq333twdxF0Aw/GdhIW23FRHbhLihqbaQ9SWswUhYpRM+upHCy6TiwxkA+/QJdx63kYi7LtbGb1wq61lFE9PdjOFwhSZVTLIpf0jZVfq8WsV6iF/nI2uGAtUCvMl3/9tRWZqKwWJk8Ekfb0XNin8hr4AvhlP1Nhb98vWoyEb7zaRblBJNjgmloWev/iM+uTIo/6FXmbrmAmD/f33Q3gaqB5Zd8wzgUTiVqKrtLVPvPtNPOPPYNhndvDlxFSieFRpE8gETIISKaa/GrwZRBypIzz19H+Q/+XNGgMNUBfyHVZlExXoN+SVv/q46g7Bvz6uArfH/goS9v9/bPCV4PsMHX+HT6ggg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(26005)(6506007)(1076003)(186003)(2616005)(6512007)(83380400001)(6666004)(2906002)(6486002)(966005)(8936002)(82960400001)(8676002)(36756003)(478600001)(6916009)(38100700002)(5660300002)(86362001)(66476007)(66946007)(4326008)(41300700001)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FrjC95p0RD5MOVQf7zpdUBKHchocX2OOsTiyWpWM+9WNkSwoHh+JVf3LO8en?=
 =?us-ascii?Q?HmVWT/3B9IptmRijplbwAjo7vxh+FvIGj4bNbfAD0ICb/4q7wh8jHaqlTNfo?=
 =?us-ascii?Q?q6llWRVp5ML93prA5R86X/uyrvtQvIanp6Ch6do6byD4psINiq2jL3r3AgJ9?=
 =?us-ascii?Q?q/Tz1NOFUPTMPEXGeMr2xAJkgsosSXBK38yQK8Z/FjcxLYZtdtThF6pExjCI?=
 =?us-ascii?Q?5owYqAhipO2vRl8sygUGg7ZKc/5jQLV66JzFYmaQcTwgd8Q6KbUqKkkSedEs?=
 =?us-ascii?Q?HL24DHgzlxq4KK/DvAbO8HDLt1adWgi3wg+B4/SOZEE6MWP6sG3T4QEUzqJy?=
 =?us-ascii?Q?7tZQpi47nGFRpKQ5RNjF9s8IRrpLC+mR45iXf0U0VBdsv1xLpyKsSNt5GbLR?=
 =?us-ascii?Q?i6klsNRCfO2wp/D/hk1G57TsdCWEcwpGOaG3aGx+dDg6ylNRvhDx5xD69zeS?=
 =?us-ascii?Q?JfANNeDDPl2aEGQR3g64yrLcn4/6dCpdkhWmx2yq+omQnbzZ7MUwnLU9NB0D?=
 =?us-ascii?Q?gr1bh4aDgC4b+Hv0AfusT3z2r8ekvi1r1WYNV1+5EJxthUQWNhuRKHLtpib6?=
 =?us-ascii?Q?I6NkKB5jD1uZ+AgY6Nx9meHMeVnH3doN84XTtr2rG/jHEGlu5dEWwxcQZUX0?=
 =?us-ascii?Q?Nb1fLDBVpoTvkUB5W9WuFlwgDZtL9205bEspAPFzWPEH1V7MX1iELTbjovZq?=
 =?us-ascii?Q?RVt/MNvqjqPNV5PC2J0Slo79Kf/4obXvewNs0H95gfP0dJdGbVzzAjynLNmg?=
 =?us-ascii?Q?f0IPnu/nQ+1hmM26E9oR/cainwlCDPOCfIUFNNzJQhTzZfWJfIVwvSbKoely?=
 =?us-ascii?Q?maNESG3Bk6HqQV+hzBLg/CrRMqPKgdS21Pki8yLwPA/Qycbvcy1jeoPiO0HM?=
 =?us-ascii?Q?+yFjslax24PyRTqzFTlh0qfZM7bJ8IfaNtt9l9QLDW+vtg9h+IsuVNimbQE/?=
 =?us-ascii?Q?UQAZllt9P3e4MYsZK6qv5opboyqaiLNNHVkxavRJhr3tiU4jmjfykCwtCg50?=
 =?us-ascii?Q?EC2qbXWLLTFmrzE+MV8VIaQsxfy00O0n6tWpKCnWBK3Rfk0i8IJ0qVwraRQ0?=
 =?us-ascii?Q?UpckCiDxwLg8SXkShoJRFa43PeTzznMIghh7FV7G1n0Qid5MnZUKzEWtHjm2?=
 =?us-ascii?Q?cAXOazj5DOVWDnTsyrwgh5BUYN4D/sj0CpU/2dkX8bZxnstmBUotg5l4mrjz?=
 =?us-ascii?Q?CpA7j6+qV9cQ85kXzFacl/UBFLlDtbv8OicjIPgyK2UUEGYFPHR2jaYlCK+V?=
 =?us-ascii?Q?lMVOa/weua+ZKJDnY8UrvHOaz9cFXTCuHmCVTtmFpzkjHg91lHJwWn7kx4pL?=
 =?us-ascii?Q?XXbFZa7TVSlH1Aq+NKta/aLqrtBLXldZsmiUfJs2JDSEPab7uBWUz8ziqSU9?=
 =?us-ascii?Q?C7sf/MgJuywa4BM0muJVslWSG4C25gaNAESAkfm4Px5VXwYJawBuP/vnwElg?=
 =?us-ascii?Q?FUBiw1fox7vIDCuJuwKgLnIi9PA22cCkdVN4lPzgG6AA5WY77kWRaZzledHZ?=
 =?us-ascii?Q?BT4IJX45FU4TQhC2ehqeLjMqkgE6ITfprt/ofqe72qy5vgqckPbbYyQWmrZh?=
 =?us-ascii?Q?SuUi4vo3a6DKK7wQIkB3dBK+OTpmKzSwdTEONf58?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac34a8d-f90e-40cc-4218-08db6b1095ed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 06:45:18.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4ZklNQ7Z8FlqVvFR4cVlBG1zCv0HQfKBDNyY1Qf+fMh4tFGELXFy/jyNmUTQYwuVKEJSgmi5XnGPUxdTdj/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: 6bd2c1239dfcde3e23570ac6b044382269edfd17 [19/20] DT include cleanups
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306111337.g3HQW5b3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/phy/tegra/xusb.c: linux/platform_device.h is included more than once.
--
>> arch/powerpc/sysdev/of_rtc.c: linux/of.h is included more than once.
--
>> drivers/net/ethernet/freescale/fman/mac.c: linux/of_platform.h is included more than once.
--
>> drivers/usb/host/fsl-mph-dr-of.c: linux/of.h is included more than once.
--
>> drivers/regulator/mt6359-regulator.c: linux/platform_device.h is included more than once.

vim +8 arch/powerpc/sysdev/of_rtc.c

   > 8	#include <linux/of.h>
     9	#include <linux/init.h>
  > 10	#include <linux/of.h>
    11	#include <linux/of_address.h>
    12	#include <linux/platform_device.h>
    13	#include <linux/slab.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

