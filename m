Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE55469D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731842; cv=fail; b=NSj10NNCkGvmivG+vtdjyGPIAWReCaqh3pTQkFli9UNwJuKnzU75yoDyapwXGKCnyh4vEjom5a40XgG5kyUwj9q3uxWLR2p4IrPLkG434Nq1mtvHVwfznTbnTIFatiNNnwvGZfsseJOExuGmjKJIeTPFbOYUmZbd9/za9zogcEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731842; c=relaxed/simple;
	bh=2HWniOI8RKKB1KIcWn9uVNrWNufFW64xeVPF5LX4z+c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fldiVXA5Fr7F/YSewMIcI8YiqESlUFBWfk0c7uGiv0bYTigLCeNwF5ioguDXonxgBad7YfUSyPvW+9sRiY5CT5GYtttyBYFYe0dB2YmNO6XLqrA8wxTZAKDOeuwwt1GxAETHh0bgMw6JPLRxzNlrfMVmGqIBbgSu2WYYGlHpb+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dz3vIAP1; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dz3vIAP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730731841; x=1762267841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HWniOI8RKKB1KIcWn9uVNrWNufFW64xeVPF5LX4z+c=;
  b=Dz3vIAP1vpWguMCAUwuSyL9yUpzxa3o+oM7bfDpr87iunNoRsxByzwQl
   f3lChW20+piA+NWBAnupPNZyoUkVI2KzQE/kajgwaCgM5yj1JZnRlLTjN
   ElgjqFZ9x75KowP3o9zKTCbQG1bMyfVlA8XpZGyd4zTBR5RNB8CdN2BjC
   TxHigW6f9vpCunZCKGaexsunpDnJ5okpEYCVZsUSIm+ICnZ61s/W8hDCR
   BlRFLNcJWWmtGWQHvReyhmEHMX+dvRdvVaIRHAuagQRxrG1zJks4Fp+r/
   ovcgplUKsREHxajv4Il0sWbT7fh08Pd2as0eErmNKZUrDp98HHSk96Cb1
   w==;
X-CSE-ConnectionGUID: VLB6mtmyQXC0RjJbizHjvg==
X-CSE-MsgGUID: rBFbi1vlTYit9U/2VF9noQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30611423"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30611423"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:50:40 -0800
X-CSE-ConnectionGUID: UHKQ2K2eT7ObC4hw1S5XyA==
X-CSE-MsgGUID: OOHIdKZiRACJFKQQvQSWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="88818771"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 06:50:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:50:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:50:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:50:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7Ww/zHGH4z4qt2wwxDmSqfqhA/Uw6sy7luPf6pKEV6TDJU4+iOstP0S3PKq5hubM9wG8c6FchOYuEEWN/hDKrwIxJ3VPWkvhJEqRCrhReYy2UlVLQ2hezI6bTlGbB0QvSP8ISQlnRxVsrGBULeh0jlBveiTh/ZIf/mAwzrLDP1yJCj4AnxAJo8tIFqqIXxJUw0bEUHHmvc3DttIlC5jfYpUSRwbL85oHN6WVVGZdK8DShRiogiVatdQU4qa3nFMj0Rtg090HlCHyxlYHhKknJ6LwKn86dyg4BoQ9knwS0woWglSj2lMIZzQT4JA5faCXAXOfym2QhJWHhtUxU7fgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QiZWMpScZjJlpyNwbgdCzZoMk19lbPST1ihFC8pBbo=;
 b=jVv14h3BDPU/6DUqyAhcVRT+cWRe3bJhqLlxNjMPFb6RPTshdnclKjiF8DwcIPRYwFhUE2IHNN2loloOq9oNCrMMb+hXR3ft8C6x6tw6sYTYuGT3BTN+R1JxN1OhtMm/+//sHaan+hktNqxdG++vmQ8lT3SLIURrjQyk8ufemRNS9zAXp9E6LcPpHR+EdQkX++CgJDzehqiqsK/+xQvlsBaijwTlJfE7k4mKeVzlteNy7bg0LmysTe3mIAfTT2+jMLN+5bV+uTRRALYw+aD18WJZ79eUQTXBZJ52I9GJQNn9fTVGmnrAvfy9+sCGGFD9O2IVOWxi/jo91Dg2ekycyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 14:50:36 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:50:35 +0000
