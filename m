Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9A2A954
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 00:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731544167; cv=fail; b=sJ2cFgc3aQZ09Ey4act7Z4Ka151I14DosE1JYwCcIC5ZO+Hif0ipYDwcOYw6/pHpWDXQHnDGwyHJHlyA7xQlvoV2V4PB4jqzYC6JnnTLHjKtno+ZK3pZnMif2b56MTloNBR6dYr1WQZ7ZhccXq2zNxgb7p2aoW5e0UjTqixJqss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731544167; c=relaxed/simple;
	bh=Mkho1J5FtgX46LqzlloEIjPvhCNpvCTiIQY2IkbOqjA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ikhR9QWuGL/2WJY2N3b15S90ZQsq3RqcgNNMM6JBXAiDdj/CDq75W5XjMh1S9a0cwsrRpbaz1VotbmYVCD+c7c8MR4yzOSRvuf1PMBV13ehvFllU38LxSUmbewkc8/+/jjYBkH5f3xdsdW1nzilTO9IwDUvzV5GxFygyQC0fbJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZV/EkM4d; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZV/EkM4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731544166; x=1763080166;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Mkho1J5FtgX46LqzlloEIjPvhCNpvCTiIQY2IkbOqjA=;
  b=ZV/EkM4djsLVKxxlzF27Zv/BNcSBRQYQtqVKQzoGu4e7b8Orx1mHlDTh
   KIBOUmNjRpWdvfVPCna6Vkic3ZhVQ71XskjCsTtBNq17Nfe4NxQ9tjMRo
   9npW7v7eRqtQPDDtNClSpmyRN+mhpOgoMeLZySHPVGJYfOvGkyUQ4f123
   pSujTkIdPB8GNMrD+cMh/ONOKJ78NVPxXAw3p34Rz5zYUZzUTUBNm6rJc
   dHVtEyf9GpkDIQPX17ysA+xFUPhLiLQG5KgosZiAsghxcA8wRx9ftLPob
   hBgaKdBDjDI6o3hKeXy7lSHmCBiHyFEKK0N3zbTviNzb8H+1FbL6UvNyP
   Q==;
X-CSE-ConnectionGUID: U95Cb60sRxWy9OlRnFpUKw==
X-CSE-MsgGUID: IwGUvAJVQk2Jrv5DIoKeBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42579153"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42579153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:29:09 -0800
X-CSE-ConnectionGUID: oyd2NGT8Sq60aUk1ZsfukA==
X-CSE-MsgGUID: 8YTCxmnqQhq9TigmzCZVjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88213603"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 16:29:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 16:29:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 16:29:08 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 16:29:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WULdv15DUul4FnuXfyU+ikKoCBA+Jn51E4uvmKUahtcfbjHnDQ9YukGzjjR4U8ZuisDF7ulv76hsPmwrPGBAHg0mK5+iz34f/9/Vb4kEIj5SFeAjemGQPFD0PYePUqO8m6Survxeuvpz7fXuESTML+5EEVRV+LojkoMOAdOZoZNDStO8AMbw3nBPFOvXYwvqrQX3oddOrcdVM4zmNSQeld5/v5LMHUVSZO3jKuphTPVf7MjBQvg/6soLYrX/d1TlOyilTy5IheGe1tKgx59Q8XfgTMTH9X0+RiLrTnuMgidyg2h2CwWl2CDOuICgUPHOIeVL/weSiN2rTs8qGYlclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIb9TcQ5zEKzqjucThLo1edh8tBQ8UbtqFAS5jAl5jk=;
 b=pxlmEG3fUzYd3AIOGZP7UARjlbLbpU19u8nLAvZH4eJ+AnhoPuSg1iNGveDn3CnWQIqexsw/L00RaKPB7P35lBuX8EpY9QrfbAA7NxtkodqZ0feBJUy2wOVoAI2OhoXyuWxlF5Fljlqe0Cp8SWjnGc+6J2NPJeobuQ0XajE7QvOVZrElqIMFNwagG4GtjVHHvsvHj65bdd/HHEXiYXrJGwa+RBogTXPK1ctbBtiBVHRMhIEhk9R5RJphx9nT+DYdMgaB7HyxUWZY1JBj9MidnqYDdyVCBhhyNhbSDtgKXJmxWe5Nj3S1gi+C3oPOod9jKfTeWgEmY9HsGvmdPbfJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 00:29:00 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 00:29:00 +0000
