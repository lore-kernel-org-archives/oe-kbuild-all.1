Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD5369D75
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038435; cv=fail; b=Ga2yQz+3XxAYAThCZIczzSMezj2JNziZb2DVfF5hOGqK/8BVC+0oGhPH3bVnPHsIaTlD5uQiO8wtmlSgLlZIG3n+ec30jtAL3jY77PRTWHTTYJqwTYYHWRgRu4DpYBJsZTuGo+GTGNbmP3wkjCdqzs1Yg9QsQk9+CpzT1AcBJjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038435; c=relaxed/simple;
	bh=GwuM+hcpy9Y0g/Lr+AyWduCrFv7lvPz2dyT+0gVlNRI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BAK/yGZTMpqUa35LKif2eZeeP8VnwWKqQa+yTDvoq7jtNdMjWpex4e+/zeLyEI1DfF7XNGTH0ohvmvkLVNptHrgVlQyYDIoLVR3ozqUa+cy9eZ1Uz4Rlrs72KH5yMkQ+9BMGui5OQKLkmUZYi78GDZbGCJSCepcLySZrJkLxeOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZc1lcfZ; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZc1lcfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038430; x=1822574430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwuM+hcpy9Y0g/Lr+AyWduCrFv7lvPz2dyT+0gVlNRI=;
  b=NZc1lcfZrZK53mfOavMTAZLRWIe8ek3ptp64R1snYfGDTyimV7lim4Yk
   gNlTFuBey2ej8gUvBx0ZoJazoco8Dr/Ila8tVad+Mg9wZlRfBHHnel0CN
   vePgcrO1RhV/112IkDM+JqigtN0EqsIFHTkRDHGFVehP4b854U5fX0SfP
   8SUwV3wdT/BF1lSBPZRshsUG6N+nLI7a1EyE6+inRJqTWb+AvE2/QTsC5
   fhRurM3WxhPKLkD8GBnFXEV1aZqcFNc1V5FYssihHXWz2GnGlzWxVlWEe
   gOs6wQUvW25Mpdgd/b6DzhtJMJoEdOfsVNwsWaN9eMpQRQttiya81G+U/
   w==;
X-CSE-ConnectionGUID: GtX08HIUQAqnTA06KeH5zg==
X-CSE-MsgGUID: rTVrygyeSeyPYWDeGKwT1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="102355324"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="102355324"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:40:29 -0700
X-CSE-ConnectionGUID: ikoeKY4QS4WEHqIg6VMsPg==
X-CSE-MsgGUID: OZpiE0lDSmaWexYQRmsZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="281180004"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:40:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:40:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:40:28 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FX5gtZ8qcT1OHawWWPxlAIK/JUdsxTSWJjWewQLXsIztr6VS1HWw4mRQvbhfmVsBDA1rw/PXrryXky9yXZINwRS25j+DsVS+uoAzhbmxs7iJpfu7ndDPmkGFmm3h+0BUTcXglaqrAgMjO2zJy5vmL0uzkPiaf6EzKZdMWEGjOZ2mjt3N9a4gguxUf3Q5DRcUhW9hmpj3appCxqs7OzB4b6wIbANSqQXBufYKK4kaSy03TBLgc2S4gsBiYXVGaC/stoJWFqAiqfSDjG5CsDC9bsyUsvyHj2Rdpb//S6oibulpfusQeQ+e4hy9tkGHqnANrS26PRH9l/rOjL8fvZQkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLPeh85+LyiZI9AGFiGhRt2CAlDi4TvGCHRlvi6jAZI=;
 b=ky8yMFZA1MugB0FHC78T/oteiJtroZDKQj1OBzNnvRBoNVmszTG6CS79ql9MQGtBUOjsQaAqqOpTlz0JUMB3+aUtY0v/2w9MC8O8n4cszMIW2rJYUFBARGx+GrtgDkqlcAIRAlrH95txaKbyLl0RniLVT7y5Mr30lQ3enCYD5sNPG3vETqIu/qPdkYpasinjk0RYc/Hrwdzvu1hVLF82DesWAAIM7HDiyYj2djgmBd587hvueE8TrmpJ/BZtVnkRzEKCYVnMmq2T2qQP5VKnXCQTgWyH7KMV5xfNc7uEaBj9f1a9mV83ZMbLmprHGgJsXK07K3fqGH9NEW2DRajiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:40:25 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:40:25 +0000
Date: Sat, 3 Oct 2026 22:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/firmware/qcom/qcom_tee_uefisecapp.c:377:26: warning:
 argument to variable-length array is too large
