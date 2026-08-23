Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3538CFE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489763; cv=fail; b=RsS867fEpEevlyA94M8+dTYcAD+xcIK/K+cwSIzFo9m5Iw96EjN7vIOLtEwsmYKnJTKZ3h1lxEh6DSzHlpQ5/8eyJTb+FZplOy8U6FIPWufi5YxbulHnS/SZCT5KjNmHxDV5U+2EFwh8JspaHkhyhkd94JfxC8QOMDHfUWx21eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489763; c=relaxed/simple;
	bh=LfLu3dkHWD3L1FCvHfqfoI5uKktQYbba7EaPY5YsVv0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jPScARs8iSUg5ZmOL83R7dDcORdvIJxSnL4S3djaDchpKFtJ44/R3Phc3qIK8nrCKpj+nzShdx/NMXBjgyX6tqp4B2Ese/yLnSeU/IaHADay1RN72JmFTSzBEGWUsN8vHKBlyFyZFCFFD69CYuXOuPdEnIcK7v6q+4NrKKrP40s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHeSokT1; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHeSokT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489762; x=1819025762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LfLu3dkHWD3L1FCvHfqfoI5uKktQYbba7EaPY5YsVv0=;
  b=CHeSokT1sw1MndqZdXohdbzw1r/0pcv+OjtUWYguyG/ZHAXk+0PbABu3
   tWXflIy6Sr4W2a4pt4DHY2K782CbxCSFqJL1pdEO1oliR4cjW32iFHHHt
   pUFbgGm95zO1PMDqcFDCtmvtjZV89NwncHEwxc39UUkeyE9X7v8hLgwoL
   5ZivNDj8qE5Sk0pBJjA9v5+0uBxN19ApZpnaBffs+ePIJvt/A+ziKguwG
   2ZxDVX3bFQSxZ4S5OMLNQ5x2xKx1M7kMxSgP9OtFsAG8+LuHxH6viXFFi
   XnrD6WAy9eaIoiirGxEWXe1mCyafCW7tiQO4QVur4oVs7fepOseZqHsH+
   Q==;
X-CSE-ConnectionGUID: ScC014S/SRqhTz16x8MPKQ==
X-CSE-MsgGUID: o7Me5zNoSEuf7cTsfQ4yKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="91774597"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="91774597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:56:01 -0700
X-CSE-ConnectionGUID: XuTQrIrYTT2Ev5IIeCVKlA==
X-CSE-MsgGUID: MQxe0xymSmisYlf3/pzxfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="296676501"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:56:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:56:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:56:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+hLjlM0o5ugmcgAGyD/KlFJEYcBli0uPXgFodUeyg29F4hFe60IeqBOr8M4gaY5QprzCTe+MhzYn+GjZHqVGtkqc5JeXlM8vHSWIp5bfvs9vhhDAe8aUAkdoaU1IkcqFpG+N68OvOa5RbI5vm0IYXM+2++u8+8PjoY14V75X0u/Vb7cXNNBhK7KIFouNbgBnnkDrqoV1LRDy62s8t3qyrcAz5DdUSlY4/VfeJEmKwNCdKO8L2YczOok75KcmeGO0hJjW1TVZcLA2DhydHIBjK2mGbEtsf7m5ay1OnhDMfJe4eDgoJT8wfl5uOjMQ88yRFIIAk6eSa/hmtvI4TgfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI18sxPB1xhVo7RSSMJ9ZvQIhR5lEg0lUJpqpFVfyC4=;
 b=PXD7a2Vh0GvMxgRtjp1mdjsmOWgqUWhWwQWqaHvwTL/P4rfRAJHBNCd2/LVPXopzAaxPULeNcW5ICs45QNRzABhSYfz3yDLDY/UYmv9dqVj5LjwxTNx4TyRXbdONCxyn2luVdafpl/YSqTqm7poxg2kNBupyWuZFgSORdGx8fQJ8PvK1RGRwAZ9OHgmDbVn28s+lZVA7cepwwRiUsEBzfpPkQjP0MzDCGBA++yIMbP8+kfPT8+QFa0NMAsFKtCbOeBfCOXe0WLKCGFX92ffrMBCqfU7yC1xLhlowczxYwYAUZJo2JHipiDED8WjcbKntEIVG3KMv/y7UhQJydhMahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:55:58 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:55:58 +0000
