Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2BC3C2F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 02:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740105503; cv=fail; b=pBxYQq9ExMh3gLqk7O9uRC134D2F7FxZ0zX5lJKsp4dnPQWVxuW75sm0oF4mnou5ToqdZICs/O7vMPIplWjNah3P24XnLOlZZTvELtmqqszyC6klT9O+wU4rus9/GIsQqhAlX3TGZKg4QhS8A5EknkGnjtvfc1PxiZ3HA2GRyqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740105503; c=relaxed/simple;
	bh=TzaZLLbYoYxQ4g/pMJwCq7aLZmOn5BMBttiQX2igYog=;
	h=Date:From:CC:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=YwRAIxdRP07wkOl5/886Dnkx+IQVJB45yhT8L2g0UpFvttpxMs5EtmUhWM55EqISjoiredknI9dMsxx5IH22HMmrf6O4fkqGuOLT2mHB689zfzeGErm41hf0mjlx/gsuX7Y1guHM+tdKcuK0hJPqYaqxm2cUJKb2QpyJ0eocJqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5sujGuT; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5sujGuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740105500; x=1771641500;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TzaZLLbYoYxQ4g/pMJwCq7aLZmOn5BMBttiQX2igYog=;
  b=k5sujGuT19WD8IMYT4fDkOe8H0wRoSbQ3X13TW+FkDRpbvzan7TYLGXI
   yXpPlpdTa/wF+yl41UrXsseOv7CzG8kBLk+3QZ28lDThvm6wWlF93IyTY
   6b8LXWqnCh9RW8gwdS6yJXetrh/05+K5iPqZCuGjpSq+LcSLdvvoko1Et
   V5NJo2gHd5z32iiX5gDNLbiYYCucvlZQDfB+LWazWdPz+AwtQUaTRGKVf
   Q3+UyUZVBIqrUPOmdIPoBrn9stNIVi6US0m21Ze+48oer9SQ5+m4notfI
   atr1i+Fdj0LLJim6QIDTfEGs/IG3gN5K6RFlZLMIxZUyeKxwCdVkijmaq
   g==;
X-CSE-ConnectionGUID: FOQo7CCLRBuR6pQrLdw+ew==
X-CSE-MsgGUID: Tq7M51JrRTi9WbuHIMnLag==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43744815"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="43744815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 18:38:19 -0800
X-CSE-ConnectionGUID: gARkOgVAT/OipI+5UfswCQ==
X-CSE-MsgGUID: rJtZxr7gQA62PczjQmlisw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="120174798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 18:38:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 18:38:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 18:38:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 18:38:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVokna4rjVJuJM5NTtAigdZVvDplcG4qTgUDUoz6wuPMP/51ccN5nuCawU8+mPoyQd0sXKQYVuOoYhGgZ7oouChk8/PvWYEbts+Du7UUDNbFqJj687wA5A3BhuYIVcnaaT8nUL4VFNufkpbPsBNaZFonVlLcMM92Dc3rvoRDmf8mx3+R5Nteaboi5+SW28hbrIDzEiq+eHBSnJ+81tGOJSHC5hVHxPSuSU0iFwXmp4bGocqS/FVwjqxb6f1dmstLvHE5agHwuJHZMipdTPefpPIf+qYKMKntf9T51VWIMCl4SSthW1xSHWb7lVBc0YUN2Y5TzmveIVsMdncU2+10Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzcc9kWK8MnXeC/WnPABlhNxks+cX2Q5Ol/wQzV4ro8=;
 b=nsM7dnZApDtlb4Vq/y9x7j2W3F6+qgipHd/eFmp7kOw8ZrAV9tHO1SBjiSkHuNy8rBn5QUdxqBaqq4QwtdFkBMSNWauIO5sUbVSpfhU7zpaneXsHZs/y5epZvwx79YYwuqPFoflXRpXctQMgqrj8ZE3ycE78qV+Oe09myXdA/lMeKV9+5P7+HsR6GHqDyEdiNcQxFQ4mWfqnhL6v0AN/wjdapOLl1Z8usfxnihSTpI+74laC6PV2nycnORgvg/4JcsFJTPRDk4cDrs8g1mojFTIFmR2dpPZHBwGlcyC/TJgG+kYKHBs+Ixu7yOKujqpZfTN/LKgWKYD/N+i2Axx9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 02:37:48 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8466.013; Fri, 21 Feb 2025
 02:37:48 +0000