Message-ID: <asET0yFJ/fTP75ER@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH8PR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:510:2da::23) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c723ab7-b635-432d-3158-08df215c430d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|3023799007|56012099006|6133799003|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: iovHBXo4+kjNYVzn915NUhKXCIoSdjRNucORbYbBuwibRzVB4KDuIP5OC86mfP/djfTGumsWotWt8w4dcwJaPVcXyLiWNjXyvIw7v7PM3YECyDrNLAp30VtKp8VToRq+x5s7IHnIuUdNXFI0gONjrMuv485PdAlkK/WlGLtBl7/JPOm0pw3KvohKbilK91P6Nk1MwBDFqHGUdGMejlBIzLoSV0y6iM+PDcZHnshEQK6JBlnwhCtGZIPoW+SD6Vte/HY1iyFCHzEpNwnJrSkK8TfiZL5VidMFwEIemRdijBuvIwFQs3szVF1Nn/nJ7x7PeC+iPsGfAOgsWeIS60ydMcSAvmZAQFK0zW/d/c7lavkVqp1gweNDmbvIsNFK6f9rhZFo6Zz5ipUPfqo569/ahkIslRn7Ga33pQq6r+ACQx+xa88M8jTp06TP5+FNivFhe9z2vcrGk4L5N6T2cAYgSr0iZ/olxfXWra5n3u6CHtJNvPF9uXlGEjv9Wd+oe46Dp8KO3Pt1ReFRhEoRllu/DBSJ4wzN6jPMDToNhplfUaP2XY6kXCl7hfHPF7Y9cSiYOIrD/T0+Bs5U7Az8CelG2LR3Q62uDFweTjroOIwB1qrVjQ6V3UsUdBKBALLlVYkL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJFr9HE/nnxmC8o8gfQPeAMpjIZmgFllHwDrq2ot47uPC2V8qCkpbvkjmxGe?=
 =?us-ascii?Q?Es6ebkukS/8zA+A8XLG7jBADUUc4+zpoQL3erEjYpBixbhk7CVlnAtrI5mXG?=
 =?us-ascii?Q?JZZ+Wi78dtPvnMZpmTU5A4FrOHJjjU+4Ys0KE6boQfdSY0BIiepNwX+jYrTY?=
 =?us-ascii?Q?UUPitjEoLPdswKQLRkdbYTf8mjbeEReOFrTUxYUTYa0h79jNC1u0+aSCn123?=
 =?us-ascii?Q?QlDi4H4m9G2exjfPSRZnT1efhGPQUS3FrGR68gSmlwEM7mnjx+x46zJCzfPe?=
 =?us-ascii?Q?A6wqy9dH3iASOekPHBfkyooVB2cNX5TEvQyXVLGy54MM0XhqU5+CsdxVSuJy?=
 =?us-ascii?Q?IR8KjK7Zm3cKbfmihzmH/07ge3ThD7hZMAjebvNfSNB5aU8x0md3JKkx5js2?=
 =?us-ascii?Q?AhWUNSZazIm/kmGr7uxfJW7ayLn7f+ndzyYyOUau1rPCX+pWYQcqEcWePPRI?=
 =?us-ascii?Q?socRk0EKlHVueCbY7R7/6UMH1nuuQnMi3hSDMAManLBwmkGal4f89FgwG8sD?=
 =?us-ascii?Q?+6Iy21IM4uEI87jCq49wuh+K2Sdtpnq3XNIoRNNSGEJuhN7DHeB7s4KuQxRt?=
 =?us-ascii?Q?1yBpKsROtxz6V5KoCiTU6hvteuPgK3n/nkKHhtEsDksp/MXPpYJVMb1nL7Gb?=
 =?us-ascii?Q?fVQ5UM08hrHJ4qxHj5Ychw242Xt7ZO17hokAC0TsuMU/9PIKO505oC5bIY4q?=
 =?us-ascii?Q?TP/jL0OiOtM5tmfkNqGdQALiUDY5E64sEz7CP0h8NyNQs1LJalEqA1SDgpwj?=
 =?us-ascii?Q?V/JWFureP+y5WGI1dU96R+fIew8wNtK0epvGk3+aIzZOdHSYtnOBnGgH194A?=
 =?us-ascii?Q?3F+FTUp50avbmfEjrvZQrR9CdRpxdg4jg41kztRLdYfxA+Eo2rxn9rA4gBAb?=
 =?us-ascii?Q?47WhgaQJM1fbmHTDhJ9aQXuAL4raTkmrEMuwZ71PzgLifUJfocbpHc5qJlRs?=
 =?us-ascii?Q?GVKSI60faeRRQmcLm7X02boFgtLXNpwd+DypTP9uc9eWI5CBN1GTSQO+TZMC?=
 =?us-ascii?Q?FbZxsUBZDU8AH0d2pf8P+H6gy/U3fo2pkh8CA2AqPdNTmKPj9kty1p265Awp?=
 =?us-ascii?Q?xTqgCklXvdqg5m+W0kVIrKli9iQes7F+gNh20MAZswLVOEjq6ixmI0LXisbQ?=
 =?us-ascii?Q?jVj1hMQ6HgR6Uw8AmG1gjiWDtN/Vs1PV92G6DH8A0L1B0eUiCEEVyG5trWl5?=
 =?us-ascii?Q?OIrAe08W9BZA9Y4weR/7tLqKOh5ZJdBOF3tJa0m4UvYdnjQbK+yk+R0ei0Kk?=
 =?us-ascii?Q?UVjOwWZy/wdkG6v/vcuMMAv9GA/I9xMM87Jd0MxG7KtqYNidQ77ZR7h/VJ7t?=
 =?us-ascii?Q?L0LclPXIbqrY4zXqFViEevVWyS2o1/McGP55qkQ4LrEJFOGzg9V0sd4qq8qX?=
 =?us-ascii?Q?ozvPoqdD8629N48INDsIezMDXSs8azbx8goa12lBxIyZ5923jqMq1KV0LpEg?=
 =?us-ascii?Q?vcbW0dsL6SM8WWRe6FufkImEO92FQcX4YgbCLukGPhgriCXG+wW+aZ7ej7VY?=
 =?us-ascii?Q?Bfn7I1qon7sxNP4b2dpDkAdvL3o8hKOjhdaXIufb9/8Xp924lr1L6+RsfaQd?=
 =?us-ascii?Q?NxyDyFdeYHa9kVoBLm5J7Y/ByRtsnoyLI148p1WnDLXRW9TtMXeTzH0azCdd?=
 =?us-ascii?Q?FfryFLvHil/yG6WWnifU11vGrDio23tOZjBJ4HFGQRgX77qFzsgfgNr3BE2t?=
 =?us-ascii?Q?cGdQxrkAnE86q4EWT+qo+qwv2AsQ0tIEaRisG+PozYBl8JzK+184EQ74gt/T?=
 =?us-ascii?Q?C+VTyn0BjQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QZupI8Rg/QD/vW4rmpfhW+OXlDs3deS1bDvJWbfxSE3O6KxJWxlfK+TY97Ce9yJ5PmVl5mES1LqL+RRB9rLn6veFCQGASbsLZ2IV2aAmbI+xl0SeFvd+WkcwTq/ZgW6ziUA/2WLnvA/HjhTmzpBTbI+WQ6NeaPS4F4VlYihRiAexa3G5yNmEFJAOWSFXqjehLzQIchYzhasAjGzN5vQjlBXfcN8otryZz6Nko5upROCqqG2fZDkChoInm9CA+vyY6usiUeaKUtrufdJRpglc+Dmex6YucPNi9tm4gZ49VbsCxFWs521SpVehLZv1pSArU5uMMmVDaflr0X2MJCxNVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c723ab7-b635-432d-3158-08df215c430d
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:40:25.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEAcwVCEhDqI5O2MGho5Ahc+ZF+6FcQ7ksF3EC2lBknE6r4DV6/JH/5XiH0rG/GHL43cG7Dvu7sY2rk32xmYmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233
head:   b59502937f7cb9085e9c5daf5541dc8f0e1286dc
commit: b59502937f7cb9085e9c5daf5541dc8f0e1286dc firmware: qcom: Add support for TEE based EFI-var client driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021602.UwZY1OqZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021602.UwZY1OqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021602.UwZY1OqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'qcuefi_query_variable_info',
       inlined from 'qcomtee_uefi_query_variable_info' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:421:8:
