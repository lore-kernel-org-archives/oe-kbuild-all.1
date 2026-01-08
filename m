Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E428C00D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767889664; cv=fail; b=XWAhplIlg3XsRtjswlKzCKvRiA1qkAWuiTcmizGHathk+I6lH0tqS7VNGf+z1+dRJ7cK5HxBmRNwQscMfBLL2dVdfcVjO8Dt6lfjPk48U0xgPq/AB44lMgSYHzjT9aevUsHpbFTfxNZbPSMHyzneXruQrFJQeZLNCVy+rAM3ISQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767889664; c=relaxed/simple;
	bh=jQ7MmK1HpQMfp8KC+A3rNHm56Ba/aEuFPpbc7GUOawc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TTLslazWrJ4vo+LQZrS421BNX25FHWzVaavfFDHmXjrJA/328O5+UogCURCwtfY7ap7Rc2/KCXIZWYJgcE50RcvuQdtAfr/7pnuAYDb5eWQie9CuC4X8i7GjhkKa2KS9n5GAhJ9tfgdMgnbfLiIpdmsp7k0Rtik5ZMCj+rHCqDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FM79qGM1; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FM79qGM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767889662; x=1799425662;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jQ7MmK1HpQMfp8KC+A3rNHm56Ba/aEuFPpbc7GUOawc=;
  b=FM79qGM19jW1l482gRR7Xg6hMeTDg/D1PBQwrvOe+gniB7wbsWG+fK6X
   BlJqh8zSCkidXD+PkiqWfky3yiuDKLyIYpFlt+suLEuQoIvqAzwuar63k
   nciTQiPaSvKPZCdnJsUXvPLefltsgFm10SE/H6pZHv17BwYZhiBIWzXD5
   pe4KBQdKvNBqjy1T10WHm/uaV/h/vGA+k7IL48qx/HMdt9IMtMIzAdNX8
   c5Xa2x6y5QEOreXiWF1fljKjA9548fpehayzMWuZt1ASHQylzwuAbP1uf
   GUDr1Ibzr2cb7mjnCaZEhWLLJWDfGI1bDjaVYImntCTN/srrna5QkjpVp
   Q==;
X-CSE-ConnectionGUID: N34daOt4SayjpXSBU9n0/g==
X-CSE-MsgGUID: quVwblVZQ8aheOiACs2jlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94740724"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="94740724"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 08:27:41 -0800
X-CSE-ConnectionGUID: nS7KlE5pTTiSF1Eb8JLFAQ==
X-CSE-MsgGUID: qfiIz7lKSGmD/rMVYndNwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203161907"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 08:27:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:27:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 08:27:40 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:27:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oImGORJ4GGoc1idRcuN69kQkFIzm0vgi6AyVytzZ6Z126j/lEtTFSrk9OxNn3ITAS7SOK2kb6XTDHaxJFeR73RA0cqKRkP/FBEkna1x/HT9FYj25wB8W7vycwNyLGPsWJdtI6K2S56vFERdH2NQEq3NQppaCjd4spzE7zPH6tD3H4t2NW15QEEHfa63iPG9fVtApol3HHkSL9p79ZCqcVqAJO3/WJynvUfI3Md60x22c3r2RtYyjVqNF4aSgrzgfdZq2xoOBuV178ai+9o+itit6CRd2Q6Lt8CCxcmrpDHSRX0nQtPUGQDtZ86Ui4sXMb11kIcAt4B05DZ/Y3PUMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXxDymYbO7OENXqpqmc7IcH0OtdhI3ZzqJqzCYYpO9o=;
 b=wlxT9kgR7noEkqt50KlOpLwJNqOz+h7a1VdBrkhdadsJwkDT0ieYdu5cCFdva1YEHL3xSfPoNy3GCZBz3unQJKvFNUz4+VU7Cdw8DidpmAYDTW/hHs1QlBJkK/qdk+PczH6uzUgq9qbmmujnqAON3YmZzf2GT4PfzlChtJHxhhjyWp6em9MJJ+9b+xrQXPGBVyqwbwUs9bLBSHwjte3ndn1b3SyoRv1TPE2Fxt7LUUZhrBhZB7yMN6G1gEnDSxpUdIJwYOj/Qi6Jj4siK6bt6cwn8bndWubCMTI0BF5w08GgTVzlImEo4u0vO+fE2AycT2BWeMIW92QWifTL5PjLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:27:38 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 16:27:38 +0000
