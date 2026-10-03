Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37DE425892
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038689; cv=fail; b=LkhCRHzX94r3WLzP6hBgcW5gq41q+u51quXO2rH0RZzz/g2m+tIIALHJmn64d68/fesTUR286te7svHW/6urL4zm6/3ByKStRH8OF/w+8Fj4RrRNL5ff1oFFULmrWdx4tlwYAdz2ryBpHVUs9u+nAX4tYCj9778Z97CXxmhPyts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038689; c=relaxed/simple;
	bh=6ohNLli8Kb7whMJW7V2DMZjUBxvEVxHZnEznRBFSHI0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rqibUwMvVBWCwdJdMghnkRNKs50bM+AMgWkI95N+tKUFcLLh6jWRKVczQEEu4LihiGKLU2Pt+rB7tdv4tcyVjByZLnVJBlGw1Ltl/wpXTpiuUpi8WdkLww0h0dbZBhNoq+aGv66Vp/SLWZi7w3IFDmnMYSIE0DiCpAvo5TBGtKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyQgdUcM; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyQgdUcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038688; x=1822574688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ohNLli8Kb7whMJW7V2DMZjUBxvEVxHZnEznRBFSHI0=;
  b=cyQgdUcMk5RjIkmskEEBt27Jf4f1NiXJId9KIaNMv3suiilbMiIRnxc7
   ryUPDqCpKz2epBFCMdRfz81HO3DVYU4j5kygKCCUtgqESyPZK3mPWpkVR
   jDfRwHcGxogapp8ROsIMg8UHHgZpNtCUv2DsZS4FShoYaMkRuQeFmHLu6
   /jwNzRb7CyziHvtqMgrI9cjOt89mQK2idWqbnuK8MNsQN6iOcKJOvRdda
   LNKGJtLxoeUEyq0qSFZQ9HbdoBtlczjs+45tc3BoOsiQTlIVEkm2vrWbN
   FS2WAcRt4Hq9CRTPakes3sRXTjFGfH77oKZem1eAGVrvkvJljjuhtHG+M
   A==;
X-CSE-ConnectionGUID: 8QCsSy45TcmyQGVJMnrzWg==
X-CSE-MsgGUID: RMxI8JtcQfiseGu6wM3hZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79336714"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79336714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:47 -0700
X-CSE-ConnectionGUID: Vi3GAfP2TJa7OAi3UmU2qQ==
X-CSE-MsgGUID: V6U22+Q6TBKtf+Ug1Pukvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275105387"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:44:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMdfjOdTikHhczqngmi9fk5ReWaQWhp1llWH374/6iXqDZNXagyd6d5tJTmhpBgMNCi9nr2C/5sBznAis5frJRk8zcNmfZnvip5SHouUKow/iD1kkaNgo1/JIA2GXJZ5loKxLfCE6NqGqTOrsK5FcMR9pORUp2TJPDfn151A+K0dsHofa8ZQLv5oSspKHenPJjLhBE2VMOdVZy7ZtCW/vGks2V/IG3wHGO2a7jU1cAVkzhXWbvREoKNZ94hvQfUgofAF/AkLeohg3dnZWPfCuDTVuQiKNeDttOo4eTzS1GLDfOHBigm4Ce1DyMiIAsRAe9tWVUnm8CN6f7PWPGKsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxkvhlWskBirFSM+ueJoQFHqNxdmMJo28Zv3X/Ouqyk=;
 b=nTJHPPsAaUboCAyOnedxXHcm6dZfQvJ73EV2mj/jxVW21MgE+66+E24I4meyqJXDTD8Bp1vGExfsXoCGoxQHwjWTudu4rSg1NSOU8M0UuqPzpRzikXUTVa071AJ9P0LdG9pQYRRrY3YRxAZq0W4JxiV0VkiGfWjQBuFzTFFzCQLK8pZ4+KApsBZEBnHXAmfuvuc8P1tqaybZPgwKbwjKWM5Pqt+VanlbiwfmmOT50rLgayaYSUiqKRykiqJdHaU/WVvlFCawYzprdMxPe8kdEkML6ZFq9WMaO+99NtJP6SD4VzoOXTc4qlMZZPKSNREljMaBUkeFsa0RYXduZLklTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:44:26 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:44:25 +0000
Date: Sat, 3 Oct 2026 22:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/gpio/gpiolib-kunit.c:914:48: warning: implicit conversion
 from 'enum gpio_lookup_flags' to 'enum gpiod_flags'
