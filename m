Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE8639
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721262609; cv=fail; b=GX+iLVa+j9yuc1MZgpWrwxDdnunLDRS07UvfcmXeiXViN/qptIam37+K9KkEmikwkqlu2MxBxEqVfQebWUeLDpgkYDgEZyWHa/GzH4Olm6ktS96z5bIYRvRtnoAgmo+mFw6e+6fhLMTx0cvbgYPXtPOfKqiCOxwxTAEoZ97pGfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721262609; c=relaxed/simple;
	bh=xug4Dga5a1F86gFM5chMbwLd4+yeUEfrGazbo/pbXoo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CiqVn+ksybdo79z6l0NJz9GELyt3p//QRqZgyna1dnWa3r8KatpYqmM6NblurxTBN4WTpJie7QMmj0YhDhnQHvrauINqUIsmPhYQWq/dzu4i7i6p9A2UY+Y6ayCS5gyvOp9b2fvkB2oNGI24JnB6uWxmbOu80lTNvisegYi0NJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxc8DsMN; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxc8DsMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721262607; x=1752798607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xug4Dga5a1F86gFM5chMbwLd4+yeUEfrGazbo/pbXoo=;
  b=dxc8DsMNDtuOyX9K+4sXQFDC4Gx533wAozMo6wO31unf1LWlMH8We7Ej
   5g3jCe0sacpZLxW0Y4sKR6DSmjwI/nNdtu1jY2HeIS0JGV6TVoEU45aSu
   yVDFv3jQzNSgsKwcc24/s8vfQ2lDLoQ8BYfCI8nKMNl7UJ3ZcAHhnyn98
   1pjruHWq3Upx3OZ097BCd84evw8i3SUEOS8VqCRXNWnQa6lX4V3fZBFhg
   k6LTPRHszhu5eF+LB5Fk0AHOhUl629s2cZTXhaEdk93mbxuoKYlwSKr/B
   LfZSOcYIXMtmxYhwoNIhMzhjNdhkF5RNcFBlwKmR7aAJJjSDN3/n6mfnQ
   Q==;
X-CSE-ConnectionGUID: yWWIqFrZThqkl6fRCfyHsA==
X-CSE-MsgGUID: 0kSJHC2US6OZmseY3kmgOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36338602"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="36338602"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 17:30:07 -0700
X-CSE-ConnectionGUID: rl6J5+33QSeqLsutBKYz8A==
X-CSE-MsgGUID: dqxuLuKMTkWqQdoMIE9GQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="55421203"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jul 2024 17:30:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 17:30:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZSuTIRNqvrIEtpAC2yAH7Ae+7mk+eMgCTxM6ilIWtbYBXjhaFFIFWdjfzgrg6FE4478cdMXb0PGl4zwY46L8WCMHFUOg5mNUS8w4qHLyxvRfGvvvrkQ7vbGPqj+D3BEKnh5oYz/tABMkqyYSMhKixm12MlS2zKPsOiECh+n0nZCxrz/PD2CR2FAWOEPIPkNyVQwpPJQ/NRditoV0jyVPlDIBJ71YYHHZji9tfFlqxil2A7yZ49nFZ6si3RCw9A1JEyGEyLxNr4kluma08kqVspK+HyqeSdQGH58DfxHFryZKclQsnsSt91Flwcwyi6intNTw3RIfctqoyPWj0vh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbnVl9LLt5ARALMpW2qjOXUrJhy3QrXxK4TgOYt+eos=;
 b=JmP6BAyuwc5mvD+57kHQo4cCtzpyH8ZCd6A0MBsOji0jCvC5tR1hf6pRj0lRD8khSBqEf+r9z1LPG+0aWGLB+eN6jC4ZUiFrBwpL+g2+QUEEYwrssKI+iKj9R5RVXin8CHgaZUuR/GcAbxIJG5lvgxP3HoiIACJfV+NH5i4jPq5G3QPRHsWcq2cEiTlf/BAZjD1NVkiUhA/hYvrA03N7lhEAlTUjQjtgQzB9Q3CudayMEDnTHTWVTW5vf9a1t34du8UxSxJU1HfH0GIMHAvdiQ51nptCrG6mxA6WZWTQuRBUeEhA2P+5u6oRz+10aWnPQzO0IhOj9NUtDU934i5RDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 00:29:57 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 00:29:57 +0000
