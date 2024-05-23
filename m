Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE54685
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716428910; cv=fail; b=PeFBmWdDMFyFCzZ5R+jYt9FysxBBeA0bRp1SzPaaY1YPws+NxqWGioZlAUyhhd4wusFAfApXb2P8LzDAbAn3epiTeF+vbAMq8PI73SzyCt2p4j3OyU2V8NANRIs5nWIw+QUoNiZHRLpiVCvtaShBSD6kRNEQyn2KJvzd+J6AuhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716428910; c=relaxed/simple;
	bh=GE8rMmFc+K8xMvjRnuIVIU8a28qyK6Sz4UWiIrdbodE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rz8jXjW5MnphtGyY1AAOXdInjCvAAFOuSEYhqXJo7Drbd0HYh8J0WhNDcffdVLIvUC+xJnc+GK+H5FA4U+s62Qvp+AyZRNoAH/QQIudUs3761L8Fwjh6JcO7B1SFYnBkKrWF3aA+v9P18X26xfYdZ+Anz3fI8W2j+DzLavPe7ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Db47BFAG; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Db47BFAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716428907; x=1747964907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GE8rMmFc+K8xMvjRnuIVIU8a28qyK6Sz4UWiIrdbodE=;
  b=Db47BFAGm/WeNZIRNtz3vCjFV1PUWk6jL1ARsdpVyBxjGtEY7cW/husn
   z3TmtEzzOfFE6giOm8Q8xG43X4Kna+V3iKFDASfWnKGjCr5zklWgwF34r
   cokgfeWd93xE8pA6ENMfiEA9Y8Xg1MuZcuDsLAimL0LHtBq4hkgyrhSNh
   qnHK2OXMhP6UlzoKb7rgbBVJsGtvfiVvajGqYtfW/zPvNUT95JtS+nC6T
   YhmAWBSqU+yWqVJbAd/uYl5TXchXFVqAS7qeg8rw8PCJUhzqw6F4RGLst
   PyDMx7UTJkxMs1GMMewCJxkvDJ5zlZ4KHIR2fdBL3S8cVpLWMQtXSvId7
   Q==;
X-CSE-ConnectionGUID: 9h4ro3GxTGypfEH7fcFK6w==
X-CSE-MsgGUID: I7iAnzXhT36sC9Gpkk0s6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12893672"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12893672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:48:27 -0700
X-CSE-ConnectionGUID: abLafY0sQciCtiyDBcRArg==
X-CSE-MsgGUID: OWIKKwP+Ruuy/eOGcJci8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="37882493"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 May 2024 18:48:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 18:48:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 18:48:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 18:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWSAcsGr0G7rGzMduHsSXJyQcV/UZfZ4oXGjX+0Fp78MqgXAr1HrjCmq7FHPnoJGrak5c523sSAbQ1G++CLST0LjRCVpQnPpUpCNpyxfuInz3TX6rPkPMRk0Ft1kX/C2ZftlsN49A6AZNNFEdjezauOKCgj+E0xA7naUILvIGNoR7jtqbIfCUAGB8IfY+D6WnCWCbPfeeycVYCT/mgDyMaprbzNPo8ay7/cF4nu2E4mEPHi/sXDZSScvrrDup34yVRXakMzPU0eASEbm0C+TJeUCKY3WPiWaDyMyRKeW5B4GA26ZO6JXrZqm23Fv4X6kPNNNzrXAH9YWDq71qMvXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv1kaO8kC0/0nbn+duFP0ZdVaqvuHmVpNCGEyzl8fq4=;
 b=m4wWrvyT41HJPgR7TudYXZw7Kq9WtlXmpagdGPzhFKjrolVsmXZmqU50OAtVt4BWwsBw+JGrXdZ0+WTWErgpUL3hoP/+VLni5Ea2PDh4Fv1DMMqjqnPv5SUcXrzKIH/gireM/FHGwwBmVlNNYvrbWyXfOprCpIuBGexqbxexT96nl/GxeC/Fhgn/rpZjRglb+rybSfrjSDJAi5GDy8TngMsmRXnYyRPu9lCehE5z9xDv7LZKINf3tV+amYV5vFHS4yeX9FgrJTZ1y3H1U1VYBvlAw+y70/Bsel6OJJUzPkttMlSCsDixUctTGodapfUIbrNTZaQ/GARk7khVFE+LbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 01:48:19 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 01:48:19 +0000
Date: Thu, 23 May 2024 09:40:01 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <zx2c4@kernel.org>
Subject: [crng-random:vdso-droppable 9/10] vdso_test_getrandom.c:146:40:
 warning: omitting the parameter name in a function definition is a C23
 extension
