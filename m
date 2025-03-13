Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA9A28691
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741878039; cv=fail; b=VfZADmY4FhLAy4982NXyLBHO8+0gcrNrx10l7xbKaDMxHjmCq1v2DaI4NfioBLRyC/P91E+TKWIx+bYpHczVN6WiE5ydLYxmVjqeufwuKEnhBGi3VW4uEbdBMWNavRPGOXkK0D8ySqLPtrhXqSzwKrsHD3UXyR6d8qXRf7jkU8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741878039; c=relaxed/simple;
	bh=fm9Ktd3xPgl3dWGpWfIrpZm6HqpAOm42ZzJhvJKm/kA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=M8Y/y10qoG3hcNOc0GD5vyTxhbBaD6qhAgoWC0EHyfJOo1z6hK+b5alIu0yDDjxVdi/MIxzTcxwDDQ1YL8sZ+Uo/WrMzYDT/guIawo6s0y53CtcxRrFRRlRf1aWh+FxsmabNRii0JfLhB+WujI1GvEkwiju+6hrzZrrU9sd1cIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nb1bG0vs; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nb1bG0vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741878037; x=1773414037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fm9Ktd3xPgl3dWGpWfIrpZm6HqpAOm42ZzJhvJKm/kA=;
  b=nb1bG0vsKypwSqtZIQBUpRwZefagUsE/KsUzIXwM42HNmWuGTnuJqz/H
   g27GSqZ3PNi/n/e4xcjFUAFpa2+HdskTb31y7nYwna9WIac1m8Y7FaWtj
   uaqD2UxpRWwhc8t+wsDD9ZYgWEh/SD7NbDNdKoFp/ZvgRwvrEz9mrPvc3
   lMtTy/Ha2G3XGR9bGFj86DkilEc2m//amCgETRF9b9IsIz0Plss1pnW+G
   1TeuiBHrDl4k2LpIK78gKZVHt+tqabTTSyHxKM2BkXxOeLvih2bwTDwgZ
   AfIlqd/8a2cknSywd8wxo/TxwBdHODhXeLx6UIObPMJaguc0x0ga1yvfZ
   w==;
X-CSE-ConnectionGUID: khvrg5bMSduH2JrLZShuGw==
X-CSE-MsgGUID: 05v7bH0KTF6cKuhrDM4Zmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43030323"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="43030323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 08:00:36 -0700
X-CSE-ConnectionGUID: 5e3bimDRRsGnYD9zq1P0fg==
X-CSE-MsgGUID: 8EIotqd/SnqqLkO0a7GM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="144163720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Mar 2025 08:00:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 08:00:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 08:00:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 08:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgmhbVGmkoqzJOz3UBzUslO3nDZxjDCwDVCYQLOrp6e/CAOvfqDF1Z7+Df9LwMd0QPI6ikdnlwgjFT2q3I0JShdp2CQufJxTpXSZa3QDnjmWaNApVtk1ISt6uVh/JIaJUSd+rQt4txgH0UNRfbMsWoS2Toigl4WNMnfk/cvw+guNVLpj7WB1mouTC3C1D6PvJpIx33sg2+/YEImf191iy7uqtzK3bXUDF3gGZXBt/lu5vo8AxjK6zd++1KS7ORZdhADF4eP36zEu3inyiHQwwXSRqTPPFLhuU6DMi3WdyePqecwndXpRR/0DeLWmPhs5pU0yd8wef7LbKIZ1Cx1/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=losdxsvATmPZ/l71j8zl8Moh35wC7E12zgOrceftQ5c=;
 b=KRIzJuaTl7Zc/z9b1r+WhkzvUDTlAnU5ySS+pD2bLys0fqA+LTzspzuPTrIQ7h3eqQNQGhMkK6+Rf+UpVC0juYVlUlBdrpcQgDXNnrGlyJ6Cvn07Xfo937m4x7KX+R7b4urwWNlb3CaaDCi//M5HqJllsI0b7/PtsSD4F4GpVV4UKd4AXiQNbL8LyJ/l0HvhviZnp4BkuOPq6g1wkrCXMERucLP0HfruF8GmpFiw3DHDoglqFeuRbKTvH9jFFfWZtYvl1PITKfgOWAJHowIAzUlTDQXv4GRlyHd5mbpf+gFaHdSsJgnhnMiH9ksiVWNP9kvSJia/qskgRewicwU7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 15:00:17 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 15:00:17 +0000
Date: Thu, 13 Mar 2025 23:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpirko-mlxsw:wip_dl_pfs_parent_v2 1/3] error[E0061]: this function
 takes 4 arguments but 3 arguments were supplied
