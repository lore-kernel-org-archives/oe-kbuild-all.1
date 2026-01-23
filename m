Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BD31985D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769142042; cv=fail; b=F+rEbMOCyeJ3IVEA/d2tajz1M9YZUB9jRxkvpakWbBx8Njt4TFxMAFvkmrt1GPmpBvBIEld0VFLTtBOhBCwnlqrL2dqq6yzTyAIA0icAPcHZeg4XwlCiSTnrBhppuYPlbv96dUBK86pzCHSNmoxT9QfvHsF9GVdGbs3kp/TRoeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769142042; c=relaxed/simple;
	bh=vrfFmAkok5h8h4ZG59UphjI92PdiBM2CV74yvrHJmYs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rlwfD6g/zGRxTEmEOV8RcebVe29F88FfuorwM4xeE83WndB2S+zg7B0NCUpemyldyQCUgMCksCZdB7Zi8FANJ5uRJBiJd9LcWLIZmb/t4qccOG+YfDdqlp0G73IIZhklcvJ8oyW++bw7hfzerdyK7M+TgP91I14CRY47kwSOWPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNmHWdQe; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNmHWdQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769142024; x=1800678024;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vrfFmAkok5h8h4ZG59UphjI92PdiBM2CV74yvrHJmYs=;
  b=QNmHWdQe8wqrTvDd6dzBRvyxfeFAWQWbaX9ZVnXjKWna5FTEqyRqWw9S
   XsuuSrh5/E/e99hKgrOLGaS5+R9mi/3GwtsqlZ+HDx+aB6fF5idya51MK
   DFkiMdFNvEBFwNxfaL4DQaOYblOgfmBz89/jmg1SSM84YuRqO6DGOc0Mt
   lEgevqrGN6R+9QaqK++p3irK//NOc+WniqYZsNCrjRMAj1zpPjyBRyTyc
   U0B+xzLVh2b4ogfVdTc+w2jXEvLKy18StIiwp9Dbu0sAxvwUWPtCPFgtX
   TNvi0OuODPa7eDmqZuQDGpBB2xdkNm6ph4c9/TVCOgoyOy67sgsXbpwQd
   A==;
X-CSE-ConnectionGUID: OSAil6HXTy+5aaetBg7WQw==
X-CSE-MsgGUID: n4CG4QHaTN6BQGawx3aZRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81114087"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81114087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 20:20:17 -0800
X-CSE-ConnectionGUID: ZXE0gvygQfSDD4+8Na0XIA==
X-CSE-MsgGUID: ec3HSI0cQHW0yvHG6mlBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="229887883"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 20:20:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 20:20:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 20:20:16 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 20:20:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRRuQ/EWlldMHoa98W52p6+XRXTkLj2JLra/ykerJ3FOZbopX7+I2C69IsW9oPqV957xE4wYuOLuGRi7tRnBMTWU+Pe2f4f88V6zZchBSO/Ala9wNaaJFIpaH+SeQ/5x+uIvkZFZZvi+sDQ9IZ2PsTV6AY9d8pECS/VtvLl+Qfs0YJesnnMBSFd7c/x5TyWKWTi9Q1g73zVILI9KIkCItKO+NAtATr+6WlA9LbGtLv1UWIhY0/FplgjJ4DKYAwBLxI7nurlQFOgFU0rvNDSZxUmbtPnQAvaZtjG5wNqTeJNhGurs+3NcI0W1G3SyunSQDBiANowwecZAdi1p5krTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oajmQb7xaVn3Q9EtmddOGMZtMTusFuIHkkc2iXP5ZyU=;
 b=odtqfjAN9RZdEqpvZgPiE2QORD8jjCw/4HCxjPrL4ReV/LXssAw3Sd9zqIrIKpE7bryCmPVrLj0YW4WMLVHhZZxWlvoLfcdpNI85aZF+d1SAwUJJndS8LWP2aYXhid1d80xORttVg3snYjgUg8pwZGoT9QBLWTyaBdYoiDtJIxczl6vBuq3SOpIBGV3FsC08PMBJLfMAutBN5Mi2rLLL5xuA65sqY7wCZmil+rEERXNnDAPk/XijCbVUE4+EZ9RWw9NELihWJsfTDMYT7E2/7E9HbbSz2CU5JvfK09Gu1ddV1o+wjUMfQXLEvk+IjsvEiP/BmJx5tPCydmQIoK2+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 04:20:14 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 04:20:13 +0000
