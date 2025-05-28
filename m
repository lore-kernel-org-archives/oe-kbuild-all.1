Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A6F2857E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438459; cv=fail; b=HT0egeJAB9v2xYkNvuTTqpsx8N/MAnNqKNrS9PqISjCQzA7rf5K3RRfQtHGq0/qXcf87O+7mpZelluZ+COM8byGhg1yd5RxxiKYdEJ1uTRxsVpMvv3/gM2XiNXLUnXe4VPx3qRTjA5UCGQp2oZtNUqO5W5FhB5N4QdAv8Qqs9sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438459; c=relaxed/simple;
	bh=zNOzf7/pS7xWXMBRrPnwGNbURXCsUoIph3QTcoPoQK0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HBFIi31/HvMSIOdMREdEo/lmtohfeA3x+EL764SMdEV7pFJEMqrQp0w5s3++KMF/r4j83WE2BNF7+VAvy7WuGqsp/H3D2J3+zfFFiiBO/Zt6emGqZBCx4zTcyFeZG5zN0lNm7tOklbMtIpdn4bVx7ZBvvY10J/piHfNDwrAy/hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gg0RZaFy; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg0RZaFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748438457; x=1779974457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNOzf7/pS7xWXMBRrPnwGNbURXCsUoIph3QTcoPoQK0=;
  b=Gg0RZaFyf+LO4kEKQho5O/ROvQj6yjifzN0I71BNmCkvt0G5CO2+scOS
   MOVjfns3J6ui9NB8TKShFLNzHaGRQHAsi3UysEnHJ0IUgT41/nrbafhBT
   wGlGRlft0M3lT3Z5mNJVxuXwbcHrXP+oWnAtllXErsHr7GZsWV8dK1Zks
   8tikl1KnqJV99JIBDJeyqjOPKyjwA5Fix7S/tt5H/cXg/oBtMtIvKKAJv
   E5w5CzIPN9ARNUdHZ5ou6p95E6OgjPne0L96+edpU/QFvgaTJ0ZoYZv5Y
   m5y1mzDSFfy60hv8dMo76jYl0Ya4F31XEo7U9iZB01CQJJevGqK4AJDtM
   A==;
X-CSE-ConnectionGUID: WYWG40EtQA28/BdWBU4n7Q==
X-CSE-MsgGUID: ugejtU30RdyvEVLlmtAJ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54258974"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="54258974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:20:57 -0700
X-CSE-ConnectionGUID: glbhqileTauJ0XBgdwgIxw==
X-CSE-MsgGUID: N/0DAl+FSr6fmv7hRISofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148099642"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:20:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 06:20:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 06:20:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 06:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etXQxUkjwcoSNaH97GKsM7dRvAWZGaKxzibvy/zQZNq1YyYeJd2AU13oujzUSVlGhbMydpRHmzU9sGXFBe+Qf9OOYPL4x4YHXffCykLhQPvo1tg8I9nMWKPOEyF+HsvoqTJPodiUemHEUm0TJzzOPajxrIBW/x6sCFfHR1GjG0aZdq2UZ3oyM39GSWzNXyb34ptea22w/VikbfP3MXsCjH0KrlCtLyo1kmeroIbjEKPub7WcyYdVlWSHXPyecXVwcL645fHuX1YuqdFI/yq6WD4OCDUZvl7KL2ePth0q5+5vG/txxFtApdiRCWlN196Que2RuH3gwTeXJw/+KAz2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAvxLLkgq8Qusnnu3BNNDifWzxzTdvTMNq2FfwgJYoY=;
 b=LPxBEYy1ApGrowNnjV+geLsP5pBQHJCWWiIuCCscyXrwhhSn2gDHT8vEDfSRqERXZhIx1Np0XykM8BoXAWxKn9Z63hoGWJyJmwfeFpns3+RSkb+quAQZzrDSWl2cvKF7aMtV99VAqibajkwSahrZM5IkL7t1bkd2Ul05McOl4a6/nhGy6coAN+ckfbroQOsnQyspGI4uCvW/zj54BwcIEu7UawfwEaagC3Ck2EY+1VmlTMbMuyOPM+fH8oki8MSwsRLlWuj4d9RtokQfRacMBMxdcCqR61MtH+Qzt3aRR2IAGY0u4HmgTf8SI9l127MbCVnRDZTt/SRGs4jIqPsIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ5PPF6806D69E4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::831) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 13:20:54 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8769.029; Wed, 28 May 2025
 13:20:54 +0000
Date: Wed, 28 May 2025 21:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 8204/13758] mm/kasan/kasan_test_c.c:1489:27:
 sparse: sparse: Variable length array is used.
