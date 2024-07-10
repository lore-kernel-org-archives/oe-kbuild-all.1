Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690317D412
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611243; cv=fail; b=fbMaNIv7EIRKJ1F2XvtRZZZBM27nXHpbqeGveHqSeKmsB2FNuLGgu1q6jknaVUaG9pZIhT8w4mkhvhATLHF1hZR60eePWQjapedfgtqM+JPaTZzaMPDvqK0ZhLIVBTeaelc1SoEjRxQfP+tKdlBBjnEcm7yL6B0XG0nl1AExNtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611243; c=relaxed/simple;
	bh=KsWC7AuhxLlPx8ZmrvbvoL6XdLzt5XpQO+uX00RnOFE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=p/5eVDMXnnbQMwXt2a9nrhhUW7fnwV8Xer2kqTqq0jmvIMdmR1nyzuxtCwCsz8ujALRsYlyv9sPJUqgIhuAwDb6NIoW0pWL0QqRxT/Aj3cnpj7Gq8dCnBDhSdrhNBBq4Ceobu3bSBK2X7e75GSczm2TSyemRJeC3h9vNTFO9j3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHy7kIIT; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHy7kIIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720611242; x=1752147242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KsWC7AuhxLlPx8ZmrvbvoL6XdLzt5XpQO+uX00RnOFE=;
  b=DHy7kIITZ9QIY1WnEnyU7oKOg/uSjH+GomcWsyI15sNrp8+A8JsZOewy
   gpHW8DQu8rotoaG1+00GLWQVZ7tFvX8DEsCabUCMVIp9p5jPdKXs8PeO8
   PLBRCkrrJKGdelCcYAjED9wdf1/6R6jJM97Taiv/jBPv/ltxPRNeC1fBk
   j57+H5lzat4aKRXx+quwEOy6Ci4jrcmCaLndCSnOl18FMHdztSNGr56nX
   Wt/5e4E9q21Ac6IDsD/rMzJfDQLZza7FZgWuT+wmDvYlG0/NyY9ssK61X
   B//TPyCLGebk9Jc1zvkoLkjjyKcObFzZ69K+/KmjLk3zofPcfUxCNyARR
   Q==;
X-CSE-ConnectionGUID: hSAnHgxzTTGKogFySOxrIg==
X-CSE-MsgGUID: CC+c249eRlibcVEGC0CHMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29326800"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="29326800"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:34:01 -0700
X-CSE-ConnectionGUID: welUiymqQROvDlrintT3FQ==
X-CSE-MsgGUID: O/CZhQY9Tr6Agv6E3kxRLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="48198819"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 04:33:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 04:33:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 04:33:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 04:33:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 04:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNaCF/fi2sZ5ltPRXCUExSUolKjS6+9tyXkEImLZHmW1dtb318cpVccxLZLgDMvzNsyu5utEhipgG2qNMSGzBNlfrq6aNl/FnGI5wSO2908m3j4Ublba5stPZQUPaPfdN7JOi985DY47MqGhFv6wcr/1YPu+tyJdNqutdEXZV8MfRFQfooR2dpTzumFPFCB+tXBZ+mC2PxhywLK0FF79LXnlRn2JJT8vfgkwtXpZHAzrj+aS2Jgwlsm8fmNUddruJrhGLsr07/GdP01w1Li5mJfp+1MBUNt1NQKWxuoCxl54xmxqsUtsx+KbrKZZyH0ijkXYF2DtwjJRSkWjsSdzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akPu6YmomDq9s7g5z7GbbdcGtnhNzKmqmn8MFsUu6L0=;
 b=C+lGY0oYmmdIOwfqj6GY3bY6J1S4STMFUUapn2AOs0BtElJqtRcQDwAmb8XGg+yh54OYKkPPAOzauIzr18cM6CzeNscESvcO33S/zMn93r+D7AX9UbhpES0qQSWvyQc62cwDZLNC6HfmYyu5R4uBQ8xLKpgtDox+j+1s+dxYkss1PJeuEUv6VhZvMs/YfrWvYd/gsa4Rl0H/lpZLgpgcU2nPF50Upmg8W5O+/NA0Gmrgm+xU5VBXgmlLfeYBx/wQFCQ7g+aBNiaQidgR6a6XmvbeTQy8fR8/EtkO98rqINTP4u9qx/jiSeIEMG4UbnYkZhNg8zh7459dM/KIwxRN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 11:33:31 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 11:33:31 +0000
Date: Wed, 10 Jul 2024 19:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-6.1.y-cip 43/44]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator-vcc-sdhi1:
 Unevaluated properties are not allowed ('gpios' was unexpected)
