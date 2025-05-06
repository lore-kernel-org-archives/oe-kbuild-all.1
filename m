Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0634D2D6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501044; cv=fail; b=F8awUZOWWagszFWSkurIlr0PpkMpk4qTWei5/ELbfObGAH/JP29sgCKoj/ZQogd97yY9sc2fuCYIPy+Mrbk/V0Gd+7o/u1KiyzU6LTpCotUhd7gWBpjC37nBAOvELwWwhy1FFVf78OCSO5GfX76irOe87sQhNqU3otMiI6S87SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501044; c=relaxed/simple;
	bh=xPVM1rbn6YyGu3OMgEjoX0KrOqbmVWvE30P1+WOPnZ4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Vegs7e3sWxWMCAqET0xz1pGMcLG+OByICJyzvO+KQuxyCyTPUzihA+Ax0lxdUX3pAuIUnlFdLeAfo5mPV9LYMJgu0eTQ508uVfABe0HtEoLwpZQrQRWXy+R+i0VqJioYWzMRuCDYr2ZlCDA7/qraKRqYz4UHlvRKgO6+Pu4ENoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bm8zK5Qv; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bm8zK5Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746501042; x=1778037042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xPVM1rbn6YyGu3OMgEjoX0KrOqbmVWvE30P1+WOPnZ4=;
  b=bm8zK5QvSEwZ0RLJnd2QmNKCYlWS8shSFuHZ0ks1zqa2lZ4aQr8eAeu2
   dQP6tRbI22+CfvwkXafMuom0bCwJMq4N86J3qc5pTKxGVF0UgQOvrjjID
   MuOgcsYektSe1a2ttjzJ3k1R86Rbj/3tlR7gMKKJTvz64MhUS8Pg41SJq
   pDv58ItDI2p9WYNBfeH5iIgIELfG1Cq47MIw84t3I7oM7s6C4SBn4qv2d
   +4WI/n2AIUIwpgcbCvKs1vwLxL3PomJr1y+hQhM3zSzTImWHxCDObtzKQ
   JCeKlb46qTL16EMlmGf35RvAcW3rERsVIZnpPjm9P7zLaFEwWQVVIRpUq
   A==;
X-CSE-ConnectionGUID: yB+woJmVTHaLK2kaAPUFrQ==
X-CSE-MsgGUID: xgb21/IWQ1Olm5Y9eWxkfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48275650"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48275650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:10:40 -0700
X-CSE-ConnectionGUID: h0kDmeZrQsiEFQrpH+c1Fw==
X-CSE-MsgGUID: 1uyhh5AKSKSSC7c13raEqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="166527943"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 20:10:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 20:10:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 20:10:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 20:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haIrDczuwawFz88cQdqk03rWKvRWw1uSn2FNd3LNke026ykhh+bPWjzbY5pqZ8kerLJ66QreLqU7Sgd8MiQgtIE3j6znON6A0XsJe9ZQANdtgbTpQLPNSFDWbu9iobsyDz9b8ERX3O0ep1TrsfPXteI/ID7UJ4hXqjFKkkM/txzSWLhj7oZkHBnTEhuMIwsfaYQ0QNwyXzRN4Hc3n8C6tWRmlSEDvvl1WU1/qi5dtwxWgt/KVT2Ep2FrOcWQYRMQCQtkaSDLgsiMJ/gURc/50+UA+WQlG+r3X8Hq2vtXy4/YA0RlAuD5rx7T2xXvie1Co5ReazlYz4jElIgjjJDlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtrk8GJxBOZGsZIcWnkFjgUCHYNVWqK9fjatPMbkVEs=;
 b=tPBTsBeZiZOKzkoQdAa4SjADNyBeyCr+AubPDkjWjYkecwn3ub3vLBBsUs70zibVBNdnWgn+JGBPuUxZr/dnp+Hn30qbXJNCAayB6Aemzpxnf3ZAK61pdTXLze3qdFyx/i+74bLiThS/bB8Fi/GxtXZHRgLfFKH30SppASroFT4YR57+79ppQWgn7/7MkmKaM4I7zNGbcs67pwUAIIgClmZAHsgdfyHpxGsH9vbOFYoqypTWvQ/OdtpywQzMphDOvKA+WiXKq5SMXUIKXLQSHOpGQmgi1wJv9w6846oCH70F0jaNcY1SwVIaZgQh3nS3RZF1FB0hJKXBroTWrB19PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 03:09:49 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Tue, 6 May 2025
 03:09:48 +0000
