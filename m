Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772A146A69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729149251; cv=fail; b=CFMHx4l5DTMoPufLxFGANWPXK82SoTczki9lWf16sjZq0oy3T+0XYJ53/itCwBCAq/ofVp7Rrs+UD8AnqXQfkgzORQANfir8oX1kCcp7Sf6Wqray/1WxOFCaDsEjluyObNA7+tnTsybQcoCEYS66QM+5N8pH8hf90zgD7b9AIbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729149251; c=relaxed/simple;
	bh=flQXbKI6HGhvP9W4NO4QST3C6h1isOeQK2sy6Rdp+Qo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VI8PdPPrWzmKvRcrggAtcWRToznUbim7kisXPQuwdoNkgyJR4p3vlL814pWGLYsxpal+zM5esF09j990Ttlt0JR+buJgiFug8hEMm/ODxAXffyWJJRat/K9I2DbWTu0rHvyhgzbUXXPKC9KfpkkgT9MQc6viaf5hBNRv+0uLOjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/Tlk/Hd; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/Tlk/Hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729149248; x=1760685248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flQXbKI6HGhvP9W4NO4QST3C6h1isOeQK2sy6Rdp+Qo=;
  b=e/Tlk/HdKp7GmhCJxivSAoQf6t3tvT5gzgneIqk2CO5AijyscskIOHFY
   HJyG7lD57GtDAvRy9FZuodMwD4TgJU8bcQB7y1uVE8Ah7HCl0IAhIj737
   lMv1KvY6WcN7QOXS57ls0aJngksuPLYkCk7ywpnNXIEBatsWgrJWq4FVw
   5aVp7DEKnuZzk/T0icVE2G1sKpoYudPyRAj8irLY2OBY5QP3x8LZBMxle
   4K5srYnEcSuchYxAnUJXTS/D6e9/yqsoGwPcjdVBsim9g5GeR2lQxVzeM
   OLTazid6DFNTiWs2Z0zHCGKt4op1pAHQFTdHfuUNvYOKGwN/1xZvOytj2
   A==;
X-CSE-ConnectionGUID: FQZ+5PH9QceKpC5263n59Q==
X-CSE-MsgGUID: zflsbl7eRimpaWJpAOq1bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28829190"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28829190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 00:14:07 -0700
X-CSE-ConnectionGUID: O7MqulGLRBasik0bN1GdAA==
X-CSE-MsgGUID: HqlertwLSSKx5pj8MjlfTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78075144"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2024 00:14:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 00:14:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 00:14:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 00:14:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 00:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6mvUXl6ssRGBZuS36pAHa590RMwjcXt471B+r+kNhW5bOTt4etySpyRuf2En8Lgkulh6HAsesVAW8GPDJwk+VYL/pKaPl5BJPpikmpuk+ic9BLT1kAxYoKAgGlHy72MofhcfomkwysOS9HDpN/i6+fRDyL0XC7ZwXgHD1w+cth2F/hA6tiMBBPicPzWlWzLPnlLFiHRDj0Cvshy3bloReO4U7ptQ7yrObOe4SmQt2fxcCm7iTAoxU+Wbft9lN1FQHKFqnCMKYIryFL0pB3fiKNpaWE3TIsW5Zf4Su5hsRao7PnkfARf/OU0wNhTMREvS7ZvQjZIE4ik7vnkHpeImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7G6RsaFG8QfD/InEdXDnWIYGjnk+aXLejZ2/+brF9s=;
 b=XyJ8hVg4XrNQr1xqWH1tcijr1227c0otXJB6LjdRLBbk4rZ/xcOh0aOnwn/9qmRyg69ikl7tNqEFoJYZoKcMU62eP5zA614yNz1ht/yQF7FAjzFUEMKi/S4rtEUYF7ri8vN1bQh9HIQCIdUXmOyBngqlTvivP75QMfLeLj8AQpZwzox7EuYjN96vv2wAzbN/lddZkn6hpxPM/UnluzH94fFwBkHM+Ur2PHNdp4t5ttHhMg2363u707LpvYjKnlnLs4iNuVltuuxZRkDm95vXmIWtipRzhYal7FzRg4hVnP5sae0xUzvqD5T+QBW04487GaOL86E9E3Vf9mWMWD7gJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 07:14:02 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 07:14:02 +0000
