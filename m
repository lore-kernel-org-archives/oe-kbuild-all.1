Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CD3EA90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713173423; cv=fail; b=TlFl+jKRf3PvzkuUziwfpu685LkUhTssTj91W4Govac669+BykO790GcGq0mQdGn6mCFHoopTxANFsKwKXqTKiaoJWw0qX70k6cP2Gjb4yA5E3P7ldEMMNKG/uhkfcStkB2Tkcb8S3e8SCORRugCoXQiYLkWS3iUb97wlo5PMlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713173423; c=relaxed/simple;
	bh=S1mJ4XitDwkJD2Fi8QZUtWuzIJ0wiDelcaN2gWnJ49U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DXcQu+uNc3p7sYyCbSXdh/mqwx7GwGQdu0IsUQA8P8J2J/0hwIKtt8SmXijs6hVg7wdNysr2dP4fs1mcFK7fIMES1upyeQjQR2wv/HLTlJgHtZsp2Fe1UxiHl0joGa+RiwsuGKYocsGSWQBCOznuD+65c7PX5odDMvVn/Vdgb70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcftBIGu; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcftBIGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713173421; x=1744709421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1mJ4XitDwkJD2Fi8QZUtWuzIJ0wiDelcaN2gWnJ49U=;
  b=NcftBIGuKIRjhUZkGmrFCgYbPQtYfPbXi5Qeu/NoOdpzuCFNrPxd4W7j
   sHpIz0afvo2ckAAnxW7P2Gfdxh+/m81gZLQB2ebZrn3kCWueGfqed/8mS
   dmxh9Mw9mUy4fTRF7XObPd+Vr7YPXjTc96OknBLF0prEh+PEftQ6t3rxG
   tCetNu5k0v/DhafLGjU+zSvciG4Yh4zITSv+lTClHTexJVQT/rQ3o4QGv
   QE6FRcNRzZPmLm+d/82Z39FVYCyzR4ZlP7MyAcO9WOhC4qKr++Km+rWpp
   +mNa2SWKCll1DPo5yoUpBW9G0CiCHOSOfuk+GaJXMq42pdYGcZ+y5CF3F
   g==;
X-CSE-ConnectionGUID: NY84ojTYSryj6C/0yfG9Ew==
X-CSE-MsgGUID: xzlSVe24QmWXGyDt4Rojqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19945047"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="19945047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 02:30:21 -0700
X-CSE-ConnectionGUID: HjD1MdzUTEy1C6aVtLAbPQ==
X-CSE-MsgGUID: 44Hyy8cATS2aKKUPDutE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21935308"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 02:30:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 02:30:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 02:30:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 02:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHjO1nq1vkTqHDRpMJsveA/CwBI41DrDuIHrPHYajZofLx9FfeK67J91Fla+y4D76YK9qfBUYc8htvHwUW8FzH4ZfQDKdjvr8+azJIryakZ957cVDBbX2a/RIXpW5Y8F5BlL3BfmCYD45Gx1SD+AL5WMWscOsp6lTi9Zkt03u/Dg1ldh3YUZCiUguk3Ajd0aHe1IvgzNwsnhkDtj7FeqdCY0acJ8NgEp6vVu8SVxHyqiFeVqda52b01R+TKgYzi931B52mRdO0qEpsBpgiMmhDKZBiUrbp60+qi3cOXGgcyEeO4T1p/4MR2kX+WQzH+Ap/JtEkaLA/JOTwYMWpLMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rfKrx60P553ApgDLprChz6x1gCCM0fAZ9C+VgYHrpU=;
 b=WmZc+1HkhlBf7p+VIVnldOxlII5csQ0fVfgvs9AJ6MzADHP3Y0H+tTkmDDlTVMX2NKUrfQaEWzD/vTixwsXdf6TJTFCad0WohMrufj1od/uBavEm61LiDglyvdBZCKcNjdFH3NFMv52YajzQEQagL64quIoIsoo1wsyBvm+Ayes2RMgVuc23IIDsq8DATgfVms3mzEr1j08SIBRr/onnzvwsVGaqIr0c5vB2sDVy+TszMdDs3I21dfEItv4IJEha0u+C3384zpQpB2bKzkDVzL8MIAqeN10eIPP5NaEMO/6hxpVd0+mCC6/68oYkil9EFFQ2UVwCVY6GRrb5Xs0Q3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Mon, 15 Apr
 2024 09:30:18 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Mon, 15 Apr 2024
 09:30:17 +0000
