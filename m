Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED1390231
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827581; cv=fail; b=Wd9Ay7IFGAx86QM3o+4f/krWzTIJ2wXN35Yjbodcj3ur0waxIX+5Xmo35ICMcP8lOSjB7xk+8q3pXZKBiPGveuXcsGuY38bzit8skodHa0XJFOzr06DJzNY+BQGs0Ndp/qiH3gA0NTtkknFk24AVeOBITXuOHFv4gEuTuem/Lpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827581; c=relaxed/simple;
	bh=dl4wFfhJugtXqbSok+8jIrNNuZMobiduytFUrC/qjFk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LyP5x8OI87RpSPaaVeeN7UHqsaIKS/N2uhx2QOLrgkcdKKBmTDCbbqC+d22buRBeeW/7HpaV9hPRhjtfjIvIN5Ew65K5R4tvAiQip7GmDqTmpnj9qv63k/NPghaf9e6sTls5qwMbh8WLwDgs94wpbxHpK64O4DDvOOaE7GuWieA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Us0QtnZ7; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Us0QtnZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775827580; x=1807363580;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dl4wFfhJugtXqbSok+8jIrNNuZMobiduytFUrC/qjFk=;
  b=Us0QtnZ7+2tSUvTYh3aX+thtwx1bMsFc4Iir7zA5rp3ki1bueac06BCH
   LGGDfEvDjTSCQWuaQgJRql1RVXFh7q+k0S8VSZJYQXN/atNMbRq+3nLqB
   rotdHQngkOK7OXnoG1/do93azlTFlv5/f4073Nn/PFzQGZswL6ijQxKrU
   cntbHLtbYSj9q+UtlU1u66Zg2iwoVQA6vmj1M3u6CNLgEJ0WvYrKJ1ZSB
   N+gSVhfZ5s/6Ub/1XmHZ4Xg9xWB6lyz2ctysUkibc9szLR50WGa5Sfb0l
   bAY7jOoeOCtFw5bYt6ay03VeNBHA0NGsBQMa2h6pceWG2PM0nRd2bmR6/
   w==;
X-CSE-ConnectionGUID: IlaVYwn0S+qwSb6GutVTNw==
X-CSE-MsgGUID: kG2UTohVQeORwC+rB0zcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80735191"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80735191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:26:19 -0700
X-CSE-ConnectionGUID: +VFwSgzzTs+pwN/NG110EQ==
X-CSE-MsgGUID: +lyy/x5ASuicU9BcwPdlaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252249102"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:26:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 06:26:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 06:26:18 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 06:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Am51q670OYqhIg01eKxh8Fo9pEgo4NtKSq18NGtMFuInHYbPURs/C7583/k8T5x2yHzo0/9bx6k23LdX/gdOKVJgmaHNJueFZq5ATa0WTIcjZ3YSRxMs179EEat9Yr8jaIT8N+KpFl5kP2bqWOH45hpgE1s47cJCbdHZ9i3NCxBBFZ7/ZcKfZ5bzCT9+YiBNp38FuhxrqDVUEcOYt/EQCbymoC+bj8rhKoPXLfKeMbJ6d3B+K+yG9P+mCw45igSiRmMrd/nAdzlkz5Utdsv8/BnCmuGpFcUfj/b38UoZcGou7nsoVLtBnKTshCPLPL+EEH17AcItd3oSdTSrg461aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AUa9KXsKRVgPannfshhvHgClok/q/kgOMgagtQ34Q0=;
 b=EavmqyLWCkJPZwZMb7G4yhVeWcklKR1WIwxM/HIfN8B1bGkPgnvQkemw2E0NhGxZJI8pm+mzygk5EXl+F/xg/N84Jju8sID0Fh00enwG1DQkrIH8htCnFyDFyK7nIXrKyZzsOV37EM4rTZn6z3a0eoFPSgAA0KcmW9kFv2sxzDvR0nV45CQg1QQI/SNymIR19dHPRphWKS+d5F+rChKgJ3DQJYYUuCcWpmNeNVebZtOc0Ye48+PkKHo0sl1fQeCpTNgNOe9gD4rqKudZp2K/DCHkvh5egFZIQPbuB/GajM0TkK3kUBAeWcLhp7LK706Ypa3a8nsnNJb87r05fyNZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA4PR11MB9083.namprd11.prod.outlook.com (2603:10b6:208:569::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 10 Apr
 2026 13:26:16 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 13:26:16 +0000
Message-ID: <cefe3913-960d-47a1-aa80-084c6aea09e5@intel.com>
Date: Fri, 10 Apr 2026 15:24:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct
 virtchnl2_rx_flex_desc_adv_nic_3)"