Date: Thu, 17 Oct 2024 15:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 32/44]
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning
 (avoid_unnecessary_addr_size):
 /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <ZxC5Mu8DdKDCfovq@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6b47d2-1944-435d-4cbe-08dcee7b4730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cthdg9feNTwpKLtu3lipuvFP/31kyrGaolo6Z8tXAS7W8vK8Hfp7DMC5Lgn6?=
 =?us-ascii?Q?vMxSJKqyDpae695q7pmTWTyF+inz8BEDxezVcALrAihwQ0u7a5Kh8dsOuV1e?=
 =?us-ascii?Q?3iHS6JD+l1bIt7r1nckuJrccdD/5FdIoNkd5xe3UwEGmWl9aEBzKyeUw80xP?=
 =?us-ascii?Q?zP7Q5UqpwEox7TBps8bXfHufOlcMFNYFNLZl/qJ/G51mVJXwabstg7JMQxCZ?=
 =?us-ascii?Q?dlbAYNPnyltz6vw/3pRIeVa3S9+43nabyCsQggHGavmaa8xHfbXAezx5f4LV?=
 =?us-ascii?Q?JrUS55Og6L9tv/LpAMQReUiRYh58I4H5rkA5VeLDdMvusjpQoLRi7HV6ceW1?=
 =?us-ascii?Q?j2ZqOQp7rbJA/01NGycjboYZGSb4FTImKs8+Xnm1KQzzF+8U2TcXOmCmx7qC?=
 =?us-ascii?Q?cM0SbfI+8IEFRqWz6x7NXhMfOrH8sbdy7EFUl0+1I1LehwpnHTXk08k16epM?=
 =?us-ascii?Q?O1fKIA8Y5bDX1kRbRWYMQQzFPOVgK10tCqha5oi2oSmUMhziBcUT6x9mmMTl?=
 =?us-ascii?Q?SP1CugvodvJ6ZozQbbSm1BoXgHHBy+MFhj6KuGrk0U0V78C7AKYv6LYHOiNo?=
 =?us-ascii?Q?D+rqbDDXR4YZKoa7CVIsONC8vXJpOOt4RMuXgLmp6wGzUQV/ZNrroEvuTHuc?=
 =?us-ascii?Q?J9PVMu+SMZEytPDfiIynAa+3Jk/YuShct/ndWICLSM9Eij4hHr0ScU2flxIj?=
 =?us-ascii?Q?H+NNsi1UUdfKtvoUr6D1Kw4lL67UWazPziRpXVeHK+X8qL8MiHZS47Bb4Qe5?=
 =?us-ascii?Q?IcOeBNXfmpd9a8ZoAAVLjQN87D62UM7Fk3QCi85/Xc5zrOs7H351q3FbHYfE?=
 =?us-ascii?Q?JKbiuJFlQbF3aKLBu2paz0DcuZTVWupoSf+KAbclId+oFm31UYzpEIHa9tIW?=
 =?us-ascii?Q?uS8/G1vSKknqwFfiCc70eeFjgR+F0WmIq28zVfigvhEMhSldQkIaidPzBztb?=
 =?us-ascii?Q?zvqglM7BjOK+2iQd8HdiFQaA5+nmi7wGtlemB4AHAH9Fhwgmp7Q86OFeyhtS?=
 =?us-ascii?Q?5TJVINTFkf2UmB0/TmAwSjqcC2uGcWMcq9o18CMyzUK/sIWK87JJkDrJLDnn?=
 =?us-ascii?Q?0DFslwH0NDd6/34gI/o7NxDN+OPR49OfpzGr3vJDb3DVqvwFyk4KNJRd+AKa?=
 =?us-ascii?Q?1bjMQLFTidb3S7NH0nmPo8rEjva3OXfliqziYdgCzbYlgi/YOmaPXvKGs/jM?=
 =?us-ascii?Q?Va+w8kdL4S3F/R+eVD89hJN9GNMOVgZdpIXQc/2bORmoIm+Ty9qSkyoPsFyH?=
 =?us-ascii?Q?i8dtm+erZX4hKPE6OwnakEk4s6l7NCMjv97WT6TmPbDxY5KFhn9QuaYMOOlV?=
 =?us-ascii?Q?4Pop98AknAUhRlC1vFORuF9k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?blVqsEKA1beOTU/VwfkQgEkVuqfOd4GJyo2SZ6HFpmoyHme8y/TYNCYGPua2?=
 =?us-ascii?Q?I9h9KqjNJ84haWEhWlRe2ZST6ubb9IvHgdTSOgu5o1zuRVY7KJcORz7uIrL6?=
 =?us-ascii?Q?rSMIStEeWofy2zOhHimiK46Sco/QQBYodZtDpf38yKubfdF25PoLvnAP/rSY?=
 =?us-ascii?Q?qkd3mEAp6lA5B+LlJSqvrjrLANXHsdl/+7XKFkUeT4YWXhspuzrRAVGcGa5L?=
 =?us-ascii?Q?K5l5GTkK+nBswXfUFT9NgC4StzGFKqA05ubK158fPjNeZDKgZ7Gt/DbStY6j?=
 =?us-ascii?Q?jBWELVuu1kJprGtEUSQ86/d8kxE1eyNG/OVIJgo0c2wCUPv3HifcmA2Y7p5t?=
 =?us-ascii?Q?7QEov+O09tHCl8c408HgSWc4esO7T6KIW3iNje5yJsz/allwyTQesC24KYGj?=
 =?us-ascii?Q?L6fKuse71AspLkPmv31LCi3X9GSjrXI4KvROtIWFR20AB3UnlKq58se5fidD?=
 =?us-ascii?Q?t3K7WZR/C488hsjbQBVYr4ogcFoFje7wD17sfGlezn0ySWH37Jspc8N+IARJ?=
 =?us-ascii?Q?/g6f4NvBj6JAojzaKumeFLOBxXKQA6dlyO2aXfkq7WC86JWljFcNLHDFH1PI?=
 =?us-ascii?Q?GbXWLsOnCZU8vGmGBrYTXnR5yQMmMbwwJbjAC6kqPknNTtWNoUqLJndX+QN3?=
 =?us-ascii?Q?smNtyr5rQBU+E1t6+jAU96uznBcZQdMRUIvc3eh0BGIUP1vX+Jxir7OQ4Fir?=
 =?us-ascii?Q?kdTHKxzipjvpWpYUh5eeejzu1irYB2as0SqBras8iX//EotL2SVJubB4nHIl?=
 =?us-ascii?Q?aCF/woh1OSA1xwB1i7g1/t6XFIkhRENFiTQwB3ZQfr5TMlK84U5NLJm2GqXl?=
 =?us-ascii?Q?5csRF6YKOzzxND7OxZUajCG8rWgq3wBziao6NmtfEyq2EJ39T3QiRWunTG22?=
 =?us-ascii?Q?0DJfJZpOcctWNruQTan18P8m/1lMabG1CFGbZTkdToZQqXwgD1w2X2ItazYb?=
 =?us-ascii?Q?8Z0X6F+FyTTNTfZjejPQ6xgwh8GBoQmbG0JhlYfZUGI6WNxOz3g5RQTzfYjp?=
 =?us-ascii?Q?tPVI9jXhuUUcKa/M2KVpQKILqAUt7LcKAZO4rMhD1QzNBVqivUGfKriY9vJs?=
 =?us-ascii?Q?Kvp35VhyE+Nfs2tjhnhxU/hvyGSqRl4k0x/URFCwXV5r6UsSjSYqkJuDR2YV?=
 =?us-ascii?Q?bhB+/9f61p43M/tbzh0VNWytNZKuDvzLYNneJsSFsFc9jyx2Y2YCehrkENre?=
 =?us-ascii?Q?3sBBh8aopVPaEZEeTzoUhKByTSMmD+x/ZI0+unH+KZb5d8PS+UpIi1gWebKi?=
 =?us-ascii?Q?qsVm/q2g+7ajSMcUEV2IuVcuvmf099sme8obFKoYfKq5m7f1lKtRXODgVCDS?=
 =?us-ascii?Q?yE9Bxj7zpFLMdKObS0Ejzf13PTPVfMLV6QcGMfHvb266B/seDFFw0GO9oaLs?=
 =?us-ascii?Q?/eI+6hMcvKOhC7a9TxkIWqABwJm630gHq64Ek73AJSs+ERuZNOrrML2HTVic?=
 =?us-ascii?Q?GjjsJdRoqstgmWCy2Fn1PGgmafMyLTBqxmlIslAVfhfxVdIanS/ZOdeq/0qQ?=
 =?us-ascii?Q?pWbdOD9ywsDQBLG8lKEoOdwvBwjgmHep09fh4VQPrI7FjH1Un1baZ61rlFwJ?=
 =?us-ascii?Q?tClB33wIURIk3cHIBYtdezvnPdPg3j+rp4NhhIfIRhuBvMXvqo3Jlrsbjz8k?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6b47d2-1944-435d-4cbe-08dcee7b4730
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:14:02.5692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nj65BOvAe16Ul3q8DUoHAEZo9gk1bVXgqo4QJmBEymkQT8NUgPlJmisTqbb3m8bo0bcpVjv8WeYo477O0g9HaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 2640dbd4d366c468dba3337bf5aa5d8d32c63248 [32/44] arm64: dts: k3-j721s2: Add node for OSPI NAND Flash
:::::: branch date: 35 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241017/202410171420.mPcAisyc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171420.mPcAisyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410171420.mPcAisyc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:523.21-578.4: Warning (avoid_unnecessary_addr_size): /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi:1353.34-1362.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi:469.21-521.4: Warning (unique_unit_address): /bus@100000/bus@28380000/bus@47000000/spi@47040000/flash@0: duplicate unit-address (also used in node /bus@100000/bus@28380000/bus@47000000/spi@47040000/nand@0)

