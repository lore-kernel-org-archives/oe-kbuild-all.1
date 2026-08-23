Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC543CEBB9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487346; cv=fail; b=eO1tGvPAzMOUy2QJTLBjBhsm3Xgw43/JI8uoZTjpX9haV197EbdOJfhY8TZG187uOT6U/E3+xkWaj1ehi8N3DkHRo21+LaoFCrAMznVR6+IFS8SYa8NXPgqFgBB/O12XbcRnA1m+Z4EeUsSK8qSfYcmEK80E5xuDuoEAsk7ixNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487346; c=relaxed/simple;
	bh=fHrs1WDFeE8YpD4L/UHm68MuWasFUIWrulgzB4McTeM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UDHI+ww0SU9+o+oJBZlxQ61Trz5Rg/xer0M/0QH4JQsV3TQh5mn9AQQ5wptLWtB0hRF+LZ6g0YJS8+BCEK7se9d81BwjTucQylxZf5rO/EQyY9G4GoVFdrKkAz1Fm46Bux9i1aWAIiCZMJPrGOWMVk46AhRMKnYUfF/N6d1viA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzlSPZk0; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzlSPZk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487343; x=1819023343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHrs1WDFeE8YpD4L/UHm68MuWasFUIWrulgzB4McTeM=;
  b=JzlSPZk0ZN7oeWD9JC8Xk0rns36BU4LRFDO8C4+WbNSQKu8hx3L/8uRk
   VaADmsR4vd5tFwLf5Vc/oQxVGeykesDJR3IHgu5kCo/SdazFgc6Gaz0AX
   gsWHgmAZ85n7y631/vDTOg/J/iNOlMyosbfpIG3oQAmieOm42D9ir8+Dm
   wZH+z/QdUxswnISZStSQ21Sky672ZB1JDJmR6WzfY+ljQgwu7WYBMNLXW
   MlLEzSI6OEuqRpycJu6pTHte5iEdjjAxXk2+dIj1z401wd90Ke5KXQthp
   7njAUPzZ3oEWPkcBQ6sX5/uO5eKzs+tZZuFzl4AgGVzW3gIJK0lp7T7Aa
   w==;
X-CSE-ConnectionGUID: uJlIfTN0Q9SDhUZu9gb+uw==
X-CSE-MsgGUID: uqwOE4BSRHqAxR7YBggRGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088987"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:15:42 -0700
X-CSE-ConnectionGUID: Ap3CngsnSN2qw7mnuI8rMw==
X-CSE-MsgGUID: 2wlXMo8JQbm8B9xpqv2ruA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264991658"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:15:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:15:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:15:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC6jtIKK2KIemqOn85K26QGaT8SDIZo6sphY4aGAoxSJEGEF4PMwptfnq5vhgZnMRzvB7ovlfJ7GxZKCm0VIjdjXRnQhj7w6bfco/dvfv13r5DUKpekwRS8pgU/grbIgqAFkJZDP7oXS3sNzchjK8Gz2deX6mRa8ckP+WQ3IzU1wHnvFEDfqSYkMXR5GDkeNShzuw1EYYA/yMSGq4J4CcIq/uCczIWgJS5EkQDZE2a+SOQ3fr7vMnKhgqlaFOseO+WHVSPyiUSCDEePB9hkSphRIwKgKwQU2qenJpQ2C5k0mbFcp0ZrdrodiB3Jvz/j7yztGCJvaRvKcqWeT+DxJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZhHiuSQn8QDUfUwFtcLzqBBXb9YEyeyBwr+U2inaQo=;
 b=BHWNIkDDKYByQL5X/gcPu51GSQPHv/Wvo28a3AQ3CmkzrgoTUMC4iMxQ9n+BrVfTVwfcP3sE3EIFCBcmypg1AEzYeqxdnbLSKFvDQ4heNwPPQm8R81NhBfQ1V/FEviaEmCb3WG5jtYNRjE4EqL4HhaK7Po7+hIebyZaFoZ6HcW7HUZyMfGR7Sso0n4ssEERk68gL1nBSuumZzUVc0BTN75tZAWXTO7nHQVwMxIPltgvWwqJleiJwbNo1rOj6P0P147nI0+a7YrkRoYUzcdqRgQTGPb3e+2CFlB/3aS0QXzITWMIlFiXoEnzky4F7Zk6CTHNY+QeXtkCqaTCRanb5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:15:39 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:15:39 +0000
