Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995874C66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220023; cv=fail; b=f+58UfZW7RuH/jsnbbz9uSmZsQSc3FnQJ7zHF+LjB/YwZHW8zszK9uOL2ZusLS1NNH9qzYPAoGXef+EHzjX4LdqLK2y7Yc8RgbJXLuaUS94LbtBPQtBawjb+YRoAFZCvEcdVIeJUsVmw9FpREOJ0wBCLaA9kruo0FKX0IE9Llos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220023; c=relaxed/simple;
	bh=9JhqXbe7WNKsRrksalMrhkAZVgdmKyggAplh8rz7I5I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gz+OxWp85OC7ZMxP0fCrjr/2ckihpc+K6xQC/86a0J+rWHXpDKU8XCPRtE7WsCZhok8VgTV3R4vkApMzTQcsnmkPgyfh41YcjKyx6ZfgP2WcvfkYMefUedL9HxBXUbj6YfE554E+KXpeOtHR8JsfTFwEP7gr18HktDfGhxWWn4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjJql4ky; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjJql4ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716220021; x=1747756021;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9JhqXbe7WNKsRrksalMrhkAZVgdmKyggAplh8rz7I5I=;
  b=KjJql4kyOx5QJmILAI5BrIE1voXJTGPB/OnofFiN+RyHiFK4nfbunK/A
   clH5LccJQL6uGyFmMarT1iEPOYKnn9mRlIacg+T2JWbOHKyrsMEG6nwZA
   Sh8TEwN8pqi+5azUF6FIbBg3s66TcsnPEGL0w7LZikRWNm9kBScNmGqP+
   e6nxPqU4GMwUCupA+hUOwhbiIchmLT1l42FVTjU0FzMUzmfKwd+V79vLS
   JHBP9WFpueeUTF0LnzmbiyYx/uVXkhmXSj+/CK2PXel7vHEjrxcEiEYTM
   ARQ+Z6IAS4VChsA++Ns/RXfhu6O4ed+I33xATCb/QId0ZzjAuoA+M4U/F
   Q==;
X-CSE-ConnectionGUID: XoU9tdidQKmAoYg+AHwP2g==
X-CSE-MsgGUID: GqiiVZanT7+EJHwHFND/2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16186686"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="16186686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 08:47:00 -0700
X-CSE-ConnectionGUID: tD8Vf7LfSGGQ7RNWkELRvg==
X-CSE-MsgGUID: Ij6XLt/sQmG+23GwpCcFxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="63816125"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 May 2024 08:46:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 08:46:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 08:46:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 08:46:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 08:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR2D0HdDP9UBxlK3O3Qxj4hpO2LvHWUwBw06Nl0cyCK2Dd9pr0yGx5rC5xxt/iMsocoAJHcXDEeL1VGriKI3kBLEhtrglixbhhjhZTAMalln4yL/odX0E2UA636wi7VlQrbjemBYnfOrGBx8JLH73cfXh9ZmbjKQsUOuterZoIltq2BB8bxt/nt7euXJi4OI7RWoGH7N8Xt/j7Uo5r8hdhoEcd8fbyykkGE2e5CCm17qCFrhNC2oxpNh0ISooAaDNIfyyNK+cHIhyiHKLnXDSlc3Lch01zCZs5TvHvLuxnLtjU+EQBqnZv+oXGZ6dK9jaDBTEx4iVB03+E23th/KTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56Nh0/SuYlDuiYGeNcajzyqDj1CSRLHLSjNHIuCBc7g=;
 b=Or9RjbNKzJ2eF1qXbP8zyIbcmiKpARrv5TpLW6TABE1sqCiOsNatBeaClCaPieMyy+lEp9tFY4tBEbEEZYBZ2YPtMHjlglJBzEE52CYFbSwVZdI6Wmnudf8PTRdsQbW5jS4T1Bst7mJEk4TVWtx48u35AKYGTvPiCxkf3Hhvi3C/Tt2HhXLFwWQu9b/3R4XRa4gCpi0vfVLjzPhgHXQKmq5T6cgqm7Mbz542mOtNYgMt0ZVwv2eigpPTp6N/T+JXDJXUWA0C8/VNicRexIdpEZJwryco+L6oVnx+Nie4tXIIfZyyhxuo9ovSq4ZIP4qCuqLhCwxTsBzftgun5ffVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 15:46:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 15:46:54 +0000
Message-ID: <7ca86d95-995b-48f4-b904-c16c0a97a8a4@intel.com>
Date: Mon, 20 May 2024 08:46:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [intel-tdx:tdx_kvm_dev-2024-05-14-mmu-prep-1 22/115]
 x86_64/apic_bus_clock_test.c:23:9: warning: '_GNU_SOURCE' macro redefined
