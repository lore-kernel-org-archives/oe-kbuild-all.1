Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12071242D7C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694020; cv=fail; b=pCEjpIMZuFDv98vHx0IgZKevHLeybHz417w1rPeNh1yQq7WPDtQFE1KztbUzPlBZetdF++7I8jMwF1Ka7JkLBWkhXhxhE0cgGz7jPIQNajxJEn3gDUZp9wisY7qa7OeySvM6z+aNa8FvCVTh9dWt8f/cyDhgfy3vIrkpARvcKGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694020; c=relaxed/simple;
	bh=u6mSMNbS1RP7zFZ6+/FtlkTs1UyYqoDRUGoRYn247ms=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ahwxjhHThSMHIV17TyJF3dWeSHO1Dqbp+/blGf3xs1UvyphLeNV3jxkNuVeEtaXCdIkS325du6avmARs4Q9nMVlaR3geq0FlKBKbvzdZ5r4pk2X+x68dzuBdS5493LRywPJC34EC1Ph0sNykZN2OzOZ3Y/OsC4vmXi4MuDZgeqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBjhd0V+; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBjhd0V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764694019; x=1796230019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6mSMNbS1RP7zFZ6+/FtlkTs1UyYqoDRUGoRYn247ms=;
  b=FBjhd0V+JHiH+kYaVGlEY3/u//sOB0MGLpjwM+jYARn92/NsMw6WRQaH
   uB/mjQ4zcFSLTHkPDcOeJnccT7rQprQEpEJaUEAMJIt8kcJtzqFHcuhRF
   Sskjrw8DQRDFAWQSqdwx6yjiy1sOJoxi5YisoGaiiOhHoJcSv2L0wDd7i
   fkozK7IGj+xiIXCFMe0H4XXWWSOzu6iV6h7YPbyUzngg2XAd+OKCjxIHK
   vXafCVxK4cgwvmtS0zm7olY6RibBw8SI6KUs6xgRbu8JSCriOW9LuwxDm
   PlLhE6GQB4du7t34wOqzydZ+ymX3qDkzfnmrtCSuAYHc2EjTg6FPyQshf
   g==;
X-CSE-ConnectionGUID: 62YwkqqYSWWfquwiLMYHDg==
X-CSE-MsgGUID: t9Fy9NSkQdqd6SoG4YnI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66837721"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66837721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:46:58 -0800
X-CSE-ConnectionGUID: Fzl7BLujSGeZm2NsPnny7A==
X-CSE-MsgGUID: 4gGMtwXeRNyfK9l2jc5NXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194656682"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:46:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:46:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:46:57 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:46:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayM4HI48i6vvTH9tAnIadmBBHwzUEKXpKPw1vjUSgiz8lAA5Q29w0tDA8Kg/zKdVyXoqYV0l/BfNP1QrCeiA6zOCnexmkIApY+oL018KwGcnrfBzq/BQJDXEp6c2CBkMqgQhUIDa2GAGmRwqbDCQgZxKMivZqtNZP6AGZeBhQvgOZinz2N086nvhhlRVHta9PLq8lldnxhK+2BdJwhHcdhHpeCfpn7/8daOJXR2TQFile3+Ukabvoazjtu+RjQveV/1pz++DrX2LoM2vGkokjSS5S1h2gjBh3jZkALmCCkwad6nggXcBCkS1cK33mvhlYM03UFSANMF2Ns4bPPvCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUy+63hPd3NCKG4uvfAVHsG4ADHxvUL4GbknvuA+Ark=;
 b=iWKqmI4aHKLDCz449e8vaKFrcrdFsaIPM5PrYJU0Rnjfi8pOsrJaCloChtLYuf36E9SZTqDyasiW/RJVZ1zbmyxy3IQlyfItGoHEt0Jrh8uNEEy6vWEA+YXN7OI76U4qLschQ1FjwF6bXqMsrQ+xn+7wMhPsN6laq9i76v0vDnOjbFlPrKadDVpnjl3EyUYsSxetpzfaC/gedYADQQQHfU1jDG1ewQ1r6+ktnbbFRFy7r/mbOV0QL6ioO+CxdUe9O9X/HLqFTFQ12wbyRgxJukBLl2G5AEyOGd+V+sLSDl7o0eyGJe4P8VhI74D+vWFFEuWosZ61GsJln2hv+JtE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:46:54 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:46:54 +0000
Date: Wed, 3 Dec 2025 00:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [rgushchin:bpfoom.3.1 28/28] mm/bpf_oom.c:130:20: error: invalid use
 of undefined type 'struct bpf_struct_st_link'