To: Tony Nguyen <anthony.l.nguyen@intel.com>, Kees Cook <kees@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "kernel
 test robot" <lkp@intel.com>
References: <202604101931.fN8gVxZI-lkp@intel.com>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <202604101931.fN8gVxZI-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0090.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::43) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|IA4PR11MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 29199de2-641c-4b73-01e5-08de9704be0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: V2wPZkKLcPuSRZEyUbcbF+dLLfz1CCB39defcmS6qhfMg9+dq8kDmHZrs7CeQyDqKtuMvEVju9Ev/z9Kt/puqk3EIWXqPJgW3S5t18OVGqeCsmo1odXkaJNJLZTpEUfBjbnqpmtxog3XMnEyc1ngvLQeKr7lG120CV+TexB1G6+ybT4htePhZHptZszO+ippDlVSwWURzKtFQTAZKKBGz5z2zNcD/Sq5S7fJLpa89gfxlPnYowNHtwgjecx9xBwS78Qy1RN1kHGiJRIFAOJJvu/Bo8mH+TwY3nEBNFEpAvLnLiAIl0Sqt6Plrr7chQ6jZ4JrVzmqXfT2TJgxeipvRZANzmV6Gjsi06kf+A9kTq7IUv7oWdRo9YUZVrT7isvQtz9iRNZXCXSoZHtHRQ2QJKInS4OBErX3bfPyWLiliyL3GUoPJhE65aMcn0ly+RT1MRBlACkCz1/eANhjLcjboDfGVoc6HXbEVm7d5NoZ+02jcOsNe/fi1WBv3lH4V226qInyfjHzwH7TZDglOEmWBZg2Xw6zo9bEa0a8w3pzfJehCltY4MbH0R9VNWuq2Q7rfKF3y2OnnAo/l7UNTY1HHMp+6qL0QrFedpLJpQKZFIGqYSIiF0kcI8a6LtuXdZB07k0c9iH8Kw3WQAESSU1N8huZLdIvDaxKP9CJ/32eVtVRo8fognZJ/TaNhN28qlDZdbsz5pb1Yc/9LE0I5l+txg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NElPNWw4MHlTTWZqQnRKYkFqNjRaUjNkNUZrbXhIWGFQckU5eDBGQWZOSU15?=
 =?utf-8?B?WVMvRkowellWakt6eHI0dXFjaWQrZEc5bUFybzhjMWVpdjFZN0tsaTBna09p?=
 =?utf-8?B?bkU1MjVFYVVVVkRLMDk4QUVrR1VoTW15d1BKY1YyTkp0Y0lvbERZQzNKWEFX?=
 =?utf-8?B?K2VIS0FPU0JWdXpYZjkvNWxMVFpEMWJ1SmRxOXZxTUd6bDVGbllZQXJMazVz?=
 =?utf-8?B?R3RxWVd4ZERuT0wvdFAzaW5IUTlHOVpxQUhvYTZnM3VIc29ZVUFsVktNOHNr?=
 =?utf-8?B?STFuMlhlRDFFa0xnMmFGUk9BcnY1emRnVDdzNXNKSm95a0ErWjdQWXVVc2pi?=
 =?utf-8?B?VnI5UzRRM01xUm4zUFBxTStIVDJZZTJrZDNXMjdmazc0SUs3NUNsTmJYVXdZ?=
 =?utf-8?B?US9VTU45VW9VRXEyanBsVkJpdmJkT3oyNm5Hd0tqWEFHWGRpOW03azN0R2tR?=
 =?utf-8?B?dTVwY243NllVU0s1RWVwcXYya0Fla0dWV09YNEhYQllCZUxzS1ZyaDlkZC9j?=
 =?utf-8?B?T3E2V1NtNVlNbUZleGovZHhBbzNNR1F0aTkyN0lSMDR6SkltS041ZzVMMGMw?=
 =?utf-8?B?UWhPSEVCc2JRMWM3elpKc0hUUFVMc3lhSlZEV0k2d0tnOHVTNUxiR3JoWTlr?=
 =?utf-8?B?R0tuTi9qNHMrYW92bXo1Zmh1STB6T1JmcW9JTnZYNVcvcGMwYmdKQU9heU03?=
 =?utf-8?B?a25mcUREclRhV3NjTnlPVExFQXBZYW9EVlBPQXNBMjM4OGtlWTJydENLaWZ5?=
 =?utf-8?B?cnZZajJORUQ1QTVhMEUyOEVrMU03V25OTWYrZ2Jkc2xxYkduekUyQ1pFRzZR?=
 =?utf-8?B?YkljVVpIb2Nidkg3bWVqRzRXSzF1emYyei8xYktKZHpNbjRYNHcydjFpTUZM?=
 =?utf-8?B?NWNNVGQ4YnUvT0oyckpBQnU2KzVxTnZ4ME45M0pLL016TzNteGZPRzdMYXNG?=
 =?utf-8?B?aGlVcWNsODFqSGt4d1hJZHpMOFdTZ2IxQ215MllVcUV2Q0U2VStiNmNmdWI4?=
 =?utf-8?B?Tm9FTFlwTUpoZjlUM0MrNzlIanl6UjRPeUdsSE56N0NVYlBWeFdhT1JUQkwv?=
 =?utf-8?B?a0pIV2RLSFZBRDE5NXp4WExSMzZER3hqRGZRTG9jeXFtd3JYZkxWd2R1VFZx?=
 =?utf-8?B?L3FuZnNNeWgzQm5pTnQyNlJQbWhpN3RDUzBnNlhiRnB3SVpRRkZmU2JrZU9l?=
 =?utf-8?B?cENOQmJlZFA4TTFKbUlURWZ6OFhNY2hQZG9uZG9MR1JiaWk5RGFmdmpOY2Fv?=
 =?utf-8?B?MjRCTFFlZ2xuOEVZbElwVDN1RFFzMTV3Z1p0RXNhaXNwOGMyREJ0S0tUaGRQ?=
 =?utf-8?B?U1IwSndzUnJudnpUSVBoOVlUYkN6ZkM1ZUVPeHo5c1podmVDZ0UyS2hpVThn?=
 =?utf-8?B?clFyZ0FuaVdtbCs4bUVpQVRwbm9jUitJRjFtNnYwTXFLbEovNC9DVW9FQVpv?=
 =?utf-8?B?MVU3R1hUdzQ0QWFURFlDMDU1a1hVOVFCWjdHcnVrMnJCaGd1M3ZGRE1xT0xB?=
 =?utf-8?B?Q2NVQU5iNlRkOGtJVDgzZjFXUWFiYWQyS2NOT1k4VHk5bE1HK3IwMmR4RVVJ?=
 =?utf-8?B?Mk1ZOHl5bUpvbXJoS2c1MC8zbHM4anF4YnlUMTYweVhTZ25VNXlnM3Z0Ym0r?=
 =?utf-8?B?bVhkYUsvc1Q0OExtZDFxbGEzTlhFUnI0czF1bXZnZVNPS3RKaGMzM0dvQnNv?=
 =?utf-8?B?VU9ZRUJ3STF2dXFhbW9ma3l5ZFp4eGhHaDdsVW5kOW5HYWRBaWZWMXpTc2FR?=
 =?utf-8?B?U2FDL2N1ejIyNytqOEM2Vk5GSUh0cnhDTDE1YnQrRFBUT0dYZXVHNDUwS05U?=
 =?utf-8?B?RUhxTEJiU2JNeC91ZHg4aHQyL1dhUlBRcWJOVUFaL2JkTHFxeXdnSUFxZVdW?=
 =?utf-8?B?d1dxNGw2MFpKVEFJc1lGNVZDQXYvMUtDYk9IamVGOVZTajdGT3RBS0tuK1ln?=
 =?utf-8?B?bGlYdDZ2VGx4WEdYd1VoalFiekFXSUh0c2JoOGJsdkx0V2xJWE42OW1nYnR6?=
 =?utf-8?B?QVIxdW9oQ2xJT0JqVlVzWDhNUzFLdGNZS2dmSDNWeHIrWWtOMDNVa0N1VUc4?=
 =?utf-8?B?U3VCZVc5YXRtTGxsWjd3MjRwNFVIRUF5MHQwSUVNTUlpT29wei9ZTldLTkdz?=
 =?utf-8?B?OEJvdmc5eHpZRGNQT3h6UkZ1ckE2VlRmd01XeDZyamFkMzdEVDhHczlwd05O?=
 =?utf-8?B?K0lMWUliNHVmTzFkT04zUWJwbFZ3c1E5MHpScG1XWmtHMmNJajBxOVVrM0o1?=
 =?utf-8?B?OE1lZkhueGE1TXJqYklnVjBYV2lybFhyZ2JsR3pubU9rSkdYNEZOV1BOcHRj?=
 =?utf-8?B?YTRYcFlydk1HeGhESkdsT0NCVk5XQWRXYzlRWlZmaEY5S3VYaHVEYVBVM2JN?=
 =?utf-8?Q?AMfmjW2gOXbh6EK8=3D?=
