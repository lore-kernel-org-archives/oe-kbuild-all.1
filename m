Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9DA5731A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686990; cv=fail; b=OOObepETiz0b9fiOJoTLQfSkNzUIxtVN9Zvz6EjeoUXXLQuaLODRURJ7j7IFD3PvoHMgNdyLsssMdku0Q+8eDS4lcaEofK6rOLSWaAKOpeAq3PfPUB6PIYfuPY6S9bmG1FMHpG4miM3h6md2zZHpQVvhYj9vxd1W89NSdGXaiFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686990; c=relaxed/simple;
	bh=yskVFt8LNutIIpy8zuaHUzN7ZT+h3lbyinjrLOceBIg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IvPKMOIB6jnDQwtIdo2KcrNpI7oSJ1a9rmMpnL3404xJr7OYgltq6V41o4k9naOfuLz+/zKMgcWHER5WgkzLi3EBtk2YQk5GYGQuWyY8eL8yJzb+xlnk0aLl/EJGvZpgpwUIzQre0dLwSHuFWtcPAUwog8hkIFq2ZUxDt6VHSjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg3TI2Yz; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg3TI2Yz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706686988; x=1738222988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yskVFt8LNutIIpy8zuaHUzN7ZT+h3lbyinjrLOceBIg=;
  b=mg3TI2Yzmw0ZPLEFsyIFIG4Odjq2tT6r0CYIqf2NnsMSSB11Vdbtl0Dq
   7/x3vdOx4Sn4vnBPr1vdbrWCo/dt8PgX4/m/kGqge8h3edCWAtdy/ypQF
   hxQ0fsOMBVZbu3mt6+XNhrP8um03rHjdritzbFBICttCzwRxTLTUsy5oh
   65qMRBgKfoeZdmiZPF8Di56GYnIkVE0G+t3BUfaFlHKs61+FgQcsDG+DW
   SVdIqUyY4uDg9dpyyE1f14d3pW66IOvCcg0/G038zyeO9OZLU5v/i1++v
   //WQNjSecgoN5wGczzMFaIepSvfHqLi+tYayWoK2QF0u1VS/3Kt6FWX2n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3373295"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3373295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 23:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3996856"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jan 2024 23:43:07 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 23:43:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 23:43:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 23:43:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPZZZIV7Z/XQ9dulsMOupDZWXSY2DEHzstAnFVHuqmxA2fcskEoGkdRZrgp/sxQZX5CAyXSRW245k+Qd3/KrR7Bhi4yqVbjdfJ1jO2cscUB3BS9CAnHDAECDSoCVxgNHdX9HZSbN3XVpz68FUy/kGzHyfrVR7DjQ3okjf5j1Vpa8i7NfX1RtZyfJ2RTjEa8KfiDmMb7HKTI4EUyFLNa/QYc9K0clGnDj92k1SRh+Z1qLE1dvo6KjRw6QZ4VfIUr4EdXYn4+SFpSjps5CW0DCy/Vn35b8ovhnuS7//U+bXAJv9BpBUEnllZdNiNSrKZj1988T1VbP5aanOjMmdp+glA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vp9SKDi3Wa/Q6KqTEO5Rr7yUTcsp84Jk/Hz5ZKFicgY=;
 b=oaEA0KX0m404yJW1N6Z5T79Sv9kYJ68qLvh8BbyZFqNGZHN+HdRvgtR4Hl6FgCTgDwwmSOYSRZ86j1deU3TNiPu4E1hwzMf19ydeEalk7WWbR5lBapx/4lEEL8w8P3hzRHL4l9W+UKKO7a/4QVmO0JEZUGhiCFi1/vqNr6e+RFfUZ3VpKYhmZfDJ2KuiHj4ah3yuAdHlrTLBV5Fa3hpNutyybrPfX74fz+lweZkWw3yhEFR1qW/CGb2+2i81gZ2EfPamfyzHalqGMQPoqb5rTguScyoddjitNgO2xCAFWTmNsiY88ZdM6PFTXPWaSEiJ8L+BX427ojFTppCE2cYfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 07:43:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 07:43:03 +0000
