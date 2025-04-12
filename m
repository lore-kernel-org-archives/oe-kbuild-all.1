Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B519CD1E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468767; cv=none; b=Z7qRbnAZIop+OdDsk7l2ygvqG8FQc5pMYQbckUk+kOLAjN2zEClvXflNDhTa62Ycite84baXBUbVjys2LwLwOt0TazoKiczRWgWykf0eqm1DP6fIPmkC+E2S1mvZq9PBp2dp4yBf2DozS8Ied6tkKMcE3YSn03Bqt4jRz/7KYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468767; c=relaxed/simple;
	bh=oyuFZOSr6PqJAAi7WgGlnP/wijjIGYHXvZKx8107nj0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eB+8TlKGYoEl8ar+d/zi86LhbvJzbmdDqwBNrpA+HN5yqUMbSV4KwEjIlZEFf8ueM+EDWrQeLnWRW7OKv/cfdJdWyAWQwwwERVNiP9VCjC2c3GASGKb8Y1bG/SLNS6N+Y/mpEyr00b8InlMvYMlWFctD4l3FhUlHEZZF9KHuFNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8qgaFJ8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8qgaFJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744468765; x=1776004765;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oyuFZOSr6PqJAAi7WgGlnP/wijjIGYHXvZKx8107nj0=;
  b=e8qgaFJ8SMHxs0prjnZfLMVqaDcGWDWOuJsOMDnMbyNSqSqB/RXf3jwB
   v446Cr1cjy7BdnPPSX9EwetTEZEr+jntgmQEBmbLtpjdk9P3BI8SidYjY
   Z4zBcCgtk8AN/r7Ypc8UWYua8sp991QYK1BzFTvlCz4S1BG6a2ZHa7Q0d
   44ueiM+4/wviT8F2FSIENAbP8R2nZisZ8H34ou7+I+7UJEHcEOomsaQW9
   tPIFeIi/Qs4zI9N9rhw4aVJf3DtJO/EByN4aolLCRiKsYiOHt05P97oIr
   qFaXeTkT7xMT57Fr92EGabXbPA41D+9AndL4o4Ek6umzjPbxG1+8iES8J
   w==;
X-CSE-ConnectionGUID: RUIFIOKmRXGzD/8AqBuZvg==
X-CSE-MsgGUID: TNH8FjZFRKaCO2ARDhlJfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57379928"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="57379928"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 07:39:24 -0700
X-CSE-ConnectionGUID: m0GVSWk1TF2ciczAIlvkxA==
X-CSE-MsgGUID: /3oFOAxtSPaR2JfPMzubOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="152618708"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2025 07:39:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3c0v-000BrI-20;
	Sat, 12 Apr 2025 14:39:21 +0000
Date: Sat, 12 Apr 2025 22:38:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 20/20] include/uapi/linux/const.h:20:25:
 warning: conversion from 'long long unsigned int' to 'size_t' {aka 'const
 unsigned int'} changes value from '4294967296' to '0'
Message-ID: <202504122252.A6R8qTwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   c4c69642b7fda4d0c69a9fe66728ac8b398aca5f
commit: d0c16cc743c4bb02f70ff97b1dcb5f3d6e77f7ad [20/20] Revert "drm/i915: Depend on !PREEMPT_RT."
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250412/202504122252.A6R8qTwj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122252.A6R8qTwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122252.A6R8qTwj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/uapi/linux/kernel.h:6,
                    from include/linux/cache.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/io-mapping.h:10,
                    from drivers/gpu/drm/i915/gt/intel_gtt.h:19,
                    from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.h:9,
                    from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:7:
   drivers/gpu/drm/i915/gt/iov/selftests/selftest_mock_iov_ggtt.c: In function 'mock_ggtt_shadow_restore_new_vfid':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'const unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:46:41: note: in expansion of macro '_AC'
      46 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/i915/gt/iov/selftests/selftest_mock_iov_ggtt.c:318:34: note: in expansion of macro 'SZ_4G'
     318 |         const size_t ggtt_size = SZ_4G;
         |                                  ^~~~~


vim +20 include/uapi/linux/const.h

9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a84 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