Date: Fri, 21 Feb 2025 10:37:41 +0800
From: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [intel-lts:pr/60 1/1] arch/arm/boot/dts/bcm953012k.dts:46.9-49.4:
 Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
 but no unit name
Message-ID: <Z7fm9fQUqTEEQ2ok@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS7PR11MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: b3909eed-b323-43e4-3d0c-08dd5220bac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9dn5dTjWL4orh5T4e0UBEjNZwe7jBVPbT0taGSEq87AXlzRmvyPPHv+nehgm?=
 =?us-ascii?Q?kU81W7KXll7ABOputjsDQM/Vxnq+H0nTbgEDQJS6knRKtVsXmnv6q06Ia+KR?=
 =?us-ascii?Q?qV/lQr1nfm1J2Fy6ack2kH5h1l4o7wzlx9ii9XeVIlpYILp+6IZ0qhE+JigI?=
 =?us-ascii?Q?bFAS7XegThkpgpz44NRHswgWRIqpZGbCPXsVsMveJSUH3SMY2Y55oZSGxSGG?=
 =?us-ascii?Q?7oqJmCWAZ3EIOKdjd8yrtqm/Exz3uHlaNmVs/LaUh46Kexos82vt+DLtWpEa?=
 =?us-ascii?Q?IaNDRzBf9A/8JrTYcndEoluGWXXaBGIOHiYthR9zvSIn/9/eBA3l6udQxCOd?=
 =?us-ascii?Q?g1UBSmYQHEtShH9ZwZbIq3BblQ8ZUWtvqF0CJ1RCSGc8IunFwuMtahWZiqH4?=
 =?us-ascii?Q?j9b1cJ7E414HMM0I0asUcxXsOJ6Y894UF23r28/i2PI7wUVBLWv+A4enXlf6?=
 =?us-ascii?Q?3AwEnW/HpIy6T/+UapfARe23H5MjGaqaC2KsqoumA5oGK0WBMB3mN3J1bCBV?=
 =?us-ascii?Q?FqxRxbTrXBxTlHO2w+m9onuo8K2xGWscFLi31ClnlPWMKUVIhuCrqTF/RHYo?=
 =?us-ascii?Q?sfKDebDSulJygM3EO5Omi9PGZb7gKUwNQijdps03O9Wed9TwlCULjDmAKKzr?=
 =?us-ascii?Q?IuR0zI99HpwmCBf7zRZRlh/mvSvEiBIaGxgJV/cPR+xcmMvJdJhLA1lpzk63?=
 =?us-ascii?Q?ADBC5UdLKkv6pcECQla6aFrmKNLCSYSvVrlIjKN6K7Pm4HLTII98U5E52Hr0?=
 =?us-ascii?Q?rWPw6alweH1RQ6Fz5VX0WmdgI1MpaxXrE9Ph91OzODpdtKaF7z9D80UGJ2ID?=
 =?us-ascii?Q?g4+fVzZU4pMtJLmO3APXdL8UT+tTZKiJq0LdbDK+XMuy3QV+FsbVC7fZEyBN?=
 =?us-ascii?Q?atxxiTYt7wqZ4+x9+pBuVhmOwtE+umquGyKe0Bns+g7Bcbw9777e3r9Ro6v2?=
 =?us-ascii?Q?3ZPt+Ya+/Hr/u+H/Bo+KTbVSIclc6svxaitI8zrw0BJP3OvWHiFk4UcF4oYJ?=
 =?us-ascii?Q?7Dx71G1P/2r8yGzExh3Gp5G2NZz95x+26d1cN1Eor49cwp0nbyFCdBh2UoOu?=
 =?us-ascii?Q?L+smtXGdjRK2pmiAUi36me+u+7EYn233f2CHttC5ql4dS04kHKzuBF1krXKi?=
 =?us-ascii?Q?gPNu+OhgpVXU8CgwdJ7piEWqTcN5aSbeDaKLZeuzd+jvH27pyXk7WHYNwYpr?=
 =?us-ascii?Q?akccSisDyqqtW2TgskFXUMExRkJvh9DkOZdgIYa4y7Mczfdkm99jIyrMMhq9?=
 =?us-ascii?Q?eubgC3ssNVADHZcbISaga48UF/9Vz4OrPP8a4WiY/cVFkW9XjSJJG/QiLbvp?=
 =?us-ascii?Q?bj3rY1PJt6Jb/NoJ+/JtAw2UA0sybD5XN3/4dBk+8iWDOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+OsUKPTw7GN2t2fyukvM85pz6WHQJYwUBfos1DWvdMPZA8hEDeeMWNzrcUh?=
 =?us-ascii?Q?YddNxKs/oKapMPbccQ/UN2S5LVT7bmvWVEAS2q9CHEvtG1pJvglDso1v5ObN?=
 =?us-ascii?Q?CvX9fSVtYTnw/Ql6Jx6pGXS/u8B9TB/4s2SJR14Dl1O8wJUizEEU3UB/HYNu?=
 =?us-ascii?Q?iMik+5WsxjSKkJBYA7GbZYAQiRiMbKk/PAOd4aWOuLGxHYV1T6YzHlCn2R19?=
 =?us-ascii?Q?+FMBkCviRykCiHyIeWhXxS5J+n6LAq5U2sEUMC6LQQcipQsTg5F/KjNGgjkW?=
 =?us-ascii?Q?j6HifML65Zkhx78/ev5ZP+d/Bsh7CxfpGe6eY1pAo8jTCRodjYA6FZ2iGQP+?=
 =?us-ascii?Q?NxOYhOWJdWL934epjBw3Y4RV6EKeXn8RzhwOQsB9XdC0E3lk4n1+8kLzebup?=
 =?us-ascii?Q?ve1xBPtNt0v5ua/J/BlkfKDdletikLYtnD+0X5Kl9n4dTE5BYDJDdafCZEBq?=
 =?us-ascii?Q?gENLHlkMS0rD8364iFntkdf2aputyqgruwB0Ve/ZV2qf7PY3HnUDYgrMCUEz?=
 =?us-ascii?Q?P3FWgisx0vh7aUsQzM+hLZ+7g3k8Q6Z5L1tVd6yJ5MZKK+LD7yHXsy/4kszb?=
 =?us-ascii?Q?3M+AGMCyEMvbAYOTkTO0mXU/0bWhz/aq7MHNskzwww7RJBhAFWwuVI2as6ma?=
 =?us-ascii?Q?gdo4s2suAE2pdp551RPLeHHC99VTeZQAneoHB/2sy4mQHwV6inJrvOjI4g2J?=
 =?us-ascii?Q?nRcILWWkbKkcniUdkfnqEM8E7MbuoV3vV9xAARsbKIXhMLS2/2HKXcwFGl40?=
 =?us-ascii?Q?tlRkt5shzDM01PiqRrzk6PEycrTJo0sMa2jJPUD5PSNkpZwz4KEyGa1J4kGc?=
 =?us-ascii?Q?wiRZG1aB0EC5kOE4Vs645S8RZDl7wDwmv70zEXKSG2BVb2auQ5Cr459p56rd?=
 =?us-ascii?Q?tCfkJOCoQ37zs9JLhQu+lp5ASyouC0eB737Sgv6aFqThnrESZwCobXyB3f0U?=
 =?us-ascii?Q?dgkt9pYZupTgayTzXgMwnGV1p8kS+YoZQ8dWQEFJIsLMnqHPIJTyvn2eGjgS?=
 =?us-ascii?Q?eqtacex3pkqJ3N9YpvqovcpdCW3EMSNq11Q1JxkVRNPM7WvU2hh3kYSC91ux?=
 =?us-ascii?Q?EM8sLaZ6l4uzDdIULwg2tLIuXgl6WZwsfzLERaRJya6vWIzOO3A+QJSu+GwG?=
 =?us-ascii?Q?UD6jgw0BGE0m/ZfwqTy1HmT5nqlx3qeDPaEgIx9uaOOqNoDEfvrnLeo3Vlf0?=
 =?us-ascii?Q?UkmwE08ceqIXAxHQQg2TCoZWaf+7od23Z326MjdtIx8mBw4aKmYZnfIstFen?=
 =?us-ascii?Q?jlLGVG05usCWmcy4KmrqnP9DD+TY1SqrBYeitevY8APbzN2j3kgth/eZjshW?=
 =?us-ascii?Q?zShxgWGDCcEEEYfdgwFO9C2oleWOIk1DEa4LjLrSQXHAhmUtHaVMfsVTUZfJ?=
 =?us-ascii?Q?GPI2kQ/1GE8KUVERFrG5yTL+7R1Dh640Lkd15hZVU+edrIvL0IaTkK31vW/x?=
 =?us-ascii?Q?VB89CfahDoXWWAgl1gGIMtrMOLAOFR0lZhi2iUZg6zQeokcM031P/Sj65boJ?=
 =?us-ascii?Q?D0DoWLEwOVAZLkXNlo0QvWM4KbpYzszAcxAUzbc0j3FLaxlfsghs2DUPMPr1?=
 =?us-ascii?Q?ADSgtyo8ZuNCHTCL7KEryLVa3Q5W1M5qDgqlSvmr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3909eed-b323-43e4-3d0c-08dd5220bac4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 02:37:48.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKLAYbLlIrb8n41uhEVJKrqDLryCgEEuzUr+1mb7w84hH9zygEKzERhq9AdD89jbGnaZZThsoMZOmfrSvrHKag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: abe60a3a7afb4058278864aa18c5faf62094c11a [1/1] ARM: dts: Kill off skeleton{64}.dtsi