To: kernel test robot <yujie.liu@intel.com>, Isaku Yamahata
	<isaku.yamahata@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
References: <202405181535.WFKy4EwQ-lkp@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <202405181535.WFKy4EwQ-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:303:b8::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa7f6dc-1937-4d9a-9ce6-08dc78e41301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGlxalBKbTY4ck9NdjJhcmxzaWJ1bnd6YTR0RXhuY0xkN3Z2SkNXcFF0T2tU?=
 =?utf-8?B?amNsWGlML241K1hBNHZXLzNuTVRqUGE0eW1Qd1B1QjNpY0VaZ0FJRVFrMVpX?=
 =?utf-8?B?OSs3S3MrbmhPbE96bFo0b0h0S0pCNXU3RUFwZjRaenRHZHdYeVZLaVBPVkc5?=
 =?utf-8?B?eW0yOGlGdDcyM0xacElIV1BXY2RpaHFtWHBJeFhBNU9wcW5MQWp0eWx5TzdX?=
 =?utf-8?B?S2FjaHZYbEtyTnpTVVMxYmdocHJ1d2dFd25zYWZUSi9hL1BJYUIvQjZuclcr?=
 =?utf-8?B?TFhKT0tUZmVqMXM1b0xwK3J4aWwrTmlWWlR1aHNqV2VJSVMzRmJQZTUySDhK?=
 =?utf-8?B?LzF5MnAwM1k5cG9zS0kvT1lMaDExZnV6dGZLbkJJV1dlU09Ca2NjYTlYemx3?=
 =?utf-8?B?bWhjVnNVU25LdlIvK0RGaXpqYUg1ZmExVit5YTdNczJkSkZpM0ZJWkNsWTVM?=
 =?utf-8?B?b25YaXJGcDdDLzlIY1k5WXB6MmJtNGp5V3laWnRDNGx4OFhFeWxPR0NzWTM0?=
 =?utf-8?B?Vm02S1pJWkNVajN2QmVFMFo4dXpyNk8wQzljeHFyL3JEYWFQcUZHTFNkb3BM?=
 =?utf-8?B?cFhWMXd0VVUwWGVmVUg3WjlXQy9TSDIzZlcvRTRLd3B6ZXhqR3BnRUhWNk5L?=
 =?utf-8?B?UEhBdkZ0SlRhOVNiUlBBUlpMSzc1RHZFdzlsdmVhaWp3Umc2eGZwYWlKSDlr?=
 =?utf-8?B?ZTJodm95SFlwQ1VBWFdjdlVNekFiVlI3ZzY4U0lOYXhaenl3K0NPdlA0NVk0?=
 =?utf-8?B?NlBBNzJPbys2alpJbGU3dytIekNkZmV3d1N5UVptOXdHR2oreENNSWoyc01p?=
 =?utf-8?B?aVlqbVFVcEtQUXJOY2grZkxGbXk2LzZqSE1zaTZCdHNRVElzSmtUcDdJbVJy?=
 =?utf-8?B?bXZmLzVacTgyUlNlSlplTW9yZWo2a2dubFBneTVoaE9ER1BMSHE3bkFXdEtD?=
 =?utf-8?B?NmVLOFd6emRkeHlnUTEwK2E4ZGx5TCtMcW9yeU9PaWJWcXNacUpDWnlsVnZx?=
 =?utf-8?B?US8vODhINGZ6TFNvdEZKVGdJeUVBL2tsdnFhQWtLUTZxZ2pMdDhaenVpT1dv?=
 =?utf-8?B?WGdkMTJad3lkeWRKVU50V1JIZ3ZnZkF3ekZvSDN3RVMyWG00Yk5GWXZ3cXJu?=
 =?utf-8?B?MUlQRU0wWFNBUS8zdm5YQnNMRjNhd0EzL3dpbklEUXBkdEROWi9MUkhuQmV5?=
 =?utf-8?B?eklrWld2dkxsNkVsWWJERitkSW5KMTVPMEZWc1Q5cVY5NlVnWnMwcWV3aVFH?=
 =?utf-8?B?TVZRL0JnNTNoZm5SVU5pK3pwT29EWkEzcm5JM09UaTlZQTRlMTRaTnUvWjdZ?=
 =?utf-8?B?eFJOckRtRlMzcytrbXNOK2lHQTBIOXh4eE11b3BKcTNVS0JDeHJZNld4dnlI?=
 =?utf-8?B?eXowZTdOSHpsNUJUSFB5dHdQYjZ1ZlM2NWgzYTM2YVJtMUtjZ3JETW83L0Jw?=
 =?utf-8?B?cHI4T3l2RUdvaUIvVk1yS1FHeVN1dUNMSGRMMmpqNHRoRVhRYjdUVlU3Q0Rv?=
 =?utf-8?B?a01DR1BTcGZQWEF2ZGFLbjVHR0Y5VHJHMEtEcXFPaExTRlZXSTVXeTZIN3lu?=
 =?utf-8?B?b1NmT0JIckdkOGQ2MEVRUHZLOTIvcG5Mc05NTytLeVA5SHYvaXlvUmVZRHRq?=
 =?utf-8?Q?tyWf06JewPqeBdzcjFbinpF0PbL77Iar88P4aTQ/nWrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkJZNjFJSmVwdXRQbHYzN0dtMmdPVmhNVElBSGtBVU5xK1lGaDZiWVg2V2pU?=
 =?utf-8?B?UnpJL2xFYWUzTWc2Z0czalRuY2dTNXVENndJNytGVkFUYVVacVZJV3FyL2h4?=
 =?utf-8?B?ZVl5aitOWGgxalZqUGxjYi9iN0JXQlk2S0pmOWRvejdYcG1zWmRSL1U0cU1C?=
 =?utf-8?B?RnUzWjBhU1Z3RllrRVVtdGQwSXBUQVRVUDdza2JsVnd0NDdTS0VLbFBqT3lu?=
 =?utf-8?B?VVBDREhya1BQV1F2YmxkUXNSWnhDU0NDaFhqRVZWMllWVFF5QnhJdlVNYUwz?=
 =?utf-8?B?WHhuZ0xyT3QwQ2FIcXQzb1V0Zzl4T21EdmZCOWNyNUwvWmoxamJYL1hJNDNC?=
 =?utf-8?B?cDdVT0N5TlVwdTczMmJkODFPTEFwd0NwVUZCNlpxL1UrbTcvbXFjU3FJR2JG?=
 =?utf-8?B?Wlc5QzFqVXYyUUVQZTJEWWUzblNGTW1Xa2JPY0tuOGRaQm1ES0c0V3prV09L?=
 =?utf-8?B?WDd3YTV2Q1lMUFpsekJRdEdvVE1QcmIxeGc1ZVQveTRmNmNBamY5clgvM2w4?=
 =?utf-8?B?bmI0S0xaamp3ZVlpSHl0aDFPckFGVkZmRXlVVmhva0FhZE5tMDBCaHJGaFVO?=
 =?utf-8?B?dTFScUpMaklYclhVL28xWTBqUlBnRndnQys4ZzRiSnFMOGlTSkVCNVZXbmxx?=
 =?utf-8?B?TEdIZ2ZYbExPekRMSlc3MVZPK0IrTkVIN2twamhMa3JUVFpzMHd0clFtOTNE?=
 =?utf-8?B?NlBFVGlRaGVlOWE4TzRPd3g2Rk1tdFQrcGVYVXJNL0tDWmFwa1lIc2JIcWZ0?=
 =?utf-8?B?NWEwcUJaRmNzOVg3T05aK1JrSVErWEM1VzA2YlBKRUtsRVZlSnNjSWs4dkRi?=
 =?utf-8?B?eWVrQlJwU0E1bFdsTTByREkzTEZsRnlBcG1Zb1IxVDl3QzRpdVJkRUNKWENl?=
 =?utf-8?B?WHV2MmFKWHJOaWtuaGw4SWk3VEo4d2tYQnFRMWI4QUJEZHBPc3dtalVZQlpo?=
 =?utf-8?B?bzROSVRoU3lxTkF2MDBJdm1ZSjB1WXBBZ1g2TitmT2x6N2tMaVlMSnFqc3Fa?=
 =?utf-8?B?RERsbWJjTHNGWFBMS0R0MGdMKzQ2SXNnbzhwNnkxSlNEclpkTWszTnJuNnN4?=
 =?utf-8?B?YUx2TGkzRXFpNnQrMFZ1OGxGYjVrOWdvU21BSGpKNk9UcGhhZlZxSUdaNjBs?=
 =?utf-8?B?d0hSTW04WmdFdldoTURTTlN2NDBoTlpneWFjQlBGWjREZWlrVDJGbkhXRmV3?=
 =?utf-8?B?TGd1Rm5BTUIvUzhtd1VYZXlnekJTTFkzZTBrZVVKcU5qMFN6Zm1aL2VyQXdn?=
 =?utf-8?B?L3lCWGIzOGFuNGRXdXpDSW95RkxaZktmT1Fxcm5OZFhCZUFaWHh2YnE4WEpX?=
 =?utf-8?B?N0tmL2tyZm9HSWptVWRudnZUT1RNSW12T1lCNEhjUlZXaVlrajQzemp3ZVRQ?=
 =?utf-8?B?eUFtYVBDMnZTRVhiazQ0SUd3bERrazFyN2xPTEJZUVNwV0svRlRnVDJtYVdr?=
 =?utf-8?B?RFdqbU1sMEM1VXEzTFp4YTByKzhTdndPd1BCUzlWM0pDMzlpcXlaWE8rWW9O?=
 =?utf-8?B?eVlZL1BTMFMyQlJtRklRODQ0OTFPcXMvR1UrZ3hjNkI5R29DaUUwNXNaZFc3?=
 =?utf-8?B?dzZBTG56MC9RN2daRXZxY3RPM1NTR00yZ3ZBa3hLT1NDQktrWVUxekVmUVZ0?=
 =?utf-8?B?T29YdkpSSXI0akNoSlBKa2JIYldsa1d6R3BsVmdrMW9BZnhGQWJXNkdzU0NT?=
 =?utf-8?B?d0pmaC9PZTZRbkl4Tm42aDRyaS83ZWVFOVZtYmlmTnpudEp4Q1M0bnhIQk9V?=
 =?utf-8?B?N1hFa0sybFZHdUYxc2xjb29Ka285ZDNpMU1JSXFDTmJTN1UxeFlKVWpOaVNO?=
 =?utf-8?B?aHV6MDFyV2w1WUNPcEJPbC9pUXFQSUQ0Y3dsRTZUU21KMm9QRzBSTDduOHNC?=
 =?utf-8?B?RzBuVzI2RFlBc2ZnZDFyTVFLRWtia01yOUR0em1aUEdEdW81ZjB1NFZ5cy9S?=
 =?utf-8?B?RG0xV2xXcU1ndVBkMDNkT0R4bDM1QUpFQXFHTGc5R0tMZVpjWVFtN2VFSHlV?=
 =?utf-8?B?L2FWVjVTOFlrSkVTSXhGaitMcVNiY2NTWDA0a0d0bnpvc3dMcDA1NnJqRHlH?=
 =?utf-8?B?ZmZhTFR6d2t3VTJxYUgyTnB0N2ZlUjhpZTI5ZUVJNDhZdU1VRnNlVS9RenpY?=
 =?utf-8?B?ZzVyRElIaDV4OVhkU0NsMjVmL1ZLSHIwdHRvTUlhTnF1bW5OMjJUSFA4ZTlO?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa7f6dc-1937-4d9a-9ce6-08dc78e41301
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 15:46:54.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0aEIzzz+tFZLAZ/p/UL0pzhtVoVEV1pFjcLYnY7kTFJ+VXUInXz6zUV1bt00nNQ6bJTdb9Yp8hquDjhtgc1WgHhSR3O1cDQfRHqfaf9Cts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
X-OriginatorOrg: intel.com



