Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719614D2B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723302997; cv=fail; b=u1Jma586FWEDaEEOd5e/n1sLTRJVyfb3dyprM5eejiOcbQaGV1U6jGWBm6Yh0rTnNHH+F+EI4bQenQX2bnJ5dDzZf6GZh2+uqQE0Dkl8dmg3vyIrTg1+Kh53wtG8ZYjdCB6pn9ABaAKWatqrdJxODk0WHmbw9sY57ItLKr9kZAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723302997; c=relaxed/simple;
	bh=kOW38f36Kk6fe6j+uOFHvCxH28qUTItpeo0q7H3b5A0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LMRf2MnhoJ+FHKgqz/X9hQjxcPDb7DHVfGMpum+Z8GJXFKMBnJsTpYxL+nhoNCM19ZG66rhzuwcJTxhzyjIQYodQ4Kf02kXnQ5QA9xN7GwH0+86WLSUB0XJOtoDqRT519XMxeqz7pgYmwJMiHJCHDb8+3RTt9wM/QlxBI9PNX8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpOPZ4kK; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpOPZ4kK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723302996; x=1754838996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOW38f36Kk6fe6j+uOFHvCxH28qUTItpeo0q7H3b5A0=;
  b=SpOPZ4kK3wp2RhPZuvTEkq1PLo2LYy/46tRz7XprAlLkxZglPmgHKCY8
   VO3sZU4Z21qJQCDvM23If7nKtDOmBnuxSyOE1B1osuXeeb04BUJMufs71
   5GmlqDSKQ+cP1uFBDrVeZPIVKmeROmfm6oL8Qt4rMEPR6P22melMUUGKI
   /0mLabIutNkIRw1gny3k572lSzWXGe/tZ7Q3SFDONUIjeKH3lHjFK1InS
   H0z3fPNfDkjC3egNNpIi+MzfuI+ODz1qPiAQo5g9XBKOIsPood9LJoAW6
   jqrwWNaRLjMw3dCSetJVt0jpfjjEIugbeYfQDA1r1rXC9RAB7fE7WhpLw
   g==;
X-CSE-ConnectionGUID: hT3V0+6uTTKfj6CDU/r+Jg==
X-CSE-MsgGUID: 4OU/wBDtSBebM2M7nyRnYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32043360"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32043360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 08:16:35 -0700
X-CSE-ConnectionGUID: q7IB7Z1oRiyI68sd/eOvhA==
X-CSE-MsgGUID: U+wF6cLpSOW9nbq5QSOdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="81066779"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Aug 2024 08:16:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 10 Aug 2024 08:16:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 10 Aug 2024 08:16:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 10 Aug 2024 08:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1CEXuHGN+nZE0l02pCXcmkLSo54nwG6OZtJurS8AQPBDa1GW31ATn6p5VjihGrWOg3hJEYL+T9T+4O7X1qpoEZPzLZorvtNS9xSFQ5D9rqKBWrpm6u27CX4EOMdgDGfNTIW/lnOvQwtAaThqKWnRyHxxg6Dm5FuidgK7mLUbNNljtnCKtcyudoFkp8WC223xT39shg0g8Z6RcHlV+P6ROLD8MNqVHpTnV8J37bb4yVifXkMNwGpdySVocHYJ4rf14YqRHNpVQ/8pAMkR/YwM57kP3cDGBFoZ/jK1zz65kwmB1J4eyx0zLFxhT7nBYiUcxVRi+YAhGWieLcO4dPlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8wRwIbFXLMaI98Jm4+n0juKPhrRwDc7j86jXJRTjfU=;
 b=cgoSekNLQ++shFtWfgjeuq8GaysFlG01RjMJBdxVWjXhqOmFxt82KHnxZmEbV+hThplGqmjyR50J5bPortZ9z+1RlmfaXRTPe33JtNXJNad3RpIW46ygKInv3WChs/o0Yk1eFAOKhT6AgBfR/44kAEx3ehkOLqcSziNjDSEPr9qe+LJ1TdorbRn1MniCWkF1R5tFbMtitfs3D2Eig0VlPN4ZkXvqFZLWjAZ2I25vxtQodGwY8JU4zu2apdxjLqr99pnZJ1fuMn1KmixmoOjcKUmeXqETJvN86RJk6igXIwD7AS9ews/IXhyjgJbJjyeqy9unsgpN95l9vKB/54JRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28; Sat, 10 Aug
 2024 15:16:23 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Sat, 10 Aug 2024
 15:16:23 +0000
