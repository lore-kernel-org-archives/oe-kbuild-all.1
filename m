Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE0258EDA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763821554; cv=fail; b=LKgcIoqYtqW9OtLVI5qcqlEYmiOoOzsxwLSgML3iITWWRPJiuFIROtuBCq9F4Z3cLF+7Iydpq6xWMYwdgGdgxDFWqTgJINx1RVyoEjoFYeO9NteJlluKfnMAF10ZIRbhg+L7PuDN6wVZ2CUsUt3PIXCuJ4LNBDjWHUt5B+hZh+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763821554; c=relaxed/simple;
	bh=ZvCz+F2mIHaG2KJSsCXC6f0wjInpaSAn0BzjjLXa/z8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Td2+xi78DGvqlf8guG8Q2PNZ5kfriSoZ0fAPE1tcZ4rTqlHCFVnQDG7VejfxNzGw5xv+1f45DDF6Bj0Z7TeYnCAz7qt2RaSvCapBW0lvWq+sk0sIa2R4wRPkfsRhQIoKI6PLTljWnZcaWixMfaNC2AMw/4ALKXb1SDLZYwufqEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcG/hjpH; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcG/hjpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763821551; x=1795357551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZvCz+F2mIHaG2KJSsCXC6f0wjInpaSAn0BzjjLXa/z8=;
  b=JcG/hjpH/MLzNX8w0d9H+3c4HSSk8xe7DF3bwY/4heouhlj5PAtIiD0d
   I0iAYSvA3OsqttJENSXekAmxK7A5/d79akzl9Nf0hNDxxOe5JvE7wnVCM
   z5hQ5HjcE4l7NS7Cjevb2U3Vq850xWI0sygvciqZmdLWOYhevy075fXQ3
   LTIIAOuN3j4cJxy+Gql3jj9E+vaGkClMhETZPnHqjjSrLMgRybnDtwYrx
   Tl2f4A1t3nnM3ZE+qoMZlFS9LezMluBbuq66lQ6hya8Dpd2cXQlkBWbrr
   bW0KgAw5e4GnE7U4jbIhWm2dHhaO9BYNbbyyVQNTQ41y87PH8MxzkTanx
   w==;
X-CSE-ConnectionGUID: 7VeyJILxSzaPnQnT9RHytQ==
X-CSE-MsgGUID: 0+BvlT8eTYqvB0HFwBoS/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="68491729"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="68491729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:25:51 -0800
X-CSE-ConnectionGUID: hVyrLSlHQ+2EnnuTCvWU1Q==
X-CSE-MsgGUID: vy/Urp9+QYKIKmYgeQjKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192396815"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:25:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:25:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 06:25:50 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:25:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6lDsKI1Jv5wB6XqJrrmNhLea88Ff2z6vdD7c76s61duBUKwbj3FI9PO7fMlaoTmHPoo/uek6LjskzN1zLW3Jyi5a0P0DdnLCo/9xmakQw7+2n3FzK7qFAwLSXObwbbZonaRAVDjZO6LLYqZH+U2YdVutU2lKkjCTygejdWSD5tn4RL+lN/wVKgzfRp45QpIDj9lvSM1QqC+f63w1kL11RDy+V7D1aT+pmI3vtyP5d1Vkhj7enE702oe4i5slkOl/4+/nblTF1Q9JwwmZxueq1YUyn0sxRCIr94zhMd8jeEaOORx8/vSWYIGUBo5JMME/OWaKcpwX+xTOfAAzUv1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNaCUKhPPMs+x6o88GDYxMHoyX+hdruuzi0NyhDpiyM=;
 b=QK5OZBh+5vsaotS+2ju0Q0Rkctt8lZNgG6NjXi7vHY2eIBXK6qeBVWzGzqkmPMrfQyCe6Ho6kRjEskVLie0Com5RtTFxI6J/R4pysvPSfvs/7qRDjhU3xbDHYI6ctLcu68Ng/vAabpT0duv17jn+/rb80b7VY3UjylXiDo1MrPwMa3BA44/EjfCL6A2Fkiqi6IVtiR0/yAi2PO2g1bEtGizZQXxr30SVqLtaUdwUmfTK8HOMchk09hQz9WBfEXWtYr3gVzO8gyTi07Gp7uhy8Eew7RzRt1DjH06e9vAuIQ3Kb66CJdmAxglwoQcu/AuQujbtv3SSZLgek3XhaN4OdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 14:25:47 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 14:25:47 +0000
Date: Sat, 22 Nov 2025 22:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-next:master 6608/11041]
 tools/testing/selftests/hid/tools/include/vmlinux.h:42868:3: error:
 declaration does not declare anything