Message-ID: <202405222229.7dUI3Wc0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b70eb99-3031-4a38-d7ba-08dc7aca6ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FfzXR+BLpf8iWzgdlKohZqOl1Awz+QD3q8btL8/FILOwcmBMFys5obLTdMGA?=
 =?us-ascii?Q?fCFaeSmpNotsq4cCnCT/oZYZl5ij3n2i/0VRJd7MCRbYJLiR0zS/UAwVnC3n?=
 =?us-ascii?Q?9QYWNdahPItrpZU9U8ssT8VNf5YOnlpjyE8Hnk05FvGd7Lk8fM9ZOuUqu/dy?=
 =?us-ascii?Q?w3DVElUn9Ceh4BBVItgAgf0+5WJ58HzRjWcTNVLot8Q/iDhU/VBqyN7smqE4?=
 =?us-ascii?Q?RZa5LwirVyRm9OATZdZ5H6gZco8dsh8Yt+dOTIVa26hhjvWhRRLUlY/8E/sA?=
 =?us-ascii?Q?5ycnz3N5vZlg+DrV2uexWU6guFyLDTvdCU0ulOaqzLjEohtmY2DYfB92WP1v?=
 =?us-ascii?Q?/QTkv7IRruvpN1Pil15g+WUlpbyxPkp+wvCksapO2K1NaxqgSw2xmYZDftO2?=
 =?us-ascii?Q?MsNVEYlKcqW62Co0LkQpf/WTx5kZWkrOgoI+Jn96BgXs4fK5IiIixXakbXas?=
 =?us-ascii?Q?88qq6AXni5cmPe2i5UFGXoRDxOZbWv1u3zqHdhv0aRKDHzyZ2CqYHpACLeI/?=
 =?us-ascii?Q?aOaKwFQRiV5C6VE9ou6U2wlI0BBoPs5WdyRpmn5P3+i+TvWDk2oQIONN2328?=
 =?us-ascii?Q?1y/G2R5HKw2dwjzvZ1P9SdH5Apnbc58eg5Fn59FIzdFEFl0rY+6hprnLsBmJ?=
 =?us-ascii?Q?ReBkH2lmjTYh/2tRhjH5wC9YmHCH+hNI6Rj/uToT8FP0RVdoB3xndKuXPuzf?=
 =?us-ascii?Q?6K6UR43if1Qur4OyPXrTydBuR+oxteiscgaihkPw4h2rCiReepky91OVWt0q?=
 =?us-ascii?Q?nO48uF138I9AGSyMhvxNbmCPO2G7uXdVWIRJm7XxU3Wk/CHpzFDTEVKumfQg?=
 =?us-ascii?Q?Ag1EdTndPuEtw+MINJkMb0cxuAPRrOU/BLDvTxrgpmnXmvnxPvWkEY5eh87a?=
 =?us-ascii?Q?aJxNrm5KoOeDkxdUkGg+rhg4CS1Lur7lUohMtehRqXRnQklbcW228yosQWWT?=
 =?us-ascii?Q?nDTaASG/3eM9GqN6BZrdG62grKi8vbwWoMziG2PXr+RGnWcZYF/zi25U/VtD?=
 =?us-ascii?Q?t5jDjkBWN5WHC5wynFa+lYb+3VX1+Z//fJCptwJUkGP6E2Cv0zAyQXeiztKo?=
 =?us-ascii?Q?RDwKijIlf9NWgHqX8dxLphTUGICRvrmYMvKj2cFswK2faeLmp0QPiet/t/wQ?=
 =?us-ascii?Q?kYDECVGxvmjm84sghIKUlCCO+UYmmtaMyrJ0ejM3cbTNqX8b+L0FIzzhBDJa?=
 =?us-ascii?Q?1GUC0pjrXOQfKepVdOB+LGPEdZmGX5NmdNcD6gQ+ZQusJljzjczDpXPOMEU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bhswQ/Tffb/jlEaUPfXnsEukTXLgF5LyZ6CuEE6pL0aSmI1u2kgZFyLlZ+Tq?=
 =?us-ascii?Q?fC4/xnVyHueEofWI5hMwPrb8AGQnY184yWhgkiwanxN7DgDWDWgx2iOrefqG?=
 =?us-ascii?Q?HALgA2Nwu6Qte7R2s6AmwPr67mnKQWK5Xe287pvbq1mxgNpPItSFFFd3fPbV?=
 =?us-ascii?Q?TgpF/DkpxxSO2VGsgFDHXowH8rRqWjHITwoFG+tKT3e22v75J5w4mGNCv9ST?=
 =?us-ascii?Q?24LQZh0spSo5oB8ttlCZO++hqZ4pdblWJ64rAXgDLghpVTFpv8BYIw66EatC?=
 =?us-ascii?Q?ESD10Q7ZrkRTgsLb8gnwCdFt7zFATt91uXbGOP5TAPFDzhwyZ3bBQcbM1PQs?=
 =?us-ascii?Q?4A7MefyKiM+LLxtGTGaSD4/uxdwERG3WHhSE5N53Z8dh/ionDgcYOa6bq0m8?=
 =?us-ascii?Q?xHyXmrl6xvxpT993NBAZ3kYb8f56TmP8f9QY9rvFbJf8trEBuw0CTTpoecer?=
 =?us-ascii?Q?9nTT6MvrcW1EA1Ow6a3vtt5o2RPdG2AKy0HuTRtWfg2cb2D1aKfqmSsdX+dn?=
 =?us-ascii?Q?e1aw/Q9ZLdCHh2MgnQcTZi0rnXV8CgTLraBOVY4xmyDhf2AIXk7fQPJfYvsv?=
 =?us-ascii?Q?XZ73UkId2sVEZHdcnCMkL7oi3dMmAX36oZ8wkLV2WGjS1pVwWwJK1xKI8nby?=
 =?us-ascii?Q?u7R3yj1+2pXflNvjdtZNolw2J4KHS6QMst+VbuR2HPKS6+eFJPNbCGR48dok?=
 =?us-ascii?Q?LDXnOUTtninry2TEbjtg0rlusPtG+rpLI9MzifzEC+9M8hZ9Vnt+SZJ5yIig?=
 =?us-ascii?Q?OcmBTwN+5zQVyFPNE7FI/QU2+7tq2RgABo9UnGVHsBnYazDuFIqboqdg3jE/?=
 =?us-ascii?Q?eGPceeeMNBStLzHUjoyr5oJH1MIve9vbcZihWwD5w5AD53zwe9Z2ls34NzLk?=
 =?us-ascii?Q?oNliOfrtjBDGdqwJQSuKT/KyMDYFD2IpYJBcghhE/vEVaqqFwPohU8+s2NAe?=
 =?us-ascii?Q?369mHvGi8CIxnOOIl0hHPvaiLyWm2cA3vV1++eceFxnL4/kT2zRmz27pmgu2?=
 =?us-ascii?Q?Bm5FIAFJwt+Jrtk9ShjkKh3VAoX2eOpZT2/khPbvJ91jYTfdgHQey3LSwdOx?=
 =?us-ascii?Q?+uxD2Ltjucr5bOZHpVrB6UUMTZ1ldHDihE4bE9MXnsFEOQe5Jewr63c1FfZ/?=
 =?us-ascii?Q?9rfgjE7xVu0bJgHWdf7Hnj262oN7vZhFIUt2S5TbbdUTZOpry22Pssfh8zpu?=
 =?us-ascii?Q?WIVJeXD+8wBXgvqTBRmr2Ajx6qqfMw3ZqARQBYFD3cmxTpDInlA3YujEhiZI?=
 =?us-ascii?Q?9n9+Fm0DbKYPbXgTexleCHP/IPdyshmn+6mUM1WOyKMz9A161ZzGCoza8nkq?=
 =?us-ascii?Q?sb62WXIu6E05YI8/YgFnFlwCDN6l3jrwCrmv+MjQKEvSH9eWFogcbJ0q0wJ2?=
 =?us-ascii?Q?1VGGWcY1lgkKFGZLP21hfIdWcV+ggIb2lN9ZkZx0zMI3lhru6yMP4ZpYVmgF?=
 =?us-ascii?Q?vEi9u8NO4V0GFAeyNfBV07pzHwtgsonnBEQMOJxDWN5Xtsmzx5Yr0lwwpeSl?=
 =?us-ascii?Q?bYUmK4JXONLJW5znM01m+zECG4pBwaRsZZnPg3cZPUfh6snKnbxl7LCQ0gSP?=
 =?us-ascii?Q?nP+wkFGGwFY5rgjjPk/SnRk2j+mIMyC2VvYkSe24?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b70eb99-3031-4a38-d7ba-08dc7aca6ba1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 01:48:19.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFo3OxoOiu/Dhszr31zBLpbmDcpBs4jEeWDIT5CaC7LfL0O6ecaAr+DO5SdMtZvQzNxO50Lcpg0rYgAO3JRoRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