Message-ID: <asEUwrldKdkrdEKL@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 41106f0f-418e-4f14-062b-08df215cd234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: jWsv3qrs2brLa72B/sbIOmmpSmxy+XOseVukqnGtrCbu7SvtEHDGiHPJ6Se3g+NKf+cXWouwiW71XMVNtg1EYO89phTBpdkbyKjTH+OfKwvAjyaM1AmDpu4TVEhZW9qm9vIQMBneCkCEU/H8EzLMDoIULjR9qWn1sGmeNAxlux4QMm4hFblaFA6dFJE4kRFhdcQRgFfZWSHOO+Alt+5ZoLxwqX4wZcjorcec/HTVfKPMoRMza30VpxPVlVnOdBV1tQ3hU1TX2nAcCm68CB1AV5qTkc+q00vrSnQt4XNhTEW7TgcdvyE+7rsQgly5xVPfT2Sc2wiO+PffXPeBekF6TjNEo9dp9090+pElOVtdakc6ho/tDsWSzTDtmQrfTkQiWrni/K8RjGX+rZJlwnA+THAv9ui2Cm4StToAxCYJn7muIKMiJZWfz/VQ8jhtWG3dN7+Fevg6n/+xI/cQ8y/QJ0FNszi/jlcgKIKvAHv/61D8HAvmrSpdEu9JG8jCbmHvvB2bGvXYnIq1ue5rYb6CQYIsUiDXRI9p4sky5Ns+69q/Xrv8G9QB3B9c8+CKi65GAB4pzj1xEvoB/F+JnPC6aVRF1Lcuhox01jpOovAEaiOOxmmoz1ABE2UfH2CMYBwW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qRfXW+rkKhXJPWEfG/4g/BvYlqcg5LkfG1Bab1E3pvsY1I8wTGOK/Rmr0U6D?=
 =?us-ascii?Q?8WUz1MoZxvyoVQz25mbRa7hZp/XYwhSJIn0wnJxLVe6PFTsT7Twy5NdHJJEK?=
 =?us-ascii?Q?91X8ZXRqCS+L/QaCjsef+ouj34ExmoeOutDgq5qJqtQxp709AgGrTMT+ePIq?=
 =?us-ascii?Q?/Z4C/3Ex1gbj1K53fB5UHHZyBjps61FUmNbqQLtz5MgMZ0hZ2kB0IqQl1A1X?=
 =?us-ascii?Q?E+3IRfC3sgCvnl6auT8vr0O5+8i1hZA5OTgu5ufa0rrge+sddqHVpTYaEHiW?=
 =?us-ascii?Q?EbHMxyGa901Qm8Lbc9l8+1SGDU6Ccuci7qVSHtiG3QoZEJridsTRsQwA6E2I?=
 =?us-ascii?Q?9NXtsAZbRuQL2zxuzVjBVl+2kk6vVlfwQZlZgr78hxOCXrWPmLtxGgMqBDU8?=
 =?us-ascii?Q?Apj1R43YmsqbTYLpM/ehaqN1hBlyEgsvpknnoV0dPxdVxOYkr3bgSRsdwCkq?=
 =?us-ascii?Q?d+O7KsoUd298c8UKffE1A7/AIRnYGPMLljm2AdHg/ijjAqMrlVbXBZZfMV0V?=
 =?us-ascii?Q?XzAdBXG9g8PTjznVptBwCW88UmXk1CmALOsrhKkk3hIgYLi3qOVPf31qakMu?=
 =?us-ascii?Q?f3HtDglFADWXPHuapseDCsalRKJa2F4xUiRbaucasx6rM6rOyGuHRencL8bH?=
 =?us-ascii?Q?mS0uqFvZ9ePnyEFu1AotDlAKSB1gLtV78Z4YVTRn/kBl43012n527KXHu4mO?=
 =?us-ascii?Q?a4Gv08XaHQX5hcUmSEqOLYq7ZLxkyBW74lD92nxG9Hm7YclkbjTR+ZRREv8m?=
 =?us-ascii?Q?+G9nT7zHzViUtaGusaOZ2XPzmS3S3qeVnQMnOZuYN4CTb4DK80S+W5Vgb1Wz?=
 =?us-ascii?Q?R6hjP8YQ8u9qgSLsSgeG/fzjQ9SwOv+txJKQplA23xh35FezVFfaE5Y3xBZ0?=
 =?us-ascii?Q?hE+kFdW47YrwopTQ1S0pU7k06ahjpJMxJCLjtX2THL+rziu7OEtiaV5uxd0s?=
 =?us-ascii?Q?4R5lywqZuAM8nGOWi4OS5TgAhMLiU1Kod72nGe4zotSuV153nmkLmdf1RQ65?=
 =?us-ascii?Q?gWKiZzk5jH3LhnhVq9xXtutoU0E7GqYBkaBMU4gyFoQ1CZ4PIwkR4JA5fYMG?=
 =?us-ascii?Q?lZ4SCiK4mTuStSUlKo9QOC6Xfvu0Ce1U5Mf1g9ad2Yxgl6kijapEpL2zbACn?=
 =?us-ascii?Q?yt0WaRJeQxgTQqWjleq7InvEuIeLkTepwGkqc1wiy9Irjv7RCudDf/wOp2lR?=
 =?us-ascii?Q?ZyeWRt4OtMHpZu7LV6A0yikpoq9j6mKJzUbRFgvnDwA/yhGj+Ul4y62MwZZM?=
 =?us-ascii?Q?UAGioOuovuoGJSCWccoGW8nnmSyIJC9RitVASUXJnVwVs3p0fAArzbufsB3i?=
 =?us-ascii?Q?2eXHeTrThOZJj7v7xU2kJtmSIkAgmNhEmXBfXzdU+y2amoygGOaeRhc3in7U?=
 =?us-ascii?Q?GMuOK9FSwO9K2TlF/qEwd1vzMLqnNNDlWZp0k2GxsKLNTlhalZnoyCXUWNdg?=
 =?us-ascii?Q?oW56DIq4AAoxP2FPDvcizvzGPztvoWlC1IfeRWxWwIigzdoWItsLkLaDwOYh?=
 =?us-ascii?Q?k0PfdoM0aLRk22eOQUBVAPUdiSDko3vREniv5G2ftTOTT/Kz/9mqZkawQY1O?=
 =?us-ascii?Q?AnRn2Dwiwo8wPUG8xDlEx2AadGVEULiVjCZ87945Ftf8TQSUJNjqtKlL4So8?=
 =?us-ascii?Q?XEhivOHmiZQTyj8YKZkXR4nej1KRRql28AT5NhvQ+CdRl0Ebvh6uctRclN6o?=
 =?us-ascii?Q?U7qkC+8gRx2osmrfWiC5/9zZQNF7IwsKPzL4wDHsi2wGFkJiUQX2q0rCNrwj?=
 =?us-ascii?Q?lIc+4ulsbg=3D=3D?=
