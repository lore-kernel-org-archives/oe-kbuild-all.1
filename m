Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AEF29B8CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361177; cv=none; b=fLIA0Fx6NBeVMeo/hSr2LEFuF7JQJ9l4Bx3103R9c3WpnAR2ICqLr8lj6J9OG1WKS2MUR+tUnxYlDLlJnhTdMaR/bmiJBv2rzwSFebnuvaT2B2L9QzlE33bfy26aOHQ3OVa81GcF56cR486fpB37kKM+Ant2Q3kV/MCOz8wGW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361177; c=relaxed/simple;
	bh=usp4xS76WrIMBZsPgWMPfQLaX/5OcCg0dIj3qNtrdlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwPTzXFaC/0e108p4Uw0yqapZjxsa0R/mBn2uvyErMqpQOFJsvszmLqSNVSN+2zqKIIm2NDD/Az1aL2h78nFYJYCSkNsRRlDNLZbmTMwlZ8mtPCeOwPVIykaneCbMCgKVnSxmJgjiajT01TZT6VqGTy9d6C9hv1GVJvdOZOwMwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bv2arvYJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bv2arvYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784361176; x=1815897176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=usp4xS76WrIMBZsPgWMPfQLaX/5OcCg0dIj3qNtrdlU=;
  b=bv2arvYJSpIActEHYnlx7bqSgI5ymtRTFP+2ZyLO6NtZpxO8ouDrrU6c
   7O81dMwKHIk45lRcn6JD8j5gDbmb4jvyMjvl3HCA+vFxFaK0GsDzgt1ms
   leJvGE5bWGvh8kW/5j4GM5RjvFmzKR7NMbJN5uyvwC13YRoYmYxnsgxQi
   MAv7MO1aeYTR0i1Dy+BK0UiwopB2QQvHjGZglULj6COfhAOqBIqSuRRKV
   4KpObfy4za4nOmyMMniKRcySBG3xZlVvfD5LjwEungArkp7VcxRIalSdX
   SKS+2+qilRR0HdynWDpr47/hTLdqjc3rEfVWuSZ/LxIVpJGfMYhV4lb4l
   A==;
X-CSE-ConnectionGUID: j8We1ZBOTJKRdbq/Xqv4Ig==
X-CSE-MsgGUID: QVq6FLrNTnS8fihVKV4Lag==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84004319"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84004319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:52:12 -0700
X-CSE-ConnectionGUID: q3MvSoYmSUS3UFc1e5d6Zg==
X-CSE-MsgGUID: Mcy5IvL5R7mdhJgb5RSr7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261948990"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2026 00:52:09 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzqB-000000005kH-33kf;
	Sat, 18 Jul 2026 07:52:07 +0000
Date: Sat, 18 Jul 2026 09:51:48 +0200
From: kernel test robot <lkp@intel.com>
To: Yonggil Song <yonggil.song@samsung.com>,
	"jaegeuk@kernel.org" <jaegeuk@kernel.org>,
	"chao@kernel.org" <chao@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, Yonggil Song <yonggil.song@samsung.com>,
	"linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Dongjin Kim <dongjin_.kim@samsung.com>,
	Seokhwan Kim <sukka.kim@samsung.com>,
	Daejun Park <daejun7.park@samsung.com>
Subject: Re: [PATCH] f2fs: introduce gcless mount option to avoid foreground
 GC
Message-ID: <202607180917.doNNtTXN-lkp@intel.com>
References: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe@epcms2p1>

Hi Yonggil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb8ff3ead9a3fc43727980be58c7099506f65261]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonggil-Song/f2fs-introduce-gcless-mount-option-to-avoid-foreground-GC/20260706-154229
base:   cb8ff3ead9a3fc43727980be58c7099506f65261
patch link:    https://lore.kernel.org/r/20260706062043epcms2p16928216befdca1242bc2d3cd7cb34afe%40epcms2p1
patch subject: [PATCH] f2fs: introduce gcless mount option to avoid foreground GC
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260718/202607180917.doNNtTXN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180917.doNNtTXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180917.doNNtTXN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/f2fs/dir.c:9:
   fs/f2fs/f2fs.h: In function 'inc_valid_node_count':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/f2fs.h:2945:25: note: in expansion of macro 'test_opt'
    2945 |                         test_opt(sbi, RESERVE_NODE));
         |                         ^~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/f2fs.h:2953:13: note: in expansion of macro 'test_opt'
    2953 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~
--
   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from fs/f2fs/super.c:8:
   fs/f2fs/f2fs.h: In function 'inc_valid_node_count':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/f2fs.h:2945:25: note: in expansion of macro 'test_opt'
    2945 |                         test_opt(sbi, RESERVE_NODE));
         |                         ^~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/f2fs.h:2953:13: note: in expansion of macro 'test_opt'
    2953 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~
   fs/f2fs/super.c: In function 'limit_reserve_root':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/super.c:520:13: note: in expansion of macro 'test_opt'
     520 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/super.c:526:46: note: in expansion of macro 'test_opt'
     526 |         if (!test_opt(sbi, RESERVE_ROOT) && !test_opt(sbi, RESERVE_NODE) &&
         |                                              ^~~~~~~~
   fs/f2fs/super.c: In function 'f2fs_check_opt_consistency':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/super.c:1528:13: note: in expansion of macro 'test_opt'
    1528 |         if (test_opt(sbi, RESERVE_NODE) &&
         |             ^~~~~~~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/super.c:1529:42: note: in expansion of macro 'BIT'
    1529 |                         (ctx->opt_mask & BIT(F2FS_MOUNT_RESERVE_NODE)) &&
         |                                          ^~~
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/super.c:1534:35: note: in expansion of macro 'BIT'
    1534 |                 ctx->opt_mask &= ~BIT(F2FS_MOUNT_RESERVE_NODE);
         |                                   ^~~
   fs/f2fs/super.c: In function 'f2fs_show_options':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   fs/f2fs/f2fs.h:150:33: note: in expansion of macro 'BIT'
     150 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~
   fs/f2fs/super.c:2475:44: note: in expansion of macro 'test_opt'
    2475 |         if (test_opt(sbi, RESERVE_ROOT) || test_opt(sbi, RESERVE_NODE))
         |                                            ^~~~~~~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
