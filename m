Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF89267B92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 01:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761616665; cv=fail; b=ZiSXp7RxHQtvP2/dFKA1+YjO+YgkUddihwvTommsrUSVQMWVzbEIMql5KRyZ0X00YxQPDoX5UI3MV3aIxS8m0h86uW44j5RlW2obHlxoypyqSV+yAnRIfyAs9GlUF8yJAxp+kSrqbhM98sWcZ4v9hH+jA4GXl31fRMdgDrfrzWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761616665; c=relaxed/simple;
	bh=yaD1xZ/I32SjXHEfANQ+/fE5wzsOm1QiBEyKfAjv8G0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=b0uqIN8i/sLndLhXB2iJvZtNF+3XzPfXBi1bcyvo877gr5RQiBIQ9auWey4FHvuEVjN2N/imZ2uhvUVbkDC+mLXRFYo+aq4lBHJNtPqE639CWdYJ1z4lrH2BTbpTLWqwPaYPuYQ5Q3D5WTdqNPpZcXKDv0PwN70eKVebxOqqbLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJfU/MLy; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJfU/MLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761616663; x=1793152663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yaD1xZ/I32SjXHEfANQ+/fE5wzsOm1QiBEyKfAjv8G0=;
  b=MJfU/MLyH9ckAS8hTiAmHTROMA2WorFNJCsly9jmWqdARoybciIdXwwg
   PhLgQ9Boe7jEjrFP0YXQSEjIOHqmQGPcai5vjdNxIA8EfxHjkKMajHQBl
   U8rvwv8RthOuQS3S95aR1tNymHEHvnZAVv//d2w+O4oEiiUfehBH2m6JW
   wmjYsunXTUIf10Pz74BkuE1Sn+djJlEqTW0lZC2cbyFNUm5whGHr0LkIK
   urcUZv4r5rARwOihr9DyszI5Rp4Ms8/WMsT+OFGh/dXDtVsjQN32dkQqu
   HjMORzfD148Xp3XVc6vJ0rPVeZwJeFeIgv7zuTyxdXv4+HbAF3FIGtZ8p
   w==;
X-CSE-ConnectionGUID: eYa53kYeT7y64qi4gXP/qQ==
X-CSE-MsgGUID: UdjLv2vUSwCWCFgXq6WF+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67573031"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="67573031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:57:43 -0700
X-CSE-ConnectionGUID: AkJ/sTT9TgO2VHYxn62MxA==
X-CSE-MsgGUID: LFcx8IvIQTassBPOuTpU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="208812162"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:57:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:57:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 18:57:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:57:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxj65LrB+xDavIRzgdoe2nmgDe/cmELJdRYCjw11X8JA+pcL6eUk/B5PE3C6zHU1NYCEbP0s+tHYyBIjzjChwF6HNqTFy9cfsGeS3ZI1P0laSB1Y0tgWZx41pmYMlPNsER+CbS1NNRcgxT17ev+WdQygqdqrEUD6LRmNcFgV5pItxzUq04IkKMa7VprJYWltnS4iL15lHEjtfcVUH1r71yee05Y6mhZv/mTae5WvamMhSOQU9nMktneeqdqautSChNpOo6/9xRFKoHKc3YAybGt2JupgxNkyaPOrb1eNaRtm9Gzz/vN9PXvuO2qK0sOmbU32Rb57jsfTeR0rrKiH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VbR8DLiVqaHQ6oSpvVYfmFsMsVv7PBeJFfTft1CqXU=;
 b=QhEd3bHYKaRDGkUlEcemqPwLs0usYiQCYL+6kJvpyj5QuZME8FrryJIS/t1ztYbVJPBSxe00LJqhY35E2e78nn9IOnUTpiy3ggvnMfWa7hmmrDiJhMCut7T4OxmANvOiam1xMiYAO9ALdNEydgjN00aPUD6lTdLM/E4gU8+jzj2Fo34lwbscsidePZWHVBkDB3N5jHOfIO/KrjXtco806e6/3KK115gRtXTxJ7+nWTrI1B0L4zWZIr6sU+T/y2vRhEi3xrmegX3BRCj66nJ0sE13NR2fAN5P/Ol70Pc/L7nvN7YS+314xqqVMwjy7OuzyWKjqUrVQ1f8PzVT8Z9SBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 01:57:35 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9253.011; Tue, 28 Oct 2025
 01:57:34 +0000
