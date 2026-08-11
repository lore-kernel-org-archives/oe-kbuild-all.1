Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5EF330D4C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786425167; cv=fail; b=o2Fsc4uR+E58jZBdNN2IlSyHjibkdpeWKNLtEpQrpeC1Y3dQV9xBIFxqkYvrenLiZgs8rQuEMySWsSe3GKosXdyr4i5BvecLGE4GQKTNxSXLkQ8G2a9IS2w94kAw1N883rIAqjAM8QJIIQxjJwxm0R1JLGJFV4q4I1uOcBeXRzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786425167; c=relaxed/simple;
	bh=gy5j40JnAvqyplwvGzI5JZpdYE6vwxO1UagVSDr5wfA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tzYcvNxTmsqUJUW8obItgomvV0UcerRTR1eDMrhjbwJIxNxEY53kSi5NEROqJL9mEEfJQfIZQqf7raXEaS5q3A8ywHDBkNmTmjpeCceSCRQuuqIWgZV8ist6ThBvoqyNfwsyfXlFxMctDFslG6xo3bdazN9TI9eU9KmRoOw9xpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZnpHGZV; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZnpHGZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786425163; x=1817961163;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gy5j40JnAvqyplwvGzI5JZpdYE6vwxO1UagVSDr5wfA=;
  b=iZnpHGZV9dhMTk/ZKAy4nKCbTKK4CGO/8QHAifCeObSgOR6xEeE7F4Gt
   3cDAMc+grYaYTq0YcSQMVtFhvDMc3EN6Ui5NLoDi6ENT3RtnkG5IlUbTa
   2v/yqXRinwCh8EY1xh13FpGu+GiktrzAMZE963CgxcBvsuykXcj6Q7QZC
   vTYw6BK9x7ytCRmwi/H0QpE+LDCEOifdP2L+ILQFUzuwAPRFhYr5U1c1b
   EA2qYlDrBmsNid1heGUVFQwSIaDH2GckjpVrdZCylgYai7ZOA/XIkOoH9
   IlCoSlOq5jW3uKzKWsv6U0nfqaCaCg84sFhJGbOGY+4q0d345U8b1sPip
   Q==;