Message-ID: <aSHH5LUduakDkSpW@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 859fef5a-8c48-49ac-a6d1-08de29d3076c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nGmmh2Qd9zkTc4iE257z7cvaq4Qv4o1LigFvW8PAxpVa46BAQrY9ahkXdQkh?=
 =?us-ascii?Q?8F/+wLOEFmzIo14t/ZxVA34tiqynGBViZ5eoCbJVoimj33u/ar0l8C2FUpbC?=
 =?us-ascii?Q?sriDzTQZ+xlj1VMl3nPhkwSE8q2Gppp8MdqNZ/9Uxet411fToPmQyQUH5vrI?=
 =?us-ascii?Q?aqX/UJ0Q9uwoCamB/x5MhGOLXt6w2niqE7BNdyGGDe/hwt7VL2Xw4ST2OJ17?=
 =?us-ascii?Q?pSA1W30ZdfM9QnTabnHxzpkua4t8gO+UkA8qU6C2ncU8qd0/OP8Py2LH/vnQ?=
 =?us-ascii?Q?IxccZet6Mc4q+X+4iv1wyMI20v7vw6OQUYtKz6eEcI1r7rb0c1v2HAau5fei?=
 =?us-ascii?Q?DZD1UyEiAzUVQdvoSi9Ea2FuWHA22AuvkIuIJKJrIeSYj5+6kWsJ6xdVcabk?=
 =?us-ascii?Q?3HmxrcCnoEESVFZjFDBHY4fZg4RJIkjblXP1NwDtFEYV3bRpf+gIOtHpORov?=
 =?us-ascii?Q?VX6PIBm2iD1iE7JQXkBQTcoiE/AbFsgRVf+jPc0OJkejtQ7we3rw1Ailyunq?=
 =?us-ascii?Q?xOmAfy0Ep73GpXglJJNTkcqnURWdBlEZbKkgo8GYJxtWMuPWDHlQPs0lLCn+?=
 =?us-ascii?Q?ItwiHJc+padcpl2SBJTbVxn5Xkk4ungtrstrNsSdK8ivDxAAYS8u5JNCkMWV?=
 =?us-ascii?Q?SnyHnav9DAr88fUKSyOR1bqax9ND/tJDWLv2eImY+vwgvr2T/wv5IISj4G+S?=
 =?us-ascii?Q?vutco2LFNTaVW6mmY7AOE/54XzCEWinwTmBFJG1Ws4chJscSM5nhHpUKtfru?=
 =?us-ascii?Q?qX2DrfSKqDkSjvfbIsnKZ2J5SMjpdKHOxmJCbnTAq5QULQ24pMkjuI+zBLat?=
 =?us-ascii?Q?aLw2MPifq3z3r8aRNX2vwYNdvlcJNM7FB/rpp2cvfuvgt2ZdmnExG6o0Pc/L?=
 =?us-ascii?Q?diRvwLop0vXPoBNQvF9ch52h846wkMJWSqTCFR0hgY4cz02fDQFY7HaKifCa?=
 =?us-ascii?Q?+TQbefQTdgt82vypWDaUId8RRbWAJUzImW2HfwjvkLY/4L9Mt/iaJ8/wSIEr?=
 =?us-ascii?Q?uyOkPm3ndLZzxQBZrfJiVjZctd/S7LNk/eixLZAE60UynGoeHM94qdVgEW6P?=
 =?us-ascii?Q?JwacvjsA2EpAOSw8BZRs5gPb8oNj7+5REIfvNT0aiSUznNl2FjYH2PurDQQG?=
 =?us-ascii?Q?kuVxmA42OrrW35kkT9da++2FSzFTays9R5Icl2JYgcIJnmmBCZQj1w0oj/fZ?=
 =?us-ascii?Q?+CuWgJSfwNSifkGALHw8A7kKoAnJxEGRAm6sWicycFoXe4/5uMVvMKpdX7/q?=
 =?us-ascii?Q?4Br/VbOPjadbUNBb41OsJvtfDE2ada8BXNlaRuWoZkkQBom3oTfSEa20DWyA?=
 =?us-ascii?Q?IMGiwnfDOa54m5dITVoWqNffW+bwqm8i2NKo4vmBlwXy64cJTYicU3/cU8l7?=
 =?us-ascii?Q?t8VEk/jWxJG7CCnjrVMrxJzbNpHll3NSAd4iZ8tuNUzgDDq7hj5d5kdYB7xa?=
 =?us-ascii?Q?vJjRP1X4GLvhthHfDbzKQcB7LUsQIIazAuoikYTsV8vTu02p1TtOVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kzFzRVIYjjcV6M3KU8QXguBVoexDp5kyhaPYCYMU00GqcudRPWgF71atuDEY?=
 =?us-ascii?Q?GRH99kDegC7c/G2ucbnUZaxMoyT6BbnPVlruIe5new3MbMsATKlMPSIvds3T?=
 =?us-ascii?Q?ikr9AFZVGf0EuEkDGjB4P248WGYvQQjHvvXGHfqvuAFJSs6mDcVZBHsDY47T?=
 =?us-ascii?Q?TG7W/Wwmltfuky0BC8oMNT9pY8v0LnT9Zc+L3EpEv8QCfoHUhaGGblZzr5bX?=
 =?us-ascii?Q?eVZ2Up1SvHj7gDOSxKH3AVFfzB3YwhWTzLJjuFmV+YMPrPuhLisIo2q+1p5u?=
 =?us-ascii?Q?0/2vhP7IS4XawLeNMSvb38lv/ZU04NulE8Tg1LFV7zjol34fIU2SC12H+qcg?=
 =?us-ascii?Q?VqKSLybnFopNpbvOdisYxQuMkeCmloZwzzGFfdfOeMgS4lhZ7EAy7RNRsHw3?=
 =?us-ascii?Q?g1gHyaFap/dsa88wjbM3B1kpTxDITqxrYQSQgDWT4KXEMX2+d/WIVvaoI5QE?=
 =?us-ascii?Q?dDUZsgdXVTeWoqYtPnCNcpGXMKprOUd7YEzfelLRLM9/Q21jngiCDb9sQrYC?=
 =?us-ascii?Q?mLYmfYBNrFVzBFR0k9ZAzGoq6d4Mz9UI9bZFJFG0n+zyDKFG/KsuvPUNoTVw?=
 =?us-ascii?Q?4nS9jbw6iA6umU7K19LPDnauYht4dq+LkrW94jngJ+8kGQQZSIR6mYSH8tLk?=
 =?us-ascii?Q?aprYYd2wGE8owppUBFM9QfMSh9s/M1cLbBBclc8GyofmYUrRDg7QeoYMu5Tw?=
 =?us-ascii?Q?2CFBszgzEsC7sglQ7kAyEj1dyrIB6GKyN2mV9nyxkuhBWIYxUS1su60bfA1S?=
 =?us-ascii?Q?nE3L+/uDNUQsWafj3if6B0y8pQFoHxyY5dO+6DBjt71N9bTazaF1R6Vu18p8?=
 =?us-ascii?Q?ZML7uHQSBdzXIhIxjX2BmsZKITZK1AEJcyx05xPsYJFIf2mz/mGwRnM0pxH4?=
 =?us-ascii?Q?W50FD+IGh3VvgQF1kp+eYTZN4gqEvwkMJlNZRjF4bo99Y2MqI28a5J/qqMuQ?=
 =?us-ascii?Q?tNrfzp517Z03re0AOVY7Y8ocYNEnDoDxrMbauZ+y8DzdHNLjIx2bcTWoFqL9?=
 =?us-ascii?Q?Awg9pHMtgo4wuK2ss80D+zI3p1w+7Ak/mL9kRNVdNUp1t+ugsyDLc7xcMcGU?=
 =?us-ascii?Q?9RtsN3KMKYPgfb5TgtJ39l0qQI8xaMdPRIWYzE7M4/LsEDJz0MKLzX8vVMGK?=
 =?us-ascii?Q?/a7juUr9IrPB4WJCi5UFU8JeDBKIAqawCZDLl9OdqDXu0FzLtidkpIYSjS/i?=
 =?us-ascii?Q?eRR9Wvk2tLkG//F0aiT1e/82CAFQV5D1e71QxxhnHGxVKdUNFkGcfnNPUKT2?=
 =?us-ascii?Q?Euoe8/9NREzBQ5VCODwgv8+WWZlhqcpYJWqFBM2gCK89RfIiGLoBXmkgv7R4?=
 =?us-ascii?Q?6Bzmk4/bCkAZWLjGuLy6VAMuqKObzJl2Cy07SuLRdqBdFNdt89h4VkBUpY97?=
 =?us-ascii?Q?KTZSru6TRPrW4UV6U/WI+xsV0MkeTLZzatuscwRxe/uUFz7sIo0Nvolb9Sn7?=
 =?us-ascii?Q?o2G+m+Jb8ciION0XgzUBxcd1h3E2GvjckzWMzWFESxs+zpmjsPx9M90mJ1Az?=
 =?us-ascii?Q?vTYnl2IoVVfsrFygAKxdXPTdtXT7FJAyOgemYrM0OjE9wxNoWOBxbdk8jEKD?=
 =?us-ascii?Q?OuMXU24rdbyziB8nQq9r2I94pB+CuRgpFn9tJlsqgNUhrdtV79R/b5lKcRug?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 859fef5a-8c48-49ac-a6d1-08de29d3076c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 14:25:47.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMz2oiczHODv0s83j3orlGj31swr6zmxX3Diu5FgZPOOg8ksqWwzcBwFzmSwFjNBUfYRrPIzMnxBqQQ982hBjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: a657bc8a75cf40c3d0814fe6488ba4af56528f42 [6608/11041] nstree: switch to new structures
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511222209.CmfOK2uR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222209.CmfOK2uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511222209.CmfOK2uR-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   In file included from progs/hid_bpf_helpers.h:28:
>> tools/testing/selftests/hid/tools/include/vmlinux.h:42868:3: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
    42868 |                 struct ns_tree;
          |                 ^~~~~~~~~~~~~~
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

