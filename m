Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDF2FB6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739712327; cv=fail; b=tz0kVRzUBEYEXmgzKNDyQYj2Cj3yHR2RIX9G8hiqy6aFvChTIVrZJwhFNwCD0OYD3iBBs5n7uZnn1QbTEdLqP3IWACPA5d0BkJxrYnXoWiH/2yaQ39nQ/fKtPZSh3PZgDBIXggD9Hy3mK3kKDyJZi+FIysfl7kjcbcOOZrS2BjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739712327; c=relaxed/simple;
	bh=O9+8omsRnugsP76lFeqSryu4+F8lsK5Mr/gzAMWX80A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VT8P19F4FtwGgEj3OzAxvGyjy+JC0b+SJ+/aCSI3gWKBcEM9mEW/omepsC/aCPtd5efdHkult3qNro8LfopKzAluDYCv4RpgqkhZXTSRp6or77fTogHd95B3cTUUhNqVDskruiM0qlA8T540tHWv31Zrixv8T8ozpsIuaUfuVvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZtUAFtv; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZtUAFtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739712325; x=1771248325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O9+8omsRnugsP76lFeqSryu4+F8lsK5Mr/gzAMWX80A=;
  b=UZtUAFtvgABBfsQjhQJKJaJALMY+ygi+euGCvyafxKnyJP/TioNOY3AF
   VrsTj47jebMP5i4lPy7ZBuLuRfdpuGTbXp/E4sZQX9AuZrOJIzcxON2M5
   Qasm3pUj+nWN57EimGqVjqQkkBAarKSkYBa1V/rNHHdx/iF8OcmAR7Y+6
   Z5+yen7hb8B++vxC/80/91G5yUC3hNlM9wOdO1t4g1TgnyUmqX/PbxyMS
   SUKOdAZJVKg7wLRMgcJqgcNx1MLBFroGUtg7sf32rJ+kmJjlKKCbA1gct
   gflD4QWF8ZsCdzGsz+qB1Og6XgYKtdIrTRf9PheEXY3Pz1Fb99SODrS69
   A==;
X-CSE-ConnectionGUID: 1sg6O2tyTziCyaJBPMLfNw==
X-CSE-MsgGUID: 8r/YPytfQ52FuI3DBFm7TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40263977"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="40263977"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 05:25:25 -0800
X-CSE-ConnectionGUID: 2oymTG36QDCfg3b2k5IjTg==
X-CSE-MsgGUID: vbYbF+/3SUWVrwft3qxuzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137120034"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Feb 2025 05:25:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 05:25:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 05:25:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 05:25:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTqNA3/6TYGUuOXsQD3wNfKhtJq/QFX0D/oSgztfMfL3a6mqikreKkDaQt/xOkxLKLytY6NNk1O1Fvh8DkXx1EIas8kxshKDBM5A1eGqlPo3H/hHQa34yhA7O4MC8yd0LBQ2pg5fQ1Al6M33TuAEfFiI65VAiE/CXKpnGYuZKGLB30RaPihmhdi788uz28Rf1D2xCkZ68KDwndR1zpt8vyannCwhLP/qJ43RGIb8YhBz9cmHEK93lKm4AYzhE3bvL3yOvIt6ft/hFzpeDyPmoBNRE2Ia9dulxidoX9sdUe/gt1o9kgpEfWPl6iv5BY/zkFuNQ4AKhb1loWLgtvRGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIS0JBQBUaeW3rL9/lvS49ASCEqQArQdgCi7KdyDLH8=;
 b=qMG88aJ7P3Tn4kZ/2LVDJxaXJmAZ+qITabU/vHFMElfDkdsYlQDuas/xdqRBANyS/Zjswf0b6hEuS9H2o/aIOVMEf7Hux6oRXAQsJFRI4e1yiVLAlq8Ghqn5zm6Bdh1IwuaPe9jYI1xV27x58906H42qoM5NKR1WP81ObcnpVzMtgohQY22t+QWiYK59BAOCIvrbZ7+WC98J1OaFfeGRA2VTa6so6BIU0FVNJccxGPYJ/teCs4l/smdMRgrBCst3qhMcXjfDWAVqxQdBp++Ol5sdewK/mxQCQny+UUC9XSDZNzlpFh9FFl6wyfReSiQQ9AkX2B6mxE6I9lZchQ6mRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sun, 16 Feb
 2025 13:25:21 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 13:25:21 +0000
