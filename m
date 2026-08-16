Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A13CB565
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 05:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786859593; cv=fail; b=laY4DumW5jAfrOU2J+PA4yo/SHC/CNPTgQ51GCAhAuEn2nhbCQwKX/o5XRhkgoGM8dz2aBC4HS7z8SwevX6D8H1+466P9lu1G1c54VKCEbqKStjr4bMFaLg7Go3tHO0U5hEo10ygpgYIThZDzyETHhXKzcaeZMcnAVVmla40co8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786859593; c=relaxed/simple;
	bh=M65RzOjp8+2a27O6keiuD5+l+bo7idPvQg+X/pnJSNY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T7Y9hUxQePzs/1rdXlh5lDxldE8fE3wZIXEEctopUDZhKO1G0tD2WuzUS6+pw2eH9/NuEYdplIDNVJRrGxw/shIfVYDvilZZTyJNN8/zR75FYR7WeDHEoINpCYUlE7/T8LuEtfwa5Sa9WI+xnxbb44Xj9hul/sBOEUGmCCl6Gi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DB/xY4JB; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DB/xY4JB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786859592; x=1818395592;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=M65RzOjp8+2a27O6keiuD5+l+bo7idPvQg+X/pnJSNY=;
  b=DB/xY4JBYpn01FHr2TqfO1hnUkfx/GvilG1gK4svVMt8s3CksUrKNJ+S
   eoQD9DEA0yED+H+61va24sW4EvOCGBVE5Z/mPpjb64zOu+CkSF4hOVeOf
   zv4UGdMLvIIgrmRTNsh4EkluUunr/7XqFiUjGsmYjtJgnoc/mR21kS28s
   qfWDnQcEOUyyAqy6O+19v2KHjWXL8ejb4zJIV8lWMseAt/DlIol/IPC/k
   Tq1bWca/f5UBOgJuOkDC3EEr8kZg/Pt0gmIhRbr7QtdDj/jNQQsMVwBel
   QP+54JIr5dkv6W8HO2tpvtdwKbGqhQYEKJgKnUOYctmJaEvGNnJ2RSj/4
   g==;
X-CSE-ConnectionGUID: boOovDzlTWy9yK0WW5/y0g==
X-CSE-MsgGUID: 6WHfmmCHTU6ZtogZhcwQBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="104753930"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="104753930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:53:11 -0700
X-CSE-ConnectionGUID: DqNYo11SSGOefLngIb/vNg==
X-CSE-MsgGUID: 5eVhr0tNTemKpmBkCapXOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="263268343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:53:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 15 Aug 2026 22:53:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sat, 15 Aug 2026 22:53:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 15 Aug 2026 22:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjdKZx2i7DYMdwK2uxX61AThpJNFw+m7wJEXUwJUjDF2fnM/4CNEt4KBVFjXs5TS1Ptr3ClTzA3/i0s3sg+dZYTqkBDQHlW3+avkLsmCkL5CMUJRkqE52l30QZYxgHeaKzUdJc+ZJffUQARg5EndzYKo+G2DuQlmVKGGVwKZLSPcN8Iuxk9PmwyslRJHc/bX5xit4/RhfBO/dHV+ICJSP6t+0wxgIT3G+Fs4HWbVGBpbdw/EqSM5tKKoNwVRmao3f8DH4rlxqLYcpjjRPqVBG2U5B6jNMAXFZnIqeUL8H/ns2n3gqJ3vyZ8jgHM+cYej0RIIHaSVtyFhUAzeb77cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNoW0oRWL+KkYPFv4gP1EKlSoUiBb9ysTEpKAYM3UWg=;
 b=swSSNTcslcAWMzEJWbLxmCyrbKXWBpC+iV+OodCCnagDrkfL+RfpfFVbWDM5wjvRupoQ8AzLzLh9Eqpz/pNkEF1kpJU0/ZuNHqasvn2o2zWUCdacMpGc1AoiFC5CEHGw9FqD+ycNy/CWbG3dmT2lqNvoXhuotZYfU4578D9MuOsVEDOJZhI9EWEduTVnnpp/w56L0OAYvV1JwHsQzx9Tpbu9GEpNOiq1VKfRTzl/nonplx/87mwCvWW2gCKDNeUDw8LDhqYsrp6LjEOLgn01mAkW/1wY/YwS726r5NA1kK619x73UOO3SV3gK2TYAYPzGNVORkP6KLo/cFGaDUSS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 05:53:02 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 05:53:02 +0000