X-OriginatorOrg: intel.com

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vdso-droppable
head:   a7eca399da39972132d1fb50f4160b86b7498198
commit: 8cd2c9c9e4c91d99eeb68284c1f5d464a2925963 [9/10] random: introduce generic vDSO getrandom() implementation
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405222229.7dUI3Wc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:146:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     146 | static void *test_vdso_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:156:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     156 | static void *test_libc_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:166:43: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     166 | static void *test_syscall_getrandom(void *)
         |                                           ^
   3 warnings generated.
   parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
      65 |                 if (g = h & 0xf0000000)
         |                     ~~^~~~~~~~~~~~~~~~
   parse_vdso.c:65:9: note: place parentheses around the assignment to silence this warning
      65 |                 if (g = h & 0xf0000000)
         |                       ^               
         |                     (                 )
   parse_vdso.c:65:9: note: use '==' to turn this assignment into an equality comparison
      65 |                 if (g = h & 0xf0000000)
         |                       ^
         |                       ==
   parse_vdso.c:206:22: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     206 |         ver_hash = elf_hash(version);
         |                             ^~~~~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   parse_vdso.c:207:46: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     207 |         ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
         |                                                     ^~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   3 warnings generated.


vim +146 tools/testing/selftests/vDSO/vdso_test_getrandom.c

8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  145  
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18 @146  static void *test_vdso_getrandom(void *)
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  147  {
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  148  	for (size_t i = 0; i < TRIALS; ++i) {
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  149  		unsigned int val;
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  150  		ssize_t ret = vgetrandom(&val, sizeof(val), 0);
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  151  		assert(ret == sizeof(val));
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  152  	}
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  153  	return NULL;
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  154  }
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