Message-ID: <aS8X9TR/8GxmCvfs@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d8ba4e-1b18-47a1-f3d3-08de31c26616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m7utT3zJwqQuhPYO2UJf2kU/pdMV3RzB12LFG9bxINO/YIznNKg4oFtKKi/2?=
 =?us-ascii?Q?a2OmvTD5BQlndBlTQdOXyokyE7nLu0anoloWyGvcXnaCh5m7IJ49yYwdKsBX?=
 =?us-ascii?Q?mPYmiZX06hfBEaMw3JAmBVGMbMWUGG/Iff1ZhYUPFLzl6f8eoNI9MShCkhPO?=
 =?us-ascii?Q?mV+QIxLJKz8uaz9Lw6YauXiwO7kkcm41c7OZJNRG3Evwgy3h67IiOQQ2H3bO?=
 =?us-ascii?Q?sMxZRc//GcCdFPNYk2WkC6GbXmNVolgFtE8fJtA0c5n2utbjn9CkjOQ4IfI6?=
 =?us-ascii?Q?BcXYrb/l/GtGqKgu8mdW6vOVw2SZQ8lemeEOsfiDQarHh5K40Zk1RkkdCz5r?=
 =?us-ascii?Q?4eGJPJ9y/XCIs+sRIrdIT/Qb+8R7OwLNH39lOizkGCqpyhoznPengotjmjMW?=
 =?us-ascii?Q?YUtq1iD96HHYm4K6NwUIYkdavrQn5XpIBUjpV5IyZIEocXPl7bLHju4UywsN?=
 =?us-ascii?Q?VGBOYj9ICDNZAS8WH2tQg1ZBU2nh68kOmy6qTQqfNq2XRAgWxC8tdSLJey35?=
 =?us-ascii?Q?ftXyiFRkZ0fvCdhnRFvqF/lCkA+jd11+I/Y/fwvzvMdk1dXYXfB+C8/hYTKT?=
 =?us-ascii?Q?E6daCAwHUosnToClL2fyTcF1cptdfi9bwK8VgooPHAzYTRy+x4qgh9uPFejH?=
 =?us-ascii?Q?cF3U4t3zd1F/M8uJW2L1YZQeIOf/Ihiww5KCcWMQMx3o3wDehm49WclHXATw?=
 =?us-ascii?Q?qE97ywQMQW1yjiXaWPKy2/VdcUCHr9upBZmdMhceGXcQRGzNtxwkXbrLaJ+3?=
 =?us-ascii?Q?QiobqVqypfjWQ0I+8D2xo5hltIlxPyM5dEE1NovPvEv6e8Y81DKLKBAxkZf2?=
 =?us-ascii?Q?VvPqGwuifTyDvqrXohqQxU8KzG1pXxaRKu0g8yW/F1GSaj7U49xr5dYOqpRa?=
 =?us-ascii?Q?uXYXewi0wIVO4Ec79RP9dWXxl/G2TywqT1SCaYawC4x8kLUCjr+BFOQvYtlp?=
 =?us-ascii?Q?MMykeqDdCZIAnYZ0pkU21Hadcz96FA0dQ1RmZ4Dks/pnk26Df48RAeu9Yy9W?=
 =?us-ascii?Q?OiLlF6TtxnZ0iZkUv+LkUT1AixxxYG/z60oH4cuo2JPW4OOZfm2K8EiKna2l?=
 =?us-ascii?Q?/yPnEewnJgPSZ+Ffmuc+xPa1QBLUlHfJijpoO3cPlqrdSEdg0QwHcqetSDqg?=
 =?us-ascii?Q?s6+Mzlmje3urHz2hhZM8yAHCSLpNxWi5vJEWzX2h+6wP7EHrVAyEiQaXcjpq?=
 =?us-ascii?Q?6JY6RcpwqI2t67pvN4chFHhrTYzO41+M1Wbfy9yVxXdcxktNxzK3dSO2MVLG?=
 =?us-ascii?Q?5HWLAEx4qKLhSUz2kNPaXd1lqFRviyFZDM4vwz+G7GxttWAaIwwCZmiEjgAU?=
 =?us-ascii?Q?CY8diYYZSy9PeKvNb8jM/6lW+GwGYtt4fJ6GJCfsTba/D/+fuayXQwhWmZLj?=
 =?us-ascii?Q?SzFlsRJdnwx4Jzy7NNP6rq1BIOyW7zdUKzy3HwTX0KbQQ/QWMT+hdJN/bUt9?=
 =?us-ascii?Q?U4UAYieK7hSGgoPpONKt+tMP/MXF2qsezOb4pQJ1pzGdSLzZ6SSwwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jJ5oVCN3xaY1/ftOryPDTnSbf9oW73o/owSHz1DiQwj/ucOghw1JHwzMxdK4?=
 =?us-ascii?Q?t88OCt/SwXMvBbtInJLCgOipLpqPwL2tH6JBAm+DP8jjCVR8i3TOud6NKZXz?=
 =?us-ascii?Q?0boEWsTzYW/1Vot1E0Kj4+/KxIk1Q0jlhl9iwwVHUK0tYqH+KEhPeS010prQ?=
 =?us-ascii?Q?ZmUH15KXN7lxY7oMiMi3zx0A6I2CKYK0RndsnTamJ+q4BUpgjjWQZYnrzsRO?=
 =?us-ascii?Q?g1uwo5iv2WpOMpQwlysm3G2rFo5oxwWj3/QQoo9LiYmz90LnYPQA+dZvsI9J?=
 =?us-ascii?Q?91LUc9A7B6goQ6kUcR4yFetLibG8i/UD6JSgt0XrIGPzeQ+3gNvZ/AMr7j+3?=
 =?us-ascii?Q?7b44MUTxvVorehS5lO2d4I9eQKSbg4XdZ3QPilB0in6lJTW6F9c27RLtZh0p?=
 =?us-ascii?Q?2pzGDN+eqAA36F8x9kDlQaW0iMK1j5AdMQCkU/kcji6o0nLZaGX2wH+qoa7u?=
 =?us-ascii?Q?vpDsaXFEodiQBGa/up25haoH3SyLe+Ky/wA9J0fyzsH+S7SKnyGKCYAaFFo+?=
 =?us-ascii?Q?b+BeoXh9wm4LHEJ1sEq63ELFEGV9GLsynG0ahGPUM2chb5dPV6PAAzI6OUmK?=
 =?us-ascii?Q?00a7fiM48uQYAM/kvxVtcFFMq1bscMd8dsbIAyiNMd8L3f6+qXJw6JfVilXg?=
 =?us-ascii?Q?qSDJ+s8yN4h4K5dRW6/imWWQpdqc2+Ypu+PceES89eJUd6S62Zi/hW+XMbLp?=
 =?us-ascii?Q?IaqU6GWGTgptEINagCuDTW60nVpfitnv5igzvxnxjyDSOuy4pTSGBpJ34j3Q?=
 =?us-ascii?Q?dwPyOn8NmbrSE9YrPP63YalCgZzdFSt7tM5BGYyNdCpDz+veGYgSgBY71bQT?=
 =?us-ascii?Q?o8P7gIjm9tTZS9YK627JQyAqbYiXU83Zbyd1SpPGg4BaIJXFTAM+uMfc7MwS?=
 =?us-ascii?Q?0BQRZRGv3gGu7DsPF19t0mtlsVSjKGwlsYlRkyg2AKnslsSpvBMOcVFEtqWF?=
 =?us-ascii?Q?7Z8FltBrlCfz4KsZP1Vf5PStWy5FOiUCTZVUtnWjLLSOufVY3yhHYekkHVo2?=
 =?us-ascii?Q?Ieb/htkZ448bMNrKhmN1UZAD/MBB9YTwY5orRxaxP1P98f630pc/x9YrPg6t?=
 =?us-ascii?Q?VmH52ZKey3JFL+j5JqIGRsnqAMTjJzaZqjA/U72YPgZJPdYBn6HlYZle2iA/?=
 =?us-ascii?Q?sKIsITK+qRpU7tTr8Ax5dOCQPUzGuwzpEMAA2aIHUeilI+6tCbLNFKyA519Q?=
 =?us-ascii?Q?weTm7dXOtkRtWU/7xFv/8jPp3o5ym1KF6tLwJGhXdpvhCuYpLP3tTL16OF2/?=
 =?us-ascii?Q?Rw01/RYaYD8W2dmVkzTJqriiTXe+7YjWqCrOmHcY40DIj8B9mCypabqszSP+?=
 =?us-ascii?Q?auGcLSkdeLDQesoWKhE6HRiPiaJ2dLCCaG7TfDHXxSHlGnu52WazJBp6NZrm?=
 =?us-ascii?Q?PzQ5jhAQqTXnwOKiiu9KknNHFenk7Oes5NRsJ0e7MHdmRdelt0fRG6Zz3SD7?=
 =?us-ascii?Q?MNLbUw93c82UIrQipKj8OI7UZeBH+PJnIVq4E20jy956Q9koixhtlJz+CHHo?=
 =?us-ascii?Q?gDY886j82zOgnGMk/BTv6rcJKywutNs0y2FSEIkuD4J0pvtsCIiyFIbxX3CZ?=
 =?us-ascii?Q?4opXNjVvQxW5Nc4ogyXhmBGjQE1U2oe9HJB/gJWWetJFV+1ApgN4GKwxKD3/?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d8ba4e-1b18-47a1-f3d3-08de31c26616
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:46:54.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4CT5PPBbN7r0iuIyMRtqOPN42G9FLQNmPXWSvIdS0dpsUkJakxNnZU26uVxO1fOqVUrZPfjA0JbwpkvJdzrxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
X-OriginatorOrg: intel.com

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   dca9f586d5471222d105b51cf2ceb5eb91fdda01
commit: dca9f586d5471222d105b51cf2ceb5eb91fdda01 [28/28] tmp
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021736.frgkJbzw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021736.frgkJbzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021736.frgkJbzw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/bpf_oom.c:125:32: warning: 'struct bpf_struct_st_link' declared inside parameter list will not be visible outside of this definition or declaration
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                ^~~~~~~~~~~~~~~~~~
>> mm/bpf_oom.c:125:6: warning: no previous prototype for 'bpf_oom_clear_link' [-Wmissing-prototypes]
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |      ^~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c: In function 'bpf_oom_clear_link':
>> mm/bpf_oom.c:130:20: error: invalid use of undefined type 'struct bpf_struct_st_link'
     130 |         if (st_link->cgroup)
         |                    ^~
   mm/bpf_oom.c:131:24: error: invalid use of undefined type 'struct bpf_struct_st_link'
     131 |                 st_link->cgroup->bpf.bpf_oom_link = NULL;
         |                        ^~
   In file included from ./include/linux/init.h:5,
                    from ./include/linux/printk.h:6,
                    from ./include/asm-generic/bug.h:22,
                    from ./arch/riscv/include/asm/bug.h:90,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/alloc_tag.h:8,
                    from ./include/linux/workqueue.h:9,
                    from ./include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct bpf_struct_st_link'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   ././include/linux/compiler_types.h:532:27: error: expression in static assertion is not an integer
     532 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   In file included from ./include/uapi/linux/posix_types.h:5,
                    from ./include/uapi/linux/types.h:14,
                    from ./include/linux/types.h:6,
                    from ./include/uapi/linux/bpf.h:11,
                    from ./include/linux/bpf.h:7:
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct bpf_struct_st_link'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   mm/bpf_oom.c:141:21: error: invalid use of undefined type 'struct bpf_struct_st_link'
     141 |         if (!st_link->cgroup)
         |                     ^~
