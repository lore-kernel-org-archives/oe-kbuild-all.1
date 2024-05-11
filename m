Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1653611E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715394022; cv=fail; b=emOGnmyKC1FIA6q2lXFCuwYGDXSLNgt6zCj8uHwQi2W5hBMkxqhX6g0rt7UV7z1i5BipELQ8qAVCnUun0zXdAsZ6HCDXBCPpSsKPZV+8bWItRuLfEY2I5WgHFrPF/T2IWJatriz58Bqg41HukGq8PcxgI/D/czjI6ye6TbpQVxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715394022; c=relaxed/simple;
	bh=PNHW25RA3FZTwDKsUy6irUWviZimO8yJW5hBmgcRm3U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jSC/9eZoEZ7WCtsGM3VKyfR98dQVkgqrdRIV7Addu0y6Td8KwR2hWR6Gh7WoUYxfy/y6jCebnENNYqTcBUg0+GGyAQQaSVqeH+QojYn51lP9Yvf6Woh2cxRB3d1RmqPYO/aGziweabgrXlToe7FfdCaHDWaWsZC+to5JlLcmIhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0DJ4uwh; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0DJ4uwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715394020; x=1746930020;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PNHW25RA3FZTwDKsUy6irUWviZimO8yJW5hBmgcRm3U=;
  b=K0DJ4uwh98k5iVPvqs75wuii84Czbc837/2tA3IDM6CXTJAcEWfGZiCG
   fBHqhxfaCvAXKNjNUYjw2FO7SBuUVYrs5K9LJp5ERtvxlj+Qf+y4cfGQh
   rdV673lajtSA8QSX29a+/odQ5amOTHJ/XXP4Wv2mxqZ67vbCGp1yGHE9v
   oINUQN15uWQDaHqsSnUNXZWohbxOZ7e2UdgOBTcIrcyj8snCGuIEc35rW
   uaWGw0Pgw3UDPo0MA5QTzIf9dwTEqTZOtiWsDfX16iQwiArtYIpSjFLxu
   vjP2boEcDt24rzctdJWuZ/2RL9N3GeW18BbNSKP3zv73d+8fs2towkxm2
   Q==;
X-CSE-ConnectionGUID: wVYxy3q0TSei2kdKnWcsTA==
X-CSE-MsgGUID: svaWIqJzQxWwZtCyJy3OYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11532175"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11532175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 19:20:20 -0700
X-CSE-ConnectionGUID: 2BRZbIIWQFe0qXKJEtkNRA==
X-CSE-MsgGUID: n+2Sui4STnu7Be4PxFgTyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29865283"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 May 2024 19:20:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 19:20:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 19:20:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 19:20:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 19:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmhuguCCQRrlquuA35JNQrFCj0bAfjPceBA2tpspzw/69Nax56YGYMViV677SXGGYK4MBJ+M4OHi9SaWmPEvKiXS43c+ZUOABkaGVkHpda8EdiVKw6Pl5dRMJAykoPZNy1e8/nl3U3cSmKB7IyqHUQzdJwoAbcBlDPXahUOjjpJSWGDQBfI0acA/o8MuX7kJzIkflU7skQ/nl5AtGGVhPMmTMKPX8LoPhYYuPWkS01OzOjM9nOerewkIfC8BEmxKAyIgWLOxTT04wvm7uBpkybE0A9OnCltQ/t8P3kAySx3pxaRE4XLj5nZwru2cl7O4dkkSa4KiRcl8ya1jAvhVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJPOA1zfZlbGnP6HUv9rDJJggJ+HI8HfbRp1nUzDmkI=;
 b=ROVJElfU4WnL/WPy1XGw50hQEEtOXLHRp0oA7YJlHrBU9Jqv4N9bbok1RRADEwLI51hGie3N1HGQpVCFb1QHMHxiJn/65jBkwfp+bBF6MTq9X8iEBqBa1zL1RVg7zU5ytI+EmYJdjR70+7iXw/XIFJYhoDrD3RrcVva8O340W+pFyIBu0F+i1xSWAlzCTD5kSAREfZjW8YFEWi30ZSEeBevpqQfLAt6peJ4HxvTb7CcEvb+WZrDC5kUZYMEtaYseEOjj3BtIgsJVRiaflR3Metjh5SaipPh4hi0c2G4PWLVJEIb8uWdShbJ+CZXMEJvhaR/anKCfzTa+8Umn/TUuIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Sat, 11 May
 2024 02:20:16 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.049; Sat, 11 May 2024
 02:20:16 +0000