Date: Fri, 23 Jan 2026 12:19:59 +0800
From: Philip Li <philip.li@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, <oe-kbuild-all@lists.linux.dev>, "David
 Hildenbrand" <david@kernel.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 420/429] fs/romfs/mmap-nommu.c:66:42: sparse:
 sparse: dereference of noderef expression
Message-ID: <aXL27/BZ/xIwNfT3@rli9-mobl>
References: <202601221505.RxftadLx-lkp@intel.com>
 <20260122132335.5f3160dd20dfdb68c57ede35@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260122132335.5f3160dd20dfdb68c57ede35@linux-foundation.org>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea4d8fd-6299-4a09-e15a-08de5a36b467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lDRcybmn0kK2mEdsiKxmO/dY+ePRCAm574D98ycjkXJIE7SoobRlXIQIjvPC?=
 =?us-ascii?Q?qVQ2enbc9nDv19bLKP+jXyGjqvg211wzo/BYc3AXz/HmHvzURoFjylpzRn+P?=
 =?us-ascii?Q?YOiKhl+UAM2i9qUq9ByQP3wdQmTlYUsxv8S6DwGTzYygiC5gRAS7Co9cYZ4+?=
 =?us-ascii?Q?jVG9BQ+F3VxIDVTKRWtQDPX5hvWjHM16MlFKob6IArRYUCOyHsxK4kTGnlzt?=
 =?us-ascii?Q?vlbZ3EBIV6llm5Ojbjb/v06P6A2Uf+ppU1/c2/c1E8UQky2VJ8DHEroYfANb?=
 =?us-ascii?Q?C162Ac3tA7SmAO3sjYHdHZYlxVnh3Lm85PEAITAqiy2IPcgVJRnW6SxkSBoC?=
 =?us-ascii?Q?9i/B05wgMXW41dyiUda1NB+P5ysAmG3rI1TVM8z4aPl2Ulur44DJQ/U+pg0E?=
 =?us-ascii?Q?uan9V/wnK/eTpdatL6Wr99BI8559MvraDRIBra2t56dMpN9pcBMlUK3aH+YQ?=
 =?us-ascii?Q?hh/V4kkIg+N5rgViTeU+qnLs/RkX1tpdcWIMOT3vIeXyUbYnvps0HDk0/hvS?=
 =?us-ascii?Q?hJpDAPSBdBlvd4fEAbwnOZ5Z9jQwEx7HKaEZOWGd1saroLHBRZDrbE7BVOyB?=
 =?us-ascii?Q?tEgISs5ZScWZAl5hQet3WyEJeiVd2d5SQmQ04nZn+2njC9Edw8S6cL4HrAAN?=
 =?us-ascii?Q?pfTMquYLOb2vWN2G+c03Pra7ypWxildXCl1JqwoAQDQGAyTDKhXn4i8BE/+T?=
 =?us-ascii?Q?HikEdcR82R/ripm7SH6a3SB00oEdXzTkfX6BnhkfnubYCF9o5fWnazPHseND?=
 =?us-ascii?Q?14NNoi1olcOypAWNPPHIqw1M1EHYOxg2v73AzjbQFysalp2e5Yq3y/VUMEtK?=
 =?us-ascii?Q?u/P5+9DCBfZSiuOv7SqybJSXKqwnfshWVDH2F0c0pmHwq/1v84oOp4bMX7Op?=
 =?us-ascii?Q?83Qot5N/lRatNoBEYdPfvutEx/Kvy2BgBk/XiNmF3UlebpTWT7EOFT0sVs+K?=
 =?us-ascii?Q?ce8FNCkbPgLp50HcG5f7Ar5LSbM91JWRk1FsjPYwsyNzMiZMBb8MOTjGW9a9?=
 =?us-ascii?Q?vXLUavchHPwMf/pO1MafLPVEMzhFT47FOgXKaRDmNP76NtuZf3IjZhNVMQWg?=
 =?us-ascii?Q?1OFPkpqHKML1ldvtbK5vLj5tOG+6+D7w9rTTImhyme3x1VOwQlmFjQKBuASx?=
 =?us-ascii?Q?cAVytlyiUj1w19HaZKUgThzOKQI2EDFbrj+gTHzxyletCKkQuy81LDjGQxdK?=
 =?us-ascii?Q?PqkAJouetVnuxsrAkinkqz2UgY9Kp6EmmVXmAQKJWM9UyvmrYUkJaoWEMtHe?=
 =?us-ascii?Q?U42Q+IfudM8zAz60hQ5XqxLHqp/GNQH6WRkgIk3cLhath80VnAX/FjKHUx/B?=
 =?us-ascii?Q?+uY0UQswQymBvQA/fAbvC41IwOlKnciKy83Nx0M3y/1JVtlpgbw/bagb9b5W?=
 =?us-ascii?Q?JmjydQJ2qAuyLpOKf2ua1dOcyqkuNzXrTE1G8Ujt0OtiHUtNFtYmNWfrB4bD?=
 =?us-ascii?Q?MdDCnsQDRUn4jELrGHaBko2toduJ6L0Ow1IrvZrEI8qJIiuT5zsaJw8nSdH0?=
 =?us-ascii?Q?DP7VfCsSeB86M5PqcPFY/+1bU/lbvzcr3yOYPyTEQw7Nu0DWF73UJFDCjmNO?=
 =?us-ascii?Q?9FtJldw0YIikcI7O5u/IZtDAKvE3sTutwdxy1eM3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w1M0e6vrvcL/jZFRiWQflx8ebgqjP6qwcMmwv45nz4lmN8oqUlSOQiC1HR4D?=
 =?us-ascii?Q?P9hLsRBgA6LFHAZ9NBqaDs8Qw/labRzgQKy+JADxOv6ZqehHWWYHCIF//jP5?=
 =?us-ascii?Q?qES47/qzF/+kBNKgYa9NaTXdcsRNp0POzJiAoOcgx60xUrtfyF9n3lfqBuS6?=
 =?us-ascii?Q?dKuZSbLt7Rs2+qGd0gtBLCxvmolG2/RzA8ORhFTViVbxvzhCn5pqtxNe0xUp?=
 =?us-ascii?Q?wbnaqCnKr7tTX9632GP81kwaNFkqATxsf/hyhUMjRMLhuZDlw7qDEoy2KwPq?=
 =?us-ascii?Q?uXqxI1h8lcisi3C8kslWS0Ada7hkIh1cSYU3MovhaGGBmNeQpU+qT98TJc91?=
 =?us-ascii?Q?30lLKDwKqMvRMUPFgHCiHT3vblv1CxmMc4cmygWMahgW3LRBJEniSEDMg8Y+?=
 =?us-ascii?Q?xSEPNj+mQ4m3mi3lgeWICaYBUgVnRSg0FYsq1jkBjegK+Kahi+KLWwHp1IT9?=
 =?us-ascii?Q?QLTNBtKMcFf3EzWrMLIQM6YWmi35ZhSwBVg885JbAFW7g289G9IMs06w28Tj?=
 =?us-ascii?Q?u76JAxG3lohoP/NZfVqtgNSGp7S5AV4k76FjZfmdzeiOR/+TpBd4ZdNMeuDi?=
 =?us-ascii?Q?uESIgIxkaUs88qBF0rJGoPdXx7AwdG71gGld6EAxv9pQ06xXnPfb0OksArbV?=
 =?us-ascii?Q?ps8I/ckQDQWjc8SrLlRJE76TFZyZSKBj9v3bABhm0hsPRNAqzOkoDaIEagCT?=
 =?us-ascii?Q?lIKud5TAPW4E94hiphxwdAypQwnIKYQpAHJfZjQUwiBIf0cOis3QS8mM5mmd?=
 =?us-ascii?Q?/q0ddewW6TEYd4ikCZz8nZ/NiQx6pqKXc2osvp4bKlUfL0iatFXK7NcxPaux?=
 =?us-ascii?Q?8IMapDQjohnX2tv97MN9xK0ULgI/PqNJoOIGSEUv6fTrQf3qIlLiMH6FRkZB?=
 =?us-ascii?Q?I8ZKkKnE4rsAEEkmzc3mgq8Ax5GtvaU5t0bLR06g/MkSQZw6P/92HWt6ki8Y?=
 =?us-ascii?Q?jcuNoBg/hUengmMEYpyNbekq2gYrr9JqJDgEditw+vokbL7mFjrbXoV2/2Ok?=
 =?us-ascii?Q?QThmrpmYfKBfgKtNWNCq4HwHyywjoVC0QtBUdTXnA/ZEGHTB+qBu/5+L6bnI?=
 =?us-ascii?Q?1haIu8h9cAI4hHveOMCq6Ja3j2hc3+/4YQpMGi3YE/UotGXaDFQsuNpUQi43?=
 =?us-ascii?Q?6a/fQ375JfBIEsbWthElTvnQ8tQj2fZRUuJHyicbhBJEdxxD2LXdOH+otPd+?=
 =?us-ascii?Q?titxzbREPkIiDBJyrAQL3VyAzZg6KgLu2IsoV6qwSc11ReAjnueoVJIo/yUa?=
 =?us-ascii?Q?CLceIA5dzPdLBJ7HqV02UNegm7FvwpZy4hg5aUF+qv4bGHZ5BuSrSbq9sRWA?=
 =?us-ascii?Q?cE8C0aFxh7Q83CnkjahVVlfUlgsU3GfuGtoXrb+iBaHUPBBA7Sj9LZe1Xi0v?=
 =?us-ascii?Q?/1WT4sJLu/Sd33nmICv7DjTpq0VFaIRQDhekIMV8D2jkWOfC3PDCchR27XqK?=
 =?us-ascii?Q?ygRvAlPZSPxWqvoBLfCt1gk27unI4ThS2i+wScW1pH4B9ulhXJ1iLn64ha/S?=
 =?us-ascii?Q?YUiWoaqdCy1v9oZX0MjDtwLZXnrIGSgW72KnpylB3LLFJrrGMrxXYqZDJUBM?=
 =?us-ascii?Q?rjYxGUqvvbcX3W3TczMp0RpeR1QZVOMr5B3zgCoIriYqs5OpUP2CHsM9Wt3V?=
 =?us-ascii?Q?nQS693pmpI/+DY4ZNV+IOl1ily7Fi7sFvrwJ+jrhIkgFjRE7z4mSbAT78KeG?=
 =?us-ascii?Q?pOUCbd+EtOyQwlTa5Gw9CzDIQHloQ9uN5NCVOPpVz4fGO8Shn7pgVr0ffpzk?=
 =?us-ascii?Q?9hZHlZyfxg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea4d8fd-6299-4a09-e15a-08de5a36b467
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:20:13.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4gnzOwoOu+h/NMeu225jCd/ApMgRo+7h12CI6R7JWvQNnk7gwUNtolYXI9g1Z8cLWCPDkYsL4uKRTDzgDr7Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
X-OriginatorOrg: intel.com

On Thu, Jan 22, 2026 at 01:23:35PM -0800, Andrew Morton wrote:
> On Thu, 22 Jan 2026 16:04:37 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Lorenzo,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   dc4fe40a11269aead253fa0beb098b00417b8694
> > commit: 57a654376d4bb67119d436edc8c3c4c0ecb3c369 [420/429] mm: update all remaining mmap_prepare users to use vma_flags_t
> > config: sh-randconfig-r122-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/config)
> 
> Has CONFIG_NOMMU=y
> 
> > compiler: sh4-linux-gcc (GCC) 13.4.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221505.RxftadLx-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> > >> fs/romfs/mmap-nommu.c:66:42: sparse: sparse: dereference of noderef expression
> 
> fs/romfs/Makefile has
> 
> ifneq ($(CONFIG_MMU),y)
> romfs-$(CONFIG_ROMFS_ON_MTD) += mmap-nommu.o
> endif
> 
> so why is mmap-nommu.o being compiled in this testing??

Hi Andrew, the related configs are set as below, and this is guarded
with CONFIG_MMU, thus the build is triggered for mmap-nommu.o.

# CONFIG_MMU is not set
CONFIG_NOMMU=y

> 
