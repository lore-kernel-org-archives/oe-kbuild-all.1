Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF4D29E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723389457; cv=fail; b=juximkW+Rt7lun+oHuCfn+xrMAGKemtN1e32yp8cbYo+UTp8UDU4h8UpXIYjkq1d8Cw5boI1Q1oEsExIDr+jYIR/b9MazCG94dkEWDXLuLOv8XM1Ib0vrdjDXiS3cQyJTlsjOuOqXW58NryXqgcEL9gwiB1VLFoZ8pBcTYpz6AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723389457; c=relaxed/simple;
	bh=iabnRpfb9WPu2AahyowYwF49QfZHvVlmXMjMcSuNnZU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=anKE5e7d1kmUmiWzYUm0vVQVIs4giq/Gjioqj59kKl2w8rhQhN2Y2RAd4bXHJMT9+xnaDLgeGXWvE2FkIILVuF151PhMWefmRAJgQF1xJRntCYKHlvZ4THksoPcaYK45roqnkRIiw7uy0PxsE16UHEX115P/+G3gnSVb87KEFz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxwCrYgo; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxwCrYgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723389456; x=1754925456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iabnRpfb9WPu2AahyowYwF49QfZHvVlmXMjMcSuNnZU=;
  b=QxwCrYgopzIK6Q51du0Lb0QEaC29ffKDeZf42gGAbxq3CUwydw11VkHM
   yzU79GIJFmFPTHGgGq3q442Gij1YKbZQVZqR0tBU/qMFu7P4rQ0vxB/G/
   9k2qaxuaL5dpo2b1kE9XBnBy32W4FCxDh7A7ROx48BE+Y6BpX2kO1fXTi
   VuNq0s7YZWQeXlgj8eTdd/MFM7Wvc9n7nXNnxSuGjx15D376+05HJC6en
   E5W98+jEwD/xCxdonii2vMqgK0b2OpnnofpLrmwB90keg2yivAO92/wKf
   AmIvULWVXPazY5d1uHqyD34zNioVgv75MdzgRVpur+/p35/Vnn7q2dsGd
   g==;
X-CSE-ConnectionGUID: PXhIQpIGTtaiHCX+b/qFQg==
X-CSE-MsgGUID: Zy+rHPIrSTaAVQQe/rRkgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21663944"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21663944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 08:17:35 -0700
X-CSE-ConnectionGUID: 4DycAKtaQ6S4T0wjUw+qug==
X-CSE-MsgGUID: kiO2gErCQqWpcag8t0sfow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57965128"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Aug 2024 08:17:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 08:17:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 08:17:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 08:17:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 08:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfDJsQ0Xd+YgYGYau0Wcp8mIQ+DMbD5rrm+dOoGvmoi+hI0q4HSsU5wIpb+tfjHt8OoaHn4XkvszzbtcEa0KluL4+Q2QYPOVrk23lvsjM+zNrqPyxc/9X8dwUYk0x5Vzrg7Fj30qs9Yxhy6XobwEzJEM2vRbFnrDwfCpoVxGvDdyCtyoC1Iq7yr/kXLTgGjCaSSa1DHyN1lLmpzK63H7hsifYJ0VIM/rpEg/EILCYlCe5D2yrJBllziZykmtFFVrYTAy62xw+OpOf7h5ny7NRNq+UUqifOQ4cYkonNuqvU7CdTmJx5ozPXGg5uPPxXYO00+MO8dog40/n/OO3l2N8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gaFgpa7TwBbUvcHZchqeUUc1eaIGM+O84qMa/mSx6Q=;
 b=DuwoFzY64EHRykF99MOeiuSg6VPTpoOdbr45RjvqjMzROtSVfOvsyDl5hWt74v9StXD43gywKvshsBw5TTzPWpeM3lq5mc0TtcX3WxBsx+Q4urY7m3DQph0wwl+HENPsqydyoA1QdrqcaVQnxSnQcuuQTzSAywbMyLklcAD1YOqOli/jJYQ5Iovm+Z5Ki5ZkhyJD+oMWQd8K9JGj4nrU6VfDLAuQShlRmcCHuH1nMfOBb2Rj6+5wPyr6l7kbt7aKStfXTakuezhuLLi//e9YpzoatFGP4jcKscHxH9OwxB8Rrwvsu7vQoG9eb7Ncp/3JJcgbIulhifvvepto24JgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Sun, 11 Aug
 2024 15:17:32 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Sun, 11 Aug 2024
 15:17:32 +0000
