Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878CA3D3488
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401984; cv=none; b=EUEuVe+mzdbcEUCY9yWeV55nWkksihJVgh56Oo+z9qQW2cii0PjkGmtYj0GD1Mt29rVFiiJb5N/xkLqkjUuKN9OH1cm8Rh8JTXQZtAAOglmzj+xTjUZrSZOZkbIc8HltKyDAuexnjUBO6uXiCS0flOHg12gVNO+RPazFhqJnnIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401984; c=relaxed/simple;
	bh=qfYpVyOIz2Cv/nrFeSJy7CWltk7oq/PsXBlMkgzWfcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TFKsSSdzzWjSAW9ObP/ZoZqfhMxxWy0odZeRf/aXEZlW4Iq1zZwx+utVajA+g8lk1GntxQ7hgLs+bB0CuEVIQeFKzKUVCct44XWG1eB/9sWODnH6IvGJx5BG2O//99Av/HWq7mpbhKYb71bBtXZ9okKNEVSzTc9oyjQbBqc8ap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtJiJe/3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtJiJe/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780401983; x=1811937983;
  h=date:from:to:cc:subject:message-id;
  bh=qfYpVyOIz2Cv/nrFeSJy7CWltk7oq/PsXBlMkgzWfcY=;
  b=AtJiJe/361VVWzdGOb2LIvW6osBZHd8yKjp+fpToZwErqljNVjkKTuIc
   fRp5MHS6Ha0TwGm3jEgCJ+emS+Wgv8pq6Yqzi6MAFbLh463e1+MKfwk7r
   9rhtajGrTOBrIokuccj+fO0UHzo+2zbIHRqCIQsNAZn/3o+y3vm/H+0Pw
   jQ3HaYRlYwtHbb8fEIhR6HwGFt88bPN+L/TkRBPNsg49n+C40VxFRcekR
   HGevLL+e9WW5QT3DjzFoCrYFONzTC/uh4O7wV+xzugAOY+CuOXY/FTnp3
   Jsi9mQvjyIxO1Puljd8K/0mrmI4hoopN5ybqw1Sc+yF07EWqb9hKx9yMn
   w==;
X-CSE-ConnectionGUID: YTl0lrWZQrugXK3CMDmg5w==
X-CSE-MsgGUID: QsVF9W+GReeoydSTPIOcTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81364450"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81364450"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 05:06:23 -0700
X-CSE-ConnectionGUID: ChkjHOQ2Q7CSJx70Z6iCAA==
X-CSE-MsgGUID: o3e5EC3MQ2m7FIkcIPebgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237541521"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 05:06:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUNsw-00000000Bz6-0t55;
	Tue, 02 Jun 2026 12:06:18 +0000
Date: Tue, 02 Jun 2026 20:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sbates130272-p2pmem:switchtec-dma-sysfs 3/4]
 include/linux/compiler_types.h:699:38: error: call to
 '__compiletime_assert_395' declared with attribute error: FIELD_GET: mask is
 not constant
Message-ID: <202606022030.f0jMiM3g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sbates130272/linux-p2pmem.git switchtec-dma-sysfs
head:   7de58d38d826e9043f1c21054c804d326563a84a
commit: 60076882346d9bb208a6b077708823ce8421a6a3 [3/4] dmaengine: switchtec-dma: Add config sysfs attributes
config: mips-randconfig-r072-20260602 (https://download.01.org/0day-ci/archive/20260602/202606022030.f0jMiM3g-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022030.f0jMiM3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022030.f0jMiM3g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/dma/switchtec_dma.c: In function 'perf_cfg_show':
>> include/linux/compiler_types.h:699:38: error: call to '__compiletime_assert_395' declared with attribute error: FIELD_GET: mask is not constant
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:680:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:699:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:97:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, 0U, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:178:3: note: in expansion of macro '__FIELD_GET'
      __FIELD_GET(_mask, _reg, "FIELD_GET: ");  \
      ^~~~~~~~~~~
   drivers/dma/switchtec_dma.c:1046:10: note: in expansion of macro 'FIELD_GET'
     value = FIELD_GET(mask, perf_cfg);
             ^~~~~~~~~
   drivers/dma/switchtec_dma.c: In function 'perf_cfg_store':
>> include/linux/compiler_types.h:699:38: error: call to '__compiletime_assert_401' declared with attribute error: FIELD_MODIFY: mask is not constant
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:680:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:699:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:85:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:193:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");  \
      ^~~~~~~~~~~~~~~~
   drivers/dma/switchtec_dma.c:1079:2: note: in expansion of macro 'FIELD_MODIFY'
     FIELD_MODIFY(mask, &perf_cfg, value);
     ^~~~~~~~~~~~


vim +/__compiletime_assert_395 +699 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  

:::::: The code at line 699 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