:::::: branch date: 3 days ago
:::::: commit date: 6 years ago
config: arm-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250220/202502202340.mrjLEkQE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202340.mrjLEkQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502202340.mrjLEkQE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm953012k.dts:46.9-49.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm7445.dtsi:66.6-225.4: Warning (unit_address_vs_reg): /rdb: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm7445.dtsi:227.21-298.4: Warning (unit_address_vs_reg): /memory_controllers: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm7445-bcm97445svmb.dts:9.9-14.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm7445.dtsi:255.10-275.5: Warning (simple_bus_reg): /memory_controllers/memc@1: simple-bus unit address format error, expected "80000"
   arch/arm/boot/dts/bcm7445.dtsi:277.10-297.5: Warning (simple_bus_reg): /memory_controllers/memc@2: simple-bus unit address format error, expected "100000"
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts:44.12-54.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts:86.12-109.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts:58.12-80.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts:44.12-54.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts:45.12-55.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts:19.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts:23.12-39.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts:96.12-106.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm11351.dtsi:103.15-108.4: Warning (unit_address_vs_reg): /l2-cache: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:228.22-233.5: Warning (unit_address_vs_reg): /clocks/root_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:235.20-240.5: Warning (unit_address_vs_reg): /clocks/hub_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:242.20-249.5: Warning (unit_address_vs_reg): /clocks/aon_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:251.26-262.5: Warning (unit_address_vs_reg): /clocks/master_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm11351.dtsi:264.24-278.5: Warning (unit_address_vs_reg): /clocks/slave_ccu: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm28155-ap.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts:69.12-91.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm21664.dtsi:93.15-98.4: Warning (unit_address_vs_reg): /l2-cache: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:298.22-303.5: Warning (unit_address_vs_reg): /clocks/root_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:305.20-310.5: Warning (unit_address_vs_reg): /clocks/aon_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:312.26-324.5: Warning (unit_address_vs_reg): /clocks/master_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm21664.dtsi:326.24-337.5: Warning (unit_address_vs_reg): /clocks/slave_ccu: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm21664-garnet.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts:84.12-94.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts:53.12-81.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts:60.12-76.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts:43.12-53.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm53573.dtsi:35.9-49.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm947189acdbmr.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm947189acdbmr.dts:44.12-60.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:464.22-473.4: Warning (avoid_unnecessary_addr_size): /srab@18007000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts:93.12-115.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts:19.9-22.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts:89.12-99.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm953012er.dts:42.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:464.22-473.4: Warning (avoid_unnecessary_addr_size): /srab@18007000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm953012er.dts:47.12-63.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm53573.dtsi:35.9-49.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:19.9-22.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:40.12-50.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts:77.12-93.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-netgear-r8500.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-netgear-r8500.dts:65.12-93.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts:99.12-135.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts:20.9-22.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts:24.12-40.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts:22.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts:51.12-61.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm23550.dtsi:374.22-379.5: Warning (unit_address_vs_reg): /clocks/root_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm23550.dtsi:381.20-386.5: Warning (unit_address_vs_reg): /clocks/aon_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm23550.dtsi:388.24-399.5: Warning (unit_address_vs_reg): /clocks/slave_ccu: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm23550.dtsi:401.26-413.5: Warning (unit_address_vs_reg): /clocks/master_ccu: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm23550-sparrow.dts:48.9-51.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
--
   arch/arm/boot/dts/bcm53573.dtsi:35.9-49.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47189-tenda-ac9.dts:18.9-21.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47189-tenda-ac9.dts:59.12-81.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts:59.12-69.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts:22.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts:91.12-120.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:18.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts:44.12-54.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/bcm5301x.dtsi:22.14-45.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:47.9-106.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:151.21-158.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:360.15-381.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/bcm47094-linksys-panamera.dts:19.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm47094-linksys-panamera.dts:137.15-204.4: Warning (unit_address_vs_reg): /mdio-mii-mux: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:464.22-473.4: Warning (avoid_unnecessary_addr_size): /srab@18007000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-linksys-panamera.dts:25.12-47.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/bcm47094-linksys-panamera.dts:153.13-202.6: Warning (avoid_unnecessary_addr_size): /mdio-mii-mux/mdio-mii@0/switch@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +46 arch/arm/boot/dts/bcm953012k.dts

