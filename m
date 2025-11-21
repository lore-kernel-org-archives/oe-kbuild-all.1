Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523C354AE6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735298; cv=fail; b=CxcuD+pJxTlhpH0ya+lVxzH8mnEsgKtFY9/het2MkMidZZoDEawmnclYatm9irNXQ4pj/VCvV7wDq0kgJG1NJFrPl6faqyZUPtYvaMsK8alIhjABSItMxQCTaf4JDpFnGLOoHMeJhusrvc6gCaiobSkuYaHkxDfYtmyUQnQey1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735298; c=relaxed/simple;
	bh=o+FjxZ5/hV9fsoBwp1ssosyzYdYFQXy3clZ0/GxtT7w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CKoc7idq6gj27r/SYZLWHWpYcbypXX219R9S0Mw3+h0ZGcPl7MDb+H+AnJ+20JW/Z6/TyUbk7UaY2KmmI17lVcX1SHdplyy17lLDGb0JqzUzxU0zuJFkOGB/GjfyzOIPx3yatHIh128pqNVUo72h7UT9+tcZxjFKxJeBh1sWgFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPvPLNRk; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPvPLNRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763735297; x=1795271297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+FjxZ5/hV9fsoBwp1ssosyzYdYFQXy3clZ0/GxtT7w=;
  b=BPvPLNRkD+sPMnONz8V5F+QGsCqY4a2gikUnPNGOtXOn8zTa3a1tpsyb
   VCkgv3MMVHah2wK9CjvpfGFr0iE2hZvIst9h1FWZcDetdyAhRnlVhxmvn
   2SP5xXXA6plXtqmeaKrpBlP8g6AQoMOBgHclioRGgttSSxA0/rpMso9nc
   URsGreoFT+Q/QvQFvbVLN3ZzoGZ8RdKNSOY6sg2y3buIHMmqwg4eUrLLx
   +jpjfrWocK5y0XUaNnAtMJHUAGoQFPA0o7UVPaXUQoArAF/UmTAhtZbZ/
   7zxXwWmtNaaq+HJREFyjkAtdEx5FYs4gitDa2Y12nitFp3NwRW7Lp1lHd
   g==;
X-CSE-ConnectionGUID: D1u6V0VRQCe9LgwSV2TyfA==
X-CSE-MsgGUID: ztu3WPgxTYCRBMONWKlkRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65018088"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65018088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:28:16 -0800
X-CSE-ConnectionGUID: AS8djC55TbGl0RsmrYWZiA==
X-CSE-MsgGUID: rTC48mrkS9yvSO9+gk3LOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191816079"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:28:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 06:28:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 06:28:15 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 06:28:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8ZA2pYxBx/qN2mW/Niz8iM2r9/C/esKXK3N6/R3Ud822GEF4lvHrgHYnAuM65BX9ae9SuSTkuUcK9ptOKO1MsBolgpzSReA213PkxntCxMyneb4BoKmZNBNHJb09z5OxEId52pnof7u7l2V/moJmuFgErcYZDWoqoshpIjRH48t5dIPnw7aN+iwu5y9055dE2OgvB7zOHfMQyIiYSu5Yq12zzfKQu6QIHfrXlh4WJYkqzt2dvFfrcHCekiPCdx0dqxILcpLl+zs+C686g5B5O3dqyYc6PbxRQIKpub8T73f+bNVdT11OlyWKfFuv0oLAVlTle3ixkI4VrK3m4tS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7Yy/211mpbecQrXwZii1Eflex4Sub7yRXB6Ne70wVM=;
 b=yXWHIF/V6nTGxrG4gMvFhS9gZMgNCNPNZJtbprM/jcQS5Vp+dPH4RpzYHtUo/MjQoKgso59nBs4zvDusy87Hb+TWCEGMyyePsnFzsm7INsLLKkYTBWVMtZtjLCt8RHhh7WcKTguSoIm05J/knq4uB5YDW/p+itKn6UKYjB6XBDIm2d8zayLysGR7Z5RlpHmZEBczNGOLf2AAgYSkHR3/JG5ANaYeURGEFxi3lmNZYk2Ego56HIZqnApWi5RRJs27QDo3H/a4SvSNVynOWNP/R7SG3C9OWAxycnIryVwRaoEJLJHPU7lc+tzSOHGe7BvZGF1hLZ3QCw3Hjc9445jB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.13; Fri, 21 Nov
 2025 14:28:11 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 14:28:11 +0000
Date: Fri, 21 Nov 2025 22:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tglx-devel:rseq/slice 32/32] slice_test.c:68:20: warning: overflow
 in expression; result is 705'032'704 with type 'long'