Date: Tue, 6 May 2025 11:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
CC: <oe-kbuild-all@lists.linux.dev>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 2/2] /usr/bin/ld:
 drivers/misc/misc_minor_kunit.c:409: undefined reference to
 `__kunit_do_failed_assertion'
Message-ID: <aBl9dNOxw+0C+6UR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 0182defc-88a8-424e-6450-08dd8c4b75ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sWvQP0MvXr2FmUj5Bqq+ya3V7fVRcSJiNSkQgPe2oz02y/kUvXDvypOWqlSx?=
 =?us-ascii?Q?vho4Uu7VRX8t0SuAHQHRX0BtwEYgtaJ+d4DK5Idc+onpXwMTecu81/Eqs+3n?=
 =?us-ascii?Q?sE/cfKrBMMG8VscWpHExxHLfwjsZMQiDtnJniNv70zaQjbTPxscklValR8gQ?=
 =?us-ascii?Q?tgJQHtRTx30WiiQad32cPtqSbZBdpiXxBJsLAH20iv/4QKli5FdGu3wyxrX8?=
 =?us-ascii?Q?y/VSe+0n2F2kZE8uGR7dzQSRaodgLu1eivaSL1/QBn0Tz/HPkPNJClLOCSpo?=
 =?us-ascii?Q?Xb0VrMpkv/J8tXOlz8RQxDodf2ivuxHOXsCI3sl35YuKBLO5jacKWUoPew53?=
 =?us-ascii?Q?kHvb8uCMBV6HhuHD8FnM/XXy86Hn6axN+N/bMfV0FkDJUKLMYbBe0Ywc6oSb?=
 =?us-ascii?Q?vKZEib1s8SAj0+QaDTCPIlSZStREELS5dM6PorVoQkIoBfq8rUBV62kTRrRq?=
 =?us-ascii?Q?EEAkdOmj34udTIuvOLPxTGAvxmKeA2dE1ROY0LXmw05E2KbNZtD3bz5b/oQD?=
 =?us-ascii?Q?1WqCA8aoClxVsL/HRK0+f/5YQCMjDsvjtwKASwp5Pmhua/LUFT+87o5uGbfK?=
 =?us-ascii?Q?CRcesODCqAjekq5JaQl+M6WvfDPAqccHJ2wS0s7HCOnOsaAsT5xdtoMSvhb7?=
 =?us-ascii?Q?+2DV75b7IsfrBppCHSSmS/ZR/SMwcczgF/yl0MdCWU9Vs+o48WNDx7fK75zs?=
 =?us-ascii?Q?rRtKYOSPdlSAHii/IBdPQyxxLoQpAhcogocr3L9hn4P7mLgMfjtfphtR9Gd8?=
 =?us-ascii?Q?aPCYgo1/kCTDsT6X2+GGMB5hUVs+HNOD0nNaVTa1euOhnEvCoZhpgY0ZxoDg?=
 =?us-ascii?Q?vNiKVmCQWQ0KJ2B7h78QrsndqPouuWjN3i3cYLMiMVwMO4UdElJ4pGEowXMY?=
 =?us-ascii?Q?j7+S58y5BNYlWzLHs56ifY1IWvzXIWC6lp+0rZSxR9MLur7iUXl/oXsjKbyC?=
 =?us-ascii?Q?GP7UjBhgm/YHTMSkwZP83zhSo6H8at8IsBoAKVri/gS9DttXdhOkyoC9Bhg4?=
 =?us-ascii?Q?k8nVvqPxKm7oMIurt1uRdSwn84XVQIfylmOlMpbJD6estTp7kIAHdPQvQmin?=
 =?us-ascii?Q?8At+VukK23Q+feEQ4hCvZgRJ6Ldg8NbfhjEUquZS7l3sw5ZZFBnNX2uyWfxM?=
 =?us-ascii?Q?5Sqw5CX9Si3aeoGi9QFLBW6dSDOc6AeIkkZplneavhsyl7WxFPJNlpgGJXyx?=
 =?us-ascii?Q?b86n7KttrIBaxilh4OnzP+WH0Gw43QB6vw77KPLMjZoNnVxP68am7cNqLQ+f?=
 =?us-ascii?Q?Y0vp8jnhLH+BiCDyZQCMUXkueLZPrig2k+aXbw6E+FKtG5o9xFi17ZOsKHJt?=
 =?us-ascii?Q?J5NhvB5Mv/BUqdOWZZKpADUB04IZ7fmYQ8jz+02rgeeC/INW+qXqP3C3RW4b?=
 =?us-ascii?Q?dQ54/HxCUAdeawcErx+zd7KN9iG4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nPlB7Uj09bNNxeisF6uqTN7fkUV4ArubAVE/QuheC6YA9m6dT6ku8Zy+VxCL?=
 =?us-ascii?Q?FoPLY3QHnD+BNW9i4aKpnRl1R+ssPkB4ZrqA6hThAqnNDnLzcdeiz0cjykje?=
 =?us-ascii?Q?OtN2LKPX87937QdmFEB0BucU7eUxGZDe/SvPisHe3q9IV4nyisCfD23+rfDO?=
 =?us-ascii?Q?Mc1nJ+uOo1fCrs9GKEceR67vjfHdIB/TDAflVUaG7WFLs5NEr7MPrw5SYAe2?=
 =?us-ascii?Q?wAgymWjtAnlqrmLGCf2aH8sVEtfQxyPD4Cb7wXWYbhxxvkB0aWYApV+Ln9kx?=
 =?us-ascii?Q?7aXb734dK2cmEh8ByJ/Q6yr9iXUgbbqa3jVG2mj8f7QxoIZqp2o17rpXKJ6L?=
 =?us-ascii?Q?MWGJM3LO1vA8obf3hTjQXradyjPFmZvwP8axboFw+wBkziuERwFs0tgSVlSu?=
 =?us-ascii?Q?5zIX7AT1yE6T44samWjiU7iESa/wwBblBXrHEfn6BWzbPuvVUbcpuKy4acXq?=
 =?us-ascii?Q?IFFBUgdebFd06mQm6PYEEAvRXa8cY/Znr4Y0LJgki7G2bHr5XsVN28P926f/?=
 =?us-ascii?Q?M3ZprzsGvVEgYXO6q66L2wts3I00e3M4mq/9rFol2lLOS7KBBf0QGPvLBdAN?=
 =?us-ascii?Q?LtKn/c22kQsOHzaE05SyMyQL27lp7DR46nW/lwoFR4G8oU1lXwB5d6rDP2vk?=
 =?us-ascii?Q?IEVStGvAjIfz4U/4pvhE4F6T3gTFUqlmy8dO7ILbd6wRUbk2EkzxXhhAtWvN?=
 =?us-ascii?Q?/EnWDokI1i8sUnbjmggdmPhH+ds2TWqqpjdTtYmmvdsbz2sDKHLuvSz6yefx?=
 =?us-ascii?Q?+C0z2lXp6xOSpUPxMM3tjHQWYx2XAWLdMndioDVtqd1kQraQ13DIYNuh+Het?=
 =?us-ascii?Q?JoEXY7mf5vlzTcZRGbeYdQWiQ14cUlgiuMnQZuxXts/Wj9QF6XDdOW3Ccinz?=
 =?us-ascii?Q?XMe27EHrqmjxDjR2IUfXPPmeg28Wr7gCiY99phh2JMi46hqOEYd57346kKiP?=
 =?us-ascii?Q?drCDpUNkJ0ZxkMMhjtOWbUnHFyr4qze6zIDlYIrQigA5lcJBx8Rv5WnbqeY5?=
 =?us-ascii?Q?gdn9N1mfpAt3eFwS7554LoY19GI0JnbnfiR8skxK4QnW78IOOqoybe53qu8U?=
 =?us-ascii?Q?Wml41tnjXKR3NFJKzYBPSROyfqudJZCMnjhlj5LqkzCMuEIw/jsJP+SgvQj7?=
 =?us-ascii?Q?7D24vDdcTPg0ZL97LUq5NGsAFjH6uN6h/p0E7skTZpm1kxo0L/20k2Ts3V5+?=
 =?us-ascii?Q?cDUIj6WzH6WbJNimOATIjc7WKNxa9IM40G2mZl0+uEjligbyF1rbu0uQZuyt?=
 =?us-ascii?Q?MYNAEwxAFrs/XmVhIRCZqw08xR90ZZwpC0Jz6EAs8DG6mduxJie+8xouEikl?=
 =?us-ascii?Q?D8LwlDF58iQO1ERuaCKkBQOrUnm3pWhXFY/I4WBJifcd4tbZH2DdpSL+gzFF?=
 =?us-ascii?Q?fl0gzqOqJggTpZrTCUTsO7Qg9efiT7FwU5ojP3x2/wZ6dOyl1mUvLK3PrE3m?=
 =?us-ascii?Q?wjkta2ISgtJe/2NVXTEQzoIRQhheP2qxFxW/Y9SeZQYn+VzeoAdg/ohZENvV?=
 =?us-ascii?Q?RBci7iNNkzLURd6ljPWS66ulCvyndSwhAX6yN+vqyvXnRN8D3thiMJLLZip6?=
 =?us-ascii?Q?2Zz3R1z1HTRPsv26ewMGQILKGxJfrvir+qpNexKD6shamrNfPCujGahUM+IN?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0182defc-88a8-424e-6450-08dd8c4b75ad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 03:09:48.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmwL4Bzr8LKfOB3slWhOQ3YG4sH8p3UKbXyVbL1oMemsom69R+vSCQBBkQYnacvBpX26S6H3MykHjKS62DPxpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   20acf4dd46e4c0905676ad2a1d9a32041469893f
commit: 20acf4dd46e4c0905676ad2a1d9a32041469893f [2/2] char: misc: make miscdevice unit test built-in only
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: um-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505010835.hNm1lXeW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010835.hNm1lXeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010835.hNm1lXeW-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_error':
   drivers/misc/misc_minor_kunit.c:409: undefined reference to `kunit_binary_assert_format'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:400: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:408: undefined reference to `kunit_binary_assert_format'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:409: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:399: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:403: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name_leak':
   drivers/misc/misc_minor_kunit.c:344: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:344: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:366: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:351: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:343: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:350: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:357: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:357: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:365: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:367: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name':
   drivers/misc/misc_minor_kunit.c:308: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:308: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:307: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:311: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:311: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_minor':
   drivers/misc/misc_minor_kunit.c:281: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:281: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:282: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:285: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:285: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
   drivers/misc/misc_minor_kunit.c:253: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:258: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:259: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:252: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:253: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `kunit_misc_dynamic_minor':
   drivers/misc/misc_minor_kunit.c:53: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:53: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `kunit_static_minor':
   drivers/misc/misc_minor_kunit.c:43: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:43: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:44: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `kunit_dynamic_minor':
   drivers/misc/misc_minor_kunit.c:33: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:33: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:34: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
   drivers/misc/misc_minor_kunit.c:99: undefined reference to `kunit_log_append'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_can_open':
   drivers/misc/misc_minor_kunit.c:192: undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:192: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:188: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict_reverse':
   drivers/misc/misc_minor_kunit.c:588: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:588: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:605: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:605: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `__kunit_do_failed_assertion'
>> /usr/bin/ld: drivers/misc/misc_minor_kunit.c:587: undefined reference to `__kunit_abort'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:594: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:603: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:593: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:604: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict':
   drivers/misc/misc_minor_kunit.c:552: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:552: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:551: undefined reference to `__kunit_abort'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:560: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:560: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_basic':
   drivers/misc/misc_minor_kunit.c:232: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:232: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:231: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_static_basic':
   drivers/misc/misc_minor_kunit.c:213: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:212: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:213: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision_reverse':
   drivers/misc/misc_minor_kunit.c:507: undefined reference to `kunit_kmalloc_array'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:518: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:518: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:521: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:525: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:526: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision':
   drivers/misc/misc_minor_kunit.c:466: undefined reference to `kunit_kmalloc_array'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:482: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:472: undefined reference to `__kunit_abort'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:493: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:473: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_only_range':
   drivers/misc/misc_minor_kunit.c:423: undefined reference to `kunit_kmalloc_array'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:443: undefined reference to `kunit_unary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:443: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `kunit_fail_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:439: undefined reference to `__kunit_do_failed_assertion'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `kunit_binary_assert_format'
   /usr/bin/ld: drivers/misc/misc_minor_kunit.c:452: undefined reference to `__kunit_do_failed_assertion'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

