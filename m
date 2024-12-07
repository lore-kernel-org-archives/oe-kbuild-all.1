Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FA22C6CF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Dec 2024 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733533232; cv=fail; b=jtj1xXLfyYrKebSQwIs//l10btaM0vL2zRDSangIobFLV+ZlqoPGDGwQojOFXYymXyk4q/uWacjwh67OF0ZM1eAWaswuj+GecqKILODIHgWzAWW2tUA0Tx58iFFkigqJUakRUwiOkXJFHilOQkHW2BMdR77FJ2HwGQlRNGfpOxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733533232; c=relaxed/simple;
	bh=tODsfJBxC6uiAG6XSdrTsYwlyKFbsvDldWQ9cCIPLag=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UP0XJ/rKOYFon7LbQ4GbK49+1BPPn1S3pKgLXSTR6fLJgIe7+CfWnpoB5qOedPQ5z/rdSglS4ZV96O0/Nn3+GqIqGrpF1SDkoWnhGXoEkbOeWaPTujR/0UKqnN96JHFM2N6DThjtv/hbMnkz3hg7ELbIC4dm/BWWxEnwY06kVg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lm6CPNmz; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lm6CPNmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733533230; x=1765069230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tODsfJBxC6uiAG6XSdrTsYwlyKFbsvDldWQ9cCIPLag=;
  b=lm6CPNmzO54jYVbGquHQDNEV9G1JIa19AYgRf9ANze/Pe+slm/2z50TZ
   By9TyPpA859/BIowX8OlIzcvR9SU94ldGqZ+hWv96QF53cCDnZjvlrbgl
   lyAJEMO57rhn1HnIRVQ970b0VQONrelk4J7zwo7LR8vkhfQK9batJCp3N
   pvsaBXqpAKX9jQcTLr7PjwdHQ9Ao6bjpEzHqKN7Ll5E2pwT0wTbXTCeL1
   2nQfQ3hZr6uU79RF3MWzhQ+qxQRi3QQz4mF95Mplg64i68JPXu28wqElD
   mdaOFzBAeLrq71S8a2Y/PKzoSJaaNFdQN/nA4fVrBuJtlBQF4UGDmX6Mb
   g==;
X-CSE-ConnectionGUID: YCCvWFAOT82WzQqXuGNxkA==
X-CSE-MsgGUID: SpBREUpbRR2QmBmPvbXTcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44574271"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="44574271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 17:00:29 -0800
X-CSE-ConnectionGUID: Wq332wHDRJ6/xdt8wwLzRw==
X-CSE-MsgGUID: 4EGMqf2GRm2S0ULZbSftnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="95344867"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Dec 2024 17:00:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 17:00:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 17:00:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 17:00:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHNmrtujskcJHWGzNOAAWiK3a5n39X+VX5vEhhcOd5XmFVOXCijPtdj1s4qfGw88d8lXxaOG0KFWTpQCquGNkrG/76KDJHODSyWXNfb++WXP6xz4Rzv9GTxFYRCXIlSzq3qkRoZF0/pTkdP6SEJQqBn57VC0qHkn05KOqoB8PzqIMK/sqjSv2ig/zKXPxfaVl0d0ORt18ZmKejqv78+MoA3cbmAZeannxKSYeKGNeSxzHwqkeGWKZToEs4CkdlATfgFkdgVWxgLJJzdd2Dhwk+c/43+eiO+gHlCI4o/PtVLA6c2YgIGpaoQJitfELlyHUuJzHh/8f1LF+YeZaQZT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzoYRqroqOR5BHChXH/3Erm2PV2W7VPie8auMVgNtuM=;
 b=iO6bNyLj2SEYOOQFDTtdqhCYNDovTybvLwLUu1Km561gvwcB5qEYmVfeS3OkuhEfAHUru321EXJL0v4hPXr6CDHFBKqyprSnr8XVpjG0gm8wwxjpwxhDfyFvlBaRrbz/RPtZwdzwur+mRiojJNlp5wxOQFLoO+utaRKOzhtLL6Eb2DlW9LvqvBYx7Y7w63I4YjC0QBAX7JKVwG6l5W2cmAzPx77L3L6d5BeCZRvu6lRF2VHcbNdiXSZOgArZk9wtDrrrXNAVFfPFDoJ0PAPxyLWb8fq01AYjw+RENYKBr+qJ7UFLGQbgfyruofSXioV3NWemXXi/fRVOcGlOajebeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 01:00:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 01:00:13 +0000