Date: Thu, 18 Jul 2024 08:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 48/74]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20:
 '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks',
 'clock-names', 'clocks', 'codec' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <Zphh+1R9it+fe5YH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: f8afad98-aadb-44cf-2459-08dca6c0bf82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t68iBiw6Ir+5Rxn9yHy8mZy22EuxjKz6svOrfKQzrKJWDzcGcjfg4bcGryZ0?=
 =?us-ascii?Q?D+A2u6eXpMKICIJcwP7Rj9VcCwoQNX8KNa3eVO23zG4tB8W3+8nQ9FHZQW8N?=
 =?us-ascii?Q?shKCRMXtVhBD17VubJuwR+k0GAasOFsPnQcTKVVdLkj4xIwC/HPrJYNVtIzg?=
 =?us-ascii?Q?BpmmUtnLK2sp1ST5kIXO+qvX6Qwad7werBuG2VBSeDjNNWXJw6grLVVmRkog?=
 =?us-ascii?Q?Z3uL7kPwnFfYVUH7UnzaB3BCTOKI3VbKBk+3+yMv6ucSZx9rL+g+Koc1itMH?=
 =?us-ascii?Q?PrOsCynbGYlHoMzzXu25swct071Qd/E2s3dc3Y5G2emS4uiELNKqsLPfMujS?=
 =?us-ascii?Q?uK2ulbLbwGxb8fSwiYTU+7zT5+r+eJnryNL77L36ECPuHH5ecUFLvTPUgDbI?=
 =?us-ascii?Q?Fsb1lux8JkCpSO7p3i5uGvo2XL7eTR7x6bF30E4EU7bWZWXbzAUhhtiDVAuj?=
 =?us-ascii?Q?gpmb/Ub4+vNFCbN6TZbgSg6Mi7TqPhZNa71hG9XX+mdmWfl8PZOaXGKOIlOq?=
 =?us-ascii?Q?Btz5rCFioG6YxC9rm8hjG/YtXJsFjp+xzwD/4ZAqR3npV27/haHggVdnr3iN?=
 =?us-ascii?Q?E9+6RV2gMXVwbJch5Abct7/+heXt001Z8rbosGd+9AaQV5q26Xa+IKmQ/bep?=
 =?us-ascii?Q?HWmV8rxvXIFsw7VNs0jXWMADHXjhK+5wiZElhVdzusvjdBjqXEOGskohF89t?=
 =?us-ascii?Q?pa3aoBhBEYU/y0qQ2PxQ8Avv+b63Ba2BqCVM9N3hY8EMAFHRH4LAqalT14rM?=
 =?us-ascii?Q?kuYUFaFYCIxXI+Y+GGc1BGaKocgXTp6fcNFaUOqV8nFENahaLcfYTdlIbcA8?=
 =?us-ascii?Q?fQLmMloMVeoqHNyL9KVeSbKaAWsPY9madJUi0SIyuFf3hXKsDYLLVj31UNOf?=
 =?us-ascii?Q?pusmWXNR1kcUlMgsI7oy4NSp/Q4NwQg4z15alGzmKJS9VnP4rpGqu3B1e3y/?=
 =?us-ascii?Q?LrbcrETrefMN0V3w/XXJwK4FPw2X0BKUGxEFIa3PnzGhXLxweHfXVwkils4j?=
 =?us-ascii?Q?el1v0AG/IMPCVwKktV42DKNoBgUpNM3EuxD1TQuIDtrgl/Ud2gsZtog7fe37?=
 =?us-ascii?Q?lgVHhqyKdF8OxU4V81xZQqYWNLLvX5LWKb7INagDw45LT/LfY8dRtGk2p6wz?=
 =?us-ascii?Q?kNGnvC1nRCsyIFOr6oSYQI4KbQTkRKij9h+Vsheb+sJZNJb1AGJ6BkevaywQ?=
 =?us-ascii?Q?A1Hb+cTKuIFcrDNT5QQQinc1fkGX+AAYFVn0dEMThS+nKPaSYMSQiEuz6bk5?=
 =?us-ascii?Q?PPX7Lk4bwOP9rjxEdJBzXwy1w5bURl8NalatsOoTqhGUAAM4xHan1nt/6ahi?=
 =?us-ascii?Q?1XBM3KbkZ6ha5d1Onh78Y0tQku60ggwVCERMeMZksSwuqM3BohwvFDb7TENj?=
 =?us-ascii?Q?SbyuYHc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RcN1v0BbpjHcUjuUEsfDP98ZgEna/6oiEthF8Tc0FeElfhl6QRLmqeE2Lceh?=
 =?us-ascii?Q?V4pJsKYMuWeoyDXVxuQ6qGCsqjp/CdaRkU/wDVwAQyhGvhlRdkv51KNmB+y4?=
 =?us-ascii?Q?/3u3/Fyes/wfjl0yepIWThu7m5OpLfK61rUc9v36RfWGLHuHOdavM9/ZpPKb?=
 =?us-ascii?Q?tpXAYXR8M3swJMI97j4Q+heh5ny961yEZQzKtwVRqlxwcx7+tCjBKZoCgiSa?=
 =?us-ascii?Q?gnsbKJkp6whsDy7ldtMXK74v2qsTFddSnKIOykFtR3S4vho01ObSS5qy9j+9?=
 =?us-ascii?Q?ejI0KNbFZOO62WZoqw0eovxFxvX/YwX2iKq5UVRQiUFaaMfhuOuoNgOjg03X?=
 =?us-ascii?Q?qwI3uO1+fVRTNqblm7+8YRacgSs6szukcEWMeHU0KyzBQYMPGibKqcf9F0DL?=
 =?us-ascii?Q?GQciCZeFohnIHoL+lx4e7bFxTww0/d6lS2yttktwyyfg5HMovTIvEl1zQf/v?=
 =?us-ascii?Q?RBOmQ7seWTskzdW0DkMJSrtp+ym9zfVPelRaQQLE0X4VNK0UWkUL8MLSMWnw?=
 =?us-ascii?Q?Qli75hQGQxcd6tvRpNGvvJpnwvZHjNxmZp7eR0XZx87iw+caB9pKI6Re/++l?=
 =?us-ascii?Q?EfHy4Sm+8legPXIIVGLQhAGQQrqbH8t5HE8/SFDiTZayr9txVRTBWYvGKJAn?=
 =?us-ascii?Q?XT+fUkhneYnVrRRko+H2kdkR7rJqnSjOWo/VLPQQSxWKkhX10TZP0P3cxxUY?=
 =?us-ascii?Q?KGOcmygcckGMkuqaZhiY71DMZHr71O/4McrXBekdEgKR16rzwm8T/ikvmVZL?=
 =?us-ascii?Q?NmClpBNhOYS2MzFkgQAweJzTqhhOeyxEI0mCbCDR5LwkV0ADl2tehXtVt8O3?=
 =?us-ascii?Q?EGIVMUw3OiW7CGOl8vByU68h5C+j5JeRPFX8jPhdYUKc37Cl3CDgSNQfmPO9?=
 =?us-ascii?Q?admKJ/0068Q5mmCZsIdNb+aGiFwL4CSXQvRGYBFCUEm9oghlk54ZfBlMGTAd?=
 =?us-ascii?Q?7HccurvT8xfog3ntGPshAjHWfeouUafRYsEnyK3FZ7p7ifK09zZ2dLskyLBr?=
 =?us-ascii?Q?47hYIVuPngaBYoGTpaM6dECPvZAgboQrdRYJ+jvIPU6cbq99zck/DDCky+j9?=
 =?us-ascii?Q?jufZ0wNWfcjmJEVMclIOY7FOc1FskfADpWYeJcKFUXDpLdR9v2nxRoM3NYUs?=
 =?us-ascii?Q?cjL8MaRzr8mpPeBp41P04Xqtvwi197Z5kkk7dMiCu7I8DycSix9Vp5IZvJrw?=
 =?us-ascii?Q?J+AjOdVAEygpl8d/T3CgRw1qLq7FI08IqY6gjCsujhAFfQedt778kOdZ795T?=
 =?us-ascii?Q?QjSC7Ia+8A84Or8VL49F5V3pm3bo0nqgqyy92CtQZwEPdeGqNJoBis5FDblQ?=
 =?us-ascii?Q?6kyVNUIYJpa8lSv5C432APoDhk3DJkUi0xracpd/Aimge8oYB0PdmtUFeTKn?=
 =?us-ascii?Q?dgsinw3gKf5CiGrraYT+NVwL/7A7YeYsYkIWXAYBR2pYmGhO+FZnYMXB+6C4?=
 =?us-ascii?Q?C5eMd8m4VR3erCweMrIGNZ7rRuouqZOYNDEYIgSFEDPZJOmRb3TVgcEZgrd2?=
 =?us-ascii?Q?2tczGxgpOgudfOpyZj28CNO5lRy6o49fi/s9/AiXviLxZjE1jDsuuYeEruXg?=
 =?us-ascii?Q?cntT7BMuGMuc+Q9xx4W1b2kfBM57sSW843CYNvj848EhFKaHg2Kekh5uSTvl?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8afad98-aadb-44cf-2459-08dca6c0bf82
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 00:29:57.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVv0WVqm5VI2JVl8fJJrEHVcQGM6yaVwE+bIVdS1zv809yUgA3mrVjmrfAxXcZr+TdElEycSUumdWzkqUUKYZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: cde511105ecc0476398434a06b2bf08f4c3a9ddb [48/74] ODROID-M1S: arm64/dts: add rk809 audio codec support
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240718/202407180139.AwgtxPuL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180139.AwgtxPuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407180139.AwgtxPuL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3128' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: failed to match any schema with compatible: ['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566']
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: tcs4525@1c: Unevaluated properties are not allowed ('regulator-compatible', 'regulator-init-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe410000: Unevaluated properties are not allowed ('rockchip,clk-trcm' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: phy@fe830000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