Date: Sun, 23 Aug 2026 20:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [willy-pagecache:headers 6/21]
 drivers/ufs/host/ufs-mediatek.c:760:3: error: implicit declaration of
 function 'disable_irq'; did you mean 'disable_work'?
Message-ID: <202608230640.EctPKgHB-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::6) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e621c30-c6cd-4192-2024-08df01103e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Eg09lA/DEKSK37BAHIADW3RpfxKTIamjScqayXnnP+dIuF0xQx6UBWCrdzBVtf8eFx3KMsRzfUDeSUuS6j9Fs9LJhqb77jF1Jp01pb8mnu8701Y7s45E9SkjK9mz5ObVTEGA1vcB2vAMsnmynfDD9Ukc0YhOnm+uTmtd49OAOXH9WTvpl0ru+4EGuYQ4GjMv1O9ymDle3LTONzyIqUyAb4cVxAw5gG5lwQie391/DhkB/fQQSg0nBOLNcbWMqb7T3LmIG1fwI5BlsJ0PfKVqn/8p6xgRJ2aU7SaLCDNTMKQQ9/mLBRO8vpm8ybWAjch3SFc4QoC5jrS8zQoSzFIWPoYMXeqOwiPdBHD4kJjI+bFg2y4KTbJfQ6Rw9PANd5qAaT304NfBn2VSigaO3cX1QktKcay/E0tbFo8t7BiVW2VI3TEe2GXUCnUNxs+n8P73+zUNsG6nIbYoij1jCgLKbl1s9i+7XUkoLb7bAFFNmbynLRyNj0Xu917QFOnqBAxdmnkOi+FXXgYyaJ08Kh/xJqjuNEcA2SVrBNnTHrEBh+Ill4g8LwEztvk0reQzp94TAaj5ou4bmOQfKko/bccmDciZiPowlo4i/GON7SVaJXCvh67FdRc7hXA61h+itCxMIgoiK3o2qgdvFFX6vvVqE4XKK73tCPbtGaYqFwmGCFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cuvsasVd/1XjuWHX1bVr6RBcJnS1ySAF6ZTteqLgIA9CuXy3lt1acSYPzzAF?=
 =?us-ascii?Q?dLKAQnCNm4eTdqCl5xbHjjmHbIwkIVko4XUArkE4hhMeqHy9adWNmkdgKeBh?=
 =?us-ascii?Q?T+KEkLWbI4t8d4lZpug9Kr+8DJx4+Z7U/2lVwhV9aTBYvcs1eGEO7NYhOsP5?=
 =?us-ascii?Q?gXNX4CPiX2T7ZIcG/WiesFIjXS8zdNd587qpuvyz0chMSbKIuysqUG9WTzSw?=
 =?us-ascii?Q?bO6TOaXjllYa8jUsOcj6O4pzwAF/wqx5mNoNjQyrgCzs0KprupaWhussfDlN?=
 =?us-ascii?Q?f3hpA+Xt4ueml06+3qNzHISaio3PVwHEf1g8G9jyyBzSodrkGjoLFVvNxMov?=
 =?us-ascii?Q?WKZ/BBKqnslhDxEKzJtrfVZ6i5XyPjvfpWi+VOyUyvQqZy5Cq1Q1vdwD+heu?=
 =?us-ascii?Q?AW5A9xIeI18m/Zj5PsEziEK2E+MJDR6hUl5MGvoIlqvgORI+RaQKwYtad8Rm?=
 =?us-ascii?Q?YlQEH3Kf4gYe600RN8GXFUzY6Ijf5J0+KySVlOkFX+sIxhIWWKyoPkPqJMD/?=
 =?us-ascii?Q?/3DHlU4QYnB06DP/KXscwuW38PwiSeazB03XpUgrbrBmDSHvHG5Lzj1YGgLo?=
 =?us-ascii?Q?oMQXZbj4lFWsx2C0kh0LcRKTrh8mQ1x07G+8Pz4TJR4xOXFJW2gwFk97Qk/c?=
 =?us-ascii?Q?UVUKrTA4SuDCgw4GWG3pMlQtes98eDIUTY/u2NuxyOCXFHQvnlH8i1a2iOne?=
 =?us-ascii?Q?2Uor3syDxAc7S4QdSXGzMhDUTYSEFsWlzAgjOyFmdzvMoMweQWEqQizp+qaT?=
 =?us-ascii?Q?tGn+RsCO//Aoi2mqGCHE83/xJcd3LU7UfQdveD6TI3uUUXYJDDDjDtXpeD8E?=
 =?us-ascii?Q?bZvZ4Vmwr/dyVIWtnE9OZ9D6l9Y1NK7c+u/JSNdeeVTp/IYCmJ7XQkxyqJCV?=
 =?us-ascii?Q?UU6vOK2CZ3qE74O54mqyBs5iF7TK5JE5oF+a7EUbC2y0nnajXbkm0pL/CUaC?=
 =?us-ascii?Q?f/2UBnRMULWKxCvYVYXk3xfY9/81PUSjsAKBvZjQ7GDBIVMDWEPHMF/5c0s3?=
 =?us-ascii?Q?RBE0UoKyeB9aaw32QaajgACQpHt63ejbDjDTihmxP3E2TuerYz+wp+LrXc0Z?=
 =?us-ascii?Q?Qp35Sot7owN+c2QYtT9WRqVlw8aZhc6xq8hHn5yfPjOL2C3+WvnW3VXcw4r2?=
 =?us-ascii?Q?/W0vX3lUyTNW3AT9mveC3q4q4fJ8jqadxrqBTnhDVbjG2/lAhIRn73zn8OMm?=
 =?us-ascii?Q?S4pu+uMJ3FfjbMbAKawvdOYE7Ml9V6k4i61stzlUxL8McWM48C9DdzwljUUZ?=
 =?us-ascii?Q?IUD1zDjL4BRrI9gkiE/m2H2z6Rd5NnKBi+3iLjT7XSPXDoMfFaixCu+NTft8?=
 =?us-ascii?Q?VvahUbkNlH4xwuuMcv73QvB6a3rNZBc241GBdrVER3IUGOyj3ffNdd2WMXKe?=
 =?us-ascii?Q?XdC4PHp/7Qofbt+ZQHMLXA+3u+l2JnDR1yAedTp/5P8BkYhe5k2YZX2CQO9c?=
 =?us-ascii?Q?Lkt7eoWjG11qg/k3nXnMuVAiujZ+Slb8CHEW/WW9v1w6ES/N3FfenhpbbFq3?=
 =?us-ascii?Q?1Nw29Y1c+PxcTIg9RLgdmIy0/yJ2msQE0QmVsddRhel0/ZjGzaGq2W/lzTLO?=
 =?us-ascii?Q?q7oNqcVhfTj2Y4FE2utf1kjBjrdDgn/57dWeOYOd40fzAM103+WEtELD8kqs?=
 =?us-ascii?Q?sD65SjB6DtHRWV2BlgWd7y839bip4DlhWMDMQTIQg8jVngwoaTAZDZxdZBzS?=
 =?us-ascii?Q?vJ++Zjn4h4muyojiu4jBYiP4MkvRpXb0H0R7NauX958kDQXlDkwqt+SaXaoi?=
 =?us-ascii?Q?2R7wHvbE4A=3D=3D?=