Date: Mon, 4 Nov 2024 22:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, lishuo <lishuo@phytium.com.cn>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-6.6 1360/1360]
 Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong
 indentation: expected 2 but found 7 (indentation)
Message-ID: <ZyjfMxsNcT3SK2b+@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 336d27c5-0ded-43d3-6f99-08dcfce00a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3rdPiO4ERozfP48EFJSgtLeoqiAoOU5FasVT6hC1mI7ABs7ts7ZmLzXpQDTb?=
 =?us-ascii?Q?tguU5cA5ab9GaAYPHwFCtMlAeaFzpEk5vGyAwq3uWj0Pc+MLhKqAeAyVaTji?=
 =?us-ascii?Q?RYlz23Hs/A6BhM+6mHggkpQMEOoI0krlchjGjoaCuN0fZ/8vGbEeTdi2yyzv?=
 =?us-ascii?Q?Zv40aAJhYivGOMcv2cUNqdzSB04VvdJC5bKUo7l3bT7mniabKv1Vwe4kwzBQ?=
 =?us-ascii?Q?ZmOhK+pFu+BngqgXqeSnm4sZc+E+tfLhD9cyaUKSHY3zeOSrc5+j42SRkKc3?=
 =?us-ascii?Q?7xUXZsBRlcbXKY5MtWfbUQArTqS+bUNVEQxicARmWz3N01vAyT2d4GofIfKT?=
 =?us-ascii?Q?NjqAcDfcAMFQuBOE9qbFp5pjcVqFTI8gWzrO3il4qk3+ui7XzRsaxHIEbcHo?=
 =?us-ascii?Q?Sa1LnD1md+zymzgd4aSKeMOv/vMd9IfVWdearzQfbQXRtHkw8b/e0YmJ41oc?=
 =?us-ascii?Q?+F4+C21rhBB7WH/D8LnZxoG0X6e7fw/S6kr9/Ol/920WlrqO7avqphmW51FR?=
 =?us-ascii?Q?HIs0OCSH2ZF31yI8Tpkxn3pRH46Dr5p1c4p69eD9u4g48/zbHMPq9WJ8NyBM?=
 =?us-ascii?Q?O8NCnAFnSf3qAbGFvyvL77Bc8wNoQiLHOegLxEnNFGM2b1D/B7ffFFjkwrn4?=
 =?us-ascii?Q?0t0NuG+0UPPvZpnDxwPaxSmOdlvFUBoT5Bz3qRUG5oo5J//pMKXyy3LscSS0?=
 =?us-ascii?Q?iqVMRquWsJIQh6XZl6f270VDfvBWbxbXKaojNChhOUwhAgYiyxLDiOyxpzpU?=
 =?us-ascii?Q?ARc6EgZCUjfFU2eBf2xZeCfmjQgXzW7Xr4C0p8wQXxF/p2kmPvNt4EX1Rk+l?=
 =?us-ascii?Q?UopvzAHue/6aha+KrZt+RKmm3YLqzD7HvSpU/FkB+gfdb26DNVwvL5tbkJ5P?=
 =?us-ascii?Q?zQ75PGs4i1J1UWfhJESGEbMNQu8KlwGAvg+C0hiTHJU+iFwafmS1TQj8ah9u?=
 =?us-ascii?Q?219CeLY6+Clek/kMZiWzuEtvxM1ga19QNGRM3sty9EWXStlZZpkDz9QAOJv/?=
 =?us-ascii?Q?fezlStW8UdB5FheAjo6vv9Bo3afeZw0e7WZUmGkTxliFH/d+l0KN7iPUl9hP?=
 =?us-ascii?Q?gsEb9OvQK658RjmvtXLTcO8bp5crB9LJ2enYS4Vu0Ty87AgcCmzVmT/onVoX?=
 =?us-ascii?Q?EuyYhY5bRZTUtydPco75sEqvwfCR1aaLedMC+ItN961lcqbeU3jIeOqi6QnX?=
 =?us-ascii?Q?b0rd0HvHQTHTHS1BhmFotsjT2foxLU7E0dpT2P2NGPDUT+FRHuQcmWakPh/F?=
 =?us-ascii?Q?UjSr33Jb0u4lX0f2wiajIioOcJ4vjvLa1eRb5nlndg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgRdvXaXkkPi7u9f1nIkNkmTWdzVF0Bn8+9cGgURcoY2fCrAlvFpK0cfBJdx?=
 =?us-ascii?Q?lYXHIBrVAyuqJMkVWQj82d6PeZtnwN8HxmtW057FVNmXJuJ7BlY8orP0qa0n?=
 =?us-ascii?Q?fKOGWH2QtQ01LT11peqbOTXDFyDJLiJ5cgeRNrln8u+TR7dsyxgWGxxlOzZC?=
 =?us-ascii?Q?LwQQZwCLrjO+ctU7ZdpSUBKC5qE+fPskiF0iIWUyrKUQ9SVTYtXU2WehBgZg?=
 =?us-ascii?Q?EL9L+PMB/13msoejVYeCAkM5ZQ45kWZvQijJLDdWYM+0bD3YxS2PksiPXtWn?=
 =?us-ascii?Q?7es6ixpd9uaWdC4di4e+soP3C8NlEOFFH3ZWa/Ci3VHkqUGmPlitMBcTDJHg?=
 =?us-ascii?Q?3rwQkDw5HV6PdBF4IaxZv3yaOMhMd9nBxZw4Id+ATCVLrHmrk9u5VeIvr3wF?=
 =?us-ascii?Q?4il9EFEu1c60qmh61e5TaU7eytrws47Mn5WC+Gcd85nLlCLTPNlomKVQ71n3?=
 =?us-ascii?Q?eFrxL4g/NCTGmcLOzLQac6lc354gLCDG1zlRDfL+I4cahqfsSK7ZvizWBRka?=
 =?us-ascii?Q?GKNvleUVIQVHpxAdRhimJcydBgdsdOe+eBjLY1iSSXetWuPJ3xx2ZLywdW9r?=
 =?us-ascii?Q?CatDF/l292eIZPXWKXBDtWG8Zy9CUuyKHyEdOijeg5B81zEdEb0JkJ6w/j9d?=
 =?us-ascii?Q?6Uv+MkOGXLG3lqy1ZP/DfbrcpIOjmP3DtkAIJKEcPK6MSXPNRubEYDPFpjm4?=
 =?us-ascii?Q?QvSy//EBcZX8g7HgYJH8GlRfIYOGMHj6AWImXZbWdjkd7TGHYa6a0rl7OdCv?=
 =?us-ascii?Q?Yndjg5cY+7DkSjH9qEBwKXUV2El9BoxzKVOFppkcXiGP/sMZtygkipiJVX5q?=
 =?us-ascii?Q?uC1At8cIvfKUkKSSjSUS5EFPw7kVOeUhT6n9i/eQoZecQhFS+tDFlP3wnR9F?=
 =?us-ascii?Q?waO+KBQ0E7LgQcmV0249l0ITgfuFUEaZsQjKIHgyc9Bs88Q9w+bqOgeOs3EZ?=
 =?us-ascii?Q?1fQJL3R8o4qXS+DFxvp9jJggH5tAIFOssonKVHvzt7HpGH6v55K9A3WuDBk7?=
 =?us-ascii?Q?hs8MktevauWjw3WaxmTwTDJ2KgF4bCZ0/gA/rNwmW7cWUvu41SENL1maUZNE?=
 =?us-ascii?Q?Opwd64l5yYgvU17hjvYKcVrx8yUw+80yf+3uR1O/8QPxupPQY5txdgFkpEn0?=
 =?us-ascii?Q?fBLaL6kz9PkMwoRKsdsDA/OePzOkLaoJ9NoJqZLdm2oyBGAxPHtsrenYO1hw?=
 =?us-ascii?Q?0Kn5oAdLOAOlP/rJXRVQPW2lBbMNWSdqT3O/E0Bka8boYq8+UjTMZA2+gksQ?=
 =?us-ascii?Q?QgDrjgV1razR2aFYA3a+YnDvQY2KP7DzT1Kcd31jxLCz07xqQmHV9Tn7tEVf?=
 =?us-ascii?Q?dNTvzq4dU+li0Dt/odm+6VJ/PK2CDkLmrCPBtDgXGWdyxJ8QoTMHtO3qlqqz?=
 =?us-ascii?Q?oWv2Jy1M3TfiIP05hH2ojNsXKCo87SFT/TxtjxYXz7cdefivQdGH8zR30Ct7?=
 =?us-ascii?Q?S0yJXGqOBg3VaJZMX1WVy62Fh4kj2mez1LzXQ/L+6ULO/mvaPsM8a7rQDe/s?=
 =?us-ascii?Q?f8h2f7jo4GZIjPlMbM+3St0brumCWJjekwq1VlfvruXten+4vi5Etw6trzh2?=
 =?us-ascii?Q?LQnPaI4sAvcQy3Er5t6+EFGCLa5Sml193DNEjSvO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 336d27c5-0ded-43d3-6f99-08dcfce00a32
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:50:35.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15z7cAIdAqtNRv6m+g+vMJhNebQZ7zhmrq9I585fQplhBb/346DuY/T73nvk4ymGjh+fyd3T6ozEupa3BSFcog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4d3056ab32e02139d7656adf048416e877e283b0
commit: ab9ff1e38569313e41ba5a036591f93cb55e5d87 [1360/1360] DRM: Phytium display DRM doc
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-052-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041414.IJjJzikx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041414.IJjJzikx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411041414.IJjJzikx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong indentation: expected 2 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks:items: 'anyOf' conditional failed, one must be fixed:
   ['description:Display controller reference clock source'] is not of type 'object', 'boolean'
   'description:Display controller reference clock source' is not of type 'object', 'boolean'
   from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
   [{'description': 'Offset and length of the memory mapped registers'}] is too short
   False schema does not allow 1
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
   ['description:Display controller reference clock source'] is too short
   False schema does not allow 1
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: 'Example' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
   'maxItems' is a required property
   hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   'minItems' is not one of ['maxItems', 'description', 'deprecated']
   hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   'items' is not one of ['maxItems', 'description', 'deprecated']
   hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
   'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
   ['description:Display controller reference clock source'] is valid under each of {'type': 'array', 'maxItems': 1, 'items': {'allOf': [{'$ref': '#/array'}], 'required': ['items']}}, {'type': 'array', 'items': {'$ref': '#/single'}}
   hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
   hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
   from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
   'minItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
   'items' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'allOf', 'anyOf', 'oneOf', '$ref']
   'type' is a required property
   hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
   from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/dc/snps,dc.yaml
   file: Documentation/devicetree/bindings/gpu/phytium,dc.yaml
   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml: ^(DCDC_REG[1-4]|LDO_REG[1-8]|SWITCH_REG[1-2])$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: ignoring, error in schema: properties: clocks: items
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Warning: Duplicate compatible "maxim,max6625" found in schemas matching "$id":

vim +40 Documentation/devicetree/bindings/gpu/phytium,dc.yaml

ab9ff1e3856931 lishuo 2024-01-19  33  
ab9ff1e3856931 lishuo 2024-01-19  34  required:
ab9ff1e3856931 lishuo 2024-01-19  35    - compatible
ab9ff1e3856931 lishuo 2024-01-19  36    - reg
ab9ff1e3856931 lishuo 2024-01-19  37    - interrupts
ab9ff1e3856931 lishuo 2024-01-19  38  
ab9ff1e3856931 lishuo 2024-01-19  39  Example:
ab9ff1e3856931 lishuo 2024-01-19 @40         /memreserve/ 0xf4000000 0x4000000; // (optional)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

