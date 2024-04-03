Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB770CA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712137423; cv=fail; b=jBmTVZCuxVw51WuvgcAO24nDoVO2HQNbhEsJ1Zg98SO0Nj+SbMkhLAj/LseaOtqBnMcM8HvFirKsF2mFSdrNborhWb4WQ1o/UDA9nvWCOt6Zh2sMntQTMAYtrSWskn8qVy9ytwQ3dQpB2kQGdXznuNVp+mvlz/COk5Xg1MyV4dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712137423; c=relaxed/simple;
	bh=ZE902K3hAZ4TQ/9cveceCEAIsbhr47li650lUdYHGbU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LrE9FCdGh9OTzzljnvy0AtOkEzdoZBuqK4TyAwpXr2WjlheQJq3UyvVKLQQhwKYxbXNqnsen2POVCeJqTdVRbTzMYxl8dnBnR0VEv4ehRquYO9pmLI/ISgUBSlmk26CTv2meCJzqT2uykR1LduqTDYi54OH8Ah1Ia3nuZltb4O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tr4n2/l3; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tr4n2/l3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712137422; x=1743673422;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZE902K3hAZ4TQ/9cveceCEAIsbhr47li650lUdYHGbU=;
  b=Tr4n2/l3De5gSImRL36yl1hdC7DEq5H+Ry8dRpQeCitIJSYauoAs3HGf
   DiPkrkvMPHkLiAiioArIFKIV//txxcEkjCr44vz8XX8Nn/8kceaFxGOo+
   XUSaXn3OwlBuPJk82AYmGa0R0rJQc+MoVHvLvWlSq0hphtL9imGQ+2SQ5
   z6Uc/4xTfOMEZQZmEw/uwDU2JkdkA8U0zU4V4O3yU2hUODSQ74QjImOyt
   7lbdo//o1vUsOcu06ljv69k6t62+lctvaihYclLPWnR8TVItXeyDeLDOb
   rWrnan0k2cAsPLmFhxPwdfBtwxZiochQosOP9m56rpH/sVXH3voXNOyJ0
   Q==;
X-CSE-ConnectionGUID: Ysr9YIbGRBCzCtNx13V2eQ==
X-CSE-MsgGUID: oFXd/F4bRSqPIOJaMkvqIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7483615"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7483615"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:43:41 -0700
X-CSE-ConnectionGUID: MyZ5dJ9AQNmvByBki2b3Aw==
X-CSE-MsgGUID: 5O+kdpB0RIuMnyXJNKOlcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18961810"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Apr 2024 02:43:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 02:43:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 02:43:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 02:43:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 02:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnWZWMrFByqzQ8GPvj+1uDO8BAUf2C6Wj+b8CbZDbU1YC1nfJv+ckJvYL+QMBeH3HDGnuVNfvZXgvPXWyRgNeBFtXXStBdYI1eCM/CtPoDUh2gQKDhRqCeAc/1ubYdbM9NSva/lVEiTI+cesoGnX403xmWnIAI5WSbZYjgWMc3CaPu4S2b06JXv153on3ii9Za6ZdMghfztwpnRc5b91M9GVrsf3DS2pO/fz/VfRnmmfMFziWdwcDzmRfFkws6elt1fLENjI3R4qf7Caad5WdixxXXYg7qZmfnxNh7fXLszWa/Xt4yL3TgeZrlgs/+b1W2pDJP4QV2RvF8E6dl4wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtriuMIuIwWt6YKqHK5V6GGRWk6O1HI6Qn1yuQahSuw=;
 b=j/6oeW7o1rhHuYCIUH2CKPOeLMSA5CrZNa8T23BBXjG6AJx2Q1oo+D/m3q87/iqvGWfWKaUbuFAC8li56qqilMBOHtr5Ne50oleAyLvY6nFpV/Pw6YtxpJU/lhZ6zAj7JGxBiFqiyAcccR5ckceEjuwun/22+RAix+kRY4JP+r0ZkNBDp+jTjthsCj8Nbs3qR8KBNMNA+SJeLwrUiKsSGvfNOyJmfyj9Z8o1SaoXzhuBNn+3eobB5+pgKL8/hkfuwgkhvVX8XcQc035w7431wQ9JBsd/DPw9b3arvaopOQpPabAG/2cENs6SXf3vfKC/4+1n9j4t1XBkKYr3oh6J1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Wed, 3 Apr
 2024 09:43:37 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9%6]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 09:43:36 +0000
