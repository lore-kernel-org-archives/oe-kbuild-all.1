Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B4BA33
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664401; cv=fail; b=VoCbGeBndOsQKTOQZadsMdaizfrjTB/YjZsx4aU6WtDDoKq+6JliiWbS30uGlAGr15oLzzGCBC9lnFpdg+O6pgIFjMEtHmXyabjbzqUbOGwamBDjA4ttU6q61oyJufT95nRJ9PhOVUnqrHt22RZmxxeV42wfQyBBktVQkOkOQB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664401; c=relaxed/simple;
	bh=VeM6BsUR3w3VDVOuDyrW3cfC5y1IIxGC9J48HSDX+z0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eqwAJ0bI0CdEuIo76LukFL66wvyO0HoAIZUAgWWvG4Ct7OpQL5DjPAAEpe71E4brn0jge19Nev/jqKQTBpnBwZCBekLpGg690t9Qm1fV51lv8AmTTnyai9XbkqT0NGyYWBIy6geNs33D1sYJEOLtGwWNEuL+lQqlwkWFvTiTv5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXx8waVv; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXx8waVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720664400; x=1752200400;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VeM6BsUR3w3VDVOuDyrW3cfC5y1IIxGC9J48HSDX+z0=;
  b=mXx8waVv0/PeWdbf4eWG4noMaaQ9rRHxHZMo4Ep/99doxJVHehvx0ebe
   LB7JZFTOFI5Bg3oXtRfDdldCFDMEjrNVenzdu86zHs6blZK0B2Oy/6jtn
   TLl+XtJgsYKKlj5zulYuDaurVGRR9CtNuoRjZNTM4IJ62gBfSDIg61/aW
   x+RptWqTEnHRHrqTValUYMRciXO9NOSnQS7rxz18UePtesiIcI8OOajRM
   socBb3mYPp/277pakUpPmO1cd7sKUhCj6nTHMFFLGoDqfiAd8IGo3n3C7
   Zvt4MjNDKCXStF7aW+OwaG/PFt3ESBkOqmqhRwfh81QW79oPRwRg+7ZcM
   g==;
X-CSE-ConnectionGUID: s7uYS/ubSbGtXsPN0QPjhA==
X-CSE-MsgGUID: llHvu+8iTwKoBQgro/a3lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40539889"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="40539889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:19:53 -0700
X-CSE-ConnectionGUID: ctcXag4lSEGz/rO/rwbV4A==
X-CSE-MsgGUID: 6TVwyXUWSVirDP2bHRcdqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="79546487"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 19:19:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:19:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:19:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 19:19:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 19:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaNS6gfJ4KM2WbxLScc8oGkAA8xtKBkHJpANLRnI2bnB5IqH3U4PK5/JVAknYuqLcXwSuq/7PVpHkNnRrTgHOe4UBLzrRRSIWU43ZTlScoP2sSu/fUW8bufu5ptag2f6fnoZVrAYHRARnDNd/tn5CvbRVl7NbSDA/trCrqxSE5cwBXThHNc2K+hQEuJjBdiX9bnmB/WbSof50K0cBHoHn/OdV6Pkcuf074OTZhyvp1EaDoTwKrY8DN8RmESAuZlBjn/xqcFEZ32hQ1/AfeuaFeDLpMoJz0xrcsGNhH3Xf4C03NnqxnFMR5+ztRrmY5sxIUyKhU5PsWBY/PQbwBwwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1ZsImGSN37mczgvHLCjWya6rPj5gHbxdX0P/0fgI1I=;
 b=PGh7Qk8GIOjslD8TJQcMv7ukPZSP2yvr76Eodv+arNDruSeWXfkbZ/UWSogC0CaT60nvQV92Cdunec7SvOjdy+MIdII3paN/7v/Yek8/zhBgUKzXiMn43/wuK034qN4pS6DttBfs5wWOQvom41QxzbgTq2MvEg24Uf3gRsLDZKVT2oIQuzZWS2fOW+xzkHUuDoNn594HQMQw597u/mu674VfjTtGfqzescJNsiYg0TSht3krDTPLhWg2Qwx4UgytVh5NsLtvvV+FzKLhElyv3QaM1hNlYceZHZCm7LzgPgOL8FmID8KNRepR6jCEILQsxqnEw4VqFCxX6KvEAKssjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 02:19:46 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:19:46 +0000
Date: Thu, 11 Jul 2024 10:19:37 +0800
From: Philip Li <philip.li@intel.com>
To: SeongJae Park <sj@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7424/10451] WARNING: modpost: vmlinux:
 section mismatch in reference: svc_xprt_enqueue.part.0+0x38 (section: .text)
 -> .LBE1049 (section: .init.text)