Date: Tue, 28 Oct 2025 09:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [koverstreet-bcachefs:bcachefs-testing 468/674]
 fs/bcachefs/fs/quota.c:117:9: sparse: sparse: unknown escape sequence: '\%'
Message-ID: <aQAjB2reHkcvCryc@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|PH7PR11MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f760a9a-ece6-4d76-e49f-08de15c55cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1UUy64PTDGcQJBazn6rAVae7yA2VggyVj1XbpUYuL6etwZM6n5Jwt+XSkwcJ?=
 =?us-ascii?Q?wfVASUsX3+0Tfth11iwJmgslno9Rc+MWYgQtzQ678bSqBMiQz0R6PyXBYxxq?=
 =?us-ascii?Q?ECbhEIQPJKiRWXnTW9K1918hNf5mRP0azySz1toZ/JN5svpi72q9ZrxqQgar?=
 =?us-ascii?Q?/QWAVYXl3pExZqHgdKRCcJO99wJGOrBOXmfUPGKKJ3ICaP1sZBZOTQTMGCXp?=
 =?us-ascii?Q?LM4kCozdU5807ca2wRvA3FWYZIyeJU2JQ2PyHeGOmsY4oxiCyVgQeTbnbHCV?=
 =?us-ascii?Q?5qxOyj7NzifplUD4Rm3Qg7HPuIaSR0iANvNQLN8tQwLL3Vx6Kpqzzs2u+a8p?=
 =?us-ascii?Q?Tw95CCy0UROeImwWWNgwqswR0W60pYHA64A2Hn8themaQ9ul6jC0R2KFjxpH?=
 =?us-ascii?Q?tcyf9LJJ5BzuYM4BrwPdY7llhSxlz097KK2vARboK8sQNFvRLBm90BjpTngT?=
 =?us-ascii?Q?l26QpbKG41NZKLUHZkHtkz812sxM0yo0B69B0GdvIwRH+tWdfapaewLDR9Co?=
 =?us-ascii?Q?9Nn+br5cFVCH50hboFR2edGKz4U0dmdbB7OlJkuJ8MSb/2IvhCEwqxozZJ4Y?=
 =?us-ascii?Q?DNHTmf8DUmuaotPzt3FKiKnuesJ1BiOgRQTbV9wDO0C3QlceKZ4xZHbZhZNT?=
 =?us-ascii?Q?3lZVHuJzW+Ov6JS5x28eN33TPWnP5cYM968RY8qoV4lUgNre+TaNhJLEcN0d?=
 =?us-ascii?Q?MBC/mZLQfkJ+svVw8cNBghpXpIoU81xR0mhVCjV5R+kzU8VyhA8kXicFb7UP?=
 =?us-ascii?Q?rlRvRXiUvQP84acSj5itJhbaU9dU/4WvVRlmtTuaIAqMkpjsKsAr4ILTJmvi?=
 =?us-ascii?Q?6T0w4F3sePrNGONzCEEvtfFi+KAL4nOoRw7+0CneodSmQ/UHEjSQUbJRxKYT?=
 =?us-ascii?Q?mvQ9noijeT/VJ6NbkbFJb3XkiEjtNkuGqJdsNg66vFWp4p1OZfgt2+5n6CiJ?=
 =?us-ascii?Q?iRDSv8dTwgiMRHp/iwhXVWoT9fyEWVWLYeSoyPmNNa5c/AMNnRZHpjb7GNHb?=
 =?us-ascii?Q?sfPVftrV64E0qq9o6B9P4+ap6WaWMBngfSctAbrIXcfhuir+dZS27yAHVWVA?=
 =?us-ascii?Q?EKCrUIV+a6STn2kegpD8DEirSCu7UeBezGEj38cQP51X8jxvnMOW9S0dRoeN?=
 =?us-ascii?Q?ESTN2ve8LaEKaHE55RUaKp7yXUkAr5E1MbYy/ZHvr3lLlDRppW9AZ6rsDNTg?=
 =?us-ascii?Q?ipuv8yekRsP/IPZR6cR2DFSGQwx1IVgJlxAIWOoWjHRZ5wNIL8jHFlRdw7C3?=
 =?us-ascii?Q?6Uqb2mnYIBaH8doxv9yVxGvZ7hKYJGRZOV2VTG3H7gZgb1sswoCjk/l8a+Nd?=
 =?us-ascii?Q?V8QhJNlyyyDVxsrGPVSbCpsscFKEsU+fRmXYQzB2iHi/CeqKb1HZc3pmWtUF?=
 =?us-ascii?Q?k2uZ5HJbM8Kugw2VUkRh/xey9L8d44zcOCaSxkE9rbQiGiYpoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZhBbDct6l0IdedkZHylvPKbVxUaQBShX/VbMm87OWnvANuwxLzz3nCcQFmR?=
 =?us-ascii?Q?4QmS2KM65kT1qR5/+m6HH5REjJXkxPvstmUG8cvWn9xs+H3FcF8os5pev/q2?=
 =?us-ascii?Q?p2RD/BRDhSpdb8MbwNAuHq7w+kJbZ4p9WGeEbs+N+JTvyvOFHGdnTY8WlETw?=
 =?us-ascii?Q?SKiYN3eWOKizwDcdcmC8jkSWwaPaRGHDP7oSepCva4tJHdguoK7njT+1AaHM?=
 =?us-ascii?Q?DmUJ2W3o9Dwudyrakf4RLx+Tmzbdvr3TeY52o3TwN5vo98L4SicKscrqraGS?=
 =?us-ascii?Q?pzKIij3CELYhk6PBg6yfjzUqwgJwQ36fgo7oeuoSUKmLPyvAs3YpD6XxR2zD?=
 =?us-ascii?Q?m9i6k5Ft8IGvmCwLMsQtA0bMVqOcWaJZ5WxWvZLzMfC1CPw/48YnxAbrGZMS?=
 =?us-ascii?Q?5tFOonhTSzPe3SRvcV5E6vQEUFO7qvQ6MW2NlGXqbD83s7If860U/vpfePij?=
 =?us-ascii?Q?dwVIrVT0qPE6cuZJYSL0BE3Radj2TArJOK30Hj/B8XkgbRGLTKwTT1TZAM3X?=
 =?us-ascii?Q?kHV6PgH8IVJ/Qm2tGK3aPncKtQv9CbauyMZvWv9deTnW2JV5cbyCMG3LoHL+?=
 =?us-ascii?Q?4oARjOSn0KnTV0igOsTwjnQTTV4mYxQRPiZvC8DLTAuOg+HdC/D0AoBgKVB1?=
 =?us-ascii?Q?TG4xWmqIc1UVop13EEMxUKOCzA6xorWgS5eXEMLkUglqfHvXIM2YqoQffgac?=
 =?us-ascii?Q?O7dXneLh3WM+yunnq6VCgpM+VPenYTsHIp8KoZlEtbzLjnIk2qF0+7zlwk2G?=
 =?us-ascii?Q?JvWHCFcwQbUC3zemv0lNAqDC/hkkGWfId51k4oEK1Ov5ro34XsD0kAuucl6q?=
 =?us-ascii?Q?0gEWpWj2f3YMYsTQAw+k7DpMZVytaMFSeolKvb3PhRq6ns5YKMyEwQBtwZK+?=
 =?us-ascii?Q?a3GZioXfq5j/GRBknEHfW6oqTczU+8Kerk9ixxl3wrk5x1gJb9Gp+h28AToe?=
 =?us-ascii?Q?W1PjfJCu2isKAJI6FGktvTTa7vpS0QyL4HeWL2R1tjoYZxbkoPdE5ROxc8xF?=
 =?us-ascii?Q?G4Zpe79GHgQrKpb3Pd4I97Sedu0Tex2Mbi8HhiuvnZ7SfrerBT/PXYWLK7zL?=
 =?us-ascii?Q?GwwyQpBc38kTzXarmbsRN9Bpy/2pFhdsZxVdQft15mqnH6x8lahGs2hA6Hgf?=
 =?us-ascii?Q?nWpTMROoeP3IfrQf44aejoOmBRQPtqbnAqbFcLmkvq28mLj5KhY5YXRf6DJS?=
 =?us-ascii?Q?kNehV259T3IPHnONi8gnabkoDTs4vyrI1EeaPs39f12s1UOi/o2yRpyb0mDH?=
 =?us-ascii?Q?3UST7IWbs1TPa99wUC46rb5YnnvGsIT6OzAYD5tIb5CEr8ovg9liprrX32Hm?=
 =?us-ascii?Q?fn4igAaCcyQkbGrzkhv17gYreH+FeRnEFss1YKVZiHnhLZWTzZsieqwRhGVm?=
 =?us-ascii?Q?InCNFy85IJGm0diICbdetqk1/428LucPInL8xhRbeH1X8+cknCnLrJi7T6hP?=
 =?us-ascii?Q?uURYg3piG6u3sNqPNpdhojytrqzZ87UNIgjx8tZT27A96Q4e3iDHhzPB8zv8?=
 =?us-ascii?Q?vaHnYAoTN6XZNq2t/q5l+PAtWBX2RqlzQR8NiZ2Kf/TAIFBUJI88HMQwJEU5?=
 =?us-ascii?Q?kQI7MdgnrvMukrHNiSpdSfReWauwVOQbvyTd+6Z/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f760a9a-ece6-4d76-e49f-08de15c55cca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:57:34.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heCvB3Jw926xeI93mqJExt9wUkRXn0SqAnjLbe9C5VOeOiW2axoiozGRdL1kKwbsb5RXiYQj1sCm6fBRAOtEWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
