Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB817A583
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723558987; cv=fail; b=TtPQ8xtUiwJsQzWqYA2wPdP/L1i8IJblGSOUrbhbYyp88Zz6QLAmXnzil7TU7fdJecy+5ucgIzBnJFZLUGB442yj/gHeaYCQeexVG9yIygMbGqKW0v3FTecIDzxnuDJEjORLTqhphtrPbKnwePR2goKtOj4M1gN67AsQE1ZGAo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723558987; c=relaxed/simple;
	bh=7atuX2W5R7nQoGi7WOsrx0FHVOf5JPKsg16bBkMCpss=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MBIKJf0d3HtYp0SI0Gu/HZsEM3CALjxMkgg8c5P5u7fXjD7H0jnsO4gU3JA8BBL5JHKD6pWdHnNeUxlIZoWomY8ssK5N+eOSBXdZ45r1q6ChfqWY/SMyMiW7gOODbECkepKX4oA34oNDrPskw1fmgMjN8jpj2CxxS5nmrLzbaDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvTclUZe; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvTclUZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723558986; x=1755094986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7atuX2W5R7nQoGi7WOsrx0FHVOf5JPKsg16bBkMCpss=;
  b=QvTclUZeFsLOHJQD5zYbAqz6GUtFY80+WGsZbkwvFzUKsaXtCAxjB2G2
   idTwASdWCcyhWa7n1oPeonp6kJZrSE9rnzuS5CRE0977GOc49oN7MSOCa
   Wt7++hXqRWisT5cNLC4fowT5JGFyRMhBGg2eQrM0KLILMPHi8TxVWL0J5
   ZEMs+fu6acUQJgxIY3INJRdEYueAi90n1xMzeE/RdjqukA64aZWWpB98V
   Jj2O/tLuQ6ENSFa4lDrHokasVKcrsAknERiwgfFjiZe/GL92YBREveSGs
   cANEn46IqcfFdgyaFshQDBaXb89KHOA/KZGAluwuBnxtx131inWmHiZSl
   A==;
X-CSE-ConnectionGUID: nEVzuBPDQ/mA+dlcScTEVw==
X-CSE-MsgGUID: CMxoZetwRTOIMTzuBptwxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21283126"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="21283126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 07:23:05 -0700
X-CSE-ConnectionGUID: 5b0eh8WWRY2R8xpOMFi6Cg==
X-CSE-MsgGUID: rTD9ocSuS22emnVB8ZiSqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="63530522"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Aug 2024 07:23:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 07:23:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 07:23:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 07:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAlZ8Gq+L7MckI3zAzW8C7Ou+PHN/dFvUiER8Sy5d9ErQ/58klVtC/eH864ZHqNBvfz/YLGqPPTXaUiT7nKaWxorpBZQVpmsdrRDpyAamgg+H+xEijZ6OdFYJlE8sa++SCeeGHZSxhDcxxE6ADi80QB7j6UfqsBw947UYYXQ+h3nMil+dFu0qgS9Az31PoAN8UWcJgm/hDUbu5D75Q7ap1M/WOgsiWagaw3MMmVxesJcYz6MafVU8HtxxdR0fLBNulzXfKx0NtYh8t8Nk66n88un0hX9xxuM0xIiMls3VTVHNTcGz0i7xsCyghHG+DYoNQESAzZlyMvaBRhSJTPeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1HmUX9R/Ins2dmukpsTDIhVlfzqWS+rpRl2gtSz4so=;
 b=GEOtVMb+MURtYCJfwQI8JwKotnMFQwchQSvbDztnO/acJ17/ZfNnqyaBqeXTfYs+szTm9phAOureNuPa6yUkMHNWQyJg9VS1shSlqB+WjCIcCGezdbp2J4Zp73VY+0d6aMDcc13ck50AVj3LGkQFvSOv9sK7yiWliQhMjy4rP/MTzYg2qePsDPpjgJ0WfNeabEvVlz/s9POs33GxdG4I9EchKicquTrqUg60kAK1RUgkCoKID4PQ5+X6V0G1YFG6FzYMgg5pjLfbFiIwP32e2oqWZ/LAz8iALE1T4neqemwlriHBqkk3+dSHkWeX2/Y19o55vOvR9Vk+itwLSPUeSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Tue, 13 Aug
 2024 14:23:02 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 14:23:01 +0000
Date: Tue, 13 Aug 2024 22:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/79]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: gpiomem: compatible:0:
 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