Date: Mon, 15 Apr 2024 17:23:42 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>, Aaron Lu <aaron.lu@intel.com>
Subject: [tglx-devel:timers/posix 4/52] posix_timers.c:28:9: warning:
 ignoring return value of 'strerror_r' declared with attribute
 'warn_unused_result'
Message-ID: <202404111834.yiz79nbY-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f98034-03fb-4ec0-3f08-08dc5d2ea99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2jdIZCRRowvQrpUMcm9PYmazyp56h5rPT19q4X2uiGzOni7C7wQLTSd1irTyPlKlfd8R6naiYllSU9dn9kKvm46HgwqkAzLvZRvtMlmdWDeB4PFbXcfClwL6Rtv+NW8Y+D8bqFcyd4rLXWIyegPO+7ajsJXiP7EH06qPQ2yLgXxm6R5p1D6LWLCD/PRsNsJGr4vPlqmbBEn4spgcFUx60liRXMOcNzILwyqASw20c0VQ8x4NkyP2mhwYDRDrxlN/PjsGtLd50/4rR4EwD6lCvqWZ76B6dQ20kdu+hd10Uv36ep6VvBJtq3Zm4OXqKUzV4HJV40HJ1gI1hXZT0H7P5tTPhwZN/mljN+0S/AMbpakndd4CZ9D8rLFdQDqtjDtsNJPcRd8iLV0xXeBUe240BBLSK6IWbyOtxuyIj5kyNxe62Yx8t30w2Daeb3RhU5xtJYZVR2Hs5T2VTIxKwudyMCmXHNmjztVewKffBffWGrzrqu1DI1e6Ga4rH02UkfxabEn67iR2AZhiG1qpUem7g+9Us3iv/6SlsKcVQ7yRH/Gv5KHj8FXtlQXya9O2NYqDwwO5ke1e10IidipdNz453mMFg4QD8Tsi3uNT0aHJG7GyU8k9Kc7LmzhifDclTeT72bMZk30QsS9ZqBjA7LjdPbhf2Ke//wNvZSN24T7Urw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QarIRQrQ8mRWCzh2k1ZxasNB/x5dExVMJkE/FSbaLOUSuoSSnVBH+8n1rs1K?=
 =?us-ascii?Q?dV4Gbmj5ddViidBbVgFiZCtR5JHGu5LPje2S0b8ivkL42jGbCaxCA4RlPM1I?=
 =?us-ascii?Q?XMcN/6Xo/FNkPUy//hWAPavGWchZburXYQn/2fEXNj6CU/ka0aI3ROm8FPi3?=
 =?us-ascii?Q?0q6b5GOlcNb/lX/wCZs0u4pnhFQbSAK11L7U+ScWQ4r1FTdrmE+S+y3f29Y8?=
 =?us-ascii?Q?9VWNA9Ey3DfQqueUxxotGpq3F/8UphOAs/NdaY828h+7pDTFl3sgeG53erle?=
 =?us-ascii?Q?bck39QN8s0YB2UOPLk80jwXiQrs73P4682yKeW0GjG93uKbhPcsxzlbF7inc?=
 =?us-ascii?Q?O4vi577DXXvGqdT2Vinx/Z6oleSZy1VUb/M1sGGgMmHr1a/q92dw2d4o3rTx?=
 =?us-ascii?Q?7ATMa0uzatfPUEvLX0P5yia0IsJ83BDYW8/RC7lN+GoDYX6xsSPYKph7HmYS?=
 =?us-ascii?Q?P0rHLVh8HAe+ErQv5WqXAM2DopqKrQ0G4mqTXpLjOY+HbvKbR4fGz8vpOwct?=
 =?us-ascii?Q?F47w14BPxP5QPZh1NF+BPgwaM27riC3rvBwNgs9dEGxHlEB9baQOhIidXwiX?=
 =?us-ascii?Q?EPgEhI0Tg3V22u8dOl8B9me8GXOLWQpuumpQ3otqbIqtSGdRaTG3yc7hyU3R?=
 =?us-ascii?Q?7EXS/PF7W7+8qIl7IJTkVB9Wy0izGOJWJpHas1h282+eyrJncV87RX/5X9kW?=
 =?us-ascii?Q?S3oW+cSeZXfJj2/yXhhV9PNAdcAWJmpiW07T/7cpIirMOZZkYBPdzCjGbIAl?=
 =?us-ascii?Q?2yyNapvGpNyPCQg0PZCw8AqoRmuWUZZG2EGtQFDSkUHwfXM8bX+UYOk/yfC5?=
 =?us-ascii?Q?Rv4QrfoEK72r+PVkzNXU/LZFiN4rQId0tthER54eqlkTsVMNbJuY2qPaVoKK?=
 =?us-ascii?Q?x7AmiOc5HHh3XckSXFm0hhjwgKPrrIiI1iFZYd5ilRbRgLnBXhVIzMEnLMLx?=
 =?us-ascii?Q?EQBd7srBZ/ar1x3KKiye2IV4mvGcuCqoAI92q7hM6q1+zZuFZpHxxP3ZIrhp?=
 =?us-ascii?Q?J6QbLKcqBTrdw1CERXJGHtcxvPrE4AMggp42DPxJmnYGce21AFZrOJP2ZxIE?=
 =?us-ascii?Q?vPQuXwqF84TKULlcandA45eCV1q3da/ywUh9NMPM6VrLMAHhZTmaF40fzSeJ?=
 =?us-ascii?Q?tqmbro3D1UXF19hYkeA6EeJACuCPGOnHbJSBtxPH7v3d9lGgdP1xqwd2LWg5?=
 =?us-ascii?Q?B95j0rJeu18jvvfvTZALdG5KFvJJC0pUEkWgPS10d0vTj2GlNKheFa/9S90w?=
 =?us-ascii?Q?YzvZ5vO+6fBgi+3yFxA95m4LZcKlSrWtLzNC1uQ7rFLk/zFudP3P7ajAO4Wk?=
 =?us-ascii?Q?crtu7+eO9clRznfNIF3M0ysoVd0aINW0j9y2Epi8dzvx+qsQ4RpKTPSMqqkz?=
 =?us-ascii?Q?0+eJBY2+/qQgiNtQbyuSC6FDkAJvzwjZmsEf3e/mn4TOKwHy0n0np3yMWgrI?=
 =?us-ascii?Q?JBOZw0LJMU6UCEAp4hvBB9jRgmPhWZsa1OW0w+bgxkhiynGv8CQwJ4vUSGc0?=
 =?us-ascii?Q?ret0GQLeE3UoK/DgeIkpwxZuMoNaGAtViZiA6VY4Z0+r3IpOH1/KL4//d0PU?=
 =?us-ascii?Q?MyomP3JiPXbbTQ2oRnvtbuG74iXiU3WJcvPooAD3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f98034-03fb-4ec0-3f08-08dc5d2ea99f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 09:30:17.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ceZ7DAOQ5mMhCsMQwH+vGuuAp6GoqMPjWBkLpZZCYIrqychuVoctjRU9LSAzvi/8qHdjpXXcvA9MigMNRl2Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   e61ecfa7c797953c6d66b9a0de0adcdbbf7308a0
