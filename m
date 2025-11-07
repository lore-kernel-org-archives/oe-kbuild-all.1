Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B1282F5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 02:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482545; cv=fail; b=tEHclQBesn/s/qvwinQbTgPEHrl+wqg8PBlawAOiSfeOdDSBDM38bxPpe3advYgSwXwCf5gUQ8C8L63ZKxvf08T4tO5Q5Od+9ZD76oOFDHEY5rL+tpGlyo+pISJAekUGx9XgVcHqACuPdX+WSMMFJbs3VakEJzEr6rLnroSAp0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482545; c=relaxed/simple;
	bh=vZ9n66HBgGBt8MML/5iO9dLc1/RZxzeZNei6nfDjpPE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VgzV4egCrZdMGeYIfQewACfBvSU9ySBvodJ0xmAC8s9YRLPKq4cTxQQjeNJk5XBDC2FENeO6RsNu0ls7ljuq6TvjIKTHdhCeHB4eCXX7J1vJyHt5BqycziilfLLUhrpHNtMttbKmS0Ao/vidSHoH5vGiuzm72NncFBZFhx6oMLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjgDJdCN; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjgDJdCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762482544; x=1794018544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vZ9n66HBgGBt8MML/5iO9dLc1/RZxzeZNei6nfDjpPE=;
  b=JjgDJdCNGvhqeYQuB+zvZNhzbUWPTPfo/1QkbzUfoWsfDQi589KuXRVN
   A3+rXBrsGu302hbzGKUG9z24eBhrhqLh46rN8F6QzC7TauiLv0oUBwaMr
   cfmnXXq4vzp0XVrFy07BVaaDvl70mfEVclLtztGzvQoshjFFlnJUl7hTM
   lb0N2OxPr/owpTM4LJSmq0T8FDFDBpuW755naAR9XWHvO3TtlVuXQoWjf
   1ZSdGTI9mMfShYyRtaH8wpVR5AFIHo23+k1sXO6AV2GkKCCLf+uP3kZ/Z
   NU+3b8WhHhkiysVOup4mjMhp3hTN6QLh5HC61b3iUar/EnnjvuAl5892t
   g==;
X-CSE-ConnectionGUID: 3eza4CI2SbeP8t1iClxY0A==
X-CSE-MsgGUID: e2b8kp8ATciYWaZyVxBb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="67244524"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="67244524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 18:29:03 -0800
X-CSE-ConnectionGUID: I2NuQTpCSkaB1gmnzKgaxA==
X-CSE-MsgGUID: Fs6YeXjOSDS8ezP83QSjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="187225832"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 18:29:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 18:29:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 18:29:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 18:29:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c49LOQbKr0ogek4n0CG1JxLpevo2oB/S/zU2KWALT49X9lGZmX0oA4vZIUBrMaFVzqD/HZ6Y9RIo6VHh7sm6sghnn3qhhsZNHqss0uWKmsJxvPiZ1q6M8zSh4SOGFWxWYh3QrNABqMrslY5XI9DF4bbrrOfDSX64cJH1lcDOyVJyeeLN5wev141vc7zjEmWqW+XLwAsvMLkA2vRPREzcBTY+zueb2CT1Tjt9FAtJHyZpFVQjuiP35gm69ibV2IC1sFBbQMj3zd20p6cTPka7dVijt3bok2s9MBdLMkhT06jaJYLncVhIM5maeyZtfMJYOS+OkKcynsIXLDCVsr7tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7oYjRTdWMuOAyk5AADSVKhgDY/X+Ag5wgZqAiitiNg=;
 b=KvOXZTwd1xl/X2KYGah9B5EDM+yN1ESZ5fFfqg8ihHt9AorrEysTY9P+c90ZVePCyCP5DXnTxCcfbd896YIS1DhzN7rwp2FBq/ArJ4eMz/eyM0Mv3Ldk7IWCg4ZoZeZeklJAfl7V/kZ9h4pYPSkgumr/v+36p9509oNMeSWHudhbTLiRJWmI3MoOYgwbaYu/6j2hX5oiUmM6NbQEgiIPA0LxNnayEk37DfNEODZYj/906Bjb2S0ZazI4h8eFEP00cB37qlb+kEJXfdfQqTDt/XbJs03sEMRb8ci1OAVKKXuv0zx66WM8FAQtRz17/Blj+8Q/9r56U4liIim5U7fvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 02:29:00 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9275.015; Fri, 7 Nov 2025
 02:29:00 +0000
Date: Fri, 7 Nov 2025 10:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: <oe-kbuild-all@lists.linux.dev>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc3-2025-10-30-x5h-ironhide 18/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000
 (renesas,scif-r8a78000): 'resets' is a required property
