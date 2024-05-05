Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D65EBE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714875454; cv=fail; b=SzwIGdXknjsjOzdUxJKnH4TsAuTHxsYI1ZfNLarVYBH+jbOMp5lJxdKZd4GDuqm+SgQbiKFWmO9wZfL9Q2NMJpVNCa3Gn1xwUD/ZvtbMl14V+TSeRnGPtivtQ0z5l2IezOZSCHnJubYyl+9fYWyh/QRF0zqRB57lDsxRbI/U660=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714875454; c=relaxed/simple;
	bh=uqNUYtwoV0lAikyRA+KPj5RGbN5GMeFITn5okEc+/Kw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HZjzrrAlOPA1ZQubqvV7HS4V5tembinPd+f+bh1XGBiRMIV548uBdRhO7udV5iw69PWnv7vcpfSRL9CAA8lcTOQGlxlKSYv3m2jjo9tl/0C5bsCfwzDQMklZRLQkIeJ7kW0eLO/hQow4/2KJOqH+GU64KFiAQh4ZoC2VeVnpWmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amc+7qwD; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amc+7qwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714875454; x=1746411454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqNUYtwoV0lAikyRA+KPj5RGbN5GMeFITn5okEc+/Kw=;
  b=amc+7qwDaD3lzF/KLhPPg9yJB4TFWE6eeNwlSchSH8S10vLX+OWvHZX0
   PywOVFF6jfFv48edCVfwWE1MTqQusoQy3wtwN15p6ctdKhGbf04mGkkp5
   1mfJDFXlQuKTD6gcxcO8VnJdEhYYmXd1dwvHTain1XzmhY+21okWKPNDi
   kTdinwh/hYRLb9LZDdJmukZ06C2pCOm3VFiYTfnkwwvB4NkZ1+f67MtGp
   ZcT+UixsoaKKlRN6VOs+hgiv9q/nxvUBG3VZM7vGQzkzAPszn9ByNaodB
   p3Rfj2/XZyVso7Fjvgx4znEeoHPB12dQQefcf1TlZ40CLlieViyyB3J9x
   w==;
X-CSE-ConnectionGUID: mO55H2iHSYSriO0KhQuTug==
X-CSE-MsgGUID: Zgsx5fh9St2I/J/AO6Bcgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10480183"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10480183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 19:17:34 -0700
X-CSE-ConnectionGUID: +mtAx1KNT+mcnIOe6BhZDg==
X-CSE-MsgGUID: cFkh6AWKQpW/zqh9ACQZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="65252144"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 May 2024 19:17:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 4 May 2024 19:17:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 4 May 2024 19:17:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 4 May 2024 19:17:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 4 May 2024 19:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLmHRMu70WDtWOXi+wdNT5hy/M9sZ4aZtskWvQJyiXxOBokziITeGvgGP55ucm7tatN8lRDehNnLN4p0g4Cw0irjp8WocJUrnBl03ZzEZOGKczgTkaUyqXo4iF+a/yhZfV0Txucy4ctOjeX7TUCnQrKlboXSNKb69/fbDYA9H31J+nTAg9yjRLbknZxTfs3zjr/8F3v4AVXYvLpxu66u0kvW/81vqzRqvea+8teYyTTNVUBJOTKQod8G8AKcYL5ps37N9/YWVt0/ixsnC3uxNUrt167vDVB0VLBhwffWn4VbfoWis0+iqTfmNU3XB8SmNdSr5cuRZmyArZzOB9g3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKRpzwGI/E/R99ZS3tFL7+TXZ8TEA7XG6Zq7v/THEBw=;
 b=VVP1IeTmTuzGAz3ze330TdkNkRIYeiz3zzZuxbPc5lxzxVcuJbvYfbeQC6ZR1hDpHC5uJ4fCeaO1sSN5fxnokHedrygiW+XkjCddJXWepeva1uBe0vwANJdFzRO19nRHp10U3cMptlOgNJkt+sOCxi8EAgekzHqUsuLUR4ujThRWv4jUP3o91dt4oOpvR3CxIFNH7YvwvbkNYGhf2QF0hE2lBqJgb1BwZDHSQpMTd7grF6C7soYNitKE453E4RVNZzOoawfm8NBBSpuEzJ9fAzoQFS3MNbFKy3QOSmL4JyK9YcmmQTNq2ELRqCCrGg0r7qBr5L+I10B+nXOq9yQi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Sun, 5 May
 2024 02:17:29 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e%7]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 02:17:29 +0000
Date: Sun, 5 May 2024 10:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [shenki:aspeed-6.9-rebase 932/1143] dtbs_check:
 Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file