Message-ID: <Zo5xg24jS9e+sItD@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 8422c625-ed4d-46e2-50cd-08dca0d4204f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PwLZMXogkk3D0Mw0MHKJZfzlobWbLI7UHy62Z2J/5MaumXjM1WJW+dyFkLvY?=
 =?us-ascii?Q?pKKkMpdphM7mD9PkuhJ5KF+mPvCfst8Jkiw2Ff4nKhxDEp5mHwwg5fuy0pze?=
 =?us-ascii?Q?ylretsaygdLRqaI7I079uvDd/P7C6S6TJDonl+z77Gc3RC71ibJSPq0Z/jiI?=
 =?us-ascii?Q?Z4J6o4SvmHWAugNSDOi355WQgBiUFRR2N7lPQwuxShXxUutkXNhbT/rODqK8?=
 =?us-ascii?Q?bb6uD6nWIj1ccMczt77HsZD17JzlxUIWS2K/bNRzDnDg8dBGtaoJu7YMfnB/?=
 =?us-ascii?Q?QZ4IDk3D/KH9ZtaW/SU373UtzfL462LAaRFR52jM78aUA+1K9f4yfhnW+Hfu?=
 =?us-ascii?Q?WZpesun+XtP/gmO0EH0bu2e/uuaBzFURpUuC7p9PI39JGwOlgEJc7aAoWUEn?=
 =?us-ascii?Q?eblJA3ED5wi9DiZklBfEnXY43n8W7JhlxD7ZbK1FG6vZLsz2uDiAe7l32Lf1?=
 =?us-ascii?Q?ZuZ1cMS6J2+r19a6o0B9v+DlgGK1B0yxiJSzw60sby8LLsPPA5wSmo966r62?=
 =?us-ascii?Q?BFjAruDQBaNbbqGoIt51ajIcXfsXOqqb+dSKt/sjuSVJ/WSg3HfjI5h8vr1P?=
 =?us-ascii?Q?L515Oae+7Ql/BjPn2p1UZTOnFrXE2ZZbsvn/rUBWVashuNY2BzajyqbwU0YT?=
 =?us-ascii?Q?T5JqNSRUnKZKNIjTBkPAXPxP3f9pr1CjXXbNW5B8i7A0JTkxNKadREfnd0SZ?=
 =?us-ascii?Q?2nCYPuxb7GQjyu2QJx0tZJmQRX+eRf1f6J4EcB30SLv/l5N2yE1Tyr7ZAKfr?=
 =?us-ascii?Q?eKUIIyZvkuBjZXFZmWpLLJwjC69WR/Q0qGvNDwufCO2kveK+68nMW3Ih8ese?=
 =?us-ascii?Q?fS31FdOD1SkZZ1H30NWY+79j6w+JyVxO9JmwEc1vIvMG/lwLUETAm+vNcdCA?=
 =?us-ascii?Q?jrEYh3fEtsZwJUXYmNPgtIpiEC5oqfUk4gNTiwXmQz/DQWRvF2lh9Ys9GHFF?=
 =?us-ascii?Q?jO3vH5w6CMZhA98eu9VGpKbXNuGAIMnm9aeDzV5bEfWi7ucZ5IRb5ygDBhUd?=
 =?us-ascii?Q?83keSrsfhCT+STSox/mlv+Qc+AmLel3801CA410eVPPFoOIx09swBF37ixBz?=
 =?us-ascii?Q?BTbrn4YynIB1dQSmWc7cLlGs8M6Ir3aekZtibn6fknquf52KBum4SO4dApKN?=
 =?us-ascii?Q?vs1LvxZiSV1YrMacaOMJFY1UwaHXwOFoZ6IwC5HiPWUbVY5WW7fFhXaYaRTf?=
 =?us-ascii?Q?+yUNPT0zVe6TaLgYMMftOZtEEzsBbRfSuV6ONVQddUHDBvivehYLTtX/5k0f?=
 =?us-ascii?Q?Ey736noV5W1cHmHCTRHtQfVlBnGDrKhp1+oViFbCVK+/grWX84CxxvSxuO8i?=
 =?us-ascii?Q?ZT0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YG1qew3KZVcH/dyBYKDASnTa1pBfymanTicwzco3clvFHs+K3tQ2bxETdgTZ?=
 =?us-ascii?Q?YLcQBm7MMEcYNbxSLwFV8pKHv0Ohdg0x31Bexlyk94LlqXLyK3HPzUplXzlm?=
 =?us-ascii?Q?+jkfiTin0EmIfFlfOBOtqoqiZUWG5qSSTolGZVMurbQdwyabca9iqsJxkAec?=
 =?us-ascii?Q?fH3X6MG5neRV5uVFj0p9YyjnOS8Cf7bgB9bGIy2oEkHMo06aJ2VCdcJIsaKK?=
 =?us-ascii?Q?mNLGYjvgfWVo2P+aPc4fvfDqQAKSyhMpopfOPQO0Xt/o8YrxmumRYKpYjg4y?=
 =?us-ascii?Q?YgwSCJoYlYgfpCyzkSArdBLiqTtnG8k+02RnyU/ZfmtoqHzhXkrZckTRulxM?=
 =?us-ascii?Q?VKHeofOMo5G7UW3qrSAa97BK8+5U2p8D9nb7AEwUH0Xfc1TZPnCYncExaojp?=
 =?us-ascii?Q?wSCoNtxJ6/JKWyEDfS+spTXlRjsSqGhDYRv3faI9QHvhoL2LCecaHu43jxNE?=
 =?us-ascii?Q?NTD8caXAwIN7oy52OduUWTlOzpOI4PO8jCPl7mhyxUg1gKIMeZ0ltjzq/aid?=
 =?us-ascii?Q?52x0uxME6uS8SVbhFxjyI30jJmUuqiFNir1ZWl/wsI2zBCZqvN5EctVCBX+h?=
 =?us-ascii?Q?6Tem+fTohNRVZ/dOr++rnkPhQqSXD1bFuDCFxv5ak2hmvwg8UdnVb+chZbU2?=
 =?us-ascii?Q?uRShOYXFfIcRDa7w7n2M6+t4a6MFa+SZ9+oAKg5JcVyBca3V4mATZuX9YjIL?=
 =?us-ascii?Q?YFLytgXvqhrMpjZcOk9dU4fykydkC3n3mNZFot7GCO0OBX5ZDYBHgAswHWuS?=
 =?us-ascii?Q?wN+U6sdFNlmNtLoy3IkW+4JWxVjSFx+2nbXuppbGhg5/YOG9wSK73GLMh2Nq?=
 =?us-ascii?Q?bd8rrHNjZ5JsKBa2DxsIRJrPdLb91mHnlFeDNyMqQrnAid6KNSlmZzNiV12K?=
 =?us-ascii?Q?ZH/Fpsqnx4ibJxSifaLyzLgdlzRWW+T86UuC9vFjnIPqfjQckWYw863UqqtN?=
 =?us-ascii?Q?T4kDgP6mbzVeGHA0TDNPtCeRf7fT1o6sl4cNUdPwftztkla/2nAnAyTssQSj?=
 =?us-ascii?Q?d0HexWAGNp5kskQI4So+qAqlcwhuLPVG7T3ZGMY+VsCCzRk2uF46YvwcIVuA?=
 =?us-ascii?Q?sKS/IkHvx8R441W+qf2P4FVA1yiRFIfmOGBiNIFa09p18mNZiWbFMrDNSQPY?=
 =?us-ascii?Q?xNChihdPuDwQt7QvA4yQd0Uil60Cngw3jiE1Wzh0FPqPc14/MyMI2dpSrB6G?=
 =?us-ascii?Q?/VYiLbmKGaGW3O/IrFx3Hz64uIPOFoBlu3DJROZOVrEZt1Jwhwfmv0GiygQs?=
 =?us-ascii?Q?mXMfLStfl4PU3fDsNfOCwrwMGkdOGs05jSSU8edrlTy0lC+KPnj2ZCVa/sYt?=
 =?us-ascii?Q?nwq/HN+3rlDiyISLdU/uOlEwTGWusNqjk6xNE1s/4gfQSXd3hEbFKe6XMMck?=
 =?us-ascii?Q?EJqjGKNiuWeflB5eyNXhvtXgrjPdr9MOsIeJMmEiWzARzlpdpsjmlJc1Qbm2?=
 =?us-ascii?Q?XOyWlmqzoub1o1fIlQRDJtgokRK8X02jNkA7z/QRivi2elqVXkEkshpkmFtc?=
 =?us-ascii?Q?ZEar5cOBaIX8QXAVblHHP6E6iMtulVtNeCNXI6EbEPzEXXwS3cvSr0ZANXvm?=
 =?us-ascii?Q?Px4PIL9USoB7d+qn2Fg4GLstlZzefiH7YKv7+X7foBZO3TfpcWQgf2PELU4C?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8422c625-ed4d-46e2-50cd-08dca0d4204f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 11:33:31.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1F2Z8iRo0sGvfM3BAfeC0kVJUH2tDe/jaOhL8bmsTeZ1oowYdbervQxbndHJ/GnL68lk6JWudvGzUrYEWRAlkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: 10856d08795dbc4727c7e5d8b192e885a88e9694 [43/44] arm64: dts: renesas: rzg3s-smarc: Enable SDHI1
:::::: branch date: 29 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407092017.KXJYKxF4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092017.KXJYKxF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407092017.KXJYKxF4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator2: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator-vcc-sdhi1: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

