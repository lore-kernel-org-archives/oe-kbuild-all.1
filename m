Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253B3382EB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866444; cv=fail; b=AzTUOVTHBze1aEi4/NuoP684OB+PKPIfDeT9z72H9Ql8TJ/er2uOZEj1KBe7vQdj8nagz+bUjMIAdh5pk2KvH/ZM4XcC7TvKa8+GBG2yRFHcdthfX4Bs00s0N2nUILRGaNg7RwnkM8iHLs2WKtyvFMRGyIj8k9zFlfLqwFAsPBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866444; c=relaxed/simple;
	bh=kZhImIpzJ1gy88dXYuQlLOpxKl+FR5ever3OhK/ZdUQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B63SwnyIOtthUq8FYLI2kEJioSffILYyRwLN8ZkbM03KVRgsspn4jgkQn2ZCtyC9QhbS2eYpbSkErQDdfP+fXAXiIVFRCOPUhbHHhnqlqxGU5cp+sidAnqQ3ug5esFTbBZiW9oXv5++mx4jgG2C3fDuPrG9L4KM8R7TeeiaWzYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1VJrO/c; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1VJrO/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767866441; x=1799402441;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kZhImIpzJ1gy88dXYuQlLOpxKl+FR5ever3OhK/ZdUQ=;
  b=U1VJrO/cGl3HnGEg+7SAez+B6aQ4cgLsZ7NAr7KNITlFG46B+HY166LG
   BDr2q/jEg9ZIOPmerwX/4ioMWVSi0soEOPiVHiy2OisT3cKcF7PPE6Ogb
   AbG4Cuazo8C3nyfAQooydUQUjuWphTF3zfFpay5HmT4HZbMi0ULj25WFj
   sClLgX1VCU2bJ9mIBrJrwEKfT7qZTULaTlME74GEak0IRQBCUC9PHpCFY
   3gtcZ67nlYn7xh7JTghzvAsh8pB0kwJpz8GUoohDHxWCx8YEGmuF51IQf
   WFv1a/McbNDWRkxihUI8PM04qIcPBdCn7WUrPnlXk4b7QklsHhR3EcuXg
   A==;
X-CSE-ConnectionGUID: tHamy6eYTECXaWeRbqRB9Q==
X-CSE-MsgGUID: 5naG2LSRR26wLHUluUkqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56799977"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56799977"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:00:40 -0800
X-CSE-ConnectionGUID: +JVRjJxmSZWKxwiUUnhNNw==
X-CSE-MsgGUID: qC717p4dRJmC9Q1Re+Mm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="207649450"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:00:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 02:00:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 02:00:39 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 02:00:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2+7lbkegtIhJilwhQroLeWNaOmc011ztCYaGQjpLKSuZK/qrCw0fpO7/d+5a7h+HtWou0LVy7QIvxl50xIgER0usJR8WDQ929GzW4S6kDr4V/P/tk5Z8WpZOHsRfbpGbdXkadDan/6pBjCZW+neW38oYHjGfMymo38WSbjis1c7/gJskK9++uNvstsCbgdWphoIOSA/0Lyn1MIBXt51glB/p67pG/NOkuVIvkFINfxruNq8jv+PN7GiVucw8SxpuC4QunRI8cCsuTE1tQkg1bDk3jAxXRApMt4olQp0RfHb3Hg5bAEerSJSeWRyS9N+Cw6MPQnIT0g2DNOp7+4i9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBV77aZCyF1Zf+zSjGRGMwE/Z55tAmXXJSUDXb9NjKo=;
 b=rrQxkcui8+zgkTi/DdEza91lrRArnkNqG6DYv9znGlKAGQV7x+kByPn2DXmztAaK/ovILQZyKQV1e+w1WWQ+qdD4laqKOK9/+KCczwaEqeWvTb2Tkd37YE5XC8c/pobxYfJHWtVflIReolEUqs8kcAcvzKLiEcq7/MyMp9WJfAp53tFeMELk5WjKBjpfECqoY5xq2EhRGXcrD8SjbWECQIJk0oz0I7UOXMzr5Q6b57VjBdXQXuesxxCgm5pY/QYk4CZKvhHdIEh//4dDJvrocDl3riHXSIEe3B55GzK5qlGoJTx6ptyXpBZ4c2rzkMaIi9oroA5aMD2AauAoHZuuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 10:00:32 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:00:31 +0000