>> drivers/firmware/qcom/qcom_tee_uefisecapp.c:377:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     377 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:377:26: note: limit is 1 bytes, but argument is 64
   drivers/firmware/qcom/qcom_tee_uefisecapp.c: In function 'qcuefi_get_next_variable':
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:284:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     284 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:284:26: note: limit is 1 bytes, but argument is 128
   In function 'qcuefi_set_variable',
       inlined from 'qcomtee_uefi_set_variable' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:269:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:223:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     223 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:223:26: note: limit is 1 bytes, but argument is 128
   In function 'qcuefi_get_variable',
       inlined from 'qcomtee_uefi_get_variable' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:198:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:134:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     134 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:134:26: note: limit is 1 bytes, but argument is 160
   In function 'qcomtee_get_client_env_obj',
       inlined from 'qcomtee_uefisecapp_probe' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:571:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:521:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     521 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:521:26: note: limit is 1 bytes, but argument is 64
   In function 'qcomtee_get_uefisec_svc_obj',
       inlined from 'qcomtee_uefisecapp_probe' at drivers/firmware/qcom/qcom_tee_uefisecapp.c:580:8:
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:482:26: warning: argument to variable-length array is too large [-Wvla-larger-than=]
     482 |         struct tee_param param[nparams];
         |                          ^~~~~
   drivers/firmware/qcom/qcom_tee_uefisecapp.c:482:26: note: limit is 1 bytes, but argument is 64