commit: 52f690d7b6f55b7a18bddfeaf80d002dde83acbb [4/52] selftests/timers/posix_timers: Add SIG_IGN test
reproduce:
	cd tools/testing/selftests/timers
	make

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Reported-by: Aaron Lu <aaron.lu@intel.com>
| Closes: https://lore.kernel.org/r/202404111834.yiz79nbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   gcc -O3 -Wl,-no-as-needed -Wall     posix_timers.c -lrt -lpthread -lm -o tools/testing/selftests/timers/posix_timers
   posix_timers.c: In function '__fatal_error':
>> posix_timers.c:28:9: warning: ignoring return value of 'strerror_r' declared with attribute 'warn_unused_result' [-Wunused-result]
      28 |         strerror_r(errno, buf, sizeof(buf));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +28 tools/testing/selftests/timers/posix_timers.c

0bc4b0cf15708f Frederic Weisbecker 2013-06-28  23  
67c1de711b083d Thomas Gleixner     2023-04-28  24  static void __fatal_error(const char *test, const char *name, const char *what)
67c1de711b083d Thomas Gleixner     2023-04-28  25  {
67c1de711b083d Thomas Gleixner     2023-04-28  26  	char buf[64];
67c1de711b083d Thomas Gleixner     2023-04-28  27  
67c1de711b083d Thomas Gleixner     2023-04-28 @28  	strerror_r(errno, buf, sizeof(buf));
67c1de711b083d Thomas Gleixner     2023-04-28  29  
67c1de711b083d Thomas Gleixner     2023-04-28  30  	if (name && strlen(name))
67c1de711b083d Thomas Gleixner     2023-04-28  31  		ksft_exit_fail_msg("%s %s %s %s\n", test, name, what, buf);
67c1de711b083d Thomas Gleixner     2023-04-28  32  	else
67c1de711b083d Thomas Gleixner     2023-04-28  33  		ksft_exit_fail_msg("%s %s %s\n", test, what, buf);
67c1de711b083d Thomas Gleixner     2023-04-28  34  }
67c1de711b083d Thomas Gleixner     2023-04-28  35  


