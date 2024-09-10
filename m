Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B018C003
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725973645; cv=fail; b=UePcgri024bzCbGvBzg8jtc/fabyGpy0QPqhYZF2KKJHi+eh+cZiPl0uU6t2GLoseNiuPvYw5obOnh9jEWl0CeLcseJm26DbYkLNiPwWORYDnN0ZXSYDIBsiZxaJLeQG+PXBgmfOunAJS0RZMNFFgElARbrqkqVcB0ZBY1C6ofM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725973645; c=relaxed/simple;
	bh=PYQ8oIr0TToWCW0TRrZPiJEg/xpBn6eMeILKS/pdaJk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YID/K3eWNUXRXDo190SqK0vHn/mAjAJerAJujO+sdkYE6Mdv7pkVDE9e0LC6z9X878ho1VdqWc6kKZMG5hVvhhEteA5/9lwhVG/sr3DhmvYRS20tq7os0m90YU3MF1FVAndsKxhzQA71bKi7iP0uBTZ/wFLcUIOufcKAE7hQW4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzs6BakT; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzs6BakT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725973644; x=1757509644;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PYQ8oIr0TToWCW0TRrZPiJEg/xpBn6eMeILKS/pdaJk=;
  b=dzs6BakTeo9ja9atVbSLDbpUOA8i6WJNE8VknpldYohfuZmK6A9C7zoF
   qMggWXgUDf5fuYjdy/i9tEemG//2MRYjrCimTRykI2bGyz8iIJlOlyQax
   fvb6gHaHcungXKlENT9VbXWhtRO6e0M8O6kZW9UngrXoNy5V7i/v/6xui
   81ijLz2MpB2eOHiFe7f9qRsvnLwBL9gocC5EY8uELGWsSpDpy38q7l+W/
   k3LPHzdX+9itddCx/l4HqttsSd7CDZY49usITc6Bjk1XEisrO/qkRMx4W
   Zwd4QzDpv3AwNrXoXJOsNKmgAeZl365M2y7VRvpALFJTSQZB6x8qwd+r4
   A==;
X-CSE-ConnectionGUID: 2A9MuJVAS3Gr+r8e4fOH7Q==
X-CSE-MsgGUID: ovN66DkeTpmk+tTN66UXAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42191863"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="42191863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 06:07:21 -0700
X-CSE-ConnectionGUID: zdFEJ0KITnmkKLSfaCDjHw==
X-CSE-MsgGUID: 91q957EdQZmFM0WpCKCVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71800668"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 06:07:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 06:07:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 06:07:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 06:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVVCYsF5sgbpuZ/NM3XpenSX0fYyHWY7EXoOcKpVujiNle+T5rGjDwZ5ePx4Zv2XelaWLr7rQR8op6mY7a/L4Dzw5dao0AR9JRZBqCpZui6r0uVo+WnyWANDFZUR8+kQR8whkt2B7+bAIu2nqTljycrIuarEV71ACW0/uJp1x/Vus1N6etkBqMLtM+2rypuWZQMGPrXNRg50kZJdSU3PcvBnHT20tdkGi+7yPA/abyDpMreAIqC1MA+KXxPo3fiGV9kvqdyEoSJWdyW56ANBL1j+p5RRQRgPC9U9B2LtM6CbXJoSNCbMacvZ/5JXLh/JSIBIYg6aftXW05MWHKt5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0pt0zvju17AaBxXA26Bb0V4proAyXKE44wPhKkqAd8=;
 b=CLXK5LICk4KvkKWdqPAeLUrGUvPiP3j3BCNTc+xk06LQs4WSUMg8zBtwp6mmOnj5jSz8IB4gx93uCnw7Hsn/t4FbQ/q0UMSqiFVzuKRlCicTJ9SExbD0xnegTUmPNmHsPdszsPflYduVTW7AIvQaBqe/Gjbzo8DE5XGcjHv2o2QSo2TRYRK1a46r1QoaBUDM8rMJKRbAxqzqRWRV0LJ15VWUhGaoKbWOvy4uWAiGSX9iGyJmxUR1HeNJddqMsaAnHDEMtnH1vsxo4AIcZSINAXfRLCcL6pLFA1rmYQD0umWqNvfjhomJBDExeaAgZhNNGM4h+8SZezECd7iNFANq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Tue, 10 Sep
 2024 13:07:16 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 13:07:16 +0000
