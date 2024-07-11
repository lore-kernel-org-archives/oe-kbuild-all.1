Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676915AF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720669036; cv=fail; b=qqmT9mvgGfhqoO0H1xLKm67i5DE/SFbX0dlZZqxhrSQaLjJGB9UQmqnrQRksFJnqmzxHQTNnncoEkxqZHnWg0Daq83pCXRFvFgnDFC+SiCQviC7vZ5TsNi4EP5csE4RMX93Cs6rvBVB66MWL97BIhms1jjctrOF7Pu6gMcEHzQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720669036; c=relaxed/simple;
	bh=JGjl622j+P0Y1DtcsgiA/DKj2WAlAuYL/tLhPOuF71Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UsU99K/8b+S8CAOTWXQsLltLMvEa+5Zg9qyT8KgB+HajqbKYY8gJzRyt2hSWFhtSSyvNbvsHGOvVSPDeTRLwAGwVgUeM/X7eFozoziZda1wxs3XSrF3mzRPFwe6DoLtpNT3i58bYy2lFvP1vRGr+TL7+jb9CvjG+LKfnI/TR2Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9G+yFgN; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9G+yFgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720669034; x=1752205034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGjl622j+P0Y1DtcsgiA/DKj2WAlAuYL/tLhPOuF71Q=;
  b=F9G+yFgNmdroGQpEk1z2x2vlU/DY/hbKvqjFSbhlG2yf9hMJfvRJkGDI
   uYKxq0VxibK09TcU/24uUsPHjUMPHctOIMEgbjCSgdKT3diiRM3jU7T3v
   KigdjMh9fkeypSRwXBjru5BtrV97wfP/osmUTmM8JJvpwBhx1MR5LbN24
   jkdwtE3g9MuIwf6xce/dfmwqG5Y2cZll1fF4t7g2Iyf4WO9U8zfdQitva
   bZkNo+mRkXhLbf4bTwLGmLQK6FEdweMofy2pyUZ4yB3pQcPwK90ISS9B7
   1F4lcD6QcwqKLWX1xAyJTNqglRJ6g09HMjHOHBoCUQpyX/EydAuqwl5vi
   g==;
X-CSE-ConnectionGUID: w4TXRzCvTWK+a7Jmld5c+Q==
X-CSE-MsgGUID: EvoR/HZ7QxOuYbKdGkmcvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35460621"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="35460621"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:37:13 -0700
X-CSE-ConnectionGUID: GLoNEd/6R2u0i6miZ9Gdew==
X-CSE-MsgGUID: HDjzQoRYT1ePS7zWS9jRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48860215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:37:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:37:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:37:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpdufYmleKt9SPdsPEeNbQU03lWvZHamfLQ1CjXIviLGmuF0vF93ONPRqc0cw4QeHHT8uJj6d/aHldpW7E86y2fWipegFpuaiy5EYrmaaYWQoHE/rX65rHXdUGNPk9HA30P5RdkTAyxyP3k9tRxtXftIQ0bSd0iwe8CvZeOYCu3xzU+3EIl4/q6pLRNXGOUA/3rCO5QMy0VqDDFrbHNQWHd0/DAp9w1fuQzDxi7z0u2gMVYf+JxYPbQiRNCJQDDQMIyHTc05PId/Pm8HcxIQXhWvT8aaQzI7/BmXzoDXFDupW+5+uRqgGuubUceUtK2+zbzzzC1JhCodnA/X0WNL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5kJWAMH50K38ey1LUp33OX4OIZeWEKI238ZcWL6iYw=;
 b=JUWvp5iF9OuX8paFa0xSq/+YtpMjrJ6QrQ9EdDSL23qBVVgfJNWn/UQuBhHukes80GTqUkGw6MXrogOKPmHsbsJue1G1omc/BVzpQLf8OemfK2fjpflVVPjN8MVLb/n2vByy6+IQPov6goqIMm3f9rICc5LSAHvMOKp4Qw0D39Zj211uzfVWEshz76LVplYeIXmynl05csJ56I6BFK5jH3PD66T6Ti65gr2BegaWdbbygGoQlxw245lxPYlwU6e0WT3szqq5+GWy83FlAJ+TuWeQJIKHEIMztLrElo1w0YvtDYavcYNUat0GsOHief/DTQK27VIsPgZ3DsE0k5q3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:37:09 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:37:09 +0000
