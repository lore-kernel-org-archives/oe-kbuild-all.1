Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1ABE40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841769; cv=none; b=h+nW8IncGc0Jm0YRbEOwpiCkn8kH7GttlPIVdv35dE6x2Cpb2BDnDZwfZDUX9010cPm4EUCcAzNj3CKZ3DprBz9SRgvNKliJMLIDm9CierYHrvI/yvSSo4szNEetaHKpZaiyiUzAVBwgpAYw/YWc0hDQ5rluytIqTciwT6w3PDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841769; c=relaxed/simple;
	bh=fSEIEh580uoAcwF1P9VRvoN0Gwyu71he/TDrGokG7Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLIF8CpqZ9Xo+sGgreej1qVr5p6y9c9vN1mkWiMeJD23Uv/y+yfzANX5G8oJ/ppl5iAEmQ/ghow1+pcCDZViLfVe8CcWO3Gfz4chCQXjTQYGNc/yoXtpI61UzC2IUCTBu6kTnGvltoyFYFO1fv2NX9xYh/DnpD+/EkgrQYJnZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8FBIRwK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8FBIRwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734841767; x=1766377767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSEIEh580uoAcwF1P9VRvoN0Gwyu71he/TDrGokG7Z0=;
  b=e8FBIRwKPq8GOnQPesdbb5cMdv1bu8lKEtxiZWp79xOzDCOl8bcO9zaD
   wLEtsuzTAn7LyYdfVrbpXj+zl5IQU5TeVb8+7MlCnCdhugC29Y3+wCjnf
   ldYPKm1blewQ4mDDvgTnoKA2jmw8D8zMRCPwpiq7/lVRTjrIK0h8Kfcjj
   nZPrS5esdrh8C4uBUtodOYA5Vps2ekxpzuZ03kcjpR6KevZCil6CVKM6t
   SOsGCrNx+m+WG56nHasXWN9hvR2eMOw7JBst0ga5uaeuwr/hqSvtie/4K
   FgxBzOuXiVcc9K9db//JwOf/dGcnbqIwQkNeCbIQdU5HQVXDd2f9KHAkp
   g==;
X-CSE-ConnectionGUID: NvaUpMDrQtOz6/6Ssf2OuQ==
X-CSE-MsgGUID: J2VBzNpYTSeZy037fIRd/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35559925"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35559925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 20:29:23 -0800
X-CSE-ConnectionGUID: ldq9OYT5RZe0xqFEmXaJqQ==
X-CSE-MsgGUID: D+UVUdpJQbGecbzU0GaRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99285717"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 20:29:22 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPDai-0002jH-15;
	Sun, 22 Dec 2024 04:29:20 +0000
Date: Sun, 22 Dec 2024 12:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	"Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.12/linux 857/1030] include/uapi/linux/const.h:20:25:
 warning: conversion from 'long long unsigned int' to 'size_t' {aka 'const
 unsigned int'} changes value from '4294967296' to '0'
Message-ID: <202412221222.shyABICO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: 9b622d237b5e58a4487cdd78f397ee43161ebab0 [857/1030] drm/i915/iov: Shadow GGTT mock selftestes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412221222.shyABICO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221222.shyABICO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221222.shyABICO-lkp@intel.com/

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