Message-ID: <256bad80-3d72-4691-867a-86896a684bd0@intel.com>
Date: Wed, 3 Apr 2024 11:42:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [alobakin:idpf-libie-new 60/74]
 drivers/net/ethernet/intel/libeth/rx.c:180:11-12: WARNING kvmalloc is used to
 allocate this memory at line 164 (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
CC: <oe-kbuild-all@lists.linux.dev>
References: <8bcbdfc-9be5-e1ae-c1e5-43ddec4451e5@inria.fr>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <8bcbdfc-9be5-e1ae-c1e5-43ddec4451e5@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0179.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::19) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|SA1PR11MB5946:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCdgYbJSRKBbf/oA5ImtVxr4iOqxNvZEM3Nt21qu4wVSFb/w1IIKX69sjXsWYtMtlz3+y5zDdvzYfBlmlNqs+yaI005cCDX8wjGA8blbTtpOmUu9L82DYmNeOy2plpikijHbE+U13C6G7VOjpgaJxo3W3wk/kOx/OwtIFqDCqsajQrvvDOkvmZ0ARpWJmfnJs45uDNHTA8EiZIJubk8ruKX2K280JoymnBK/LeChUbYVyC1sCGOOUTVml+kRJOAOfPgKiNXrbasD9z2bZp7mxELnpAzHUeLQuMxkS0duRIGXxqTOt4Aoq1rQTIkfuKEbWMlfy12wMKRxSydkPKIPooBGhswApXPnpueYJu+wFIBEco3nqjXvbn6QKSqlsUB5irfw5J/Sg+rTauGqWdWvXT+HdwYAHeqmh+mRgPGkTaYHDAHed4cLo4pfY3DZXJbV6DLn9FVXZviJP8vqFhQZe219ZCkH1wdGm8RwPVkIhI2sWO05lT/0w1SX0sEn6moUkYGOpF7qesgILhH2xzv4X44lS4ybgj9//nIXmZTMcpXsR5WuilbScBsHUBlW/uNVwBVl+FWzczMvxYyR8uBEBMrZRNk6qOfWdelSLF1yMO1knsRPjelHId1bzamrCreNs0h9rE1ZvqJkoQuGjl8u83F2mHb0NMUwhp3Td4copZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkNQQ1dXeWhBNVZxWG4vN0RCZ0U5U0wwTktSbnVmQUVUSDJSN3ZkUXFqbXhJ?=
 =?utf-8?B?Z1pzcm9ZL283andjbU03aUpkejU5QzFnY3lhaW82M2RhZlcxTDJrcU1PT0FK?=
 =?utf-8?B?c1F5Nkk2R2hmL0wzdEF6Mm9JVnp4T0x1bDY3eVN4UVVEaEl3K3JGdVZuU3lx?=
 =?utf-8?B?R3hlK2FKdUpid2twYmNCODlpV1V4bktXYXBoZU1YYy9FcU1uWE5NN29abUJv?=
 =?utf-8?B?aHJucjAxQ2MzbEtwM3lVL1QwUjhKdDN1T1pmSVY5Y0wxSUdMOVU0YVZkVUlx?=
 =?utf-8?B?RUZ6Ym5GOWdZWkdUQ2EyS1pTb2I3MnVORzVXNzErY28rckdYeEhqQy8wbjJp?=
 =?utf-8?B?cEs2eWF1cU1CRzlDUFV6NXlSb3ZsYWNuSGUxODh0SUpXcWE3aFlZUFZQUXZQ?=
 =?utf-8?B?VTh1UGU4UDNXcSsvVHFXVEZZaldEckxrOUF2TGVzM0I3RSsvUnU1c2ZrU1FS?=
 =?utf-8?B?cFJmRW11cXJ3Ui9kM1ZTV0FYaDVyMmI3UHdrbmdjVG55eEd0MmZDRnRKcHdJ?=
 =?utf-8?B?RnR3QXJyUE1mK1poWXAxQVgvaDVCbVRGeTFqd2JtcXVZUGlaTFlCTG9mUk9s?=
 =?utf-8?B?WTMydkN5WUtKRFliWXJVakw5dTJ0NUVwbW4zSTAwWlZBQ054OUpjVVpKMnBY?=
 =?utf-8?B?TGNOMnlZZUN2bXJrTW1WVDlibkhTd0d6VXpYVFg0bWsrREhkSmVrNFg1S0Zx?=
 =?utf-8?B?am1hUUhtSmZYWjNuOS9qVGhyOXNvcWJKNEovTndkSFROaU1jY3Y0Y2dsbXpD?=
 =?utf-8?B?elN6VGtFSDd1b3ZwcklpZnUrejZ0VXVHT3AxWGplaEZ4SFdlUkVlZXRtZUZL?=
 =?utf-8?B?S0NkTm1CbTRUTUlqa2g5Vm54WVdkOHQ1UGphWEpvOWIwN2UyY21nQWR0bk9D?=
 =?utf-8?B?d2IxK1ZKZldDaG5HSW93Qk1XbDdlV2VMZjJvVm9xckNKUlVWQWF3WnY1ZEpP?=
 =?utf-8?B?bk1XcURqNlJZdjRwRGc1eUNHVTIvQXVZbmFGaEhYZ3BwY2FsYk56VGdPTVU3?=
 =?utf-8?B?T0N3clpmM1ZPQk8rS1lva3o4RlI0K1RmRHE4YUE4MmFKMHdRQTlpTy9MYkFC?=
 =?utf-8?B?K04xUERNU0JkaldyQUhnUVc2Mk92TkNDcTh5bzJBRHhUYUh3K1F5T2wwVnAx?=
 =?utf-8?B?cHd1N3N5elkza0NnWHhJbW1YUnJ6TjBjR2VrQjFYdWlIbzMvOUxBbkE1MnVS?=
 =?utf-8?B?WUtuR1kxV0tRaDI3TVptVGxKK1p1N3ZqMEgrWmpGZEx0WFFtVDdUWVhjOHJp?=
 =?utf-8?B?VXIrQ3pLejhoT0U5KzZFbVJScERsRmd6RTlYY3d0b1B3cmx0UHYvM0ZmaVNu?=
 =?utf-8?B?a3NtMWM1ZDVHRThOV0R1c2E0ZysyRVlyN2t3SHpDTnpQYThCM0hOd1k1OC9x?=
 =?utf-8?B?NStyQWZOam92UWE4dENiSEs5NFlPZkVMemYrbFV1cHpaZkRVNXJhV3Evdlo0?=
 =?utf-8?B?clpvUGxNYm9XT1kveWlNTjVCbVVoeWJNSEVLUGhSQmVJWHZUQXh6NElqaEIx?=
 =?utf-8?B?bTY3VGdDb2E5dzljKytQRHYvWjUxZ1VIK2NBVjF5NVlZQzJuQ05vcFZTQVJW?=
 =?utf-8?B?QUVZSVc2VmVmYm8rcVdvdWVXZCtyUDhWOEI5SitndU9GbnFhVUNMUWxaUkx6?=
 =?utf-8?B?a1VFZmJ0ZEVuMWpRbStPOTdtVHVMRE9mVWRHa1BaZUwwYTl3Zk1QRjFhUHFK?=
 =?utf-8?B?SEl6WTU3MDI3ZGNBWWx1RmdyYk13ZEl5L1BVbU9ZTXBoQXY4TlJGL2dnMk1P?=
 =?utf-8?B?SUFuNmNJK09nd0tSYldodDFGVWhDY1d3d1FxYmNURkZsc2hjQ1p4cTZlQmps?=
 =?utf-8?B?QThBYjBLUXRGTXVuTG1ZbE82RnIzb25zQUtMSzF1MDdaRDVRa25Kd1JsRWVi?=
 =?utf-8?B?eVVHMFBVNkNGWmV3dFQwS2R5U0xUb25ZekNWRngvVTkvbitEVjM2OGE1NHZm?=
 =?utf-8?B?R3MzOE9LUElsNFhIYlBqUDhDbUIrb2VPT1BkRXl0RUZqclZ0QjlCb2hwcFBY?=
 =?utf-8?B?cGs0eVpwYzBUNks5c1VpQ2lxc2RnQlZwQTYxeGhLOTRrTXRWL2hIU01nUW51?=
 =?utf-8?B?dUFCazhkUGE0NUxoZS9jeU9zTTZJSXFrR2ptSElyZy9PLyswM1g1YlU0TDY4?=
 =?utf-8?B?emxEZWNYWmNDOGo3UVZuTG1vazFGeElmMEtXNU1lZWhDeC9RVWN3R1U1b3hW?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3286b56-5b2f-463a-a981-08dc53c288f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 09:43:36.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThYfPqYMgxG0iDg0+V86K2FCHkLP8lchSgQuGZuTG+1ud/FJulko4I1CRIch+0/2CRA6DhHwqvAeKtrfRtCDeZkyHcJDnT//8Tge6DYBchU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: intel.com

From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 30 Mar 2024 18:54:52 -0400 (EDT)

> It looks like kvfree should be used.

Fixed in the current tree, thanks for spotting.

> 
> ---------- Forwarded message ----------
> Date: Sun, 31 Mar 2024 06:12:57 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [alobakin:idpf-libie-new 60/74]
>     drivers/net/ethernet/intel/libeth/rx.c:180:11-12: WARNING kvmalloc is used
>     to allocate this memory at line 164

[...]

Thanks,
Olek