Date: Sat, 7 Dec 2024 09:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: <steven@liquorix.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [zen:6.12/zen-sauce 8/31] fs/bcachefs/chardev.c:615:1: warning: the
 frame size of 1100 bytes is larger than 1024 bytes
Message-ID: <Z1OeFowx0f54acz2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d9fb4a-cb8d-4e28-7237-08dd165a8158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MsqhfsLnsE+EFZNt9yXHFXLSLZJF4HM2BtUt3M5/ChZ/ValjR4XuEHpZEBbj?=
 =?us-ascii?Q?nibBdeHtOTF7mMixc8DvYXQRyyeb0kgjE1gtjN24Xsal1Q4WgAFKZl7/Xq17?=
 =?us-ascii?Q?qKKkMmDtIm7L8tmRlZW5oUaP83a4r2fY4U6u/yT2+ZXpTpy1vqJKuHQb6fzH?=
 =?us-ascii?Q?qaBMvLMBJuDqyj8v4du+18ld84rbxRH3Ya+oNOEIkcS96SeTukrtHVdNYozT?=
 =?us-ascii?Q?GY3JoiH2uQfsFC1IqYNO8J9ya/QRoq2iqZ8Q904T3Lr5cWG85uGyRgdpg0WK?=
 =?us-ascii?Q?XczpBaPBIylpZeSIAs+5JZED4diKMkobdlzSTUZKy9D8lYZBfThhf6mUYLod?=
 =?us-ascii?Q?+KJ6oQxKdnWla4k9cDRUo8a9LOtKG0juS1LfmnMZ2HsvRAIwgTSR4L9HU8P/?=
 =?us-ascii?Q?/7ISCImGBsuafFvlKYq1eGw1+AtLbDC1AJ0wNR5XPUR1nvAIYdbTFMFZO61E?=
 =?us-ascii?Q?7SdypEZzxA4gYKTiAw5VeFbUWfe9OHoVpNyChzOHcdvYDCiO1UjDsxuScRPU?=
 =?us-ascii?Q?fUNT/Huqtd/B8saDXdwnERIfqUcQTliK0TtDEysGh+YOZQFw+SzO8+LIoB23?=
 =?us-ascii?Q?lekOiQee0VmUw/oohQ3m1Y3dSzUGRMxmeIUrGeEC8Qo1S+gsJNQYQjS+R1TW?=
 =?us-ascii?Q?JI5zxe2pOoLp4HCVWWjPa41BKg23QnfLwP0oRFSQ5zabGCspU51bflnWks/r?=
 =?us-ascii?Q?YMun0N2oXNS5wRdMvpz81mrRi78Cc0DiG97+McLWZoIofhKvk81SC/qEMCH7?=
 =?us-ascii?Q?Dp5rhdDzXoSbi+WD+V+RckHWHKBSdhJS0n437vRghzaDpvn/KZcoya3ZWmsQ?=
 =?us-ascii?Q?U3JDBpH/Yj6bHz+OkCL/SR9vueDXIvzAIVRHLhT/NNVixO3Ud+2Awb0sXR9b?=
 =?us-ascii?Q?5tIw9bfl045vBLCpvocV7lvk0lACG/ZVdFqQjTZu65i3dVFZcYm/bvVkAkaE?=
 =?us-ascii?Q?cBBSawlT1vf8neMBEGiC6bWesanmtbLYL3PEi0fnfy2lFB9RGKTwMhLtc8uy?=
 =?us-ascii?Q?MIse86BII0xTPADjXTRYMa0PRMfrtmXMj7YHzbpA5Tsa6nCD6r+Q8GoBjf0b?=
 =?us-ascii?Q?X9a5TbBUkGFvqlPQh3s1N1bjUsX/8GiFjV4FHlskgoMrce3bR3vHYYOQ9WyY?=
 =?us-ascii?Q?iSMGNfkfKyn76v2FogHXC4hTEdK7jqfaUPw6Pi8yAlxIALbGuVcws2ArPNal?=
 =?us-ascii?Q?K40K5ZB+Djh6shxNNeytyh3UYAdxBfG7z4rMqr5wGuyjCNmbMiyMBBdwLabm?=
 =?us-ascii?Q?H4588Dd9DAidYTLlB+DnRoZBd92aTRUv/QGh/jWURGWmP1MxzmV2aLHaczb4?=
 =?us-ascii?Q?JszkUzi77Gf1TgkaQZrk0t1V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJzsANovg+rVL7n6R+u+6ue60kO2KsEQDZPaNJcBF+cKS34oCStCmn+DI8uy?=
 =?us-ascii?Q?wxA6kuD5LQVJGYsoeY0yEmx+lHc+RDSRo57ag9b47vcpGxdtqVHZOrfm9Q9p?=
 =?us-ascii?Q?O3ZD+soEiC/AQkULYpk+E4wwq1a1TbpSZ838YGN3/uQQPqWi1XxHUIxpNUCT?=
 =?us-ascii?Q?e4TRqYINou5/+MJCs74R/4ku4TTNTtfsb8vfG9zI6XFHlgVlruf7R2sVZRfy?=
 =?us-ascii?Q?KvcLjj+MAo6yCjvxqDXQyCY9LoqY5G3MwQT3M8HoVmMq09yddw8t5wNwo6ef?=
 =?us-ascii?Q?zTIJeVTw08/OXKza0XutAIEjI/lxiHSuGcqUzHlSLCVRUnCVt+zppiSJqVtl?=
 =?us-ascii?Q?fcgM2zh8DF5+kYvoBE6DS+vO3tRT/g77TovjOMZAZwBeG1iR1NbCMNRCLg2H?=
 =?us-ascii?Q?VESrF20sgG0dtHv9+k9BTHYIsp9kZ4uY4yF6WxE6wwBHqlfW7psCK6ZQ9M5p?=
 =?us-ascii?Q?Ye23zjq9zGkrClgATWYlMZDy4rsFf6Wud49XYO3EfG1UVvXZ2E55NYJrq2LT?=
 =?us-ascii?Q?MZfkX/Zpc2MmjWKJQ4ck4k4Cgy0ytREbqKshz3d2Ymq6BFUKJDGR0K+/NrnE?=
 =?us-ascii?Q?1UOaj2ZdbmCDA2zmez+JlWzTHYHsfkKTcPxwYs+/r1jbZ8Np6Diuk/Rl4dPt?=
 =?us-ascii?Q?C426RkaA+93QOejoa87bCgDu50a1gGh7sZed8IaOosM6LzIt62rP1SRKaT1d?=
 =?us-ascii?Q?azOU573NdTrHye4naKu/q77LB3u+CCQ2H0mwchxjwpFhWU7UqX8ByMPKe9g7?=
 =?us-ascii?Q?H6FiYkvqT21UkheoFhrV2o9Nzg4fyTqf7QpmI/MfcKXAVN7IXnqR1+1J0He7?=
 =?us-ascii?Q?qxuD06Rt/06j6crKIH0BYy1lrdID7tXglj0S1CbJF2yeTL8KMdv47KZ1kgdW?=
 =?us-ascii?Q?bWTn1qqAeg+uYfdUUK8v5zzY9tBur4Y7VIeediQnfXPmXg8AaJcwQfMBa9zP?=
 =?us-ascii?Q?wOKD5PycPzmCObvVWQq8rVHHxBFk0MgxiAxbYUpLdR+/uld/zVYKsaQjZYem?=
 =?us-ascii?Q?ojXxPHvLNXEbCdTrRWL8/bta0mArA3Cg0r4XnQ13vCTs+KkBaYmQvR4P4gCq?=
 =?us-ascii?Q?r6NWpspGNMsgysC3fIxA6pzE45tzxR6fVnFbDk6fLv+whaI+/BuVBq6bUqbw?=
 =?us-ascii?Q?kjaJruYbiMxVu6ft4o/U/mKbIxyK9sA0ZfB10qdLGKf768VpK4BdwKPe19lL?=
 =?us-ascii?Q?5TR9DOrhkDborTeTj2G60ds6lv95fZ2y/bbxIZ3MiM5tnSZJgIPmCrNDb9Nu?=
 =?us-ascii?Q?UHMRjWAMsYkzWMZySRKlECko7ZLcGoMFeMkxojyJkoq3X9L79qwhD7kS+2gv?=
 =?us-ascii?Q?gCErjZIXxsvdBYQFhZ9L7hXJ13eMxml2sXUGP6YCvd2P9drQDkGaRiJxSR/j?=
 =?us-ascii?Q?8NL4pxt0Va78fgQUTPTXpc1JZFrAOLQo1H0EnqmsuPX5R6Sg5vRtn53C5REy?=
 =?us-ascii?Q?qHpFYaht/ZilAYaKj3oQL9lZNtGvpacwR6yR7c8rUMsxnvAKLka9U8R/NXtP?=
 =?us-ascii?Q?baCjTJG6fflOe/2boS5ifzjie0wlUeCM8NBQMltvv35ELRP4FMVm0hv7OAlA?=
 =?us-ascii?Q?2H9C468hjK/MwynuzfFyQirLvHSu4UR5b+OinqEo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d9fb4a-cb8d-4e28-7237-08dd165a8158
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 01:00:13.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /itYdKzeLgMygQaI+6lG2Ov5Mw3khxWG/rHBikQFAuj5p80atxKHqh16WLbaAegeM6eiKAXXAyK4Vzz7u9arvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
X-OriginatorOrg: intel.com