We did some preliminary investigation FYI:

"strerror_r" is a glibc function declared in string.h which has a POSIX
version and a GNU version.

  $ vim /usr/include/string.h

  #ifdef __USE_XOPEN2K
  /* Reentrant version of `strerror'.
     There are 2 flavors of `strerror_r', GNU which returns the string
     and may or may not use the supplied temporary buffer and POSIX one
     which fills the string into the buffer.
     To use the POSIX version, -D_XOPEN_SOURCE=600 or -D_POSIX_C_SOURCE=200112L
     without -D_GNU_SOURCE is needed, otherwise the GNU version is
     preferred.  */
  # if defined __USE_XOPEN2K && !defined __USE_GNU
  /* Fill BUF with a string describing the meaning of the `errno' code in
     ERRNUM.  */
  #  ifdef __REDIRECT_NTH
  extern int __REDIRECT_NTH (strerror_r,
                             (int __errnum, char *__buf, size_t __buflen),
                             __xpg_strerror_r) __nonnull ((2))
      __attr_access ((__write_only__, 2, 3));
  #  else
  extern int __xpg_strerror_r (int __errnum, char *__buf, size_t __buflen)
       __THROW __nonnull ((2)) __attr_access ((__write_only__, 2, 3));
  #   define strerror_r __xpg_strerror_r
  #  endif
  # else
  /* If a temporary buffer is required, at most BUFLEN bytes of BUF will be
     used.  */
  extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
       __THROW __nonnull ((2)) __wur  __attr_access ((__write_only__, 2, 3));
  # endif

Commit 52f690d7b6f5 added "#define _GNU_SOURCE" in posix_timers.c. Seems
it changes the strerror_r implementation to GNU version which is
decorated with a __wur macro (__attribute_warn_unused_result__).

  # No #define _GNU_SOURCE in posix_timers.c
  $ objdump -xd posix_timers
  0000000000001c20 <__fatal_error>:
      1c56:       e8 65 f6 ff ff          call   12c0 <__xpg_strerror_r@plt>  <-- POSIX version

  # Have #define _GNU_SOURCE in posix_timers.c
  $ objdump -xd posix_timers
  0000000000001c20 <__fatal_error>:
      1c56:       e8 f5 f6 ff ff          call   1350 <strerror_r@plt>  <-- GNU version

The GNU strerror_r may directly return a pointer to the string
containing the error message but won't store it into the buf at the
second argument. This causes an unused-result warning since the return
value of strerror_r is not assigned to any variable.

  /* Return a string describing the errno code in ERRNUM.  */
  char *
  __strerror_r (int errnum, char *buf, size_t buflen)
  {
    char *err = (char *) __get_errlist (errnum);
    if (__glibc_unlikely (err == NULL))
      {
        __snprintf (buf, buflen, "%s%d", _("Unknown error "), errnum);
        return buf;
      }
  
    return _(err);
  }
  weak_alias (__strerror_r, strerror_r)
  libc_hidden_def (__strerror_r)

Additionally, we also tried cross-checking in various distributions. It
can be reproduced in Ubuntu 22.04, but not in Debian 12 or CentOS Stream 9.
We haven't figured out the cause of this inconsistent behavior across
different distributions, and the investigation is ongoing.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

