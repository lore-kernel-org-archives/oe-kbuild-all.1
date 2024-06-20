Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB343AAE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866675; cv=fail; b=ZTyBfp5+wxnXbQOxBbC7u3bPY6X1gLfVnA+wm42gPSr8BtEdxgBeRdkZHYyY3HkGUI384kMLqLiXoN5L2fzqiOTSj6236Hr6s/t6y/GxQeZNIzCXCzExIT8gOc3CK50yfY0/nt8tFTnxS/l8szkC/rHzIXM35zE2dB1p/ixfyNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866675; c=relaxed/simple;
	bh=hCNi6N1ndq7wz0DanH2GD5/PJY4vq8mGsAy2N1uXF2w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tb7j6NwcZDQL3/v7DWPQW5ZKY3WKnGOmQtV3xsofMayvszbBULMdrp6POdYIk3F89o8oeHFMnCnj01e4JCPaB04gtx/HypOcDrYHEDI2Gn5b+SGVvW7IkZFwwMtxi/HI+Bt51p6gJaIyszmBWa/wmxo2hmIeVOvABQE8LvrK1cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjpYFhso; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjpYFhso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718866672; x=1750402672;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hCNi6N1ndq7wz0DanH2GD5/PJY4vq8mGsAy2N1uXF2w=;
  b=TjpYFhsoc08f77IPsIpCamVO48YcMogQi9GZ1MSJ28Q+eJi0U1jbmxLo
   4PN+jw6dBeOhwddJWH3QxLaLZrcRwuAhRj/DgcwyLDJoSjF6buaGZRZ0f
   9h4QSveH2ixEs4CG1JY/3ZNnh/UU9xmsHnfpb/F9gQOlDujHD+vWkRrfw
   VfZzeOF9hGeY9XxpVcF/0NxylarSysE4CGUSHyANFRRWPG2NK+Cr/0KuN
   Ve50BYmf+IHOx5cIuXeu3hcQSwAmufiFAlm59kBxGBHcp5VcqgzgRfbOK
   cYXSP1XD8pHt4F9RR+e8RdeZnfzGKPfDwTL7OJSASiBaT4CLEO2TtdieN
   w==;
X-CSE-ConnectionGUID: oad2OgJ9RT+zMT4cXGXZOQ==
X-CSE-MsgGUID: G0V7kYU6QteES8Rvonfilw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41229108"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41229108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 23:57:51 -0700
X-CSE-ConnectionGUID: S9RpDFQ9SJWvg5dAEm0Evw==
X-CSE-MsgGUID: hxhTUEz5Sdqp7JnquEVTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42001742"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Jun 2024 23:57:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 23:57:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 23:57:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 23:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/PiG3uf+8Mr9nXJhadExmpaYpR55MrVFlCXOCvt+obC2nYzgBiohYfNJj1nkIF8OGnXK1wD7UbCsou3urpZ3NpXCLLqbzBn/bT4ScpLQJtTcIaux69/04F3atZmLQCtPiEn3SC4cjqvZXcAN4byfiHbSK5jLA49je4HsPULBxr9SRYrVOnzys5G/HO8XTL/wkaXOAsIj+dl9QEkehJUM4e3CL2qEZp1Q2HjEJi/quEmtrsE9PsOROXU80xypjGbEtd9EdXT0VMHl4xAVsHiOuo9ExfkhiHs7acaB7mV4nVcj0VcvBmdeHY7QL+9FL4ZAOtW8yDb0EuDa5oEuwZ/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCNi6N1ndq7wz0DanH2GD5/PJY4vq8mGsAy2N1uXF2w=;
 b=aLyMWgEYYSjokba/EnVUuE03tXq3/pjXFm/rv4z8Pi+lTfYF773T94pr/sksK0EnOXYL7BjCcR1fCoS2naqi5VDotGWhU8WH0uKt2Jo/xLOM6pWZrfBVFIGfUVxYLMhpGmwOCY4T5RvdrgWg6cZ6h/kz1W0T8Pl2p8MPDYMHgRFxq/zbN1MMn7DQU31Zd5v3dEPnn6LnK6fHzqncIkIC/q2Ilt+6J5heDVYDHzI5snzcU8TKX9Hry4fwi5inMhSsESWl0r1BP8jk6q5s5GsIiCWk6n+ixrW4IbH7UJqs/T128GWsJqyAI30EZCrRivWajvj/v2rXBN9nTlTydr9LAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 06:57:43 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 06:57:43 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "21cnbao@gmail.com" <21cnbao@gmail.com>, lkp <lkp@intel.com>
