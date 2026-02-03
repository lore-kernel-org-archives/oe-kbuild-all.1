Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C42FD694
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 23:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770161038; cv=none; b=Q2VF3IM9YdB5DeOWrWqDy5+OTZYvNoVdp0GpDPEoZFJTV0xoqwZLeVIBwUNjldWAQlwSCnhD4N8G/Z5XHwXyVpOELLSOsOkNYap+9OcOmbWqzDihizPR6xijdxJIBe2Ahfp97O1uDK/CE6uajalLHoXGmFDD2F8iTHQqrE/hLwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770161038; c=relaxed/simple;
	bh=hXvjwpsb5Kx4Gwier2ixb/L20wUqXoNekqnrFTTQWPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDCj03DJDiLtd/bT1CaqDe2B4cWSCoF+YlstIQPf6E0GzrEMXbeyXmcuDTYVHLpJpSk+YjG95ICcqX20TOax8wJ5mwOQm2VVn1GAruDGdt7gTJHVIabQNXbXi4XF6iOf7m1AyOGUFLvMPIaTbF7nBfzTSlovZnaZH/wZLbNQo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTKoxDva; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTKoxDva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770161035; x=1801697035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hXvjwpsb5Kx4Gwier2ixb/L20wUqXoNekqnrFTTQWPs=;
  b=OTKoxDvaFvyR3hwlLdp/2FG3NusklOFkEWXaGlJR19D3W2FrG72P9/xz
   8K7JqZ/0CViuMkxrz2rePbkzkY/Gdf7MVhDpl2pbMvn3FfQpK+9DzFO2S
   YUq+FqnixvI7Tr/z5qic5km/1A9ouiA6eDTxnZ5CoQLLZNx+fqZP0dV6K
   gcQQmSY8Amwo3lsSVFUZeEmVBdDbDuyrievCg7IEZo6wM1m+6HMr4Tv1w
   a75TAO5rxa49Og1jP+34A/4qrPxyQgCYuuM4lEqjfYaOJ+By3IQO1xD6e
   qVx+vDOT0qG01ll03Ck0knS8RHh9zF8TvfPEUdGRVFPaaU+lM/4t1SVmV
   A==;
X-CSE-ConnectionGUID: YNO70+cQRBCeQot1fqTBAw==
X-CSE-MsgGUID: BVkqie6vQVW7kaRr3RY5Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75196449"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="75196449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:23:55 -0800
X-CSE-ConnectionGUID: CUAbGf2XQoiEsIXl0JWcyQ==
X-CSE-MsgGUID: loozeLVSQ6+GqyIqchnzlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209648920"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2026 15:23:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnPkN-000000003UL-1gbK;
	Tue, 03 Feb 2026 23:23:51 +0000
Date: Wed, 4 Feb 2026 00:23:15 +0100
From: kernel test robot <lkp@intel.com>
To: david.laight.linux@gmail.com, Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org, Cheng Li <lechain@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH 11/12] selftests/nolibc: Increase coverage of printf
 format tests
Message-ID: <202602040045.wtyCVh2h-lkp@intel.com>
References: <20260203103000.20206-12-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203103000.20206-12-david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260202]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/tools-nolibc-printf-Move-length-check-to-snprintf-callback/20260203-183919
base:   next-20260202
patch link:    https://lore.kernel.org/r/20260203103000.20206-12-david.laight.linux%40gmail.com
patch subject: [PATCH 11/12] selftests/nolibc: Increase coverage of printf format tests
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260204/202602040045.wtyCVh2h-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040045.wtyCVh2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040045.wtyCVh2h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   nolibc-test.c:784:9: warning: 'readdir_r' is deprecated [-Wdeprecated-declarations]
     784 |                 ret = readdir_r(dir, &dirent, &result);
         |                       ^
   /usr/include/dirent.h:188:28: note: 'readdir_r' has been explicitly marked deprecated here
     188 |      __nonnull ((1, 2, 3)) __attribute_deprecated__;
         |                            ^
   /usr/include/s390x-linux-gnu/sys/cdefs.h:510:51: note: expanded from macro '__attribute_deprecated__'
     510 | # define __attribute_deprecated__ __attribute__ ((__deprecated__))
         |                                                   ^
   nolibc-test.c:982:24: warning: self-comparison always evaluates to false [-Wtautological-compare]
     982 |         if (st.st_atim.tv_sec != st.st_atime || st.st_atim.tv_nsec > 1000000000)
         |                               ^
   nolibc-test.c:985:24: warning: self-comparison always evaluates to false [-Wtautological-compare]
     985 |         if (st.st_mtim.tv_sec != st.st_mtime || st.st_mtim.tv_nsec > 1000000000)
         |                               ^
   nolibc-test.c:988:24: warning: self-comparison always evaluates to false [-Wtautological-compare]
     988 |         if (st.st_ctim.tv_sec != st.st_ctime || st.st_ctim.tv_nsec > 1000000000)
         |                               ^
   nolibc-test.c:1444:54: warning: null passed to a callee that requires a non-null argument [-Wnonnull]
    1444 |                 CASE_TEST(stat_fault);        EXPECT_SYSER(1, stat(NULL, &stat_buf), -1, EFAULT); break;
         |                                                                    ^~~~
   /opt/cross/clang-f43d683409/lib/clang/22/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   nolibc-test.c:369:22: note: expanded from macro 'EXPECT_SYSER'
     369 |         EXPECT_SYSER2(cond, expr, expret, experr, 0)
         |                             ^~~~
   nolibc-test.c:366:70: note: expanded from macro 'EXPECT_SYSER2'
     366 |         do { if (!(cond)) result(llen, SKIPPED); else ret += expect_syserr2(expr, expret, experr1, experr2, llen); } while (0)
         |                                                                             ^~~~
>> nolibc-test.c:1652:16: warning: unknown attribute 'mat' ignored [-Wunknown-attributes]
    1652 | __attribute__((mat(printf, 3, 0)))
         |                ^~~~~~~~~~~~~~~~~
   6 warnings generated.
--
>> nolibc-test.c:1652:16: warning: unknown attribute 'mat' ignored [-Wunknown-attributes]
    1652 | __attribute__((mat(printf, 3, 0)))
         |                ^~~~~~~~~~~~~~~~~
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
