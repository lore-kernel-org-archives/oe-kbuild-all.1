Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9329405
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 00:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773015121; cv=fail; b=XJFNdW3FCi3bb8tYZ9LUK4WwbcfVaYMWV2G/lv0vpREwOARPoSr9sPTY8J9cpIBDN6D8fEhFoSQFQNKdzQ5lRgsTHcpETMe8Y9vCEW4qMchMu2GYOg6o8b8m06uCktxgRwaBvRQnJOh87CWtvZKkY1iCKmpO7zlWkXvZlLyMu5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773015121; c=relaxed/simple;
	bh=WFjqEKptDGLCcoy5oa2y+1OVbxCsKrVl0UrjBCR6IcY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=clebNgObIZnyJAbHXJXpb/Ljd0MPRwG7M6Tp/D+r5GQTMVWSfHF7+UlTtySStLoB1XQU8TC5Dw4Wp/gD8ezjO9KQYa++15UQraJcYIxw+WlKG6JzEgDiUHt8CmkjzeUpZQ7JzYXVSk3Y6ocA2BVXw3eLtmdysdM4sgcumsdks50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHtH+qAA; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHtH+qAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773015121; x=1804551121;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WFjqEKptDGLCcoy5oa2y+1OVbxCsKrVl0UrjBCR6IcY=;
  b=eHtH+qAAeNRj+0BE2NxgUbkRkO04DaXFB7ttO+NIofbbcZWZGmiwTKaD
   lxwMKIN8wJRHA8HoE7MvGPfc5pDZadlHg34a96DJHvUFB727sTlmLOHC9
   dz32jy+jvQpMWVWGF6r4PXNVOVNWkTLsTUa9uRO9fz5IKC5q8AuJGm+qM
   kL1mPxiQ1h3JrKuo7HEptNF1iP6tsY4E7hp5HiJ2RlIJW9bxnlMlr/Q8L
   ytbfG/JWFmSzke4TJevYFAD1tv4FlmAVts8XTQMgwWGHdDzJ85mE5O+dv
   NgtLeyIcwlsKeRKHhLGl2zECmsi3AVpIZmLguaUCh9ZwSSYh5SGhGS2Bg
   w==;
X-CSE-ConnectionGUID: MMPgIPHLTwW4T8yx1R9Szw==
X-CSE-MsgGUID: NcNd/eEkTfin2Og0V/9uDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74005910"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74005910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:12:00 -0700
X-CSE-ConnectionGUID: hrn9QtzdTH648mO/TomdOg==
X-CSE-MsgGUID: PvgyQzwwRZKpsm8aPNloqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218731281"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:12:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 17:11:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 8 Mar 2026 17:11:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 17:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZ9+3eS5WHb9mJLrrkj2dwkHc2FteGwb9pBAe8n4lwQX5VXJ4TG+qkZCB3RFO7AQsCa7NSx1Xw9e6034ydu5D0Ujp7WkL7Mcm8mw7QWfcvbvwna6vuKmrFNunUeI3nBflLOZVlcFAJFjukZGiZrY6eUdigvIASl7O6O3EJmkX7LI9iNx+xpxhU0BPB3RdLK1bF0LljbwD/LYHxD7hQIswdDfhOPLHr3DjbOG85iQV2AGodY0Is2+39mcwoUf6XvyPcw9I7gEX7IYhg/LzslSsyvBqT1DS41B1zx3nnpiiP0jjeoSDgFvdCK3AzFFK6q415bXTNrygb72zeVcUWHQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGljr6qfiI5IE6EYfDgq2qixyDgFHB0doYkpgSk+ZKM=;
 b=XzzT/L83nRTXREJpfh3WAYbLiA5vKLQbnjIfR70P7zzAl6LrGJw3evfjjRA0Tg8djDQJM6wOYzKn0p8ddpLC2nAJuuG8A0ZbyG28stTIUSpyaU+1cHPXTBo3i5CF7cTwYiDgGTzIFQ5zufHeyaVADBMpLLn9yymj8jAPWmpi/kx9rVB6l178dDRhq6fKsOqrh5wtnwTo7kIees5E8DDT0eUYMniBZ/ElfwskqkS73wHt0XR+38dXAbL9W9BOBom25r6sk5yakzgQRRNzhlaiL5xqIuyyJhGthxBkz5mVgbhwp4NjLKrBaJdH7QzQOX8qyMl5AR0DQLRzTtelyE0feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Mon, 9 Mar
 2026 00:11:57 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 00:11:57 +0000