X-Exchange-RoutingPolicyChecked: eXJJi5ytjmyfh+VjTWbX8WfJYR2b6b4PhumvbPQkyJKbxE+6XunFTBY4p5Foh2HF/Uh0m2qnQuozeJHvbDgGSG5y448N8YnHdPUbla66O0sN0WJIOKz//0sxl5Dx76BvPRA6IK5DSvf+sK27wnOxCEFTqGpbR4JTFvurci7WxAUf/n49gS1fLmFLtzeKx1nbJCfTOjAVoQg+6Ghp0TCwHMYALQiLDIwCJ9F23ofX+z6P/Oxpg6Mmp+05em+X9ZrpGL4xFl/9l25ebeUqtIUhTd4wGLMQROtn7fuVYcBV9ZhuMQree4GLZ3xZSbB8aPHmNCdXz9tEX6HBGyZGreOu2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41106f0f-418e-4f14-062b-08df215cd234
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:44:25.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FOr0E0R+Lc9AFVuy7g997kDOtzINMddWmXqxYNi6B2LNQwb2xE0yLOLAJi8whjCvnmkCSfsuXWmT2nEDJONdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-kunit-fix-the-label-of-the-dummy-GPIO-chip/20261001-144053
head:   a3de9e52abf8088aa329337733ae4ad3cdb6f10f
commit: a3de9e52abf8088aa329337733ae4ad3cdb6f10f gpio: kunit: add a test case for platform lookup tables
config: sparc-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021118.3YnVbQoU-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021118.3YnVbQoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021118.3YnVbQoU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-kunit.c: In function 'gpio_lookup_table_global':
>> drivers/gpio/gpiolib-kunit.c:914:48: warning: implicit conversion from 'enum gpio_lookup_flags' to 'enum gpiod_flags' [-Wenum-conversion]
     914 |         desc = gpiod_get_index(NULL, "foo", 0, GPIO_ACTIVE_HIGH);
         |                                                ^~~~~~~~~~~~~~~~
>> drivers/gpio/gpiolib-kunit.c:897:42: warning: unused variable 'pdata' [-Wunused-variable]
     897 |         struct gpio_test_consumer_pdata *pdata;
         |                                          ^~~~~


vim +914 drivers/gpio/gpiolib-kunit.c

a3de9e52abf808 Bartosz Golaszewski 2026-10-01  894  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  895  static void gpio_lookup_table_global(struct kunit *test)
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  896  {
a3de9e52abf808 Bartosz Golaszewski 2026-10-01 @897  	struct gpio_test_consumer_pdata *pdata;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  898  	struct platform_device_info pdevinfo;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  899  	struct platform_device *pdev;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  900  	struct gpio_desc *desc;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  901  	int ret;
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  902  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  903  	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_global);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  904  	KUNIT_ASSERT_EQ(test, ret, 0);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  905  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  906  	pdevinfo = (struct platform_device_info){
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  907  		.name = GPIO_TEST_PROVIDER,
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  908  		.id = PLATFORM_DEVID_NONE,
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  909  	};
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  910  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  911  	pdev = kunit_platform_device_register_full(test, &pdevinfo);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  912  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  913  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01 @914  	desc = gpiod_get_index(NULL, "foo", 0, GPIO_ACTIVE_HIGH);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  915  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  916  
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  917  	gpiod_put(desc);
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  918  }
a3de9e52abf808 Bartosz Golaszewski 2026-10-01  919  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