Date: Thu, 14 Nov 2024 08:28:52 +0800
From: Philip Li <philip.li@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Linus Walleij <linus.walleij@linaro.org>, kernel test robot
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Drew Fustini
	<dfustini@tenstorrent.com>
Subject: Re: [esmil:th1520 2/48] drivers/pinctrl/pinctrl-th1520.c:457:9:
 error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <ZzVERByBR9s9ddoZ@rli9-mobl>
References: <202411131732.BNe0iugn-lkp@intel.com>
 <CACRpkdaQPqY+H0OxLjzOVDHSNS4TTi4weDDvLGs6OymVpjPNZA@mail.gmail.com>
 <CAJM55Z9N77gkuZdh3gFqhL5-NbOMmEYo8vkZeesmy0iBK1EkDA@mail.gmail.com>
 <ZzSAw2+kSnM26c3N@rli9-mobl>
 <CAJM55Z9QSxom_AAzwZ=_7y0fkeYzBbYrY08z3NhFfbj1QEY2GQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJM55Z9QSxom_AAzwZ=_7y0fkeYzBbYrY08z3NhFfbj1QEY2GQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 521ffaeb-c5c5-4829-eb36-08dd044355cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVdqQ0paQU5hKzJCM2w3ZnB4VG5WZHRHQ2Nxek9Mbk1SU1AzNjFHSVN1dWFk?=
 =?utf-8?B?UG1YT3h0bjA3WHpodVhTSG9aMGI1K2loM1AyMGlUemg2R2hUMnJacG1RMEVp?=
 =?utf-8?B?WGZGWGt6ZzUvSkhXenIyeUNyVHhhaFU0aUJYUHMyeVFRSG14M2VlOVI4d3hV?=
 =?utf-8?B?ZzVkZEh6OWRzd0U4SHh1bFQ4LzY5OGVscGtEaXFWYXNHbGRFcWJwbWFxQVJy?=
 =?utf-8?B?a1FlY0Joc2NOa1ZlMlJZUldtV085cm8yRnM1YXoxV0ZGbkZ1UjYxekt2S3Fy?=
 =?utf-8?B?VnZQQ3VpNFJMVTI1YVhoZ2tONjRNbzF2T0xvdzY1eDViMUZDYWxWZ1Z0MEhI?=
 =?utf-8?B?U0Q5WSt2T0RNMlN0MDJoNkNSVXlBaXZDOFlXSzdiUTZzVlBEbDMwOW92UlRo?=
 =?utf-8?B?NG15RWxVbWRkQUhZcmg1dXVFTnIvRnc0WGNSYTJYREtLUnJFTkJjOCsvRWY3?=
 =?utf-8?B?TzdTcmVvVDNTMHE4Zm9LZ1habEVXeHYwYlJKZ2N4Y0MwdzR0cmh0R3RlR2J2?=
 =?utf-8?B?UUczR1h1cGx0b0ExbHNaR3JSZnJlWUZkOXZrbWNva3NQdVlwZWhYbWNxNk5P?=
 =?utf-8?B?d204YUt3cWxXQThWYy9WaFVwb2VIZWZxMlRGM2NkUmdLcE1pTTRNVVdnWTBU?=
 =?utf-8?B?STVKY001QWxBYUxBS1FoVExGd29LMkFUTWlocjF1VWxvQnZKdnorNStGMUhn?=
 =?utf-8?B?VEF4RmZ6WjdxcjZlNm9Kelk5M2F6U05BL3ZNOUJXaVBrN2dydzZxNUl1aks5?=
 =?utf-8?B?UjVKS0hVQTZHR1ZYYlhtT0h1Z0d1VlVtdHkrRlJVRUtHbGFWTElNV0k1UVd1?=
 =?utf-8?B?dExub2tMaHhNaklNYWFRTnFETVl1VFRzL0ZjZ1lzYXdwdExldVhjK3ozcSt4?=
 =?utf-8?B?eW9OU2wyNWxOa2RYaVV1RkRSSkQ0YS83R0dsU2ZnLzdicWVVN0ZTc0dUd1N2?=
 =?utf-8?B?cmlsbGFnZzgxV0tFQzdtNjdDN2lXbUJKaHRTWlk2R1RnUU0vbmV0b3hqVzlz?=
 =?utf-8?B?NnBCQ2pkR21zTEMvN0FQOGRhU0g2R1pmR2VHanlFQmwxV1dJdXIwYzc5WTdz?=
 =?utf-8?B?VHhZSVMvYXAyNEtVUktoYy9tNXNVajZjWnJEb2JlZ05mdlVMQXcxZjd6Qm11?=
 =?utf-8?B?WkU3UU5IWURRZU5nbVFJL0NZTGc0Y3JrSUVpWFBLZTJORjZudER4YXJBd0ZY?=
 =?utf-8?B?dVh3Uk85bmk2NVB6UW5rWjArWEZyNnZBM085ZDMrbW50d1JNU2Q5NEZLZDJ5?=
 =?utf-8?B?b2dOUktnSTFLcUduc25UWGtZa0VCcnB0dCswZUlsU2xLcXFFUm1FOVdCUjU3?=
 =?utf-8?B?bmdDc09NeE15RFpmVVpaRnJEZkRtVTlzVTlhV3dHWkRnaEg0UmVkU3E3bXI4?=
 =?utf-8?B?Z3ovVjhQTmRudmhhSUNOWGNjWmdTUVhjSjZ2b2xkRklNZzRPdWhPSitRUzBz?=
 =?utf-8?B?MTZLclFTeHlvU1dvOVhpRTRMN2FiNmUxMzlDdFpRdVcrb2JQNTdDOEQzQXlw?=
 =?utf-8?B?UlhlLzc2ME5RRnVaZ1ErdmNHVG1tUWpObStMRlFuanZWUzhTejluZWxWUmNM?=
 =?utf-8?B?Y1VTNk9DZisyV2VhMUFjTXVvcnpaelF1K01ESlY4NjBsL01UTmtWaUY4SUVO?=
 =?utf-8?B?RjNwTjI2SWJ4WDhMYTlqME9qb2s0cmduMUVUY0h6byttMVIrTjBHZGplaDRr?=
 =?utf-8?B?TTI2c2dqN3o1U2hNZlVYOGxrbHBiNFppb3FqQkZjdm9sOWlzNzFpS3ZvY213?=
 =?utf-8?Q?4buz+su3If3W6or5iWDabPk9OD6dH5l48RmfuIB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTI5WTMrVi8rd3VmWUNWdmZteW1Bb3FCY04rK2dVQnc0NHNQQjVtdkxSSExV?=
 =?utf-8?B?Nyt2bElWR3NwTnUyQk1YU3A5Zk03NXZLb0tVNXFMNnAzajdicFlDaEhSY3FC?=
 =?utf-8?B?OS9od0N5S3dKOFY3cDVLbnl2YlF4dThvd1Z3djVuWmZJZDY3RFpsRWV6OWcr?=
 =?utf-8?B?MFFVWnFDY0RvbWNWVnFjdnZ1NmFLL0cxSnBwdGlpcVFBNGpCQTEzN2JoR3JR?=
 =?utf-8?B?MGpVMTNPZ2ZBOFhUQ2krNnk4bUJpaElOMXQwZHB3VUVkNk9XaGp4Q3E2NDRs?=
 =?utf-8?B?MWFXMW9BRlVzQ1JFOHo2RE5Ca0RUMXBOYWgvK1BQUVVrUm8vdUpac2pUWUU1?=
 =?utf-8?B?clhEMlZvVjNhT1ZVSVdjR1R5RWJGUXMxeUlJTTdDbmk5K2JKWlFobTlORUpi?=
 =?utf-8?B?Nm14ZUFoQlNxV1hJT0I5THVuZzFLQ2pucllvM3E0M0FaVHl2eFBxY0ZxRmg4?=
 =?utf-8?B?UElFQXBrUmh6VmNlaTNMQmgzWWhWb0M0cXRySHV6OEJ6b2N6K204aXFYYytX?=
 =?utf-8?B?MGI3THNsaGNUMzlXczh2OHNyazEzUmhPU2kyS24wZEt0cmFZY3YyVDBDcGsy?=
 =?utf-8?B?bW1WcVJKU1lzK0lNZmhPb1lyaGx0YVB3R05yMDNxeHl0V1dHeWZhUnNreEpr?=
 =?utf-8?B?Vy9rYVZVWUZyblE4Q2RoWklOYzRIV2tiajBlWHUxTkcyblRieVYrZ1JwRVhy?=
 =?utf-8?B?cXM5allwZHFKZHNLY1Y2bXNLekN4eTlRQnl0ZE90Q2tSSmxxYlZHZDhPVFQz?=
 =?utf-8?B?c3hPRGZianZMSDFXMldaUUY0L3ZkRU1kNUIwbjVkcG5CbDJoSmlXejNWZnBs?=
 =?utf-8?B?MFlnVW1hdU51eWdBbUlPTVFJa2dUclFSWnIwRklHYS9GcGxpQTZNakJBaGFv?=
 =?utf-8?B?dmlDZFVFRmVXa2RVQW5aQzc5dVRTSmpjK05USzRBV1JzNi9mdEx6MTlYeWkz?=
 =?utf-8?B?MjdOQlY0d05rRHc2OVZHNWVuTkg5QXlGbnVjNm1NSzNzdXB2d1J6dWxmZndS?=
 =?utf-8?B?QzB0VDVSR003a2NSZFFITGZzNHBwenZyOS90WmJRRWVvM2x6Y3RTanZFcjds?=
 =?utf-8?B?cTJ2aTRvbERXY0ttRC8rZGhSbTdnTTAxMTM3WWZPUXFWUDdKbVZQbXhjUmJW?=
 =?utf-8?B?QnJLU1owVVdmUmpWUVlPQ3NmNWUvRlhTZGgwRXhkbllYNHlaNlkwS0RQUGRP?=
 =?utf-8?B?T242b3kzUk9XVFdOVDQxeTZ3K1pidS9TMmloc2xFM0xQTEE5QTVHazd3Q0Np?=
 =?utf-8?B?VW0wbWIzYkl1UVRCbVBlcDBYUHoxeUJZaDB3K1g2S3FmOXpYMHJ4ME5qbHVB?=
 =?utf-8?B?K1FzdUwzV3Vhc04yRTJrckVaTWswODdHcndYeU1jY3FaQ3RBQ2p2L1JjeTJn?=
 =?utf-8?B?U2RYL01Pa29FdmpaYXA1c0hZMzR0ckFiWGVJeTlYc21hd01ZNi9kT1M0TVov?=
 =?utf-8?B?M3NnWERRQnVhYzJLL0t4bnVaa2czUDE3SGcwN0FKY29lMC9yaTFwMGxOVktP?=
 =?utf-8?B?ZWhNUklKeU5wdzdiRGdLWnZSekFDUUVtdmFQWDcxOFRseEJIdlM0SHB6bmdx?=
 =?utf-8?B?ejRXbmU0S1ZJMGFraytVb3ZKZ3BHWWlCYjVDNzlLZ1hQT0l4NkRvQXNZTENI?=
 =?utf-8?B?YmxZRldFc2c5UkMrOExMWmFEMFFmM1g4bVRMMDBnL3BGVmd5eHQrb3hpMmFa?=
 =?utf-8?B?UFVodkN0WmkyblQ0Umx3TWFCa1A2VHkwSHBpWkNQUUpnQzdPVDNVV1hmSVJ6?=
 =?utf-8?B?ZWZYektjZ1Vpem5iaDRENkFyV0piMnozVHc1OS9KM3pwbnZ6cTkwbEJWL1Ax?=
 =?utf-8?B?Tm9kSGdOY3NoSm5Nc1BYZzFlUHBMdy80bEdDR1VpK1duTk5HT1BrTjhCZUxC?=
 =?utf-8?B?Szg0R2ViZzcxTDZlUk5rS2dYbDlGcStKdElwVlhYSS9kMGROeFZZUHFFcUV2?=
 =?utf-8?B?ekhPaXVCRlVGVHJ4VWNKdVhFenRickdQWmVzVTU2S1l3S0llQ2VsNCtReDB6?=
 =?utf-8?B?UzFaQy9tOEdIYXR2ejNaUkxBNFAxVUdrUXprQmluQmJLN1Z1cnFPNytXOGR6?=
 =?utf-8?B?ekxKdERGejBNTGlKeEo4c25oOVJBKzkySUI5alk5QlNVaDRjZ3R0Z0FkSmpU?=
 =?utf-8?Q?31QBEAV7y7K/PI8VVDmb43b8e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 521ffaeb-c5c5-4829-eb36-08dd044355cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 00:29:00.8205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2dgJcaM5XNBjVaerYZ1AnXfoBeIMDrMc5Gm3p2VvIPTQkcHgrGjDmrLS4+NHBSFE7jsahgWOd0kg8xZh+5BoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
