Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A411CAF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723169018; cv=fail; b=c/WY6eytdtTlDO6JNlFNMPGlENlflTZi2b1tfrZzFpXQDkUwFZzbV7Wsa84gU7X2KpNRLTE2oxJE0cJXdw3RFd80aqKFCLZfpSio5YSJX9FljKlTsZKloLatPY2lBDndY0+LclBYD5AStLCUfFgej2ja24Ib4RorfxCoS8ouSec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723169018; c=relaxed/simple;
	bh=iljzf71tV+S0HQhTvH8g7SB9IjNT1+QFmwayMdGZtq8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=skflwCO8qj4DWLEtRdGsjahV8FRga3rCrPvjeDRsY+BVX3D5tvXUlXemaYQO49YTaktDNHGIm3Zyqj+fF0LcLQaGdqy94T4HVMVEvjj5maPinZbHphn/cvM8hTciXXBZ9skMf8oTt/BrLpfRpi4hjKmQwy+34DvclXWby67SNlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtOLGrTO; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtOLGrTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723169017; x=1754705017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iljzf71tV+S0HQhTvH8g7SB9IjNT1+QFmwayMdGZtq8=;
  b=GtOLGrTOwOZDxsXlc8oYt7JwBjO0p/qQFWnQj3J3xycNzV1I/CxltVhd
   uSgWn2LqGVVdobrYf1afxJtocFgveB3pUac93wyGDROHvnPiht12JA+jg
   H6CWuZwPKa4fRSE6XR/Bryrn6O1bDXxGypN9J2leXKEjq6WoGEFTTVC2L
   uHhBTclvj6j2Sy/D2H046okjqrhQ2QdfR9JtG1CZpxspMogilaszknxT4
   tFoXLCmte3IfCyqoqBAJC6RmhOLNZEFc2mdZsK/heiqNuosuhypW/zKH1
   XudZbqa0zeduZenZGaG/UiRyVdWaYW3j6gSSl3yL49JqX4V1qW0mLtMTV
   g==;
X-CSE-ConnectionGUID: 78HIl32YSJ2WVQiVqBK77g==
X-CSE-MsgGUID: ngQStQvMQPqX0xZsbxcXkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32476659"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="32476659"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 19:03:36 -0700
X-CSE-ConnectionGUID: RDnRjsjvSoOnF0E59uI3Cg==
X-CSE-MsgGUID: s+kZtQsqST2WrXut3bib5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57077788"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 19:03:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 19:03:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 19:03:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 19:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnUx291m6/DtHNparMInMzIJVpYB6MMYeJFPxwlwBwD76wKSscB22Ej1xxf5cDRxqY/K1NrcUbL7VAULWd7htGzkGKcSixqW0ga9lSkTJmGow1lWcCGLKBSXgZ3N55pNhAQRHTY0IVwLEwzna5tPf7PK9jREB6dYynaUFIMZgR07U4EPhoVBKzymsUjEGopw7fDUSod8FpYSqvC1KN5eKCibaaw5/ngfdBQ47PRQPLO0zi4iFRq1XJsnLekI0stbD6r/rWS2tJDqemjcDFYHbjaPBsXOpm17OgMfflBute9Lu+m4l4IztHMgrqP26TmfVwpZNJB5QZMH2AxHVoKvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/Yc+zTeND7QmwKGrLwBOULltXg5A5M9KB52DnhCS9M=;
 b=laveszeUtddNYChkbOM1I3XR8GblDszNPbbM/DSs1ZiazU59MkYPlTMxVoIt0nmsFDSLC4WcLSwb/ALHtl7J9p6WThjokovmCLovqZCeuBrBO9Zj+AgtiblUdINO7ftqykAc824gjZTM8pA07SPhiyidpx+6VA6J0QUSLa9MXkuxCwhCd2o6GtXJzMnCBiHx7HqEo1Zu2cOxCarK41ZDl5T/n1tB1jUoGx93d38EnFKtmnJVfoiXgX3ZbfkZQS4TqxL7pQ/S9Mm9OgsTxeQ0c52u/HzUqlrTggrKZneX7SCM3BZxLg0+cYetiqAKP5LlfUF2TFR8IGYzHmJzdY74BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 9 Aug
 2024 02:03:33 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Fri, 9 Aug 2024
 02:03:33 +0000