Date: Sun, 11 Aug 2024 23:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 28/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrjWBsEVAkSBsNUS@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: c19ac1b8-1992-48f4-03a6-08dcba18b8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7+rUyJIsGzRbvb0MBTVOXD+goMEvI4udnXmsIe79yxgqugPQauwAZrKfvp7T?=
 =?us-ascii?Q?DVut2bzff3TmUWBLeHMRv/XkpMXtU/4rOyB1ut8yJvQKZ0zm0iERVIc2alWx?=
 =?us-ascii?Q?XKCdtb7BJRIy7Feqv9yhrvek4XoDdXhvIUed4U9znZnjhmrUijFTf3YtKiQN?=
 =?us-ascii?Q?fTGDn0vOInfgGRWT/3eyHaqLfhSa+GX3p4x4umJuFuuLWEDGuQt8qUxAK1KF?=
 =?us-ascii?Q?jHZnGzKbqk2AIzu4NPtY3AqclvepEDOPInQhgCojKMengqNnfwkviA3W8yFy?=
 =?us-ascii?Q?/DOnBvULm6zCj4Zl5SkHu1NHM+5Lu/+cI2XeXAUxSSqs0G7psM2Al2MLlONP?=
 =?us-ascii?Q?vI4ZNidlHBKUfotirEsqdANpzfklK2r7Zx/1kvgcb4xLN5BidKZUwG4YBpRQ?=
 =?us-ascii?Q?iOX8Luv7tdalDREOxNPQnK/xd0lanMsiUIQeK4eIfQC7iwtxJxSvLEbiWmW0?=
 =?us-ascii?Q?5jte5uLoBMmsvrXLo6bc6bwqAR/NtS78pujrL+roCupdkVVFbfidYtGbXU/w?=
 =?us-ascii?Q?4en612pgfC5cgRgv5W/cCbJvD3awbVladtHfBja9RmeyTz4kFpcuMfkmWaSP?=
 =?us-ascii?Q?l4lcz9r5PN4vn53c37cYJBAU9VL2cUZ7nxazWR2OV0i4q1IR5/+/kkgdE5sL?=
 =?us-ascii?Q?40qezEdYoou3mi1Q2Uggs1czaJW1nQVd54VFWf2UeTbUC7+o+aDuhvwZk2vy?=
 =?us-ascii?Q?XZqL8JrkaFIc4vfNb17G+xgeZpIqX0VCKoijDZgyFfSA7vkFIUiaG6PkFGVn?=
 =?us-ascii?Q?jLm4mzHKPLnoM5MpS1JmYY6zXnFVU1chNDijyApM4FLWl98vJQ4EeSLadn0b?=
 =?us-ascii?Q?IenaSHMCYjqHDbEfXhbkE2oALlyrSOBYpymghODWJykC3vDebHLevRkmwnuR?=
 =?us-ascii?Q?Rex+JrtaAIdzWGGBygmxdhtU5ad52gFrufaOGQ7Yy0VegZlwe6K7Haj9L0QG?=
 =?us-ascii?Q?Z1G6tsLDCgqdagovDWLTHsboSVa8zQVbgIFECOruMPoSMXMgCpA1Cd6XTwkv?=
 =?us-ascii?Q?KKSlqstCw5oUvO9oc2mdmbJ8pp0nNSuTWoHqitcE8nF6tjushLexi2QU3uFV?=
 =?us-ascii?Q?7QhbBGj2MmM+VMIM/J5QJhQoNTTeiFOlrla4n0+ONDBQ69JH1ecm0ok81taD?=
 =?us-ascii?Q?jVDMBzHVUfGswK1bcIs+fSSkNZgxnDRZHGRmgxZdfqoCtMkT2A8pXD/mdf4N?=
 =?us-ascii?Q?F5w26A8AlgZRn8AeZUEvfwE2PdCLwtKjQi+eHeOffgBCjWM991VJtMazobvi?=
 =?us-ascii?Q?eB+uq1I5yyF8KljHfZV1jl53WF63wjtVJtIX4CNmKLeg01u/vlqwhEo0bH1r?=
 =?us-ascii?Q?WIqf7qanTRym9YE4cBLnNtDTuPekmWb5nCGLBW7CfWHDZfTfuk+PzC25+i/O?=
 =?us-ascii?Q?crm29Jw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2T76yP9cNKCGek44EAPftPUCMdKf0AarAw14g0dgn4XnOlSZqfL0qrAFP0r?=
 =?us-ascii?Q?vcZWKGWLLTgqkEADLKi9QKZW8TfTSpZSNMBtsp1ZFHNidCcMCp2WomZX8JcY?=
 =?us-ascii?Q?6Rj6TD4g81q/y946FKzelNQ0yLxclu8mamDjDp7XfnJ9Gc6KSK3wsL0HXLz6?=
 =?us-ascii?Q?sMGLaU6Kx0Y9gvctInRcBUH+KVlchbCnOUFXkHD+TMcCwT5goJdGnOzMlz4m?=
 =?us-ascii?Q?BDYRFmuXCqlbd8bcDyNVTWzxKZvK7nJBfHbow4ccK7uZJRaqJb9RzHRmU540?=
 =?us-ascii?Q?y9JBLZDlxM9TDhdRedrwIE3x/yNPVmdcISi9ZDk+ePaArDzf/SCecKScqRHo?=
 =?us-ascii?Q?10nDKC6CEKE7Ln+J0gO7lERgIBuiGxCMlKA1KIZR9Zfmh/s/fwBm76k2+ZOC?=
 =?us-ascii?Q?VqKrTf1srbXhNsgJPR25MwFgD5QA3fYSc+Xb++ahKAaUw0+j91yOfmT/kf2l?=
 =?us-ascii?Q?rcHGg/t/p6B4PzNB9RM7gYaFKsgtW+3olPwBzIZ9jOqqirQfiAhqbwY2IxBt?=
 =?us-ascii?Q?uaDpRGmk0WaVwP+io//EuStPDTedYKmUONabWfHlzm5E2sqVSbBNypVFOlYH?=
 =?us-ascii?Q?KmbdH+NRLV91yxm2G/CY87I6fkNuuzHN5qlyduA72ZQ/qXn93wvwICytoyov?=
 =?us-ascii?Q?6JMITzUvg42HxpFPMSPVXnsddPNNnxyP6xJuoVbmJLMqkKDBuwvaNHsZN17Z?=
 =?us-ascii?Q?AUiVtDozJ7RGGs9Tg/6OwwsAbG5sgok2PQ6xNPQEZ1knFBwhmImqy5BTwfA4?=
 =?us-ascii?Q?FAb3HoBwAhyd9N3AvQr5f0iOqOuVaKIRqOUDE4Kyeod8KTW7exSsn6+Dw0Hl?=
 =?us-ascii?Q?bLgramUSJ9t2HBdVxc59yJ7X7ng8osLlbHxZmLtQkDcyCdCMJWIO4Y9ymOjz?=
 =?us-ascii?Q?JV82I78A4n0BMW73+dcOru0/HPKL7tJYehNrc/FNT0+Iyy2C7NGeB5VWoKfw?=
 =?us-ascii?Q?84rWD/5YJdvk62PlnU14dkjo3GK/DgNOSex10wnadNZR0glid2Y/mmVZBwAm?=
 =?us-ascii?Q?wXoXpj8QqybN5pXbFZif0yGu/dpxZXmyIchBn4rBTMzd1VgCrIf1bNXap8pP?=
 =?us-ascii?Q?wB0DgK4Cb4IMC0WVC5ACWxEEDrTZVj97D+JexYX3zIvUT3OCgvdhvzgPM/Ve?=
 =?us-ascii?Q?ALdoWw7GZYiPeEfD1+YTRnIGNeVVKcUpBdlUVzpEwyhD48CDJn5vn5nXeYlO?=
 =?us-ascii?Q?flnuK3ev5mqj+273ZlCRXyv7W7mV1Sj+z6qW3sXhlF1+OhZNCZmzEHLBcaQm?=
 =?us-ascii?Q?4e0LjMnNJaRqSDweD6RJkCCgJiDBfrf96gIhnstyLsyHJJVDGMmC1tn1hOML?=
 =?us-ascii?Q?Jk/WG+ZyFf2CY6F+zjtt2mFyhAH1fnYKPzZIOpGQ+KFWXxZAZ1YR+NGw+Gav?=
 =?us-ascii?Q?cQ02Bzd5/D2wupGSYO6OU8wIleI3Y73ulWxIO/LJ9C6i7Wv9YXVd4I2fmmfW?=
 =?us-ascii?Q?8bmNNd4xua3c/8xQDqcPE1Wtdf8JQ4vwbOm9qqhPHb+F/TWMRvLxF2aFAYB0?=
 =?us-ascii?Q?WdnkI3P/JJlr6d6ViJGdN8Cml4m1OVOeh8ahnJ3ykWzkTzsMgLcDV0+FUNB/?=
 =?us-ascii?Q?coDlXjvJn17WRVbOpqYkdIxaezfA9AqNn4sFMB0O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c19ac1b8-1992-48f4-03a6-08dcba18b8a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 15:17:32.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9swEo+rUPfOlZe0N+i3k37+63xU+lTrFHkA9MEycXOhm4feCRST+H/tdyLeltXHhrHIaod0rLdLKGBVhr19SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 4c378b4ec3bb24f4d0d8621604a6433d9afe04b1 [28/78] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240811/202408110618.ZuCSphQT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110618.ZuCSphQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408110618.ZuCSphQT-lkp@intel.com/

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