Date: Sun, 16 Aug 2026 13:52:56 +0800
From: Philip Li <philip.li@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory Management
 List" <linux-mm@kvack.org>
Subject: Re: Re: [linux-next:master 8777/13479] mm/hugetlb.c:3095:39:
 warning: array subscript 4294967295 is above array bounds of 'struct
 list_head[1]'
Message-ID: <aoFQOL+m2xMu4gn4@rli9-mobl>
References: <202608070433.x3vNSfjt-lkp@intel.com>
 <20260806163644.20229f5ab7cbf176edbf2613@linux-foundation.org>
 <CAMZfGtUdQqMVJGZP9MkqTcxaOQX=jmBi=BgESLVQy4ek_9pMjw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZfGtUdQqMVJGZP9MkqTcxaOQX=jmBi=BgESLVQy4ek_9pMjw@mail.gmail.com>
X-ClientProxiedBy: TP0P295CA0009.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::19) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: faf2e36a-6132-4363-df3a-08defb5aa28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: d6cpO7d4ldam1dPmS8d/zVheaRx54PJMnUxrlwHJyiMvOJ/f6melq7ZFsYUdd5wWun/4TPT5XSln2uQrBt0sv7zxNoN3Sv2DpXhUASxYwFxAaDq37BTK0rBybvEKg3ItrFwaHMEKuCUQNvcUHEuP3WBP18ZYV8eqvZYbGx9K8iScLHZ818BNq6q8CCnPZH7FSILhTtN71jHvQK7cvpoVniZh0VMG1PlWfc3Z8rbqIQMrE1/AQg7UA2qlvESupVDNY0ziQYt6w0rvFNuA1wMXeJ5qWf7vOBj1eQCiHnH1oIQh47QTgkjx2mxB5oVumsP/E1MW/1vuCUsRNGwC0FFQvHD7XWpHDC96S5TRRL1IYX9rYdT4Ol4XkU3fC6LOOOrol5Fnx9dlEvFiByImAFiPITt90F9xtKOCYTB7CpKYtLsMfW7ctlfVyQpOec4VNgOMB27f1e8L1wDByjudHNFSB2H115dK7mlotn4iLkqk9m4sMcivuB8P4bcDqhhQQmmxsw/0winaU0d5uksDEw97MRkKviVrReekHsRisXktOH5fIGarodOGtjWiitTJdmRj9PkuSzetSCrH9PRzwYX8rB2lEVEEDa6akSYQy9VJrnEa7cXqXwIQ1YerHLgKeMRwlOYB+xDbxt9YjdoxTo7A38f4xHI5L8bCQdrQSunHg1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnBzcTdISXllb1l1RTM4K2hSSkUwbmhlS0oyRmhnWmV3YlhrTzQ0Wk1JeDla?=
 =?utf-8?B?b3JmSGgzWGJoNG5ZcnpXVmJpM214dmxrdi95cEE3L2ZuSG9yNDh2OEdjZTRo?=
 =?utf-8?B?WVhpU1VFZi83NkJLd2t3QjBwelpDQ01PUy9RaFNSQnhjMm1IRW93VWgvV3U2?=
 =?utf-8?B?SFJhek1yeHhGSC85ME5ZRkYycDJlLzlPcGdVMXRGSzFpemVuQi9KTk96RFdO?=
 =?utf-8?B?SjBXQithUnBmMktPQU1WbGZneVZNMVo2VTRlVkFPeXFUemlHM2xyZWVNL21v?=
 =?utf-8?B?U2hLcFdCUFFjenRkem9CN3hZQmVrOG9qNHd0TmN3YzRhQS9qWEg1TTFzTk1r?=
 =?utf-8?B?MlF1RTlCdUY4ZzVGS09BWC9lTEhJNDJxYzd6SnBmREY4TjZhaTBpY0VpdFpT?=
 =?utf-8?B?eWt0TlBsZVI5TVdlQkdITXhoTldhNGJvK1ovS242SW9PRElIMkxDcTlLTCs1?=
 =?utf-8?B?MGJ3M2w5MEY3R2IyeDZUakkzL2xWTkUzM3BFWGNYNWNzZXZHUElEa3hnYUtu?=
 =?utf-8?B?MlFOb3ZMRGFwSENxeEtZcEx1Z3JkVmNLVEtFSGNBaTNKS1ZyclBjS2VwN2Jv?=
 =?utf-8?B?OVRPdWZNTVhtaUp4MVgxbjFzSFh1dFBtTkM4UUd2WUd3a1hKSDhEbXVkMWZx?=
 =?utf-8?B?djkyWmtDUVlsdXVTZzVkMXBIYUJtVXJCbGt1U2tLc3dZbUJ5RTJNUWhFbEZa?=
 =?utf-8?B?VVU3SGZ5clppNHRpRlZ5L3QzV2hvWjFCcisvQWM0VkFzTFEvQ2FQb3RsQTR5?=
 =?utf-8?B?a0hpL09ocm1WQ3laOHRMRHFVcGhQekx0Z1RvN3Q3bHA2YUxvR3RKeGtqQW1l?=
 =?utf-8?B?VmxsQVdKWFpQZDFYRFdWRjBLem1Pd25XVGN4aXlvVnNFdUlTc3JHalVqZjJn?=
 =?utf-8?B?eWlTRWN0anlTdkpBRUJlQWhTMEhCdzRmZ0VvWlZwa0dpb3J2Z1ozaVp4YzlQ?=
 =?utf-8?B?d29TazBpVEc2UGUyZThXR3NIM2FiZVFRWXArbUpyVVJMVU9PYUE5Y2dPdDJH?=
 =?utf-8?B?dXhBa0ZDdDd0YU9tZzNZaVJTUktva3R3ZzZ2eHBGTmM2aWlDVXprWHpJK3U5?=
 =?utf-8?B?SDliR25qQ2hCc3RUa2d4R1R3V1dZQmc4a1lDVTArNGFPY0tlZWdnU1YwRklP?=
 =?utf-8?B?VjJaSXhSbjZ3M1VqdG4vWHNBaitsUDBVTXgxQWl3MWNtTUhsY1RGbmpHUDF4?=
 =?utf-8?B?NUIvOWJpeGo5QktxWCsxbUpqNEVDQjY2VVZ1MzNtazBidmV4cGZzbWh4cWhl?=
 =?utf-8?B?MkNtWGtkOGhSOHNHOWh0dW1ldXZWQnhBMlRaT0E2dHZ0dFZpRFU1ZTlhUjNu?=
 =?utf-8?B?S1p2bmNUL1NyM3BCb3ZnbWRmZVphQnVsYVBLZDhIUmZIZ1NvQUpyL2YxbXhJ?=
 =?utf-8?B?M05zSEtrSGpZa2ZZcTd1ZVpwQTU5c0V6R3pGVHpmM2k0WTl3WmFleGFpNlRZ?=
 =?utf-8?B?ZWVtWlhIUmpXSE5JU0s5U0REeHZPckdQeVVlZ2JZSkdON3Uvbk9yaEkxSVBD?=
 =?utf-8?B?UW10YkVBNmZjVzQzc0Rjc3JWRUlWdFZmY3hqa3g4ZHFhaDVNaE9hOGlyK05s?=
 =?utf-8?B?NWFmUGJNL3ltaldHdnhqQytxVDBSS0k5QXp6UFhXK2UxSUNsV1VIVUZUcUI3?=
 =?utf-8?B?OTFYcy9jSVBwRkVscG9TcTRlYUpiN0ZnRzBZS1o4NU5CTjQvTVQzdm9TYk1R?=
 =?utf-8?B?WnpXeEN0eXpqV3BxMnhBdWU2bjloTlVQVXhQeXRkNjlDZG9YdmFtRzZRSkFw?=
 =?utf-8?B?M0FRemxpbE9aZEp1TGRwbWY2M3FXbUgzaTFrZkYrcmg2YURGdkQzL3BhenN4?=
 =?utf-8?B?MEdFUnM2Nk5PRm5kS2sxUytqWC9KR0diRjNIZjlwQmF5OFJBVXF4SE5ENTVq?=
 =?utf-8?B?aW1MblJUSGRBYXk4aGhINGM3eEJDd2JaOFNpRG44UksxM2sxMWZZVC9DS1FR?=
 =?utf-8?B?M1FUNXlqSnJCdUlvdWc5eTBCVGJ3SXJmblFuWTU0UmdZalUvaWxkR0gxM0h4?=
 =?utf-8?B?dURuRmpMRjRNYU9KTnpGd0ptU1VlRXRMYkt1citZNXdJNmhocWJzaFBkUE1k?=
 =?utf-8?B?RzhJN2pjWVg3VXZVeDZERzRWNDl3L3NHZmltdjZqaVRXejhBRlEyamF4NW1M?=
 =?utf-8?B?Mmp0MFhtSmsxOWt1MTlVUkk1NGIwdmRMeUtpdndKYUdDT1RSTkNnQS9KdStP?=
 =?utf-8?B?WGk4VmloemZnRGlXNkVKTmRlcGFPRVV4M3hQZlhCZ0wzejVvRFpnUzExTnpF?=
 =?utf-8?B?YytiR1ZJdmVSNEZpR1pJMU56M0x3dnV5TmU5YjYxNXZvUC80dzdxV3ZVcHJM?=
 =?utf-8?B?TnhWazdzODlBODNwR0poZ01ZZlcvRzRuNzFxYTFWelV6Z3RKVWxaUT09?=
