Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DC2045A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 03:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739415918; cv=fail; b=bn1i4X3GjX3zkWWFwa5sXQwkbtYket9GY9bX9yozC5iCb07WiaL5MQzHGkAw2w/gk1h7SGBSr1HgN3r8xJ9FryToTofgzXNm8/faTUKaCDI4N4nm1dT3pAmzUnWaEXAjBZ/d47s5PfIu6i/MfgQQQNygGRxxQsDcIXUf5xeDHlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739415918; c=relaxed/simple;
	bh=L6x2ukH/q90ELa7wAxfOrVtcrcMKMek/53dehahhiYk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EB3miY5QcWe37BThY6WGNx9ArOmT3pGX0v78gk4D9A2qfq4hdO2aAwayoOwg/iQITyH1hVpQMQvLwsBhoz4aHwzTjI+tF4BezAq01I/3kohRb7qsuipr2qEeLwMJct5yXyoicNbcdKh3tYRuHBXMmErz+iOgWvpIn1yncQvH3kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8D0/EtR; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8D0/EtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739415916; x=1770951916;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=L6x2ukH/q90ELa7wAxfOrVtcrcMKMek/53dehahhiYk=;
  b=U8D0/EtRirx2yMvWAk/8PA7la8ukFbrBM+WIHtpVdoMbOAkyQSwDeLsw
   NV40gdsVNsKnBaUVgyf5SgiGzGKMRX3nhzmNU80gy542XfgADzSLkjowY
   lgONyfxr3ASrjZT+Deg+sCZIh9TQiatpQB2J8r/w1MdCSw8GBFHfIL9c+
   xiYKzbI+tf2l5MVo/x18td3KcL3QnvjH3wnhWJEMKq9tZ44Suaz6ejkuH
   TZqy9lN4yHDqWnojyZ85/bCS13mLomhopuLdb6E1XNh/uvXJXQ+B7G9qS
   tpaqffia/iiIAwfo+ypZqmjmzoDLz7c8hrKWQ3u8HZxTuLUEkvvK3BriQ
   g==;
X-CSE-ConnectionGUID: BR2w6dY3QdOMY6d6j8IkOw==
X-CSE-MsgGUID: vHoL8t2PQ3Cx/7DGX3IlHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27696001"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="27696001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:05:16 -0800
X-CSE-ConnectionGUID: wBrbGDQrTZuLPzLL4UA/NQ==
X-CSE-MsgGUID: CIlZdOeDQ/WTmfJfjM4c3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143957471"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2025 19:05:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 19:05:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 19:05:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 19:05:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsXh0wOjolU25Y+rx416BwVqbwirAV3DBqt0sZpZcy/etf2+9NB7uxyWpYEA/1VAMp7pgHxVmIascelyoCTNZ8UEF+3ESAr/5Hiqh3j3k4zcfIR3oR1X0W9EVdLxVJb0/nK3GNRTkMVZbS9owHMw5aBIRZa2Ev5S60vfzfDJu6vzdQw2TK4p2Y/IfdZ5ta19DitJvWIx8AZB5U7ckgMmLX+HieBrh0XQzCsX7u1m9LqUAHQTIPR0lvQHCku45FHr/xYvutXNTOEIOeseGAXvs8t2ktNpVdWiq3xVp7nrBKV2POqLL34BPyLI9RZRhbUwC4zllD43XBoAILGgLvxv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn+0YnNgimC+H7tM9ycxJeaZFeZmgKEzQHZu+KF8pFg=;
 b=Klgxr+ycIhx/qrdohvmkVN9BJHcKjOJSBAedzQRD7gL0uplLcl+/XNdykNSWMog1ZqOr8I503e5VgxerxovVDO9k41hu0ufnq29C962pxppqv7RLJiaQcRtiuOIhGtPc2zAEs7Ceg+DDl/SeIzHkXfJEFL19zdTjFFmCMgA3l/TTUy0SzdnNmlHRaoizYlps+Pf74USfMyyBmOctXDiNWLmwCAy9+m0Z2bktspfy/tJkTQ27TGo+wTfLiEtDgDSu0zUCHGVXtuj983p7t+3QTYF0cIZWvEaAKVsO86XcEsW8o3+efCpR7mfO2ktm/9E+3JIIshyYruHPb1jPhQ5rEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 03:05:12 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 03:05:12 +0000
