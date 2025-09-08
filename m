Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080C13FD86
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 04:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757306931; cv=none; b=lfmHAHOaEq8trC28TuSE2PR61l34fRH1u6/ydggloiPg4wJFOK13O8nrLml1T0Zg/y3K1+KfWKBEsTbOZlddwmQ5zvYaQS0J1KkXZSitkTn69MJXI3IdAEN/SuXLRYgyue5Tl0aSFUtTD7nXMcG6lW2ymHGrMyuvEFSZgpbE6JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757306931; c=relaxed/simple;
	bh=BsQ+/zPbfNn+6jDsO/5rKOGV/NwXhmbLZDWQQ6oVFFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeJb5wGSAwfonpTNpYaikQahVhXttkpURLrQryCS7Tk9c5Ri+1J74LQZbAfu+iRYDEtXer/+RxERYtIGSRQKwHEolVZn0lZTjLLxFMqZZ/UDfTnZl/cjCWwJWnL7k5hFOvmvZtVjDt5NHwj119j8eAM1z7Nh3xck9RMndIbIJhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKTV2KNb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKTV2KNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757306930; x=1788842930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BsQ+/zPbfNn+6jDsO/5rKOGV/NwXhmbLZDWQQ6oVFFg=;
  b=MKTV2KNbt/wERgMJ+VKNO8US90d6kAvQ3bZauYjgpMUoW+i22xuKC8HT
   /Tyf72JG7QcffLOpczlHmBODho8aLClT1ZN6O3S/d6utsKbadiNWtunO5
   ORxNGYHNWE/+arNBkMVHCZG9LH5429urqEtcEV6nHF9jBPjK+JozwisCK
   gCmlcBxBrPpgQAy9mVwUUfP/YNzt57juCPWry8K2QB8FssUv7z3DK5SOt
   4TvakglzLI8ILps3kmnwXNV7l81qJusfav2P8Cm1G3GQCzLirYSgK6KF1
   lhA8neFMdoH1LctFbTvOcNgwAf3Kbx2IP7jR5Q3pPDhXM6MBIQooyJysW
   g==;
X-CSE-ConnectionGUID: rujv7L5qS8aWOvDWhf4hkw==
X-CSE-MsgGUID: Ij7Sab0JTaiZZuQmydrliA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59663939"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="59663939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 21:48:49 -0700
X-CSE-ConnectionGUID: hgcW9d3DTdatnapoivvxUg==
X-CSE-MsgGUID: noW8dv0VQGOrlduJNjpIFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; 
   d="scan'208";a="173150508"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Sep 2025 21:48:48 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvTo6-0003Vn-01;
	Mon, 08 Sep 2025 04:48:46 +0000
Date: Mon, 8 Sep 2025 12:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Lynch via B4 Relay <devnull+nathan.lynch.amd.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 12/13] dmaengine: sdxi: Add Kconfig and Makefile
Message-ID: <202509081218.MnJQkF7r-lkp@intel.com>
References: <20250905-sdxi-base-v1-12-d0341a1292ba@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-sdxi-base-v1-12-d0341a1292ba@amd.com>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Lynch-via-B4-Relay/PCI-Add-SNIA-SDXI-accelerator-sub-class/20250906-025019
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250905-sdxi-base-v1-12-d0341a1292ba%40amd.com
patch subject: [PATCH RFC 12/13] dmaengine: sdxi: Add Kconfig and Makefile
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250908/202509081218.MnJQkF7r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081218.MnJQkF7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081218.MnJQkF7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/vdso/bits.h:5,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from include/kunit/device.h:16,
                    from drivers/dma/sdxi/descriptor_kunit.c:7:
   drivers/dma/sdxi/descriptor_kunit.c: In function 'copy':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967297' to '1' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   drivers/dma/sdxi/descriptor_kunit.c:34:20: note: in expansion of macro 'SZ_4G'
      34 |         copy.len = SZ_4G + 1;
         |                    ^~~~~
   include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   drivers/dma/sdxi/descriptor_kunit.c:42:20: note: in expansion of macro 'SZ_4G'
      42 |         copy.len = SZ_4G;
         |                    ^~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/vdso/bits.h:5,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/kunit/assert.h:13,
                    from include/kunit/test.h:12,
                    from include/kunit/device.h:16,
                    from descriptor_kunit.c:7:
   descriptor_kunit.c: In function 'copy':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967297' to '1' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   descriptor_kunit.c:34:20: note: in expansion of macro 'SZ_4G'
      34 |         copy.len = SZ_4G + 1;
         |                    ^~~~~
   include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967296' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   descriptor_kunit.c:42:20: note: in expansion of macro 'SZ_4G'
      42 |         copy.len = SZ_4G;
         |                    ^~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
