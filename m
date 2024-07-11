Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D610A0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720668924; cv=fail; b=szXQlt6tn48lrUjo19Sm9Utu/62o13PWk7J2hAA33iLl8foukIDJhzsMo1LvmW6O48lTEEV6MDcWFlEoBk0VjQM00IvVSZWsrEqG/H5//VwvcsuKhgwwR+9H4QdUKtwa9sU4lLIYRk7WZx82qqz4kdpELlxCxUEbm1RG2QDhUoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720668924; c=relaxed/simple;
	bh=9i0nvar+3PEsFvFe5PzNUVATS+9XY2L+Z66idYcP01U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BFnEudWs80mTU9lqZS0vP2ZgIpcgf/uegyrmLLjmqxz8n8uRUvD8CY2JM/Utcf+oPikUZWM0lLnkJY6tlbNOAsn5gQ410+sLfC3UXbhSMLDPbAE1C0ebU6Sl/mNmivrUXbP+9CXMbMcU4NeCdJJao3m8kJYj4LVaZtbacqlEMrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHg90Ry7; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHg90Ry7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720668922; x=1752204922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9i0nvar+3PEsFvFe5PzNUVATS+9XY2L+Z66idYcP01U=;
  b=AHg90Ry7ZPgxIEqCQuP6kx6pI4vseLbUPivor4MHMsL0O1nZKY6Wy4yj
   7OlGvU46ala1iFrSgkPSFhUSFAX7D01cvb+kFjnzxsO3hrUtR8cnvUPOH
   npiedlhyVeLSMJTDKmd3leSrYAYwRlk7lVh6noVkk8CYkwW9U1SU1fXHA
   fGjdRJCiLevIQ04RXDbD/sY6XuPcjUGkhVnimbBi86nsVlLyA/bFTPCig
   epWDMevQFYsnYxQgoKYHiZdFRji+pUz3zPrG7zvE7/cQTJPRtOWDPJxgp
   I6GtyberYWp3+v4sZcgojRgJxVKbFNSX0FG76izxszxsShxiN6Zt65Itt
   g==;
X-CSE-ConnectionGUID: DHYon76kSc292y7nGcyCew==
X-CSE-MsgGUID: t+tgwML6R36jk+CdiIjosg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17844330"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17844330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:35:21 -0700
X-CSE-ConnectionGUID: /z6UD2pwTo6kwfmntPeu6A==
X-CSE-MsgGUID: SU2HuY8yRWC+urrAFRA8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48859925"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:35:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:35:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:35:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaKrY9vG/B/FA3sWauvwMu7Rl3MTUILRYJd6bytGUnDK1NYNUtvwYWfORGVFcvPeU1dpIztUe/XhABcXIi6gRcOVdj+cG2I4HWBC4DDGzDTChkxANz4ywd6RPj3UVDbvZsj2p742zlJ/qjrZc3g3XUsiCRv+/WI0WZjiALA4dWhTf9n/50AJ2m+jPhaMcWuvxp61/rgNr6K4WW0LTU0UO05zhmOQr27+6BEu4UNeR3HoW2Yhwbxcpn3rsiVLMV+0J4eSGPj6Bt8dVN1gaKv+9/nL4mMGQ1o5vH7aftC8TgViLslykFharuvghs6QKvWjxwS2ueTaltN2iM2KOGpLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLiqrvEWKtP5HDZwiStHTbbCI0KRAF/UJuIEmaqCB1M=;
 b=l5bqpwYc5ND6MHMkPMEt5qL/IX8zjv35zWqoI4zapOTtnWISOKcMpG4tCXeq0nvF77ekh0n3bzj7rbKOhw3xuBrS1VK/Iv2MifYBClevP7eGPK7dw0IYmEj5+3ihWUlLupLJZtxUUu3aFHT5IsPtwaQckY5qXds5eHBJSUoemOSvc2dPLxsznQqZLTczg5xg/le6CccARA5JYO3gZPbdSbL4QOFBATbMkzuNhm6CQMMF+BRBp3VXCSj09XqDmBxz959UxA9zEGjQ7RHDPiw+0BgIhlVxwC6fpSXdK9a3ODpQ+jo/MwZa3t4uoWRbkelsqoDVdd8ugSTujXW4C8m4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:35:12 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:35:12 +0000
Date: Thu, 11 Jul 2024 11:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 10937/11381]
 Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error]
 syntax error: could not find expected ':' (syntax)