X-Exchange-RoutingPolicyChecked: WDKH5skvLzjiE/zSdjrm3NZOJdOsk1XEY9QLu7uAjJmJm50K91XJsKfP8seqphbF34RZF1nD1CJujK6UAEZuE/XS1mAV+1nTf11tg+04GhyUMg1zeqkpzYpKk4FCSLCh/W2MtF/W6KUr6eNaBRaFapyDV8/s66aaqobzyHQTUO9PLoEeGIke2knmNnL10ddrOiXsXwdByFxMb9Pifr+MtL+4GcUoVpVjqHk+HEWRX/9XmNJvo9pks/drvCChOI7WfrWSlg/M2iDaL0GuYI6E6eyxo1JnGWHIMLO2fdGKnDjNo1jFV6FbFtpQJo59SrxA9E+GLHBpBEd/HpXFmaXXew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29199de2-641c-4b73-01e5-08de9704be0b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:26:15.9928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFj2HqP0TdnId4NORimKrbyI18LU/AXW7Tgm5hleHo17KP2ZPEYTwYSwcQTLWP6V7nvxt3O5J/K7YYiljxj17ctsuBWVmwUr1nt/IwWG8jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9083
X-OriginatorOrg: intel.com

From: Kernel Test Robot <lkp@intel.com>
Date: Fri, 10 Apr 2026 19:24:55 +0800

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
> commit: 88ca0c738c4159ce87893782b6dd964b5aa01f6e idpf: add XDP RSS hash hint
> date:   7 months ago
> config: arm-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101931.fN8gVxZI-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101931.fN8gVxZI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 88ca0c738c41 ("idpf: add XDP RSS hash hint")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604101931.fN8gVxZI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/minmax.h:5,
>                     from include/linux/jiffies.h:8,
>                     from include/net/pkt_sched.h:5,
>                     from drivers/net/ethernet/intel/idpf/idpf.h:12,
>                     from drivers/net/ethernet/intel/idpf/idpf_txrx.c:4:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct virtchnl2_rx_flex_desc_adv_nic_3)"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)

