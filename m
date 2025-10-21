Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D52817736
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 00:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761006078; cv=fail; b=PEsRtegreL7piJKGlAg88Wd5I4pxBz1d7N6RiBBO+XMFLWMrMsofJI3pSwCytbpil14e+w9+6hIKwzav4ed03bGnHPH33TNG16xwQrV0zCNI2Rv4PrVVnkIXRSJQHgfhSlUo8TY0Zbwo2xwXzrbLjl41zLeQ9y9RY4x6A56YeAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761006078; c=relaxed/simple;
	bh=QwxxarGli9BOoXEuQiR8QfWLtKRm7qqFoQcLI8zU0e4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tck0CQRt6b+zGWuFkXiMuVcUyQIOico2ckLwOa4z9U1GW4oXG1C8iL2ViK/0/o8lar/XQSidhI0QrX9ElgBSIVBr3z1v6D81dyVTsxfo5Xx0GVi5TE0ulbgdbLmZwiwXIaz2rdG5HBWXat5HbxgOU1/PADeCKDo+HjJ0H/GVa2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToPjpIfp; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToPjpIfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761006076; x=1792542076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwxxarGli9BOoXEuQiR8QfWLtKRm7qqFoQcLI8zU0e4=;
  b=ToPjpIfpYEs4cMMlweU9zvw4JPEUuh/cuOaESBg0PVOrgWj4NlcH5Bu4
   jar0lauFNJhgIHhFNRyvEz85nAIuJ80dkI5kF4zYqLn685Rc2+2TNTZQx
   9lB05qc11Hutel62GJJUzUsHsSisnJDjVRWsETQ/JpcUoav+y2q5bleEG
   G6jp4jSUf1e2x0yKNJqZ+0Y3+EZWW8d6QmEb1aFwpSizCTRfT8g5qmkIY
   062Rg2tQQ+i4GRBa9BnOHJsLKsCcSbNhl39ov/RXe3/XPf/bELKNw/yWS
   7gxG/ic7VIddUKJq0q+s9bIxhIHecQ+wF/atQupugN1Axaafbss4egj1J
   A==;
X-CSE-ConnectionGUID: Tae4vto0QyS3f2xCkZOZyQ==
X-CSE-MsgGUID: +Y+C5/QRSFaEBrvfUtjR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88597445"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="88597445"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:21:16 -0700
X-CSE-ConnectionGUID: lrBvz3bBQ5C5Q59m0WfxwA==
X-CSE-MsgGUID: chbSSBEWSqen2fMCrgXCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183480169"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:21:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:21:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:21:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XufaIbr/NxrNRcen8GCqn91FN7xlkeAy58icpnhkWrhVNTRRbzPwL50M+H+h8HV3B/M3ETuGqpMTCkOm9eWptnXSQF06P3wvkxpDOy+BZYz7mGpWGOC8tBZeWuOEhiPbXenDCnJRFJ7Sh4N6jIelr1KVq79gEsyD75JiEWUGItnGz+5X21mTAstl/w+HZfm7uOS1AyBqvmU3pDb3lto8H4Yy0qW4bcwgD5c5AGaCcTlQCCR3+NBh1UvNb74dTLkMmt9evxzAIjmYrNz8oCoxP/KdRc+bDZ5L2r4qa67SpuJ9Fenvd/KqdoDy4xdU39aaC+cQ5nARpe2Qv7bfSpFWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvoCCTBQeUv/zVD3zs/Hej9EIMS5Y2SpVbol5wX2Hk4=;
 b=OATCnK+QH6/pCeHWxJ8ZBdPAqViwO3XvEb1HTax8/c2gkcX4EwaNA2viltAYwHbKCtDv6psJZEejQXwLfOpO+2pkWe6dAuklfTnn+CMjJiM02qTTW+R905crZJ+hxE/JVeAs6DndERfmszJlF4bhA8DPxsoKulkQ/TdU5conDu6x1XRli+2eGNLfk8w++TpU1kqRTz5JCgRlP670SsLRNWaGAm7EOfudhPUMh9NV0nlnZ7VtmRmrkK6K534mzMKBKta3vbQZ14netR1QhlBfqA12xmezaxq6ZIvXw6DdCV7wWJ29dRvj1HAA1mQToiL4z9VmJ8CtLJIyZloZrqt7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:21:12 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:21:12 +0000
Date: Tue, 21 Oct 2025 08:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-5.10 3239/3239]
 tools/power/acpi/include/acpi/platform/aclinux.h:198:9: error: missing
 binary operator before token "("