X-OriginatorOrg: intel.com

On Wed, Nov 13, 2024 at 12:45:36PM +0100, Emil Renner Berthing wrote:
> On Wed, 13 Nov 2024 at 11:35, Philip Li <philip.li@intel.com> wrote:
> >
> > On Wed, Nov 13, 2024 at 10:59:43AM +0100, Emil Renner Berthing wrote:
> > > On Wed, 13 Nov 2024 at 10:58, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > >
> > > > This randconfig is for Hexagon which is a bit insane to begin with but OK.
> > > >
> > > > On Wed, Nov 13, 2024 at 10:28 AM kernel test robot <lkp@intel.com> wrote:
> > > >
> > > > > >> drivers/pinctrl/pinctrl-th1520.c:457:9: error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > > > >      457 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
> > > > >          |                       ^
> > > >
> > > > This is because in this config:
> > > > # CONFIG_OF is not set
> > > >
> > > > But HOW is that even possible? The Kconfig fragment for TH1520 reads:
> > > >
> > > > config PINCTRL_TH1520
> > > >     tristate "Pinctrl driver for the T-Head TH1520 SoC"
> > > >     depends on ARCH_THEAD || COMPILE_TEST
> > > >     depends on OF
> > > >     select GENERIC_PINMUX_FUNCTIONS
> > > >     select GENERIC_PINCONF
> > > >     select PINMUX
> > > >
> > > > depends on OF!
> > >
> > > Hi Linus,
> > >
> > > Sorry about this. This report is against my personal th1520 branch on
> > > github and I forgot to pull in those fixes from upstream.
> >
> > Sorry about this, which is related to how the bot configures the mail,
> > that by default, it sends mail to all related members of the commit.
> >
> > Hi Emil, is it ok to allow bot configuring this repo as private which
> > will then only send report to you?
> 
> Yes, please. This repo is not listed in the MAINTAINERS file anyway,
> so private was probably the right configuration to begin with.

Got it, this is now configured. Thanks

> 
> /Emil