Date: Sun, 16 Feb 2025 21:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-6.6 5/5]
 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:591:28: sparse: sparse: non
 size-preserving pointer to integer cast
Message-ID: <Z7HnOUt2j0pIFQGQ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: dbef20df-0ed9-4ab2-443b-08dd4e8d5c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MRTBAfOEWYgQns4WjaFRMv+CQb8Pz5CwL73b+ohmZnEyxv4bU0kVc6qSwWXW?=
 =?us-ascii?Q?wK3pxRAoOkGeRCKmlh0JrD/jh/hfqqyjDslPoMStmssgEwQ8VzIvi4naXd1O?=
 =?us-ascii?Q?9blBfv63fsY3zadisfAttkTamiOq33UrJ4Ybcd9p7NHUTQjrQDoOTGs6lQQ7?=
 =?us-ascii?Q?lQoXZbzwqFXSXRMW8LJjybriZ5MO0Z7xYPpRpHfilDnySr9eQiyZ+Um3D3yR?=
 =?us-ascii?Q?ZJI48fSpo5UhUOintu11kRfhoXWa5YNO6TE+qGSyJr+meJvHqZ4uKS/Rt54k?=
 =?us-ascii?Q?ANUiZALF99iRe1EQQDBOs2kky+88UpL5SWrbdi7qCuB53CSW7ezAbc0i6Q63?=
 =?us-ascii?Q?76h44d8hdLgL/agFmvNfdOlPA3bb+kqNAhywpYon7rciCY3IRsJkkeJnGDZo?=
 =?us-ascii?Q?Cnj2g0DCkyQzoW0cV4QHXavKsECQKbK9KoR+LUoxFE+vsqN6B2Z7d29XcPHg?=
 =?us-ascii?Q?LZibGWPcQO97HRIsnHvH1ptQZaQ+glp9/ScVBWB5vc0wZ+ylYKP0NVQx10lU?=
 =?us-ascii?Q?5sI4sLIVOW5i8vHKTEB5UhCsK5ljGLeU6a5JjVrCbnH1GZGu4otvjGinAueQ?=
 =?us-ascii?Q?JPhTpaFfX47AnZUJplmV8WX3NEdwPBpQr81QwUr6G/MAeigfMqpxhGzIDj6z?=
 =?us-ascii?Q?iXs1uefRnaLI4mvrKyl6Jgfa/tDQx8hCQZzrawg1KCWVO23VIUIA+Hs3ZN/M?=
 =?us-ascii?Q?SNeJhkwVHvNQD1oJamXkFRCQlRiY+JfDbHm2ERs3TbJP253paU2WN07JE07i?=
 =?us-ascii?Q?q6EIvS5/uo4J3NN+1rzejBG/4Lc7kNjnmO53VR+row9f5lwHCCCeoVaONHgl?=
 =?us-ascii?Q?IQnBRRUHPuov0/gYXUih1hAhiV6RZw+xMeU9UBBNGTASWd9/5OmROGtfB+aW?=
 =?us-ascii?Q?veS0yoYvOFfMNjMJckM8hCZJLT7z9GjiV8g0OPDhyhA9FvGyk5jzE4swjoIb?=
 =?us-ascii?Q?L0QbLTiY2MLkbMyVxVc+VNzyUsF9XQ/eVCqldF4Ep/pXYI9UE2OVVumh3AWp?=
 =?us-ascii?Q?J4J8jHOdznwDmwjAK3sYup0qAWGKXMW0ppTFjy7aIog2DG2VlyH0HbifZYne?=
 =?us-ascii?Q?CV6fDL9d57NljmSCr1o4OW9Oa0GRx6v2x74luHVONargnQtJ7AVVp75Nuzmi?=
 =?us-ascii?Q?CMvDDWEtIa2cFvf6v4OeMh2bk8kC9y39dRuk3/ENUsc+FOLE1ROYollz8aij?=
 =?us-ascii?Q?D8isOJBIFHVoqymNR992Y+mhYkZ+zhMXKtiGAVsa3BKndQycWKKMB96wHrwd?=
 =?us-ascii?Q?9RGBR68uAbUZSJbO+nE0a21xfX7jPiDUbeITvKAi9ONVJfAxoAMpB1DKggqC?=
 =?us-ascii?Q?vPC7WLmmjRafK5pCHi5f8VAmKzyzzpEMzLVGvyEnu70TZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F1n63ZpfcVY6Sp+SKk3Xy1AISR0Cw27V1L8v9NcBhritW0NB4hdBGebIvTxZ?=
 =?us-ascii?Q?RAptd+7L/ZRCnRuAAqMSSV3a8skgVylhJdzNd3g9Xn2aKhsj38seK0To9YH/?=
 =?us-ascii?Q?EZV4RY5VjRe4GXXrBqBE165Dhg11bqTbppCMJ0IaSiNFmVIuXgywzrxo3ffH?=
 =?us-ascii?Q?LKQQc3cNNl2jnsifHuNi//St8i3XS5ZeqrJR5/xBx2kE5BzUUV8yXYSQRRA6?=
 =?us-ascii?Q?dZcKRLeYPvHR45aZq1Ptv3s42d0vKNV2f24jn9SfmuUKkLND+wEU4+0OqAew?=
 =?us-ascii?Q?gkFmpv8X8+eal/7KgHYEdE+v9ZH0uAXX8w9xOdxqINK1vGkizdP6XhVuSMFY?=
 =?us-ascii?Q?CDvamwdQJEkmBS10QU89X7Ymc+7F7RVOmKZKStpfP4W3uJ8b+Nslq8Lj7Sg1?=
 =?us-ascii?Q?xwiy+Jsxc1G9KJcZCrxzOJyxK6z0jKid5HXhJJxHdmSVSuh1dEOmTlA5E5Hj?=
 =?us-ascii?Q?ibJgJ0Xuq6Jks677h0CkPexI4aVDCB6VY6MDvvxgyaw6badYfr541j04HuDf?=
 =?us-ascii?Q?6Yf1XgHTP2ev+DNwLlC1SahPSFRv8viN5HLt06pJrldis1XI0e8TIFG5n74H?=
 =?us-ascii?Q?t7bicJKp6YkNFlelnXO5VPAJUEEdbgmmG1qAVP8lF2d0pWr88gcE0RG+K0oV?=
 =?us-ascii?Q?Rb64RRRvl5rCC+fhBPMg3shpbl++Sq1iEjQv02RXsAVn+DE/UT6pFO/Jo/s3?=
 =?us-ascii?Q?uaVXiOM9I8TPuqcuUsFxEV5KQafENoX5bLyzYrKoEHsCn8tcg8E+WEB7sF5A?=
 =?us-ascii?Q?Rc20Ha19/BncTQZOrFUrYLagkBufgxpGDAzSvxDpoTtL4WpJmCCQHXqueFh6?=
 =?us-ascii?Q?5zR/AK95p2TLpvuGDAdgCVydQl6rBuM7l8WB98RkYIxaFC2V3v2iiJcmVN1Z?=
 =?us-ascii?Q?MYmLk+RpApjwBPjmqkjnCmVPws+WZsYBSoGhn+X3KdCw0D2ogvtH5MdLfJP9?=
 =?us-ascii?Q?t/ioz6+KmnZdHs8MoHkLs8jsvcOHiffPie9Z8LxIPNJFJ54ePQ+5WaqAdAgn?=
 =?us-ascii?Q?AuELDrxL5B0VsxmyxIJGRDwFuNi5kIPE5yYjwq79qZqqbfkTXNfsTGrxJW4t?=
 =?us-ascii?Q?2TdpPH8yQ2elGNdh79MoPhNlKJjzjLQYlAMgayFKYpFV3kNxsL6pgCnHYcV5?=
 =?us-ascii?Q?LgpFoWtjf+qHimYlvP0v7FaP7sjZ4jW9K8vBoXJhupRgyv3l6rtHH3HlSTiU?=
 =?us-ascii?Q?Zs7VhMZo4/ru7JRqpqHJBYt1tYuNzq96KBUSnLAtllvY5miN3KGsDqOVvziq?=
 =?us-ascii?Q?4agJiiSO/DhO/hMsyI2/S6cxBTbVLrnG8vXE2N+lYu+3sWmPFn+4AMfSA5LD?=
 =?us-ascii?Q?+rzPc/YHyvyODUkps6ZITmsJCQKbb3zLDHGkB0D/5pfLohFV//BX+aqVgBJK?=
 =?us-ascii?Q?QsH+grNU/3rcEdXOYsvvFxUUt3HmJ2QOAef8LJuW8/iRCRX5y+I/KDpIdgNQ?=
 =?us-ascii?Q?vNM9mKfsY36zeMwGtwGmaCsI26t73mkJ6DkSorQ0+A1uhILDOPcWvjFHhSvK?=
 =?us-ascii?Q?Ad68ZzAO+9+pi1PwCeC1UNmxFSJK51g/v3ULB0QDQr304SySxn7v3OQ6rk3h?=
 =?us-ascii?Q?n7Ekax9KGTEHToT2ATxfKibMv3p3qFf2c83raEVW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbef20df-0ed9-4ab2-443b-08dd4e8d5c93
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 13:25:21.2494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/tKgdYt2ORif8eNZMJSXbzBdYuxPkrBcoqiq7OsKcp2mkyHEUkp46C83GOchcB3fFM3OtRPl3GXwEXjW9J5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0d96e807079196f870dcef51ecf4bd53fb5472c1
commit: 89cb8bc425a44875dc0420914465cbc1936bef3f [5/5] CHROMIUM: ipu6: enable the psys downstream driver
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-062-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161619.sPN1QgLV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161619.sPN1QgLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502161619.sPN1QgLV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:591:28: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/media/pci/intel/ipu6/psys/ipu-psys.c:952:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] ret @@     got int @@
   drivers/media/pci/intel/ipu6/psys/ipu-psys.c:952:21: sparse:     expected restricted __poll_t [usertype] ret
   drivers/media/pci/intel/ipu6/psys/ipu-psys.c:952:21: sparse:     got int

