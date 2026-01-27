Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D294368276
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541323; cv=fail; b=DBlOwYLfg3h13K1ugIB1rlBHOepcylm7wJOd9ANSI+K3w4Ktt/AW+GDrhNltStF0cel/X9kOAbSpT1qxX9QO735NtrgZKnsQwBeYPLTjAs0zgkoWK6JJSCRsDdPF1JS0EjWaRT4I1x3h5C/UwYc7WQ7/SECmqWfK4Bm3UGyyQuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541323; c=relaxed/simple;
	bh=bulSLHpGoqHYvAO6UkJlQBuF+qBfZUDgnbGfFhzRx7M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OVuLbdQfpI07xWBtvOl/sFA6vFwL13igBVxPAM1clyd2dZfgF0UrYmcUnDfaC6swJl2VHGKpkK9lfcDEfLTgSW5fLsaqiEgUIrxIqvblKwyNOxnyCKPx9VCnaNmrEAq2FyfCgnTSZTm4jjIBafKTD/lCorJra3jRo4dNgwB22nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivGD0ejf; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivGD0ejf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769541321; x=1801077321;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bulSLHpGoqHYvAO6UkJlQBuF+qBfZUDgnbGfFhzRx7M=;
  b=ivGD0ejfCWn9oAPI191PSONvQxkEpmRJrENVA0Ugr7SPi5y7egvS+6p3
   xoKOXUSXqNmwR8+Ynwxu2+FTkcHxMLx0+5P/NEJMpQ9DWD2QlPOquQEpU
   jjC3wl/81ttg8Ybn0nqbSXXfQzXEqIGwmC5lKadkfu0FsvtGNoh1PcsdO
   NO3wtScLiovg/XdExw3YiSRK3MRdF6BaooXaJTLXIquS/V2JdVxxIHwCy
   BRksoVlfoswR6mggqS2jrQXllTbcIpQv9uQ23J3xOdcM3mWZsZAJnjKYe
   FTB+4FNB3igSn/88lPUGIqrtVmGv5fGpHbtzWLuTv7I6R5Zm6de1LdZFB
   g==;