Message-ID: <aSB29I/Fu7+CpKOJ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e491975-247e-43d9-a522-08de290a32f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ww4rLS4tNqli+1+5Nv2AvfmRoxIBS4Z+VM9VNz20RoscUF1vzoNvy1MYRlpW?=
 =?us-ascii?Q?139emN8RX80eqU1L5lElwTHnZQtZvvME4Et07e1QKIsih05jMysDpmg69RbI?=
 =?us-ascii?Q?x7ET+PzL7PlTVz06ruuFG9TYue5i/w/InalzwZToa0O6R/Fju7ZFcK6R4g4d?=
 =?us-ascii?Q?p7OzRBtBxsGnCKzQf3/Kaxz4Vn4inyqXwmx4Nppj03CnYyHdW2OzA1Yk8/YM?=
 =?us-ascii?Q?DjO9X+l55eJfKgwiXtzADtAaqfkXgJBA9wb5MTT9+x51jgAjYent0Gc6P5Lv?=
 =?us-ascii?Q?erGRO1MZQ+lxZScrq2DbgsfVBIYvllLbE0fwkh4cvnQJMS8122reg33/5ktq?=
 =?us-ascii?Q?Izud93rjtB724Pveb0Xwa3+f4cQPfh6aKyhIMzCTzqlUAIbRlb1fwX98b4lN?=
 =?us-ascii?Q?NBYplD8wPuma5UpdnMntkeIcTZumA+pEvwxnSSZ9J7XJ75bCe49DhPiDe3Gk?=
 =?us-ascii?Q?BZeOtxt/8JCvItlb43MXZQiccr7JDKbhsbPTFEXmIaLNeaBk8KGdrRSvAUa/?=
 =?us-ascii?Q?CdJ6XdZVO0A30ajiaOtNkcfQWIw9DN/1yPKVO32Es0xzqJCnqmb8fnddzASA?=
 =?us-ascii?Q?YoVNCeQxznCgrqRADPMsXTO/WrjWb9bcewJWC9q4vkKuezxVBPv9zLDLTpou?=
 =?us-ascii?Q?UlXu4G5bslQ37SHiRC//Xrj37B719BlU2TXr+E9m6/8Q+66CrW+q9sid20H1?=
 =?us-ascii?Q?6+Qt79UruHfD3ZXjSrMHHx5s67QTaU958pUP6YtbJZfjmmSFY/k1ZEl/oWLu?=
 =?us-ascii?Q?sULCmWxvSkpdirCGbXBSlS3ZcA+8M4xUxCPBqUt9E6gJ5rxeosIOL+OkQryb?=
 =?us-ascii?Q?hCwuGeT2ZQOnYIpsL6wQtLzHuXmz2x3sqeIr5TuiIys2+YmIPQaoubl70sTE?=
 =?us-ascii?Q?hRHFwiqJi959tO5CUpwY4waKS8qwiSUkmlAIpijLXU6/lJ/PDgyMDpiqsEaq?=
 =?us-ascii?Q?waL1WXA/DcFly+7D95UgoSZFXI7LG9PlsW88AO0mIDakZlH4JX4II/T94TFp?=
 =?us-ascii?Q?FHRLkNPNtz8SGtrK7MA/Pt72B/ZoBuREI0ic5XtlWsPxIJ5RddC/e9hYoPCK?=
 =?us-ascii?Q?nLTJY1hkD6FcvN0NLBIHmRmetjJjtJVXImYlYOECxy09sxzr+Z5rYtJ110f0?=
 =?us-ascii?Q?IPNAsZxv4KM65NKUBLVrB9S57U6cqSKK1QzXIzmUBuTcSpZ0xDmZukm4kLso?=
 =?us-ascii?Q?KK7bRwzkUABfB8ZKPGJvQ11e1icub/Wm7I3/NreW+kuOJZqIfW1wQIyqVJIq?=
 =?us-ascii?Q?HycFounOa5mP1bpXawxfdaPDgPl5Wc14WexxWb+PlFmrbopDDEfVDOyfv210?=
 =?us-ascii?Q?4AqN3R2RrnxLCGMmduC+t+QV8pWRLq193RfSFlG40shjbBeppy2uC7r0/3UD?=
 =?us-ascii?Q?YO/7Ab46pCpld+WGmh0hKeCJnZ6njdrBKoQk7I2nD3VSqAz7D60FIG91Doer?=
 =?us-ascii?Q?6tSONtF39fEfBT23Ds4+bPJWfZ4bJiCyC2MH5FPkuyXgOQgLueXdYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hdDYFHiCWHvbesjdWIaC48tvAa/dp8Ja6Jnwx2HO4bo5z9ECYl8KLAkXcPK?=
 =?us-ascii?Q?vNOGiiwJkdJ2HPEi8/Dbn+KF4WcIt6I5bkGOpGpNXyQFMgFDCgFsqZ21pQ3n?=
 =?us-ascii?Q?0pHtR6w5GzXK0KwewXFX4VYuOjKbCrQxKJg8pGtsXd7OM2Xy87GjuqpX4pmW?=
 =?us-ascii?Q?X2mtMp2MYh6gjfpIBxx5/TNYUX8EE9znxxUPN/szYhZw6AAWsW52CaTUueLI?=
 =?us-ascii?Q?7pSn1rmD7WgogmYns3sm5K/q3+AY9J4yEZBPAW3SOAXs5BO3NUQORF7lY3oA?=
 =?us-ascii?Q?urtg/rp1FczGa5Z8u0P9ij8pZAlnz/b/4lbP8knlaLy9Lpgy2HSnJ941fQCd?=
 =?us-ascii?Q?VPuGnft7DeXODKBYquskA30y8wUcgssrSCd/JkfirCZXBiYNoAaIBoJd1AI/?=
 =?us-ascii?Q?/3ZSgJUABx1BPhatrlAP7KgkA4qhSVK8IbLF9BUPRbxIa9sQ1w+tpZfDCf90?=
 =?us-ascii?Q?rsXhxqzzCQQ5vSlz2TdT/xQylNYu13RgfaumeFeAxO0+PWXRshUs+R080e8/?=
 =?us-ascii?Q?p4yjAp8wA2XAS5u+WzNSUlA0IftIF9gjSdKWtaLlq3mrqh5M3B4cQoM7U3BW?=
 =?us-ascii?Q?tItUHIh0kfL9f+luP0VuuXrO/0Q1ZkPQDuTjgvGifAUpwfx2Uo+ix6Zf0Q9w?=
 =?us-ascii?Q?/Dp4WbWwObTT/a2b3SkOSpG9NwEcfqeKF8YeyRbKl2OYly3M2ppAKc60B0vo?=
 =?us-ascii?Q?2TrW0pTzmY/yN2ykImnpKPNWYcO9N4j+389bEkb1o3fS6D6TgLvUgiCzpjA9?=
 =?us-ascii?Q?+SlXjXFFbxeRK9x+H1iHJAnT8g5dRvg5iz8SNukudrcEv7S0f5NAoHuP7oke?=
 =?us-ascii?Q?Vab+MmRqJZ8HBVKxCNC0p0NrQjyijYnsPbk6chdFVkxvfKzJD2KNC2L7lntZ?=
 =?us-ascii?Q?ppM+sct27y9lcywTuXUoW8qfSmFdgiadVLjsyjfhls7z4jt99rEHQeWq801Z?=
 =?us-ascii?Q?bhRZ0gugRO1fbW5n3SQWMrkZsVoLmFBXTJ+TTkfY+4byolTor60On1KU0TqO?=
 =?us-ascii?Q?9gWxwALavsttH7O7YSOEENCPPcj9cUWrykAL1/fdSPYvSyHMPheRgglKVsDB?=
 =?us-ascii?Q?LSAqhnMlqTid1ciYBB89a7ovdhNqESxTN11a4KE8EjH1fxArCYeZqRT33En9?=
 =?us-ascii?Q?dhF8h0kDih/2bE7dtd7JmzF2mee2de+MlJwJHWR+vhLZqsD2zjTxDgLzZdzS?=
 =?us-ascii?Q?gGs/jewNrGRL7PXlYyIJya+yz7PjyLljoIx3ixKQzJiUrYq6HWek2wJaeRNH?=
 =?us-ascii?Q?hBZw5e8y9cb7cRskjU3AzviPbXg6+/WRJUwZPAco4Edth7UZ+wB99HBV3pY7?=
 =?us-ascii?Q?0pxY99cA8fuiM6Yzc+54Iw8otq9TfR5wrPsT2O+tDxN1lOvMVSmFRePYliA4?=
 =?us-ascii?Q?Epl/RlwymlgxNSBKz2y+PjyRQc/mGlVLCKdalC7QMgd42ZIGI2+kuGyxwSic?=
 =?us-ascii?Q?iP2srqkV3lNR56ORymUpFs07hNl2rEVKSu9+CWnpEw0rCQ/HL6fHq/moWswi?=
 =?us-ascii?Q?v00sZyAQSRNs7sn/J9/Vxa0SCKFZwjB+fHVh/tl8ObSzf3NbQMoSGNz0lKOu?=
 =?us-ascii?Q?6z6/d/F45lp1F7zmcj1kr5IhhUKbncMougWXCTHflNMZwucQNWT7JRxjdj30?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e491975-247e-43d9-a522-08de290a32f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:28:11.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUhth3o034fFiAE7xeUajRNY7tZxMk9mwKp/h1TdTxjzhvYeAFVZAKIhy6OUtwZ32dgxXR8Pjda5PqWLtF0zNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   7b8c131529204f7e05367a741e96fb382ace924f
commit: a94575b1f515b87068cb0d76d9e9714998a461a9 [32/32] selftests/rseq: Implement time slice extension test
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511211331.HMVB3J3Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211331.HMVB3J3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211331.HMVB3J3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> slice_test.c:68:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      68 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   slice_test.c:76:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      76 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