Date: Sun, 23 Aug 2026 20:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:llm-fixes-31 137/161] ./fs/xfs/xfs_quota.h:198:73:
 warning: statement with no effect
Message-ID: <202608220958.YjO2gmDw-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::17) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: c694432e-9ac9-45db-cd96-08df0115e062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: gb4ISNPm7SO917S2YxXTfGoHYvTWMTPSHACsvpeoJKPklhSpxPMlQNGs8ijRrJx3v4ucOWjFm+zCG55V6FXIZ5Zxtf/NgslHuexUput4CpXpkcX3C9eW3+ZrPNEzh5brE1xkjgxCjD5CH9jeOhYtbRFZgFn27eNY/8SeRdKmJbWLIt3Xg7Ly1auYDU2GpU+vBXlZuMSKgLvbPSqaKYM9u3kJ+K24km7Iyv/8usaF7FNdSzJnZhDCTGy8hG9RaAVr2GjT2azkNSU4CobOWr9JHLcazSTkz+cuBVi0EVJe96OshcUgTTuBkPshEwUsGrxnLB2GTV3vptmBdhF4IFtnrn14QTlZ2Rt+QtEr9feJEjbU4sdyP+tIvUX6tHqUsv+FYL7KOECeTtvhYgCyWfZkUwwkNaiPuQYs+UEfy9u57GM5Dtn7KAfXwfApkHwihQtpDnCocKcJ3WrlX4iC0zER5cqC1+fpyqNF31rfGt8K4tCUihUYao+k1G6/ms4bqbH6zzAA76BlXxViZGmg6go7H/mw/Ig2hn/1GZJoxtLufJbfotHvlltZiNFR+pBQdG2wc2yhVAzJlV8BawBEtSsMjHKVk9N1jxgnYC6uSGHVlTr7x8VnLdxb7DtuvmCjCH1JzQi0y7BLkFF6QOxSC5zqfqZfsK1nd21GVN/r4bMmBZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qXcofaV6LeJEvvGO34YaLzmscTDLNLQiGNeBHFRh7A578i3odhoB6k6QebSD?=
 =?us-ascii?Q?7Q58UE6g8vTiWnpOB6ub8AaRUpVlEXRNSTxAh2xxy+lcAX/9ysVZ1jXMmL1a?=
 =?us-ascii?Q?ZeUMhC6LazlriS7/4SvmZa7JlS4Fyuc23mVwEVCrwSqa9yK+j6B2TiRwy5yK?=
 =?us-ascii?Q?EA7BedMsmtgnhPeP5Fi+C4FFP0ggzO9J13piV6Oi76Qmdv3WdPB5US9amhCd?=
 =?us-ascii?Q?2pRudvYEYjmAAU3h3EuLi5BDf5D482C492XluS8FpU2EcDVAptvBjx9E2l7u?=
 =?us-ascii?Q?8X359helyExdqC4R5wgxFzAwZG0ZsXEEauvZAqbl0zwV0JKOwxGPonqMP7oS?=
 =?us-ascii?Q?d8jxjNdrLrUrh5Gt3SQ+AU8kYEsGEygpaTkuijI2NM6eeC5PiyOnAnmRMpr7?=
 =?us-ascii?Q?3K1kuSfS6CZYGrduBZUvGLFwUA5IL/KlpqfLh1ZkOpLSYInAWHn1UZlAPLlS?=
 =?us-ascii?Q?MekDFgQm1IlyE/SYl4WB/axfGrg+4BlEy0TwI6Uv//cOvvtv9IZiORn7zYVX?=
 =?us-ascii?Q?/vF8Z9NuD3vL9j/zOq3T3184C0hBEZRx6XiBAxtvmud1OlzusR1WWSeJXWVx?=
 =?us-ascii?Q?oh0qf2DBV2wRdpixb2QvsnDWiM+QzGs+YCDKHqR69UC2PnddoTaek+uPV5Oz?=
 =?us-ascii?Q?PMfKogDOT/G4QhynzOnP0YS20lmtQTvOZtScGXMF9gvqZPROdjBty5VlxjwW?=
 =?us-ascii?Q?KkuTdz0nZXwAopHU/RtIRUbl2Wcl0JPChcmJfoQRaS6oGcg+65Wqf2kVwMPA?=
 =?us-ascii?Q?eay5f65WWTw3WCGrWs0K9FHWeHzAh5KnQTlPHjwUr+dFuBigr/LqmueOvUdO?=
 =?us-ascii?Q?yDGIb/KSVgGsr7cDLkqgQbrLHu5YiXx6kIJNsdoUlES5KbAsW1vDHC5cpehr?=
 =?us-ascii?Q?SHB+Z8aWddaJ5adNqD8+9j1rYHi1dbWZhDIvByRs7yNHqrsQRjBA/yzRiMVN?=
 =?us-ascii?Q?WHTkrF7EcqzkLteuAtDsbz+D11eA9QlsQ/v4bSquhivE24xlyrzM9K2+M6mI?=
 =?us-ascii?Q?8RXmYRy1FjJP/W7hH++1nYCAxb26RhdVcxYQgaIrAqa8sVxScvFKJ3ChRp63?=
 =?us-ascii?Q?90GPChLLi7MyihibHx14mrdgVFRG/lSl0ubbEeaog4Yg6Njl1OzZkVuabQ7e?=
 =?us-ascii?Q?H/2PcEeS+oOUjZt/yUkk5aUIr7xD/vVnTD9H1ja2MoqF0UW6TTGFLudcc4fl?=
 =?us-ascii?Q?T3LSWfEqo+M24Mu+qYUI+JMk2Xn3/Giq0rqm5AzK/TCzV/yqyDMSIgVaXiq0?=
 =?us-ascii?Q?I4l2Ipj5lc0lHSoo91I0Z2iyfFVcAYIhvEZoeUmYTes2sNvdo+ccFeLpbIsG?=
 =?us-ascii?Q?UAfA5xwUkrplzoJ2ScMo6zK+SQyRXivyje8goJUzUM+UIE/1lsEXpUW2rgWL?=
 =?us-ascii?Q?9MMweVL66ETRMhGydxm64+WXlSAEW36nuhy6k64yd0wVTY4l1AvRMYIkKDgs?=
 =?us-ascii?Q?UzUBWgkgfaIKDdiNmvvfCMZAjkVr1/JPH514Z2W40mHASFwSIufsoGKd9MkV?=
 =?us-ascii?Q?zNnutcoxKYCDVJYKFgJoMR9uVST0nkjlTYCeiJsa0YkbAIawVMYDcJaAL3MD?=
 =?us-ascii?Q?HeD/lEny2K+1UXoKGON+rabBBvHTKXJaZKtiJPSR2/c+DjWIzKHDeM1V2dTk?=
 =?us-ascii?Q?Dl0l91Y3+C2E5GoVNLrhuxcpzFxZh7YuBFRinQnCeFZW8/5B30BL9HEFOclm?=
 =?us-ascii?Q?Tofq35n8RjkuvC2813UXkZWqww1PNh0oCfjb0QPuxcn5Gf9/Ykivvv+jYUWh?=
 =?us-ascii?Q?7KQGfvZ+2Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: zIWBXkGiqQYe5Sarn3UGQpXNBh9gl/mW0XbUoGMogw9CaFIyJsIep9rrWBsVzQq7t8o8t2QOps/aQgs/BQ5WM9NTBtBZnK5ggArtXOZkHr74IClcOGbVNX8A2/UnRbe+sssMn1EuGNb5PCtMS/LGONXmJ/49Oz/lgqd0qf7DmReDOzsF41J1rh4mC/A+GT/h8BOKhIFHcNIkt0W4r/RgqJOawcMt1br6wP8GlNDYh+uhpkuWzOSAS7xTM02AjnvnPtm5EpRT/ozGHmPk7pPrBBuphV7CEYihUo6MumPaWdlJMSwAepHO4vWGtE92ACe6VPO6fqVxEhrknOkBHUXJ+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c694432e-9ac9-45db-cd96-08df0115e062
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:55:58.3323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfslS8d4dzzfY7bGlez4E1+JB9zlhXrCheWGQ24XcgSgmNRjp2YOoUaSugqCHNVY9lVx66W6Jwb9ey4Dw5/9dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-31
head:   99720b43a50e52830dacd44219a5f40dc8cab503
commit: 02ba3b2929d48bb926d06e902754b4f5249ce78c [137/161] xfs: reattach dquots after changing inode ids
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260822/202608220958.YjO2gmDw-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220958.YjO2gmDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220958.YjO2gmDw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/inode_repair.c:34:
   fs/xfs/scrub/inode_repair.c: In function 'xrep_inode_ids':