X-CSE-ConnectionGUID: etaIa6APRri3OjiL4op5Bg==
X-CSE-MsgGUID: rbadNlrBQVScgLYn6B4Fow==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73336337"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="73336337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:15:21 -0800
X-CSE-ConnectionGUID: msUUk9UsRDS2YLE0PmhliQ==
X-CSE-MsgGUID: QdXIXCRaQHWPYfQdYv4O9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212604903"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:15:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:15:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:15:20 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:15:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXJSUCjABiRVzaW98agoyN3tYhah/wewXIz1yQB1DlsWhltLRYgJYMJo2zDuPXL4zMt4RZaASM0dvxluQpKNqZybmvLrbjlUeFUFc+SKJ2BtypQRfLfxsN/JkeyE3wYvaJ0bWLeqRk7T1ULDLeLoKD/vYuFbj+gxzyKHo/nyi6/hSk9+8nnIZUwIJQMMLSfWAgPARbbQ2YFxENcUYd7boP7i8KRdbz5mhRW7nNCdOoZBCl8fVd3o71dn5VmcXA0xLv6mbhWiEtwQypMmqWBUyuby6RPMABtVZDMumy72T0iZi1x1cAyHOBFdgzmuDkmBbGHxymzyyEv1jxxIneTTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXK67hZ0gpodM4wEV8YS9JgdTb1CnBlkjn7TES8zdFc=;
 b=fjez7buG53iAYRZEVZB/k8z+aOVGWXp5RsU9kNoykOZbC0D3d0o9uCNbj/d+0bZbvdLCgPMDbJUWSS9VHiddekrinGtL+DsdiALqYdjlvoU1WT0AK+0mOmrfVf5kTxHzdpO4Uxx7ZW7S0tL+LH6wZeeXwGHDpZIGi4S+P3FAWu/SglRZJO2K7u9hGzjhCYflf7E4AaHVAkgU2RR+jNb2sJjZ3pzby4Bwr3uV9a9zZcRbKIaYpLXcwwI3Cql1iz5clcwjxgUlja9Ir6Ywxf05xhP6/l+CwJHR6r9r7/LyxPeLj2ywZAD2SVoBa6q/DnGLjZG+OARIqgw5xMlk429qkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CY5PR11MB6091.namprd11.prod.outlook.com (2603:10b6:930:2d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.16; Tue, 27 Jan 2026 19:15:11 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:15:10 +0000
Message-ID: <960d07f0-d693-4139-ba80-d622b69e6273@intel.com>
Date: Tue, 27 Jan 2026 11:15:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] stop_machine: Introduce stop_machine_nmi()
To: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>
CC: <linux-kernel@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <peterz@infradead.org>, <david.kaplan@amd.com>
References: <20260125014224.249901-2-chang.seok.bae@intel.com>
 <202601261901.Yj2kmvgI-lkp@intel.com>
 <20260127144947.GKaXjQi8R9cE17WYKM@fat_crate.local>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260127144947.GKaXjQi8R9cE17WYKM@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 2962c164-7eb2-454c-5c19-08de5dd8640a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTJ2NEEwa1E1YzdXNklXV3lSd2U1a2IwYUEwL1ZlOHdKbkRSelVUdU1SYlhW?=
 =?utf-8?B?N0Y1K1hTaEErbzZaSkhUZTlTTWFxWkRDTEVlaGZ1bUxNakhmWTI2VHZJbUtW?=
 =?utf-8?B?NXpNRityWHFPMHgyYzZ5ajJKR2UwVUVlMVkzeHFEbVRISEJvSU5CMzNEazYx?=
 =?utf-8?B?YmFITzNRVjl3NWlsSkorUDk4QURGcTgxdmZVQm0wUXlBN1N2QU1kT1FaU1Br?=
 =?utf-8?B?WDhwSDBWU3VVN1hWMVdUSEF5VXVRRWdYUEI4T2V5R0NQZGhmOU9veFMvaEZ6?=
 =?utf-8?B?dWthOUVPbE5QSWdzOFBKS1pYcEhqWE15WjVSL1VlS0QvL1llY0dGekZtQTNH?=
 =?utf-8?B?Z1B4NjVWVW4zdnZBaitUTnhzazVLMVZHYXBNZHl3RkJrTkl1ellQY2FHRzBI?=
 =?utf-8?B?TFlEMkpLTUkzbGIwRXdGZVA0Z2VuVENTZlc0N3hxL3YxNHA4Q2lYZ01EQzBK?=
 =?utf-8?B?Z1Q4ZFhRQzJWanRCcEZ4NWU0QUNlWkEyK1laNDdoVjM2V0s4RjltelFmL0cw?=
 =?utf-8?B?RkxxK3RZQmpGOFFtbHRQU0VIU043VU9RaEtGTllhZHN1NGdWa3hycjVzUkR5?=
 =?utf-8?B?QjBraHBhYVZ6cUE2aCtMYmlSaEhpV1ppemJGMGdNN1hlUDQ5UjlnczN3WmNM?=
 =?utf-8?B?MlU2V1dQZHFXajdSdWJlVGcvWnVTdUtUdk5vUE8vNXBzNDhyWmxxekpTQ3lJ?=
 =?utf-8?B?aXdOZE53NkkxQ2Vyb0x1UUpZYU1TNzhQSzlwZGw3ckNmdC9INElocjZPK2Iy?=
 =?utf-8?B?UTA2SVlQeEdsM3NYYmVpQWNXd2tUYkdOTlBJUnl6WHZQSFBsQTJUanQwQkY3?=
 =?utf-8?B?VnZhRTFLaHQ4ZCtpWHBXUVFoZFJkNVRGWU9ueDcxUmxoQVFMcDBtZEhqSXgw?=
 =?utf-8?B?Z1VUUWQyckQvV1AvSFdvbUt6RUZMYUNDUnRhbHhxL3RRbmIyYkZWZHp6cHh2?=
 =?utf-8?B?ZUJzN0ZEMG05Z05yS1Q4Y3FxZElWZHZZcVlKZ01rMVllNFY4Sk14cE9GWGh3?=
 =?utf-8?B?NTBJVWxjaStZQVNBTDJxYmpSaTZZRHhtS3JoUzdYV2wxQjVIMGRhNko2Nnkz?=
 =?utf-8?B?a05XRFp0SlJjdDJrZDduQXRsU3ZWOGhyNDdTR0hYMnJ1YWo3THhOYUVXeUU1?=
 =?utf-8?B?a1NudGlUS25zZFI5d3dvT004TzFBc2tXdU0rd1BmNnNVUTZhazFuU3ZJYkhF?=
 =?utf-8?B?Z1VETDBycXhLWFBIRjVFVi8wbWVJYUF3TS9EUTFVMTFQYU9POE55VU9HK1Fv?=
 =?utf-8?B?aERTR2Qycy9UQWphQWptVWdPMnY0Q0ZCZHpPWlZkUFlJOHhIMWVBbWJxYUhV?=
 =?utf-8?B?NEFBb0Nla0pPT3Vad2I3QnZUemU5a0JpOWFMbFN0Y3pDK2d6SzlBMmUvMlpC?=
 =?utf-8?B?QllmUzUvZDJBdXJXdUowVUc1SlE2QXBXWG0zSDZBdWhWNnAwcU1Ub3JzTkNz?=
 =?utf-8?B?K1RBL3JQYkVUd1cvU0xSQ09KVVAyMi9sbkZ2aXVzT0NxVlFyekZaeHIrMlpr?=
 =?utf-8?B?NmRWWjRsQTZQQUZwL2tabkJSMndhU0djMFN3aC82QUJBUFRDMm50cWlCbUdM?=
 =?utf-8?B?d25Jb2tpbXdqNVJVYS9uZFUxZG1OTDc1LzBkZ284bSs5YWJJbmE5ZjBVTGlF?=
 =?utf-8?B?UEhuT1praU11bm9DaCs1T0lPbWJLeDBadk0wVFNnU0VPRllEZndXQ2RXbmFr?=
 =?utf-8?B?cDI5d3lzb3hONFF3WG56dkQxOUJYNCtTUDVZcW9pUCswTEdkdUk3MElzQ3RO?=
 =?utf-8?B?Z3dLTlpPTkliMy9NaWlSQ2Yydm5scGd3TnlmNk5aZWxlOUJTV09lOExlK0FB?=
 =?utf-8?B?OXMxa2VudjBUSFc3cmNKcXUzWGh1OFdDOE9uQmlDd3cya3FML2RaQlR2UW9r?=
 =?utf-8?B?NlNHUzZyVE1iV3ZhN3d2anRLejY2TFZhbk1wUDJvQmR3bzhCdVdWZ1NtODk4?=
 =?utf-8?B?dXE4WDQ5a09vMHJOV21MUEF6U3gyampaZjJ4SkJoMU5YL2gzL2ZQcDlhbjh2?=
 =?utf-8?B?am92S1NyRFdmOVZ4QTkyYnduZlZoeHYzb2tZSXJFZnZTNHZkMGp1d2FhdzEy?=
 =?utf-8?B?Qmw1Uk5QcXpmWkxXRktMNjhoVVBXSTYyemFUZ1JGQ1puTEFXZld1TGNaUzh1?=
 =?utf-8?Q?vIVo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm9vM242K1lyQlpCa0J4UERtSXJScmZ4c1B5VzgzQVVoMGF4RDNxM2JoYkZW?=
 =?utf-8?B?eENMSUFpb0xPWU5Vc1pJSEQ2T1BjZjNSdC9RTGh3UUxTdEY4ZHY4SU1zWldi?=
 =?utf-8?B?TDdCN3dGa21XOG5WamJxeDhvWmVWMnBKanltZzc4ZmdyTTZpOUxYTW5RVC9F?=
 =?utf-8?B?YnE4QXJoUlhQM3ZqRk51SzVwS1ZOckZTNHFsc2xKS2Yxa0ZxVjJwaFIzMFRJ?=
 =?utf-8?B?bDhuOXdINmN5S2pqTk1WL3Q1L0VRa2xjZXB3WTVXc3pwQmxOUGZ5djJENmFN?=
 =?utf-8?B?azNQcmNibW9OMytxRm5kWUcxRE10aWNZczEvZkgxTUVWNDcrTFBvL3hIRUxy?=
 =?utf-8?B?T3dQSmNuMk9PbHNHa0p0VjlzeG1HV0VYRzVkRFl3MG42N05rM0NqYWhRbWhk?=
 =?utf-8?B?bmdaOStwakxwb1A2a01LeXBaamdEZHdkZE9rNGliV1hKWXI1ellMKzNqRmhC?=
 =?utf-8?B?Sm03RXYzNjE3QjE3UXl2cUhJdXozVzVWZnJvZE5vNUZUNGZ6TkczRUhiUGwz?=
 =?utf-8?B?TFA4SzlieVlrdHFmR1NDaXAzNWVRbmc2azdhNU90aE9nQmVhNndYSHBISXRj?=
 =?utf-8?B?SnhHSk1JU2dGMHdLZUlKQ2VPdEt4WUxvSk9iQXVzd3BxR0oxdWFVV3NTZTdE?=
 =?utf-8?B?TEFJMmVSMVRTVmhZR2hsNi9KWG11MmdkL0l2MFg4Q0RqNkNxRWVBSHI5WXg1?=
 =?utf-8?B?aGhNR1N1bS9LUDJQWkRhWk9id0svcDdZUGpCNXlXRm5ZOExwcDZRYS9WdTh6?=
 =?utf-8?B?NGNjbEZzLzY0T0ptbTVhc0hKdHZQN3piS29CZUZHVDNvOTV2UkJNUzhxR1Q3?=
 =?utf-8?B?WS9tNkVLSWlydmtKb2lkS2JjTVhPR0FqNE11YWd1RVVNbS9IUjF6ak9nVnF2?=
 =?utf-8?B?Qnd0MXdoNVg3b08wWDNCTmRaVjd0KzBkdzd6VWhLN3BFcmJPZUZuVVdjOHdG?=
 =?utf-8?B?b3FhUi9xWDdKY1BPWGVWYUhMVGY1Z3lVSXFDa3NrUnFlVisySVFocG8zT21q?=
 =?utf-8?B?aWVta0xPbklKa3ZsVXBYMFA3UklPWWZ1UXR4cjhJSlVrQ2lxMEtaYWxzQ2Rk?=
 =?utf-8?B?V0hLSnJad2FTRUNLV0FKS2dQQWoycDlPdCtEbm40bnQ3bkI4UmVOMDhxUHRR?=
 =?utf-8?B?byszdUorclRBK1R6cjljQ3I5T1lmRHdFcEhIOHZ4WkdaMmxrRnVwTFBUOTZ6?=
 =?utf-8?B?RzZFMXNLUHVLaVJ3STRKbm8zTllzU2I3WTlybXBCeHBjeVM2WFIwSEM4aVJi?=
 =?utf-8?B?bmhaU2JMOFF4NU85OGdlNk13YzRVYS9nWG91REMyUWpUenl6V1hna05pdzBL?=
 =?utf-8?B?WU05ZXMwT2ViTkp3Z3ZXTVJGWWN1Q3pmcU9iM1U3R0FaU2ovMVVKOXpWV04v?=
 =?utf-8?B?K2JCeGhZNDFTbDl0Mm5LZm5vS2xzMEhLQXc5SkMvRWhNbFZRbjA1SlF3ZUF5?=
 =?utf-8?B?cUVnME1lQ0F5cXZsS1IzSUx2eUcxTXJva1ZqdVQvdUJRV3RrVU9HenM0dUxN?=
 =?utf-8?B?QkpUYmxxUDM5T2Q2VmwxQkFWUzFnbXJ1UXJtVjVJMTEyRmpteTgyMGtOQmhO?=
 =?utf-8?B?Tzd3cTBuRjN6SktVR3VBdDVHNTlIREVtRjZvZ1dOZ1lpYlpOb204UCtsK2xJ?=
 =?utf-8?B?SEtrdmJEbXM3eHI0Z0xuT216bXRHUjhTdEUvVzBpVXpJZ0srcy9UdFF4d3V5?=
 =?utf-8?B?MjlJRXpjK1BhaWJ0MzFjYTFEVjR4WXBCN3VBRzIvV2N5bmVoREJjMVVKK0dF?=
 =?utf-8?B?N29MTGxyVXFZRXp6MEh0em9rUnVEeE1ZU28vVkViTzFUSUFGdzlzbU5SdGZm?=
 =?utf-8?B?UG9uekJkZkZwMEFxYmZGZEpGYXY2YXJsOWdEcm1UYytsQXVMZVN0b3dUcitH?=
 =?utf-8?B?VDZHQ2NQMzR0M3dsQnpldkR3ckd5QVFFZi82bm0xOURUalg1NVZTcmlqay83?=
 =?utf-8?B?THdxV0ZGY2tMN3VtL0dyRDR1UFlrSlNBMk5iQ2c4ejd3NmRjNjV0dDBhYUlC?=
 =?utf-8?B?WkZWYW1qS1YvL2s2MSt0eDRodldVek5sb01Gcm44UG5WSngxTlZFeVBjWHFu?=
 =?utf-8?B?Mm5HSmlaUTNtUXdDd255YkhYeGMwR0VMdzRHUUJqQjlleTZSdFlFS29UWDhn?=
 =?utf-8?B?VzlOVU5lY3dZdVZQV0FVWWVXYzk0NHhGUEU2RG41OUdVSVh3SUY2S0NFdHpT?=
 =?utf-8?B?TGU2N3ZKSXVMWjBxcVk4em15MkVYR2FVcVQzNFp0RDA3Z0E0ZTNNMmlScTlE?=
 =?utf-8?B?V3NoSUZ0WlV1WXZzN3FOVHlJcmhQMkpTVjd3dFo2cVFMMUhqVXI5K1QyQmMw?=
 =?utf-8?B?bEllTXFob1k4d1VBMkVTNGpwNVdNUys1dGlGd1JWZjFNcWJ0NGhkZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2962c164-7eb2-454c-5c19-08de5dd8640a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:15:10.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbzp5CJgqRx4HTEAR/rhRdCvgYM5tVARUbmPoSUotknuQypoowInaww9pFlwqmVc39W4iJWH62dKSDDsipFnNzmcJmymxB/sr7qMsx0cBBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