Date: Thu, 8 Jan 2026 18:00:24 +0800
From: Philip Li <philip.li@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <aV+AOMH4CQqlUpT/@rli9-mobl>
References: <202512200337.um368Um1-lkp@intel.com>
 <aVt23tyDlVK0JaEU@stanley.mountain>
 <aV93kq7uh1cWCVF1@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aV93kq7uh1cWCVF1@stanley.mountain>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0c196a-5f60-4b09-68fb-08de4e9cc24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N7UN3PXZ8zZOejHn4jysxN2m+SRmsToelkxtUMawVveDBoSUp3hI59k1HJij?=
 =?us-ascii?Q?g8ULzJzlS6xRW8V/+EmZbH3tZNH4Xzmqdyxhz2zyLg7srJMuR3JYcHKeq4Np?=
 =?us-ascii?Q?0lqNI7JjAiTmJB+j5y8I2O2OSSKuuerR/Lqy8Ej4SBhh09w9T1s+A9YKBpPr?=
 =?us-ascii?Q?9KSEIG6AbZv4J0SC9gMVVmxVo550Nq73uQt+M2eKMcjEccMn4A/RGmX8fwfH?=
 =?us-ascii?Q?5iUDzUoThsDNVRnbMm2hNvzsmrxi8hR/QdlKBnhPSTPNO8EXZOOoXyyLe7k3?=
 =?us-ascii?Q?ZjSSq8mXSzgW8jtG/L25qYr/MoweSP9zOJ00OUAbyKMDTCDgphedt3ZZQtWK?=
 =?us-ascii?Q?UMaG1S+7RHCoFbSrQZxS5yvUYg9Vmtysj+0XrsyLDbTc91ZdRlEw1W0vaJQ9?=
 =?us-ascii?Q?fNDVo8R/IGTqkuxT7BoScGycNeytFPpyM0UNlPRVfYoweZ6YFeFMdO9ddu+I?=
 =?us-ascii?Q?4F0UUPjZ5DKwEuixjTq3/UFATcutF0LI/VBIjAvwBQYE6YqduHB4ADnwy4kO?=
 =?us-ascii?Q?drKSmZkt/ExA14/XE11f6AalV3SOPMp1q4+3AFsS8DGApgLHhwyeR7rrVUP7?=
 =?us-ascii?Q?RBJVmKgvFy/rUKQadIjQbHXYF15NbS/vBmWDxhmof0QWGPxmc4cdRSvul4qy?=
 =?us-ascii?Q?UMP4/2Csmj7J3irHyzk0XeZRbPZNBxCNQZWCz6ozGn8uFBm3E0ZUBtT5FHK1?=
 =?us-ascii?Q?WmtEnk+b7YlGkPyjf7/EzagUmaHNsg8YOtUXaqjfiMrRQkkT05Hw48LGMpCi?=
 =?us-ascii?Q?PyCskUWcYFj+PS9IwBX/IeA4+mvQiphnJ4qFi1lwdKQgozIb43tmGFeJWvRT?=
 =?us-ascii?Q?AwhcW9udHiDhvKMhLZhLXJlZY7DOBm+8eh4etQTSsjBZNugSD7dxpbxyerAA?=
 =?us-ascii?Q?F84ZuA6lvttjP5JplthcXSyAd6zdC/sqgWkrxO1deFP+f4b4azGB7aB+bICt?=
 =?us-ascii?Q?Q+1Mwt3qaDXHunyiCSPPz4Hx72rNehuN3gX30nEzKdFFM3kCiAqDKweWA9Zm?=
 =?us-ascii?Q?7yEahSFFh90T7m0SpU8PBlobNtHSeiko2yVrYWzIhOxI6mzKalmb382sVRKJ?=
 =?us-ascii?Q?YQnp4tWqizqtB2bpwjZEIMw3BRZlQG2OIGcruWTrjs9kpqIZCqb3dsnN4CvN?=
 =?us-ascii?Q?Fy5LgOJgmJ8ujmVhIXHnLoZIQetlJ1v/q3u8Vbsmovtr8NT6HyFLB9++edfJ?=
 =?us-ascii?Q?mphjTs1w5yU3e0cEZ4RGkiFKOvE7cL3nmm1sSglrYaw6a/ADJmfCizq28n2q?=
 =?us-ascii?Q?sy9IeFOSLY95bnG2+utwyaTZ/i6Muf0LFtgLtHBLL8TMDGK+GzsfrbCImxDE?=
 =?us-ascii?Q?RIZ4UGx91ix1LnQg9KUoG5HEcW2dkQVnRaqdoxCPEf4gv6s4xlqQZiVn/n4H?=
 =?us-ascii?Q?Fg9YESFZIzPKMaMKG+qWsvbgwiz3MB3EqvJCP/8IDvqaVhcEk3KtXg1y7m3S?=
 =?us-ascii?Q?BDCLrTp/odKmXFTPCpofsA6SbLgyKO8dYsqIkMzrYa4MK1usQAp9zg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UIcXB1LH/ezM4GBSvyuqFbOu1NcMqQIkScMx1C5IM5n3BCr9VUYLxlrURtw+?=
 =?us-ascii?Q?9ugPdlg8M9OUNW0tM5E1mj8h1RqLyWONQEWKNNy/WnrHQJqnVOE/lnJRY+dc?=
 =?us-ascii?Q?hnik6XcElAZ80uG5Wy+VHFRh9wWChAkOXNc8m6yCuHR8AhS4FbvFl6FqvKZU?=
 =?us-ascii?Q?SBSQIcqsXtpfggtyifj4qCGJ72u0XrNrJf/mobMwcH/i85wa/qHKzxoYINjV?=
 =?us-ascii?Q?3j2NYvNIf2DDRpvr0Y9IRRSUeZ6lvFy8tO2wIfHpMyVgMyqR24wGaYSAB0Je?=
 =?us-ascii?Q?UUrwhmYUWpgn3NtK6TW+Vi2TzxvUXoHIKlfAwhQCIVj2K1vhHklWGXelZa+o?=
 =?us-ascii?Q?H8mLYnC+iByp0KIYQf74R9nsUEf04SQTkm2sCopMnYicqBLCDHJY+IIzk9UB?=
 =?us-ascii?Q?X9LRL/HHP2kpf4K8Re2e/gp9U74Jff19DzwrpaRadHiMOD3OO+lH4YRTqP5Y?=
 =?us-ascii?Q?WFgA/UVNIq7a6LvwsF9T7B0tptX803r/mMDNn1dUpwbbS5PiPaXKWTrzjS5N?=
 =?us-ascii?Q?seNpkCW4AgsvpYukIZvQCUIa9eiRBfv2LuPAZDxiXe/omidtEw7YD9T3/CKi?=
 =?us-ascii?Q?UiJV9ISEzjovqbSWsk5I2E9+36QBkOnyGwkbvniZoHIBB2aWnPlWXh57xTOd?=
 =?us-ascii?Q?5d9wwTsfW1dbW5x/NYBLPFglLM06hxHfrtuH+z9ivVACYEuPUbLue1c0iBXG?=
 =?us-ascii?Q?ZkuIozK6Vh18TtkQbdkZXmHzvWlMPvoIT5QBKNqntfXiKm9BJStsUodNyMb+?=
 =?us-ascii?Q?QwZqFM8acnUKv9CbYOZ6Bz2tFDG3Nq5zJyG/LLO5PsczRe8AXWpKPNXzIka7?=
 =?us-ascii?Q?JKNrJTxby7K7AUY6rrzt7Y9GEmzStLBMpSryJbks2k8bW/AxUVpy9YIaRSd2?=
 =?us-ascii?Q?hZxELzlGxh/M4p5iJAYg89H0dOTq3KSpKRdlKqN22JquapdckrDngFELEhrq?=
 =?us-ascii?Q?UctfX0dvUkR+TKuDcFH27OfRW0rHZihzRymtodM2/XHm8NqI+w1aEHPgySzf?=
 =?us-ascii?Q?wL20U2rZteCamp3y9tx5dpp8iWW5jXRGgcbk2H/pY6xfRoq4cYdluTUgbep0?=
 =?us-ascii?Q?x/YOllNnBjlUJ3QstLzOxvYoPJhwSRpp2ql57Xr219ug596OhjpD2vPVuScV?=
 =?us-ascii?Q?ekuHtBV1B9SDx39mCtcc4QkEVLntvd4ch9Ck2adJhQVT4X4egZo+454iwWW3?=
 =?us-ascii?Q?s5pG4Xn6/e5A8skyw7BIAUVLip/jcyfBcB9y4Ask6NqJ74O/O7nhz9jx5AoN?=
 =?us-ascii?Q?uxJDA0PyLe5xYCa2SfIQ56V96BVVQ0xTYfbQmkFE99f9jU06HCTgRtFyXMF4?=
 =?us-ascii?Q?JcE8CaJYM+g5p1V8r23aoHGIgOH+PjH+BhQ+YAHq7AT2XY+WGw0hFegFrPVe?=
 =?us-ascii?Q?GPDPZE29prnLd6xPEUgZe8B2mRiZim4u3W0fhEA6SBb3lGSP8cToKpFWVOc3?=
 =?us-ascii?Q?a+5nQdZvnqfPAwCYrXqmKtgUecPU4Z6FNp9Fub0N6wLsPYlzyiGBsDqTnv8D?=
 =?us-ascii?Q?QjvUZq5O3xD1BubhlDNrsUurOxNAH0gTw12+4aNdGCx2Zc56E9UvBAlxuRIV?=
 =?us-ascii?Q?JnY6BcyGuLDsv1hkJdWBk3NoC0uCGrgyMC0iOysTpDzhptnRQLgeAq8MGldi?=
 =?us-ascii?Q?VhTfV8AIYG+YtLiDUbhvoEHgsI51yZpLxjmsHsBdt8KeilTfT7UTW4Ly/I3+?=
 =?us-ascii?Q?azrupnk2V/rUFipUV1RALC5v56q4ugsxgY39tR3G/Hcxpyg2zpPSpdL+F/pv?=
 =?us-ascii?Q?lBuPXtsVTw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0c196a-5f60-4b09-68fb-08de4e9cc24a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:00:31.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJcf6OAFFHdaR9IZeAwS0turam1BH6bDe+vZ0hAJQG4FN+T8vcLGs0Lw5Ey275Tl01VjS7yDKZi6ToLYg1O9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com