Message-ID: <aQ1ZZbNCCi0XXkTi@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c69280-d61a-46f6-9318-08de1da568d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pdeyjv751TQ9gmt877HvxYFp9ne01za1HYqnxBhyxgCyKBM8cB3q/qSL4Wjw?=
 =?us-ascii?Q?wbzvBXp4BtM6MZ4nUfa4nGjvfe7KLuF3l4apAWWDV2YlzgMmZjJUI8RAQY2J?=
 =?us-ascii?Q?wWVOSx+ZaOeULw4LQdvwB81zNeUr5DltNbrnuQMeuF/b+UOZrnSHua6K0fWO?=
 =?us-ascii?Q?BD0/7NIOyKObLMQGOJT5J2oFRSvItj9qfhlxxj/vPA859cpz7jy4PNwli9+z?=
 =?us-ascii?Q?clnr4qt0JJLvjf33rz+v2wM0Y5tDSVKRfSklW37YH4JvdcGev9Zdj3tRydJG?=
 =?us-ascii?Q?GmSdMRzXfjZVBty3IDBIjiAYX+9pXiEI/85e/cKCDwavXwM3hy2gZw9hZohK?=
 =?us-ascii?Q?J56nybSmOYPh3zhq6TUKRFD7YURrQ5f6KS5cxIdiLHr+S5HARcrKhSkGs1W0?=
 =?us-ascii?Q?wIB/30Q55EET+Owkd42Snu5Q0OafA6FmIWvpaw3wQlbDi3FFtwCo+pd4SqLa?=
 =?us-ascii?Q?SSWEG09uFEggkrLiU8J/eDzcSbUKYI276IaswuFDTKl8gYZc4MzdPMJm3CJz?=
 =?us-ascii?Q?tjevlLZZf3iaDtiFvJ9HStmabSGF+QT+eE1g5lSkAfbuFuh08Vfrkpse1qRq?=
 =?us-ascii?Q?n8hfowAlWZuCIV9JgMK6cg81TAiFtQK4jYS5AgZmN/w6PpOB87axKWtJPGTh?=
 =?us-ascii?Q?DxBtvkfjKO9lx/BrpRlYDaW7txhHX1DacrbE3UGYVlEvatbGq7e0Cy518+7D?=
 =?us-ascii?Q?f4SW3+vl/hq3XjVCK/wpyEgog1L8QPSfLzJazFKz99hZiIYN1e+kSgjlUnK8?=
 =?us-ascii?Q?e8ZCNdHbNClh62pP1ocwzc9dccQCsyh5BvfuKmJTuszJAs9rO+Yb4f3Gbxa4?=
 =?us-ascii?Q?cB/xfWrNkrwEbucIRgiKnr2tR0hy7WLK6VMfYGgMmhKYsqY6Nlp8tawGxQ8I?=
 =?us-ascii?Q?DUTWiqKZ7Z2BWlT5pHtgc/Qn2qnjxO9eGf6rHvR1Yo36c2irMCQtNRgqKl0u?=
 =?us-ascii?Q?QCmQGCc93XVqhqBTsvqtwWe8H3j+60H7aW3+r2UlRJrtGsc9CFhqS/a2wT86?=
 =?us-ascii?Q?YaYZdSr+PWqUKve9ZPAijXYk5g0GOnMR+xToLt0T4S8ZnQAfmjfvyTZ7DB4N?=
 =?us-ascii?Q?AW1huZPf16mjC0C3oG3KHNacijtN6/JPRHrRjPWN7R0l6AceYggK/Oxi/WJI?=
 =?us-ascii?Q?7sQpKmo76qVPQjEVnk2wR5epqEDzka595qlimu9+kNZNJ3/duzWad8Fz017Q?=
 =?us-ascii?Q?Hksr/wx/2BgVwL/GjU7yyBu0/FIQrD8YIeIcviJshIh71BY0NUbEkVkkigyp?=
 =?us-ascii?Q?Cf3o16myG81LTW+AJUw+u70650xBxd0aGiF66W2TEqbX+EvDI+jP5Sj+oqPL?=
 =?us-ascii?Q?YKLEqSCemV8EncZl+ZvRBQM57yO1Ngimb6vq3Lw8p/AXoTuM8jVAB4d2Pn9Q?=
 =?us-ascii?Q?t7Y/Ii27fgIxmW75nCHBpZ29V6zRiOYiicA/ESIaIQaAdRhKYAfsN0ZYP0bg?=
 =?us-ascii?Q?vxERgrj97e6qac4YSqqU4V761SKEPST32LdpLFuFS4L9ARKs+KjT3jWxK4Qx?=
 =?us-ascii?Q?hPgv3QS+5T6d8DFpHsLKB0HsAb4IAd+TnhBeekU8RIpGjv6c2CcbJwyUmA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6kTT/42P9SySB+ZRIU5wD3rUSnQLUyBOqF3wcsrqE/wkWXrHJ0El5Fv+Ea1?=
 =?us-ascii?Q?J6TiPAKcsg9+uKfhz2U7NxMagm20EUuQTk1T7oYBv+c2IhuoROexLcQiKqS+?=
 =?us-ascii?Q?R3OwCxYINP89RFfEufj/ZKVtLL0Xo3s5hDD9ByieIxqZjm3NsgK39P7YZkI1?=
 =?us-ascii?Q?rUJKQbYGBn/RYg8pX7CpbGh832zQiMiRhB8tAr5L5uRQieVecYwXm3RfEKY2?=
 =?us-ascii?Q?w2nlHCcS7PHxFS9Z73yi5v4h38SldW0lzdFpr/FZWJKbOjKJJEQusff5J/xX?=
 =?us-ascii?Q?eoYksurLZFA+ZHAEIA1+J7uPUO5fmEkV2xKRrR3beq7Ko9W4u9MGEkcJE9QS?=
 =?us-ascii?Q?v70b7PQMMX/yFIUngV7hv1a7flsejS4y3YZ5r0shNVl4swBsydER8eChYRx4?=
 =?us-ascii?Q?oGtzTWLhtrAilT+cEjcKTREuBfRA9WzJPqd1YAeGHXwjBEcTijpmKS6wJT+z?=
 =?us-ascii?Q?aoqj4LsTVch/l9ExrxUjUGd0vAo5pAD59COzvTeGI8jkag5w5yej2rf/ZhXF?=
 =?us-ascii?Q?7Mm38tQsfIuzjjlxJ7mvkt0qdTsSMq8wQDVm9SO2FNn+M7UjEIXl3Q9Ti7pn?=
 =?us-ascii?Q?EJU0BWJDLlwNrheIi5hZd9fbLfX11GkXQ0K5sfdkVW24s0kY3IapXTUVa8if?=
 =?us-ascii?Q?oxQy5jvuxedWskv6n3AM42Q5G54r6Bdob/cjkNhrg8Y9HqFKdIca4UgJwtp9?=
 =?us-ascii?Q?EIDQRYYJh+1lU3Hbn2/35M63zRncEE6egfqMFt/FdaUGNCWQa5Z3puKZ/wbk?=
 =?us-ascii?Q?8EHSHu+g/rUG0scfDFwCsZimQaDKSUFcV3NEk9+LQ41vqfQEL5j0EHdZurpY?=
 =?us-ascii?Q?Mn/dxzaDbIGMJjJirKI01ZXiQpPsSrABd58xEI7qtjRp59KOQbopSlo46Yzt?=
 =?us-ascii?Q?mOSi4X9MpmhiD05OhHTeXNx4TLT2bdArINY/WaQaAMshglB0YhAjkQK+dwoa?=
 =?us-ascii?Q?6SBoY/HdoG7znoYFDkKH/1zhQtW8qIOHZjXGmbf8m7enYrRnjSySInpNs3vD?=
 =?us-ascii?Q?fe7B76Dfl90w+D9Hk6uYKnIJaEgVq+FVHT2PzXx/9rouEqouwPF/UTXKhc85?=
 =?us-ascii?Q?QRNC1mcZQ8YbeEc9wSkDvR/PgRtbFVw2eGIUrN7BO4LgexfLDTJqGfd+T5MZ?=
 =?us-ascii?Q?SmZwBNErkC5Qfm52llcImc5qSBOCMLbqdDAF64DZpSgkGIZFTcxGiy5scmOB?=
 =?us-ascii?Q?mJGnEuvXcopOkutv+/wbOHCTujCXREXcFUkZnSpo/j4EAYGTL/sfn8q0WLik?=
 =?us-ascii?Q?wSv2xQjx1F/NpXWVbTM1nSEuy0aevP8ui30anMEzH5np+PJeVVi6ZO3bzcBv?=
 =?us-ascii?Q?UkV50v6l9MfY4dkeoE+HKiC7I7YnRQdB3rnTwQcboq8LAywQWhf4TvKzI3Ml?=
 =?us-ascii?Q?5gc2x0zo6PFOUEzdyxy4NGem1SLGb5Bh/7omhS56p1x46okb8PREeoo1uKft?=
 =?us-ascii?Q?r18zL8bNPmYyD7SMz4Hvf3K0IG7fR7/3uXbhBxO8TtBNpg0f1Xk2WeJ2MUUa?=
 =?us-ascii?Q?BuyPesLVqRb15uYmI/4gpO6/fEpga5qFguGbwqTaKCKimEwDV8nCZPak335X?=
 =?us-ascii?Q?0suTWmb8J9PXHxMEBkPQ/XQYn2zd/xCsuaUGEXDF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c69280-d61a-46f6-9318-08de1da568d6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 02:29:00.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG0sQuyVULNdnDHgtXogT3htha02XirXT1DsX+qvAYWgius0i9+K0zyL3/hsrlzkOijlDKFku78jBM8+KRzHtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
X-OriginatorOrg: intel.com

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc3-2025-10-30-x5h-ironhide
head:   80827640973fc37984dca63282497d3787866053
commit: 9e41077ffdc895a91c3493109bdde2b6c5f65db2 [18/21] FIXME: arm64: renesas: r8a78000: Switch HSCIF0 back to dummy clock, enable HSCIF1 with SCMI clock
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2052-20251106 (https://download.01.org/0day-ci/archive/20251107/202511070255.JR1e2Jgq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070255.JR1e2Jgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511070255.JR1e2Jgq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram): 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (mmio-sram): $nodename:0: 'scp@c1000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