Date: Mon, 9 Mar 2026 08:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC v1 09/11] drm/i915/xe3p: add V/P Override support for xe3p
Message-ID: <aa4QRdPgEw9K8ZBW@rli9-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308132446.3320848-10-michal.grzelak@intel.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|IA0PR11MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a80ea3-11a1-48f2-7fa9-08de7d707a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 71Nqx4qiQhXzKg9lunkOWayvpdZnFxCVwCVUZMkgGE/nrInQblZhxX/ho5fYUfpObHH53CAdTwXSns8URiWoCcZzrT7RoyAN+adZJDS1T3Fzf/7QVYyD1kF+cxv6PSCeFp8o0ySz8ni9HIbXM5bEsJjNVWp9W1hQXq/r/wBMocxV3FDv2Ob47hlFi/wGM98H9+SrDeOJoc9kCEzPqKRU+iLLHijN97cONCVdlLJh1vgDsa1ltkiUeqKiIXwlNj8Tgdnwu5RRIddnC6Y7twzF36aK2HWLkSBZSSE87lj2HmfnDYSHDdpE1jhvx4TLb222UasKpbMc5JK4jaPsTowNvbi4hTEl/ZBhlCpdSXSA8dVkYxAbrzLYWj+cjkkYhFpQawfLnQplz6IWCgwDfTHgkvrX+w3r3kw/Ne74yueiOX+jsxkVQPn+hLZ72x1RohJ2/Zoy+E1oPhjVmel9Mt0GQFuwbP5T6yi4nTfQ64OLtuvWPxYXamH862KsMMb8CFH78Kvz9XGNFQ2NJknYiWeCV2QnG1FWh1x5mORoXdZOEP+RviScPJbHDqCa5hsjJqBaY9s/UmGX7+GqWjA9c57vjnvk3zUTHrg/FZtZDXBRfxa/lNNaQv3ht+OooD59kTDYF+1xTRH+91VxddY/hITlgQOst8oJcMZo/NQeEZwCV5YlQSh7kosNaixr4ok6CjC2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHlJSkdVWk9RWmtHaHJIdUo0TTkvYWc5Skp1Q2lHZkNqV3BScHBqUVBXdUl3?=
 =?utf-8?B?YW8rTlByV3d5Y294N0kyK01KamtCYlUyMVJqaWU4MzVDeVdJcyt2c0lIdE84?=
 =?utf-8?B?Rm84cURkVnFjSU1ueFhJMGRzNk0zR1FnLzB0TGpOeUZuUkxZTWR3Z0NDRkx3?=
 =?utf-8?B?QlBWN3pFWW1GeHVKSWQzNXQwMjUxRFNVTlljSkYzQVYvcnNyOGdkSlNONzhX?=
 =?utf-8?B?RVpWRmpQdUNUY3dIbkx4dkRjN3RKbjRRSUI5UndCSWFISU9EeXo3Z3hMWWxY?=
 =?utf-8?B?QzZVSlJaM25yVnlpUGNHQUZ5TE9VbkxsaEdRWjlVbXAwVlZFQnVSYzZzNlNq?=
 =?utf-8?B?MXM4OEkwK09KMjhjNzZ2emhOZmRUb3Z3YTlZMlY4dTJmdDh3VXkzNTBNa2xO?=
 =?utf-8?B?aWpGbHBON1ZCV2lCdWUxMndSMTUyU2t3WEVHdkREM0xVL3VVMlJtSDJQb2xJ?=
 =?utf-8?B?V3dpN2RnRjYwOEhWeko0aWR1em5CK0EvQUM0YUdqeXV3T3NIYlpHUC9NSWtk?=
 =?utf-8?B?WVA1R3pFakNmZmVvdHludjEyUDRldDg3dEM4T1lITVpVdUFIemJRNVRpbFlH?=
 =?utf-8?B?bFQ5Ymd3YlBabkUybElOdkZHQUZoaDU5ZmZDaGg5K3BaWkF5WEUxcFgzM1RQ?=
 =?utf-8?B?QXBaRk80K29CMEtmcUM3RkN0SHAvWUNOa2hLbEpydXhRSmNhZ1cwSzY0bVRz?=
 =?utf-8?B?VENlZjdxTXBabnBjeFBSRmp0L2k0YXFnRENhNUtPSEdOSk5ucnlZUmRFUm1o?=
 =?utf-8?B?akphaEpSazVqazVqRThqc0JkMkw3TFhZVlFIdmxBZjBSVDNIaE5lREhzYVVl?=
 =?utf-8?B?K3RRZUtqMTlIaTlpNVVtN0ExT3N4OEliTjJsbUlDMERtbFNNcEUrak9sU016?=
 =?utf-8?B?RUhnakwwV3FZMG5MbU9sK1FIdnU5QjZscnVtR0Fwa05wRXowUHFtTUFQdk1G?=
 =?utf-8?B?eXR6SlpPSzZ0TEh1RzU0ZFdtcnorcHFkVEpnb2tsWkRRRWxkSHNDT0xxMVJS?=
 =?utf-8?B?WW1SSFN4MVZyd05acVpWVTA4K3puQlR1bERKeE5wbDBLMWxNV1pkQTkzS2xv?=
 =?utf-8?B?aTRyRTVvWnJaK2dQU1lHQzFUeEdEbG85eDdhSVIvOEU2V3k0VCtWZjBNODFE?=
 =?utf-8?B?aFhkY214RWEwSXlvRFNxNWNzQkZlSGt0eEprdC9OUHRKUWpNR2liNGovSWNO?=
 =?utf-8?B?c0dSYUlCczM2VTNDNnlOcGw3OVdaWEppNVdrWUFaOTVjVzBCYXdkK2Ixekhv?=
 =?utf-8?B?d1RNKzQvbHY2QVViL3o5eEhPcFVFaWM1d1NkNzlLQ2svTEZoRFV1cFQ3MjZN?=
 =?utf-8?B?Z25FMnR1aVM4cGhRQVNhWUl4V0NSdjE3ZG5RY1RZaEthak5oWDZla1RHNFlq?=
 =?utf-8?B?VFM5MFZYUE1vakpZTHpQZDQzbVE0bmtlcUovd2lWQmZCZWcvd1FuQmd3YU5R?=
 =?utf-8?B?UmlucGVjYnJ0VklnUXdzREY4QndONkF2S3RLbEp3NUozSm5tWlJZOG11Ulkr?=
 =?utf-8?B?Z2xDbnFhbTEvT2VWbm96Qk04cVEwWlk1eVZSMlZHTVpUN0lVM2NBUXJTU2xj?=
 =?utf-8?B?K3grTi9JT2s0RDRnR3FXL0ZvMG1GVWF2N2xhQWs5RUZadWlrdGZaV1VadVpP?=
 =?utf-8?B?UXQxNWtWVmNtS2xjSFErUHZJdGtuMDhHUUYxK0l0N3dRYzIyd281TlVmWGRu?=
 =?utf-8?B?VFFma2RtN01qRjhhVXNTYTFac053SXoydXZrYldyeDVGeXRCN21PVFY5TE44?=
 =?utf-8?B?OFNMTHRkZG5RTVpkQ0xOTlFhZ3VuTlcrZW1ZK0oxaG9yNVh6K3B1dmZXZmZz?=
 =?utf-8?B?djBkVHlrSXFRSmVUcElOZzU2ZFBKbUZRQTVqUjZ5THV0RE1BZERRZVhsc3dk?=
 =?utf-8?B?RXZtTnBXUWNQeDRIZ3c1TTFyWHZhMm9LNkVSakwrT2huaHlhd1FOVEZkWmFN?=
 =?utf-8?B?WStHeloxYWt1QlJ2M3dBVDV3Y09ocmhvdklwZjFkWUd6ZWNaZ29JVHUyNlRS?=
 =?utf-8?B?N2xIWXczU2VSZVNYVjAreG1XQ0ZqVEhuODNBbkk3SW03VzBrSFdNdlpuSzU2?=
 =?utf-8?B?L1FQZEoxZ0pmbnVJWHVZMU5TYXBBeE1NNFNJVUlPd3ErTGlicFhHOGlnTnI5?=
 =?utf-8?B?dkVkSlQyTlcwcWJHdmVVdWk5T3R2OURNRjhyMDc2MlpHeFJMSUNuejcvT1ZE?=
 =?utf-8?B?blpjNE1Ia1NrbmpKa0t3R3hhQW9BVGdGZkpyaVZJRTRWaXp6WHhjZ3ZqWFJn?=
 =?utf-8?B?b1NGUUFaZG81UGo1ZGw0UC9YcjQ0WEh2cDcrdk4wVkxZUG9UVTl4ZU90TUwz?=
 =?utf-8?B?UGkrTU1VVzBDaHdQUnlxMENYbUJiNXpBbmVVT3Y5U0ZnVXRTSW10UT09?=