X-Exchange-RoutingPolicyChecked: M5ZdN5XO55wWtUAI2b6o8f93ndwcUyXgH2WsufgMNaAgiq6u1ZZszkZy6v8Qfmz8Dvpw/yUtlpf/3TLuEZ1grM2CASx+Qv+lEpb5R+QO3X8DzIM08haXXFDa5u3fFke4H4MM9aHf4aY1L07yFjyIixdGGAV4oQrlsKeOzghoJNzDW7iD0L+3jTDb3m2rtpamUWQAHU5t/dyyO2TnYLVVIJaFeI5x2TJ2mBNl5bjyALkONv7h0oncks0MKBxkW6caQko7a/A2/u4MJ3iDNcgPBC1or2NvmEifUM6oEc3NOaPC0ZDSBsaGt2tpoLKrVm+CWdv0cRFqIY4fubaDrLLnRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: faf2e36a-6132-4363-df3a-08defb5aa28c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 05:53:02.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRoK0RfgIkNMWJm494voix2rwQv5wiV3QP1ycoC7e+trEVjn8NNdua/i/z+S4RUnnGAj1U/0S4qoj0akmFjzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
X-OriginatorOrg: intel.com

On Fri, Aug 07, 2026 at 07:46:30PM +0800, Muchun Song wrote:
> On Fri, Aug 7, 2026 at 7:37 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Fri, 07 Aug 2026 05:01:04 +0800 kernel test robot <lkp@intel.com> wrote:
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   ea2bff00da89d7767d677bb68470130ba96f4928
> > > commit: 20549ccf4da49ff6dcb35ffc741f92aa92e07aeb [8777/13479] mm/hugetlb: free cross-zone bootmem gigantic pages after allocation
> > > config: parisc-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/config)
> > > compiler: hppa-linux-gcc (GCC) 8.5.0
> >
> > Such an old compiler.
> >
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202608070433.x3vNSfjt-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
> > > >> mm/hugetlb.c:3095:39: warning: array subscript 4294967295 is above array bounds of 'struct list_head[1]' [-Warray-bounds]
> > >        list_add(&m->list, &huge_boot_pages[nid_request]);
> > >                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
> > >    In file included from mm/hugetlb.c:6:
> > > >> include/linux/list.h:163:12: warning: array subscript -1 is below array bounds of 'struct list_head[1]' [-Warray-bounds]
> > >      new->prev = prev;
> > >      ~~~~~~~~~~^~~~~~
> >
> > Well crap, that patch has been in there since June 12.
> 
> This isn't the first report. This is the second time we've had the
> exact same report,
> see [1]. Interestingly, the GCC versions are all the same (8.5.0), so
> I think this must
> be a GCC issue.

Thanks for the info, we will configure the bot to avoid sending such
report again.

> 
> https://lore.kernel.org/all/202607010945.6lDjBFTU-lkp@intel.com/
> 
> Muchun,
> Thanks.
> 
> >
> > I can't reproduce it with the provided config and hppa-linux gcc-16.1.0.
> >
> > Muchun, I'd be inclined to pretend we never saw this.  But if you want
> > to address it, please do a patch against mm-stable with
> >
> > Fixes: 20549ccf4da4 ("mm/hugetlb: free cross-zone bootmem gigantic pages after allocation")
> >
> 