BTW this might be a real issue. The size of idpf_xdp_rx_desc is always
the same as in the HW specs of idpf (it's just 4 u64s == 32 bytes).
If this assertion fails, this means that the size of
virtchnl2_rx_flex_desc_adv_nic_3 could be incorrect on this setup.
I remember that on ARM32, the compiler sometimes aligns small fields
(u16 etc.) weirdly. If that's the case, we might need to mark
virtchnl2_rx_flex_desc_adv_nic_3 as
`__packed __aligned(something_that_works)`.

+ adding Kees, this is triggered on GCC, not Clang/LLVM, but maybe he
remembers ARM32 alignment issues better than me (if you have time and
don't mind, of course ;)).

>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    drivers/net/ethernet/intel/idpf/xdp.h:118:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct idpf_xdp_rx_desc) ==
>     ^~~~~~~~~~~~~
> --
>    In file included from include/linux/minmax.h:5,
>                     from include/linux/jiffies.h:8,
>                     from include/net/pkt_sched.h:5,
>                     from idpf.h:12,
>                     from idpf_txrx.c:4:
>>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct virtchnl2_rx_flex_desc_adv_nic_3)"
>     #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                             ^~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>     #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                      ^~~~~~~~~~~~~~~
>    xdp.h:118:1: note: in expansion of macro 'static_assert'
>     static_assert(sizeof(struct idpf_xdp_rx_desc) ==
Thanks,
Olek