Date: Fri, 9 Aug 2024 10:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 28/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrV47SLWk19svd9q@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acf0f2f-3932-4a02-3ee3-08dcb81778b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KbKS0RePyeTVIkZFk95rvBYWCYkgYJY+k2n6MuvL7q2HYlldxsjTptBfduN7?=
 =?us-ascii?Q?403w3nnt7iScOb9px7hg8daHVdhe4SOhqv9DpaHnC0i5GQ+iMjnCDbLyzFRq?=
 =?us-ascii?Q?FCWtAYsLoZGRsUxGHAe9RDyRj8ugMCjuYdHxw9tei+pBlPRSptT1WfVtFfrq?=
 =?us-ascii?Q?c7jMcl6uKtqwu+EwYlMOjL1dbr6b9BTTTS0y0Xcvy0jJPdvXiOqSGGotlXeS?=
 =?us-ascii?Q?CYGpDOsxYdMjr/xNufR4oJzO0KJQRaGZX6YKwLi0eEv+BgDTqxB8gu4ZO5Qt?=
 =?us-ascii?Q?5LBrehIu8wyeGfilM9RUjE8YLLAvv7vmjOjb3antmwRmmlj41ikJ8zl/yoRi?=
 =?us-ascii?Q?0mYiMmenSiXMwNMxExmejH4ZsoJoy96J8qJsb2LpDeeHdZS4driyW6pEFm75?=
 =?us-ascii?Q?IwWuPSVDOpkCjzeXl6q46eUbvPluOPRtQ6X4WiYwGmnnuaGo8aA52uwwp4EA?=
 =?us-ascii?Q?9B8FwB2CabXo7XSx6mbeILE/5QEUCst3dyEo/h2XhUdT37HPaGv1AC7DnH91?=
 =?us-ascii?Q?XAOFkCNLs7L8NNiLl3iVE+ugz3UZAdRTvB4W+RS6tFapDkT/GcYWbDB1hMlK?=
 =?us-ascii?Q?Vt9OoC3d9hKCycTWhgSAxUPKqirtS6QwP7f73kqaoNIN5dNmWWtPvaIaOK8G?=
 =?us-ascii?Q?xXE+gowJqGGgjjnpIKarq+qczqEA7P0MFHQrGjjT/wGhANGuirUrowxRo2Pq?=
 =?us-ascii?Q?bvuhxC/5xOKM9Vd9hTS9BD3Qu3xYTkVd5ZDGhjYrad7j+UNpME6sXvsJOxsW?=
 =?us-ascii?Q?ynThiMvm/78qFbQAEcPz0qkw012ibAE9lXeaXCsyNVeqdeyVGDTg20WclmIj?=
 =?us-ascii?Q?WzQd/qwe4DzQVSe0f9EnN0+WHbIt0wyEX9Z8l8ytZULEhn85QyPVmFx6JW/x?=
 =?us-ascii?Q?OtL8pM0EQTMd2GXUB1+iYjYtGwPW65rOWe6U/XMWCPf4EkRd2kgp4p+Wjeqb?=
 =?us-ascii?Q?6w65lq/n+z0DS/J50jzL+8zIoShguRJC7sp+NdtdNKricR49CM9isKh08N1n?=
 =?us-ascii?Q?o9SxkVhnLme6Zj7/TcR3DUSmQ751kSTQk3hsm7TZhLZsgDHMq0vnpbv1IF1I?=
 =?us-ascii?Q?24Wejytpl7yaw44sGuEFIg6GVZXXR3bOX9JlU6yfotyuEOUH6XQL90vgeMaI?=
 =?us-ascii?Q?oY1SGwZPE0mT6GCQEVc7Np3PzaRYs6tRuwmU3O/R2vnZez8eRirG9fKm6SDN?=
 =?us-ascii?Q?ltt6bSCwD2Fjo2NKFyKdBue8DHOC0PJ0eIp6Y6t7DNhTz0XnF06ilbRMKtUq?=
 =?us-ascii?Q?GucrBKwaS6F2MWVvjneEsC9oc0AXFUYDb7EltFvJUeRxXTpid4juI4Cl4Ecr?=
 =?us-ascii?Q?PGD7MKFONimyJJwsBTqCQiAXZKjHaXItYu1y0032dIGA0FzA13oa6F0zA11n?=
 =?us-ascii?Q?0pqFDuE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rEz8TNKsXvdV7AR5/+c0FK7nf5iN1BPcQDYK5mDyYfYxkKmCqU407LnXzDMV?=
 =?us-ascii?Q?St/sgrxNXaSd6O3oHVvqGujWcH4clSvHkan5FMHRyPKDYHfI3nsIt/+TMhtD?=
 =?us-ascii?Q?1uRj8rWOVbC27n5JbrY9FSUfIVXzzEpeXq7VQl3wvPuDri3VKwKJhIzx4MEZ?=
 =?us-ascii?Q?xCx8u+429iZWNJiJh1iMLbz+HObk994+3TeFeO46vXv7osSJT76nniqJSb2R?=
 =?us-ascii?Q?25Kj5YYpI4gZqAwcB+4jbdOuexp4WstdxTZdOqjdmimTaIPwCOsipjGMId+j?=
 =?us-ascii?Q?nWRTchd4UuLNzqnnZ6tKETFoHsPCzSQxkMqHnsLrCiw4GcUDh+Mm0CXun/pr?=
 =?us-ascii?Q?L7YQdIlq5iw8DCoWxN2ohRX/a+307ESY2IfP0h3JkPHdHMyEZ0YMDNHgGsvI?=
 =?us-ascii?Q?vgDKJm3osU8JB984ApVVnLhhhocqLsI83EzXcVCF5Pv3TlQ3cw9eVvt9RALA?=
 =?us-ascii?Q?dYFI16nFHp4nh9ACE95ZimN5mjBmoAwSDBlimW710je3mJGgwBRCnMjyFgP5?=
 =?us-ascii?Q?P5dWSMBZ1u0YwAAKL5QViAgvxwp+XWujhouTwaDi5G7uky3vOddKtkep3ie/?=
 =?us-ascii?Q?4NSuC5D+yPpqVwhA4P3l4a9bw9MrIPYfUK5+xgDsFaYKXQc1rvq/PmAv8Gxz?=
 =?us-ascii?Q?wIolhyoprO0qikfn2RtvJ3S8CgvaLgb6a+JKZQPax9mig/vXxKyTukA2Qali?=
 =?us-ascii?Q?ZcaSGgz9oOWpn8jGLZHCgLiLMZIyttnjCF9+OkFGYqqo01Q/c+/3pYYcGZna?=
 =?us-ascii?Q?g41rZORB3Wbrf8e+pXvgFY+PE9NP8u/Qdn9yFpbUofau/UoG0Ge37AWWkCg1?=
 =?us-ascii?Q?q4wMBwVhD7p6EP6MBBlA+o3zHQUIQ1kDUpDeqgKYXHWQp9/71DSHUxq92LGp?=
 =?us-ascii?Q?gk+4PiFLxhJybvMVxYQHEY7j4y1Opfp8ZQtx2UT/hPEbMw6xEX5EniuiwhIt?=
 =?us-ascii?Q?yotvoESixaW7J1x9gUBl9upttWJy3fFhMHxsXmP8mIPRiPg0XGja1NdTapqJ?=
 =?us-ascii?Q?00kMIRgsXw7+guZLF4ngl9I2xzLd4C+UpwEeVDFjieyEVEM9+U8Y+YuRmYbp?=
 =?us-ascii?Q?LDbKGH2qGc2gZ6G8872JmqIHwnA2uLJhN2aUE+VqVlGlhV9Cd6g8vZFpw2gD?=
 =?us-ascii?Q?Dj/vpbUA8DYMwiw3v0G9iNixi9uri7DwrkDMdkUsaYh+2H4lm/vYaoVYclSD?=
 =?us-ascii?Q?MPnECUAw+u7mOHQAI2Vpr2zMkrZtH28xXz7LPeL2ccCv98gJ/GGuwsL2ZzvZ?=
 =?us-ascii?Q?91iIB7rv4dcZz46VqfGbe2pQ5k0wT5kDLQ2fLX+j0MxKh6ix+PoPYjNlwT98?=
 =?us-ascii?Q?rRzigPROxTQ394NtjqzZG1VXYqIOg99aMW9ZOPKi7YCchLG26A7A4b1HjMbk?=
 =?us-ascii?Q?wj2pomvfe3ZSl1v3IQKoKnSAacN3geGOsxZyeArj3QfJMbmFAbw3JuaWyicr?=
 =?us-ascii?Q?JjdcunfO+ufm7X4fZ59Xi7LWyB3QTIl+Sw7nXCt8P0n7D48FAVebrqgRlgPC?=
 =?us-ascii?Q?lb51TQCvu+B2+2OKvsoIwPH3v4OrEAXb9D4bdGct8R7/aXPr6gq9PFEd67RO?=
 =?us-ascii?Q?+xQNccTDLLd+VCdPVbmBmA2RjSUrelPwydcz6+GE4BRjSL+HUz08//YNtMPd?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acf0f2f-3932-4a02-3ee3-08dcb81778b4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:03:33.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcMjEcENJAvClI8t3CjvzD8mPhFPdHWDv+/PcBLohyvNGbsWFvYLb/p5uaHNjXDR2aumALflRMuyraWKXF1PRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 4c378b4ec3bb24f4d0d8621604a6433d9afe04b1 [28/78] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 33 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408082359.e4iIEmNp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082359.e4iIEmNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408082359.e4iIEmNp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-733.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-733.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: usb@c9100000: '#address-cells', '#size-cells', 'hub@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: hub@1: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

