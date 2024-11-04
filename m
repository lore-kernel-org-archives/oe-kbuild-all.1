Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4B1388
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730678790; cv=fail; b=kvc0Q9DykLwEJwazQVYT0YJOVtT76olkCvSWrUurexWJv/eznTyiF4BYgJbLV3amHSGgWskSvwLc2D75ao18tQOzSJexdoT/PAY3ASZ9F3ROU0a4pywxiWDuHTQfMVNEOwqXhHgiyKXsLvX45DU0PtKS9vQaZYRToHP8iIiq+0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730678790; c=relaxed/simple;
	bh=RT0K8J53Lu1rm6uQ+khoiQ83AD+33UUl2JdSDKuYTso=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=R5QnHcJ+nTStmp7tleEagznJ+gVW96M9gxWxxi8hPoxzvdaBBpXkMVkDKB4vGbF40xfApEuJFelOlieYj05O5ZFiy7jm1GfDQAn+rOZ/kxuNITmT1QDfUSbV4mZSgD6zVVycORbZQKGjfQ5z3Ovn6V4bEv9dZYYJSORpmR9vxC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCiT1+Yv; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCiT1+Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730678788; x=1762214788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RT0K8J53Lu1rm6uQ+khoiQ83AD+33UUl2JdSDKuYTso=;
  b=XCiT1+YvKWFSIfkQqYI3H1NZpmC/sMDZfBBDZ8Xa2Rb3m6qbdi3DWc8l
   n0nWLnLDw3i9LRaPy/usutJStsbrg9XTG2EHxhYnswKV5RTFTHnv1/OGQ
   GpEGBbjqeMk4y05PSH+JvV/EY+5utQedXBbzD2rKknFbOpvZFMe8dQ2bm
   S6Xl5QgSEmV7HqcPbESpmrFxm7GK9B5v5H7LRF3xvq7mE0nYDMUETxKhg
   B/NjLdGYZ65W/iiXgggLTyI6R4p4WIjLnGs40Jna5+/W/UN0cMBLZLgFr
   btAQfTR7IBEBSN/JoUk8A24uNm28i+cvdl5q9Yn2lTlwA+37F3WF0s1qJ
   g==;