Message-ID: <Zo9BOUhs5/VeejFZ@rli9-mobl>
References: <202407091146.N8o5lBgN-lkp@intel.com>
 <20240711001043.100459-1-sj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711001043.100459-1-sj@kernel.org>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 12464c74-98eb-4d0d-d934-08dca14fef00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z/LDqLqVmxT29+eErlqtulK56J+JWV2cu6XawF/rc/BtTFP4mPcwElrMhPRP?=
 =?us-ascii?Q?UsjkCEBTXgoQzDg4EHW+K8xTG++Lcm8XNgWgO2hMuihy5i+mIw1mV/tV1fC2?=
 =?us-ascii?Q?q6cmRufUXO9PVmEBW9Fl4wZWBScQ3lKYHn8o6k5AHSQtBqmUNE2rca9ZtRjh?=
 =?us-ascii?Q?AQkkEqEcAF6mafIrNdKlZO+GKJkJhVsoADAUhKG7WD7Jped2VWWl9mOHq4oN?=
 =?us-ascii?Q?k9GQerMTE7jHXDmJXE2Vc/DMx2M9G/Trq/KrqJGgGyp+JPMmdBTfSKTQ2b4b?=
 =?us-ascii?Q?i3Yy5sp004rKJxK7OD110V8xpvXZAD4E5quGLAwd6R6oze+FZCK4PVvMfbtA?=
 =?us-ascii?Q?4YWYh0vmtjnub68fhFHy+boK2G6O5+IzDduwbP2SCExNUnmJm/6sEMIaN8Nn?=
 =?us-ascii?Q?kXvjmDfqzCR5H9I4sBPir/SZiXfJKuf06FJKvIdW4Rk+EAeFKobhhmzfblOO?=
 =?us-ascii?Q?ye1AqXaNNGVEactPUzt6Yb6qO3EbMJq3mY6lfI2PNAVd2Ve4W4lnWWp90Y/l?=
 =?us-ascii?Q?ATB3lUvk/mllec6uiBdAczazBCrFqWyOTeXLnDh90qaAv/9nKv0QuWJpqPCR?=
 =?us-ascii?Q?bls5G80QeZ/t1yzQfzMdKdOaYZQhz+A6ou9UdBV/3I4zvfCye9ebWnwZ9sBE?=
 =?us-ascii?Q?nrvEuqkqUc5FnvYTXN5+dnYRJ5HMIBhlRSEFJaFNzolpK7rI4gm98RRqtVlw?=
 =?us-ascii?Q?du5E0dXtchL9igLUYrBdPLHEONs30HBqJE7D0dba53t7gOlGzun5FU/usGzo?=
 =?us-ascii?Q?UQC7Tg0c40po407IArdKW6+Ln522cGe/Fa37Y7rnxYPrkU72eYnFJBJ6CY1r?=
 =?us-ascii?Q?bSXmWSZAfvWL+14YAiDIgwlPKAOAUWJu6zYO9xemCnxrkWm6xCTEzOcifegR?=
 =?us-ascii?Q?IlNxbGsvQhxSOi0dcwvaMd4xCEmUZquDrac1Ak7qpaXB07NCLHb9RTYEX97G?=
 =?us-ascii?Q?jK8PeikowMnusAW6hx44NRBnZ8S0omL/jQzcIOctIErQvYz0LNtVu79/B2DO?=
 =?us-ascii?Q?6V+ok+eDzLH72MPPRm9o5KYnd14MFn75/R2uUvJe/wbWm1ddHvp+mhnhH0Lu?=
 =?us-ascii?Q?HU7c4Ps1Qw1G5ctpC2thjqKMEYGQrIIcmxhVx9cciQK63J1pyOsFny7akVfe?=
 =?us-ascii?Q?0BYCo4MnIrSv+O32/BZN6aGlpL4GJA15Ii8kwUTpHvhnkvhglA5KU7Shuexm?=
 =?us-ascii?Q?WYAGVjTdO22TlyJX+uELkn/gjYh+MKYcX1na45aluXle2QQnzOTC5FmWerDJ?=
 =?us-ascii?Q?BRkZzs9bADEIne2x05FAeDQQ5/m9CzZdX6aqnTB9ZqBQ6UiHMVR7rzCR9LQ/?=
 =?us-ascii?Q?3SRkBloZopA8ukmOIYfWxzKt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3cCpKJJioHRSZzy5KkOf+a4RQHbspEJjukOkSL65oq/w1ipI4tE2aFPtKQrc?=
 =?us-ascii?Q?c7O/VUgZSIExKV9biqy9gnKlzizcmmg12NGBONc3XdFYESNOcwJ0951mlqEc?=
 =?us-ascii?Q?2zyw0r1rjQFDxShZ6Gosr7oklkYyxAhJQx8aRrkBifZn2+JDDRBEXXi3MTNm?=
 =?us-ascii?Q?48jF412g2BEub3x4JUdfMxiTY3ZTgl4CeoSGUsPEIRYTxGLwagA7Q6b3mjxX?=
 =?us-ascii?Q?RdR5mUKQuw1RW+qUvSnaxU3mJ8+jFmpQ3NhrDSNTcidDY9DLlRKeBExSl832?=
 =?us-ascii?Q?VHtnVUF7LZfSux6ljH5yWXN/oWNu0X1/ilp2ClFRbEiY21FIDDp6WM6LJRJ6?=
 =?us-ascii?Q?9B7J9Xcl5755OR8nvukzHai3QnVCk3Xzpow3NZD0H5oItLrlAIN/RbDvWw9E?=
 =?us-ascii?Q?LZEzTOCCm9NVHJMeJSQMZmKloSQ/qoflHeWoi5SOpsVtYs90giR7EneQreG2?=
 =?us-ascii?Q?QsCeuCm4i0rpsXc06Nb09jQG5wp6B8IeH+2y5BWLNtvD4OgZRLJ4TvaELpGJ?=
 =?us-ascii?Q?b5oMtNjJdwh3lkfih+1sabDnOoV6RgoUshNUyXnbvQTl7ukhTIwjen8UyW1o?=
 =?us-ascii?Q?yBf7MikC2AWpMEVnCP4toPSnoPfm0d+3saFVbyi1ceov9qFZwOYhA+ejZk5p?=
 =?us-ascii?Q?c/nrq2tN0MfiQNYPlCs/Ar25+8mAeR5P6w1P9JsZ/335WPAATULzs6AxCkUq?=
 =?us-ascii?Q?bQ6kWXvp07hv9BMcW61asP8lQZufA2ZiOCQ+7/tnrnv+3c9TxwfnL0J+N1/Y?=
 =?us-ascii?Q?QzJip1Wz8GTDwLqr9p2bMxbAg6xbEkgzLM+knqDhqP/8/TeAzGdGl4yJMaHp?=
 =?us-ascii?Q?pyyKRsiQYH87jZqVuNsIMwX+Tw2YBGxvXe0B28SWZsTmg2KYlN0v9oU+ztYX?=
 =?us-ascii?Q?iViVGDCi8uW65pD8yhYqqCEQIJyIHbyy/rkCww2l9GhsVSgCuc9DOQ5QywCq?=
 =?us-ascii?Q?f600/wA9K5w3plSSkllwWL6mce7IR8ISB0pFYmEATA8dFtd+WSiv/W5Z92bx?=
 =?us-ascii?Q?STge8JO60kfN6aw5dONIEOHinEYWcQ5ljSCc31LNMgSxz1Lbebw8g8TJwHoQ?=
 =?us-ascii?Q?COWPIa2yepZ1j2IiTjtRhKwOQL7xhjts2q9ThASL44Hgv4BPA3fPVru6Uzrs?=
 =?us-ascii?Q?xFtegv0y/d+uruC6VqJtgGrBFu+VPUlv40gFKRoDW5tpmwee3+cjYfnm/Acc?=
 =?us-ascii?Q?l+LwAkC01wBu36LseOforJV7Wt65PzDCLtSe09Mdc0cLQ7+sj1LWLmHCq3Sz?=
 =?us-ascii?Q?E9/XPK5eHhmGS6ppajbU7r3tkTLMx4StFCwSrHtP95/oo6qAAXRWrwADzDRe?=
 =?us-ascii?Q?WUYT1F0kY0qMeHECuwbk2lEUqSfQgLl052lBTzePdK219C/c0LIpoMMAQvPE?=
 =?us-ascii?Q?DgxmzUvhgWA1FIDm49AP3IvBgN1lJgkHAZZIONbZY1WbrHqS6xjp8+A2pK84?=
 =?us-ascii?Q?MbLCXe/fhkAG7hGBofO/2VPu1rTumoFStC6YWCiiSdE1pc6f39jW9+zlQ0xW?=
 =?us-ascii?Q?z8nIiI3nvu1mAN9Zf+Kvx9dO5JW9GBv6b0qLjPjERk4RQG79Qo/wSunQWtj3?=
 =?us-ascii?Q?Ai+/EFjBAeIW2RWq2BqrumksIri3s5zF8QgyoAlf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12464c74-98eb-4d0d-d934-08dca14fef00
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:19:46.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7eNMo+qxwc9cn+x52lAOH5xN6MDwczzgDb2brtsUAlmRJaty4oUenvGghtfSlx4HFpSm/BoFz6vbIOxvKV98Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com

On Wed, Jul 10, 2024 at 05:10:43PM -0700, SeongJae Park wrote:
> Hello,
> 
> On Tue, 9 Jul 2024 11:57:48 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0b58e108042b0ed28a71cd7edf5175999955b233
> > commit: e64a020fe3a8bb9287b46568b4baf71105c5b47e [7424/10451] mm/damon/core: implement DAMOS quota goals online commit function
> > config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407091146.N8o5lBgN-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091146.N8o5lBgN-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407091146.N8o5lBgN-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_enqueue.part.0+0x38 (section: .text) -> .LBE1049 (section: .init.text)
> 
> Thank you for this report.
> 
> But because the commit only adds some code to mm/damon/core.c without changing
> any behavior while the warning is related with net/sunrpc/svc_xprt.c, I don't
> think the commit is somewhat to be changed for the warning.  I also confirmed
> the warning is not reproducible with the commit on mm-unstable.
> 
> Please let me know if I'm missing something.

Sorry for the false positive, this is a wrong report which seems to only occur on
riscv arch. The bot will be fixed to avoid sending this kind of issues.

Sorry for the trouble.

> 
> 
> Thanks,
> SJ
> 
> [...]
> 