Date: Fri, 9 Jan 2026 00:27:30 +0800
From: Philip Li <philip.li@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <aV/a8jIBT0s7sx0b@rli9-mobl>
References: <202512200337.um368Um1-lkp@intel.com>
 <aVt23tyDlVK0JaEU@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aVt23tyDlVK0JaEU@stanley.mountain>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b0f0bb-81f3-4930-0f37-08de4ed2d67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ef1VRG+OFDA4/jlyQU0/AxxBja/jUnqgQQL1DPLAQ3LxPdOlHIbTzXxwDxdo?=
 =?us-ascii?Q?8eFz01HvKM8zSyEWHrFd8IGeXAlYeFvojLO0KPBpGzXImszITpEoF3fYlxW9?=
 =?us-ascii?Q?VhbTlpk+2PJi+w7KUCLGH96lTSRJiK9eRpx84W3EE9kPpWC4UfzwYkhZsXYE?=
 =?us-ascii?Q?N0r+V+A+FeYXFUBI+XMIDRAyixZoVfMVoTmzPe5uJErqQRUJU4GOLjkAOYD5?=
 =?us-ascii?Q?zkr23g8Xz9ZxRb4KdvLjsHi2KOgw9ddUVms4PzoDh8UhBnnIw1znMP90PON4?=
 =?us-ascii?Q?6VUQ1kOICGzSUqQRmMEkd+5De5dqgw5ZxBYfxaHr6zye1igJEpy+wYKdkTh6?=
 =?us-ascii?Q?ymPt5Hkip9rJ8XLR28Wbh/pN8djZ7Xs9QBMEfvnf7K1/JDMbLF02o6WOBbQn?=
 =?us-ascii?Q?MwOpu+7Lo13RqLoOK2W1lCJKygCDOKiqcsfg0PENhgHYmTFoo79OVYOBiqpJ?=
 =?us-ascii?Q?OJcAuPreANXUVRM4Cp7ycIpAmZYzEHJY8H+pgVRuf1cxW7VNpb/f3ECiRfVv?=
 =?us-ascii?Q?3lICm/S7RdPj4rQKVFmHdvBelOGk5aG055a1KtE8pU5lxfuDQ3UkIwrclknc?=
 =?us-ascii?Q?dEL9wSKxBW+QKfUOzco/BgUTdVUN5SOTqF3jUQHDOAm++pmN/zXHTWNR2ePP?=
 =?us-ascii?Q?QYrSMpz2KXFS9t6io71JW2F/xCwwYqYFNJBN6cf/cOsfaMDGfP485Vp6CfOT?=
 =?us-ascii?Q?Hxlts36e6/WrEH7xLx/FUwnaj2BDVQOPPnC0Um+mwDmlE/MVfwmkyKOmKt40?=
 =?us-ascii?Q?PN3yza9JP4B9zWRQas4knKMRG2ornKKPt3obozRIij6YBYGK3fYe2kRTVSJ/?=
 =?us-ascii?Q?ng5+zCXWn3eUtiOBd6o0LMQM+dO2wzv4QkCQZ8r7fwosnnkpo7Uvf6GFROwh?=
 =?us-ascii?Q?vAfyOQTyAN/P26QCyCBhdnEXha0t7ZmRR79IEncosaldQUiQaoUF72KPm+06?=
 =?us-ascii?Q?H6d/ns2MjqMiNmTbF5HBCrdz+f3ODoh15aRnSoiU7CKtmo5nKDwjlbKzVu9a?=
 =?us-ascii?Q?4w5gJYq12xhTKiLum4LEqyMeTEnzozuw36GsHM46ZTSKEJHOTzElotfmU3do?=
 =?us-ascii?Q?euy0sTz+CwFOEjDxqHr+z5ElrEt2J5uBCMffmPGf8XDr9hsDuM12p/F2H5Ds?=
 =?us-ascii?Q?20kygTV1NELkzTgbj0luSKVTBAzW3ex0Q1T7+NZ4Xx5CS7aDg/3LBI2uHNV1?=
 =?us-ascii?Q?YaWevzBWq2ZV6ZEZO+SUki0+P1BxMIwpL9hHS7BtLgojnXgjL4TlRxfE2u4e?=
 =?us-ascii?Q?dsJA25Mp/vs3Q74LkcsVkw5EfDAGAzgiVfVyG6bfeau+ddjC9hV6WJueqZns?=
 =?us-ascii?Q?Pg8UeDa2JQT0aLDREWqkGVjFclRrZUsGBwXiknBpXv+dCWUhqNAwdfxNXV1x?=
 =?us-ascii?Q?tejIqI2j9o/QmsaUEXUcarS5bAAnx9XQSwpcFzQBQYDPD8xf66FXoJS2QHrk?=
 =?us-ascii?Q?I3iPjG9Lu6F70BuPotzqqR4+iFvyuL+jUR/iwBpOd3GWYjLgxI2Kwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hh2QjDrIqa9rX5IaBOUpByBMfoErhKyRFJ0gy4Cg/IOv9FXssHWTflhRCmR9?=
 =?us-ascii?Q?9rBlZe1m0P4UORKXWNL2oz9ZD2VkVOTdrD8Gh2Ciz+4SU/NwYWHvs1fHqhIu?=
 =?us-ascii?Q?QkA2M01kss3YYXEKQRY2DSRkEVssFhMLApTDhCp9acrmyoDS9jSne7IFXUfY?=
 =?us-ascii?Q?XGgcG1/tGMnNIzolGkRQWeAnrQ6yYot1BHiwTrlA1LxMZJw897G5zr73TqVt?=
 =?us-ascii?Q?12LFjEaE3g0Qp0K+D++IjWL7wRj042n8feEE45pd4U68f2O4K60AxKkyZg6i?=
 =?us-ascii?Q?yS/OVwFNLz6PIAElj21EicqzQlCKE9XnatAjUW92mVn0OCzDWkDbRefENuBB?=
 =?us-ascii?Q?mu+ksdrxjIlbIQ/d1qs27zLhgg8HWlAJQvvJXYxLZhPF2OIteBPkY27rTWM/?=
 =?us-ascii?Q?AOQyJNbberD26j3MJRxY6j0tgBgYiggSXwHRehynXya26WhJibOKMQWjMM2M?=
 =?us-ascii?Q?g398bVqPPx+8DHQ8JlL1yombuOVLtfhrpHXcur+DE8LrGnAspVgAxhOW8sb1?=
 =?us-ascii?Q?OgwARCpXlZ/4+DeymHSGI93Toh35eLmCMp/vuHN9yS1GlrPLiOUcLjE8U6/L?=
 =?us-ascii?Q?SgBH3LX1OmZlloXKZ7XyWE2fHyLmVOZUQ84NGJL4a1IBmjxdVPx+INbjRJt4?=
 =?us-ascii?Q?GBoLOgNnBPbrwjq0jrbW2vtemhEf4yWoluS7h8xhJw0JUHkFyGe+SdFbsh1i?=
 =?us-ascii?Q?eJtycVLhSOZPlIHI4lrXU2yWJYfVhXk8gLc2x7rxOgJ3v97JOOndttC8mlNR?=
 =?us-ascii?Q?N6ZZn4Fq0ZvtLbcgSeMRCeHeV+b59Q62xhvcH9j7HBtP9kToLnXIDl6x0B2I?=
 =?us-ascii?Q?PuJGlq5sVVU7XzkQPQP2JpQkJKfqOoeYk7Ft5Ihvf/bmSAz7g8XPHJyPgqqD?=
 =?us-ascii?Q?xwh9lHI8Hry7fiaJMlhUiVlv2SrFpYNRMJna++yNtI7VEL8mEjV4zvMSd+3k?=
 =?us-ascii?Q?ZUN3cJFIpTidjaxgyQbxwoR1l1aGko1uF/HaYFDcT28RZAs8BdxFD4UKZa/v?=
 =?us-ascii?Q?NFF+Z0QWcRfCw5ixY2zLVL6+R156EAQd41l2xkejRXQ9Py4me3HFrePziaU4?=
 =?us-ascii?Q?aCMXSPdfysoT6YqgUY+CIgxCZENuOwP8cJsTkHif9pWLHi0H6zcgaTwmCQWo?=
 =?us-ascii?Q?PQ77ihzjPo14SpvJllwSrHd6Lb7Dbcj65Xa8/cqkU/7+p+c5aOD0ZRmuNpX5?=
 =?us-ascii?Q?N8dbtJUB/2/gzVH6xTjEpwbeSlmICEB2LLhgtXZFTKtTfxPn9Wq86Ui8Sa3g?=
 =?us-ascii?Q?btQx67GBz3PwZc6gAcA/TN6W7j+xSuBnm6JD75oTBjtKRmMdlxtqigdXwuh7?=
 =?us-ascii?Q?Gy8/18q7NLG5knOrbIhASXvJjTr5nL05PGjvUSYp2b0X0kLqTM3hMxOM82U0?=
 =?us-ascii?Q?wtQUPvp35SQmH6kxULQKvskejgTTIfzMq+EUEh77n/o4yGg/nNczmqtd/q0y?=
 =?us-ascii?Q?iHVWkgXFsq2uJHvjduAoK4RRqlVcZA/YDtbMBpEh9sa5yvHGUDbIp2IX8O9n?=
 =?us-ascii?Q?1eRKUJOZu4Dj0roww/zA8xpEkl1UVPSnYwyHqKhl5jWD/E0wjd1uNdO0LxnJ?=
 =?us-ascii?Q?GIi5swoZeyKA9Yc6RnfGMlhlGgZw0NS5JDHjW+ALFXcM4yRbnUIkzkGIDOM3?=
 =?us-ascii?Q?8L9/yUzzwXyrxZ1XP0W9sAskp9fgtFHsCVsFz9fA93+sLMeBGJAYwYN53xt1?=
 =?us-ascii?Q?W9jYRtEHWdw1cXtIeega9HQwwI60i9n6r3nkH42ya9jq7boLTqEpQhjKn6Ql?=
 =?us-ascii?Q?GCb9LD1dlQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b0f0bb-81f3-4930-0f37-08de4ed2d67b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:27:38.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18rS8bOTJQSmkwvmucA/EmH2iHirv7GdkzLWKMt419+k+kqXTYw4Zf1ajBzmhRJkJZ9BqNpIu9R4819HQwQs2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-OriginatorOrg: intel.com