Date: Sat, 10 Aug 2024 23:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 32/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZreEPFJoLJIGEEII@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa59bd7-709e-441a-3396-08dcb94f655c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jeS2PMX663Yyg5O1fpigIkmZM1WQXXq6xsO6rhObcUgz+zljWwErawX9O8Hx?=
 =?us-ascii?Q?onFLCyRkkhVymYXsdGQ5ftaMCqj18LOnwg39tVkT+5mUX0FrQgCYEi2azQ13?=
 =?us-ascii?Q?aMfBpRE6SImgKdVkxQa3tugTGMoBWG7aheEvQ5FzsuoQ7sJMXh3RxZO8+CH3?=
 =?us-ascii?Q?eRYgZ3ntKbOtN4OBz6RFEw1DHfPIvjZhC9Xv2Hdnvt1f1zpgSVBK1o1GVyLW?=
 =?us-ascii?Q?TUsDbSYLI5JDWSvpkCYgix+NH352HJZ2tyPs4emVOgv5rEkxwmN79GhtHpcb?=
 =?us-ascii?Q?3ZMTlSQXgS8g+82nvEqAUwdU0NNXMbzbKgDOj1O6p2QEf5KrjTPRJCwM9JIL?=
 =?us-ascii?Q?VUSE95+qB5n9cJ6XWLkkrfjSWuqf8GedXV4ISMN/BU5MwBKlcQnbD4Tn6jsD?=
 =?us-ascii?Q?VgLQqXTADHuqkpyJom7abLM+VGa6hnbz7J3ivAxHe+pUtf7WiQ9o0FDHW+v6?=
 =?us-ascii?Q?3BJcOvjDueGt/d8hgVCGGwhW+CKHdn7I0lJEWCCvZjGg9XCcUt4PaqvhLyZH?=
 =?us-ascii?Q?+oh9eV8EBa+QUm4tvAmNfsnQswv3LNGf7XU/5rFl9OWPKFMI8lqifOMXfg39?=
 =?us-ascii?Q?LNELXfoMmrha8DaahJnfrLJ1uNdbPRZJB6oCSgORF3X1Vi0f+Eq4BhgMGNLy?=
 =?us-ascii?Q?Haaw7hhRFdCM1kmTOhYiIRM+lM0Gmxbbqmd4T0Il+nOK4WVn7bQNpghdvHEp?=
 =?us-ascii?Q?SvDRU/uGrewEn3Ovb07Jv62PPu6xVYT6RtHeMzyS41O9rIiBT7NDZ6hKmauq?=
 =?us-ascii?Q?fW0+HV6HsBx1REFU6w3agei4eGJM0l9QrQZlmRlVMcDVo8flPGas1DNzZKQl?=
 =?us-ascii?Q?8O0M+1HMl9Ij4epM2Mvl5LRPSRtHocKyLy466od2/v5nVG1S26IwK2jSwo9J?=
 =?us-ascii?Q?DTcke+DBz+aHyZLyj8iGA580YpeRxDs/v6CBSn3VEXyWpGm2iWTzHGP5dnKZ?=
 =?us-ascii?Q?SfOiP7tv2KVFuBll+X2ZhioIaK5gbpIKOLN//d7v4+8Oy9MMBsbBWGnrNVOP?=
 =?us-ascii?Q?qFcwyVAmrpaVh5a4XxRQuNd9JvX+c+LLSuhs8/oHzp0q0rWJdFn4PZ5HX3Mp?=
 =?us-ascii?Q?3RYuPC4INogIZJDUG0I0mqFjbuufCILFG2KE/41XkfC9vWsJo5XsbfIY2ORR?=
 =?us-ascii?Q?IO4SuafkYbE9ZGGNOfR0rU5vMmkZ62sABd2GTHy4ZHFZ/LrIinp9+A3x7CzE?=
 =?us-ascii?Q?4DfDgwnFVDfkdIaPagwLH17cuZ3g3yDOXig3OuEzld4BmwHBRqpdTwsBe4UH?=
 =?us-ascii?Q?K1WzQga0D0pAmHtycw0soCeKpeCqrC4+gsI+KWX/TCEOEQF82NGe6VHfFma5?=
 =?us-ascii?Q?e5I4uOsiSanfbo/GYqiQ8zcWA+S6EtQ2EprQT+22iPTJYMQEHy5tw9yqOvD4?=
 =?us-ascii?Q?pPTwDas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lCM1gyqbrh9BJ7y9EZQSFHKCaHK26ZObIxVpAHQjgG8ulg69Z8LUIi2OJ6ld?=
 =?us-ascii?Q?FVcNs3aozWRLt2Oydd/ZIo3W+tGgRcmtfZVWuYkKK7VNZIzP1teyIVp/SZ3E?=
 =?us-ascii?Q?G2Q0o7Dn87eJqwio2iTtX5VJwk3kF0sHnUB77AzekltACd/CZF7WvwMUVGQG?=
 =?us-ascii?Q?6qq+X2mF7ISw5mjRPsC7ppxIPcbz9jWfWjVwmqb/gXIGhfO21g6XLMbn8mav?=
 =?us-ascii?Q?rf4R1ZKACRUzJX+3Z2+qybavqTCdEeAnjHPgLL6GGNdx1CKMA5tzQ/zYMBsq?=
 =?us-ascii?Q?fvA11ZyDmDm2qedtXT4CHq4WtAJhTNpD8bzydRI6VN8K7cWgvTmmxNFuVS0a?=
 =?us-ascii?Q?t6t9vb8T+k/m6v97jUONgt6Htn79mZFtGe5FyI0AY9YSjpqIXdsxYXNVHWQ/?=
 =?us-ascii?Q?hdo9l0WGucTBdNh2ZVAESUxosWRpN56BM1xDYZ0YrbM6egEqo+M7R2QRE/PN?=
 =?us-ascii?Q?322IYz48t0NyADqWGoRU91oQGQxmFZyg/2RSnayyTwNHNNeP+78pMWUskB6s?=
 =?us-ascii?Q?ENbo95oMM0AClqcMRkRgVBg23pzSOAW2HdguI9GHUiqr/wbQl0n9w8LCX64X?=
 =?us-ascii?Q?48PWNcSjtms0Ny3e4nnzfLQbrdV+gcCS5vMW0XtHWRQioE/lHEGoc+KWTLti?=
 =?us-ascii?Q?yyMhyEc+S8JILfQrvJsfO8z1tZ+NQTlfEtY3wcjKl3YG+9IUUOWmK8zUc0jY?=
 =?us-ascii?Q?GjXGWvJzyP3hc5us83ZY6v93XL4tFH9f2/4KdTI486aiybi8RC3d1KPUslci?=
 =?us-ascii?Q?ExhtKCY28/xoPyVBVFdR17cYsbajZEuJhpJZUGTYOI2cRIK541CWbuzwN53t?=
 =?us-ascii?Q?0fSMfZMVYPTq1v7VyC8RMj+GTthN0zv93JQwaTuUuvsTJSgSpfViGLGisVxX?=
 =?us-ascii?Q?iSBt+anb08WJuCQHgQ8vLXV8niqYVdaYgYfrAJhF42+RtfKZNL3gwyyEyOLS?=
 =?us-ascii?Q?42kxkt5U6h/FCRa7b9lbR4HM7tc0OGhenpT1FWFXFfRcvTcfTfBEk44OY6qm?=
 =?us-ascii?Q?D6TVINRXAfHBeyJx2GkUguc/W8sAHVaWWewWwabc9kGRMyBXk31QEtZKtT3r?=
 =?us-ascii?Q?uqNOK8mFbG+mNGMY7cAfCrjqeBBjJDsEjh+eBLOK8u+c8yIP4klck24b4ByT?=
 =?us-ascii?Q?DdCIWIKQy+O22H2KEDSzFxrRWIdSql6BPLSoIvTGa33yk5SqfqABgAEEkUGZ?=
 =?us-ascii?Q?NwdhN71I7RJ9OP9D0lKgP4Cc0qMXa3V8ruumUj6yC0XfdrEOsC9D/j31TVq2?=
 =?us-ascii?Q?e7JWcKB91954PbtcxBOOa52LKo1g1+NUv0udAKKN/m8958UZhxZfFxQrGIU2?=
 =?us-ascii?Q?fxCDWTlgwV7FYfpaOBtmWwLtBAHEGqSZcGlS0+mPWrxlLLuubizzojr2iL3b?=
 =?us-ascii?Q?iZDfOYZ4R0wpqGzatsrCP2uHwxwOP+6G7Ld7Od+ji+Orc9GxQxawRZwiiAO2?=
 =?us-ascii?Q?e7Coqaf4xGy6T6Ls2ajq9NbHefNOi9TYcXOFN2Pn20AujiS91nYSKhuzVR1P?=
 =?us-ascii?Q?p94yLSu6d4ugPxalxyHl+X4Ni2lLP5vS19QTWP7Xp988kmgHyNqNfCS1uZ36?=
 =?us-ascii?Q?iXH33Tuk/qUYubbjvNAIxBRRopuU8ir4kRpg20aC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa59bd7-709e-441a-3396-08dcb94f655c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 15:16:23.6553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSMLq3d2dPJo7DNoiwQ9c1meDl5Ey19YN3P2JN/eLDCkIg4ONDTLxWJp7xDXVLi2iNXfVlrf/PtomU7XVqqTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 7ac7a6e2dac16d26212911a91515a49a08a10371 [32/78] ODROID-HC4: arm64/dts: add 'meson64_odroidhc4.dts' for compability
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240810/202408101640.09Yjlgxw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101640.09Yjlgxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408101640.09Yjlgxw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: pwm-fan: 'pulses-per-revolutions' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