Date: Thu, 11 Jul 2024 11:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-1.0.x-imx 2607/11740]
 arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb:
 /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible:
 ['onnn,pca9654']
Message-ID: <Zo9TXpkA7+UhaRyY@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6029:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 80948dd9-8b9e-4fbe-2fe1-08dca15abe17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y5C8JmKQFpHBeHmwBiduxfNFD6mvkEvJWRWXnE4rYdPuJEnkwravTuywvi7o?=
 =?us-ascii?Q?AWYBhS2KLQd//xRVHnMeZM5UUT/EJyIB+gPm51y0x9kvDOJBQzIIgSU0JNwS?=
 =?us-ascii?Q?9gt3356MjjFagNGk6WbKfrKpewfLIACdRXXMlDwDaJVec6dFssJ5QkPdAtZ9?=
 =?us-ascii?Q?KqsZacfz88hGQOg79pr/mVIu2HiFhk87B3AbWddp8/0v7YNlN72czJJ3CQyn?=
 =?us-ascii?Q?8cRnLglwa/TU3uWjWpG+JJSNAO5OQNXt5hy7nmJNLsGZLzLzSFPyedzcT5xg?=
 =?us-ascii?Q?4j9x18Ls1cU4e6OvjwfwILTjb7odoPwNC9TlYmB3gio8RkF4PTf+LWA33sa3?=
 =?us-ascii?Q?grxiuG4bBj5Vghqef82r4GtxZXYZ2FFQx9K1ELo9tLrCBrW5rFBYEEUMUg71?=
 =?us-ascii?Q?V3umvPh0LxLUVgt8ZTGTL7sGrHMojQ5AFvWuWcneza6N112SxUWTz5rT/3GA?=
 =?us-ascii?Q?SgxxWZW1GLlHp0hN6mDAc1H8HpHnwFfVMpifyWlENoZafIKcMCrSAO5sC6Gw?=
 =?us-ascii?Q?WW3BhYSMILlVN1tdUGGvLPMfOeHv4KSLm77tixeKkHaFXPqh8nDV/Omnsk9m?=
 =?us-ascii?Q?Dfb9ZcdchMqTfrZvDP8Mv1UhfcVdVsUcrcMXfpIhHO8R0wlIzW9uVVUSWxWI?=
 =?us-ascii?Q?a7iBtAMyDKUvmKrLwLw8PumcKb6m5YbCy2c8AnTwFvcWYyiO4Cd6VG0Y9Fx3?=
 =?us-ascii?Q?rpj/GrSTKkc4imqGCbVRKPTMLgFjgp+2gBnHh6urhOnbv8OdioMq1Wnj3Vf6?=
 =?us-ascii?Q?ZJt/Fwu4G6ZJI3/bVoIOEfSEkhgUR3Q17FBZddkk+DmVmg3y0x5X0xqhESoY?=
 =?us-ascii?Q?af78Pp/F5Npt/vM0n7EnYYolsEXhlC1AYgcODyWa2BmphWzOgy2nSAdwkWbZ?=
 =?us-ascii?Q?qTnqbW4iWxCdOJ1iM81nx4di7gewMgkZrD+gpWatZDCR0Forpn7FnBMxQIoR?=
 =?us-ascii?Q?FfCfApyXQGacdFad0f+xK+OLfyLxUKDM6fZtoNZ2/UBCpEqzirJubL8DT9tb?=
 =?us-ascii?Q?u8wrrPAM1JzidGxToZXknx43QpmWnkrA0zYqNh4gNRPHFgOFyCVtmDmg7ZWg?=
 =?us-ascii?Q?OhSMRAIM7sZuPbcS7JyDNqKRiVtaIbdzvgw9GrA/5g2PqxTSiK4MKHkbdVJa?=
 =?us-ascii?Q?v5Np0Cq7ZJNqpCCgbYZH+fDCnbYh+pVqJWYtvw9ai7X78bmoXdpGhdYq4S8P?=
 =?us-ascii?Q?yAM6QZcI2rhqNxsYYkdcfcn1Je/HXrowhrbmFpGZ1LeZ+AthOho4TpwIlpNF?=
 =?us-ascii?Q?JP3c1MPm7UqAyRkrItxvvAnLSSRSJlwc9DasLUVPBRtykI9ymPv1U7YQm1+L?=
 =?us-ascii?Q?D0AmOiLxUUqrZs1O/vKOAvsuvahZ1jKvFyuWx/k3Y4RSV/qMqKp/WaRaIbbT?=
 =?us-ascii?Q?v9V14B0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9iazI4ucI7tjN4n4OUnwvQOEgCBiYUNVz0EvbhUr8NnHZ7soyAoDdvDmQ1Hd?=
 =?us-ascii?Q?MpP3ymyg0K4FEXavg+UbIUDPLhdgAYOBrNYTTQdsgFnf4Yh7EccWfs25IepC?=
 =?us-ascii?Q?jA31XXZq5YW0ErtnbaypwTMClAK/4+vKK7nZIJVoSsV2a42W5sBOXD+htsUL?=
 =?us-ascii?Q?/9IOUeYaIrSeJl7bgGXUjhLB4maW2RIH1sH4/zrJGDc/QIkF+vnZnMQuTPGh?=
 =?us-ascii?Q?KDb+2GKxi0Xa2YVuctYUKgUTUHWC4UjBIUkewwq0bten6QUn+lqsqHalIU5l?=
 =?us-ascii?Q?wavtR373lxrGRAvHNW8ZSSM+k2En+G+3WdNhBr/deq5JpK09kiqUwQ465rMy?=
 =?us-ascii?Q?Zf18NaywKTdo38Pshbt5QIZDS2Sxh+f77okB/ZvOmkZVfxEBb0fO8b88NXiM?=
 =?us-ascii?Q?hyAYxy786lnWMDYUj27uR1GxIOWXcZCJHJ63F1d5RUnShirAk/lwKg945mp/?=
 =?us-ascii?Q?JKD/JEd8kcufWEt63UhNnXHYn7mtS621uZJ/OrZxRPLkaZxRueW7ic/5jPNb?=
 =?us-ascii?Q?clrfs2k40txJ/lEmBep8KjjubuEYp9yP0MqUMN2HHjdzwS1aR+JnBD3cWi7C?=
 =?us-ascii?Q?Sr7Fp3hX9+X65ZAVEDz1GZ4w6+n2wyJL1naKmylKGkWvslKgMW65lQaw0Glu?=
 =?us-ascii?Q?ei+AL+CjgmdeSfXzxTVt3Tke6hau3DklMrbon0PGL/eVXJ+d31tXdrFYFjAe?=
 =?us-ascii?Q?2BHowOD0otu1k+cZAtVrBD2fKt4GMLWKaV3JJVRmy3aUnhp6t4T71mLzYYKD?=
 =?us-ascii?Q?0qHYfDgtw2+g4W2HBKij9wRUy9Fd++cCI2KAG0Dg3/bqHZivPNTDt91Av6GT?=
 =?us-ascii?Q?mVrgsPMkS58tPTeB+oi1dDt3oSyiW3GjeMK0W4soLBh43x/kEbY23O5ZmBCR?=
 =?us-ascii?Q?+FuX7ublSNoxTQoHBCNTm95IsGEdq0t0TgowUQtHqlROyfDs5XzFuE89kh90?=
 =?us-ascii?Q?fhaBfuCloOHvdAMggLtSOCaaEadpBC9Ba3diOL8DlC6XlT6vGtttHbGGh+xe?=
 =?us-ascii?Q?CtpxMJWrb68O/yVstZCtJuEfGS+gab9H+en9r97ACB3VjAbKbIiT1BOBixCb?=
 =?us-ascii?Q?qga437+hkSjjxDiD1Zis9vmS0H3KbZbWnxPRgAEAGmf62XifI5FwNkQotoSt?=
 =?us-ascii?Q?cc9MBNGOUmq1jNw954D2cuQ/fbnBVIsRO7ozW5LARV+fBZ7wWw6GVVLMVMKR?=
 =?us-ascii?Q?ot1o0nkh2u5NBPJfnkOGMv7q2Qr8U3ZHwnkZQxBWeOdIyLbA3M3RaIGGEazS?=
 =?us-ascii?Q?Ua8+u+reN7EkTus/nBdo9PS3vvFS8dpbHpUo3FhxBhZ3mJXhV68t5AVvyACz?=
 =?us-ascii?Q?LpPQA3I2gJdGkUPW0mDPVOKbyx8eXwiGNKwJPeIAWny73e+PoVbzvQJ01bk+?=
 =?us-ascii?Q?5Q1R3Fx9PIqREztIbRfAtKtRtvohhelXTClDk6elC6cxZJD/ciqHnJ6aY8xE?=
 =?us-ascii?Q?lH+iTeSYxRnwTA3H1pvCc+NStPBjMv9Vh8qH4lVL58F5ChTDiCNfns8fhht2?=
 =?us-ascii?Q?dUuSRG40Q943KrrEY0ceV1XelD/jVmaJ/8V7YZaKCG2TsY6r8Nuj2eTsZb8x?=
 =?us-ascii?Q?e2+HmXHAQCNFkw/S27C08RK1oj51cmlNHNEI02on9N0qbHiBGXXVtw5AB0Ad?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80948dd9-8b9e-4fbe-2fe1-08dca15abe17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:37:09.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FN1bqUC4ur97gxn9xV8s7NS4tKm5eHbVWBfw2+WLQJ2Br5LSVClaN3yGpX1VcmCoIp12d/7eDFZuP1AZfzMKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 5c8cf515d45b79e8a788443c1446204e742a1549 [2607/11740] MLK-19251-01 gpio: max732x: add output IO default voltage set
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110641.8hUP1TOb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110641.8hUP1TOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110641.8hUP1TOb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e6510000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e6510000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: clock-controller@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: clock-controller@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e66d8000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: versaclock_som@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: versaclock_som@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: /soc/i2c@e66e0000/gpio@70: failed to match any schema with compatible: ['nxp,pca9538']
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@0: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@1: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e6510000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e6510000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: clock-controller@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: clock-controller@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e66d8000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: versaclock_som@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: versaclock_som@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: /soc/i2c@e66e0000/gpio@70: failed to match any schema with compatible: ['nxp,pca9538']
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@0: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@1: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: sound@ec500000: port: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1677.12-1687.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1705.12-1715.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1733.12-1743.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a774e1.dtsi:1761.12-1771.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e6510000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e6510000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e6510000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: clock-controller@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: clock-controller@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e66d8000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e66d8000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: versaclock_som@6a: 'idt,shutdown' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: versaclock_som@6a: 'idt,output-enable-active' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/idt,versaclock5.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: /soc/i2c@e66e0000/gpio@70: failed to match any schema with compatible: ['nxp,pca9538']
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@0: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@1: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: sound@ec500000: ports:port@1:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
--
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1175.12-1185.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1203.12-1213.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1231.12-1241.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1259.12-1269.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1287.12-1297.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1315.12-1325.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1343.12-1353.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1371.12-1381.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2455.12-2465.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2621.12-2631.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/i2c@e6500000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/i2c@e6500000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: /soc/i2c@e6500000/gpio@23: failed to match any schema with compatible: ['onnn,pca9654']
--
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/i2c@e6500000/gpio@20: failed to match any schema with compatible: ['ti,tca9554']
--
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1191.12-1201.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1219.12-1229.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1247.12-1257.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1275.12-1285.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1303.12-1313.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1331.12-1341.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1359.12-1369.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1387.12-1397.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2067.12-2077.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/i2c@e6500000/gpio@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/i2c@e6500000/gpio@21: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: /soc/i2c@e6500000/gpio@22: failed to match any schema with compatible: ['onnn,pca9654']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

