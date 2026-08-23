Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4838E8C6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488474; cv=fail; b=l+iklZwygkKg6v2mF90DazNBd6XWlRc7ZqIswg+5CBcqXKtaK3Dcx/hpwvDGVfyFqIj+UKZYwDww88jLkayU9jp9j8axDHDR9XL2TPrGGPAVYku1cLl6QFPrJ/8Y5DO1OQ+rDG8JEw8qsfyHUfshVxVxvIb8Lgh1KRtrF89HxLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488474; c=relaxed/simple;
	bh=mv0SR87+M2xDT9gYyabjkNzg9se+Tl4DG5onvOPvXEU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=aGRzcpsjhGs6qjOCQv06LXmZIUm9b3jHDGRgh1YzvrhTFBris9AjB1o2mmU6XXSQpb8MFL4gBsZt1b3LhjwLhXzcm5CAxoRtLltDDE3froPIYXuGqXS/3KJxb1XAMPfr60xikilYMx6c7VRqFCfiTXD33jTBLtewd5lnXqHFS/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA9RMcLK; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA9RMcLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488473; x=1819024473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mv0SR87+M2xDT9gYyabjkNzg9se+Tl4DG5onvOPvXEU=;
  b=LA9RMcLKaUKwsOgPVuj+dMgrcPqwlMOaBXWSGRSMe+T8MgRybGVobRgu
   w9uuK++BLxOPM8t7eFJx0WKIRkppwgWcky+UgRUXjKDy0/sxlmsfE6Ik9
   Dnc6KjWPxFuSNsTjGfWO3R+r8dHN0+8bJFZYgtLXA8saV94ch3BOgui2t
   am3RZTh1KWVqFidR3FHdUzZXMV2jBBgs5vfU/YLQ/yh6/0V7SsMfyygPs
   8+gW5/buvpS2AWMZO3T5M2u/tRZeHxxYYJxImrz2paRg4UEesNUC/1+xA
   WhThHYxF3fLSz5vxNC7rFCPrIJrLeGjNyaqRA4IPGXtscVhtL8lSGeOiq
   g==;
X-CSE-ConnectionGUID: cNm2hTZzSVCKmYlbC/AEqA==
X-CSE-MsgGUID: l8zHsiB9Sta4LYuIPRP/jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="105497594"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="105497594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:34:32 -0700
X-CSE-ConnectionGUID: LoXg0PX5TIafQYn9vYm7hg==
X-CSE-MsgGUID: HeHL215+RcKl1lPqw4Kn1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="265461503"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:34:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:34:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:34:31 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+4EFTr09/2ew+gTj6/DBHwa4M8pW8YyJa4WL94EYIGYf1FSP5KUFxvmX+G9ffR8OBz5xlqAiXArHIaUWvqbBotFVy7Hcoo7uQl0/L+a4smtBA2ZTWwpZRr1xnvXsKHZl/TPmfQcQc53ddzm7sX3JUFA6KQkcasWDbKVL7V7C0H8JL5nc97mMwzL3pm+kuuvRjmafIO+xRFBKeMDAG0FZ3IylHp/63BObltEGCecx3wXN5CgC/JXZtuY0lv+beV9K7KZKRPQKsgc52y4OiEACRzq8oWi/QrVTjL32+soUsfrRB4JiISSx4ttnhIKw5W0Ra+uj/lsWCgw4cLy67MHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnHdpgZXa+lZuGjj0oylSoaT8SW43OQP6TvMc2gDrEc=;
 b=Py4fsXt52S1yIXIbsUOlyvsFy0rmNAYSYAAnKKFc/mxZ6XsGcIpWNA/Hbvr9Paf+qPU4K75RrEzAwZc1obj81MF83TnsDO0Fgpy9vMLQHQq5DD04BHFukVGT1Sc/gKJmMpfApB8jSMhcw5RMNSWqjd0IkZomXEe35ajxJD5Tgr7QE+8ssnMbO0ZKyqvWafqHLJhhBQeDui1jzcQDl9vFF+DbuP/LVUEkpVwb4MJnlxryw2FSwg7PJGr5DGUBxwuDZMejBP3rqQ5KHTD8BD3tQDEnfl+y5J8To18mFDBpmu7HszgCSptujd6DfWoQa2Ht3BiMtBVy9eEfb+HZC984+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:34:29 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:34:29 +0000
Date: Sun, 23 Aug 2026 20:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18 1/1]
 drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning: variable 'mask' set but
 not used