Message-ID: <aPbR74/msQq1UOLB@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d2f2ee-6822-4ad4-9782-08de1037bd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dQB5Q7lOMa88SL1mWimnyRnnCkxWyaaOvEE+jrTepNY46sDgSxhwbv9MBsI0?=
 =?us-ascii?Q?2X4eEmwwLt0h++uRtQu3ZjwZe7hVJhKhJcXFn/L57dtYaOcuNwZ5civl57Jg?=
 =?us-ascii?Q?9dkjlcVh/wOGsCMLr/xSMu+5gCMhkNi9G/MhrBRt1sk4l2+B9EC7c+5u/Nv1?=
 =?us-ascii?Q?oRTKjzBXcTTH4UvEvhDU50bojshASArDoeZrDdsE4yeZva6seenYHAjMkhir?=
 =?us-ascii?Q?tdr6WIplKhayt81b9ibyAxfv2UCqBEAI38UjFoSXCDq5Xm13q2fkSOemBhZa?=
 =?us-ascii?Q?pjSZAuVEvqLI4vEy7Ch/vlEWb6RJdtioQqnq78DUPwWnA/yOd7OPR4SmI1h0?=
 =?us-ascii?Q?RB12d71JHW/2FYGm4sKweFcIyJ9kIKwGYTNRYz3VDNeUQMMWIpQC6Nus42dF?=
 =?us-ascii?Q?3Erhfm5zggxgO00LFUWc1vNMR2Uj1G+6p1oBYjUD1V0kOUDJ5Owqqe9TMa8b?=
 =?us-ascii?Q?5sig9ap/M8pFEextrRLlFGACvThXKkSjsj48pJdVqlPCXencPsK9N3P6c2fx?=
 =?us-ascii?Q?nlqmt+TjIHZ3hXZwUD0I9PfHfu0SZtKBaCq8cB2anuJ4+M7Qv485i/Zl4UgC?=
 =?us-ascii?Q?ljYO56pxfTjUIWGJfDSYSrW82+Uria8xPfIF8eUJ4o74arDSeBb/VhEPZ303?=
 =?us-ascii?Q?347yyyNMG5TCDvOehymjU3RFuvah6dAgUz0H5Q6cUGwxircr/0gAfej62tQ7?=
 =?us-ascii?Q?NMBzYQsFpjfAlgMdh2gpXVxcN6NY6bI3S5OwtTgysTjam7PKXv4c8ybkq1VX?=
 =?us-ascii?Q?6kBS80zBbL3TEBJRMXBySIb/G3w3Vm1J8evlARIVCBshXPKKMTxF1w/r1Vqx?=
 =?us-ascii?Q?NYNbywlM6DaICMQbwW00KDLfcmBb8RIr8hfkbSo2gDGQ55F5wJMNXwlnzsPp?=
 =?us-ascii?Q?wvdYJ9dJTdDAHJDF8TsRKCTbsz7iRuXaJb4CHC3smzZKUnn+BiPcPIA0kfPE?=
 =?us-ascii?Q?TcP85MMk7wEHwSopchMlCr3EjNGGPQHqIBUzyP9wBvtgwYVAhsNnNN9o6nFM?=
 =?us-ascii?Q?DEoA6FPgxWIdJNPPxhKfCvBayIulOdfJJSdcSd0h6y5B3KuqLgd8HCCgSgcX?=
 =?us-ascii?Q?uQJRjEkdtZi0yi8bHUavZaS67g5sCrVJzdz2qgqBqgPp0qnNcwVQiY1NCjXk?=
 =?us-ascii?Q?7MtC4TXkFB30xsiZAyZ3DvQo24s4LAJzzm+fG8Dc21TSaaj35kooiti+JZ59?=
 =?us-ascii?Q?GjTlPVvE/GChSgTcQs6mUGE3EO5csBh144lwnh8LMPvsSvOHbToIuKjKKbfa?=
 =?us-ascii?Q?i8OHwf64XWDXB66EtJbzXyAOC2HrjBtxrecGpl2kTBuWa+toEn/YB/uexQDG?=
 =?us-ascii?Q?hKd3ELdxSyV4PtV71FQ99msiBnFibDl4eS8XmGlbSEvjBQ3d1fTaXhfLek6a?=
 =?us-ascii?Q?ilViax1U9on0sB9Cyi4nXFryKStfykqqGCXrex+G0EqgP4YQEJ1eGqZHlRUZ?=
 =?us-ascii?Q?SOWNvDj5w4U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hPyYQJbZ+y7xiLbDXTgRr8c2YucT1X6nLqSsERWKQuhnkkVaBSzGoXACCHN?=
 =?us-ascii?Q?FXVdMF+WPdb15AMnB2hbm+Cz7B4tER9XJdYlobo/ejMp2EdS9OKxqQR2NiGr?=
 =?us-ascii?Q?wzIIoeYXPb4C2oouTreBdSdjcOVqg4AaUTLwnjjwicooQ3GSUFNSN44/jWyh?=
 =?us-ascii?Q?bEyo3ftl6m3Y7lpuh2P/RCGaOjm/XxAc1PiAGrIdceze82r0zDf9CcgkX4ug?=
 =?us-ascii?Q?GsrDTlUItrAcwffNrGN74czSUAkAW+MUpov5NoHcSV+MrczC0hc0J0JgCnwG?=
 =?us-ascii?Q?QnjLG/r1fF+6Ki8YDgE1tq/bZXl+te/FifKLpU4TaYzubfFeO5VV3L8Ff+hU?=
 =?us-ascii?Q?aFfhyKmNPnDxX0bGc1QNHs4vJfY9ca3wJUenDBoywgcs7kCmO20DDHtDi1Bq?=
 =?us-ascii?Q?RqiLqBgrfshw4IWv1qYNu6+iNEa5v0dvo5dCNtLWnuUvFPeHoLQF24ZK+mLa?=
 =?us-ascii?Q?tF8TtgE1CkRzOjY9NiT2utpkBftP9FMczTdxpz44AgaamXwM9+uq48gHRSLo?=
 =?us-ascii?Q?SR/k7buAWI60BgmbWrch6g1R3J3xmaCXdHYilzOKM6KmSsIem5cEg6qoUcHD?=
 =?us-ascii?Q?tJ4aGTBiL4wnt8n9YgSyU2uXwNIacG52TIGoAYQiWsAgIDKxoVP9dS6CnUuN?=
 =?us-ascii?Q?GanXSIxJo52Y7jf3HN8R0Xthm4x5EjVQ4z3qD6NPpkbMfoVP1mMFk5Td64Kb?=
 =?us-ascii?Q?wggRSMSB4WKh+R78aSuoZtiX+65UXamXKUkoQStW+QCm+c/WWTMVOhPQQIQ0?=
 =?us-ascii?Q?ZgBoLcVPOE+ZuKvD7BVTxBmPInehlWv9IHupWIgXQPQ3wNnpMEFxYtKBgBIS?=
 =?us-ascii?Q?nwA/PzXXnLJg7AcN0LITuf29TMfcRAmqpLg7ujty+au4Udz4H4LZBpIkMOrO?=
 =?us-ascii?Q?K+6E+GzdCGb5A8J+K2Mln02gwGaakaEDpDTNU0KkYGlwdturivobKSf7Y1dx?=
 =?us-ascii?Q?acAgxSXfFwCqPOg/ooKVAo0AY90jparyrHk3Ae+JTjSYfR00CsoOiQjP0BfP?=
 =?us-ascii?Q?vRG00y7gKbRuUQwwqVihdNdl58d/o8r9XdHVVir5PmPH+PyATniBULpaVS6h?=
 =?us-ascii?Q?dHeo1oD9SNwIByyEQ1+YnkiNAEwNYtwNs3b2GL8qe8c0kp+LEZFNylvg34eH?=
 =?us-ascii?Q?m1e3jSNucJxb2OFm+gkP2hxeeeThSKpD65BMDQa2MmlKPAP6vPS+ZPhx8rBe?=
 =?us-ascii?Q?ITBRTorZz6Olk8IcXiSSREn7UwzTfqdM+c80Kb4KFKYbnc26/WL+Wxm0ZNPo?=
 =?us-ascii?Q?Lvdyf44xzKIzc/0w011Hjn4HvwRH5Z4YtSYATBhaQQFibFG7Z8S5xY+Cu26S?=
 =?us-ascii?Q?Ojly+DCEggk6EplwIpFZZpshFIFORAPk2VmnjiOSCtRrNvKwkHWVbbg5RF47?=
 =?us-ascii?Q?16a0atwZc8RB6aZCVcRQsB8FndcpkAHE2YSyPtlLLWgLMQtudDfvojrTBy4j?=
 =?us-ascii?Q?V4Lbu66AlHCxMhsbC7MxpQbQOZBwOsaT03OxfpugfNGK2lO933arWkpeWzJ9?=
 =?us-ascii?Q?PHg/TqMtdwpnpvB6ZiBaY7lmtg7bT1CjVpow+Tsdn+ZcOSbDkEdzfpRdk3of?=
 =?us-ascii?Q?ayYvfigsrzUmbgnBHvkO4kL8pzvTU5Q4FxvQqJ8f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d2f2ee-6822-4ad4-9782-08de1037bd0e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:21:12.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xv62FxvEiJl4DAiv4OMOQ8zKaFwlZaBjl6WlfP+cVGRl0tjl+/pxMwEj3WfF5C9lvvDNy6gjEFhzjCxk9pQXkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   778ac52b2e93163892e99cf06ec8021b6c1bab72
commit: d1c564ec2caf3397821e747c783bbc3600fcc782 [3239/3239] ACPI: Support ACPI_MACHINE_WIDTH for 64
:::::: branch date: 8 hours ago
:::::: commit date: 2 years, 8 months ago
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210250.7SqF2rX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210250.7SqF2rX1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/power/acpi/include/acpi/platform/acenv.h:163,
                    from tools/power/acpi/include/acpi/acpi.h:22,
                    from acpidbg.c:9:
>> tools/power/acpi/include/acpi/platform/aclinux.h:198:9: error: missing binary operator before token "("
     198 |         (defined(__riscv) && (defined(__LP64__) || defined(_LP64)))
         |         ^
   make[3]: *** [../../Makefile.rules:24: tools/power/acpi/tools/acpidbg/acpidbg.o] Error 1
   make[2]: *** [Makefile:18: acpidbg] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