Message-ID: <Zo9S6YaDC3+b281X@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
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
X-MS-Office365-Filtering-Correlation-Id: 485cf036-5bf3-4f57-4678-08dca15a785f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hFNWWXP4cAQClCXvylPTVkjt1DQZSdOzSLRbqhv2V/1+NuiuiHkdE1dQkw08?=
 =?us-ascii?Q?xWTUAUbaXoDxFSNprcXmjNbBex8poJKpHxuTFH/WPdYrqqriHb7vepqOpOiM?=
 =?us-ascii?Q?F9O43IQdAfwEFM77/f4aLFJtZIEuLUThBjjPT/YvYnFS98CYbZBA46fyThSD?=
 =?us-ascii?Q?nBvFU9Jb+uakkBU+VdbwenVdLSrPwVhCDHVa/Z4UNL4p/052LjUtccYiNxk3?=
 =?us-ascii?Q?D1sutu2RVFte0IZTOkbkad2gwVV+m1F26MhiRRmD52XyUPrWHAUgL2fn6bgo?=
 =?us-ascii?Q?N7JvIWnlLEGElsNVmrMCfDVmnQspr+7WtAZv7Vc6jbTqU2cImlKu9VMPfoQi?=
 =?us-ascii?Q?b9s8HPvyCHAlDQS8oOqyITPN3hyDANAd5d2XEyfNot8hwHOTSwiLMweiX7+e?=
 =?us-ascii?Q?A67mW8dF7Sm1zLATEavXjrT4DzhoqeiU6fKdcHBw0RVYLPvxZZUl7Kav4Q5b?=
 =?us-ascii?Q?l8OHFaxcW8yImQtEkrDYbXIzUdEdfh40V6OaL6HexDeKjwbrQSe3S05yiDqL?=
 =?us-ascii?Q?z3mg1Qmz51xA2bl50pgD/TPlW6eJdGJfTrg9/V3vz8Vel0bBegLBWNA5ImYv?=
 =?us-ascii?Q?FaA2SfWeMwX4V1v4Fs6zgQu7KYo6ZUfCh6I4oOD4w7CvMitu32+anyR875Vv?=
 =?us-ascii?Q?GiX9Pm9Zucd3xT5gboMfDwZN/9gDzKkox4TJ5L0JOFnpQlQ17njZmtzYwqQA?=
 =?us-ascii?Q?IApsIpGru0zWQIPWppUZZC7x+wlc4Ha5xClR/4xmn/SjscJ9bOVgQEwRRxng?=
 =?us-ascii?Q?TXh1qzckBNoXrV+2+0vrgAra9WS5mvkVTXyvGZxnDYemimXAfg+Tjn5oiYjV?=
 =?us-ascii?Q?6G48ZZeheoQgCdo1HkrO54S44C1XanS8EA1PqyRXTE31qi1IOllGLHTysSxn?=
 =?us-ascii?Q?7lI9QcKaXkrcJHccQAuALSWu32S/QcxEHiMOIiIptWqIDEPPF7Tejyco6yql?=
 =?us-ascii?Q?SrsaeWo2ZMByoHIeZpXL4L9ZChR2IXGcZD9olhN8BAGtAh2t4mQL+dwPbyYp?=
 =?us-ascii?Q?Gx2nRtQzcg4/AYKJAREC5reUaN8GPafEHvUnfHUGleskEKXEsyhArR/dcS27?=
 =?us-ascii?Q?VRUK5rk4HV/cmhSWXKW1fzGJeUMZv8ulAI2f5Jigcfkn/ALxN5jqTePKpDkk?=
 =?us-ascii?Q?X3SnA7QoMo9q0vU7PFggACTwRsrZHTjys2DJbcdzKwFM2acpcedeYRU4CkRn?=
 =?us-ascii?Q?Z++QLr7tvB8/aSvDp2liVQKsRtrmzY5uy4BsLLCG+m69mg8fONxvYwgarmw0?=
 =?us-ascii?Q?ELro1ATD/RskNv0LxGs7MY6pBpZ5eJO40VfQg9gSM6CwVYWVhoqVHXKNqDW6?=
 =?us-ascii?Q?0YU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mS08FdeRnvZFKGCxxEzd7Wu22E9OHft2CXCRgV36yLDroEsjRhsXqiufC1Gc?=
 =?us-ascii?Q?rr0SOPvFUFHRnlLZPgXYxqPBML4bOZoL4hLwsDAwOaSelYYCAYLUaobC6xgw?=
 =?us-ascii?Q?pYy4u3eKXcU2kQYf4fnwOfISgDzwQYVaDQaLrHn6i2u1fZOniRo+EZe1n+se?=
 =?us-ascii?Q?AvOe+gp/8Te9xubwOvTO53WswvcMawg19fmmcDgfIRw8Rd9BHcRsxZDd4kOu?=
 =?us-ascii?Q?pnx0bXwDf+mTa7DWYLrCZ4F7Orb1V0Ac5ov5qtg3n0zOEfYlohwIlt5WRWWD?=
 =?us-ascii?Q?FvEEZxlFrTl1CPv+schq9HWfO3v0GbDxuRplUvRmg3l8fUqlRG2B+4gE0OZx?=
 =?us-ascii?Q?auOc12/JjNKLLIAgKuX228N43xDE0rvXNHXgDx0tc0mrsNd/wfntm5NqY1IM?=
 =?us-ascii?Q?3jstvJJXdVHlr+sTZmbgyuRKKRNLk1Mon8cECicKjUWzbwSdowmfLV0aozay?=
 =?us-ascii?Q?hpYuVEEDpfYhP1JRF7cmciQKyfps3IRA44kyQsP6ybY4CLj/uC6Z5zFIjg9Z?=
 =?us-ascii?Q?v/wlXjIdkcVtaPGPJxal+7QskHUCgf4+QAqLTHW3yVX1AN1b9zYZCr8INmoK?=
 =?us-ascii?Q?7MA5hvPrRLxBQWx8hIwm7nZR4VsnIfc8Jaj1ok7Y0933eLD/XLy+kGiLPGe4?=
 =?us-ascii?Q?eWV4ggMsN28LB69c9J37eUHMeAfocQnncsmKgCDrQohlZhXiNsY/GT+PW+SB?=
 =?us-ascii?Q?p1mLTjt6wUPDRQensJX65+XaVrWRQvBlDyBCdtRjUPcAAnqyg8aCbswv3y8n?=
 =?us-ascii?Q?/ZBE9RO3G84dmdPk00NHMPvM8AUsxvj/4p7QeKrlK2o3FD/peqUQW153mDMI?=
 =?us-ascii?Q?FVLWxqEe6GzHFvVF8NdiQPyp1mclst85YaN7BMpp3b1ghGddqWmIaqlWtEWX?=
 =?us-ascii?Q?2AJfLP7R4xMSrqsKuPjaGsUbSWYsaOSub7ZMbNfmyVH05yH7xXzTR4pbexOW?=
 =?us-ascii?Q?T0MwlwvqD5u+SN/OUhB8E+0tIn7dKNjVn8PZ045UwqK2OBRbfyS+gBWGUrJv?=
 =?us-ascii?Q?8s28fPmP7vGYjLZsV9MEYtTn9L9FWSzgPHhoP+95RiLZouulyGPYjl1hNadH?=
 =?us-ascii?Q?ExtykyqGRl3X99Q0jUZZeHZ8AlMov739OplW/0sgdkYxDGL7YAsy/7Im0HTf?=
 =?us-ascii?Q?xt8HsLwAQMrWPT3oQnJCxRk3/yXUR8UXk+KyFah3TCoDt1q3AZwPVWyhqgDE?=
 =?us-ascii?Q?WM/hDi3yw1rgFUdS6LsH627XdoQshbH/ikJviRIWcqbzvv3S2On+fnZuJ819?=
 =?us-ascii?Q?GEx/FnPYVaxrbDOkWd7XaKst2SAMzvDtQajNV4VwNaUrY9MJIYFc23Hymmfr?=
 =?us-ascii?Q?ofRcwdCQJQAzDyBYUkNQNXlISt1NYrpoXps3XyYYCQJ8yZuAiyVbo+TeUjLt?=
 =?us-ascii?Q?bRrb3G8kuOuh8QABWkzZ1Y3gUfnkw6jpqeDxCAKTSgTOOFU6z+vqlFrgg3p+?=
 =?us-ascii?Q?ss+QqMfX/ejDXGrWvun7ptqLTPf3nt7XL7K/pTE4+sxAgBN1BhksRtDIzZxz?=
 =?us-ascii?Q?+L4pIL0AUpc9P+jeBu5T4tncQ3stvQQqgiNo11FDoFeuf1i+RNH48lzDoM/+?=
 =?us-ascii?Q?dGZpOVx4B8eTKTqdzrKeXqFjiNbGywhB6eKPeLoVe/7CMOIXV/sjQqjEGPYB?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 485cf036-5bf3-4f57-4678-08dca15a785f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:35:12.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guQ0t7lMCa1wBwyaxe9ROCTmPSfXX4n5j7zVgbo6lvNRAFyyE54xJwDXfFr3L8XsgQD/iOpt1yewMZuvw/HFlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: bc0aaf4114b2f5a7bdb60a2f0038e70bb01b5a06 [10937/11381] LF-11070-4: dt-bindings: firmware: Add nxp,isp-mu yaml file
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110241.FK4TEwH0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110241.FK4TEwH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110241.FK4TEwH0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:26: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:31: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:36: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:41: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:46: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:51: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:244:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml:65:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
   Documentation/devicetree/bindings/regulator/nxp,pf5300-regulator.yaml: properties:regulators:patternProperties: '^SW1$' should not be valid under {'pattern': '^\^[a-zA-Z0-9,\-._#@]+\$$'}
   hint: Fixed strings belong in 'properties', not 'patternProperties'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: could not find expected ':'
   Documentation/devicetree/bindings/spi/spi-pl022.yaml: ^[a-zA-Z][a-zA-Z0-9,+-._]{0,63}@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
>> Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: fsl,cd-gpio-wakeup-disable: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-imx-flexio.yaml: sda: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-imx-flexio.yaml: scl: missing type definition

vim +14 Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml

bc0aaf4114b2f5 Robert Chiras 2023-12-20   8  
bc0aaf4114b2f5 Robert Chiras 2023-12-20   9  maintainers:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  10    - Robert Chiras <robert.chiras@nxp.com>
bc0aaf4114b2f5 Robert Chiras 2023-12-20  11  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  12  description:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  13  The ISP firmware is a free-RTOS code running on M0 core inside the Camera
bc0aaf4114b2f5 Robert Chiras 2023-12-20 @14  domain on i.MX95. Inside the Camera domain, there are multiple Messaging Units
bc0aaf4114b2f5 Robert Chiras 2023-12-20  15  used by the firmware in order to communicate with other cores willing to submit
bc0aaf4114b2f5 Robert Chiras 2023-12-20  16  jobs to ISP core.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  17  This driver is using the mailbox system in order to send/receive messages to
bc0aaf4114b2f5 Robert Chiras 2023-12-20  18  and from ISP firmware.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  19  It also provides the ISP firmware protocol used for communication with it.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  20  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  21  properties:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  22    compatible:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  23      const: nxp,imx-isp-mu
bc0aaf4114b2f5 Robert Chiras 2023-12-20  24  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  25    mboxes:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  26      description:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  27        A list of phandles of TX MU channels followed by a list of phandles of
bc0aaf4114b2f5 Robert Chiras 2023-12-20  28        RX MU channels. The number of expected tx and rx channels is 1 TX and
bc0aaf4114b2f5 Robert Chiras 2023-12-20  29        1 RX channels, per instance.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  30      oneOf:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  31        - items:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  32            - description: TX MU channel
bc0aaf4114b2f5 Robert Chiras 2023-12-20  33            - description: RX MU channel
bc0aaf4114b2f5 Robert Chiras 2023-12-20  34  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  35    mbox-names:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  36      oneOf:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  37        - items:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  38            - const: tx0
bc0aaf4114b2f5 Robert Chiras 2023-12-20  39            - const: rx0
bc0aaf4114b2f5 Robert Chiras 2023-12-20  40            - const: tx1
bc0aaf4114b2f5 Robert Chiras 2023-12-20  41            - const: rx1
bc0aaf4114b2f5 Robert Chiras 2023-12-20  42            - const: tx2
bc0aaf4114b2f5 Robert Chiras 2023-12-20  43            - const: rx2
bc0aaf4114b2f5 Robert Chiras 2023-12-20  44            - const: tx3
bc0aaf4114b2f5 Robert Chiras 2023-12-20  45            - const: rx3
bc0aaf4114b2f5 Robert Chiras 2023-12-20  46            - const: tx4
bc0aaf4114b2f5 Robert Chiras 2023-12-20  47            - const: rx4
bc0aaf4114b2f5 Robert Chiras 2023-12-20  48            - const: tx5
bc0aaf4114b2f5 Robert Chiras 2023-12-20  49            - const: rx5
bc0aaf4114b2f5 Robert Chiras 2023-12-20  50            - const: tx6
bc0aaf4114b2f5 Robert Chiras 2023-12-20  51            - const: rx6
bc0aaf4114b2f5 Robert Chiras 2023-12-20  52            - const: tx7
bc0aaf4114b2f5 Robert Chiras 2023-12-20  53            - const: rx7
bc0aaf4114b2f5 Robert Chiras 2023-12-20  54            - const: tx8
bc0aaf4114b2f5 Robert Chiras 2023-12-20  55            - const: rx8
bc0aaf4114b2f5 Robert Chiras 2023-12-20  56  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  57  required:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  58    - compatible
bc0aaf4114b2f5 Robert Chiras 2023-12-20  59    - mbox-names
bc0aaf4114b2f5 Robert Chiras 2023-12-20  60    - mboxes
bc0aaf4114b2f5 Robert Chiras 2023-12-20  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