Date: Thu, 13 Feb 2025 11:05:04 +0800
From: Philip Li <philip.li@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <Z61hYOLmsekGHJfk@rli9-mobl>
References: <202502120851.VulVvSyg-lkp@intel.com>
 <20250211195421.69854975@gandalf.local.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250211195421.69854975@gandalf.local.home>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f767167-2df7-400c-66d8-08dd4bdb3b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0AVSvQlVOadEg3YAp5ftHBU69eMUXKb+FWtndAiufha4yzsv/z5uZDwA+I5N?=
 =?us-ascii?Q?2rQzlpj76TijBC2ipbKd0cL5+HoGt+qDk/OnDiHuqMhmOPFKU2P3FS3f3y5W?=
 =?us-ascii?Q?JSMOfDM6M2m3K/z+kVGGrF2WZRtTVCGXfLT8nzuEmFnrKkfOjVBJLRDqpjwz?=
 =?us-ascii?Q?ijxFLDKwDS/Uol4rIqSsp42BBtOOIla3I+GMWu3VsMfL4fIh2F3icuxkMP5Y?=
 =?us-ascii?Q?boTYfHQIU3MCaP5whGjavFyfCcVNcFcvGnk9Alk1vxIIcgszbPHKaP30skDO?=
 =?us-ascii?Q?9WgZEE+R16tUvc/GUwigh6oC4inwFHhxS7BLwuMXWweXfViiaSUj0btyGKyc?=
 =?us-ascii?Q?S0YH4AyKR3As2KvLNQUOIvmXCC/zk7gWqrCU2ejCdVrFTLybarhkZM8UI15J?=
 =?us-ascii?Q?TkdbKK2SlLEm33C2wIXPsl/OsRZIHHttGt/fnb9JsGP7Y33IjHF//rI/sKsp?=
 =?us-ascii?Q?BcPTtYBj6G7MktgCKH10Qyt/Bo797arpdgDOUUW/5duHXtifAqhQ5ksOC0ba?=
 =?us-ascii?Q?U1nmqBTf2Hre96zLwp75SeTaIQHnYQsI4diAAzGPaafcjVZDh9FuDmkompRo?=
 =?us-ascii?Q?9dRcIZy1DuytOZVH1cg4NdU4z0tTVO3vT/tmeOwJbpoM4lm5VZBtWiVA69st?=
 =?us-ascii?Q?YLYpEtGbE5DcmVJPLYY9phfIs7pZTMmU2w3RXyeQE1Y0Ku4k30OsIrGmcMtY?=
 =?us-ascii?Q?/1vV1fEVGFTCwbCc4jshqSN4atiKecvoei/ux+mQ3ZJFcj5ZB4uLz9LRJlT+?=
 =?us-ascii?Q?AZFc8vIsHCbIJvzpH0xCnkDotPaRuIcrYq3aVNy3GtCRktH7Zb5BnsxD0bC3?=
 =?us-ascii?Q?/FMvOfX7Xxn0YqFUHsbtO3UIKvFuSlufDBwalT+fSj45XtYULc98/BrpsQhT?=
 =?us-ascii?Q?uVW4lTP5pvnQyIvJ1qBJRHtx+dm5n3+eFURWYZtZSWe5wIM0g4dIdrbD+smX?=
 =?us-ascii?Q?OlL1yZzCJQ5iUgKJldS+OoV7ufH3QLVz5uDhMShmsRKTSG65lwgAhAcIlUyG?=
 =?us-ascii?Q?znZK6smEbayeQkSAcGopDhA9Fzaf3Bxr8cbMZWOKWPbf1KVJVkQTbqOGn43y?=
 =?us-ascii?Q?nMHG5tb5q12DkknChjU3XKpohyuinzmWNGHQK/DMO3Jg3P/TJUcYWwGn9GSK?=
 =?us-ascii?Q?4hKZml0qPsz879oItbingGAwkITEdR1Sv19uO/KxLSTvZH1nc1+BB2MU+m2T?=
 =?us-ascii?Q?fQ5golTXwFLCbbn4daREOgvYm1CHnDQI+7Yyk8h9Mf5G9u2AVcxyzkdj+MGz?=
 =?us-ascii?Q?1ZBjNuzVU+maq1kZ/WhIZB5B9GvdaTGMTNaRykYbcInq61/t2W3230up2WwL?=
 =?us-ascii?Q?SHcn4yZInp9KUOplCrdYLr44m/UYAuCNUNLo3B7gIiX3hA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hoCiONFKN1tnS6GPeP3SINjy5+/ZhvJYWPrwb4zmU4Z/82n+TWLlpIY2ppy1?=
 =?us-ascii?Q?cRiGUE3L6Z7HD2gu/6j8Rwt37tdshw+rxKTplYYNlgFT4DtQpL7QpSLiZLzL?=
 =?us-ascii?Q?X+qSRcnjeFzoAnib8zE+tx/pokzRSR+N2Id4WgHcHU/c59z9owx8YOAmS/El?=
 =?us-ascii?Q?lNB5/WSNFd2ywVfZYBc2C+yw6N83nMcX8Z8NWjGYHD1utiKXeQ/xxLOU6enS?=
 =?us-ascii?Q?WwiET5ltMGJwtfMmo64cneSUHEBfefBJdGj3nxAat35a+W7VjZYZa+9xWqyb?=
 =?us-ascii?Q?8GoWXRkGrcjVlKsNNJeSE4aHVdwXYNDj2nHs29vgE2ELLQ5z68rPpi4C8cx9?=
 =?us-ascii?Q?25l2wiE6P8NwVAb8nAYagSj2gizsNwtqL0NaIqLbU0RShOZboq3hLtmw9zzD?=
 =?us-ascii?Q?wL/fn+CugOx/ZnuJ9iDuY2mUIVPcl2r/nsykkBUx/L+Dwh5CQ3LLUJ4lnAbZ?=
 =?us-ascii?Q?RDCCfHfONmPTL7A/bIVB0EiyXs9oEtrDk3V4E/aOpJ9nH5Otk5ydKAXVotro?=
 =?us-ascii?Q?viocNBnhvQrJNLDN9aZLQk5GVLqLC8SGd5YHvLZrxs1fVcK2bDlP1aoybP6Z?=
 =?us-ascii?Q?uXUyZWfLP3ayw+M1rdqmUp9cMU/tJGDFtbijxzFBQdeKo48MoOjoVecL4nJp?=
 =?us-ascii?Q?Sx/ySk0RQlQtUKkfuKxT6CWR9XNbtgcpFhXzsSHaRd+QlKhUs4IZqTjZfm3L?=
 =?us-ascii?Q?DPzzO5UuOxvhMUPRl+aUVe7lsUaKTMWkJJ8QT/b72EaTK6bcYvk2x7LqQHkA?=
 =?us-ascii?Q?ZcA/WIcxdhEwVy+woE1D16EILgbpmLOCi1+4cF2MPTf+x5kELMN4Vn1YFmT4?=
 =?us-ascii?Q?pwiycA49WqvetOvXGf9ZeGbljDKj/u7NIbr55e2Dtp5nkUjveEJY7qorCm/Q?=
 =?us-ascii?Q?FsCXexqLKhHiQVaaqXDDYyLA43Ei77fbxMF0ZxCduW92Tt1jlM/C6VfPFfSP?=
 =?us-ascii?Q?OegxeQqcB5AMVbiKLGLV5Dtr4A8VjH6Cy0MhuvB4F5quJY2N839ED9xh/OWZ?=
 =?us-ascii?Q?QBTckM1LfQSBOi29UNhZfxamebduMWRXm4Pfw8PXo/YHIk3FjriEzpgmHjIG?=
 =?us-ascii?Q?cPavZCX9+Da+8wpty8NHXyPaX0VlapGbB5bEPZXw+olI36ImtMYbq0hqiDML?=
 =?us-ascii?Q?S/OdlYCT3vZLWI28FWZ46FxkFTdpK0v7rtVi4XtTPVZpdMvEvrX3DQhaHPJW?=
 =?us-ascii?Q?CWOiQSZmch5gp8NqXaZJTU/zkI8lsB8pyvelQF/CRNewgFyvyFIjmGNGTFVV?=
 =?us-ascii?Q?fkqMTFCVHSmDoBcJT9a8LXRfsEpWmqpdcIdvWkXgA3L84szuCqSmKnhV3Vih?=
 =?us-ascii?Q?VQIc/+H369/5okrgaU5i2N8SyB4FkNa/LBHve10eViVC28XtZ7NFo6BVyp8x?=
 =?us-ascii?Q?FvobNHOzxhoDxV8nb3DO3D7kX2cwt6pVQlq3B7rm0/m2vx6TlgUjRoJ/IzNx?=
 =?us-ascii?Q?Ip/WSo1Urs9cb1WD0R+FARtOm3Circcx+unC3LKMqqlKiYLJi1N5k9Pdiwac?=
 =?us-ascii?Q?8id65nHQaBJHd0meH2EPcT4LNLM3DwF0nmNyoKhuKHgDmg60NMEvm2A+z6Qu?=
 =?us-ascii?Q?hGyL2EfeMjNIXQPakuFze4YNzG13OxE+csGvuCuv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f767167-2df7-400c-66d8-08dd4bdb3b02
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 03:05:12.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWLI4+Io0Bb0amS6TJu1nDh8Hiw2JqvkI1G0IHPPifgwqIUfT6ENreAhUIq63NIbp++c+7sOohZJ92UcVRZbcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
X-OriginatorOrg: intel.com