X-OriginatorOrg: intel.com

On 1/27/2026 6:49 AM, Borislav Petkov wrote:
>>
>>>> vmlinux.o: error: objtool: stop_machine_nmi_handler+0x23: call to {dynamic}() leaves .noinstr.text section
> 
> This one would be hard to fix because that's the
> 
> 	err = msdata->fn(msdata->data);
> 
> function pointer which objtool can't see through.

Yes. Under certain config, the 0-day bot tirggers this with 
CONFIG_NOINSTR_VALIDATION=y.

Objtool ends up with the following path:

tools/objtool/check.c::validation_call()
-> noinstr_call_dest()
    {
	/*
	 * We can't deal with indirect function calls at present;
	 * assume they're instrumented.
	 */
	if (!func) {
		if (file->pv_ops)
			return pv_call_dest(file, insn);

		return false;
	}
     ...
    }

So every indirect call under noinstr is conservatively treated as 
invalid except for pv_ops which seems to be investigated further. In 
this series, however, the destination code is to in .noinstr.text.

Given this, I considered something to be adjusted on the tool side, e.g. 
by whitelisting the case along the lines of

   if (!func) {
     ...

     if (!strncmp(insn_func(insn)->name, "stop_machine_nmi_handler", 24))
       return true;

     return false;
   }