X-Exchange-RoutingPolicyChecked: befuFPUj1bqWlDyRjr+qW1eVPM3nIolOjicIMZsZtzrc1Jp1bPUi8RT4f90R7OKmIOnoKKhiujA8ak/GIMWkd0DqIX3p2ET5/MNRgP7hS/cWcO1f9/FfppUOAIlQ+SyV9Z2yMaQL11/4N6KMZ6OEYUd8G+imbYBbXSvxSwh97OaruhU2Dqnb+keMyzaB3QfoUG7NO9h/sDm/9gWd1m0WMzxAn9xDPGrsulkqeZHcfgCuY83ZcStJAWGgiXmxzrJkyrwnlHYs5aAlZUt5bSv54raJ56DLKZWbUiuM+0z4W27U0VJ0P1CYuNZ9oYBqODEILnqtYr8Vsxx/yS+ozXdgvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a80ea3-11a1-48f2-7fa9-08de7d707a0f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 00:11:57.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZkDJwJb/Dq3bmuxCtuBCy/lXhL2osW2mHYFzBHyaq+MnptiYnBfdX9KUGeot6jBb31Wy2BItfThAFJ67rpgqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
X-OriginatorOrg: intel.com

Hi Michał,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-bios-search-for-Block-57-by-default/20260308-214619
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260308132446.3320848-10-michal.grzelak%40intel.com
patch subject: [RFC v1 09/11] drm/i915/xe3p: add V/P Override support for xe3p
reproduce: (https://download.01.org/0day-ci/archive/20260308/202603081552.dgEPyniE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#159: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1878:
+		 /* FIXME need to check correct parsing & table index should
+		 * this ever trigger.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

