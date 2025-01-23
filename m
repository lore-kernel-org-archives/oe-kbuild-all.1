Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340620E701
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631275; cv=fail; b=dzW3OaR0xU4kXmr/0/bt+/kTS8x6wxccnomMqFZfCTtd8UHe25F4jNawX21ycjuT483P9w5wqOpNVBONPk4kZ1AODpklSVed+zOUTORVsaAVaVx4gIflmU3fQ8e3MmBGhH3UZRSbSq34wpk6tCIbYWmMK3iyx5Oxxhg36siolWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631275; c=relaxed/simple;
	bh=Lydd/v4d1zACZOP62rbOTPC/FGskMfqveOoRPP4QDpQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P1OfQ2MHpgW4yPnKx828PAq5DL8j7gnhCw16HtU1d4BAFXaDdcKEfauGlrle9hOhQcTlRExWpS7MREkSfTTSRkYuM8mBML+DWXLrmhJ0g5nymtPXq1mw5A+N8bfv/S/vBzajy6lpzmxM6MPwIsKCMeAtOiFw7H9ILIIcWWs6XvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHgNy2TI; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHgNy2TI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737631273; x=1769167273;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Lydd/v4d1zACZOP62rbOTPC/FGskMfqveOoRPP4QDpQ=;
  b=KHgNy2TIhBZUqoMuIP7CvcDQTyiyFmNivoUqjtYADxEEs3e0thVohk4A
   t3tBviReGzk9SsYC94Jlsbr8mV7LhBvFvTFHu9ctfifz/AodiM+hbn8j6
   mXcxk6MJljj2+emP+TAMZH0TvBw081lMJ7KwGxSWxyIABdFkjz7eCYdsf
   B5jX7kzkCy/mcvd05uxnu8rzZgHz8uRiUWBlh48A1ZC13JViyH14kYxjp
   j0hkdkCXxAZa0vznLPxPvPZdunnfYrs0uWJwAN9gq15x6wXrzEvxEZ/iS
   MVtaFElP8G9OD3L7JRZV+frzJmJzSzl6QWNNGZz8UoGHnCypY1/AYtnpI
   g==;