tree:   https://github.com/zen-kernel/zen-kernel 6.12/zen-sauce
head:   856c3874536c066b0f02b38b24092610692959ff
commit: 87b0cab8d8701db7754e5778b93ff83ffc64c7ae [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241207/202412070149.K5cFZ28J-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070149.K5cFZ28J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412070149.K5cFZ28J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage':
>> fs/bcachefs/chardev.c:615:1: warning: the frame size of 1100 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     615 | }
         | ^
--
   fs/bcachefs/fsck.c: In function 'reattach_inode':
>> fs/bcachefs/fsck.c:483:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     483 | }
         | ^


vim +615 fs/bcachefs/chardev.c

8863d1e092005d5 Kent Overstreet 2024-03-01  574  
e6674decb219599 Kent Overstreet 2023-11-23  575  /* obsolete, didn't allow for new data types: */
22502ac23a2eaa3 Kent Overstreet 2019-12-16  576  static long bch2_ioctl_dev_usage(struct bch_fs *c,
22502ac23a2eaa3 Kent Overstreet 2019-12-16  577  				 struct bch_ioctl_dev_usage __user *user_arg)
22502ac23a2eaa3 Kent Overstreet 2019-12-16  578  {
22502ac23a2eaa3 Kent Overstreet 2019-12-16  579  	struct bch_ioctl_dev_usage arg;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  580  	struct bch_dev_usage src;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  581  	struct bch_dev *ca;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  582  	unsigned i;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  583  
3c471b65889aa22 Kent Overstreet 2023-11-26  584  	if (!test_bit(BCH_FS_started, &c->flags))
22502ac23a2eaa3 Kent Overstreet 2019-12-16  585  		return -EINVAL;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  586  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  587  	if (copy_from_user(&arg, user_arg, sizeof(arg)))
22502ac23a2eaa3 Kent Overstreet 2019-12-16  588  		return -EFAULT;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  589  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  590  	if ((arg.flags & ~BCH_BY_INDEX) ||
22502ac23a2eaa3 Kent Overstreet 2019-12-16  591  	    arg.pad[0] ||
22502ac23a2eaa3 Kent Overstreet 2019-12-16  592  	    arg.pad[1] ||
22502ac23a2eaa3 Kent Overstreet 2019-12-16  593  	    arg.pad[2])
22502ac23a2eaa3 Kent Overstreet 2019-12-16  594  		return -EINVAL;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  595  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  596  	ca = bch2_device_lookup(c, arg.dev, arg.flags);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  597  	if (IS_ERR(ca))
22502ac23a2eaa3 Kent Overstreet 2019-12-16  598  		return PTR_ERR(ca);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  599  
3d080aa52f6c1bf Kent Overstreet 2020-07-22  600  	src = bch2_dev_usage_read(ca);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  601  
22502ac23a2eaa3 Kent Overstreet 2019-12-16  602  	arg.state		= ca->mi.state;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  603  	arg.bucket_size		= ca->mi.bucket_size;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  604  	arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  605  
2612e29142ff718 Kent Overstreet 2023-11-23  606  	for (i = 0; i < ARRAY_SIZE(arg.d); i++) {
822835ffeae411b Kent Overstreet 2022-04-01  607  		arg.d[i].buckets	= src.d[i].buckets;
822835ffeae411b Kent Overstreet 2022-04-01  608  		arg.d[i].sectors	= src.d[i].sectors;
822835ffeae411b Kent Overstreet 2022-04-01  609  		arg.d[i].fragmented	= src.d[i].fragmented;
22502ac23a2eaa3 Kent Overstreet 2019-12-16  610  	}
22502ac23a2eaa3 Kent Overstreet 2019-12-16  611  
f295298b8c6413f Kent Overstreet 2024-05-03  612  	bch2_dev_put(ca);
22502ac23a2eaa3 Kent Overstreet 2019-12-16  613  
e6674decb219599 Kent Overstreet 2023-11-23  614  	return copy_to_user_errcode(user_arg, &arg, sizeof(arg));
e6674decb219599 Kent Overstreet 2023-11-23 @615  }
e6674decb219599 Kent Overstreet 2023-11-23  616  

:::::: The code at line 615 was first introduced by commit
:::::: e6674decb2195999ae9fe074bf048ba91e336144 bcachefs: BCH_IOCTL_DEV_USAGE_V2

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