Date: Wed, 31 Jan 2024 15:36:20 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more
 than once.
Message-ID: <202401300410.LTlB4Pi7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 971d6e64-a828-447b-4ede-08dc223041ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1OT71HTnQDRMq4SyAJ6P8Xtq7k4bt0Cub+3E1S35EW/1CAUlismk7qBHj/k6nTor/Ht3Rk/TBV3twAhNsLX1R2KMsOywzHhlMCM2n7zrpY6fdtAeUZXjHmlxBKSzUdPhSSJoCWSybhBFxT+uaIdK5wMUM9YOLRcXTuAtniF9rdw8FLF4OypEFoyIye3CVYRwpkbx97xzcy3UqRx/iyBODZdKGK346bP67rTkkbDG2gtxoMbS6/9qJBhSsefdCv/ylXPokGUZx6g0jhlmAv4hWxKF8vRT278tlGQvaOE1hEEM9Hst9QErVDIxlmRluclzONmJMK9OEhNDunyIucvLl6unVRoXBjV3Al2eJ2B9yJnobiqUgff77jzWNfnUw3z12vUhgp6wLoJzvPiHre+AeENueYlcEINbayqk23BrYX3pttOhHxBVzZEimmFFYJ5yOI8U3dbYQ0DE3Q3EwcNJB03JnhVNdMX80bFpmUlXyvwPYLsUTg/6P4mezy0t0NpyOcj76t+ygIDP+W+KS33siqJE5OjYhLwLfgluVYNmmpJ2GwyElZ5cyBdhKFVAbK3KqNIn70UYy5bHMvaCLX/YgI6DVbfzfk4oxq+Y7CDjnGtLkIz/CY5sIho3n1CVxQRsuM/WttqlRFVa8T/APK0RWP5sEER3resXokMy1ShUKDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(316002)(6916009)(66476007)(66946007)(4326008)(8936002)(8676002)(66556008)(6486002)(36756003)(966005)(478600001)(86362001)(5660300002)(2906002)(41300700001)(83380400001)(26005)(1076003)(2616005)(38100700002)(82960400001)(6666004)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gyj70H18/XZdiO7tGU78TIj4nhD4hBZ6wbevMRr7ugqI0vJru9YFL88OT/TQ?=
 =?us-ascii?Q?k1NlMUuvD8jF3wc/sUlpdPwa0d9mizPk05t2aG8DCcEdjrU0QajLNq/S0M/t?=
 =?us-ascii?Q?QjVazMT0I+oQ8nhklQHxZC0+c20O5FOYko4VsZE/EZCYuXv01apiwMUGnrmC?=
 =?us-ascii?Q?HG7fYrH6LMnLyEI5MQNufxaVFowvwk+4uS6ssIYtVkswUbcrpTkyxQbm2e5t?=
 =?us-ascii?Q?81mJpT99d6JCeoa5/FtTT1DHCnW5myzCm+J5D39rc2IcsOzVsjIliL1wh5rT?=
 =?us-ascii?Q?8uqaLVpbR6+DoJ+FC7rPUVy+VN2fQS9atZ3VWR1KhphqobZTuX7sZsoGCXj+?=
 =?us-ascii?Q?3W5pAl2pv90BtjK2BbotbfQxic5yNFC16Ur6CboEaWVIBZUWca5KizTIpr0d?=
 =?us-ascii?Q?EcBdep2IWzxOb0ZGFF8ZHz2f+Ug0BLBM0tP6NBdZTrxXiC4KD5wUCVA03dMk?=
 =?us-ascii?Q?NXfhiKddhOn5aLyMUTBgfx4L5erbwBIlBLkrScixugheh2Zy4o4W7MIeLguF?=
 =?us-ascii?Q?DSlQ/K9FwHeghGR1BZn8DrGbxGih/rhBTjrJ7307NcE0kSJxY3aWXS+lR6TX?=
 =?us-ascii?Q?l4Q2z9HybK9TlnAE2Vn2liNOadGgk2JSBsFFkGhOYVcS493fJ+GDpGIBluMS?=
 =?us-ascii?Q?uVNMH4GCdNRtkActJYd5QVgwAhC3mIyHuKRs6pblFK0BENq03eMIrjo2dqGe?=
 =?us-ascii?Q?IOaUci8bPHnDp3g7VRN9toge1wJfJIEYq091pDHBOfDNJL7wduW8IxRqpBwW?=
 =?us-ascii?Q?7YQa6HVdFzsxjlI7AAEZNT4ocP4uxBM7i7MzHP2+NqY7BRW8KazKKl9RfgB8?=
 =?us-ascii?Q?6ANF0mfZAiAS6PTE+982h9LyOn6rdCoUVNkjsejPcHm61bdb4zUHfYbAVj6G?=
 =?us-ascii?Q?85KuIROV2BYUNcA3Y3BJTRaq2SaplZO/lePjdQKP15YwLz30eneWS6+XPK1N?=
 =?us-ascii?Q?i/EurFvFyfyl/XcTrkdGsbd5BxpCou/5y+c0BhaZy1+8D8D1hvhzulQ0hE1F?=
 =?us-ascii?Q?mn7ABGe2lfJTPGtWZFp8Ayl7eTpooYC3Cf9GBQocVo+aHhH6Vl02ZXyOZa+g?=
 =?us-ascii?Q?sAvCtk5Xn/9lNHQszyqitZbxJ4j9LKEb0v9aT6hGNflFXUjnqPgZ7VXt7/3I?=
 =?us-ascii?Q?6GBOs5YDIoV2evZPDHEyd/BsRtBUJrvNY5VhCAW2+/GWT4HBlMe4tHiSgE55?=
 =?us-ascii?Q?FbypdDLOK3x4xhQIPa0EUkz+PUky+JYc9SM3thbg5g4Hj/zdawGq93IRF56b?=
 =?us-ascii?Q?Hbn1+gTl/owBLbNHZz5J3NX101jJFiHjRkDkZm6YdmAw2KuRk3Uwn2JXnY86?=
 =?us-ascii?Q?R9iaf0qRgC0NQ2UTtpzHihx4sY6CIbYouHeDOvpqnl4Y6LRUbIbwbHa0iycG?=
 =?us-ascii?Q?6TrhB+/xEllPioBxl9v+x3MEiAt2qYJp9pd7Szf3095L50b8d05vk3frl7LH?=
 =?us-ascii?Q?+Nm0lUXEJwE/opu5fCBXRUWvKlEOSqARPTbCx9e0CQRSh3wu/IgqzyCu9rjl?=
 =?us-ascii?Q?7n+s7WkvTlfw+gYmdRbh2SDeXf9kY811mnQOjlcCrp6z0AAV9JG8ZK+4FsOE?=
 =?us-ascii?Q?IqvY3WlMeNkG2Zik2ZhHfNiPfyIUswLdq/eY5CBB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 971d6e64-a828-447b-4ede-08dc223041ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 07:43:03.6051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9//k1a16wWIKJOg/m1Lo986uJ8DwCN6F2Zr/xkiuLwlMM/5ogP3S+CawRYAp2cahiGMT/TRXQWRI1nLbyigcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 6e3f7375acdcf714d1fcbae1238cd39cc9391560 [1511/26476] drm/mediatek: config component output by device node port
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202401300410.LTlB4Pi7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more than once.

vim +10 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  > 10	#include <linux/of_address.h>
    11	#include <linux/of_platform.h>
    12	#include <linux/pm_runtime.h>
    13	#include <linux/dma-mapping.h>
    14	
    15	#include <drm/drm_atomic.h>
    16	#include <drm/drm_atomic_helper.h>
    17	#include <drm/drm_drv.h>
    18	#include <drm/drm_fb_helper.h>
    19	#include <drm/drm_gem.h>
    20	#include <drm/drm_gem_cma_helper.h>
    21	#include <drm/drm_of.h>
    22	#include <drm/drm_probe_helper.h>
    23	#include <drm/drm_vblank.h>
    24	#include <linux/component.h>
    25	#include <linux/iommu.h>
    26	#include <linux/of.h>
  > 27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
    29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