X-CSE-ConnectionGUID: 5Kh62UUHQva45K6vDj5YeA==
X-CSE-MsgGUID: on09pUsuQZK69WIbasUk7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41791022"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41791022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:21:04 -0800
X-CSE-ConnectionGUID: 6Jx0OmGaTWqfhsQbZm7MGg==
X-CSE-MsgGUID: hhxHmo7dTYiUyMoGXtzZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107247381"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2025 03:21:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 03:21:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 03:21:03 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 03:21:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRMuv2hQxkKwpPX33g4gdwABUfehKJxpL3G+4BbGLbkZZXfderE6uFpK0zy7RqghrJHnQ8di2q3jOW7RF7dzpqL6GrZBqIbosy86BRqqcp8uO/6Sn1GYHtRBjWO1h3WG1XjrMcJjfUG18CCqu26zMFkNEsN2G/KIGMu1OuKr2J0tcE8lten2wiM4dJClBORn7DmARi7wrqqI/DWab8Mi5RBQo+XS/jHauJxY9W9Xq/Gs3wRA15c9hfTjqPSLKK1QHxYiLHVOTMOx+wKNX+xbYUOgcTVAqX8vhN3HrMbtcr5y0IQeGNs/B49eZXDGY3y5fTxnVmhZ0tnABarN5YNSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJWj4ECPbZyB1G3UmDvsw9CsAVn5apkZOeXlax9kh4w=;
 b=OAoNZAcnYC6T9RXghxHJAkLSHP+fN8QK4FYc0Xvb7YZk+YidYEJQZ+FYZ9Tefk/zX9f90mZjVu6l6xQ9mgpoaVca9QFNZORCdLGADUCGNQoj5fdQfwbpNHcyelpht3Kv7Qtxz/xynmBFcjXGYt6X1f95UY0uRbD1ae9WG3aowCunO8NTogRvB6Q5tnMyhmWh5j8IDvaESfNx2bdEBB/iiDvJyT1L+gxU4SBcT29tiecb7UHI6ZKtsCK/r6oeHDp70alaIZBCnNlOb0xDjkY9dDKU0uBiK0Dfm/BsggZfRGEw8MqXz+xC3rLVn9vIypQVUkFK/oIhz5CIKtgI89X6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ2PR11MB8345.namprd11.prod.outlook.com (2603:10b6:a03:53c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 11:21:00 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 11:21:00 +0000
Date: Thu, 23 Jan 2025 19:20:51 +0800
From: Philip Li <philip.li@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: kernel test robot <lkp@intel.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: drivers/base/power/runtime.c:362: warning: Excess function
 parameter 'dev' description in '__rpm_callback'
Message-ID: <Z5ImE9RQXqIPvwXz@rli9-mobl>
References: <202501231452.84vwjQqo-lkp@intel.com>
 <46151c97-9f2e-407d-a9b7-fec1034281fb@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <46151c97-9f2e-407d-a9b7-fec1034281fb@infradead.org>
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ2PR11MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e20e65-a274-44cb-7367-08dd3ba003dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bZxAOfZtQwAJzkKHFVhiiFnoVWViOTIH126wCVoeMI3sOFlFJ1PqgeHtEu5U?=
 =?us-ascii?Q?WcRfyxoglLJH+fhsB85oJUx/VeJcBYy+mnW3cAkYxZPWmHF0Jls09NyRYQdt?=
 =?us-ascii?Q?UhVHG+IeBMzx+7RXxR8U5VZbBiJnFvMN0ouM49DgjX+llF1fxzMtlzuVl9hd?=
 =?us-ascii?Q?FJdZ4Bw326ZYpKXCjba/1zQuZONG0K5NkZngmsP9L1ejfoFvtZQC0Q2yw92a?=
 =?us-ascii?Q?cjJuEK7YZcxNduiXW3Ao5X6ISoMgRBqp4z8HSTvhSWh1K1Tfb2jj7Pj8pAuB?=
 =?us-ascii?Q?ndxfcbQCmuV/Le/swExVG8krsjFtAu3Umn9c3Tx3oINbNa4ueqZZZDFfxixe?=
 =?us-ascii?Q?fs0j+l+jXKsTFFkUeQG3TVpIP0GuoXhGPmCvTPQiYkz+bDuqIlzRc0fsQQK9?=
 =?us-ascii?Q?K9fTHfsRZKp5wxWBMIj8N4W+/AeNJ/xrtTWkdckN/tdbAerEImTneV+ZC29Z?=
 =?us-ascii?Q?AU1spP4Yi63pSnNtfG10YfH8k409Ot8K/eX6CoykNt+AM70LjwH3yp75UkFU?=
 =?us-ascii?Q?Zsh5XPr47GlcAOR+mX5N+QvcMnb8RxJr+NNNpnk2VeXwJkVHH3sUiGdVvaB+?=
 =?us-ascii?Q?5EYWw9hHWaNInLvw8KHz7Dq810wCdOoh+qgT8GnN56FzHotQUrmGu7H+d9wi?=
 =?us-ascii?Q?qct6v6vnykDBmqKTXWcpmzXyjMSLu+mYNXrVR7USaLu+4/V05+7UOtFzir5p?=
 =?us-ascii?Q?5gDYSc5cNoy/57138yGOnt7YACnCr04bRbef2uJJYCwME2STixc50pte2D/H?=
 =?us-ascii?Q?NvRxoVsnBN5wWY1nUzX0ciAK30jH4jzui/MZhvxyl/maLt/wjAxjwHN3ZK6T?=
 =?us-ascii?Q?OD74BzcaiMMViz+vBLXhnmIJlCHshvBrkWpGa989TqA56K5XncJs/HjYg/nm?=
 =?us-ascii?Q?p+wwrWYQdFvMfXcnLzMSeLg4O9U+9K9A9fqMjf8jNbtLkK6/TkEsxrR/dLS0?=
 =?us-ascii?Q?Dw1pynFfb0rdN/+Umxvg+3kzClUoa1iDvIjg0znAR/UcDx99IZ909UAAzg7v?=
 =?us-ascii?Q?gKGY5PVIZcTwgMeHT7hPPjb7p2E3CKR/LZjU+ZpvB+TltiwTmyErWORXfoM5?=
 =?us-ascii?Q?iAJ07NukYnP/bS3lbGAThP1/hMY92Nl+5md+NP3tRc3sf9uMZthyIDITJ7Y0?=
 =?us-ascii?Q?UvNluVU+nkI9qEjq0DavkX9z+Tc1cDSXWFlUS53HFcpmQxY3a/iVvyi+Wlid?=
 =?us-ascii?Q?B8QPpqGFUKQtY2Tyz/Q/fkfus6Wiv0py+BuXSPbqJsfDOlS8nG7zz8AKN5dz?=
 =?us-ascii?Q?gff/yeRowreiw7OsopG0ZXWiQPMYcBr0G5rEEh5mpeMtCLhqxato087uPLL+?=
 =?us-ascii?Q?dwLbrrnT44unBzidXgCafTfxGFMmJkmAzQZyb5yhTnIJGZroa08AS57ASlpz?=
 =?us-ascii?Q?tudGIeCASzRnH1FK0ul33S4uw4wD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3pLZIyBFtqaup+rqgtiBwJ9XWWEptUcBbDRjXeWptwhXxuta3kAeIrvNiJl?=
 =?us-ascii?Q?p9PjO5NNNpfqUOh7Ji06ORCTxNIhQC2x+ISAPxGRPxTqBvMBtTqrXN2UEw2b?=
 =?us-ascii?Q?xZEzf9H1OCzXPLN+u5po0XnGC27X2NH0fU14BhqkH2V15P/2Hl3Oj+THdOiV?=
 =?us-ascii?Q?rQFnCriOkz/qT5I4PHUDUNpWWgQnU1ldxLLnv5FXRvkz70jSaloJs/CbLUCn?=
 =?us-ascii?Q?Ar0ZQNTXpW8YvjPJelILV2vV6PxCw9/jBgNnfe88AAcqA5B9/lFB9UYSQpmm?=
 =?us-ascii?Q?b4ZY8VIrgZL4wO3Gt9zoSo9+TqTstBUZQzNpeW52ysTPrz5LEfvKxo+I4G8m?=
 =?us-ascii?Q?r4p8jbF4Pp87If1fcDbkSqXkjzMTr+L7QsH93YkQx7LIDoeGM8z8kYIzsjIg?=
 =?us-ascii?Q?lL7OknVkvKuvGv85QC89FrDC4o8cH4g/PlJ03imfFcDT0N+LbQ19EMuIeuBz?=
 =?us-ascii?Q?Bv16odzptLf3w/Hh8XjypBTnDWce+UAhqftoeNHA62gCfqD6iqQuUcdYmUAk?=
 =?us-ascii?Q?CBdSeKOBd/sWUL4YKbUbtsH4bdrZviL2B1fkMIuFNY2uO6nQvJlcZhWIxW3r?=
 =?us-ascii?Q?il/KRWNHpkusNUr0G3ahxx4J220KhKLqBOtIc9pqLKFhwxjmSWo04vDqUtiz?=
 =?us-ascii?Q?hGimrk3nxFJx4hz1RWcSGUz4PIjsdauqF72iXiVavQTV35M6/9PtCWQnyX7I?=
 =?us-ascii?Q?XrOEETxotqS5R2tw2+c0QxpkHgMs0qik/FGj2JGCUf/cYUjstFqb3vSh5PRN?=
 =?us-ascii?Q?UUWI0Tx4aWEslpnoKglEyPVb+pb3hPLNFi6YXyzYupCokULIzXfr2rvowQqb?=
 =?us-ascii?Q?nIcLPyBTtkxDvhsIyAxOXKrwyEMBhJtY7zItnyp707tW4pd5XbQX97zYUvpN?=
 =?us-ascii?Q?QzBFAYEBn2lsB0V+dVJ3fl9gqdu+xjvFMsFYLP+riYcBvlew29F2nSJYdIdL?=
 =?us-ascii?Q?8dmWxu3fUyikIH9O1paOJWh7sfeo6fLiPq8B1tIOmaCPhGtE2SIfjwIpCgyC?=
 =?us-ascii?Q?VJrHiPafve4GNVtwx9I+hApc/EMCUHQh8gUK5Ow12ddCV6JVgd7pdS4g9bNB?=
 =?us-ascii?Q?8BBHlERU0G2QjYv3sTDK9v8VemfaObGm6U8DkcgIGF32YVMMXY2m0LPU7KA4?=
 =?us-ascii?Q?Opx2DRYhHF3QIH46WfPs0Qbyn+uLfpPfJ31+yV1U591bRoPcUBbIQHx20qbq?=
 =?us-ascii?Q?/lK5dp5ofWp9vc176mjOwPTNYUIL3lEisiQI7gH8+0YG1wXGlpsJtp1fZngS?=
 =?us-ascii?Q?G+geLH8enUVW4emYDnVWLuQs1OoBaGbq8iB0BIqVcEMFR6mFL7rmZA/qrBBC?=
 =?us-ascii?Q?n1jzRhA9ZETDy0Tu3BqQf8H/GqASoAe5ocUg8RFnKvddrrirKgnf2FNMMgTV?=
 =?us-ascii?Q?jda2XEMhx4KZyfUU+EtbAvIVj8hCNU5REKaiTKO28hjlombQ+NPsjM3mJzj1?=
 =?us-ascii?Q?FoTg0sM/k6DIomU6dfZSf5Ym0gbKPU+FFbM2ja7J1SXpV3uqaZGM0XutBN/X?=
 =?us-ascii?Q?FBYISSxNxPELJHlvdv1dkcpBpPBp1x0ArlNjmefDHmwzBZo3vpbE2JBh0wmf?=
 =?us-ascii?Q?faHf89HNpHHaoPFSFcvkZiXG72s0PIzMx24c+1tX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e20e65-a274-44cb-7367-08dd3ba003dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 11:21:00.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X91C/66+od1tu9jthDiYdfLaW7PxjnHbxI/wPV7OFbj6H/uV9LTcwUnLcuXmStbvUMnUU+YG4nzS8FGILvWBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8345
X-OriginatorOrg: intel.com

On Wed, Jan 22, 2025 at 11:44:21PM -0800, Randy Dunlap wrote:
> Hi robot,
> 
> On 1/22/25 10:59 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   21266b8df5224c4f677acf9f353eecc9094731f0
> > commit: 7be6a87c2473957090995b7eb541e31d57a2c801 sparc: allow PM configs for sparc32 COMPILE_TEST
> 
> ^^^ Not relevant.

Sorry about this, we will configure the bot to avoid reporting similar
false positive for this commit.

Thanks

> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27 @362  {
> > 63d00be69348fd Ulf Hansson       2021-06-08  363  	int retval = 0, idx;
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  364  	bool use_links = dev->power.links_count > 0;
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  365  
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  366  	if (dev->power.irq_safe) {
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  367  		spin_unlock(&dev->power.lock);
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  368  	} else {
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  369  		spin_unlock_irq(&dev->power.lock);
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  370  
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  371  		/*
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  372  		 * Resume suppliers if necessary.
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  373  		 *
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  374  		 * The device's runtime PM status cannot change until this
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  375  		 * routine returns, so it is safe to read the status outside of
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  376  		 * the lock.
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  377  		 */
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  378  		if (use_links && dev->power.runtime_status == RPM_RESUMING) {
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  379  			idx = device_links_read_lock();
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  380  
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  381  			retval = rpm_get_suppliers(dev);
> > 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  382  			if (retval) {
> > 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  383  				rpm_put_suppliers(dev);
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  384  				goto fail;
> > 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  385  			}
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  386  
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  387  			device_links_read_unlock(idx);
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  388  		}
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  389  	}
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  390  
> > 63d00be69348fd Ulf Hansson       2021-06-08  391  	if (cb)
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  392  		retval = cb(dev);
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  393  
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  394  	if (dev->power.irq_safe) {
> > ad3c36a534bc7b Rafael J. Wysocki 2011-09-27  395  		spin_lock(&dev->power.lock);
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  396  	} else {
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  397  		/*
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  398  		 * If the device is suspending and the callback has returned
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  399  		 * success, drop the usage counters of the suppliers that have
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  400  		 * been reference counted on its resume.
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  401  		 *
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  402  		 * Do that if resume fails too.
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  403  		 */
> > dbfa44782787dc Rafael J. Wysocki 2022-12-05  404  		if (use_links &&
> > dbfa44782787dc Rafael J. Wysocki 2022-12-05  405  		    ((dev->power.runtime_status == RPM_SUSPENDING && !retval) ||
> > dbfa44782787dc Rafael J. Wysocki 2022-12-05  406  		    (dev->power.runtime_status == RPM_RESUMING && retval))) {
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  407  			idx = device_links_read_lock();
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  408  
> > 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  409  			__rpm_put_suppliers(dev, false);
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  410  
> > 5244f5e2d80125 Rafael J. Wysocki 2021-03-19  411  fail:
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  412  			device_links_read_unlock(idx);
> > 0cab893f409c53 Rafael J. Wysocki 2021-03-19  413  		}
> > 21d5c57b372616 Rafael J. Wysocki 2016-10-30  414  
> > :::::: ad3c36a534bc7b945d7bffdda1c62e13bf93489a PM / Runtime: Don't run callbacks under lock for power.irq_safe set
> > 
> > :::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
> > :::::: CC: Rafael J. Wysocki <rjw@sisk.pl>
> 
> So why is this email not sent to Rafael?

Sorry for confusion, currently the mail recipients are only deduced by
the info of the first bad commit, thus the author of original code could
be missed as the reported issue may not be relavant to them.

> I added his email address.
> 
> Thanks so much!
> -- 
> ~Randy
> 
> 
