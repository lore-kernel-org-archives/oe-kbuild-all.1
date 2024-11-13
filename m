Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518B1BD9DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731494103; cv=fail; b=F4rhMb8Bo4Q0SA6TxA5mLgyRvJ7ILY0RSFmUmQHFKcliMx7Xazyq78DR/RNdkVegrOzSflPCUAfeCVGMDTNcZjiwyMPjPFeFgHIc9W3M5aai6zlFwW7Ygrmi+MqvkonH+5M/Bx+u/D0SuXQfpqXWHPFZMW+CN8yzvRxFcx+de7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731494103; c=relaxed/simple;
	bh=mniUNOv6DtfTkA4uNP+Wf4fbyvJHkEmQtfpgQK6et1g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nJ4WvLfyzyo+HikYvwRM4ckW/wIBRIHadaFIYOEwv5HhmooLWButSTONnHeH9nPwsdWCgO+7r/UvHmnDCnk1c8Me2z22g0yC4v1P+FcqPu1oi4qdz2oyp9nxDbzPvShKCXwB6iU1htwXH61mom4WCEHTOcRIC8sd1s78hJxAnRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfN91Pen; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfN91Pen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731494101; x=1763030101;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mniUNOv6DtfTkA4uNP+Wf4fbyvJHkEmQtfpgQK6et1g=;
  b=MfN91PenYagyftftEy0pfEUI1vGbwbuTko9ifbLB7WBg2Afz2XbhQMgk
   9M5/VujeQBNC33nZ3Gv4gOuJN4CplHIlw5Va9CsdNz7nLtZkD9sS0Bn6j
   1iLwxr53/jF8M9gdy6V+x55FpNic0rd3+lhoz3IpNdm2712a1j6oM4gGm
   mtWdEJfiiXFqJ68UpeCB+yxsVmI5MNXJTvbOHVBIoTJKtMHLaeKBxek5b
   Lan7JJ1ejzhd6dKPSGqZM1PzvmxdDF4J2AzyrRyWeTx5J9ifxO7ZttzNc
   /t0zJ0d8hIqW+SfO1eaqH7T9xl61XdbjWUx4wUew7vBZ/l2sUp6GowAMU
   Q==;
X-CSE-ConnectionGUID: fqbBrnEyREmqlpWLdPkL9g==
X-CSE-MsgGUID: l+3JID/9Q1er8liJu5Hkqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30773665"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="30773665"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:34:57 -0800
X-CSE-ConnectionGUID: ftxtGKSfTe+dJo/y4gbq3w==
X-CSE-MsgGUID: lGhCQC02TO2NP8puOHtezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="88250819"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 02:34:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 02:34:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 02:34:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 02:34:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNry24awnkCkbGyEaMNkOd2RqrypXRS0YJbJpWHvMz6kw2MARmHJRMuZeOZ7M9P8HAuVPLb5FywECPyGk7IeYZo+bECdAekwgO34ucLQkUrDvyoTE06fBM6jiYQW7lHhc89g+heM/t6mscyijzo9ap1klgV6z7vcjObZLHC8RJUN7cIYF79sOwWsEzKI++ZpJikWzsS58EV2D4Bt9zH2HLkHtQYK9NWfaPOfGh9gAMZf1H4rN5mggTzpn120T7X5xyeR80ZGHzbBQkFFo8Qll+yQgZWQPpIoT2wK/5Mwvap6txUFC4taaIqpnzTPxkYldFQhzqwHD4Xd9Y2Tjs4DZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kv8GpuQNgPoG5gCEipJZALy+S28oP6BLOSmrkCmpW0=;
 b=ogQCGlUyt3aUDA4SsOpSEVh2y7sStmUTFVyFjBs8b8H01PVO9cYV93KjcDl60aWseicMR1UsChjejjI51bEGRFBFMLeajSbXyxI5EKji/3j2GN1q6cIQQ1mRAH+JRQ4N8Qi3EhzXG4KFKvhhjf/q6LjWymvW0gz6fc/0S9UJlIA9I1V1egWds5NC8Lhb5bCXqEnBG0eL0/Qbczaj/BEFlHB/ddERC70Zs00EWlGceG+Hc/MZ2+XGe9rKe5hvezNhuTf4JGhhRrV75WP60DtmFunD04ucUQ2wMEyaPDFvph5eGthZm7DF83gdCatfYH+aUEtwCJYy9kOJn6FBUTTZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 10:34:51 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 10:34:51 +0000
Date: Wed, 13 Nov 2024 18:34:43 +0800
From: Philip Li <philip.li@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Linus Walleij <linus.walleij@linaro.org>, kernel test robot
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Drew Fustini
	<dfustini@tenstorrent.com>