>> mm/bpf_oom.c:144:28: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Wincompatible-pointer-types]
     144 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
         |                            |
         |                            struct bpf_struct_st_link *
   mm/bpf_oom.c:125:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_st_link *'
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
--
>> kernel/bpf/bpf_struct_ops.c:1205:32: warning: 'struct bpf_struct_st_link' declared inside parameter list will not be visible outside of this definition or declaration
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                ^~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_detach_cgroup':
>> kernel/bpf/bpf_struct_ops.c:1211:28: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Wincompatible-pointer-types]
    1211 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
         |                            |
         |                            struct bpf_struct_ops_link *
   kernel/bpf/bpf_struct_ops.c:1205:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_ops_link *'
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +130 mm/bpf_oom.c

97fa5fc46535819 Roman Gushchin 2025-08-11  124  
dca9f586d547122 Roman Gushchin 2025-12-01 @125  void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
97fa5fc46535819 Roman Gushchin 2025-08-11  126  {
dca9f586d547122 Roman Gushchin 2025-12-01  127  	mutex_lock(&bpf_oom_lock);
dca9f586d547122 Roman Gushchin 2025-12-01  128  	cgroup_lock();
97fa5fc46535819 Roman Gushchin 2025-08-11  129  
dca9f586d547122 Roman Gushchin 2025-12-01 @130  	if (st_link->cgroup)
dca9f586d547122 Roman Gushchin 2025-12-01  131  		st_link->cgroup->bpf.bpf_oom_link = NULL;
97fa5fc46535819 Roman Gushchin 2025-08-11  132  
dca9f586d547122 Roman Gushchin 2025-12-01  133  	cgroup_unlock();
dca9f586d547122 Roman Gushchin 2025-12-01  134  	mutex_unlock(&bpf_oom_lock);
97fa5fc46535819 Roman Gushchin 2025-08-11  135  }
97fa5fc46535819 Roman Gushchin 2025-08-11  136  
dca9f586d547122 Roman Gushchin 2025-12-01  137  static void bpf_oom_ops_unreg(void *kdata, struct bpf_link *link)
dca9f586d547122 Roman Gushchin 2025-12-01  138  {
dca9f586d547122 Roman Gushchin 2025-12-01  139  	struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
dca9f586d547122 Roman Gushchin 2025-12-01  140  
dca9f586d547122 Roman Gushchin 2025-12-01  141  	if (!st_link->cgroup)
dca9f586d547122 Roman Gushchin 2025-12-01  142  		return;
dca9f586d547122 Roman Gushchin 2025-12-01  143  
dca9f586d547122 Roman Gushchin 2025-12-01 @144  	bpf_oom_clear_link(st_link);
97fa5fc46535819 Roman Gushchin 2025-08-11  145  }
97fa5fc46535819 Roman Gushchin 2025-08-11  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

