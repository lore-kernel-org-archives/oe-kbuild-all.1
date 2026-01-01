Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A071D1A9F83
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 02:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767234868; cv=none; b=FHbwFfifdgIRgVRRiTX3HZFbJanyoidx4r0UmA6/93MlVu4B/2cumdl11fwxW74qJkvraGJ28hjF/E9yHTEAcHt8IgPKMZbR6qnzJf5ade4X7SSHi1JasZCuF/x3638/17Sa1h22tPu50oBI7wqCXARD0k2W39Majxk6tA6HW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767234868; c=relaxed/simple;
	bh=RNOz4lNNcEP+o2rzdkzdaNkGbpNBBU0MELwTqH4Dzi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQIiFeqLJRtshJDg6TVNDKEwTfIut4AN6db/SDArPxpAPlpkIu8HFOmlwR03Gc4dWIf2MzAez34D1/JpfF+n/AV8NdbN9rkLwtGn/Zi9eyIBs2NN+VHqw9gEIklrcHRbrQJwmfquWMRMGkW5061n1/qNm3H9tLomYmNk3INCb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evKSwydj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evKSwydj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767234866; x=1798770866;
  h=date:from:to:cc:subject:message-id;
  bh=RNOz4lNNcEP+o2rzdkzdaNkGbpNBBU0MELwTqH4Dzi4=;
  b=evKSwydj9+92ylYHkfNNCZaXAJ5Tybqwrpar5n9ilsya8PcFo+AHQzIf
   Y6j/MMwDwyDZChtEQ9YYw+tkOXeDJuPa/A+7gQfsSyDH/oGCYZe4RN1Bp
   vAnhMJTnnVC5k0Rut7L/UWp6FBdSzrQ4T73bUqlWZPLV7AMUF7X43y5uV
   HXUOoayIO0Mf3CiFrhIkYhnnHrhbfWl88m2T23bnH7RMDN35CDat6lDX7
   KvOqHh+GU3bJCiVgpFkgQXYLhLjNG9RoXld6IPMXroPWLQyU0gYNJNTNh
   D5AdpsUC15jc2vJA5+af6n7R046mBl95AIlG9xT+sjLORlfCRET6K649f
   w==;
X-CSE-ConnectionGUID: d6Gj1IhZTz2wMF9DyVQusA==
X-CSE-MsgGUID: sXNUYrE2SsipXu0Opt3aGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68771925"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="68771925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 18:34:26 -0800
X-CSE-ConnectionGUID: r3mHgOCCSPKHqFOeXwrk9w==
X-CSE-MsgGUID: Vvlbu2p+RHWNu9+4fwgbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201432388"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Dec 2025 18:34:24 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb8W5-000000001cv-3Ruj;
	Thu, 01 Jan 2026 02:34:21 +0000
Date: Thu, 01 Jan 2026 10:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: include/math-emu/double.h:59:21: warning: '__BIG_ENDIAN' is
 not defined, evaluates to 0
Message-ID: <202601011003.bwpVuFs1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: aca95fb6bb572a77f39d42d83ab72a965026577d powerpc/microwatt: Add SMP support
date:   10 months ago
config: powerpc64-randconfig-r113-20251231 (https://download.01.org/0day-ci/archive/20260101/202601011003.bwpVuFs1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011003.bwpVuFs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011003.bwpVuFs1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from arch/powerpc/math-emu/math.c:14:
>> include/math-emu/double.h:59:21: warning: '__BIG_ENDIAN' is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from arch/powerpc/math-emu/fsqrts.c:8:
>> include/math-emu/double.h:59:21: warning: '__BIG_ENDIAN' is not defined, evaluates to 0 [-Wundef]
      59 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^
   In file included from arch/powerpc/math-emu/fsqrts.c:9:
>> include/math-emu/single.h:50:21: warning: '__BIG_ENDIAN' is not defined, evaluates to 0 [-Wundef]
      50 | #if __BYTE_ORDER == __BIG_ENDIAN
         |                     ^
   3 warnings generated.


vim +/__BIG_ENDIAN +59 include/math-emu/double.h

^1da177e4c3f415 Linus Torvalds 2005-04-16  54  
^1da177e4c3f415 Linus Torvalds 2005-04-16  55  union _FP_UNION_D
^1da177e4c3f415 Linus Torvalds 2005-04-16  56  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  57    double flt;
^1da177e4c3f415 Linus Torvalds 2005-04-16  58    struct {
^1da177e4c3f415 Linus Torvalds 2005-04-16 @59  #if __BYTE_ORDER == __BIG_ENDIAN
^1da177e4c3f415 Linus Torvalds 2005-04-16  60      unsigned sign  : 1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  61      unsigned exp   : _FP_EXPBITS_D;
^1da177e4c3f415 Linus Torvalds 2005-04-16  62      unsigned frac1 : _FP_FRACBITS_D - (_FP_IMPLBIT_D != 0) - _FP_W_TYPE_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  63      unsigned frac0 : _FP_W_TYPE_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  64  #else
^1da177e4c3f415 Linus Torvalds 2005-04-16  65      unsigned frac0 : _FP_W_TYPE_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  66      unsigned frac1 : _FP_FRACBITS_D - (_FP_IMPLBIT_D != 0) - _FP_W_TYPE_SIZE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  67      unsigned exp   : _FP_EXPBITS_D;
^1da177e4c3f415 Linus Torvalds 2005-04-16  68      unsigned sign  : 1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  69  #endif
^1da177e4c3f415 Linus Torvalds 2005-04-16  70    } bits __attribute__((packed));
^1da177e4c3f415 Linus Torvalds 2005-04-16  71  };
^1da177e4c3f415 Linus Torvalds 2005-04-16  72  

:::::: The code at line 59 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