X-OriginatorOrg: intel.com

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a4abf4352bcdf7adc9cf5605c5035f6441ed7576
commit: 0e349fe46a443dc2f5f3d2b67a3cc42c12d2bf35 [468/674] bcachefs: move fs code to fs/
:::::: branch date: 35 minutes ago
:::::: commit date: 17 hours ago
config: hexagon-randconfig-r121-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270331.YrnoFhYW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270331.YrnoFhYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510270331.YrnoFhYW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/fs/quota.c:117:9: sparse: sparse: unknown escape sequence: '%'

vim +117 fs/bcachefs/fs/quota.c

f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  108  
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  109  static void qc_dqblk_to_text(struct printbuf *out, struct qc_dqblk *q)
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  110  {
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  111  	printbuf_tabstops_reset(out);
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  112  	printbuf_tabstop_push(out, 20);
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  113  
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  114  	prt_printf(out, "d_fieldmask\t%x\n",		q->d_fieldmask);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  115  	prt_printf(out, "d_spc_hardlimit\t%llu\n",	q->d_spc_hardlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  116  	prt_printf(out, "d_spc_softlimit\t%llu\n",	q->d_spc_softlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10 @117  	prt_printf(out, "d_ino_hardlimit\%llu\n",	q->d_ino_hardlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  118  	prt_printf(out, "d_ino_softlimit\t%llu\n",	q->d_ino_softlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  119  	prt_printf(out, "d_space\t%llu\n",		q->d_space);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  120  	prt_printf(out, "d_ino_count\t%llu\n",		q->d_ino_count);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  121  	prt_printf(out, "d_ino_timer\t%llu\n",		q->d_ino_timer);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  122  	prt_printf(out, "d_spc_timer\t%llu\n",		q->d_spc_timer);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  123  	prt_printf(out, "d_ino_warns\t%i\n",		q->d_ino_warns);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  124  	prt_printf(out, "d_spc_warns\t%i\n",		q->d_spc_warns);
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  125  }
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  126  

:::::: The code at line 117 was first introduced by commit
:::::: 7423330e30ab916d56ce9a9d49e37e40ead5b153 bcachefs: prt_printf() now respects \r\n\t

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