Message-ID: <ZjbsMveJOEch+5uu@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: a82b6edd-ffd0-4dc0-5dbd-08dc6ca98364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2+qkSyFqzKanRyB1dusrX/YvXyC1X6lPDp0fty+Xzq5bKaBMWmkkB5Di3Bug?=
 =?us-ascii?Q?Amdk8LMb4RH3UGrV2gdxEyHyjY8/sXbLWVL3e2kWFhU5f1qs0KAP1vhdWtJT?=
 =?us-ascii?Q?uDQ/805FJQ2kUkzwOFWcxS/z/xoPovHRBLzMJhsSc2Run/bY9H3Y4GakgB/S?=
 =?us-ascii?Q?f1q0vpb+51cVP2r1V/FIAL+zGw155YEdyVtczcyR/lYc3OHO3nM4V/C4SsdZ?=
 =?us-ascii?Q?RFxayaN2BWATBUDuupPzDsA6ti04bWp3XghbZSGKefyoE6UqIn0Ive9cQ1u3?=
 =?us-ascii?Q?KsuekDHs8BwDbk/lNNGuIy/5ueMgRN216ZCS/OS06AwK/CtkyZNLLwx2+2Ug?=
 =?us-ascii?Q?1IXB0uz+5UUHlEsoCaesZuzEB6U997Ta+NB1jmCmKThtAmPR97VKSr3S2tYx?=
 =?us-ascii?Q?+xTe6USp1RxcEU0NlvU93V+i8Lgrvtt8XovZjDZftjGredPBhlnbfRW6zWWY?=
 =?us-ascii?Q?jnHpZtoOEduxsfe+8M2c+1yQX9RIANmp3GcXzLUO4U228wHYYGPcbu6JvK0Y?=
 =?us-ascii?Q?EBu0VJvDkUO+L9Z3B8+c5VlRhAwmQlAatIUnYgr/AUTlXroXL7Sxb9WmCYhW?=
 =?us-ascii?Q?TVzyG/9bhV73+kJMsHDQ/xBtlT60D60QjHHRMq9vqs9Pamm3UmsJ7TyIDd2/?=
 =?us-ascii?Q?9/bWNN4BtN3PXIePQ2EjKHB7A2vAMguG3DWQjKs5gC+lun9vX4dC3OaJn6zC?=
 =?us-ascii?Q?vL4FuwQatmA7pMy4+wLnAxs+1nn/6gLFpwBe0HxmL3Pb2ho80OBabVicxHNG?=
 =?us-ascii?Q?ArVrzEpOOsqgsl7/jYftlABzYKVkIol6Q5WHDaX0i2usdsxUhayzajNPQwJP?=
 =?us-ascii?Q?df9WD8hPzPicYU0W6LI3LAVci3XDoh656rDP8tVtWMXTP05SEmdnTpBZhxMj?=
 =?us-ascii?Q?WtOrRs2of0PAL8+LQEvvdsthrQh1159BbGXq84tljiDfwrjdQdFh4/OjLSCO?=
 =?us-ascii?Q?lZugF1ZBKIeQqIvT3GsrNq2qrnn2Nm35KIrtYAigQvT1z17TzZtMOzmV0N9N?=
 =?us-ascii?Q?/8Oee1PDAIHd/eAQJxM603aMlJd1XzgOrDeoYzSUNZRqOOXYriokxB7EWqT2?=
 =?us-ascii?Q?tYX7kobk6xvwJyzuPA3XmiNcIJx3nJaVnb+tq5uTW5ozR4wxSKJHk3nvRJyD?=
 =?us-ascii?Q?jtxL92rUetGy6e/KHhq4untVrx+2IkLeMev3L845QsGCU/ZDnv+0osRilbag?=
 =?us-ascii?Q?YWkh9BUwXGof2Prh92NR8u0+GyHiQROWER7zhy3EUel5ijWO+r1rO4J2ES0?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uimbnj8XAWynS2u+qaM+ZZRgUgwiBxohFAis7m8wySYXZIH5pNeHZrxx8Nti?=
 =?us-ascii?Q?9ZKjfTT0lwhHHi8+6I5/88YDC2Lo8fZ8VQF9olm543NZL20NyOyMBSJ6G5H7?=
 =?us-ascii?Q?+adChCYKMs3TmCsGS+vHQe/7odk+j9NEc7mMU9AgNL75eIMUzXUslajiESUQ?=
 =?us-ascii?Q?Oh4d5vVGLE5zYKpx5yswqeKE2V83NX/lIIjrp0zngb4f8uL3jaRq2sHZyaRL?=
 =?us-ascii?Q?8YkPUsfxebietIeS3Vcs08frbSdTzgtZFtTGcXzPdMyVMjfcLzSu6To/rOll?=
 =?us-ascii?Q?goeus5scGwvHITFKZrcVgoWbVIIh2k+a4Ghj9ft4igVr6Xx5fAnYZRz41XKT?=
 =?us-ascii?Q?hIJNl6c/vXhPBwSpHfy2UwRjVLAnOWdSyGUBVFkYGZrGm1StRz3LEh4oF7QV?=
 =?us-ascii?Q?awKV7G1CNuUHWdX77FtLFgEQctZmbECVU+3cZ2m7MTw+pg6p8UjceK6kQmYY?=
 =?us-ascii?Q?0oDNVu3ZGgO4hpSUH84MQ8ydKQL1SOJBnYVQ3cEUsZW2GxAu07ztf5QpvQ4e?=
 =?us-ascii?Q?NOuOKx/slpkeU7UJ0RUeypb296HGyaAdf6rgijp4n+tJ50Zssdd1vnW6v4ce?=
 =?us-ascii?Q?Kz9xdj7J2XQEd58EvcC4WLHtWWrKZGLbgMjs/S9URQsM+/3wxxTyRqU189ba?=
 =?us-ascii?Q?acEIcTsF4HbFmNVcTg0YhVD8kZFYtycJF9CR8snBm326XLIbR571gaM3Dut2?=
 =?us-ascii?Q?nLG8gKhYh7Oyh4BDSC+E1QI5bSF6DQhJnF4yNrQyLdFPk0ZItjRSdGdUNBfO?=
 =?us-ascii?Q?glIETR62hcwnoN/63XerPTYrD+AQt6n73OJLZnthTaEJlGjb/FMxZpPNrxPS?=
 =?us-ascii?Q?ZIWHdn7bBWDD1fhB5tC8ah5KkPttwSNjSmDGlutp0jXD5AwrbrGOBhM0ZrcC?=
 =?us-ascii?Q?lGbolnvxOjufuOv2xQP8JPOVcZ3iHyEgK68nNW3Y8aBvwQRqq7i2us+yHnLV?=
 =?us-ascii?Q?ioOOA/2gHYdhlpCft397GUhEgsTPZimOW53hiX9n4s+/dskGlXNwMmzym/lV?=
 =?us-ascii?Q?+DrUnvalY4J/2b4KumYJdO/vcCnMULIsrxZueLngx172bXcJafj3vScYzMvq?=
 =?us-ascii?Q?VcZrbiEc4Pfzv7alYH25HZttBArjB+0OwA18A3h7urBqaPGa5VFFwIvmYurb?=
 =?us-ascii?Q?8Sq+nQlNCDz8g/WmlKk5+EzEVlwnrsDg40jzuq+IkHiw0UT1X8VK3lt8sRc2?=
 =?us-ascii?Q?8jcNmgKBJ4zv07tzDX/YxyrD0zIog+fJ3RWHXV2YmcmE1ashR3oEc8+8r9rD?=
 =?us-ascii?Q?Cwi0Hi2h+2oU6OJRNOfXoD42FWb/3vhVBkwTHK29uKUoj770RaneSC0H0A/b?=
 =?us-ascii?Q?baVQr0Pmz69DpSAJQ3tOe4pJQRVTrdokb4N9wK651ZW2N3QZt1VAXF+u3NZ8?=
 =?us-ascii?Q?WJ6unlcd38V3ah3bxjL3pcAOERDhFoiWII4wMkKsyzls5rH+cOXU6ciHG7fz?=
 =?us-ascii?Q?q3J6G3InBD5ozi+7BY98Z5QvUb+rk1HucWQvBfccpEeGFcAe6h+za3fUPqjZ?=
 =?us-ascii?Q?vB0jkIe91ogqpcoty+7ciekybFEyLzisqVfFWTHcRVGPkKGKf8KyNbqJxV3V?=
 =?us-ascii?Q?6K8KoWUhrtPExnXnqLWPmdx+SyuZwJbqZZm7Z2Zf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a82b6edd-ffd0-4dc0-5dbd-08dc6ca98364
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 02:17:29.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnMZLecW1eVxd2cdUTjE0WUIec8J7HU63i0pUsha7IitIz0CriCYUd9Vdsv+/d8gEUkEtUs+N//5kJrGSVSAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
X-OriginatorOrg: intel.com

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 8f301c50a89b33cf21188f09d8fb460bdf54d5cf [932/1143] dt-bindings: i3c: Add mctp-controller property
:::::: branch date: 24 hours ago
:::::: commit date: 25 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031829.A2FmEJ8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405031829.A2FmEJ8m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