Message-ID: <ZrtsPLaq0w1c3E/u@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6e3ba4-e06e-4ef7-e9bc-08dcbba37003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h8GXivcsST9FiPVvnZUf0LEFKWQZnhZXr/l5OleZUW0h9ATrzE5sxkRT5g3G?=
 =?us-ascii?Q?3cDDXSwLbl9w/i+fXqJVw7rlmk4Ysjeh7E3L3/hjHlVY7ujU4lf4uU65aZRY?=
 =?us-ascii?Q?JAq3DbDC2OchAKXj7cg2F/CevVppedKsfYH2zQX/puMsGNz3aJIOl98UtXRN?=
 =?us-ascii?Q?iHRflgv4hoVWhYSL7CwPGJ3LD7A1swT8I7XWrzOO2Tm73DQSqsYR4RyiGAvb?=
 =?us-ascii?Q?LjG5AzAAx39Jg4XSzXxx3yyLbkVBtfXbWCCsHYazfORm/Jvo76UbnifShKj5?=
 =?us-ascii?Q?MirMfo5rUPSsniKFUfzUmD+21pHLKtrxx/7rNcT3WteLR7peYO4db4gfXg8o?=
 =?us-ascii?Q?A3SMVVO65eThJZ/YbTsJYLk0U/3V1OwetWx28OCTqLShqOLh8eWLhxuJzlSW?=
 =?us-ascii?Q?LPu6gItkOG+dEyqlcNPOL8/QXnbsna1TKfVvhjjisS+4B7f94MvvnUhp1ysr?=
 =?us-ascii?Q?dqcnW5Ss+ED89Vdji8kub7VXmYrJPddaEVYENSKzNunH/Axy2cMPlkqZjX8R?=
 =?us-ascii?Q?D+w5zQBCxFVBuluXprh8BYD29huxkEfTVFQb8a3hbG6JrAGbLsXtnEs3r11Q?=
 =?us-ascii?Q?5DJdaqWqFAa4UeKAs6oOm/CSI4C1gsCTR7XJZ/NaUoq4dlZey5MEqAt4aDkf?=
 =?us-ascii?Q?xQz0vtbClt5UD3/HgClsUTw9vsb4TneH3eEueEb0c223O1lNW9h9Ag4YtJv3?=
 =?us-ascii?Q?9eyJL7CM633J9DT8OvmjwRt0A2zGJtAPoJOI5puulSsEKEJV6DlAAToaRFWK?=
 =?us-ascii?Q?VPgn7sk2r4CmPjPm9+HEBjVat2mQ/jQIA3ECmI8So/trcTrf7oUGZCLEf6KG?=
 =?us-ascii?Q?RCLjAkTkZD3O4yTa8sOfqcOSolwi5wuam0F8NW4HRWd9pjRnTWuguVeeMVeM?=
 =?us-ascii?Q?8ow5maiJZywgOCugjmuVsXHYzSJ5kLBuMaw2m445bVmyYJESpryzoj+6j7RN?=
 =?us-ascii?Q?NmxtPfq8Ch60wfuZMIVuk6yzm7T7EEh+qFBIGKOCv+dkHi78kHnFzzjBzd5b?=
 =?us-ascii?Q?ksRANnX63FT6qQQWPLHNODjvtj8iQNZxgKgsw5bkC9jajsCAlK+WBw8yOXUD?=
 =?us-ascii?Q?239kC3OmvettCGPyc86BPUnmEJkgG8WPXNf7NzqR17BMD5+ZgDVHYgZ+raEJ?=
 =?us-ascii?Q?y9fX3dcTQWtN6E1YF/9H5E4GoEay6Eqx5pMOyAUi9yq0WbeSAKFcwxvEAtnx?=
 =?us-ascii?Q?eSanFR7av3JDCWvPHLJo7GPnQXOLTxGvxYqkjuZRkiWees783/DfyXuXyIK7?=
 =?us-ascii?Q?4OjmhUF4Vs6AnL11roDthZ0HDFI6cH4c3BDMoTCsKqMR4KwBPz7cUZbgSGlD?=
 =?us-ascii?Q?yz8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wICuVH3MxmqfiNePzEO1sMg/3FaAB0Tr6xrynq7nK08Qisr1bdILCQu0s8VY?=
 =?us-ascii?Q?zqUW3khezUbOtwRTXmKADEYN5juOg7mxAm8vw7wNysPEiEvDOZDL/CMWm091?=
 =?us-ascii?Q?Wp/AEQ77ZjArwfN5QVyxmC5B3e+lmiKHH0wxHi2LkH6WQF9hfhruG4Kya/jD?=
 =?us-ascii?Q?gUTG+zhVFzeYdjZrx46TalpNYBQ2LImtrFp67khf7UZdEs06XE43HaXSzvX2?=
 =?us-ascii?Q?qZjQ7IoLYJ5975/7QSeP5+/iXLwFgOxGR6NXcKDcpjwLE0lzJMZTbgX2iABU?=
 =?us-ascii?Q?0tiW1++43hOB6JidR7t/UFjd2/CsxrpL+0pbS14hqIMIoSog9SAdlKL9sTw7?=
 =?us-ascii?Q?hz1UR8BS2kyZEVm7l+qcPAfcaNFjgTI75QzEV9yS06GwwB/UNYc3een2TfQq?=
 =?us-ascii?Q?3ZDUmOmkB4tjAO12cib5TYOOnQ5pUXCUXsCKwfFT+9H1G9QCKpcz7KpOaspU?=
 =?us-ascii?Q?s4P7bPAE1KEN0lGt2NNs5PeWsWTyJacGTfGHcnXuYlleIJgl3nrgj9OqXyA0?=
 =?us-ascii?Q?3DFukwxvtSqod3lF/M8OOy0CkM0okiZWL+x7zEdNUvPQykKaHma/iWOio/5B?=
 =?us-ascii?Q?i8MgkHDMCA3qiv1p9DiNN3HGhB5qiVQsda0kDXA8L4dkl0cDYntgG2wURlJM?=
 =?us-ascii?Q?Yge96l8ZOnppdiH3kZxK9yqnLPZOyaUha3Cz3D7ktEPnasVkz2SuBf7jWcRV?=
 =?us-ascii?Q?lDIO9VckzO4R6+abH1pxhFEMphW/fIUPZ7UaqgOT44kyw9vDsTvfXyT6D/zf?=
 =?us-ascii?Q?6t/rf3KLEoXH9fBPT6sKTOebqlTKPNso2krOKFbYDClNiMs0I1dBQ9kxHkuB?=
 =?us-ascii?Q?HNvp642aNSoUmLvJmXedVVOM6fizX0bLbIlDovDmnRk0a5Nr8lMf3W18YKYO?=
 =?us-ascii?Q?D72Ew9hBnXHvHp/2MDu+C2sq7AvO+kcYeSNWjLHT0NYxj841XQWDiJHIgWGi?=
 =?us-ascii?Q?PxFZoM+Tvm3DLGZzS+/2XgLOtE/Jr6wFuWe5wdKWFBiccTNKWIZexAOnPxqo?=
 =?us-ascii?Q?IYAEqv8BP78TukdfreL2QfaPSAwjWnXuo6D5+zJXbvxAexTux9kJTVmNdXBT?=
 =?us-ascii?Q?ZJruzlaTNEadoNPwgH664E16/3aLm6XE9JXznaEJVVrlfbZnjA1D2TQJo5kq?=
 =?us-ascii?Q?SZqRJjxHD8pPH1MzkIAwKBQK9Jqg7FNnkZ04Jid7oLjVvZTgP59qcZqy4aeW?=
 =?us-ascii?Q?bJxBEq5N/IChEDnVoHUie6vjyOCAQm+AFl+/cPkzaOddD/0j4Q1Lw5va+Fci?=
 =?us-ascii?Q?hF5iUsBstzFuia04qjnnnxu+zzRSDJP0kGXH6YJd3fWpU0rI0hiKrQLoi0Eo?=
 =?us-ascii?Q?0lCGgtqfzi5NbySLbfd15rVaZwVnT8yGaLDsab12NItEK4RjpY/vrwDDuKrN?=
 =?us-ascii?Q?lI8uJgUIVFIYCW7/LPvYBNuzqDStMGqc1TYI8n2af1PkP4Ed93pwlQmJXNXu?=
 =?us-ascii?Q?8sf/P462Xv9KNyBh97MnNyQuhkBdnvSQKWaNAxHljw8sC0R+4LhZy9YvaaKK?=
 =?us-ascii?Q?BkqImdqIIqUZBaUBl6Q1JrFvXgqmvpb1mkL6LIcC1kLkOon7kinQeZ64h9N/?=
 =?us-ascii?Q?FdZC3IKTbrIvjXRb5gF5EKvr0ZK06VI4oaSwBYVp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6e3ba4-e06e-4ef7-e9bc-08dcbba37003
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 14:23:01.9191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asc0h+3cK4riX+bABlyqQlA0dm4AX9ratWzluImBRhVuVfwQn+U5fGnJm2VH6U7+D2R6qIiUpE9N2IgWpF96gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   3ad420f3e23c17d1cf883549675112ee8dd308e4
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/79] ODROID-N2/C4: char: Add /dev/gpiomem device
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408131226.LOrVwgrB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131226.LOrVwgrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408131226.LOrVwgrB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: gpiomem: compatible:0: 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /gpiomem: failed to match any schema with compatible: ['amlogic, gpiomem']
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
--
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: gpiomem: compatible:0: 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /gpiomem: failed to match any schema with compatible: ['amlogic, gpiomem']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: gpiomem: compatible:0: 'amlogic, gpiomem' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /gpiomem: failed to match any schema with compatible: ['amlogic, gpiomem']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