vim +377 drivers/firmware/qcom/qcom_tee_uefisecapp.c

b59502937f7cb90 Harshal Dev 2026-10-01  367  
b59502937f7cb90 Harshal Dev 2026-10-01  368  static int qcuefi_query_variable_info(u32 attributes,
b59502937f7cb90 Harshal Dev 2026-10-01  369  				      u64 *maximum_variable_storage_size,
b59502937f7cb90 Harshal Dev 2026-10-01  370  				      u64 *remaining_variable_storage_size,
b59502937f7cb90 Harshal Dev 2026-10-01  371  				      u64 *maximum_variable_size, u32 *out_errno)
b59502937f7cb90 Harshal Dev 2026-10-01  372  {
b59502937f7cb90 Harshal Dev 2026-10-01  373  	int ret;
b59502937f7cb90 Harshal Dev 2026-10-01  374  	struct tee_ioctl_object_invoke_arg inv_arg;
b59502937f7cb90 Harshal Dev 2026-10-01  375  	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
b59502937f7cb90 Harshal Dev 2026-10-01  376  	u32 nparams = 2;
b59502937f7cb90 Harshal Dev 2026-10-01 @377  	struct tee_param param[nparams];
b59502937f7cb90 Harshal Dev 2026-10-01  378  
b59502937f7cb90 Harshal Dev 2026-10-01  379  	struct {
b59502937f7cb90 Harshal Dev 2026-10-01  380  		u64 max_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  381  		u64 remaining_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  382  		u64 maximum_var_size;
b59502937f7cb90 Harshal Dev 2026-10-01  383  		u32 errno;
b59502937f7cb90 Harshal Dev 2026-10-01  384  	} out_cong = { 0 };
b59502937f7cb90 Harshal Dev 2026-10-01  385  
b59502937f7cb90 Harshal Dev 2026-10-01  386  	memset(&inv_arg, 0, sizeof(inv_arg));
b59502937f7cb90 Harshal Dev 2026-10-01  387  	memset(&param, 0, sizeof(param));
b59502937f7cb90 Harshal Dev 2026-10-01  388  
b59502937f7cb90 Harshal Dev 2026-10-01  389  	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO, nparams);
b59502937f7cb90 Harshal Dev 2026-10-01  390  	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(attributes));
b59502937f7cb90 Harshal Dev 2026-10-01  391  	SET_TEE_PARAM_UBUF(param[1], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
b59502937f7cb90 Harshal Dev 2026-10-01  392  
b59502937f7cb90 Harshal Dev 2026-10-01  393  	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
b59502937f7cb90 Harshal Dev 2026-10-01  394  	if (ret < 0 || inv_arg.ret != 0) {
b59502937f7cb90 Harshal Dev 2026-10-01  395  		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO invoke ret: %d, err: 0x%x\n",
b59502937f7cb90 Harshal Dev 2026-10-01  396  			ret, inv_arg.ret);
b59502937f7cb90 Harshal Dev 2026-10-01  397  		return ret ?: inv_arg.ret;
b59502937f7cb90 Harshal Dev 2026-10-01  398  	}
b59502937f7cb90 Harshal Dev 2026-10-01  399  
b59502937f7cb90 Harshal Dev 2026-10-01  400  	*maximum_variable_storage_size = out_cong.max_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  401  	*remaining_variable_storage_size = out_cong.remaining_var_storage_size;
b59502937f7cb90 Harshal Dev 2026-10-01  402  	*maximum_variable_size = out_cong.maximum_var_size;
b59502937f7cb90 Harshal Dev 2026-10-01  403  	*out_errno = out_cong.errno;
b59502937f7cb90 Harshal Dev 2026-10-01  404  
b59502937f7cb90 Harshal Dev 2026-10-01  405  	return ret;
b59502937f7cb90 Harshal Dev 2026-10-01  406  }
b59502937f7cb90 Harshal Dev 2026-10-01  407  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