Message-ID: <Z9Ly+X7k3GQySpzi@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 8088e2bf-201f-4a06-49c1-08dd623fc3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nNe4k560hJnadrnT8ytAVTQn4wt7J3sTvEvBI52jQsVljBkRkfhX7kWAGWxb?=
 =?us-ascii?Q?+1p/v8BVYkW8VaY04cz03Pu+cAIXK2iektHz1kqkuao3XNkXXwkYIDdIeDt9?=
 =?us-ascii?Q?zB5rwlUbZT6sWy7WJz1kBaFleRhI7HFwfFvOlX++T+bcrY0eZ7mFIlHTM9qg?=
 =?us-ascii?Q?VtMAeie/sfJ39nS9PQQ8YHpGbK5OMffTxJz7cB/HhbSRGetFH4VCBZnjYe+8?=
 =?us-ascii?Q?Eqtmn67IQIp1S3kgM4Dyo2tR4VCQyoCkdumQAGjAXu6GdrswhVbT3uIQ32KP?=
 =?us-ascii?Q?MW4CcoD1O8QKX2S5uDycFlle3NYdFumwmRJlud7UuOtHmLFTvbH/kEeT1EkB?=
 =?us-ascii?Q?ndrniMXmjZcRkbOBiNUdcLIcAk96ADzRzIz0hAlgIfXgAlMcFsc+KUGTDZqZ?=
 =?us-ascii?Q?97Jz+q2oOzOXec7nJ46u2vOwHkhrFhwgwNqiTdXZNDOQKH6gShDqsq8c67MA?=
 =?us-ascii?Q?eGhTmAfUzeXKCWea3N9p2c4N8MhCzxH00ohosF+C+F/gBSjUNQ6RuVyqlZi8?=
 =?us-ascii?Q?WsFIAzVZPTzu1vdQo6F0v4vmLu3Ks5aWKToa81wmxVdfCOs8H6yvp9WIVJqh?=
 =?us-ascii?Q?s+cDW1kg7VbVw3ELG0fsLml5KWxB+ycvkmnCWKaceSqUqe3FE0AIprua0TYm?=
 =?us-ascii?Q?aKsjroDo6e5DdW5I4+Q8KbCsoxcEtVTT4EQkO4yb4LHxHP3G1RtZcieXmSz3?=
 =?us-ascii?Q?Ovl65w5GIAvDF+nfD+hHPGzFds6sNAi+iQXngN/aofpBDaAUR0Wlelodupeb?=
 =?us-ascii?Q?Atvjfj3HJYxQTDWEapk1mFX3V6C+8UG24R7/N5Z4cSl+dLGujLc+xyzykOmR?=
 =?us-ascii?Q?1VSxfRxJaYR8P4vc7k0lIzaUXT4fMo9pCw05hfK0w4829QiSQSrQn4zFftfl?=
 =?us-ascii?Q?Y4kc7i7FaDd7X+DXAPicYkuMy1Ml5H5Gv19h78TOPUqjtvsaMfI6quR4Iyr4?=
 =?us-ascii?Q?qjQy+xAwu9UpoDF4yDtLD/ol60Rsr/kR2eeDEZIru9u/7BHJqX6R+IBFnmBW?=
 =?us-ascii?Q?blxvjZw/mYRj3mUNohxPFwtS3B7z7mk+jLrD4yHWezwgxg3qAt24tU+akOEO?=
 =?us-ascii?Q?O4m4h+paTOPoHAX2FPTavlrxBUPczEHYbugSPKTVCsJgROPxbIqKO3QadFqr?=
 =?us-ascii?Q?eG7lxXZk7ajVyjSiK/G+ZZgu8XJoCq2meLHXDvOqaY3p5PfuKdXhXkMKqoMP?=
 =?us-ascii?Q?WX66pgCYlc45NQruMVvJ9HPJPAavySR3KSC6K5bX1/PeXzk2drFaI2rKXXuc?=
 =?us-ascii?Q?FHFPAXvu8MlBL33cgEdi7+9zWmcJl81OXQNjpzGIPOl6yDq+kxIxTFgbnJ2E?=
 =?us-ascii?Q?zwaXXr/+unCSBYznRHNC3DO6ER25VvrPRCZiQqhFj6fSBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dcjalyCMhfVTW6h1+ne9bxIcfR6vZ2d99CECuKXTg/+tS4Qn5y52NDT4tAXK?=
 =?us-ascii?Q?Qh8+Vgwm1wSFPX/7XH7J1OyI5/eDuoU9wiiJRI6gNghMncFO7XeTJUfTqW9U?=
 =?us-ascii?Q?ecGDN2HbF/RRfhKgkyi+wh1f3WnqAF9T+bWEk8VHc698iXqmVgz8a/0Z2Ah3?=
 =?us-ascii?Q?K2i1f55+UvchxaHBZHMq/CFVG3cZXQ2s0l01OhQFTsSu9cqRxkOwULSY2W/2?=
 =?us-ascii?Q?RN/hXWBKZPN7K51Nsns5YWloK61s8pAH+/Opqajcwk8IVkar72BhPriqNtDh?=
 =?us-ascii?Q?UtY9nCcPgYSbOBUbTmgjb7Q7xHXhDnzduga1KUkjpppZ563OsYaT19+YbQw7?=
 =?us-ascii?Q?N1MFJiKXCl5RvZDdambMrnyUDm1xgb7aURr1UYfGUzZVvzgBdKqQ3Z5ruutP?=
 =?us-ascii?Q?T9iFhMxui75P0sGzlm38FcN8HtSg/p6460dSSXPbdNRUfGTXTYtXxQxyXqUd?=
 =?us-ascii?Q?bMp4QsD3luPEs3IOAwWIsHgB/+4do19UOMeJaKL3bn769+h6jObm/Kxu43Hj?=
 =?us-ascii?Q?Zaf/A3cpWLf+XDmCiXq6TAk6fidBo4Aj2ofy8lb1LuqjIF7ifWm5+QMzfwYY?=
 =?us-ascii?Q?5w56tDXHUyHpdEE/uh2biO3XpggM+hwP3dyM/+J4pH4EsLb1PcZ1TTZJT/4l?=
 =?us-ascii?Q?dPDLRLZgtJjpjFrEcDvE5Pnp1Y/Dd7mpzEotMQrebKTzwu4xeNUULl33Wsc+?=
 =?us-ascii?Q?GW0vkDGvxszIgb7qeC72H+j9I8QGg0UhC1FB/Z9uXVn/hay+wOo0r87SUBZE?=
 =?us-ascii?Q?L1aEF4fq31YG89j2rOgRjtwviliC5yQyixteJx4sqSiTDo+lzu0wjIzxT01J?=
 =?us-ascii?Q?ePzi7T3cE7VxdNEgqvXwaayUdStTU7n7RRUAqQnbpX+tosg3/NCyVHPGTGlt?=
 =?us-ascii?Q?cAAmgFoH8ey/4ShSGJiD5I456QI1cfdwAkJSfdJ6yDSxLOH4TmbdTZ1FeGBr?=
 =?us-ascii?Q?pIjrn1etYjuRceEF7DxNSSa8TUuSpkA9qeVa1RYIdvV4rBj8BGU3dg5ecuWE?=
 =?us-ascii?Q?1hCSmlx/0XLcenAljmDacd+wUY+6XCcNArBIvrtwMEleIOCFPL10DEV1ote1?=
 =?us-ascii?Q?JhUq/A2FFW3u9JO9zc0nPHb8Y6VLgHpftDOmzBYCDGtAz288kVg2WWbSFCom?=
 =?us-ascii?Q?5LBg7CZ0mBYDjbnWmmtjPTdNd/IdWa/3WbvpnlsNHTojwR4AsgQau3BoTRwO?=
 =?us-ascii?Q?+eEfBUWcui0qshSY6wEfUT39IG/eWVlqd/zanZv7M7DrVYaTgfk07g3lhwU5?=
 =?us-ascii?Q?rnc+aPViK9ZZuivgtEcFNO6ap26JAJ5IcMeQ/g7l7QJYsEenXY8p55jU07CZ?=
 =?us-ascii?Q?CWXruNlwlsEquYP55ZvWtzAx1C1/ss8v2/sqLvCBgE8F1527C5IXvLxn7rsY?=
 =?us-ascii?Q?wvkSXkzUWCYqv5aoRKhTEKAAp83orpaoXMN7oBm+OwcevAPA+vBIJBpLyZZg?=
 =?us-ascii?Q?F9+UlsC+S9I3h1qvJ3fvk2OwXb6jUnn78qIiW+kYqy0rZeExL1Mvfftgtj77?=
 =?us-ascii?Q?lCNa7xNHR34T5rwxXxG70cwl2vp9M/+ChzRgjc58Gsx5KepgABNK61uCy3Rp?=
 =?us-ascii?Q?QhZEiPWwarczTP/8ftqWRrNkH1fVK6Yf3b1NthYL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8088e2bf-201f-4a06-49c1-08dd623fc3e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 15:00:16.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FrmrbiC8OoFpVdokkSCPNGBoHyfUFBD/mVCvfXf/JQPocF0aa6qj8M0Nw90elkHZN8gjIoUVoVNrpLxJpMXNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
X-OriginatorOrg: intel.com

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent_v2
head:   1fdd8341aac55462589828d0fed5b7d375cbfb0b
commit: 92dddc55f6a92701975cc749a90f9b33f0964f4d [1/3] faux: extend the creation function for module namespace
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250313/202503132249.hd1b9k8P-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503132249.hd1b9k8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503132249.hd1b9k8P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0061]: this function takes 4 arguments but 3 arguments were supplied
   --> rust/kernel/faux.rs:31:28
   |
   31    |         let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null_mut(), null()) };
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^----------------------------------------
   |                                                        ||
   |                                                        |unexpected argument of type `*const u8`
   |                                                        two arguments of type `*mut bindings::device` and `*const bindings::faux_device_ops` are missing
   |
   note: function defined here
   --> rust/bindings/bindings_generated.rs:59032:12
   |
   59032 |     pub fn faux_device_create(
   |            ^^^^^^^^^^^^^^^^^^
   help: did you mean
   |
   31    |         let dev = unsafe { bindings::faux_device_create(null(), null_mut(), /* *mut bindings::device */, /* *const bindings::faux_device_ops */) };
   |                                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