On Tue, Feb 11, 2025 at 07:54:21PM -0500, Steven Rostedt wrote:
> 
> Hi,
> 
> I sometimes push WIP changes up to my repo to share with others that have
> known issues in it. This branch being one of them. Is there any keyword
> that I can add to the branch to make the kernel test robot not waste CPU
> cycles on testing it?
> 
> Like: notest-my-wip-branch
> 
> or something?

Thanks Steve, by default, if the branch is named like below, it will be
ignored.

	.*experimental.*
	.*dont-build

If you prefer any customized branch name or pattern, you can also share
with us, e.g. ".*-wip". We can configure the bot per your needs.

Thanks

> 
> Thanks,
> 
> -- Steve
> 
> 
> On Wed, 12 Feb 2025 08:48:01 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git pmem-on-reserve-mem-fail
> > head:   d877ee1b587be39c141df16a6f92efb0e90b30fd
> > commit: 04e1e84239466de5fe5310ddc8899b8b404a5ccc [2/10] ring-buffer: Add buffer meta data for persistent ring buffer
> > config: i386-buildonly-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120851.VulVvSyg-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120851.VulVvSyg-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502120851.VulVvSyg-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    kernel/trace/ring_buffer.c: In function 'rb_range_meta_init':
> > >> kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not used [-Wunused-but-set-variable]  
> >     1943 |         struct ring_buffer_meta *bmeta;
> >          |                                  ^~~~~
> > 
> 