>> ./fs/xfs/xfs_quota.h:198:73: warning: statement with no effect [-Wunused-value]
     198 | #define xfs_qm_dqattach_locked(ip, fl)                                  (0)
         |                                                                         ^
   fs/xfs/scrub/inode_repair.c:1791:17: note: in expansion of macro 'xfs_qm_dqattach_locked'
    1791 |                 xfs_qm_dqattach_locked(sc->ip, false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~


vim +198 ./fs/xfs/xfs_quota.h

ad4a74739708e1 Darrick J. Wong     2021-01-22  193  
92f8ff73f18672 Chandra Seetharaman 2013-07-11  194  #define xfs_qm_vop_create_dqattach(tp, ip, u, g, p)
7d095257e32121 Christoph Hellwig   2009-06-08  195  #define xfs_qm_vop_rename_dqattach(it)					(0)
7d095257e32121 Christoph Hellwig   2009-06-08  196  #define xfs_qm_vop_chown(tp, ip, old, new)				(NULL)
c14cfccabe2af2 Darrick J. Wong     2018-05-04  197  #define xfs_qm_dqattach(ip)						(0)
7d095257e32121 Christoph Hellwig   2009-06-08 @198  #define xfs_qm_dqattach_locked(ip, fl)					(0)
7d095257e32121 Christoph Hellwig   2009-06-08  199  #define xfs_qm_dqdetach(ip)
7ac6eb46c9f32d Darrick J. Wong     2021-01-25  200  #define xfs_qm_dqrele(d)			do { (d) = (d); } while(0)
7ac6eb46c9f32d Darrick J. Wong     2021-01-25  201  #define xfs_qm_statvfs(ip, s)			do { } while(0)
7d095257e32121 Christoph Hellwig   2009-06-08  202  #define xfs_qm_newmount(mp, a, b)					(0)
d5d9dd5b3026a8 Darrick J. Wong     2024-11-03  203  #define xfs_qm_resume_quotaon(mp)		((void)0)
7d095257e32121 Christoph Hellwig   2009-06-08  204  #define xfs_qm_mount_quotas(mp)
7d095257e32121 Christoph Hellwig   2009-06-08  205  #define xfs_qm_unmount(mp)
5d2bf8a55e03b0 Christoph Hellwig   2010-11-06  206  #define xfs_qm_unmount_quotas(mp)
108523b8de676a Darrick J. Wong     2021-08-06  207  #define xfs_inode_near_dquot_enforcement(ip, type)			(false)
200491875ce144 Darrick J. Wong     2024-02-22  208  

:::::: The code at line 198 was first introduced by commit
:::::: 7d095257e321214e4cf359abd131ba1f09c60cba xfs: kill xfs_qmops

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@brick.lst.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