Subject: Re: [esmil:th1520 2/48] drivers/pinctrl/pinctrl-th1520.c:457:9:
 error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <ZzSAw2+kSnM26c3N@rli9-mobl>
References: <202411131732.BNe0iugn-lkp@intel.com>
 <CACRpkdaQPqY+H0OxLjzOVDHSNS4TTi4weDDvLGs6OymVpjPNZA@mail.gmail.com>
 <CAJM55Z9N77gkuZdh3gFqhL5-NbOMmEYo8vkZeesmy0iBK1EkDA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJM55Z9N77gkuZdh3gFqhL5-NbOMmEYo8vkZeesmy0iBK1EkDA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS7PR11MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 582c804b-5607-4c4d-0d03-08dd03cecdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG5Dd3JmMW9Wd2plUHhvVDJ3bjc0QUdPbXdEU3FtZ29BclVhNHcxbWpvT2RM?=
 =?utf-8?B?Q3B2SW5sWDc2R3lyem9QaElBR3FxUGZpM1FTVkM2OG9qMG5kSnd3YXVFVkd1?=
 =?utf-8?B?SVI4Y3dPRHljZCtlL050WWtEQXlHSXZBMEZUeHhCSXh2WS9zVU1ibUgyMm9P?=
 =?utf-8?B?OG1MNkRvQ29rQTFvSDhaejlMN2xLTURsbTNXcFB5M1N4alR0Y3VxT0o3T2Nv?=
 =?utf-8?B?WXZ1NXVVMEdNNlFoTGg3SmR6V1d5MHZNazFGSy92VE5acXFOczY0dUptTllX?=
 =?utf-8?B?WStIcURkNTZxM3JpckZjeFFOaDNYWURNbTVmbkxnd2hGOS8rNWNkYmZzeXRW?=
 =?utf-8?B?cHVPZEEvQXphNzduVmV4REk1dFk1cHFyRS9Vc1FWMEt5ejY0M29qWjU4OUtW?=
 =?utf-8?B?RmxIZ1VlSWE3TzJxb3Mzc001Y3lRcVJDWkwxeTZibXZkeml0d2dQRkNmNjJ1?=
 =?utf-8?B?dWRvSjIvcTV3SzIvV2lRVG16M3N2T04zSFJlWlFCTUtHU0U0NVZCdksyRzJY?=
 =?utf-8?B?REpoV1JSdUdKM2ZxYXpra05SUHo4TjRoVENUUEFETnh1UnRRcEFGcnduejBy?=
 =?utf-8?B?MEhVYU80UDU5RkVVVFJkanc0MGJQcGk0RStUTWNjVzlIZDY3V2JMZHlhVXV3?=
 =?utf-8?B?VDhPZU9MTzV3RXVqYm9hYkNzNE5xOFRsRHdLYThvWU1heHVIcXJYUHZJTUJW?=
 =?utf-8?B?K2s2aGloS0RPQ1pIUXAwYWpSUHI2eGNIYkFjTDhuSGhrOXhYL0ttZVYwaHVi?=
 =?utf-8?B?SzZhVTNteWgwUU9paHZPWnJibFl6THI1VjN6cG9YdjFsYkVKMGNpdlZWNDNy?=
 =?utf-8?B?dXpIY2ZKUmo3ekFUK1lHSDNGMTFmS0Uzay9MMU42V1lNZG01cVZuRXU2SmV6?=
 =?utf-8?B?SjlISlBZSzNHOU1TR1JwenkvSDMzMkk3N2Y1NnNLTUFhaXpkQmpkUitMaWhj?=
 =?utf-8?B?UGM1TFAvMURzbkMydXV2VTBVU2QwZk5NMjMvangwdVJWWlhYNzZFd2FxajRH?=
 =?utf-8?B?aU5lcWRraHRTU1NocVhDY0R1OEd2SFV2bVlWRS85dGE5MjZQek1Dd00yeXJV?=
 =?utf-8?B?alIraGF3RmZqZlFBTHFDREVhY0E0SXJIait4R1RTZ2tUZGpLMmZXT0RLaEhG?=
 =?utf-8?B?MHh1Ui83U0p4RWZVbWxicmZHVHpHTzdEQnBxZ0JPWEFSenRGN3ZmcTh4OVhT?=
 =?utf-8?B?YW1KZVJXRUp3eTJKYmtHVC8vY0JrM0hSaDJuczlrNDErZEZOc2xJa0h3R2Q1?=
 =?utf-8?B?SGI2a0pKYk02eW1wc252VXJRbVlUYTdwUm9IaGZzNndyeHQ2RnJZZ1BvbDV0?=
 =?utf-8?B?UlNDemluZzZUTllDQ01EK052TGl4VlpHNElIOE9kMG92UlM1bmQybE5GRVc4?=
 =?utf-8?B?RHhrWmh1SG42eVJVZzJhOWd4aWY0SFEyM1JzTWRhVVRCUEdkcWlJZ2xkVitj?=
 =?utf-8?B?RHBWMS9lamtwODEvWHBteElpaWc1Ny9QN0NwRGc1L1JpN01BTGh2Nml3K01I?=
 =?utf-8?B?aUVyWUYxdGVyZ05OZG94SE1mc0gvL0JIQnZUR28zRGJQbFJSdEZ6WUhja3ZT?=
 =?utf-8?B?YzFjT28yRGNJc1NEZCtJMVpTeW9IQlYwSERTVExzK1JudzgvVndMZzFiaXFo?=
 =?utf-8?B?c2t2d3N5a3Bsa0lIay9qL3ExR0JobUs0VHFiek8zS2gxekh5NzBNL0JWUFRU?=
 =?utf-8?B?RFZDMXFmbnFIWlFMQVR0b0NaM0hTaWFJZjNyL1U2VW5ZZjJic3BKU1BxTUhm?=
 =?utf-8?Q?uzRXU12Fo0k628Nvt8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWVhMzBCQ2FzZFgwZTlGak9qNjZsT1ZqeVpTMVh4RjgxTytZU25sY1FvOWJO?=
 =?utf-8?B?ZlNhRGl0OWZUVks4YTB3b2M1UWlvdU04N3c4MUF6RTdkQmRQaGdxWGhkVVpj?=
 =?utf-8?B?YmtjRVlqYytLUmJlRzNtY2VaVElyQ0NMQ0g2K093Y21pWDZubzI1b1F0RDFo?=
 =?utf-8?B?bVU4SW1rYjRwU1NrQ1IwanhhcGo2TXlINEFqL0pDT1ZvSVoxMDJzaDE4ZHpC?=
 =?utf-8?B?d3FZa0QrZGNCZFpYNDVtelhZTHcyU3B2dFI2cHk3WVFaZFVQZk93QmYvY1ZZ?=
 =?utf-8?B?eVdBanhMTEIzcWIvK21iR3ZhWmdhaUNrbms2dXJYSzFocjFvNnF3YWl2YThT?=
 =?utf-8?B?bXdsQXRKTWtNSEJvT24reGVzdjVndWtNeVZRZXR4WGErdjl2ZUZEK0loek9Y?=
 =?utf-8?B?RHQzOTB0bC9tc1RURyttdUFyQjFJU1lHMlo5aE9aR2JpMlRjZ0ZMSXh2Yzlk?=
 =?utf-8?B?eTlDdDBiRHU3eWVHOG9pSE1rNjU4TFppZnlVaDVpVWFYNDN3SnR4cXFlTDly?=
 =?utf-8?B?dnVHK05SZUJuakplQ3lIdHliMzJLcllKVUxydXZlMURBMTJDQmZxTGJPbVRM?=
 =?utf-8?B?M1NVS0JOVHdOZjJhQysxNE9Xb2IzTW5uREI3VGJxWDVlTzNwNXJ4eFM0UVR0?=
 =?utf-8?B?QXV6TDViMFRpdjBnVHRQLzkzZjl6a3c2NC95M2piZWdabllBTmpaWk5SRVVG?=
 =?utf-8?B?bVlZa09iczRIOU8vY2VMK0FJeXlMMktXbk9UbHRoemZ4WjBVZ0dUSy9NZktN?=
 =?utf-8?B?TkJOVW9vZHdSSjJDV09kYThWaGVUZFRrN0pwbSt6eDIrL0o2SUVYdlpRdlNL?=
 =?utf-8?B?SFdlOXBzQkJ4Z2IvelBSNzY2b01SRmtHdUdpWU9iL2o3SXF0QmlqUE5LN0wr?=
 =?utf-8?B?eXBzaGp0ZzcrNk45MVRiR0NKV2tYelFXU0lpVThRbDZ2RTdGbkxOd0dyckE2?=
 =?utf-8?B?Ulg0TUZ0UzVxeC9hSzhjL0JjQXQvM2RHbzVMaGRnb2FuSmo3VDl6VHJYTUFa?=
 =?utf-8?B?TkF6K3RZWWJObUVRemZBQ1NqVmlTL2VQQlFCU0l5ZE9aTEJLUWY1dk1MdUhY?=
 =?utf-8?B?Nm5zSWZEYy9XanNiQjlHSEFjK242UmlvSExDbFQwdUJsQTkyV0MxRjR2bUdq?=
 =?utf-8?B?Y1NDUzRIY2kvV2hpRng3Um1EUHRROGRyV09ERU5zakw4Zkh5N2NqOW5TTnRO?=
 =?utf-8?B?OUx4RXFSL25kaHhYTmJ3WTNhV21QUmJsU1Y3RktON1BNR3Qvb1hIQVRtS3Vz?=
 =?utf-8?B?Zmg4dkkxU1E5dG9vRFpYWUk5bXV6OVRmcHl0a3E1b0hsVTNRMEhYOWVsZTNx?=
 =?utf-8?B?UWlwaHJvbjlqWjBOUmE2dnNPaTUvaHVXQjJwYUkrZWVQWFdyQjVuT1hJb1hN?=
 =?utf-8?B?RmVDN0JwenY4Smc1RlhCRU9SS0V3K0JpVUpWemZZZ3gzU0h0d0duNkpwV2Vi?=
 =?utf-8?B?OE9lcUFKUlkwNGxpYUtwdzRSWitCdXR3dG1ISTdIU1JjZmIzWjNaV0NCOEdJ?=
 =?utf-8?B?bFoxeEE0WWlUMHdXS2NXUnNiYmtTOUluNWlnZGRRVkowNDU4Um9sS3liRUg0?=
 =?utf-8?B?V2kvUVRYc0R0L1lWUGdTbXBjSEFETDNPazg4RlMxZDJCbytOY1VkOEVUSFk2?=
 =?utf-8?B?UkplT3F3ZFdoTEd6b2tVSmhsZ0lOQmpkUkNGQkNWTjlBUXdKc2MvMTVhdFVn?=
 =?utf-8?B?czNGdEhMSnRreE9kdXB2TkZTMFpveDJzQ01UQ2NnUEs3WWxnMUZDdEF2ZVdN?=
 =?utf-8?B?MXpPeloyVjhRNXRYdnFXOExDWEJrbDZJaFVXbWhDdXlzamRYUkpXNzkxY2RR?=
 =?utf-8?B?TVB2SUdvcmcySDNSRjZxaG9BUkMrcHNlNjEvbGtZeFBGVFBFb2pHYTVDTXl0?=
 =?utf-8?B?a3ZkUGNIa3MvSzBacUkxbzhxMXRZRGg3dVhld0pkNVhjVndiWUM3N3U0blRI?=
 =?utf-8?B?b3pmem1iSG16c0VlUHVEc2dMeHViMzFLSWQ5cjNncUZza3pQaFV0elFjUkVo?=
 =?utf-8?B?bzB1ZjcyTGZvdUNhRXN6UkQyRUFQUzBGQ3FKZ2puTE04S1VsL1J5MzhGMytG?=
 =?utf-8?B?UEg0MXR4ZlZHWGM2Z2FJS3NFaEEyNGQzNkdpM1lRbWJ0RTlORVZLd0VuekZB?=
 =?utf-8?Q?VUwC2yPwpiKzB6CFyi59gWIQ7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 582c804b-5607-4c4d-0d03-08dd03cecdfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:34:51.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTYcns56gcP9DJLmdhz5VVp3+pfrjIRXbBziK7rDZ4rcWRJ6urLdY1JesKALK2tty6MLRA1DuZ7cdGCKNSpIsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7907