Message-ID: <aDcNrma9ybPsQZcZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ5PPF6806D69E4:EE_
X-MS-Office365-Filtering-Correlation-Id: f68d9108-4dd7-413c-895e-08dd9dea7993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y6HSxpKlRSmxJmh4usuWATUa80/LG0zOQprV02tuozHNw4vQ1gS2veIAJfol?=
 =?us-ascii?Q?QyADBZl2Js+yErGsvzoxYNkONPNDRBtf2ca7B0Wab8gJ8CvguK9LbAigb2xY?=
 =?us-ascii?Q?SesrtErUa5hOqQ5hXBifIaJtIdq5ugVCw0rUkhq/On59CuWo3rMN68xkgxhN?=
 =?us-ascii?Q?Pb9SUY9LON3awnlocgJDBE3ey1e0DoMQ1MKtvJrSN/2/QcB6p+0cMzvVbqpO?=
 =?us-ascii?Q?gGz7HhM2KIn/4IIv+ciVbZP9MYhNQYim0Vqpz5zdnXIaTmLib7ZgVQ6TtOsX?=
 =?us-ascii?Q?xJO9iAX6538pBiACEIawMNgrbT9WU2eOiD3yf0CjRoqdaTHg1z1faLiZUUQP?=
 =?us-ascii?Q?TgF7etx6wbav5YnvUzB44db5hTqyVt8kIVI0CME1oOqio+6c1fXYe/NUPRKe?=
 =?us-ascii?Q?ZOFHS+dK2OrKAqYr235ZmNxNfs7xcDPVv5akDnC54i0QjDkJ1ZNVBmHuwFUO?=
 =?us-ascii?Q?Ne9S0JZ6Z4kMZ1fhTsVR20T/yWWE8DjWrJFqq5sCwhyJPg7fch5KFnxpP/Eh?=
 =?us-ascii?Q?GXLk15IDEA1D9h8+KKxErSQlgd9bD6hGLBgMkFZhA/vMjS0fd4qDW7DrpPIR?=
 =?us-ascii?Q?C6ULtxUZkfxjsHrzVOikpYjd0JPFHt26EDzvEdNBYAhnjtuQay07rPzuiUso?=
 =?us-ascii?Q?X4WBb/lddUFDyPn8IOUz/+nI4LlJibReSSR9geihp9TQQxtTNLlSgqjq3kdj?=
 =?us-ascii?Q?dVO5o0cyVl5bFCDxewvmaD+HuRfZFsIc7RB4tSXcIPw+5IPuj8XQx+dZwz2s?=
 =?us-ascii?Q?yAgcKKTJV9NjPOzSZxqybGFWEwSQ+6Ib1hF3HRdoONjTOdZrROTVS0BKaZ7M?=
 =?us-ascii?Q?j2hTMX4hsBBOPfdDpWheoPiRqChR9a+sX6iOlZTlci1F4D4fDOkgymn4XncS?=
 =?us-ascii?Q?8knnox0RN0Nu15HEAy0T5x91VDO7jwSO9ORnlScdpwtIBthZws/rq6clbWbb?=
 =?us-ascii?Q?l/q1AASKltJ88xKxHB7buHT/VyoRnOv9rw2FyEmLV+IHTOUpnHs1PFffDEfc?=
 =?us-ascii?Q?igOfmR08t1s90p1ddOUAvcTbuBmoSrzwyMr9AulMtKRhguEA67bwvz29iOY8?=
 =?us-ascii?Q?BHd+jnKFB4Qx1icm42MiGypxVy4apApnXb0B9wYZVoLQJHxnflz12V3eUDzi?=
 =?us-ascii?Q?UlenFAVrQx7khhNSPHwPsr1WxP8bsXEMQ2p2TYwnuBZYeiGaih0YrUV95X9k?=
 =?us-ascii?Q?ZSlMhQqcNvm5ib8vPSLwa4r4kbO04SoBKiwk5GiYXWeybTwssCRmG3X4OKuR?=
 =?us-ascii?Q?rgc4+D4TF2Xj2uNJGVmvf+OGjXgjoo6uSZBQ8ST22z3F5p1ZT5CN1c3zeigj?=
 =?us-ascii?Q?FWeKU2vVNOqw5h3d8duGvPX4kHxSz2zlG9eC+CQF8uuznXjgjDq93UMzYtzv?=
 =?us-ascii?Q?6dTJNw0XYfUx92PULyIDwfGykmO7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cOYj8UF4ZgR1yoEw9Lr+oK2sN+ioiv16MdiJK0bMlsJSEeV2B9iSGU268Lmw?=
 =?us-ascii?Q?bjeYUfIx6iox/L9C97Pt7UN24JyGCky648PHEF4E54dDiJYXVN/naQdsR/qs?=
 =?us-ascii?Q?BjUsGF8ZnnHfDQBYu4l//UDy9BkrOUN8hh2yWOlyN9r/MhpNcyPOdI1Ajxvq?=
 =?us-ascii?Q?5flJOZdt+tcEIqo1CmvynHB32HFHfxWErpsi/fNjDR1WGn16FeZduSY5o01Y?=
 =?us-ascii?Q?Jy1KYCXQl89bcLRtdW2knpXh8v1ILRm9rqmor2TV5Sah5ZrdGUZWm6sH3lV4?=
 =?us-ascii?Q?xUIeB5cntF6l99v83tlIm45/2xWN5xzbLBG37QibtR89O2eodKi+BArdcpkB?=
 =?us-ascii?Q?W8KzGUR6dOjqLypsD0ZD8Q5qL8YT6jdF1YUCM+b1jE312OEO4G6i2RYaneSi?=
 =?us-ascii?Q?Gtm1EKYYzOI7Zxf2JR6t9AvLG7XC8Bmzf38Pgo8+0WhO+4vtzU3ztUWkgeum?=
 =?us-ascii?Q?bDGXMU+gTwGUvEUZ/xlrxbLA8WkgTyNv2arqpuWkM2pUGnno1LnX916jndBa?=
 =?us-ascii?Q?k9o9IuFe1bj4zuMISIUYK5QDSKCcixmRYBmVgQ7WaiOWDRjX9MdGzRBKaXEv?=
 =?us-ascii?Q?NSRHn4BL2Yefe3gpx/WhKtyl2Anjt62Pjnu5s/F+6H2BS3o6ysSl954Rj4vn?=
 =?us-ascii?Q?6p0tz5s6U7wTJfiwUIFz663+cDtfqCL1zTSHHYZ3tLE+0HXbdTTC518dLi3+?=
 =?us-ascii?Q?/xIA/qOzsW96BoER2jokkrqxs4LjRw4b7ZP6F2ihWscXqDoCN4b0yRkzB8/H?=
 =?us-ascii?Q?CsXx0GidLJCOhluLwCZ8QRPNJqqKPFjwX+Rxa/HenmDDl/5h6pp9wLo0fM3P?=
 =?us-ascii?Q?YHSkAeKTsag9dun+ZpBib/aUZ1MySAeBRD9ymwUwBN3nR4P6U1iewe+Umdp9?=
 =?us-ascii?Q?q+z0hJyqyNbNcoiOM45cpeLbW514t98pjDQYfQsOG6u4eTwpqrKcFcxtUg6A?=
 =?us-ascii?Q?jVJGOw0me9UM9JgQAXBoQnpY3tFPaq7coM6QAPne5/S8tZMkxeEYyJ1Pyl1n?=
 =?us-ascii?Q?hmitYYfPTjJ9qhUQVI7rTtH05rlyHxyS94NA71iduy/oNSA8I9wyiJIe4ErW?=
 =?us-ascii?Q?3DoVHE9+WxdGTwR6T1px2/Mxxgc60BXn+jxxxSZ5i7kyxY49ZQMq99h1LwqR?=
 =?us-ascii?Q?8iqYKjf+J68YfkXCAcI9Nqae75U4FwGcbQL2LONpIn9UdHeJmcHNA0CtRlcO?=
 =?us-ascii?Q?kLu9jCW+925cdiCAWIOnMD30Y0VbF8s+XJ+AolCFfDRSbzaRgqRfaou1Glf1?=
 =?us-ascii?Q?NIcRMk4LfPHx56OY5g+bmLtyBWupNwMqzI17Irm4vkbsE4M0paew56RbXkzi?=
 =?us-ascii?Q?R8oSZr1z2VMzSXDW/q0cEkxSbO8oUasn1dklz26AgD8xSD6j8aW7fOBmP1wN?=
 =?us-ascii?Q?SIK+Lyb9EeOCcU9TAdNtaqCLU0aMUMUYeTRALoMa58jYTJdaCrwTvMjV4czp?=
 =?us-ascii?Q?H1+xj9REeYGznfZpCdaXgCNqjEiTn2npK5sk/D8MgY0Dqu/11NHiw+zpAi8Z?=
 =?us-ascii?Q?0QCZH98TN/VQaLteqAhh2wvEXQTy9Bp44Y51j/rlAdbXovQ+Z0fXryz0OELK?=
 =?us-ascii?Q?8Dqr9CAivaSe3dTvWJfJtvlswf365cftXwjSnS79F2TW6aYMErhzwB/bSwp0?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f68d9108-4dd7-413c-895e-08dd9dea7993
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:20:54.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlPmDlqojHTxE9fIR0XMPb3WSirX5QPn/1LL7thDYj9ev89xhq0F8Cul3HDWulOuB5HBRshKILy3ZNjDl5tuRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6806D69E4
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   64d12554715ce825d553caea123b7cb89e56237a
commit: 5e88c48cb4bcbd0ea683373a106268933bb4edd2 [8204/13758] kbuild: Switch from -Wvla to -Wvla-larger-than=1
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-121-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282048.O3Y6hbXc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282048.O3Y6hbXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505282048.O3Y6hbXc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable length array is used.
   mm/kasan/kasan_test_c.c:1504:27: sparse: sparse: Variable length array is used.

vim +1489 mm/kasan/kasan_test_c.c

eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1485  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1486  static void kasan_alloca_oob_left(struct kunit *test)
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1487  {
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1488  	volatile int i = 10;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06 @1489  	char alloca_array[i];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  1490  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1491  	char *volatile array = alloca_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1492  	char *p = array - 1;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1493  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov    2020-11-01  1494  	/* Only generic mode instruments dynamic allocas. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1495  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1496  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1497  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1498  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1499  }
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1500  

:::::: The code at line 1489 was first introduced by commit
:::::: 00a14294bb33af533f7ac002fb20623fdd8ea0d7 kasan: add tests for alloca poisoning

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