X-Exchange-RoutingPolicyChecked: TOUPB9z1ThwK6J1qRJjuD4/mgR6nSTXC8a5Phv7eAcFtTs/N//m85E9xyWck67PXO88JcHG3tgt+6RqRMwiUDoEbo27axLTUrsW/xZeA6eLX5l51ArU+pTPo3ZHKMdypjQq4irPgUhePClF04DOGbvXXkxyPen63tnkRxoAaZupi5RzX794e9LbcEycMJZakNKjm3r4dDIPUiPZWH9+S3/X1dZ4NvB95kDfF9TXjNAZDx6tWIInPVF+d+Kha752gpmfLz38c+/R0RtIKecmqCQ89TzKJ2klo+WypnqlejkJ9EtoxGc7lATIEmca1PkvPiki7H8IKGsDR/z5UWO4gnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e621c30-c6cd-4192-2024-08df01103e80
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:15:39.2025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kA82TuJ2GFnnLmo6RkqZXWwg+wSCwpy7Frwoh7/t+hCovAXEVNEsRKfCXnn1iSnGKepKxN4iADn6O4LSfhUNcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   14ed95ee1eed0c72d54c159582017588ad1b2d68
commit: bcdc5eb7acfb699233f66662526dcd54c6c98bd1 [6/21] headers: Remove swap.h from suspend.h
config: arm-randconfig-001-20260823 (https://download.01.org/0day-ci/archive/20260823/202608230640.EctPKgHB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230640.EctPKgHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230640.EctPKgHB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_mcq_disable_irq':
>> drivers/ufs/host/ufs-mediatek.c:760:3: error: implicit declaration of function 'disable_irq'; did you mean 'disable_work'? [-Werror=implicit-function-declaration]
     760 |   disable_irq(irq);
         |   ^~~~~~~~~~~
         |   disable_work
   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_mcq_enable_irq':
>> drivers/ufs/host/ufs-mediatek.c:781:3: error: implicit declaration of function 'enable_irq'; did you mean 'enable_work'? [-Werror=implicit-function-declaration]
     781 |   enable_irq(irq);
         |   ^~~~~~~~~~
         |   enable_work
   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_mcq_set_irq_affinity':
>> drivers/ufs/host/ufs-mediatek.c:875:8: error: implicit declaration of function 'irq_set_affinity'; did you mean 'irq_set_vcpu_affinity'? [-Werror=implicit-function-declaration]
     875 |  ret = irq_set_affinity(irq, cpumask_of(_cpu));
         |        ^~~~~~~~~~~~~~~~
         |        irq_set_vcpu_affinity
   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_config_mcq_irq':
>> drivers/ufs/host/ufs-mediatek.c:2264:9: error: implicit declaration of function 'devm_request_irq'; did you mean 'can_request_irq'? [-Werror=implicit-function-declaration]
    2264 |   ret = devm_request_irq(hba->dev, irq, ufs_mtk_mcq_intr, 0, UFSHCD,
         |         ^~~~~~~~~~~~~~~~
         |         can_request_irq
   cc1: some warnings being treated as errors


vim +760 drivers/ufs/host/ufs-mediatek.c

54770cbebe2caa8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-11-16  746  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  747  static void ufs_mtk_mcq_disable_irq(struct ufs_hba *hba)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  748  {
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  749  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  750  	u32 irq, i;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  751  
0fca3318e550d48 drivers/ufs/host/ufs-mediatek.c Bart Van Assche 2024-07-08  752  	if (!hba->mcq_enabled)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  753  		return;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  754  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  755  	if (host->mcq_nr_intr == 0)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  756  		return;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  757  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  758  	for (i = 0; i < host->mcq_nr_intr; i++) {
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  759  		irq = host->mcq_intr_info[i].irq;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21 @760  		disable_irq(irq);
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  761  	}
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  762  	host->is_mcq_intr_enabled = false;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  763  }
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  764  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  765  static void ufs_mtk_mcq_enable_irq(struct ufs_hba *hba)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  766  {
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  767  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  768  	u32 irq, i;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  769  
0fca3318e550d48 drivers/ufs/host/ufs-mediatek.c Bart Van Assche 2024-07-08  770  	if (!hba->mcq_enabled)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  771  		return;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  772  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  773  	if (host->mcq_nr_intr == 0)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  774  		return;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  775  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  776  	if (host->is_mcq_intr_enabled == true)
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  777  		return;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  778  
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  779  	for (i = 0; i < host->mcq_nr_intr; i++) {
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  780  		irq = host->mcq_intr_info[i].irq;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21 @781  		enable_irq(irq);
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  782  	}
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  783  	host->is_mcq_intr_enabled = true;
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  784  }
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  785  
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  786  /**
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  787   * ufs_mtk_setup_clocks - enables/disable clocks
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  788   * @hba: host controller instance
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  789   * @on: If true, enable clocks else disable them.
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  790   * @status: PRE_CHANGE or POST_CHANGE notify
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  791   *
3a17fefe0f1960d drivers/ufs/host/ufs-mediatek.c Bart Van Assche 2023-07-27  792   * Return: 0 on success, non-zero on failure.
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  793   */
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  794  static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  795  				enum ufs_notify_change_status status)
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  796  {
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  797  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  798  	bool clk_pwr_off = false;
cf137b3ea49a04e drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-10-29  799  	int ret = 0;
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  800  
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  801  	/*
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  802  	 * In case ufs_mtk_init() is not yet done, simply ignore.
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  803  	 * This ufs_mtk_setup_clocks() shall be called from
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  804  	 * ufs_mtk_init() after init is done.
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  805  	 */
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  806  	if (!host)
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  807  		return 0;
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  808  
722adbbd706569b drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-01-29  809  	if (!on && status == PRE_CHANGE) {
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  810  		if (ufshcd_is_link_off(hba)) {
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  811  			clk_pwr_off = true;
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  812  		} else if (ufshcd_is_link_hibern8(hba) ||
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  813  			 (!ufshcd_can_hibern8_during_gating(hba) &&
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  814  			 ufshcd_is_auto_hibern8_enabled(hba))) {
722adbbd706569b drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-01-29  815  			/*
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  816  			 * Gate ref-clk and poweroff mphy if link state is in
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  817  			 * OFF or Hibern8 by either Auto-Hibern8 or
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  818  			 * ufshcd_link_state_transition().
722adbbd706569b drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-01-29  819  			 */
9006e3986f66898 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  820  			ret = ufs_mtk_wait_link_state(hba,
9006e3986f66898 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  821  						      VS_LINK_HIBERN8,
9006e3986f66898 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  822  						      15);
9006e3986f66898 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  823  			if (!ret)
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  824  				clk_pwr_off = true;
97347214bce8d74 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-12-30  825  		}
561e3a8726b2dd9 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-06-01  826  
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  827  		if (clk_pwr_off) {
c64c487d953331d drivers/ufs/host/ufs-mediatek.c Peter Wang      2022-06-23  828  			ufs_mtk_pwr_ctrl(hba, false);
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  829  		} else {
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  830  			dev_warn(hba->dev, "Clock is not turned off, hba->ahit = 0x%x, AHIT = 0x%x\n",
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  831  				hba->ahit,
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  832  				ufshcd_readl(hba,
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  833  					REG_AUTO_HIBERNATE_IDLE_TIMER));
f91c6c70d103a61 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-11  834  		}
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  835  		ufs_mtk_mcq_disable_irq(hba);
722adbbd706569b drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2020-01-29  836  	} else if (on && status == POST_CHANGE) {
c64c487d953331d drivers/ufs/host/ufs-mediatek.c Peter Wang      2022-06-23  837  		ufs_mtk_pwr_ctrl(hba, true);
e0dc13e5a3cb9de drivers/ufs/host/ufs-mediatek.c Peter Wang      2023-12-21  838  		ufs_mtk_mcq_enable_irq(hba);
97347214bce8d74 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-12-30  839  	}
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  840  
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  841  	return ret;
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  842  }
ddd90623ce26ea8 drivers/scsi/ufs/ufs-mediatek.c Stanley Chu     2019-03-16  843  
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  844  static u32 ufs_mtk_mcq_get_irq(struct ufs_hba *hba, unsigned int cpu)
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  845  {
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  846  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  847  	struct blk_mq_tag_set *tag_set = &hba->host->tag_set;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  848  	struct blk_mq_queue_map	*map = &tag_set->map[HCTX_TYPE_DEFAULT];
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  849  	unsigned int nr = map->nr_queues;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  850  	unsigned int q_index;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  851  
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  852  	q_index = map->mq_map[cpu];
7ec2bd6cd2d0ce6 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-08-04  853  	if (q_index >= nr) {
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  854  		dev_err(hba->dev, "hwq index %d exceed %d\n",
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  855  			q_index, nr);
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  856  		return MTK_MCQ_INVALID_IRQ;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  857  	}
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  858  
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  859  	return host->mcq_intr_info[q_index].irq;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  860  }
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  861  
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  862  static void ufs_mtk_mcq_set_irq_affinity(struct ufs_hba *hba, unsigned int cpu)
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  863  {
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  864  	unsigned int irq, _cpu;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  865  	int ret;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  866  
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  867  	irq = ufs_mtk_mcq_get_irq(hba, cpu);
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  868  	if (irq == MTK_MCQ_INVALID_IRQ) {
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  869  		dev_err(hba->dev, "invalid irq. unable to bind irq to cpu%d", cpu);
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  870  		return;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  871  	}
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  872  
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  873  	/* force migrate irq of cpu0 to cpu3 */
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  874  	_cpu = (cpu == 0) ? 3 : cpu;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22 @875  	ret = irq_set_affinity(irq, cpumask_of(_cpu));
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  876  	if (ret) {
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  877  		dev_err(hba->dev, "set irq %d affinity to CPU %d failed\n",
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  878  			irq, _cpu);
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  879  		return;
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  880  	}
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  881  	dev_info(hba->dev, "set irq %d affinity to CPU: %d\n", irq, _cpu);
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  882  }
66e26a4b8a77931 drivers/ufs/host/ufs-mediatek.c Peter Wang      2025-07-22  883  

:::::: The code at line 760 was first introduced by commit
:::::: e0dc13e5a3cb9de98fd00b7718738f9eef4bd0ce scsi: ufs: ufs-mediatek: Disable MCQ IRQ when clock off

:::::: TO: Peter Wang <peter.wang@mediatek.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
