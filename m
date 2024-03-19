Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B650251
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710830384; cv=fail; b=SR4e+wLin+SDkTNw1X1UmaFDrY+zvuUrlkqsWJIP5h89JW6i9KPVpfUEaO6d0T0yxiuyAuaWUgGHRiBnvzVBtLaQ1xWtq+SuzoTDNjMfqYtyQuV9ahSO7yhNiTRaKqyB7Iv9RelU7NZULovb5hHZb1//ImP62MPetXv23kgfs1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710830384; c=relaxed/simple;
	bh=Z+49ZGiWGYE/iE2m6V31dHTtxjp2tg7oNR+OWnx3ESg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YMOtRiGnkoH6x5q5E0g4PylSKWR9TDi0yhWz2DXVZVinN77ooB+UmnC1Ta9Qt//JJUApZUnoceoMnujhW1e91g9Zw3p3jsI31tGZUMtsT3mDmQei+kVvhXUVejw19Is86FQ3ZtFqIExS58W9YPQpg8ulWU+rDiaU7EefNfaaDOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPdGzMs5; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPdGzMs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710830382; x=1742366382;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Z+49ZGiWGYE/iE2m6V31dHTtxjp2tg7oNR+OWnx3ESg=;
  b=lPdGzMs5oPv//tOJYyp6xqw2Ofdtz3RRrIWKZZYHQbqnRHkkPtXOn5Eu
   fdthQsCC2+F+PZ3iZVZAlePWMIbNDySpA5L7T5R0XprwnrGWuXUhYiru/
   DmOf620sr/z0OBYXp6mELY0Uimnzz0oF8BXGTqRj+QTDASos1RNwlAg7v
   FGQowLgSXMBDry2dDQuKT8S+7MbPk9pu9mvsdaOQkUB5xIVkI72tVYLEe
   LDvi21oYVHhrcf8JqMt6/W/4UnqSob+Cbqo00LtIFOp1P0iLyN/Y+l+hT
   KzqXqZwLt/NcOe8mSadB4h8Hai0lwRjTveSqDQsVI3hDuvDfPavRf6hP2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23134932"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="23134932"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 23:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="18374287"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Mar 2024 23:39:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 23:39:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 23:39:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 23:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfG7Zr4F1JtpPRiBQh6FjG7WwLKwQRrfmpPbUoQAqLdcLuLwDs5P7SzUG18iepKmRaEJoRyBVmQRONg0xxkDV0GPKVlgKZk11oa9Bo7ZJKflI28kppf5MEUeXboUtTFa+BiCNa8bTbZ4SI1x4B2si/9ebE1+GaRQSdTyedSQY7GdKsw7zyl/ufVaaQQKDpShnkZxVe8uniLo9sz+o/IKWo+6RuPRhcyFkGKaXsrLoRDO/Zoog+lPnLt/rzshHzuTDVZ1v4yD8E8tw61wXK3k3yi+iBNvEVAHq87YoLibAK6wwtXNArpCb56KfAhpN44RaiP4UenPPI64IJqAiT1y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmzWRVJTf5JPiB3qGNX1gq39YL4XXbyS+jtvEUeA7zE=;
 b=EyOeDCE48GEZcYlSpf0xOaRc4cyxRIuyk9NY0oz7mlxpJNhXFeDmOvgkwBmnDDe9en5am8qOeR33j6inK4dnOWRG/cOPFQrTtNzp5DMP4QIKhOUGDA/AikNmNxBp8TzL3oq8EBpXzR32hgcw1mwC8cbxyVjy0yA+4BJyi1bdCPRhhzLdgi6GyVGcxcWszO8pQ1oLMUxHXDt2z6nvJdMhA01Wn0SowBf/AtzrYqikOzvYdW/YODgB9WFXaLsXque+cmEhr9Cp/RHLw4B8xtmbiVER4Fry2pSsZqnMOpiIwhLQ21X/4vC0SsbM1q0VezDKTYR+n/FS9TZqMs9xhz44Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Tue, 19 Mar
 2024 06:39:39 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::70d8:2346:a9f7:a1bf]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::70d8:2346:a9f7:a1bf%3]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 06:39:39 +0000
