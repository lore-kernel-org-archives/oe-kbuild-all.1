Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E833C47B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737781521; cv=none; b=DWB7ZktwWLLqgM20mpT4KPWdbssSrP6AonYy9h5Fe39/8/HSNHXrvxwo3Nqp+reXERyQaes469Ra/5Sjs1QqocVWjnSbvGBkTkUvSXv34ds9kXAa5n7ma/j4DmR/OseS8uhXmzqvHoLzsyjpPBdpwLqTq3sJcJTxOGxfqSkYNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737781521; c=relaxed/simple;
	bh=EIcYSpeQ5yjAnpnHU2pVI2gUGqeTfdrwhFjY3COquF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehff1q9xAgZ/57erHyTTScPPRm777AQdi14uFxqvs1B85inN2FZVoQvnIpdb2+2F1cUyzoW8NH+u3fbniT9H6T4v8MqEZW1fdXHMY7mENibhlNvsiB6bBP+UxCgYRW5kiyX69F4pwOYQObd/rKRaLGv3rFF9grwHHAAp5mr50Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGdz1LJ8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGdz1LJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737781520; x=1769317520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIcYSpeQ5yjAnpnHU2pVI2gUGqeTfdrwhFjY3COquF8=;
  b=fGdz1LJ8ako3ap1cy7YuHgzFmSAjgtfXULAS19HGfg2unOkcIqFqot3J
   f2ARPP8y9UgNbMmr+lkfYacNC4VDaSZRxpK6kMc1Agaa5EFHa9WH7pkl9
   RI93BGYlMw4EL2fRKBjD7OAbaD8lTmzTRcC53sW/uqQmO9wzmJbNtZcaF
   f8tlzLcBBC+UWd9o081o6a+12xr7E/z95cdo8mkdhbigxVT2So6tBQImo
   T4bM4JWoGEPU/SfppHWXEM6Jj1qAvKEqTLHcOozDwBXry44QxV2YbPAEy
   RDsB8ptNsutT4VbLWM810g42Pc8rkoQE+c/DTmEng+yUpLnkcyu5VmGFr
   w==;
X-CSE-ConnectionGUID: T4UEFKmnSyeT8JJJ/Ha5sg==
X-CSE-MsgGUID: hmwfc1m7TLKW9ELKu0nc5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38209851"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="38209851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 21:05:19 -0800
X-CSE-ConnectionGUID: sJvRgJevTaiTGYwTQ1o+0Q==
X-CSE-MsgGUID: /GMARTDHTaWDCcevu91Wqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112574241"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2025 21:05:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbYM7-000dWf-1B;
	Sat, 25 Jan 2025 05:05:15 +0000
Date: Sat, 25 Jan 2025 13:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	"Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.12/linux 0/6] include/uapi/linux/const.h:20:25:
 warning: conversion from 'long long unsigned int' to 'size_t' {aka 'const
 unsigned int'} changes value from '4294967296' to '0'
Message-ID: <202501251211.EQ0aaexr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piotr,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   f90d04942b56016c8b10b96b7ee22e548ecf24cf
commit: 9b622d237b5e58a4487cdd78f397ee43161ebab0 [0/6] drm/i915/iov: Shadow GGTT mock selftestes
config: i386-buildonly-randconfig-006-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251211.EQ0aaexr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251211.EQ0aaexr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251211.EQ0aaexr-lkp@intel.com/

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