Date: Tue, 10 Sep 2024 21:07:08 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [cip:linux-5.10.y-cip 14/39] sparc64-linux-ld:
 drivers/irqchip/irq-renesas-rzg2l.o:undefined reference to
 `platform_irqchip_probe'
Message-ID: <ZuBEfLumLFWS7ytl@rli9-mobl>
References: <202409102023.JL7wN61j-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202409102023.JL7wN61j-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcbc6e9-0848-4897-bed0-08dcd1997ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p/M4dg9XCeixWE1/IYQS+kV87JjVKZAtF1tiA5YDscv+ltqIIS8A5ytUllbh?=
 =?us-ascii?Q?KsBD50DsB8pwyF4v/SGvxCLQASEeooTJoLT6qhaSzGixx5wFJDyBWhnLjQE0?=
 =?us-ascii?Q?mHenOkoPThKtca1DL50sGU6/4dd4qZ9mcNdxUwxuQhBDaBI/7jreuAesZBhn?=
 =?us-ascii?Q?brlXm/6jcAzBF+zJq2uXSSMWFKpaJW+9iAra1LMFjIaOmtkxUBSzkYjLsLzL?=
 =?us-ascii?Q?s5lubroyo+TfIfjpMQB/+5AKadN5sLla0wj+nVwI+HXXS5mWstm/3Lba/NFh?=
 =?us-ascii?Q?LWgYL3GCYVGl7+Kldo/bFPbVV1RvVQW7Iy+VpxqV3UpX540LmVey7coDlx3D?=
 =?us-ascii?Q?JRL/Hf5+B5oAlr+UlTdzXxSjDkJhlvUkTojH8Z5S0z4LW8W213O4Epzdmxah?=
 =?us-ascii?Q?GmCg1ofjgyrKtfezDuM6CUsobEhPMChpVAVKDxm6SMHNGNA2yZ62iJiyQKPs?=
 =?us-ascii?Q?PYfbwFBQmbdXMx1WeslHNLHVG1104PZyuXQ1XyKiqa1vrWhPB1bZCuLlegg6?=
 =?us-ascii?Q?5I1sX5PLkaB3u6aZLERAtz9zw8gnedMg9e1ZLH3G9AwgMGoBx8mehPbgHlvH?=
 =?us-ascii?Q?fO2iSUs+hWt5PS/L+Ev9sSh2I5ZiA0IHT1NsXIFIyGm4hDeqJJl70En/WgY9?=
 =?us-ascii?Q?VLHTHK/zNJF+KHWuYGmrkJBj92OKcXUGOPo/NDSXs3mLCpJ7RCVlzFl/772+?=
 =?us-ascii?Q?QPBSiOqsiVA9u6Mb9oDe43G7TS2FCpaJtFbGAlv/PT2Gu1WfBnsbYRh69AhX?=
 =?us-ascii?Q?wRBtoDWLmzcbssTGZbtHjKxtEuFrvsLIUcfZVhI0bBE5DobWkJbB0NH5GaaF?=
 =?us-ascii?Q?Hpee4W3FLaYEvEW+aR1GTn70Ug7EfBE2teAo6TbJz87EQy01QsTRdBob18Hn?=
 =?us-ascii?Q?UKi8ww2tv04hUbN5sCIBmx0fdaxxWIK9JlZV70wLYKw4T8+EQL7uAz8dUByp?=
 =?us-ascii?Q?qMua3Zvf/ugZboxxLLU5kj32LbIdm7523LmUlb6w3X1pKONuTFRL0XT0qSGv?=
 =?us-ascii?Q?Ijw3ETbc9CXvtzjkriDRPJW5Stb8v9Bfyn5KFvJczqTayB1qB0LXiXyQcpUm?=
 =?us-ascii?Q?So706VlzKfS411galFawpnURHLZpHc7hp9KgY1bNBXzZCjpYYf7CBXLYTaT/?=
 =?us-ascii?Q?Uiaap27buB6HdLnr//6H+BDDXHGeb2tVm66yXMB2cWcYH9YwVmdXcIN1hwEA?=
 =?us-ascii?Q?zzkXJGxJpsT77GlThwtwAWtJvS9HxGT5BTo25qInsCxRY1rVJLF7M3c/rxAr?=
 =?us-ascii?Q?izYELYkDuJr8arlZh7xoOi3aUCQs/QQCrDIrJqz2yPqDU/i/BOh/HKn4rBW0?=
 =?us-ascii?Q?Qp0Fry+7fMnjLlCCwRF5ocIa+5ZkSZokXanQMJrqgDSFiZvhxSf8jE3dA87p?=
 =?us-ascii?Q?1c+wDJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LPErNT7KfiaWjQ9F1ce+ZJjSUUd0sWOecOcZZal6aBtLfUxt9Fx7y3si4Rv9?=
 =?us-ascii?Q?RU53/CZs29GONDiSj6Zr6WuUHPsrAROxHDXu71qEQonnDEo6S/SktplK+cz1?=
 =?us-ascii?Q?+JBcQSzxf9exSIob1KuMgHLcyepcORJWVU24KjCQA8rQz+RmLS89WKnCOuWC?=
 =?us-ascii?Q?4iYr5B9DEaRUtfhPdETE2vXr/iWUDH15Feih1rqg7BjZta0aVmjKj8Q5RrHH?=
 =?us-ascii?Q?zefiCBKskaktl2EPI43dPW5nEeC66cSYDtHhnHXw0KAskm6XDAPq54P4NowN?=
 =?us-ascii?Q?L78+xrwc97TLtMR2eYnAn+LUi7tFySv0m6XKPw3h1IYHART0a15Vjs1MQUgU?=
 =?us-ascii?Q?sgBvhOrisvYtnJgctsvii68v6EyzZ/KXEU1DrVfMy5LTsyg+9qlh1oH4axBH?=
 =?us-ascii?Q?LpYPby8PLmpW5hHbqBHBAVJ3x86977Hj/5xUACrs1BIKPrDKICJW7AyhzJlM?=
 =?us-ascii?Q?b7PZ+KvlQqvaVQnG0AKcGnR8ATjtRvfbcN36ud6ZZtaC0/EiHdSqHdhgKbKf?=
 =?us-ascii?Q?q2MnJUpqPoMzwUb4N/16g3p0Oedpk3oxOErrFf5eqwGkMWZNvPGoXA/H9zaU?=
 =?us-ascii?Q?IOEPT564jdl2ORppChs9SaE3ZNX3WBrXSJ/iNfEgYF345AW1I1u0qLsCVs8e?=
 =?us-ascii?Q?0ECZ4PNMNQog2bMSReTbkMHfuCZLf6y3reJdYjCz92gUuRQcaAPvosoDwd3B?=
 =?us-ascii?Q?3TUiItgIXrDWeXjr58pG2j/TVjHUFhTo5g+Y3Ks7E6Lzw319tXPd0AWI0O8K?=
 =?us-ascii?Q?TeZhItrpZ+LrwwDLkKJU6/Z3dlVH7sv03e72qv090a2DaqcMrKCMin9SMM/B?=
 =?us-ascii?Q?seqhwOk9Lr2UMZ5c3+TQoFyFbXwKTuLiMIIla7JyqZZvNRgsKzb1riSx0efO?=
 =?us-ascii?Q?cKLQfmD8o41ULitcduudqTTvhLoS5Z9Ry9C5sUyUMeWDrG1iiSk/HUy4fkOL?=
 =?us-ascii?Q?unff5Xpa/9jAlGOEf9zvK/Gx+MqvIlcWwlEhRoF89kyTZDY8iIKVFYPaUzvr?=
 =?us-ascii?Q?vkRkiuuyOUv1J6J/zo+zxZP+e+7VVkuggOjrKqyXOhnKYpb1AAybqcYshT5N?=
 =?us-ascii?Q?dunxVnyk0IEqSTLOEOHsmALJprebub46QuwCDwZOQxtMyzECUK0DOfcGCCtZ?=
 =?us-ascii?Q?a8MrDP5LMVn57hnAUN/EK1XEG2CKog1UNyTLC+3sNI62I/iBXwAc4mQlJATf?=
 =?us-ascii?Q?vylN/19Nopp2HB4nZESFZew6/Zr91X6k9Emn0Vj76yMUx4chYrzrmwhOKam2?=
 =?us-ascii?Q?sl/HUdUaDYy7uStbUfieZtx7/L6j70dikm+APU3c+zvTCKS9k3E8JYJIOyNn?=
 =?us-ascii?Q?kGoGl1+7Uj+cWekJ+3eQetlRmcdjmwSTYRxWVn6XuiXFAuZwVmZWGfxh4C4A?=
 =?us-ascii?Q?jhOiVRU894RzG2GCxfCyWZi5zvO/w9LCxTgFO3G//SzJl5ykgCrEXL+tgtwI?=
 =?us-ascii?Q?BK5Nnynj7nHFviEZODpr2N4tPDriMiSOFIPZvB7RNYfX15jOPAyWQMgtcGXF?=
 =?us-ascii?Q?2owWpYYUGwBHK664IeG0JCk08Hgb/BcAvov4QhSMbf7pHQIyV1FdvvKKIOHe?=
 =?us-ascii?Q?i5jotjRrTCgcmPw5JiapRsBlUjStjA+U2iXqB/0i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcbc6e9-0848-4897-bed0-08dcd1997ecf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 13:07:16.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS/jaQomnraMazk+0yIYXfMkHgaaM8AlVBQ8wQQBhFBtX5+AGB6vlhvPRuaxVcPduZhs6AN2iKoySY4LtRvxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
X-OriginatorOrg: intel.com

On Tue, Sep 10, 2024 at 08:24:44PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip

Hi Pavel, kindly ignore these mails, the deployment of new configuration need
take a while to be effective, thus these mails are still sent to you.

Sorry about this.

> head:   a73978e16f87d704893e4b3a637be257420d43f3
> commit: 1a976563ab48d0c37e7ead6ec20f2c85bc094cfe [14/39] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409102023.JL7wN61j-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102023.JL7wN61j-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409102023.JL7wN61j-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    sparc64-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o: in function `rzg2l_irqc_init':
>    irq-renesas-rzg2l.c:(.text+0x5b8): undefined reference to `of_irq_parse_one'
> >> sparc64-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o:(.data+0x0): undefined reference to `platform_irqchip_probe'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