vim +523 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi

dc3281f7ce6010 Aswath Govindraju 2023-05-02  463  
dc3281f7ce6010 Aswath Govindraju 2023-05-02  464  &ospi0 {
dc3281f7ce6010 Aswath Govindraju 2023-05-02  465  	status = "okay";
dc3281f7ce6010 Aswath Govindraju 2023-05-02  466  	pinctrl-names = "default";
dc3281f7ce6010 Aswath Govindraju 2023-05-02  467  	pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  468  
2640dbd4d366c4 Apurva Nandan     2023-06-08 @469  	ospi0_nor: flash@0 {
dc3281f7ce6010 Aswath Govindraju 2023-05-02  470  		compatible = "jedec,spi-nor";
dc3281f7ce6010 Aswath Govindraju 2023-05-02  471  		reg = <0x0>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  472  		spi-tx-bus-width = <8>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  473  		spi-rx-bus-width = <8>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  474  		spi-max-frequency = <25000000>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  475  		cdns,tshsl-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  476  		cdns,tsd2d-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  477  		cdns,tchsh-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  478  		cdns,tslch-ns = <60>;
dc3281f7ce6010 Aswath Govindraju 2023-05-02  479  		cdns,read-delay = <4>;
d144560c3191b1 Vaishnav Achath   2023-05-16  480  
d144560c3191b1 Vaishnav Achath   2023-05-16  481  		partitions {
d144560c3191b1 Vaishnav Achath   2023-05-16  482  			compatible = "fixed-partitions";
d144560c3191b1 Vaishnav Achath   2023-05-16  483  			#address-cells = <1>;
d144560c3191b1 Vaishnav Achath   2023-05-16  484  			#size-cells = <1>;
d144560c3191b1 Vaishnav Achath   2023-05-16  485  
d144560c3191b1 Vaishnav Achath   2023-05-16  486  			partition@0 {
d144560c3191b1 Vaishnav Achath   2023-05-16  487  				label = "ospi.tiboot3";
d144560c3191b1 Vaishnav Achath   2023-05-16  488  				reg = <0x0 0x80000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  489  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  490  
d144560c3191b1 Vaishnav Achath   2023-05-16  491  			partition@80000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  492  				label = "ospi.tispl";
d144560c3191b1 Vaishnav Achath   2023-05-16  493  				reg = <0x80000 0x200000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  494  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  495  
d144560c3191b1 Vaishnav Achath   2023-05-16  496  			partition@280000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  497  				label = "ospi.u-boot";
d144560c3191b1 Vaishnav Achath   2023-05-16  498  				reg = <0x280000 0x400000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  499  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  500  
d144560c3191b1 Vaishnav Achath   2023-05-16  501  			partition@680000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  502  				label = "ospi.env";
d144560c3191b1 Vaishnav Achath   2023-05-16  503  				reg = <0x680000 0x40000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  504  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  505  
d144560c3191b1 Vaishnav Achath   2023-05-16  506  			partition@6c0000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  507  				label = "ospi.env.backup";
d144560c3191b1 Vaishnav Achath   2023-05-16  508  				reg = <0x6c0000 0x40000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  509  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  510  
d144560c3191b1 Vaishnav Achath   2023-05-16  511  			partition@800000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  512  				label = "ospi.rootfs";
d144560c3191b1 Vaishnav Achath   2023-05-16  513  				reg = <0x800000 0x37c0000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  514  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  515  
d144560c3191b1 Vaishnav Achath   2023-05-16  516  			partition@3fc0000 {
d144560c3191b1 Vaishnav Achath   2023-05-16  517  				label = "ospi.phypattern";
d144560c3191b1 Vaishnav Achath   2023-05-16  518  				reg = <0x3fc0000 0x40000>;
d144560c3191b1 Vaishnav Achath   2023-05-16  519  			};
d144560c3191b1 Vaishnav Achath   2023-05-16  520  		};
dc3281f7ce6010 Aswath Govindraju 2023-05-02  521  	};
2640dbd4d366c4 Apurva Nandan     2023-06-08  522  
2640dbd4d366c4 Apurva Nandan     2023-06-08 @523  	ospi0_nand: nand@0 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  524  		compatible = "spi-nand";
2640dbd4d366c4 Apurva Nandan     2023-06-08  525  		reg = <0x0>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  526  		spi-tx-bus-width = <8>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  527  		spi-rx-bus-width = <8>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  528  		spi-max-frequency = <25000000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  529  		cdns,tshsl-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  530  		cdns,tsd2d-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  531  		cdns,tchsh-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  532  		cdns,tslch-ns = <60>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  533  		cdns,read-delay = <2>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  534  		#address-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  535  		#size-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  536  		status = "disabled";
2640dbd4d366c4 Apurva Nandan     2023-06-08  537  
2640dbd4d366c4 Apurva Nandan     2023-06-08  538  		partitions {
2640dbd4d366c4 Apurva Nandan     2023-06-08  539  			compatible = "fixed-partitions";
2640dbd4d366c4 Apurva Nandan     2023-06-08  540  			#address-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  541  			#size-cells = <1>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  542  
2640dbd4d366c4 Apurva Nandan     2023-06-08  543  			partition@0 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  544  				label = "ospi_nand.tiboot3";
2640dbd4d366c4 Apurva Nandan     2023-06-08  545  				reg = <0x0 0x80000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  546  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  547  
2640dbd4d366c4 Apurva Nandan     2023-06-08  548  			partition@80000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  549  				label = "ospi_nand.tispl";
2640dbd4d366c4 Apurva Nandan     2023-06-08  550  				reg = <0x80000 0x200000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  551  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  552  
2640dbd4d366c4 Apurva Nandan     2023-06-08  553  			partition@280000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  554  				label = "ospi_nand.u-boot";
2640dbd4d366c4 Apurva Nandan     2023-06-08  555  				reg = <0x280000 0x400000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  556  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  557  
2640dbd4d366c4 Apurva Nandan     2023-06-08  558  			partition@680000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  559  				label = "ospi_nand.env";
2640dbd4d366c4 Apurva Nandan     2023-06-08  560  				reg = <0x680000 0x40000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  561  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  562  
2640dbd4d366c4 Apurva Nandan     2023-06-08  563  			partition@6c0000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  564  				label = "ospi_nand.env.backup";
2640dbd4d366c4 Apurva Nandan     2023-06-08  565  				reg = <0x6c0000 0x40000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  566  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  567  
2640dbd4d366c4 Apurva Nandan     2023-06-08  568  			partition@2000000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  569  				label = "ospi_nand.rootfs";
2640dbd4d366c4 Apurva Nandan     2023-06-08  570  				reg = <0x2000000 0x5fc0000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  571  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  572  
2640dbd4d366c4 Apurva Nandan     2023-06-08  573  			partition@7fc0000 {
2640dbd4d366c4 Apurva Nandan     2023-06-08  574  				label = "ospi_nand.phypattern";
2640dbd4d366c4 Apurva Nandan     2023-06-08  575  				reg = <0x7fc0000 0x40000>;
2640dbd4d366c4 Apurva Nandan     2023-06-08  576  			};
2640dbd4d366c4 Apurva Nandan     2023-06-08  577  		};
2640dbd4d366c4 Apurva Nandan     2023-06-08  578  	};
dc3281f7ce6010 Aswath Govindraju 2023-05-02  579  };
d47dd257a5052f Rahul T R         2023-05-26  580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