On Thu, Jan 08, 2026 at 12:23:30PM +0300, Dan Carpenter wrote:
> Hi Philip,
> 
> Sorry for not CC'ing you on this email.  Do you think you could help
> me reproduce this warning?

Got it, we will follow up to check this.

And sorry for missing the initial mail, usually send to lkp@intel.com is ok
but i wrongly think this is a mail that reports issue out and not check in time.


BTW: remove Yujie from cc, who is no longer working on 0day.

> 
> regards,
> dan carpenter
> 
> On Mon, Jan 05, 2026 at 11:31:26AM +0300, Dan Carpenter wrote:
> > Hi,
> > 
> > I'm going to be taking a break from reporting Smatch warnings until we
> > can work out new funding for it.  I'm pretty confident that we will be
> > able to but there wasn't a lot of notice and everyone was off for the
> > Holiday Season so we haven't really started the fund raising process.
> > 
> > https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/
> > 
> > I imagine that we should just send these warnings directly, but there
> > are some which are obvious false positives so I'd like to clean that
> > up before we start sending unfiltered warnings.
> > 
> > I've never been able to reproduce these warnings "iterator 'i' not
> > incremented" false positives.  I've tried deleting my cross function
> > database and using the exact same config and everything I know how to
> > reproduce them but I can't.  Are you using the latest version of
> > Smatch?
> > 
> > regards,
> > dan carpenter
> > 
> > On Sat, Dec 20, 2025 at 03:40:19AM +0800, kernel test robot wrote:
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > CC: linux-kernel@vger.kernel.org
> > > TO: Maxim Levitsky <mlevitsk@redhat.com>
> > > CC: Paolo Bonzini <pbonzini@redhat.com>
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
> > > commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
> > > date:   7 months ago
> > > :::::: branch date: 22 hours ago
> > > :::::: commit date: 7 months ago
> > > config: riscv-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251220/202512200337.um368Um1-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202512200337.um368Um1-lkp@intel.com/
> > > 
> > > New smatch warnings:
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
> > > 
> > > Old smatch warnings:
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
> > > include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented
> > > 
> > > vim +/i +1378 arch/riscv/kvm/../../../virt/kvm/kvm_main.c
> > > 
> > > 6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
