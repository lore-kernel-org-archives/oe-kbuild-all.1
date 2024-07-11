Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E8171AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720669084; cv=fail; b=QL12Lbhu2zY1cyo/fk4k7120LQjFNsYTUb4DHC1VTIk4C5L7Ye24m2aF5AhklLb7b4QYjJ1eBQ6ot3wEG8dT4H3J6KC50vDw39Az6JSL4oq55bfNg8lOdIwCaGFBItdTFq4i7BL6obLML25dp83CtBc+N1BGNO0y6NMOJFM35e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720669084; c=relaxed/simple;
	bh=QvwatD/qvaJLVzNy0x5a423bp6ogRb36vquHFwJj3CU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YgOfTErPt+mSLLL3DYpBzS1rP+tQfuOrKWPedncprhriyUI5MKp86gM+Vm+2W3ZdtxNUu+i7O8cCHhEule7SKnPvXdwZjCjzhBPOO3bcC9gTvETxyl3Su8aXdHZIFdAZYfH/158aHg/v+EkoEMgAL40DV8zCuK6m+pnWHabO074=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxDYWql7; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxDYWql7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720669082; x=1752205082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvwatD/qvaJLVzNy0x5a423bp6ogRb36vquHFwJj3CU=;
  b=VxDYWql7G8Hyg6S0Te/HP2iG3hL0KmdbnE/NhwD1OY3H0Z9tg/PfD6bo
   gGmcwOPzdEjpT++umVqTiTw62iyiY3O3J32VYaiSGlmtBO/4KSxzcVBlK
   KCq3MruGDS5P94zF+j2DrMULjeoiX4jMOfEr/dfyiVe8KudTSkal9pTew
   l3L/2UKWsP5UHGGBqjLnHNDwDN4dlwxIHZicS4/vHyNP6UWKk8TqQjziG
   lCQqdh0oAyc2nBUhULfmy8HuUgNpe+v+/7YC2JGQXNGa2ZYr8xq1JQ3Ya
   TvmlE7kFfs/JajJAO0s4F1m3hzjoy97Pw36yT9u+Y9CTLirNdoTH9deO9
   Q==;
X-CSE-ConnectionGUID: 508N6n3kT7quOer4prfrHA==
X-CSE-MsgGUID: sOgOSs7ARrqs+emqHftAag==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18162147"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="18162147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:38:02 -0700
X-CSE-ConnectionGUID: xXXewg0HSuivSAMuha1NxQ==
X-CSE-MsgGUID: HIBbEBXuRUyK/NLUBynW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48181421"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:38:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:38:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:38:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:38:01 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlwyNEa2oZLKY/7fqXDAiiVOTPscsCCHa3vewT4kDjdffa3YfD+LzJp8WgH+8X7FmpMplGFZMUwSnUc6wddATkiKsNe46YG/ErigybUeUf0xavlchNSlaD9t3aNRvT6zHiQYUJkSMKWrnx0OnC5/dr727d2D+WblR6kRCAEqlVjGUyASy6pJ99fk9KVfcdM7blSLmdTlGxFI6YuBVZHRNM7inUDBCtpOOMRJQW8z4hznNu9LvDSYWbX3Hj5oQ+uO++03k/F9F6zFCFKbFHvMce2povBYB+VA1RuY2j1YMDdKNSglynvNOHMqsESm5mwcTmRj2SpjZ0OPvzHZQxDcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWZMh8cF0PqizsvodhpdNQVuoFMcbvwgwLSTO3Gas40=;
 b=ThYtPO83fwRXcjW9b+DObuZrE14vwHURdSee1fMoz/8r9kCVccJDBMR24wMCXvik/1wCth78POcGWiiIBJ0QtfGXZ/lcYROBcvpLpcoqa4hr0KBvx0Rukijktjrrv/ujW2+slzaXwRmoXwRfI2d645/zYxB8oinVR6h5oxQ8KgWbgkbQgZIGVb+xBpvrhgMgsY8xb7UFLqtD+qKP3YTNSoMDdRbkhO+KJfm5lCDBN1yCMpwg95h89lGO5KKUXVFrN5BZ/k/12zDMCVX1Qu+FBE4cMinvi2CBwr66qNhCSYM9U6tnkI48Uvv3lRKAmsu2ekTVad1Ee1gdGZ6oA2zLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:37:54 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:37:54 +0000
Date: Thu, 11 Jul 2024 11:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 11214/11381]
 Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml:
 properties:regulators:patternProperties: '^LDO_SNVS$' should not be valid
 under {'pattern': '^\^[a-zA-Z0-9,\-._#@]+\$$'}