Message-ID: <202608221828.VydCmFDE-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb0ab35-f7f6-44b9-915c-08df0112e059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: rD+ngN9tl9Bl/tH7hC1ANJBBTypZSH2mDu4Ct+x60aENAimLVjKCL5JJY/KtVGTQxtJB4fGcVU3L28E0FRkZVLjq6YliWJNsss3+VkyduL+VpZfMDxhi2AVEjdgMAZ80IsgTRGE2mPiLSL5PPmFI0SVfnLayP0QGGrbi0oFMqs26GuLly33kx6SfgOw0tVIQhktnYd9yiMDY6r8oZAOOVGGhhmxaLkn72qW5wK8hL1/x8Llp2ZChSI+NsWuNeQD7ZVhV983b9iD1IT2ZLD2djQuhf3xaTm6DWxJmZsGKzmT19KBfykbbGc5dOAvZ17WcuIfXgrkwsD4asnIhd+Gerdw8LVDJ/Wz1HMfi398z5t8u+UOf3LC/yBcLvNyflJQRC52iOBcwfn9/XwY6FxXup3DkdnJwrg+sNt8nh2mJL2c0SZ5aVHJ0cws+wTOsK8lQOh9LDOavedY83qT+W+i3q1UKyy+ZlEQ7QtnUI3am0MSBZc0u8La1sCLfud4U37r/cx5q98sGeFw9800BIP94civ4CnUImpFaEaeXKVdZH/mvP2i6DByFkcFMzDchfyQ7S+WpxfaC+ZhuuJkN8rGWUP2W2uaeRWlHZedGFCVE6Zejs7n+0fC9Ag6zwIUgHFRirzxMAu2sfGQnBn7jb6b7nOTWLhe/U0QekdAOqucIJWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NeJ4rsLWZ7QaaL5LQkF7MmVO1ReNocKwDSLrbnLijwn5AZaD9e0UkeyKUa34?=
 =?us-ascii?Q?Ty3OTmRSR/wT4vqB3gOVIAk0XVi65fGNA6hwHsEo5pXjEQMiX44b269UOOvQ?=
 =?us-ascii?Q?gkxMTfg3Xgj9ikMbZ2NNLSHkzOs3eEQrPfJ53sCyIr286vCHPC0+yhk/pDWe?=
 =?us-ascii?Q?FTOuxUeZJQYBlcJQgrluP16O6H20zTQdwNBXflzJwtK/qs9koqdCMot3cKyc?=
 =?us-ascii?Q?ekuR8w27vyg2kp5NgxSll6YN2RzgbaRfYNXDt8Rv/+WiaTH+2oAwVNzquH2d?=
 =?us-ascii?Q?VAWcqkfDeZHPSNYi0cSSx/Fe0goQv+oCPRs+WtpFJdJTClJlrae7iNAw1xDN?=
 =?us-ascii?Q?An+9ZOmD4kkqOPRi74i9DzOjpZH+t/KyVMA+ncDszYvlCU/JMMPS8g5/v1US?=
 =?us-ascii?Q?Kt0DOU1+EXiKGYaOr4F8H2ZCJDfaPQhczL/ewx/fvzG1lfNY4B82LUOwMSWi?=
 =?us-ascii?Q?5MSfYHJjUIqw3ynXBPymFmXvn/gppQQQc2e9EhksuMJ8eURo3RlfWRsUC/9R?=
 =?us-ascii?Q?nUhHxL2Xc6Oh3tHm1+XPbJyc/kLYnai6rWfeHQCEy95T4iqDnijhfPSCJbX+?=
 =?us-ascii?Q?+D7C9FfutROa9HGjax0Q64p1YoxKjOdSwdkVtunGJlu308Werk5THptI0xOz?=
 =?us-ascii?Q?XDBEbKEbksXI8sBfIYeeJoLw+gdFj+S66Ol9Kjk6HqavkWfrL4IUQPmNZKFV?=
 =?us-ascii?Q?Ew7epUJewC+zICWVo1dBa72O8E8/8mm9iSRvPrSb6552Vg888IGBb0NC9wW9?=
 =?us-ascii?Q?S2qhnlZf9iTS7N+8uRaFTl3s9WxI6hGpFP8uZAk0Dkoy1JdoQsRVdQr/F86z?=
 =?us-ascii?Q?/ujMJH1Qavh4y77xCde66qoNG90zsWy1+qciUX3CthizVUe0rGWxzg4+9cak?=
 =?us-ascii?Q?v0nv25EgDymWp8LXuwKlbyHwwUNB+p9UGMJVq/hc4Pl2SjIbS1YsB/U2+ino?=
 =?us-ascii?Q?7qB9IsjOxxImIfaJ9dD33pN8QnAet5fHOxlW1GVfjR0GiKOG4lJuqt5BR4Vd?=
 =?us-ascii?Q?PfJoiIzlq7/3OmXCq4ZDsWOwdYHhbGF99xR+lPm8eFTw6ks/H/HPKF3YGuTL?=
 =?us-ascii?Q?sMK26RLeyCiYvVh0gw19QZrCjL6Hu7CZH5rPlYGJA4BWV00HzhspU9LB7Yb+?=
 =?us-ascii?Q?rIaOJhRGoQ534OHtuzKcqxoFO4QrpkxZmO9HzqLpgEi2OxzWaIA8bbZ/lW1k?=
 =?us-ascii?Q?teCVHVG8u/DriEITCUn2D5/mgOM5UpXmSSXZ5/XE4K1N79aUgV334d6zuWBR?=
 =?us-ascii?Q?aKIPGgAZk2bVWF7t0wZ2teOEJ0QHlZ7J8QnuNCcjbSy51XG6p4Iv3YRTx2Aa?=
 =?us-ascii?Q?tMYTYvAcTpNSaQhLI3zhk3WuZLBCN8nmSIX3HKroRoGn9oAutcP0ihWzKk/6?=
 =?us-ascii?Q?7laTaIejpK3OShG50U77Rn5unWVsVRwPgtvY7n+OTPXTuWc74OzCPOhTfL9n?=
 =?us-ascii?Q?ovXJYTdB/UpqvvMkiYhKmBuHtMZYncfiKmJJTljxXXB1aMR1qaeClx/N6qXK?=
 =?us-ascii?Q?XVWhWsbNsIclPOR2t5k6oMXI3zWn+BN45OuQAyKCD0JKnMvRO7ibXqlPRc5K?=
 =?us-ascii?Q?rLRC9jnCpsvbu9M/AmWhrWxKoIYQbo0JWkyxjLX3aTMl1Gcun5aedgZ2ylHi?=
 =?us-ascii?Q?hV2EQWxnXMY1rUUAyMdRPioxMIx+7iaOae1kgoVab+7lkkl4ORGnUx9a67dR?=
 =?us-ascii?Q?jZHzn2G7PyL0+9NlT2Lgm3rqZiphC2b4EPmvfzIrtRO8GLr8zJWn5WXiA4Bo?=
 =?us-ascii?Q?s0CRx1pEFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: jQ0jtldhbX3hqFv6V9D1pFSJD1fvIemMC2/IQOjaIR2Sge+V1JjJGY9HCbRrZaG9Jc8A/Fkkx45aQ+yP/39ajsux5jTK+IRlKVR/ESFJm1mbTGe1YEvVKYEFzwYKToeMoAfdPCxsZ1NCJxyuTV2uyYBMRakOtBguOqcs/t6Q77B7CPHkoZR/R4XqfJNLcmzl6Iqr5hTaul5UTQFw4WkDRgFptNgDI1E+QrzMPAe9pjTH2oi4a6732NrztSroMXr8h+ULXqMS3kbBDM7jYWqDzEwBD7aesmUB3D75WVkfuKpAyz4QR6Qrn0D/rlBsysH5L0IwogHaReMaXRZZRvNgxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb0ab35-f7f6-44b9-915c-08df0112e059
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:34:29.7295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ern4D//Lw6R+q42aCjgjWggzrYu2bJPoc3td0/WTGF2oJTuyVjyD/equgesdY14aoYP1MLc2PpqK45HFtyhdlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ec3601aba611c7d6da822a2807464da60e185790
commit: b2a0c13f8b4fc3f6c8b279fdc4395a5fa57dda5d [1/1] irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt controllers
config: arm-randconfig-003-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221828.VydCmFDE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221828.VydCmFDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b2a0c13f8b4f ("irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt controllers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221828.VydCmFDE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-aspeed-scu-ic.c: In function 'aspeed_scu_ic_irq_handler_split':
>> drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     107 |         unsigned int sts, mask;
         |                           ^~~~


vim +/mask +107 drivers/irqchip/irq-aspeed-scu-ic.c

   101	
   102	static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
   103	{
   104		struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
   105		struct irq_chip *chip = irq_desc_get_chip(desc);
   106		unsigned long bit, enabled, max, status;
 > 107		unsigned int sts, mask;
   108	
   109		chained_irq_enter(chip, desc);
   110	
   111		mask = scu_ic->irq_enable;
   112		sts = readl(scu_ic->base + scu_ic->isr);
   113		enabled = sts & scu_ic->irq_enable;
   114		sts = readl(scu_ic->base + scu_ic->isr);
   115		status = sts & enabled;
   116	
   117		bit = scu_ic->irq_shift;
   118		max = scu_ic->num_irqs + bit;
   119	
   120		for_each_set_bit_from(bit, &status, max) {
   121			generic_handle_domain_irq(scu_ic->irq_domain, bit - scu_ic->irq_shift);
   122			/* Clear interrupt */
   123			writel(BIT(bit), scu_ic->base + scu_ic->isr);
   124		}
   125	
   126		chained_irq_exit(chip, desc);
   127	}
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
