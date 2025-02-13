Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E46E78F24
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 03:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739416189; cv=fail; b=lr+kfkggL2nzHeLNr/ovDl9LCc1JyY16Xo1wdcY7NW8zmKex/PRcOXfuEs2f1Opnxk+whdRRjcL/roBFxRlCq8zxILxhujF8tVIWdlI8hv/P6xkyIXUj+pP9FB3aU5TXrsI2Gdk+e4qqozrYo8YZMs+DhmiqMFPEFpqra0Gftvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739416189; c=relaxed/simple;
	bh=y3EwDIBL+EFqUZp4B/Eu87i00CHChL/qSvE1epysPUE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D7sV/Uv+dISVf56hiy6+EpydB/HPp/qQv4OBXt2h2k5MWTrFVgegOtFN3OH8V8QFBGK/FiCy2qtHUpum/Rdp7TvbbS9fBGRaYXnuS7EcMM2FHe53W/9mT2iFVDi1YULeBK7ySfbEH+H4wP6qEKfh2MZeung9BxQ28MTtrsBKo1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFIe8QS0; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFIe8QS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739416188; x=1770952188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3EwDIBL+EFqUZp4B/Eu87i00CHChL/qSvE1epysPUE=;
  b=nFIe8QS0j82xTCQyBkkmayodaoPGrXERqqCLJEJRu1WK4k/7S1IHmKQA
   iRnk9GVUbO7h648ZpbHcvAKm9AmTybJghxRNJZDBxvrAVonmGt0DrK8UP
   YcnQgqFWYIVdKPSJu81FIfEqWm6waMGiJqADXOY/DU7zUMq3QjR8uIl1b
   tza7mFxoQf43fjz8lR89aoPwjjg9EwQSgRJjcc2v5H/Bg0Sw+OZ7rnKzX
   QobhhdKXXM7hMcYtPvpfg3xjpMPauO+C1+fthCOcaNsch/bBO7M44it6n
   TwYjS60NvIsLRVMkT+oHvOMFc2pqtrO0+C/eV8Z5VOhiMNZBYmdYClKw/
   Q==;
X-CSE-ConnectionGUID: lK35geOzTQajl2JjgcZR3w==
X-CSE-MsgGUID: D8Tf9uZaSaqAdPect1QcfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40250836"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="40250836"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:09:48 -0800
X-CSE-ConnectionGUID: zDL+4TvQSiKgOR2xpJu6jA==
X-CSE-MsgGUID: nt7nzmNAR0eDTpdOOWJzlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="143856493"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2025 19:09:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 19:09:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 19:09:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 19:09:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfTPfaa4K0iPduxPslqkQMS32HGbTs3AP5XOM/rOGA4mGdhAm0KaeB+qNh7Jb/TrgQD6kgEYCb3DB7NDuH1EbNt0W3A7iJ4HjMJo9UV2ZMQRfX5QTHS+VGPT32HrTSu6jfiHT9V6BIJkeSgIDKHhRVRQg+0aaXV08JFL+/477C6pwB5yT707xCtV4HUUSb804NkXQ2zbgkgt5V0/eUOAq/09xziq/PVL44qX3EnJPKgZeviO4hCRGEmh24D1HovpL/0WAKQfGS8EU1r4O4iTjBZeNOvXWk8sDE8hfVqZKhAgn42e/dyEjY50KdLrmFqSAHcwoBAvaZAh2suNCKv5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqZ7mmZh5JMr3hrglBev8g2a5InI+Xq01yBQz9hjpdE=;
 b=h8OYo1aflnrLm81dSI0tc4PL57jlk/rV+TYPAN1G3FZ9W1PFcoa6IafukzZpXymIVIe0wBB7fNktT4ASxtdLrteT2Mg9tJ2NCQuzX0+Q/a4ObHzYWZJLgSEXXD0j8C/j8zrKAaBM/Q2a3q4EsXeG1GOd13JkAh4kpMd03alH34N3vCqfZclL442g4Yl7jt5QppiD16JFpnivNN7M/kc6Wd0t6C2VLVXXllcabIoblKyVdCt/Uf8YgZSN+Ibu1BpJAwsFgmF47xHDOiQIVkJJMn8lROk31frUZo7P2HKB5gRvT+U8SszsVe0/OYriDoFtFyjSHgDnR7+mrysUq4YpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 03:09:44 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 03:09:44 +0000
Date: Thu, 13 Feb 2025 11:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-6.6 217/217]
 drivers/misc/mediatek/slbc/slbc_ipi.c: linux/module.h is included more than
 once.
