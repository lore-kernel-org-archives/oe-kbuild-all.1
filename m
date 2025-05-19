Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D120C469
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681922; cv=none; b=Wzy7tiWNFHdxtWDCJFUnACNCZzVahtSEDysmegj7ytGr2qI+APvw2uWuAtywpoNABBi6Z2DJG3gX3PEktXgcBgg3r6ge2RymprAxu0MJ/JC8LCzt71/iHL68ZBrSZQPTGy/KLGeNra2g6s0+YTRbTXIJ6b5Crlwd26pQsBCiOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681922; c=relaxed/simple;
	bh=MlLrO6+ous6nMN00B9L9XsyHL6xqDEDX72dho3TGiaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cE4mZ/nS0g7yi49r8v3HlTOF/Fg9+bcb/pSufeCwsa8mZ21VUFthG/XzXpT+YcaJMvtHHfmhwuKFery1KnjN2r7DdLH4GbnM9Cv/CSwgc+P3H/nUw9ptAedwYEYByvbcQhb7ytEDjgI+3u5znYSe0jF8vwQ8tk2SGcWgl4t+/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcZW5lUM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcZW5lUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747681920; x=1779217920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlLrO6+ous6nMN00B9L9XsyHL6xqDEDX72dho3TGiaI=;
  b=jcZW5lUM+OxHhQjpLS5VhTZiDNRFWIIV6/jc97URnECbhtM0c+JrbrzL
   9bhRbuhAUD50R2b0RNMrggLqxurdxRFsdBQ16iVNFtsADQvE0WqJJAuhD
   /qzOwveQhkSktuDj2ZWvXPNgcrmdjmIpQzcIkkL4BThI21grDJ0p6WeF2
   EmY7MK0fea2OWAz6/VEpEWJfSDslohzDL0U44UsYnRWjSzOHPfnxEx42j
   6hOlvFNJl/XnuXu+hsWAC0UV03t/k6y78Lccbgx5gXL5zxozF/3bJWRXq
   FSoe/QoaydJf1YxNL4sQV/OgG8dEJhn+IuvdFhmkNN1KAtL4d8K/zCWRA
   g==;
X-CSE-ConnectionGUID: JH/GaCv8TluTxwIJ9XFfFg==
X-CSE-MsgGUID: O87qAed4T6WJ4jYMJOK6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49698400"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49698400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 12:11:59 -0700
X-CSE-ConnectionGUID: KMtu8Z6eTfusK0hnMZUPpw==
X-CSE-MsgGUID: Gb4kk3m5RoiHbdGeXTLWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="170490848"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2025 12:11:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH5u0-000LmB-0U;
	Mon, 19 May 2025 19:11:56 +0000
Date: Tue, 20 May 2025 03:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:fuad-mroth-2M 27/35] include/linux/compiler_types.h:557:45:
 error: call to '__compiletime_assert_669' declared with attribute error:
 BUILD_BUG_ON failed: BITS_PER_LONG != 64
Message-ID: <202505200303.ntmJjwt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git fuad-mroth-2M
head:   e7a0e768b14b70e6723b2800c0d108cf449c534e
commit: 5f1c19a1fb8cb1ce084d9d55922793703fcf9af0 [27/35] KVM: gmem: track preparedness a page at a time
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250520/202505200303.ntmJjwt3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200303.ntmJjwt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200303.ntmJjwt3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'kvm_gmem_mark_range_unprepared',
       inlined from 'kvm_gmem_punch_hole' at arch/x86/kvm/../../../virt/kvm/guest_memfd.c:294:2:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_669' declared with attribute error: BUILD_BUG_ON failed: BITS_PER_LONG != 64
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:130:17: note: in expansion of macro 'BUILD_BUG_ON'
     130 |                 BUILD_BUG_ON(BITS_PER_LONG != 64);
         |                 ^~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_mark_prepared.isra':
   include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_665' declared with attribute error: BUILD_BUG_ON failed: BITS_PER_LONG != 64
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:111:17: note: in expansion of macro 'BUILD_BUG_ON'
     111 |                 BUILD_BUG_ON(BITS_PER_LONG != 64);
         |                 ^~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_bind':
   include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_681' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_t) != sizeof(slot->gmem.pgoff)
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:827:9: note: in expansion of macro 'BUILD_BUG_ON'
     827 |         BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_669 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