Date: Sat, 11 May 2024 10:20:14 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Conor Dooley <conor@kernel.org>
CC: Julia Lawall <julia.lawall@inria.fr>, Conor Dooley <conor+lkp@kernel.org>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [conor:qwip 5/15] drivers/spi/spi-microchip-core-qspi.c:593:2-8:
 preceding lock on line 586
Message-ID: <Zj7V3iXwa9PCQXec@yujie-X299>
References: <202405101807.6rG1rE94-lkp@intel.com>
 <alpine.DEB.2.22.394.2405101258310.3320@hadrien>
 <20240510-deceiving-hamburger-0edadb13cd1f@spud>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240510-deceiving-hamburger-0edadb13cd1f@spud>
X-ClientProxiedBy: KL1PR01CA0087.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::27) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA3PR11MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f641b6-08fc-4504-43f0-08dc7160e58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gF12vkaPnr5jePsNsDtVDLnjNV6XWIByd6U22Phk5mBjR6GcOmfEJMPbC8F6?=
 =?us-ascii?Q?5VsJOzRzZ0vU9DOQwQD2VRYHNS2KbhMSzlBsjFq87JA6I+flVTE9LtTxvDyy?=
 =?us-ascii?Q?W+e0sljIbEa0Ph21aMk+0tJSEBCdsbUpx/Aj6ZRRbGibFqgCF93eJu9oyipc?=
 =?us-ascii?Q?7A4WKEmdCmwxDoaCPz1nthaTNEBvN5NgcpxwhY091n3wr5JnNhNn1wes0CwR?=
 =?us-ascii?Q?usNrBXMVKqeh3hoJQcqzdo8xOCE7eWQjiuO3ALvWmVb/gcPbZd0JpnzAnnRz?=
 =?us-ascii?Q?umgnxSqt+Swmj9JwB1ft+GOcJr0B801SVlW3AwWTvAgqjQNts+q1qyRCcPJG?=
 =?us-ascii?Q?tb59xbon2pFjfJm5varEBrzISKoFzgv8pSEZgf44oFd1yhlv8a9YLf4z+rXC?=
 =?us-ascii?Q?njj5vxbcd95jLykxDI+EwC9IYIXgv8xenQ5cTXxSBzFug6dYTffz4I44wgd1?=
 =?us-ascii?Q?2lonWOO49SAWqWffzsRGqUB74fMj18SUr12L6eaeFfxWr+JMoLS4pxKlePF/?=
 =?us-ascii?Q?aICuHuKQZd+/jfBCYwhjkQdF/MPZhdLxXDgjkhPhDGmVI/4GLP6MhwskVMso?=
 =?us-ascii?Q?x75qEF6HP5r22xNToF9haSLV8MMbLOYt2xkCloc5v2aTquhNUYHjIo0sm3Ju?=
 =?us-ascii?Q?GEzfOVrfMhPXkDMuZBrQZe3fNJmqTzmD42hYv8ekjDti4C8SQeeJcyrqw1gc?=
 =?us-ascii?Q?cOWH1ZUfEPsg++JuOCq9pKX0JDrIH9QJuuHtjlPWzTJQq7WQw/u64NPgRExX?=
 =?us-ascii?Q?FvlV6RCIaFtfBqa8jJ9KXHcX35bn5/Ilx7/jqDhe7mqC3vtn/qx+2BRZk52v?=
 =?us-ascii?Q?cn3srO1lZlto/1X0kuVoYk3CQ4DpyuHvH3Giyyjd3RMSFYJG8PABPT+ZG52o?=
 =?us-ascii?Q?09fDGazlbWX9lEoM9+KIG9VStSivNU8du/yf7ULXwHM8tm0LH5WW8hNsBYer?=
 =?us-ascii?Q?KzlLm6IB+MRzQx0ITEyVRyEzXdwizrg4hhesRKZfgzQp6uDaPk5b39VqQ9cT?=
 =?us-ascii?Q?NNNjsiczL2hrfQldH4XZ3kOnbbbPAPrkmmUEevWl3hnUd9qIQTY3BCB0sep9?=
 =?us-ascii?Q?Thifbrty2qPZ7KuM6Sq8rLu7y7kGii9fvXPdR60MajCxqnRqEBtNUmg4O9i/?=
 =?us-ascii?Q?OLpzC/6D84RaDmxGV8YlfC4lzWn2GxNJfQ6/+vBimVS4eF34AX2GiILGbivw?=
 =?us-ascii?Q?H8xDH69i2tsu9rk6Ky65M2CtfBrm4eRqW2ZFUMMMLRCvJYa2onyuG/hRCnSD?=
 =?us-ascii?Q?tNOiFYUWrdhz2KA063IO9L1gzzRp33E2e7R/feJ7GQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxFV1TVns85l0ciWudsE3eas/43xNwLo3zJQe4o9LRCFgcKsx1xBDUMZTTgg?=
 =?us-ascii?Q?yFmxcPjgnnYkhZZbEaakYgz+BGnGwxmp9JNWQytTWJXcheXpcOZfb5A3ATRm?=
 =?us-ascii?Q?6ScEFKYbOs9hT0jteDkOxB4tiixbo/rOIAMDj3J+V76VPMJscpkMJwam8dKi?=
 =?us-ascii?Q?OOcYBr9zUg2aTK94MWVrDWFSUEoDaf0WAtSbqK9dP31Ax4Co5sVmtl8B7PJJ?=
 =?us-ascii?Q?WinYrTijordlfQBWKsbO0CU7ySB4OacJdCa+KRloh2WNOfbOnHjeWUehuD17?=
 =?us-ascii?Q?e017l53L3B8bTf+t/QCVnGCTYpuqvJCR7prY3tCC9EWZbpfxjGrfQHU15bVK?=
 =?us-ascii?Q?gIDPTOa0W3nD01yPEkxWsRmbMlVmED0RwndAaljvw+qrjMnTIhCuxg4LkN5u?=
 =?us-ascii?Q?1cZLrVzkHtkBvTKbA5uYVs5Gyh6EYGPJ+CrI35g8Qe8LmGvB9Ztp2XDhqrRE?=
 =?us-ascii?Q?wvp1fUf25pn4e+NUgM5+NjS9NXC5ppQIW4ov4b1BzFS1TIBK/W5P7X/BYpgB?=
 =?us-ascii?Q?9cIzoT1xMyGcOe5bjHX/dPxXqhkFokob5Q+tVx9o4PP0YUQ8XYhD3f5/waON?=
 =?us-ascii?Q?HikqKBztNYUZq6XgrWeFSDoe9plJawo7usEdOyvDybhc/uzZUGX0fmJMOMBh?=
 =?us-ascii?Q?7gJA0D8sN2w4Pk+hXSlIgl0b9n30whQEIHFKKrrXEjjHjMRP1655FDuZcfi2?=
 =?us-ascii?Q?PJ6BpUg3Jy80yB6pi8yvXPz4Cy88ZqF+0zgk2kNq9P1L43f/hs+tBQaOJpzG?=
 =?us-ascii?Q?e1jid4F/dV87kWVsEDJiEghFS+gNrOljeKQgRi+p18mzg7GwDHW2onGtZd5v?=
 =?us-ascii?Q?2FoIUcDzOUTlmZcB8DbnVFRrQEpbRW2JQFy+uOv7e/qYeDLc8HlwicGA8WIu?=
 =?us-ascii?Q?I3J3N7HFFwsDpvvZLtEptGO57n+HGKUB1oMMxmFoTBYo21HpdkerDRuVWelX?=
 =?us-ascii?Q?VbZUP+7YZBDxA0eSLQ8tR4yGYY9Q76jPKKeL4VVDhR22xSJL6FXNTs8fKdGw?=
 =?us-ascii?Q?AOKgLPmQxgwD2ow0ds2SGjd3ArOaFLtcnd5VXnYY1+t57tSM8lBYs4vCzWG5?=
 =?us-ascii?Q?ijYWKXqTdofMaTIwYoubOGthhHOOMWnK6QSempBl0EqTsZYn5Z2wNnEQw/Rt?=
 =?us-ascii?Q?OkuUBGAdqo2RmnGUQLsWI3XP8tlXbBbeR9QxFJAqS6MbIqLswR+bGpRR2tCM?=
 =?us-ascii?Q?6vnL0SdS3HkwoNubBydTJOSoUWllHqKFwhTD8KbW8D5VrlQs1+5oqIvzIS7G?=
 =?us-ascii?Q?ipoGQE8K9GWl6YeaN+C/NLpE3Tz3MKECI3GYvEldQkt/O7vYxgrbbwWzA0O9?=
 =?us-ascii?Q?8LCBNTIbO4TQRkO0Alfd89+pFycYaBJS1DXKHVIYfDsPcz0cKxVsBfrGnsxv?=
 =?us-ascii?Q?haHMW/ADlsJAzbIaAJArK8Igj7ZlxQAn9Rhj6T3XJwXVJSpYOAs+MuPNri5y?=
 =?us-ascii?Q?sCsrxMeV5KYri6N4eU1750kC7RV6wVdMYHPh+FJepNSsZfPaQDZX1/bEHtfH?=
 =?us-ascii?Q?O+aEbchKIGRfCja7mCgJq3VvStWyjyOp3dg/jND/oaV0N5i0tKtUMgBGFHOI?=
 =?us-ascii?Q?LHdemKRH5R6adcTBN5AGT+qJyP7ZEf16xoLOwdHl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f641b6-08fc-4504-43f0-08dc7160e58e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 02:20:16.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DQYwiZtEoRAiNcimThRjXgo/3Tw4Rh9RnUEeRbmsZTsIzyNPbYXPhyK5Vin/0UW6KUY6Zf3ClFHHEIbAPeR9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
X-OriginatorOrg: intel.com

Hi Conor,

On Fri, May 10, 2024 at 12:13:34PM +0100, Conor Dooley wrote:
> On Fri, May 10, 2024 at 12:59:07PM +0200, Julia Lawall wrote:
> > Please check whether line 593 needs an unlock.
> 
> Oh I don't doubt it, this stuff is a complete hacky mess at the moment,
> probably I deleted the lock by accident and haven't actually run this
> codepath since.
> I didn't realise that this was public though, I probably just don't
> understand how the private report branches there work. Sorry for wastin
> your time with this.

The private_report_branch setting means most reports will be sent only
to you with a CC oe-kbuild-all mailing list, while for some specific
types of reports, they will go through a manual review process before
that even if they are set as private. For example, Dan Carpenter helps
review the smatch reports, and Julia helps review coccinelle reports.

To avoid testing the branches which are in an early WIP status or are
not mature enough, please kindly provide us with some information such
as:

no-need-to-test branches
ready-for-testing branches

So that we can configure the bot to test the preferred branches.

Thanks,
Yujie