X-CSE-ConnectionGUID: 8zZB0qInTdWnhhnD7g+wlQ==
X-CSE-MsgGUID: Z3N5hWwQQdWsOIzUlgIkoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="40997137"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="40997137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 16:06:26 -0800
X-CSE-ConnectionGUID: e9tfRa4qTQCgWn2YVeaC4Q==
X-CSE-MsgGUID: Eh0p8rXlS4i+0oyuOV0gFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83937330"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Nov 2024 16:06:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Nov 2024 16:06:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 3 Nov 2024 16:06:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 16:06:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b86xiSPWKDln4Km8jks63xEazU/YIse8QEJuzoMdS0R1ea/mVnsKFvxDTGB29X0/fWmreASraRBsm+2tF3MCE3C8YX2e0N93xKbaMG5FmKIiR/zmCXnabG79u5AAWO+7i089/Zav1iWsLVLzgO0AwSMXThmejb304X8MJUsoDsRZaweUJEnSMfGrUsPKfEbQX3BUy40Rw+JCsO+/B7t/lh3lhNmxzja2VhwYE4umJpYi5K7lxqFnHpyEFIGeWH1zaYpJAnaQGMP3IB2QS9j57gdjEzk3L508h+7/QCDSIm/nVolYcuHwkobsU3mENy16uJWYGtbGoZt8GY3DmAivWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuprpJHMx2wNKrpc3x8Ga71eqodsBd/NNd4XGOSXhR0=;
 b=RdF9g7DC10AftOlMvnf19zTJwfCJr1jY5C2/AIkk03fxfZekbIpurF3Z3MzNWIFYYaTrreQ/tCWCQYsf2/Ck9l+5iWoyt4LzgylpVzGIffSp/1eNyi/unT5LM0cz9mvUuM7pMJl+D7A7Mq1kZRhccCH9QjSyA6HThr8hIJmwZbgD9JWNSN1JCxrro6zCrVz0lAH2AeXds9/a6uQk/5PdtdM9p/pKcT8iiyCDXSgYsODvSEpjvWRa2avMEzIn2IMhJoKb3fp95Hq7KGGlYMxWW5rxXO/w0p+DY7sQuBpn8ooj70lOZQ9H6hnB7Vle2jNY5Sb3ja6s6ECy0svKqGnKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6690.namprd11.prod.outlook.com (2603:10b6:303:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 00:06:16 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 00:06:16 +0000
Date: Mon, 4 Nov 2024 08:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb:
 /soc/thermal@1100b000: failed to match any schema with compatible:
 ['mediatek,mt8183-thermal']
Message-ID: <ZygP78A3jS618JpT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e21e107-cc3b-4123-6e26-08dcfc648047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f2CyUuZJ3WBRMcEG5gKUph6WrbsLlLvEo4sxhhJ0zHSPAsliANYU2vTVomUY?=
 =?us-ascii?Q?XgMKqjL9jgV2jBYz84UhJhDluOFDPqBFJvZ+ZSeeR2Mcl1ywvMOb0QnixOhm?=
 =?us-ascii?Q?nQI6eRZ4W5GmRtXjv5qmJ3pwOOTQcLkrsXIYe+aimVB86660T+9z02IiUL8T?=
 =?us-ascii?Q?X4XSHONNUVBKCeZWKNLtMd7hW4zgd6CQGFqJ6aw9w9BCUybiC08KV4laev6B?=
 =?us-ascii?Q?kuEG7S9sz5aJD+uRlukY7+yNXJ04QjpBM82TewQJUgw2H3eiRwKXuzzuvTfK?=
 =?us-ascii?Q?kdbIEjo1nzFAKAvNVGyb1EBEnpRFMjb1CX+w9jP5WntfvzFQ2ttyq/N1muXl?=
 =?us-ascii?Q?bcXTtVDn1EzhYDTNCi8a9BlNEHsUIO25Wp7tg2zwsZrv9lUjlM8oOpiUa1p4?=
 =?us-ascii?Q?AdpUIpl7OF7No2e+q7+BAxxcoUxEOYzM9CUvSau5ISneGmR+l8ZVio25dNm6?=
 =?us-ascii?Q?hZv34hSx09bqpdVKZ7mL+xgejV78dxI/5CQUMxs/AjyRcIBju7aWTdknpdeW?=
 =?us-ascii?Q?cyQas71E/C8HesF3SMaIQlue5ykmDMDuipEAOaowj18/UY/SDPmMLkQc3AJ7?=
 =?us-ascii?Q?aP9W5teDDa+DV80Na5ZswmP1VIOSqi1C+PwaF9z+ySX5wiiGhHnVeub3BW7A?=
 =?us-ascii?Q?6AKPPC7OCfZBKiQZykCQVuGZMCb/jXZS5udNcvbNeUabgCYx0iUOr6ci264e?=
 =?us-ascii?Q?5x4wG2cz+JN4gc/yNm2zOc/nVyKfqimX/azmklPSEwrKdcPw/b56QivfUsQr?=
 =?us-ascii?Q?TxFpnCFTFZ7jyhH2joZ+3gfa+HAoy36NCl7wvQuTQAvZsD/wIIlxCUhI3yrC?=
 =?us-ascii?Q?HSB60Wf5DOQh77ub4i84ELgFfLlhToJf7tmjIVzERxRHVRePCJOD9yrEWTL4?=
 =?us-ascii?Q?zE2KP9SH6RhPxs51Hug6byl2vYLIX3dA7cb+IVeBCd+rWlv5UQ1qXkMbH1XQ?=
 =?us-ascii?Q?99K5dQ/HH7t/4ih6CG6Z+g6AU1GSfGMAle1Wv2KeIgZhma8RylaYeHwK5UM1?=
 =?us-ascii?Q?BDYu7gpM+B3sNwr+z95xnauldq+BjsabnCNofOZA8cMD8ijbgPYGPv5cEzju?=
 =?us-ascii?Q?u4ahbKz9tNj5iCEYeAefxJENOeSOcOv2SjsmN7s2oSDXLK2gRYy9jqljKWpI?=
 =?us-ascii?Q?Rmla0bk3+3Z6J2aVC+YM8rqtXHEKsXIr5PzfraL1U2A1I7MrGcIWE2tmKj4y?=
 =?us-ascii?Q?MZ5l0oGTnZn2MTsWCMh11OLPh3lvXOm+BGLhvTdkH5PeIkwYAHf2alfK6jJK?=
 =?us-ascii?Q?XNcrYJ3n0QZiyvt+M2/sG6qgqoKkPqj3OJFVQYuNBUW8yrjzkbqy5g4CPbRj?=
 =?us-ascii?Q?CLTQCYs9NJDqR6kPv3XNL0hQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHX9l3Nrn57i7f0AySrCI5gbtz9YbvpI4XB/ayNwTbP2kWHkZuGncgIuvq+V?=
 =?us-ascii?Q?4ggXr3FrdO254tWSwuiQgPdyLQTr3g83YaVHN3RO+WeV+QFFWmg0J0uM+e1k?=
 =?us-ascii?Q?ekuJF9YVEVJKxeWVDo2C2o+f2sVj8dVSNaSKRznaA37LoV6XgcuZvf+2QowZ?=
 =?us-ascii?Q?bbe4JALe/OFJty+eggUfSGZyrGh2vBfFINcOQ9UD6p+0SVH1BQoYQVwfMzis?=
 =?us-ascii?Q?BQ6hWl8y9ppPDYR0ES4zNet6gWfMi1GVUTIcpiCq5mSHl+NbY/LgaWgHF665?=
 =?us-ascii?Q?0lo7tmoRzgnWsjUox4jl/nrHVSeCvmrtRCbLJIUX9pbXfSe9KXbOQdkPsFp6?=
 =?us-ascii?Q?+v8n8Hj7+b/gdN8G/V3L6RVaOjtfP68cKc5MzRorXn0VrUDfOc+y+FwWj4rB?=
 =?us-ascii?Q?MpsbtdCjoSweV3gXmSihBVtolW2Ix7dtRRDK5Dl/pLunwMyW2rBm/VuNtbiF?=
 =?us-ascii?Q?/jsRfH0GhOLY/vJ6/D9pFr+weSrPTCXVdtFUr2DYcDOrTtVkhciAgSm0pfm0?=
 =?us-ascii?Q?gZCOaGCb+KHuhKycfTX9lyGz1BsYP7tiuFmABPrdGz4a1CckS8N1RO+9OwOd?=
 =?us-ascii?Q?sKvTMrVr82RqoHDK2O798npnzZsoWuiHcgnVYFV/qs6roHwFiU9XdTtNEzFm?=
 =?us-ascii?Q?GFSE9i16qLtqsxNLC8/aPV6Hw8qvpe8J/FiCYovusmt9UdH22HUBkExqrM/Y?=
 =?us-ascii?Q?svVFL4mLRNwqBLhyI6kRmHLLrJQ6FEB/1RCcpCj3YTs4e1opFmATJugNQ841?=
 =?us-ascii?Q?Q6gnoFQaGxXXd4roSDss6zB5hB++jZX3odqKtPGn1UmRGRnfO/gzb5uSV6Dl?=
 =?us-ascii?Q?Wm9fR8mu+5LP1h5O5ACGccxlCDoB/fpww5H/j/fVwMoZrt0s7toFmnLFurt7?=
 =?us-ascii?Q?6zCUYbq3m/rJ0Ro2+rQy0WyXc4afOQ4NkZt8DkxIrxRO3UHBuVTWO2R0JKG1?=
 =?us-ascii?Q?FYqRWWqPP9Z2tK+UL9x2z9JNFoeOjFErxoq93Xw+R/NhZWr0eBG19LfQKspb?=
 =?us-ascii?Q?UnxrsjeNP0+zWUhz1mvst0Bt+AU/9Wj9mZkQ15HAIVBIictai/qWhlegJA5p?=
 =?us-ascii?Q?p9t16mR7PMqRmY/YbfHjyLoTb3NFiIWl9RhNiR1mZS2anByTYVleFSVqZGFq?=
 =?us-ascii?Q?w1ZeucLsUuXmqAqtOiZNB6S3KinOdw7H40WM8j2gB/U7BLFu0g/C4vNAl8S2?=
 =?us-ascii?Q?DCHuSZZTfi+6UltsWKCkIFeZ8kv+sgQnFTY6gb2F4wYcxT8UHOxGrsQ/jJkj?=
 =?us-ascii?Q?SI1slYCbs1n83RiO+wg4gBknjlAyUu+odaKtRkqCJVWdCu7Qu89gXQpLDe/c?=
 =?us-ascii?Q?KPZJAwbCOudYfb8W3qGLFDsVSsiNz+gP5DKGqWBrJKcuUuEKvjLs7yntq2GU?=
 =?us-ascii?Q?GpGOkxK4T69Sg1MxBWUYBB/jI+39R8uwojYuW0Xqi7YSw7ZJcCCMsWjFFxlw?=
 =?us-ascii?Q?JsJu2KVD+xbKwBkz1Zd+Fs2FRx8XvA90wyT+bEY10YjksknPg3XTXitKs8nN?=
 =?us-ascii?Q?i70WzFWjotU5b65hP3JcF72caEauWxWEBzO0UWMsxGedSenuDY50k0GRHsHh?=
 =?us-ascii?Q?iZp4/SD3yjSdmbmj8sqVYoKe5hIJzrZOxndcZRnh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e21e107-cc3b-4123-6e26-08dcfc648047
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 00:06:16.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0JrrKAu2b0QEE9TwUrYVVtxPd7+R1oeu0+4AuaLwdQB3cGFsPIrRjq3YmPt6/D3PywrbLlnWza1Tkr6+5Fh6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6690
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: 389212047fde26378a31cd8a71f248c008d98d8d [1/1] CHROMIUM: arm64: dts: mt8183: Add Kukui-Jacuzzi-Makomo board
:::::: branch date: 3 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241104/202411040127.wCsiqbKG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040127.wCsiqbKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411040127.wCsiqbKG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