X-OriginatorOrg: intel.com

On Wed, Nov 13, 2024 at 10:59:43AM +0100, Emil Renner Berthing wrote:
> On Wed, 13 Nov 2024 at 10:58, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > This randconfig is for Hexagon which is a bit insane to begin with but OK.
> >
> > On Wed, Nov 13, 2024 at 10:28 AM kernel test robot <lkp@intel.com> wrote:
> >
> > > >> drivers/pinctrl/pinctrl-th1520.c:457:9: error: call to undeclared function 'pinconf_generic_parse_dt_config'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > >      457 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
> > >          |                       ^
> >
> > This is because in this config:
> > # CONFIG_OF is not set
> >
> > But HOW is that even possible? The Kconfig fragment for TH1520 reads:
> >
> > config PINCTRL_TH1520
> >     tristate "Pinctrl driver for the T-Head TH1520 SoC"
> >     depends on ARCH_THEAD || COMPILE_TEST
> >     depends on OF
> >     select GENERIC_PINMUX_FUNCTIONS
> >     select GENERIC_PINCONF
> >     select PINMUX
> >
> > depends on OF!
> 
> Hi Linus,
> 
> Sorry about this. This report is against my personal th1520 branch on
> github and I forgot to pull in those fixes from upstream.

Sorry about this, which is related to how the bot configures the mail,
that by default, it sends mail to all related members of the commit.

Hi Emil, is it ok to allow bot configuring this repo as private which
will then only send report to you?

> 
> /Emil
> 