On 5/19/2024 7:35 PM, kernel test robot wrote:
> tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-05-14-mmu-prep-1
> head:   076b4da9ea74a0b778ae01a05c3a36b8d8e1fda3
> commit: 6ca346be0a271c01e0b0847cb9ed4ca90aecffac [22/115] KVM: selftests: Add test for configure of x86 APIC bus frequency
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce: linux/tools/testing/selftests/kvm$ make LLVM=1
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202405181535.WFKy4EwQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> x86_64/apic_bus_clock_test.c:23:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
>       23 | #define _GNU_SOURCE /* for program_invocation_short_name */
>          |         ^
>    <command line>:2:9: note: previous definition is here
>        2 | #define _GNU_SOURCE 1
>          |         ^
>    1 warning generated.
> 
> 
> vim +/_GNU_SOURCE +23 tools/testing/selftests/kvm/x86_64/apic_bus_clock_test.c
> 
> 6ca346be0a271c Isaku Yamahata 2024-05-06 @23  #define _GNU_SOURCE /* for program_invocation_short_name */
> 6ca346be0a271c Isaku Yamahata 2024-05-06  24  
> 

Thank you very much for this report.

This is a result of recent commit 730cfa45b5f4 ("KVM: selftests: Define _GNU_SOURCE
for all selftests code") that makes it unnecessary for each test to duplicate this
define.

Since the series [1] that triggered this report has not yet been picked up I will address
it in the next version of that work.

Reinette

[1] https://lore.kernel.org/lkml/cover.1715017765.git.reinette.chatre@intel.com/