On Mon, Jan 05, 2026 at 11:31:26AM +0300, Dan Carpenter wrote:
> Hi,
> 
> I'm going to be taking a break from reporting Smatch warnings until we
> can work out new funding for it.  I'm pretty confident that we will be

Thanks for letting us know, and hope everything goes smooth for this great
tool. If there's anything that we can assist such as running smatch more
productive, kindly let me know.

> able to but there wasn't a lot of notice and everyone was off for the
> Holiday Season so we haven't really started the fund raising process.
> 
> https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/
> 
> I imagine that we should just send these warnings directly, but there
> are some which are obvious false positives so I'd like to clean that
> up before we start sending unfiltered warnings.
> 
> I've never been able to reproduce these warnings "iterator 'i' not
> incremented" false positives.  I've tried deleting my cross function

Sorry for the reproduce problem, let me further check.

> database and using the exact same config and everything I know how to
> reproduce them but I can't.  Are you using the latest version of
> Smatch?

The version bot uses during Dec 20 2025 is

	3a2a0587 kernel: add some more once_through macros

And I will upgrade the smatch to latest after trying the reproduce
in current bot enviroment.

> 
> regards,
> dan carpenter
> 
> On Sat, Dec 20, 2025 at 03:40:19AM +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Maxim Levitsky <mlevitsk@redhat.com>
> > CC: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
> > commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
> > date:   7 months ago
> > :::::: branch date: 22 hours ago
> > :::::: commit date: 7 months ago
> > config: riscv-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251220/202512200337.um368Um1-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202512200337.um368Um1-lkp@intel.com/
> > 
> > New smatch warnings:
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
> > 
> > Old smatch warnings:
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
> > include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
> > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented
> > 
> > vim +/i +1378 arch/riscv/kvm/../../../virt/kvm/kvm_main.c
> > 
> > 6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
> > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