vim +591 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c

284a3b163de88a Bingbu Cao 2024-12-03  539  
284a3b163de88a Bingbu Cao 2024-12-03  540  static int ipu_psys_kcmd_send_to_ppg_start(struct ipu_psys_kcmd *kcmd)
284a3b163de88a Bingbu Cao 2024-12-03  541  {
284a3b163de88a Bingbu Cao 2024-12-03  542  	struct ipu_psys_fh *fh = kcmd->fh;
284a3b163de88a Bingbu Cao 2024-12-03  543  	struct ipu_psys_scheduler *sched = &fh->sched;
284a3b163de88a Bingbu Cao 2024-12-03  544  	struct ipu_psys *psys = fh->psys;
0dfcffdba7520c Bingbu Cao 2024-12-03  545  	struct device *dev = &psys->adev->auxdev.dev;
284a3b163de88a Bingbu Cao 2024-12-03  546  	struct ipu_psys_ppg *kppg;
284a3b163de88a Bingbu Cao 2024-12-03  547  	struct ipu_psys_resource_pool *rpr;
284a3b163de88a Bingbu Cao 2024-12-03  548  	int queue_id;
284a3b163de88a Bingbu Cao 2024-12-03  549  	int ret;
284a3b163de88a Bingbu Cao 2024-12-03  550  
0dfcffdba7520c Bingbu Cao 2024-12-03  551  	rpr = &psys->res_pool_running;
284a3b163de88a Bingbu Cao 2024-12-03  552  
284a3b163de88a Bingbu Cao 2024-12-03  553  	kppg = kzalloc(sizeof(*kppg), GFP_KERNEL);
284a3b163de88a Bingbu Cao 2024-12-03  554  	if (!kppg)
284a3b163de88a Bingbu Cao 2024-12-03  555  		return -ENOMEM;
284a3b163de88a Bingbu Cao 2024-12-03  556  
284a3b163de88a Bingbu Cao 2024-12-03  557  	kppg->fh = fh;
284a3b163de88a Bingbu Cao 2024-12-03  558  	kppg->kpg = kcmd->kpg;
284a3b163de88a Bingbu Cao 2024-12-03  559  	kppg->state = PPG_STATE_START;
284a3b163de88a Bingbu Cao 2024-12-03  560  	kppg->pri_base = kcmd->priority;
284a3b163de88a Bingbu Cao 2024-12-03  561  	kppg->pri_dynamic = 0;
284a3b163de88a Bingbu Cao 2024-12-03  562  	INIT_LIST_HEAD(&kppg->list);
284a3b163de88a Bingbu Cao 2024-12-03  563  
284a3b163de88a Bingbu Cao 2024-12-03  564  	mutex_init(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  565  	INIT_LIST_HEAD(&kppg->kcmds_new_list);
284a3b163de88a Bingbu Cao 2024-12-03  566  	INIT_LIST_HEAD(&kppg->kcmds_processing_list);
284a3b163de88a Bingbu Cao 2024-12-03  567  	INIT_LIST_HEAD(&kppg->kcmds_finished_list);
284a3b163de88a Bingbu Cao 2024-12-03  568  	INIT_LIST_HEAD(&kppg->sched_list);
284a3b163de88a Bingbu Cao 2024-12-03  569  
284a3b163de88a Bingbu Cao 2024-12-03  570  	kppg->manifest = kzalloc(kcmd->pg_manifest_size, GFP_KERNEL);
284a3b163de88a Bingbu Cao 2024-12-03  571  	if (!kppg->manifest) {
284a3b163de88a Bingbu Cao 2024-12-03  572  		kfree(kppg);
284a3b163de88a Bingbu Cao 2024-12-03  573  		return -ENOMEM;
284a3b163de88a Bingbu Cao 2024-12-03  574  	}
284a3b163de88a Bingbu Cao 2024-12-03  575  	memcpy(kppg->manifest, kcmd->pg_manifest,
284a3b163de88a Bingbu Cao 2024-12-03  576  	       kcmd->pg_manifest_size);
284a3b163de88a Bingbu Cao 2024-12-03  577  
0dfcffdba7520c Bingbu Cao 2024-12-03  578  	queue_id = ipu_psys_allocate_cmd_queue_res(rpr);
284a3b163de88a Bingbu Cao 2024-12-03  579  	if (queue_id == -ENOSPC) {
0dfcffdba7520c Bingbu Cao 2024-12-03  580  		dev_err(dev, "no available queue\n");
284a3b163de88a Bingbu Cao 2024-12-03  581  		kfree(kppg->manifest);
284a3b163de88a Bingbu Cao 2024-12-03  582  		kfree(kppg);
284a3b163de88a Bingbu Cao 2024-12-03  583  		mutex_unlock(&psys->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  584  		return -ENOMEM;
284a3b163de88a Bingbu Cao 2024-12-03  585  	}
284a3b163de88a Bingbu Cao 2024-12-03  586  
284a3b163de88a Bingbu Cao 2024-12-03  587  	/*
284a3b163de88a Bingbu Cao 2024-12-03  588  	 * set token as start cmd will immediately be followed by a
284a3b163de88a Bingbu Cao 2024-12-03  589  	 * enqueue cmd so that kppg could be retrieved.
284a3b163de88a Bingbu Cao 2024-12-03  590  	 */
284a3b163de88a Bingbu Cao 2024-12-03 @591  	kppg->token = (u64)kcmd->kpg;
284a3b163de88a Bingbu Cao 2024-12-03  592  	ipu_fw_psys_pg_set_token(kcmd, kppg->token);
284a3b163de88a Bingbu Cao 2024-12-03  593  	ipu_fw_psys_ppg_set_base_queue_id(kcmd, queue_id);
284a3b163de88a Bingbu Cao 2024-12-03  594  	ret = ipu_fw_psys_pg_set_ipu_vaddress(kcmd,
284a3b163de88a Bingbu Cao 2024-12-03  595  					      kcmd->kpg->pg_dma_addr);
284a3b163de88a Bingbu Cao 2024-12-03  596  	if (ret) {
0dfcffdba7520c Bingbu Cao 2024-12-03  597  		ipu_psys_free_cmd_queue_res(rpr, queue_id);
284a3b163de88a Bingbu Cao 2024-12-03  598  		kfree(kppg->manifest);
284a3b163de88a Bingbu Cao 2024-12-03  599  		kfree(kppg);
284a3b163de88a Bingbu Cao 2024-12-03  600  		return -EIO;
284a3b163de88a Bingbu Cao 2024-12-03  601  	}
284a3b163de88a Bingbu Cao 2024-12-03  602  	memcpy(kcmd->pg_user, kcmd->kpg->pg, kcmd->kpg->pg_size);
284a3b163de88a Bingbu Cao 2024-12-03  603  
284a3b163de88a Bingbu Cao 2024-12-03  604  	mutex_lock(&fh->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  605  	list_add_tail(&kppg->list, &sched->ppgs);
284a3b163de88a Bingbu Cao 2024-12-03  606  	mutex_unlock(&fh->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  607  
284a3b163de88a Bingbu Cao 2024-12-03  608  	mutex_lock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  609  	list_add(&kcmd->list, &kppg->kcmds_new_list);
284a3b163de88a Bingbu Cao 2024-12-03  610  	mutex_unlock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  611  
0dfcffdba7520c Bingbu Cao 2024-12-03  612  	dev_dbg(dev, "START ppg(%d, 0x%p) kcmd 0x%p, queue %d\n",
284a3b163de88a Bingbu Cao 2024-12-03  613  		ipu_fw_psys_pg_get_id(kcmd), kppg, kcmd, queue_id);
284a3b163de88a Bingbu Cao 2024-12-03  614  
284a3b163de88a Bingbu Cao 2024-12-03  615  	/* Kick l-scheduler thread */
284a3b163de88a Bingbu Cao 2024-12-03  616  	atomic_set(&psys->wakeup_count, 1);
284a3b163de88a Bingbu Cao 2024-12-03  617  	wake_up_interruptible(&psys->sched_cmd_wq);
284a3b163de88a Bingbu Cao 2024-12-03  618  
284a3b163de88a Bingbu Cao 2024-12-03  619  	return 0;
284a3b163de88a Bingbu Cao 2024-12-03  620  }
284a3b163de88a Bingbu Cao 2024-12-03  621  

:::::: The code at line 591 was first introduced by commit
:::::: 284a3b163de88a1c1c1da092d99a9e9ab9dda477 CHROMIUM: ipu6: move the downstream psys driver into a separate path

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