CC: "v-songbaohua@oppo.com" <v-songbaohua@oppo.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6728/7105] mm/rmap.c:1413: warning: Function
 parameter or struct member 'flags' not described in 'folio_add_new_anon_rmap'
Thread-Topic: [linux-next:master 6728/7105] mm/rmap.c:1413: warning: Function
 parameter or struct member 'flags' not described in 'folio_add_new_anon_rmap'
Thread-Index: AQHawme3Yg5nuoUSZU6H8v5L4jbiVLHPlFqAgACi4YA=
Date: Thu, 20 Jun 2024 06:57:43 +0000
Message-ID: <49425b13ccc4d20bb2d08a3b94a710a12f281b96.camel@intel.com>
References: <202406200059.tVU9semU-lkp@intel.com>
	 <20240619210641.62542-1-21cnbao@gmail.com>
In-Reply-To: <20240619210641.62542-1-21cnbao@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|SJ2PR11MB7474:EE_
x-ms-office365-filtering-correlation-id: a3eadaa1-4f8c-4dd7-42f2-08dc90f64888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?ZjBDQnR3U1BQMnAvMUVCQ2lNNldmbGJpYUVyakZzNWJBU3diVDlQRm9NWmNK?=
 =?utf-8?B?MHh0aVh5dlV2OWkwNmRjNkNoL3FXNnJQc3gyMjkwT2pCM0VjSzAvSVFoUnRR?=
 =?utf-8?B?OWhGUlFRenBQRURtZnhQRUdsYVRuelFaNkY0YS83Yk1xalZ0MjZwL29FcGFY?=
 =?utf-8?B?RHZXeEVOQUdEVUZmWVJqUm8vZjVBNlcra1pVMVhRdGY4ancyTUJwWmxIQ0pG?=
 =?utf-8?B?OGVETzlJeGNYdys2eklEQmlzMkoxTDdVeFRLbjV4MDFpVXg5TFgyZHZURnls?=
 =?utf-8?B?RWMrd1pZZU5FRW1ZdnVSTnlVdnlqS1VKOE43U0d3UDcrMzhjYk5qcHRhNElq?=
 =?utf-8?B?VGdQa1Zkc29hU1FXeTFobFlwcDZ2aEFmdVRndS92Q3FVMVFtaHJJOGZDOGhP?=
 =?utf-8?B?R0xMRnhrUVBIc3diU1dvdWdNTE53MlIvczZrQlpDRURhcmc0clk3OS9UQzZl?=
 =?utf-8?B?VHRqMzNJQlBYRDlCVTM0NEtIYnZsZlZEYU8vTDhFOXlqcGZqblBXUFhLUlgy?=
 =?utf-8?B?Z2t5YmZwKzFEdmdjQ3VEVkpiaC9uVE9HOFpjcFZGVlk4NFJCZi9OK1ZPZncy?=
 =?utf-8?B?dG53UDA0UFRmMnArVnJ6RGxnRnoxRmprcFdIQmR0QnlCMDFoakd1SGR2dTUw?=
 =?utf-8?B?NVlTSjJkekx6bVp5TTQ2TnhZL3VkNy93bzVyNGl6VUJYdEliSnBqSVcvWDh5?=
 =?utf-8?B?OXZkUmxVdmdRQUxBblIxU2ozcnpnVEI3MFVNRi9OUkltdUYzYms2Wm1lVXYw?=
 =?utf-8?B?VTFxZkhncGFsR1JHTWxzQnpwN1FtSldYbFJpM1pIQktaS0lPZGt3cEVxYjBu?=
 =?utf-8?B?L0V6TWMxZy9nWktwbnRLMUplZmhXcVozNVFjYXEvYlZPWis3Q2IwbXBvdC9D?=
 =?utf-8?B?NjRWU0UzSmt5NHQyKytoanQybkwrcXBYR3NwdmFzcHAxU2FheVNpMW1XMjRX?=
 =?utf-8?B?YzJ3c28wNDcyRUVKOWQzL0hSb1VmbzByeTJDdzdxY282cjh5cnVUNS9rVkxw?=
 =?utf-8?B?MG8wTkVMTzNOLzFvS01pelJ3T0Y1THM4Rko0cTNIb0RsL0xWZjFvNDUzOXpn?=
 =?utf-8?B?aE9OMlNlTFovQ0ZTV1BPbStzb1NBaSsvYXN1RlUya1NLL1ozSmE3UDFiWkJk?=
 =?utf-8?B?QkMrRmJkQU16bmNmYy8wcVQvckhUTC9KN1dlc0xpUzdhOGcramNKNXEyQzY3?=
 =?utf-8?B?YVNlVkU4M3JmZFZnS3R1V25uSitJbHhDL0dqekYrVTVFUnU3VS9JeWNVRy91?=
 =?utf-8?B?cVFUeDUzR3VlMWF6blpEM1NlZ3didUtOSEJwbkJPWlNleWppVEprR1F0U0pL?=
 =?utf-8?B?QWhkTi9RVG1WeTdSWkptSEFqeFA1MjVqaldVYUV5ckVtczMvLytFVStRTGpM?=
 =?utf-8?B?ZkVlVnBUOU5wV3hOYm12cXFGRnErWXdMckFpbjZURlkzTDFlK21SblFVTmJQ?=
 =?utf-8?B?eTUvanhVWlFPcTRmWmg5UHlJNlg3ZHY0c29iRE1kVnZBRXRVd25QcXlRaldS?=
 =?utf-8?B?S3YwR0Q5N0hiSlVBVFhDUS9JaUNUVXpBR1ZUQ2dXRVA0R1c1bXFxQXRyd1pC?=
 =?utf-8?B?cm5RWGJyTWF3K0c2S2FBNFE1WDR1R0VnL3ErT3N4RkVnSWdBclRhdzF6NXpT?=
 =?utf-8?B?QllOcmgyOFVadlNmVW5tZjJKM0NDQlZYTlZCVktURVFkM1ZrbzlDcjFjNVRn?=
 =?utf-8?B?czg2dmxyUTJDcURHVEFUWTNzcFV0bEk3MU1EZlU5cWhVeXlxZks0V1ljYmRh?=
 =?utf-8?Q?HJ6rtEO/nbqxEH7i9JKzXXiBsOO/azjO+6EW/xw?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzN0REVsanN4bDBRWXR5OHh0bVUxV0dBbjhYZHQzRzBoS1ZPSDZKUlhjMmc3?=
 =?utf-8?B?TE5aYk1KVzFoK0N3Skw4eEtaZEZMWVBSTlNRMWRYYkZaTHRZYUNzNXdKalA5?=
 =?utf-8?B?QjVvVFNKeENlTlNSdjB3S2tBODFuaDQrK0NmMStrbytEd0s3aVNBOFZ3K0hV?=
 =?utf-8?B?TTVjV2U1N0dXOHh6eVRMc01NVi9LakdxSHFmZ0VRTmlMUDRveFJieDhUemZp?=
 =?utf-8?B?VE8zYWJGaStXR3JJbHlaSC9pVjAwMTJnaDMwQkh0TDN2SE9VSzZxNDVNU0tX?=
 =?utf-8?B?UlVYanVSSEpNVHUyV3ZhaTRwVENROHNGUm15SWYwZWR5TEpFdmhGSzVwbjZx?=
 =?utf-8?B?Zm1teG5aZ00wbXN3bll5VEQ2YmZVT1kxRW96eW5EM3ZpSVBDYjlndXQxREQr?=
 =?utf-8?B?Zzg1U0UybVg3MVRXYmsyOUNkNFVERVA4eFBlMjV6NzRHbnByYXZzS2p4MDR3?=
 =?utf-8?B?bFBjczBTbVhMRTJnSkJrRlpiVWxxdWlRcGhuQmhDMHZ3RElvc0lxUElKVW5z?=
 =?utf-8?B?ZThNT1g2QjlyZUFuMWNtMWp2ZTdhTC9VSS90SFJKR1Q4bGRDR3V4N3lpczVC?=
 =?utf-8?B?R1JRUC9OMVV4YlJUTTAxUzVUaHpNb2pBcWMxeGY2VXgrU2MyMlIrSXJCUlJG?=
 =?utf-8?B?aDZKMkRBU1dMT1ZYV2RhaFVKUHQvUm42RjFOL2hQalhMQUZNVG90RGxYUytH?=
 =?utf-8?B?VnI1QVdqbXBIVHA4ZloyM3kwYldCQit0UFhHc1ZCNjM2TCtjRmZBdE5SRmtp?=
 =?utf-8?B?N2ZuTURMOCs5Q2E2bG1meDRqMURzSWFhdElkQlhaSkovSjcxL2N3aFEyZXZQ?=
 =?utf-8?B?c3pFUzdmelpBZnlCK3hiNGtNUHFSdGRkQm55Q2Y4MkNrQ2xjVTZNdU9vaUUx?=
 =?utf-8?B?cS90cWJ5V003bUhwQVgzTHR6b2lYSXFQZUI5VXBDNXQwVjN2TDNtd0piSWVC?=
 =?utf-8?B?ck1kQS9UWm8yeHE2RllVUWhOU0R2MGwzRGlhN0tMUWhZUE1NSXpWMHlLYnVY?=
 =?utf-8?B?L0ZTRXdHWDhNdGlvKzhzS0pmaFJDcTVnNFh2ZTdkVGFFN0VFeU1NaVUwK0Fu?=
 =?utf-8?B?MHJMcS80WWZpZTVrdE1KUnZRQXhwRmx4ajZ4d3Q2b2dhdE16dkFSazFqMHhX?=
 =?utf-8?B?RVM4eUptQnVNckgvRjFJc1ltb0h5K25ZSlkvaC9saCt5VnNuZUh4WXc0ZkFi?=
 =?utf-8?B?YUs1Z0xycTFHNkgwNXZwc3BzQWpEcW1KQXM2ZG9UTVJIM1BBemtrbDM1eE5l?=
 =?utf-8?B?dy96SzRWWkoxbk54UHVYS3REbHNOem9XdDI2UkRuNlRGeTdTK3gxSW1vaTJw?=
 =?utf-8?B?M0dHS0FSVE5vTmFNMThxQUd4Rmh4UUhmKzI0NTJLbHdsQXY5Umk1Y3pEeTVa?=
 =?utf-8?B?elExNHRmTjQ3cUNsV0NFUVVSWWNQSDZOcDlJSnd1bDFVOWllZnpjSHpsZFVN?=
 =?utf-8?B?dkVBNXpxT2xxSnhyNWpLWUFxeWw4RkhyM2ZBMDZieUlOT3VyNXg2TTJtZGZM?=
 =?utf-8?B?OHg1ZkFGUlh4cGJPRzJoYXU3UXI2UTlHOExDNFhqdzg4NkpYVjNYcmVPOG1Q?=
 =?utf-8?B?T3ZvR0NVdjBxQ1VrK3NvS0s5L29RYXBXRVV6VFFWODN5ampEMDdWSVVML3ly?=
 =?utf-8?B?ZktzcFdSRDJjSDkybEdOYlpETlY5c2pBVXAyS0RRUlJtRDV0cXFuSXBQSmVl?=
 =?utf-8?B?V1ZZNzVkbHFUbHhjWU1zV3l5U1FzQkVrbVVuTFdDZEY4SjJWZ00rSXR5aDVq?=
 =?utf-8?B?emdOS1Y4M1JNQ1c3UjRNZ3doZUhZcW16Y29NQUY3T2hQMUZ1UGJ0QVVZeGxB?=
 =?utf-8?B?RjRQWTR6Y2NHTGE0VGw3UWRtaEluN041SUFmd2szTkNvcHdZVnRmbUhJT29T?=
 =?utf-8?B?djh5N0dWVXg4T0RyWUdVakl0OERCbXY2TGROdlZQdEVOV0k0aUxUeDdVaDRC?=
 =?utf-8?B?SGFLNnJzOG4yekdySm5DeUMvYUJlUzVsRk14L1kwZ2xWVGlTcGtzV21rQ0RI?=
 =?utf-8?B?amxKcVIzWmdUYWNuYlJ3MW9xcE9NdmQ5U0JJUEc4c1dtSFdnRHlsUWpKSFhZ?=
 =?utf-8?B?WThMZVdKSFpQWmNrZmVFbVJEZkNmWGhoOU9oejVFdHBCY3JBSmUwLys1eDVn?=
 =?utf-8?Q?EEz4qOGDgoxGuw79SJJjF077h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE236EDB7A72CF4CADE8A1F2D153FA5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eadaa1-4f8c-4dd7-42f2-08dc90f64888
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 06:57:43.2573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqmBiCtv8dHKNniDzNQjr64Kp6EzFqrh3vv0pqX8Olq2/pLyJ5d8dABNRNn+pZ8bZK0M2E7u9snnDdtWjD+9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI0LTA2LTIwIGF0IDA5OjA2ICsxMjAwLCBCYXJyeSBTb25nIHdyb3RlOg0KPiA+
IA0KPiA+IHRyZWU6IMKgDQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdA0KPiA+IG1hc3Rlcg0KPiA+IGhlYWQ6IMKg
IDIxMDJjYjBkMDUwZDM0ZDUwYjk2NDJhM2E1MDg2MTc4NzUyN2U5MjINCj4gPiBjb21taXQ6IDQx
YmI5YWE1ZjYxNDQyMzY1OWNlZDY2OGQwZjFmZjBjMWRhNjU1MmUgWzY3MjgvNzEwNV0gbW06DQo+
ID4gZXh0ZW5kIHJtYXAgZmxhZ3MgYXJndW1lbnRzIGZvciBmb2xpb19hZGRfbmV3X2Fub25fcm1h
cA0KPiA+IGNvbmZpZzogYXJtLXB4YTkxMF9kZWZjb25maWcNCj4gPiAoaHR0cHM6Ly9kb3dubG9h
ZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwNjIwLzIwMjQwNjIwMDA1OS50VlU5DQo+ID4g
c2VtVS1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gPiBjb21waWxlcjogYXJtLWxpbnV4LWdudWVh
YmktZ2NjIChHQ0MpIDEzLjIuMA0KPiA+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6
DQo+ID4gKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI0MDYyMC8y
MDI0MDYyMDAwNTkudFZVOQ0KPiA+IHNlbVUtbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpDQo+ID4g
DQo+ID4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGku
ZS4gbm90IGp1c3QgYQ0KPiA+IG5ldyB2ZXJzaW9uIG9mDQo+ID4gdGhlIHNhbWUgcGF0Y2gvY29t
bWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncw0KPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+ID4gQ2xvc2VzOg0KPiA+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MDYyMDAwNTkudFZVOXNlbVUtbGtw
QGludGVsLmNvbS8NCj4gPiANCj4gPiBBbGwgd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5
ID4+KToNCj4gPiANCj4gPiA+ID4gbW0vcm1hcC5jOjE0MTM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBzdHJ1Y3QgbWVtYmVyDQo+ID4gPiA+ICdmbGFncycgbm90IGRlc2NyaWJlZCBp
biAnZm9saW9fYWRkX25ld19hbm9uX3JtYXAnDQo+ID4gDQo+IA0KPiBIaSwgVGhhbmtzIHZlcnkg
bXVjaCBmb3IgdGhlIHJlcG9ydCENCj4gDQo+IFdvdWxkIHlvdSB0ZXN0IGlmIHRoZSBiZWxvdyBw
YXRjaCBmaXggdGhlIFdBUk5JTkc/DQoNClRoYW5rcyBmb3Igc2VuZGluZyB0aGUgcGF0Y2guIEl0
IGZpeGVzIHRoZSBkb2Mgd2FybmluZyBmb3IgbWUuDQoNClRlc3RlZC1ieTogWXVqaWUgTGl1IDx5
dWppZS5saXVAaW50ZWwuY29tPg0KDQo+IEZyb206IEJhcnJ5IFNvbmcgPHYtc29uZ2Jhb2h1YUBv
cHBvLmNvbT4NCj4gRGF0ZTogVGh1LCAyMCBKdW4gMjAyNCAwODo1Nzo1NSArMTIwMA0KPiBTdWJq
ZWN0OiBbUEFUQ0hdIG1tOiBmaXggdGhlIG1pc3NpbmcgZG9jIGZvciBmbGFncyBvZg0KPiDCoGZv
bGlvX2FkZF9uZXdfYW5vbl9ybWFwKCkNCj4gDQo+IEZpeCBtbS9ybWFwLmM6MTQxMzogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXINCj4gJ2ZsYWdzJyBub3QgZGVz
Y3JpYmVkIGluICdmb2xpb19hZGRfbmV3X2Fub25fcm1hcCcuDQo+IA0KPiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IENsb3NlczoNCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MDYyMDAwNTkudFZVOXNlbVUtbGtwQGlu
dGVsLmNvbS8NCj4gU2lnbmVkLW9mZi1ieTogQmFycnkgU29uZyA8di1zb25nYmFvaHVhQG9wcG8u
Y29tPg0KPiAtLS0NCj4gwqBtbS9ybWFwLmMgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tbS9ybWFwLmMgYi9tbS9ybWFwLmMNCj4g
aW5kZXggOWI3MzEwMTIwY2NiLi5kZjFhNDMyOTVjODUgMTAwNjQ0DQo+IC0tLSBhL21tL3JtYXAu
Yw0KPiArKysgYi9tbS9ybWFwLmMNCj4gQEAgLTEzOTAsNiArMTM5MCw3IEBAIHZvaWQgZm9saW9f
YWRkX2Fub25fcm1hcF9wbWQoc3RydWN0IGZvbGlvDQo+ICpmb2xpbywgc3RydWN0IHBhZ2UgKnBh
Z2UsDQo+IMKgwqAqIEBmb2xpbzoJVGhlIGZvbGlvIHRvIGFkZCB0aGUgbWFwcGluZyB0by4NCj4g
wqDCoCogQHZtYToJdGhlIHZtIGFyZWEgaW4gd2hpY2ggdGhlIG1hcHBpbmcgaXMgYWRkZWQNCj4g
wqDCoCogQGFkZHJlc3M6CXRoZSB1c2VyIHZpcnR1YWwgYWRkcmVzcyBtYXBwZWQNCj4gKyAqIEBm
bGFnczoJVGhlIHJtYXAgZmxhZ3MNCj4gwqDCoCoNCj4gwqDCoCogTGlrZSBmb2xpb19hZGRfYW5v
bl9ybWFwXyooKSBidXQgbXVzdCBvbmx5IGJlIGNhbGxlZCBvbiAqbmV3Kg0KPiBmb2xpb3MuDQo+
IMKgwqAqIFRoaXMgbWVhbnMgdGhlIGluYy1hbmQtdGVzdCBjYW4gYmUgYnlwYXNzZWQuDQoNCg==