X-CSE-ConnectionGUID: 4Iby8nbQR/6/lj0nPRZWEA==
X-CSE-MsgGUID: 6CT+URE4TZuwQeBSYGsGwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97545383"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97545383"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 22:12:33 -0700
X-CSE-ConnectionGUID: ZrY7/aloQoyNDDQhdRzKVQ==
X-CSE-MsgGUID: eqkSp5GgSlSjpIHYtUSoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259925452"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 22:12:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 22:12:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 22:12:33 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 22:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pde+4sQZ2EOtbX8X/KrVz53mX7UmW6KiYYLDHFguRideHNLNHjYbT8QoWXuDwfYsXfsUw5efa9q9478enSA42bQtlrOcy+AiL7nUNN8FvFCrA6sUFp+b91rQnTxsISJseL9PGtQQhnccs8++qDLrd8ufhhxEMOM7exjQKmWgfNkl0qXWi8kSOodi74+GuR4tJNm2rgmydEijTB5JRwybNRmpfgJ8gzImshfp7Vps34dODoSr2M1h5FbrsDFdULwQSGG3UqCXrJSq7vOF4tgVqkB1Md4iFfECD/SnpQXi9So3HPJf9KTaH+E94W8aFpItgKTXgfMdU6YUr5ZEAzsbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v8L0TwG08eZ4XZwpG/dq9iuDx5qvexwxrtmwglbRAE=;
 b=kPPhvpEx8MfP02iK11xAl7+i/1q8Oz54p8rcm3AxDLYJPAb2KYYsKqk+Rh0Mf696/55wup5Jtj0+UZQc3lgHPwpQM8VZNbJykbDD9ZzPkbryUFsSRnHcpiQkGmE6vn7X6heYigIjbChIPzvlnSf5PajoR5HfH47ZthsyIuJAgeh0wMz7DhTIDzz8g5O/t2j4nKUyeZPLPeNIAyylHqfKFCoA6jEhhFeslStggbEJiqbklcjDvFe+0HbRpLs7PXJpiP5gr8hAIKfqcYku6+cdBSNtJRnJFXjGssLcCdff36YXJLcEPGQEM883AK6bVrIuk6sQEmLTwe2vjcqCGX5/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by DSWPR11MB9714.namprd11.prod.outlook.com (2603:10b6:8:354::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 05:12:31 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 05:12:31 +0000
Date: Tue, 11 Aug 2026 13:12:23 +0800
From: Philip Li <philip.li@intel.com>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
CC: <lkp@intel.com>, <13667453960@163.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <kees@kernel.org>,
	<linux-kernel@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: Re: [PATCH] lkdtm/core: fix resource leaks on module init error
 path
Message-ID: <anqvN8zNo+IferI2@rli9-mobl>
References: <202608051446.cKZTkVXV-lkp@intel.com>
 <20260810014815.76401-1-yijiangshan@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810014815.76401-1-yijiangshan@kylinos.cn>
X-ClientProxiedBy: TP0P295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|DSWPR11MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: d1046c90-3699-43d6-a1f9-08def767255a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oXEPRcCS9ZTg7UYV8rVOWH2N2lbYB4vNl96YBvLhudgZoyylpreeFCrHPzkqOMuRTp05zUs3Bj04RsoqsrObhw84tz+c1oN07D+k+ntfRlI2il345f+O9S/T4n20h6/ZWUGGx+kELDTUgwK5FZAGX44izg2FyNz8Xukd420eIlDaoiNNSLXSXscn2IaYenpmUxYPmVfvNuoeQeZKS3u7mqgBMIymD8D75fJqmXplnzGOxws6/3VwHiXMKlzEpFDyEzYWeKdl4H0h0HWoc5ByXhDJApc7QFeqZs0chkzicty8Fi63Y/eXTgspRANWONS3UmVU4bKs9IiBJ91Qa7UlmZyZ09GIXw+QUzx2gEft0mfZtdq9smVT421W8bzt05RNha4jT++pHmdJa2eZgZTtacTaB96h7usjx/1mct9YJZVWL+HBOjZWTKQE2mPFI//voRmTWzcbtMeoMrcxBbbex01xooEixkHmiqR8QI5IqOMmnwgeGd4wDg/Xtg+VWD4b/1ZaD8bx+kVKW9rqBs1wDSDENdvJ0+ps607e553CqOTtR2xHUA2/CHsUeS3UXqkjQdymBvMyhDGOVc+EZHrXaarx1lpQG/x+ILe4qKu7Mb5j890WvgyM928LCDMUnhYpgdpqPG+MfQ9SvsI45We6iquP/sFcFjt8bE+Q6D5LoMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFpZkR6Q29BQjlXNmNYeUV6SnlRdVU1MEFHUW9iVE1nWVpYREk3UFZyWHh3?=
 =?utf-8?B?SVRHeHYwNUxDT0V2UUlkVDRUM3RkTTVNdityWVBtRGlqVXhkUUlOZ25vNVRy?=
 =?utf-8?B?NmpKNDZhaDU1dXB3MlJXdHVMdnJHUyt0MVB3cGxlcDZvU3ZJYUpzWVhiM2hh?=
 =?utf-8?B?ZHU0Z0JDai9yUlN0K2dQQ2s5NnBpU2ZCUjBxdHFGcEtKMEszakdMZ1lBNlZT?=
 =?utf-8?B?WDZLZElZdEsvMFlEQSs0cU5rM2tVS3phTGZnQ3RLKzBmQ1N1UlByTDZKMnY5?=
 =?utf-8?B?ZGxaZW56bERDQkJrNEFYL2l2ZVRLeXhJallVV1RLYmJlb0Y5Q1M4RnN4Nmcy?=
 =?utf-8?B?OWwzbE1UNXFrSy9VK2lUME13bm1FSi9GelpzVTJJUXVPdGpJcE9sUkJJc0Fs?=
 =?utf-8?B?bFNZWmZ0UE9lcVRSTzhCT2hVSzJ3ODdoMVVqYktnK2VuQTFCays3MFFHN1Vt?=
 =?utf-8?B?SVZIR1ZFcWRiL0RmOGVneVdybmc5azJuaWdCZGVZVE1uUlRqYXllSmhHUHBm?=
 =?utf-8?B?QS9vV3QyQW93dTJWaVZnL2ZJcU5yZUxDT2x5VEczWUE5eDNoeUZqWVdKZUcw?=
 =?utf-8?B?c1JSeHdmNkRXWWJYSXBZOXFCMngyaWlUTWY3SEx3NzJUSXFZSWFTSDdwUVoy?=
 =?utf-8?B?VGN4ZFdqUFowb1pRK1dUaGRRV1Vab1FMY2pxOWt2K0E0TWR3b25ySGxSei91?=
 =?utf-8?B?eU4rbWJESFMrTUhnME1xSWlUaUEwS2RzVllyTmtIOGFEbm9pOUQvZ1U1TGZC?=
 =?utf-8?B?blNKSGVBTDRMTGFVNFBNeFJ4RnNHMy9ldnhGWkpObEtsbmhsaDgrNjNNOGh5?=
 =?utf-8?B?N0lrb1BBbnF1VUI0czVoYkc0eWY2YmNjaUpFMUtCZSs5dFF6SUlTeVFkVTVt?=
 =?utf-8?B?Ulp3TDQxdVhiby8yRnN5VGhQd2NUOGM5NTFHTVpqdDluSlhEbDFBdEVvRXNN?=
 =?utf-8?B?Z0h3K0ZUOXlhSndvR214MzI5Q0F3ZmQ2ay9kM2FKYlJabmNTRXJZVC9BckNq?=
 =?utf-8?B?bUpVcndaeElXRHVndktqakUyMDlrcDVGalZIKzBQSml1Sk55VUt1aGhFODJw?=
 =?utf-8?B?OTJJdzNOTklkSnlUT0NtSUxNKzZBK1NuSmYvYWs4bWg1R3BVUlN4UkdvSkVp?=
 =?utf-8?B?NGpCMnoxc0p4anQyamE0eTA5RzhjYmx4Vzdmd0V3eVkvbmVTSGgvMGVQQmVF?=
 =?utf-8?B?WVFKL3VaL0xUNCtLeGM5b1U0RG1ROHBnZlFkUG1qTzE5VDdHdzgzOVBIZS9v?=
 =?utf-8?B?QUVHbXNkN3NEUm5vQTdpdllVT2JydFEzTGI5MFVLMXh1eDBMWFkvODlkd0Rq?=
 =?utf-8?B?bVZqQ1hDcEZGdmt6elhteSsrQUM2eC9nL3NDNVhIcjlvWGN5ejN3Vm41Vllp?=
 =?utf-8?B?NHVTMjJmNzhjY1FXUXNtSmhQTnByaVNkMHo1UytRejVjVTlSeVNxNXlCcGxT?=
 =?utf-8?B?T0NyR2Z6RVRObng2RUF1OUt5VHFCSTRweXRJWWx6akEwWStZZFloQ1NtZnEv?=
 =?utf-8?B?dlhnK2huTWpNK1FBUEY1dUZKY20xL3NWUkErQUFsc3lsUllFKzdtREwxNE1o?=
 =?utf-8?B?M3V5UFJkKzVlNE9KYzNkVE9wV2xZQ2F5bFJzb3BucFdIc3gxUVRCNDhmcXZP?=
 =?utf-8?B?bnZCcGNOZmNjUXB5dDZkWFVUQnNQQmQrZkIrRDBFL0RGZzFBUU16ajllL0xS?=
 =?utf-8?B?azdNTi9UOFAxM0xPSUc3WWN5TjQ4SWdLUGk3Tm1BZ05ZbnpVMDB0ZzlCMnBH?=
 =?utf-8?B?OE41VFIybHhmSFBUSjBNalFqRzVEN3hFQ3FpR1dsZXZ4c2xBRzR2d0I4UXd4?=
 =?utf-8?B?cHd6bTdEWmI0anlPQ2Y3YSszZ1JWMnIrcVJQU3hCWUc4eW1mM3ZsVUtYM2hX?=
 =?utf-8?B?Mnh0dVhJa0JpYlFoSnJJRnBQdk9hQnI1c083T1dyUEVNSG40YlViVWwvMmYr?=
 =?utf-8?B?b1hLUi9XUVpvZ0RLYTVsMm0yUGdPSjI1K3RsWnQzRnBpM2V5K0p3bW1XZlF5?=
 =?utf-8?B?VmZGNDBpUjJ1MzBpdVlkQWVLcXhTaUVMTmFwUWo1RU9mTWtVMGtHUlp6MHVN?=
 =?utf-8?B?SnN2REtYMldEZnNJQjFlMVpOMDQrdnRwNmlEaDU0bWhpbUpieTdWUC9EM1p0?=
 =?utf-8?B?SlhET3dXM0JndnNrZ0o3Z0dSZXU1d0xOMlArVVVlRmw5WEE1UjNTMzF3L0gw?=
 =?utf-8?B?czBqeEFTdEYzMndzZHB2eExIV1JJOWFmR0Y5eEdhbHlBY0NGYXdNK0lrN0V0?=
 =?utf-8?B?VWlva2RGL3djVzF3T3lLQ2xBdnNzLzNYRHp6Qnl1Q1hFTDZuR2RLSVlzakpN?=
 =?utf-8?B?MkhiUW1lQll3N3RxaEhhbHp3b2V6L2EwK2gvUEIxclBjU1cwK2FGZz09?=
X-Exchange-RoutingPolicyChecked: nL/+NZu1AouUS6G2N9N1lUw2CqjrvSfbtjHcRE0LgAzl6owOZvfQ7OxjWDWJHcHlbB+dDpxXP5Uj3KfZiK2FmzJZKC9FjtG7OqD14M+rYmxDHmWnR2R7A1R04czM05/37S4ETPvR2ENUm0XqiagcTi9YWqkayV0kB3KMEi3onvNqUF0tH7Kk4RAc2Y/Tt6L+oiahElNaT52Z2vMFmsEBzchFo81hBov54pbCLkPlTxZQWLnr7Vh/IN1gdVjSm/pp49MzUvSsbeK3nln/astZ32r1Y4oQFZp5lWsjvKqNS+pCdm/g6s46cQIH7NQvnV1+UvsvgeEdBdeSokFGbwDDrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1046c90-3699-43d6-a1f9-08def767255a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 05:12:31.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6YGIhpBI9vLwo44EkXRtw8L1RZw0oUSi4u+naXH21y4XFwQI2N57lM08141kysPDzMb5Hi/RlCaU5ZDVzxMUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9714
X-OriginatorOrg: intel.com

On Mon, Aug 10, 2026 at 09:48:15AM +0800, Jiangshan Yi wrote:
> Hi,
> 
> Thanks for the build test report and for catching these section mismatch
> warnings:
> 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
> > >> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1ec (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
> > WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1f0 (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
> > >> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1fc (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)
> > WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x200 (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> These warnings have already been addressed in the v2 of this patch,
> posted at:
> 
> https://lore.kernel.org/all/20260730154911.3164527-1-yijiangshan@kylinos.cn/

Sorry about the noise, the bot doesn't recognize the v2 correctly, we will
fix it to avoid false positive.

> 
> In v2, the error-handling path in lkdtm_module_init() no longer
> references the .exit.text cleanup helpers (lkdtm_heap_exit,
> lkdtm_usercopy_exit), which resolves the section mismatch reported
> by modpost.
> 
> Since the fix is part of a new version of the same patch rather than a
> separate commit, I haven't added the Reported-by / Closes tags to
> that version. However, your report was very helpful in confirming the
> issue — thank you again for the testing.
> 
> Best regards,
> Jiangshan Yi
> 