Message-ID: <Z61icF2IqaFUvkKp@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: ed307624-d9de-40c2-ed43-08dd4bdbdd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ALQaGT2ghXfJM1T9aGm9nN0L0c4b19OlnvYTZASg1hs9YRd+BEZsxpQ+OzAa?=
 =?us-ascii?Q?3QJbhptj85HtvcRtDTZNiM6fEpwyWpLHGhG84WTtBsGUsCBTjPDUk+aFOOlm?=
 =?us-ascii?Q?n4ZijEhFha8wybVXRiMn0kFtsjWz+ilXtjyMpjUbXrWTEPucGBnQkDjOqPuB?=
 =?us-ascii?Q?ZsQmRvi6iq0bthk3L1/KmJoiNmDRHSV7cq5RBt2XdMvMidOwdSv7L5qaxvIa?=
 =?us-ascii?Q?m92oygTpEo9eRoUs6/pVmKVFCQHyLlhbZl0Py9annbkcWUkCSwxH36ea4ACh?=
 =?us-ascii?Q?P0MrBGAyqoFy5k72gsUlJ2FTz18zK3TwuMFOtXJVEXybFQD/tlUjr2IMoLRg?=
 =?us-ascii?Q?1oeMo1nnUuJiKa/muCGP/EoOZ9295DQQxILyTbFyhHqW+Jt502Ma+awgy+5L?=
 =?us-ascii?Q?ngFHqRD15gN07z4+/FfucHiMQdj35pk3QVw+O+o5SkJDfKjUNN3r5ugLybQV?=
 =?us-ascii?Q?Cqy30qqXviPozyqfa2bvRxeB3HgdDcVXm8PkHuLh2JEFDA+sQIidWG4y5RIZ?=
 =?us-ascii?Q?MNNIuekB6wUO1K3TOz4dLQFX6Tp1umhVWKO50njhAgauLPwBqDpWUxP7wdhR?=
 =?us-ascii?Q?bhvxNtRp2uDySNAChvymiteERxnNO4k9RzLebzJphwEBbHhkEmsOcctGCCB3?=
 =?us-ascii?Q?dFUZ8Kxtepg3P3mfKvLGR9lGuyX6KkbmUMN0EN5xFRiFDC2hLyyGExHYY23Z?=
 =?us-ascii?Q?g7VdnKxO4kVUd8Ura0GIULANCGIqZ7sCYdtnLjxXB7KBZxotsGWIM2JYUgrF?=
 =?us-ascii?Q?4NJ7o5daAifsaE8bU59Lt8rKQ+QdsU316QDVBOBr2CGquFrd5Zs3SzFAfnb8?=
 =?us-ascii?Q?FNyYBETOaFJ9CIhEk5HNXyV4dM8wdKQTaidG9qgptsT5ItsWCqnK/b3ZB3+e?=
 =?us-ascii?Q?ZtE6Gqz8tNoT5hoSlEd8eoqRaS7SOgzaH7tQxFT8VqQjDS7HPgcfCzYq/mg0?=
 =?us-ascii?Q?NXGx+gJGmFRrKRhN/ypx0FmvgeO8VMRRdt/uXDr5HRSN9/f5YL1oVddtgfK1?=
 =?us-ascii?Q?4xW+hjFRnLHe/OGmzJZ/6puEaPcMc3nVDuvK7GdOrgzhLSQC2ZSLOEBuzrdq?=
 =?us-ascii?Q?zIY/ObgEIANsAow3eHS/XRKXmn95+Wa2Q/HeA9VVtQn2sFbnJBqAlEMyhLwH?=
 =?us-ascii?Q?+YjEAftGsf43QRARcF0DpEvdMx+sITbRvjCkoatvinte8yc0qG1NNEZLZ3LN?=
 =?us-ascii?Q?1o1YILYztvvcMkgDxa9rvgAKhaezZwJ82MRVbQethURWaL728Yp3wyXpa/9z?=
 =?us-ascii?Q?h5KY+DTvR/dVJREJI8V8aVVeRUrQVBEYU3p/Q5hiVgRMtUZj72JF9GmvqLyo?=
 =?us-ascii?Q?EYF3FkxZID6jsSzq2fYmUU3X1DUX+POSA49F97G+t13Sdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sd1dUOUeXaAARRS+wAo0iXCyhYGdLmHT13zoGDDRYEePeXKT0gkZZyOiYNnm?=
 =?us-ascii?Q?bKXJ90i3p3TKUO05yPgbmejBa4ZTtgcD7CNNuB11Bg9xl9YYc2vU4BFoyIWR?=
 =?us-ascii?Q?SfnkD96zjHBONdZf78XIb5eqArqxM1iJKhbI54uLnxWKf/bnB4YWpXoVYHKF?=
 =?us-ascii?Q?gC2Iz0MepWZeHDg2mioVECWuwI2mTEMq3oSNg2srREalHQtNS53MS+4KOANd?=
 =?us-ascii?Q?cfMmk5SBfRPDuevEKE2gqMSGZq2v7TSeUk295mxs4FjTer+VYyqbfGr/aW8u?=
 =?us-ascii?Q?1zsgSHmuVm+LXWILkE8exacp8dSj+Atzyqva6uajEOI5ojZ2kOCvucXDEFEC?=
 =?us-ascii?Q?BaNjDJ0vejm6mSjcuBwIl622MIgU2z6gp8UErAZI/b/hCofB4V6/1Z4/kI9s?=
 =?us-ascii?Q?gi1e6s+P0iRQANRj5uIoIEY3DPUIVLCuYRxh+YVVxkbJOUl+KAsQ60xcQ54I?=
 =?us-ascii?Q?GPVIFsZWDtxePU0gwdH4/ADss1UM9UfUbXQSf5AyjTt+/Pei9MSU4EfdJZWE?=
 =?us-ascii?Q?iiEsnh3465iwiGH+COMIBIMTmhjH0wRxpXHfZ/bDvyIhQAxMtL6Vm+88ljAY?=
 =?us-ascii?Q?SFsBiDwjk4bHp7mbfzmUOgo8HJA9jP8h/hXFIAdBq+OUsS4TjH6VStA/Fe/l?=
 =?us-ascii?Q?/+2EiNIOgGKX5HYzVCubcPwJo2VOw+45vcHssLoST9/5bcwKpmM3Lb1u57D/?=
 =?us-ascii?Q?/4QD6cjh4XpuRDlZmv0H1tuEyJ+GnM3JbTtLR80uejPMWga/L8XapGDX3BJ8?=
 =?us-ascii?Q?WoeFkXLZGOUG2/5sJxy7r0qrzg0heVcM2SRsi2+/m1X+svmHswkv6YFCW1OW?=
 =?us-ascii?Q?mJX+r/6Y5E8UYAJ6c2sT1FcgvicgOKB2MJi1lMW+OMepeI0GypItoEKdmXqV?=
 =?us-ascii?Q?Ne9Ct0aEBTuKzWfWJgRaV2Zou9gYz4/WL/wGqbiHK2OtL4iExffYQbxk03oO?=
 =?us-ascii?Q?kPsNXUojR8bTbzyECk4Q6HZgFWf8D2p8HnYHOHl1bU68MVNu4b23cvZT9IE7?=
 =?us-ascii?Q?HsGsS4SvV9a/HRngUI8b4A6AcwkO/n0Vt1I1ZoFJI/O/sF7hORtiKjqhbVCD?=
 =?us-ascii?Q?OkbwQIHKCNIJkTDnqsxvt6mZVoJXpa7CoRfvjFrrqSJ2frQpapZyOWK07yxH?=
 =?us-ascii?Q?S8RvBfJ4zjFaNUx2PUcUCn2GivNnJQmikObRQahBYLVo7Tmi+5sMDzCE0qbW?=
 =?us-ascii?Q?eGmNz4ZGP+zWxldn1PAh60NfIP8Xho41nevdh1hJlLtwV6bOQfWc0dTCrHaP?=
 =?us-ascii?Q?KOGWzyIMWt+kqh8jtbH5XEPNGClfW96TxXbajGZmR8SXKPzbt8WlyxsST30s?=
 =?us-ascii?Q?88bCSXCcxS6D+RN6bEqLMzF7dNWE1/PFFtcx/cIY7q05gXcRnAvZqt9umJpw?=
 =?us-ascii?Q?pJa9J8gZw5ADXRRgZZJ+nqu1vOflh0bvZ5oDxDjLLkvkseC8I2FDrkXbqO8n?=
 =?us-ascii?Q?a2kSx9FjLfPrkPdibGa0aWxsbqyby1dSGAETuesdf+9TdE80y71SgqT4Tq13?=
 =?us-ascii?Q?fNefwEeEBp6a6S/YCrbxknQF/gaW+Yg3kVl1VxTsLC6qaAvnR0p5H/I7mwmf?=
 =?us-ascii?Q?/6VonPq+yCnVLIPKgTMj66ZITxCzxFELLqC1JA4sS1xmtloUDlIgh6xastOI?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed307624-d9de-40c2-ed43-08dd4bdbdd3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 03:09:44.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OH8+UqN4w+NCFvNslBhJEgBWPL/kAGTj9LVAT3xVqfltst/5hY3s/ldi/VxlkrdxSfFratstQ2PlJuEgjm1DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b603fe68bcf1fd8aa46dd46190c53d641dce5cf0
commit: 506f6613f2e6836fd59eeab2456dcfb0a000954d [217/217] CHROMIUM: misc: mediatek: slc: Porting SLBC driver
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502110040.tpQ9LgO4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/slbc/slbc_ipi.c: linux/module.h is included more than once.

vim +8 drivers/misc/mediatek/slbc/slbc_ipi.c

   > 8	#include <linux/module.h>
     9	#include <linux/of.h>
    10	#include <linux/of_address.h>
    11	
    12	#include <linux/scmi_protocol.h>
  > 13	#include <linux/module.h>
    14	#if IS_ENABLED(CONFIG_MTK_TINYSYS_SCMI)
    15	#include <tinysys-scmi.h>
    16	#endif /* CONFIG_MTK_TINYSYS_SCMI */
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

