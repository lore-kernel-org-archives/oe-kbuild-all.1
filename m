Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7119A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 02:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741488444; cv=fail; b=T5F5z/Qz0TyGqfJBKo1iL/AbiqVm0dsATB32DFCTyhrIRbwYDdrkyTptpde+TOuR6GZjT+SYdXtdvjl+NtKCK2NQnfrNzILqqHFhzadeaJsTRIee4j/hABE0zkjfujr5//x2S+6A78VdEB8RipMFU5ioIGzMV7HZ/4RMktjJP9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741488444; c=relaxed/simple;
	bh=gf7Sh8U2Dzxq29ZYe/cBIHaoSM++p1p3Hm6DPcL1dm4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GNeCDfpWh39MI2NNT08iRJAsGuAnHWmsmx96qNmBObeq/Huej2UWk9PgyADWv6o/4SZcsrNmRk2oW3Mz6LeuR9TXYQKmqffNpxOxPEiRwL05EEf9cnWw/STD3erIN4It5TbYT0lhE/oC2FNojABvDzeY4lib5+qXmhrOjpeIAFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ja4iqfvb; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ja4iqfvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741488442; x=1773024442;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gf7Sh8U2Dzxq29ZYe/cBIHaoSM++p1p3Hm6DPcL1dm4=;
  b=ja4iqfvbA/9HPxpOvqeuitfd0bIJJDSlKReWRgwaLw2bfLJkgAvoFroG
   /wWYimIqS/FuVfgK4v55IX6nWwz+IbIDGYSwSEL+Pnp84VI8vwLTnpkuF
   P0Z86TxauaY/nvH3YO6TNMgGiLmQ7fxMSb+7nG9vN7zZV+Sl0wUQN6o/k
   miDk+//9YZDstJ9pOBPlThdkkOnK72CATZS7gb0BvZnhcu7ThFt3hzGS3
   xDUHFV9O1TK7n+roVlN9Kac1eVOla28vHFdPN78xfYRT1Q/Bp08LzP0Fq
   e/zYkLhZq8twToBPTTVclbeKeWN9gaKNFPIvVFOhgNrTFk/QHTkdUh9pl
   Q==;
X-CSE-ConnectionGUID: xhQtDkTYRY2vS3b/TqPaTA==
X-CSE-MsgGUID: k4AxK7COTYi9RDljxz6Flw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46421739"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46421739"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 18:47:22 -0800
X-CSE-ConnectionGUID: GpGklVTARVeni/+RIXLZ6w==
X-CSE-MsgGUID: yWIv8CBCSYSo7J15SkDfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="124263494"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 18:47:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 8 Mar 2025 18:47:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 8 Mar 2025 18:47:21 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 8 Mar 2025 18:47:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAgnowLr4boZNIkSo2X5hafL9T6r+V3caQkwL9qhVTMpLHpEVfn2Vj1RI5IR7UEqp7uI+XsYCvG0NDWPGXv+2rTjZ0emDaycI9F/VQE/zVJ81R4o3TWGM4APmMWkMHA1AJ3wY9QYvNuNV+wcp8yYDCMcgbs4YmfmS/t2Awv2U7v8ol4JbdnVgrJuUZLipvBUEMReYg423ov01+APDCKkAYvBjMZE3rkb+4wUNORcoDtFVXsr/b4aPhmVltKtKsZNuooiLJGC1gWTOtB3ybdbSWLENWtN+alir+t97txIYvKAhuR4+6oKlOrI41qPHM2ppImIPd+4F8FAzi2AD+JOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AH6p0d2vGAF79ZZdMXBSUqr7tCcnfgYP7TNDclz9os=;
 b=XgR7VKUFBsr3X3y+SolmlhVOt+rtwtR3bYIg62pEFcxsWaEy7UQWtn8BzZIdlSqiC2ff2g4PFhQhR6HVa1232vcKfYY8MbeBtxcuFXdvZ+LTXqoCjaMR23tEBPKjoJ+GQSQM16Baa509lLe2q5MiESxTbi6BF3zV25lGeJCdhNpNtRmvfVSZZcsVZKU1RCFQjZJzdF4eS35b+qtAPbVOG9b9Jav4xMb9S2nAIfsLcLdrTbYYgIrFClLhFMwWPeAAQoidfnigi1s8OsWFsdSA8bQNHh1P3UqbfRZdyNVvLXSnQV66DHOb8y9TFeKqlzEZgwEWU8dldXejcFpqcMLlzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.23; Sun, 9 Mar
 2025 02:47:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 02:47:13 +0000