The existing pv_ops handling also looks somewhat misaligned with large 
objects like vmlinux.o.

> 
> So my suggestion would be to do:
> 
> struct nmi_multi_stop_data {
> 	cpu_stop_safe_fn_t           fn;
> 
> note the different function pointer type which we will hopefully catch during
> review in the sense that only *safe* functions should be callable by the
> NMI-specific stomp_machine.
> 
> Along with:
> 
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index 189b4b108d13..55a350048d4c 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -230,7 +230,9 @@ bool noinstr stop_machine_nmi_handler(void)
>   	raw_cpu_write(stop_machine_nmi_ctrl.nmi_enabled, false);
>   
>   	msdata = raw_cpu_read(stop_machine_nmi_ctrl.msdata);
> +	instrumentation_begin();
>   	err = msdata->fn(msdata->data);
> +	instrumentation_end();
>   	raw_cpu_write(stop_machine_nmi_ctrl.err, err);
>   	return true;
>   }

I also thought this change, but I was a bit hesitant as it could be seen 
as lifting up the no-instrumentation.

Now I suppose the net effect will be the same with other workaround, 
e.g. tool-side whitelisting. So I think I can go with this as you 
suggested (with a clear note on this).

> 
> ofc.
> 
> Unless someone has a better idea ofc...

Sure.

Thanks,
Chang