Message-ID: <Zo9Ti/pU4CMvfC2U@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6029:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c083a0-0ba2-4441-7b10-08dca15ad8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YRzt3sfqithYHKm5RU84BGqOjIIvvFmse5JUuojW/MvpGYMr1HzPGzMjyIEG?=
 =?us-ascii?Q?VHbtxFnkeu229ilX3/rno0sN7PlhMjx6l4yQdB37lsno0aVpTlbKUSC8TQIv?=
 =?us-ascii?Q?jJH2AYwJGEly9beWLHApPup9tpmV8nGd9pSIo7xROeISbcMyr4YdgbA8zTNH?=
 =?us-ascii?Q?IXNOE4yvDcRKxweuCcGmcH/eM9nZomKkI8ZZXIKoq7/Xg8zj2oYJ3txgPjbb?=
 =?us-ascii?Q?fjs9kadmpyBAGUyLZ7r7npmu6y/rkpLKvCD4TLo96OXdnblOoqQkL/G7EKsg?=
 =?us-ascii?Q?bG4B+1oXN49EwKSnv8s1RoHwThOj96yICVekqdL6MZ2q7VDJqOJnMA7v9vQx?=
 =?us-ascii?Q?VCN9SVBtowVJ8GLyAqmbU0SSiyAvUrHI6dX6o9bcdvgrvLQImxj0oERnHAZI?=
 =?us-ascii?Q?5JpGiVkDE7hDkPXvHUPxj/iJkd2RX2GEnD5XTXBK4Tw/H1Q6c0of8NXIP0NZ?=
 =?us-ascii?Q?iVyn5cjX9bLtAYHFC+IErYAZQ3M4EYrOgZsHxUViTie6zTofDEpARXhg+5Bw?=
 =?us-ascii?Q?VFxu/HYy63REwsErP+vAOfvvfTuEimNWj5h1BULRS3QEFaLgIPC7e1sW1W0H?=
 =?us-ascii?Q?8rWsFs+Ru9oY2NCR0Wm+W2pf3DhUWgK81b1qbKWJD3Te1PTPWU8pwZot3CuO?=
 =?us-ascii?Q?zyrturOihFafH7R14+wg4AYJc0BUeU8lOPWCQvoftRcJbqWngdTUFr+hLUnT?=
 =?us-ascii?Q?Gldf7qVXCN2VvFxNkDG3OptSOUuzka7e2mC3qX7AAPr/ZPuTmPwrgavHLtpl?=
 =?us-ascii?Q?FRdE7FRTXq6EuqfPVarAmZfOB125nhKlVNLVM87UCJTU2w5pveKeQx7/Pxzm?=
 =?us-ascii?Q?kbKFzHabvE9SMsw/AQ/7nHYZPf1ULzaiBEM168/7LQNprmC9knTq41kx4ecB?=
 =?us-ascii?Q?g5+iVJHKK8bycLpeP7SJSuE2c0BBT4wAvMnMGOY86eci7tH/C5NhgAghKa+4?=
 =?us-ascii?Q?Iw19r0IsytdQ4XotleNBWuaOF9J4nbdO/9SPy4gFowLEidjm3yJqT/QjkAlt?=
 =?us-ascii?Q?F+V9csMcHs4XiI3+scCaHIg1ycX94l0DgUxpfyY4qlKh27ku3K+P+JF9Eg4G?=
 =?us-ascii?Q?BevTIFBt4tnR4fk5RKSnBy3nxttitF1+pNEdbZCKH2UNJpT/6DeRSItCofkx?=
 =?us-ascii?Q?4JMDI87ZWuCTrgEGJGMaW2p5riOpMb/AL9CieAfGfNbNwFeIQsEh6EuDybHN?=
 =?us-ascii?Q?SDQC8TK29U4yqFiCV3E6Z8vVkhRtaFWzottmZOUedLvOdbar1dM7UrCrjr/8?=
 =?us-ascii?Q?SunTWc1bjtuRlaCfVpOlKJtUCHRymXx8vQXIka0x9NuANB3HtaQmAJmhDUW9?=
 =?us-ascii?Q?uN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1HAu8zfW27gwAEOTqmP0nKYUB9P+safCAlC2uSgUCdBQ7b5ORzIvjklTP5uW?=
 =?us-ascii?Q?wmWp3mNtobp69WAeexBCstMks0UCbbCuBW1m5+rJIRtWLFoKMjoq02HG1O1v?=
 =?us-ascii?Q?cCQxUw5tMg7/mX+YrMEKuhbMAnOoufRQG5QHgKGBSAkQUUPY1qU+U50zgApc?=
 =?us-ascii?Q?/55Qs550L+9Yhwj6nARbi/vJtNf6MAz1x5OQAc1rmcBd870NTVwR3lu+aN5c?=
 =?us-ascii?Q?qqKmQU/wOrmC7jRWRTWZXH67sFIUSVt/DQwDpLiCshMpaMjkhFEzRkwgQyaN?=
 =?us-ascii?Q?299JVLI+36/L8uxqie5QDqUoLguGRUGedi72Jg8v4byidJ7l20ZQHU+/Ag+V?=
 =?us-ascii?Q?tuI8spUP+9iaw8ZEZkVIALPdH7G70THj/+CvqlMbGRO/q5XPAZg+ZgiXHlcp?=
 =?us-ascii?Q?muPUbLJQwMob15efSkF4Bz/XULY2oeP62VQJp7KtYoSRtBQJ4xf6FYaIt5qX?=
 =?us-ascii?Q?Y3aSgigh26mLbu33a05kUESpGgY/9zxnL683HGqAqrHSaLKnN/BrvIiNXgzO?=
 =?us-ascii?Q?6GTFRiGIaEuLQUAKHQftWFKjN3KuD+zrbULrAyMp4idAhEge7hjWgeD5IBQE?=
 =?us-ascii?Q?NJJgttp6ncH4Qwp6FBM7kCp/zYA5xQJthp1YXcV5RdqyJjXhfgOWU9UoEVQ8?=
 =?us-ascii?Q?L2LlCQzSk2/ia34KpcYiZxcWP4ruW6S7AxxW6tUkwdZGBiYfR/Ycp+v7tz+e?=
 =?us-ascii?Q?I+Jd7ip3lbND1VxdfXjEpngiB0K09cNCZCAPND/BFjq6SEi0/muXaDHnfR8G?=
 =?us-ascii?Q?Fh53KVXATWTObUG50HlkTCCnHPKS0oKIhz9hekl6XawmFht8plicL5LFKGx5?=
 =?us-ascii?Q?UOCr7XsCVi3J8rn1lAiqLFGmGLMVdZVXRZbCot9CRPJaItLd0bC158YZjq29?=
 =?us-ascii?Q?u107I588xd9aD1zB4uoiNdYOwjxcNPxUt0PCv1LAyIiEmpXgPTNYlMA6KTv4?=
 =?us-ascii?Q?rqv+7j7PYyVUj9hJq5gPQxeRLzmvsitjXCw+wwnpnxYq7DcqJeXFg393MfPi?=
 =?us-ascii?Q?d1LN7byUrpZ230URguFwfrOvZKPHSj0b5CSW8GkmrlTIuqv7nfXxFnybuWUj?=
 =?us-ascii?Q?MprOLPbuA0QF82vUF0if9rZcyKTyxeYo1oz6uU5s65Po1ktPp9k/ckM+oZYU?=
 =?us-ascii?Q?+rvum9xU0199uxpEAKChP+UAWbUuqrP10GrRzkk5E/0d9lqtU0dsW0viZjZW?=
 =?us-ascii?Q?Q4wox0A2hKFCBOhYW9ZPjJp49d2r2IVReVkB/oVFAzTrZYMMIaunMEITRd8u?=
 =?us-ascii?Q?WNzIJMa1ZeSu/Wa44XB/xmAKHMGf+++R72RPZHkc7fprChsF1smssACppr2k?=
 =?us-ascii?Q?kyblWFmg28lJBlrLlJaePrJGRUF3giH3PZqbdAFjjsXvlTB0wq8GJAvBV2Gf?=
 =?us-ascii?Q?40kNlJnG8bghTQgsJGlLRCWVRWvE4TMvzlTIH24CMfLsB1yX9G92tm8VQ4dO?=
 =?us-ascii?Q?EZ2NNj/W4KWZnfROevNwGgAozISevHl9GG5s/GGLwXQEEE+0UXcwXfrl27hz?=
 =?us-ascii?Q?CAMEVTI6pCk0luqEgsyIfxNCNSt1HbFMwEewvGnQAqOGbXIp5iywoF58EF+U?=
 =?us-ascii?Q?6YDHajH3QTx+aZtBu1MyqN26AEIm8ziPo+ahUREV86KzjsIeqS0tnJRwdUDe?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c083a0-0ba2-4441-7b10-08dca15ad8b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:37:53.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ+GVa2Z2O1CC/+I63HAsCfMrLDtY3ynV3FTkvHDg04rXGrO4t2iroL98Ks6+PnEqlx0B+4DJaU24IAjpk27yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 4c5b26423d0380a39034fb950e6875310bd4e5ac [11214/11381] LF-12185-2: regulator: dt-bindings: pf9453: add new PMIC PF9453 support
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110732.6s7YGJpt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110732.6s7YGJpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110732.6s7YGJpt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: properties:regulators:patternProperties: '^LDO_SNVS$' should not be valid under {'pattern': '^\^[a-zA-Z0-9,\-._#@]+\$$'}
   hint: Fixed strings belong in 'properties', not 'patternProperties'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: regulators: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: ^LDO[1-2]$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/regulator/nxp,pf9453-regulator.yaml: ^LDO_SNVS$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