Date: Tue, 19 Mar 2024 14:39:31 +0800
From: Philip Li <philip.li@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Ben
 Hutchings" <bwh@kernel.org>
Subject: Re: [cip:linux-4.4.y-st-rt 1008/22725]
 arch/mips/include/asm/elf.h:228:23: error: initialization from incompatible
 pointer type
Message-ID: <ZfkzI5DGDJmhuoUD@rli9-mobl>
References: <202403191433.fX3nKbft-lkp@intel.com>
 <20240319063506.AmxvUePC@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240319063506.AmxvUePC@linutronix.de>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|IA0PR11MB7259:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQH74af3tO/JagrGeUOxHenXQEyjZs9eKJuNO3gSQ5ls1apm7HHvXgS2TqOwmdWaIFfxaNsxAQ8fQKse1ofpkfdp4Ox96jcL0hJwS6Ypgh7Me9TFaa1vFGDFQpy0EWJAsXdIF6cqGsfD+A3TnGYZSeW5RPLOJ8UfGz4xb0VVlA2ex/6s4SJoL2tGGetaHdq9LIHwEM4GV5JKrJsalV9Aj09ivyN9L72C+Fl+lX8uLhLkekdbWRK6l5eI0OwRBK3PPmmUTfTbjDRnfNeTMKlzVnlaGh7rgUh0oor2YCZEBRMVuaOyvaPtyYFzGMAIngCfAtZiZHSoCunf5326+0l40zvvGVCgD66DS6pTMD6vnBcXeqbGUAJm0ifo8fmyaOf2/ddi+WIABgewkTD5YhwoehkiguurgUep/56uqepPiKCY9jccoR7/+cJelrSgSrrNWF/5+AEmF00r8boZpkGtlObnYOFQpBHZuKdUyEg6oYOLqN4ajypeP26vVRK9kU5acm1TcaVXoWrW/7wbUK4Lp36vb/NvsFYrqBxO3aRZFvmYA3QL4/YSpsW9KfxyGZupGrgrAxzRYSvYpzyfQ/Ow1DzaRdbEamaCUDtE750fEGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cAeE4EtsFrFlulkuE+ydMG3QAsA1bc5lRH2pH28AgWLBl7GaFnF47vPTmnBs?=
 =?us-ascii?Q?bpHNIsVqeHyrIsk69VLwBXQVi+/kDCCwE4avlt8tPxhiv9npC5xPd1UXDyBN?=
 =?us-ascii?Q?NDrK5RYNwprIF8xiycagXU/8XobW7FdfptlgtmmtfXvEoLBA5Tc1SnW7Ds/l?=
 =?us-ascii?Q?H/TZxHv2loYM/K72H/Liucwr0zdEdmqbS9ybb/QMdK1aT2P6JLqFZyRYFu5R?=
 =?us-ascii?Q?m+AL8Wi+9iuwF9q+/tFvB9gu0WqeXi+d2UPHC6+kvy60EGVPuhF7BgClJyN/?=
 =?us-ascii?Q?gtY4721MUUkgkZcGFlKkNHI/tEOr1mUEl96vnXuFnHfevWCUrvHHQTcZSHCq?=
 =?us-ascii?Q?tfZvPB9BUp4PZoW048nku0eEQ5izDxL4PG+oHpPxdAm5ZuI1hH9lUTNiOXa4?=
 =?us-ascii?Q?IKBSeFTD0KPFGX3macoOGnZqdPs0agYqnmXUYo5FsCYPvvHkEk2/QexmmIKu?=
 =?us-ascii?Q?owZa/+SW+wODkIt2m7eJ1c8LYw3nvFSptjUByZJeneYXxtVVLoOazq5xBKh8?=
 =?us-ascii?Q?CGAzR2E4lZYFSAHNis/nfPle4ffj9d4TSk9hjN0QTgNxRdYfe2ihY+L6RTvx?=
 =?us-ascii?Q?0PXl7rYX2xx6VJydUl/UnDfE3oXKA9tz9DAyFdSoaUgJxDLZdMCgaEsiWn8o?=
 =?us-ascii?Q?VytLS9akh9oJtqusSj7jTrGqmzCD/pHn87gDVSNUeOGElQc32reoHjCTwwYC?=
 =?us-ascii?Q?1bebJgE7pwQBt9YraV0JGGKWhBtREM0FKah5EuvZpsHs/mCgLDv8QrTkvZg4?=
 =?us-ascii?Q?Xe/b41zcSil5JzxjFxJ0w06pFHLlNoNSwdj+hWOlZmT+Wy1ivs6tt9Mgwqzv?=
 =?us-ascii?Q?G00ULI28wnbi+2uFmDx8MbirVBGDpXIY/FaR/3ffuu/PQ6xFX0a7FQLegQ3U?=
 =?us-ascii?Q?O+DW88T6vfmh1xuQ512fhkkveYP7dtfejpYunC/cLMzJvA8yTfwRieeC/n1e?=
 =?us-ascii?Q?GfdAP+oS2+wud7x+I1GfEFTGsSm0z2PEatY/lgAsfKTEi5YqC/wH8SM5zzTi?=
 =?us-ascii?Q?pDAglBe6fK6q9uL2fUsj0Lb/Kp0b1cO43wmOw6d4LQgDIFKd7j87c7P41rjL?=
 =?us-ascii?Q?GKBWVtKoiiDJjqk3g5N5pD3dARsii/fububw0lBp9EjGtOxdGB/KmLBGP9b1?=
 =?us-ascii?Q?51+l4pX2D3Pt7mEZNEDyXP9P3qMwcPPnCeq/yFmevEwhDvL0hNmXvuyI5H/N?=
 =?us-ascii?Q?bnU2LEeVHWZi6Nt7OgxP+l0pcHyDUPbq4tSAD01olSs3dOrfbZ2Em1yBzNDb?=
 =?us-ascii?Q?lhasAxRPAz1m4J3fhKj1A7J8oGyhf+5lhLoOroHgACs1+tYw6c6EQUR+mdel?=
 =?us-ascii?Q?RD3w1SH1k61s04j8F7RrO4h7UJ8h4rmkgH8AnJ4AdvzWD51QOeSmvrDyerFu?=
 =?us-ascii?Q?ecmb2Ia+NXNEwDgYiCPYcIj1ah1+mutdezko6GCzvqwACNFQ3KLAzx5HDioA?=
 =?us-ascii?Q?7CBkqKBj97pdifg9qAdsRr8Sw2gGPLy+i9hcYoLn14jIjZO3pquDcsEOEQIb?=
 =?us-ascii?Q?Wcl2ZcgjLYPR6vQoFsPb9W30ng4/Xjo1QoCWCLvNr3IDwjE0Q74JTZnn/uN9?=
 =?us-ascii?Q?j7g3J4rknwOc1hOFg1dERflUpTvWwAAr0G0Yq3Lu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d97733-7b18-4a62-66dc-08dc47df59df
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 06:39:39.1701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kkGEu4RRbAJOSiJdhpEFCcdde4oP1su/2VJG0ugqneMW3QNUwIzb5kLAQIWKwqsDm7VvBz7L57tpslKo32FaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-OriginatorOrg: intel.com

On Tue, Mar 19, 2024 at 07:35:06AM +0100, Sebastian Andrzej Siewior wrote:
> On 2024-03-19 14:08:35 [+0800], kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
> 
> Could I please get excluded from mails for the /cip/ tree? There is no
> thing I can do.

Sorry about this, we will configure the bot to avoid sending reports
from cip tree to you.

> 
> Sebastian
> 