ccf0b5e37115f86 Jon Mason   2015-11-02  36  
ccf0b5e37115f86 Jon Mason   2015-11-02  37  / {
ccf0b5e37115f86 Jon Mason   2015-11-02  38  	model = "NorthStar SVK (BCM953012K)";
ccf0b5e37115f86 Jon Mason   2015-11-02  39  	compatible = "brcm,bcm953012k", "brcm,brcm53012", "brcm,bcm4708";
ccf0b5e37115f86 Jon Mason   2015-11-02  40  
ccf0b5e37115f86 Jon Mason   2015-11-02  41  	aliases {
ccf0b5e37115f86 Jon Mason   2015-11-02  42  		serial0 = &uart0;
ccf0b5e37115f86 Jon Mason   2015-11-02  43  		serial1 = &uart1;
ccf0b5e37115f86 Jon Mason   2015-11-02  44  	};
ccf0b5e37115f86 Jon Mason   2015-11-02  45  
ccf0b5e37115f86 Jon Mason   2015-11-02 @46  	memory {
abe60a3a7afb405 Rob Herring 2019-01-09  47  		device_type = "memory";
88d1fa70c21d7b4 Jon Mason   2017-02-08  48  		reg = <0x80000000 0x10000000>;
ccf0b5e37115f86 Jon Mason   2015-11-02  49  	};
ccf0b5e37115f86 Jon Mason   2015-11-02  50  };
ccf0b5e37115f86 Jon Mason   2015-11-02  51  

:::::: The code at line 46 was first introduced by commit
:::::: ccf0b5e37115f8675455632f583d06ea94f43539 ARM: dts: bcm5301x: Add BCM SVK DT files

:::::: TO: Jon Mason <jonmason@broadcom.com>
:::::: CC: Florian Fainelli <f.fainelli@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