Date: Sun, 9 Mar 2025 10:47:05 +0800
From: Philip Li <philip.li@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [trace:ring-buffer/for-next 1/12]
 arch/arm64/include/asm/memory.h:424:66: error: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <Z80BKeOVcmToj7Gw@rli9-mobl>
References: <202503090135.MkaxUr8M-lkp@intel.com>
 <20250308131943.702eb9d4@batman.local.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250308131943.702eb9d4@batman.local.home>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SN7PR11MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4b2a6f-9412-4222-3dbb-08dd5eb4b246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lLHAx8y4suCbdTqhYrE64vNOAYa7HrV08TeV8+gWrORsluBZafEi0zo0Epsl?=
 =?us-ascii?Q?i/7LRRDxfFZYXpdkw+HMAsnqyoF+uDNZTXSzV6uKVsfcFJD1LXCADqO+91Qv?=
 =?us-ascii?Q?BiTV+WecVm9xm19S94X1fc0VbCpeYCy8UC6M08mpKdwJy8Q0O2PNqauecK7z?=
 =?us-ascii?Q?F+O2I2TRUKKwdhOdIELbkwxNFfIuToliScTGMHouU8CO3cteZ4Ryowfkz4f/?=
 =?us-ascii?Q?91/L6/jWnYM4A4oiaCf7ME8V9cQfSDh41kvVBSdjjXiN/cPSTCHq2zcZEnc3?=
 =?us-ascii?Q?dFQ4Dx06BmT+NpZD5SBCq/AZSMSVSu8EaxdPUXFyjqoqVqBQ5+yQwS3QSRcR?=
 =?us-ascii?Q?y4BAD/mXJK36kW8iNDoZgod5o6FIa7GhLNJDhD8++nBLfi+XCWp7QPW3m4U9?=
 =?us-ascii?Q?TDIBsJD3reEB4ISIAwUgi6ZboWXCgaw+aWcK3zGW3fqb77JGRqnFV1OKij1T?=
 =?us-ascii?Q?GFClfJxp9bSYW4/jrcvHTHiA/GjExER4QNDGZcUpKKuZr/3fUPGCIBOIYFR2?=
 =?us-ascii?Q?3cqsvSxK9BJzeUIhlNQdj5OVpN5ER4z4rQNl/OIj6EdOnhrCA+0wb2Y/ByBr?=
 =?us-ascii?Q?8HVNjmxNvY2fwMHvFQ7SnTJLbQSubaQZVnl9iAi/6Ms5xCV8VJnbTjsM2PeB?=
 =?us-ascii?Q?ojljNQo8dLJjLarSznU12MnbrUVt4JRtcAqgY3DKeqj8ZOZZuT4CugRMYobs?=
 =?us-ascii?Q?GhLsetLAJqvfG98arzMx65T+DEpDR4Q2qxeC4/ZEIw9VOzCKPX+Q+Ew15LQF?=
 =?us-ascii?Q?VpsWL3Ap6reEydhoq+bBLUNXXGzrSHCOE1zFel3344Xvfixrcev5E40I+R8Z?=
 =?us-ascii?Q?4Ui27gz//DEGj5sSf8KBgFxEH7FHyt0UZv/yfWcu+mTcru4RprLMIKnnU3jf?=
 =?us-ascii?Q?V5WfQEgzMAYjCI2E0DxrlKSznKQpXa+UUr9H2eZ6/MhdfH8h7L9maR5LXETz?=
 =?us-ascii?Q?dgNK5cpbM4ktRSjLZozQI4+x7dCnYZ67jzlagz5NC9gnk/CKj3D+RuU1zxtr?=
 =?us-ascii?Q?CC/pGgzzieyjR7BLJ31xYvB2QEBLRsbFDiF4k10t5eK8CqUwLAaxklSG32cA?=
 =?us-ascii?Q?oHtJRcr8OcBkZrB3AnFKZIP6ktmaaB4Qb04MYncn+AKMMAc5jjZfXC3d+x7D?=
 =?us-ascii?Q?RNmzsV2tzVoQDfmgFT8bNQymKCVc+QzSAQNWogR+w2m3YvWbhay28UU7mfbT?=
 =?us-ascii?Q?/nyskUQapnoAxQe0U6u3oYNNGVAUNmmU0QyjwzGsdbA+BHCLGA1nUVIHqYZM?=
 =?us-ascii?Q?ih/KR39+fX3VYK73yVDM765APEt5sTDE7IWZhu+nE69f1dV0aKuGRESuL+T7?=
 =?us-ascii?Q?eh5DTqvTrIiGyW+JUpFSmLe5ZjqiUbMlpgJg9tWNtdL284398QPkcMn6yUMh?=
 =?us-ascii?Q?mbe5TzftVikS0s9mCSEUozWzelAg+BMXjqYaQ4OoezSG/O5IuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnzXGPZW4bKzc9bE9KswQBwfNVvgA0cmWAqQqds85NTfqUaW1Ep3Yn68mo8/?=
 =?us-ascii?Q?2pxnhW3ls3muUIM0aXBMoCchaIiAMaXZTXUXXgkwoywcMJAU7LzctsAPPOXf?=
 =?us-ascii?Q?1yAoThs6A3CMSkd7u3Gmm/6lr1aJ/gSv94m++I6SXaPicep7205HlgGhR3oB?=
 =?us-ascii?Q?tNvrH0JlysxjJxXmfSlexXioYhZChkaMBgnL6w7RRnLOI1nttxshmUK5M5OL?=
 =?us-ascii?Q?9qaGmiIxnwYGrAUCIdwfbDhPwW5cqX2PM6hrLELh3k35UZOXTuGsXXhVwAXw?=
 =?us-ascii?Q?s8w7Vl1oOaJCwWJGicX1j2D/cYx9gQlTkTOdbUfEA7lyKJi3BBUVf07Bc7HE?=
 =?us-ascii?Q?s7oEGHqwOc17MCa+8f8yLrDZBCr0aiJ6UFO+A8mR22zENoSSU5YJ1Nt6JIDI?=
 =?us-ascii?Q?SoxZS3iFQDch2zI8g49fh7wqUs/whgdapNTU8yNSnOChwVEDlGtT4wRlsrrw?=
 =?us-ascii?Q?qiq3dDGRRin1JHYDCehtyYQUKZFp+HgCuSBZbyiYEXFDu5IiRoT/bLym5LZy?=
 =?us-ascii?Q?kQ5DEop4tl7qz9E2C3XYPnzjRtodRHYrLK9iw8sOKgcKx+4jCYiTs022fNpN?=
 =?us-ascii?Q?GMuDQxHdmRk4SNhnHClveVmQ4WsLtWx8UGSBAzNsIxBV01hU2dqj4zeXQuEJ?=
 =?us-ascii?Q?m0rk7ykXSU51tnSlDj+toi+uXhBP2p0BKtJPU68j70aodXpY4wWLUi3ic6n8?=
 =?us-ascii?Q?cevAKmZ9B3HGjUf3Nu4OxzST6MfVtAns17qWJq17Bbf2jwQFKajvi0Rm2xfp?=
 =?us-ascii?Q?tf1Lj6ySrT1Qr29atAO3F0VG6qBxGBangNQoipSS7O3jqJxzkF9IH7PBFkks?=
 =?us-ascii?Q?6aYYzbmtLA4+KkTdvEjQ/QjZ6r2bg3IlJcAflS7pxbkR0ZDNETFDO+fSiekq?=
 =?us-ascii?Q?qcVG145VwJzfiep82Ci7Fa3Pve42LEVNvMEIyagM1ZQi4klgTCVWZu5I9a4e?=
 =?us-ascii?Q?ax97UJyAXeBji3BdsDVw/lnFioJynA0MvhncDd2YoLdmRjBihs/jaEwx0UH6?=
 =?us-ascii?Q?FEjuOMaQhZ7cBp784/h8kKfVwFbMOo3uzN7t2U2vcWpLa3t7Mc73UOalW1kq?=
 =?us-ascii?Q?IZ6ZJ8NJuDCT8dRsnuwGrkN34yhDhOqcBRgmdXBH18QNqr2mzEZdnyE9Mchp?=
 =?us-ascii?Q?ffTqaBaone9E4WrHEKOanWubgQ5RdDnzgJX8qRgsr/8iwR1DaXBTuaQSynhp?=
 =?us-ascii?Q?vjVu45CyvXeupDFGGtTY8WZoJCGVB0+GfqqGIjcu8Wk2xr8lJJOOMJu9vqii?=
 =?us-ascii?Q?YcaDQhrGB1f6dpVOOELEHsKU8G7nMdx4yyNUFwrhoepyDXcDmynmZY1G5mQD?=
 =?us-ascii?Q?yVhclLaU2hXpKb0ggrS7TjcWgocDKalxRWsQ9YO+1aeomlJrnRWJC+NfDXvm?=
 =?us-ascii?Q?pdQRJozzvEhxDYNcGy0fbLR5PAuQw9BEEOzUuoe8OvL7m6RxYXkZiX2diA/1?=
 =?us-ascii?Q?nX2dAGARRnviTJhvYrGISE9q/KocKOkCnZ4P9orhs/VCfnw+NI87l6iN6KC0?=
 =?us-ascii?Q?siQo7q30waMnLzF2Z14I2vYcTsL48HFvl873foxNpvzn0iYe+7yMk9edxynt?=
 =?us-ascii?Q?e67b/az1npdkmWlXgGY5M1XQyyQm11O1S52Dbhwa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4b2a6f-9412-4222-3dbb-08dd5eb4b246
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 02:47:13.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aTWc51YFsQ6Pg6+KuQ29/T/rjJa2AwfrgO8pkfstwGDAd5sKf15oTlPuicKLqqRLE48BNO7YiNft7DYk+RJUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
X-OriginatorOrg: intel.com

On Sat, Mar 08, 2025 at 01:19:43PM -0500, Steven Rostedt wrote:
> On Sun, 9 Mar 2025 01:48:17 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> >    kernel/trace/ring_buffer.c: In function '__rb_map_vma':
> > >> arch/arm64/include/asm/memory.h:424:66: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]  
> >      424 |         __is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));      \
> >          |                                                                  ^~~~~~
> >          |                                                                  |
> >          |                                                                  long unsigned int
> >    kernel/trace/ring_buffer.c:7093:21: note: in expansion of macro 'virt_addr_valid'
> >     7093 |                 if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
> >          |                     ^~~~~~~~~~~~~~~
> >    arch/arm64/include/asm/memory.h:379:53: note: expected 'const void *' but argument is of type 'long unsigned int'
> >      379 | static inline unsigned long virt_to_pfn(const void *kaddr)
> >          |                                         ~~~~~~~~~~~~^~~~~
> 
> This is the third report of the same bug:
> 
> Other two are here:
> 
>   https://lore.kernel.org/all/202503090238.GMaKCb2n-lkp@intel.com/
>   https://lore.kernel.org/all/202503090029.zj0DretW-lkp@intel.com/
> 
> And I just wrote the fix here:
> 
>   https://lore.kernel.org/all/20250308123649.1330e9ca@batman.local.home/
> 
> The mistake was that this was only tested on x86 which casts to
> unsigned long for virt_addr_valid() so it didn't mind having an
> unsigned long passed to it. But other archs expect a pointer.
> 
> Could you update the infrastructure to not send the same bug report for
> every architecture it affects?

Sorry about this, i will look into this to optimize and fix possible issue.
Usually the bot would send 2 reports at most for same bad commit, but this time
it sent 2 errors and 1 warning for this commit, which is not expected.

> 
> Thanks,
> 
> -- Steve
> 
