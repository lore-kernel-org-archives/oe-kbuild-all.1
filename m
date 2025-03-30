Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7B320F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 05:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743313294; cv=none; b=bETmzDsrm8MBAK03d6Z4DRvlDCVGWN1BZWu6KMSYx4foL0livU0xyD7exreg51eamMmlHiDUQYFakycw1HUbGdCZiKSlHKlZcf3BjL7oSHk5fD8iSSw4rmbptMMagSIRZRz2bapuYIWJxZJx2OzUMPGiuEGLNDY78GD+ToumUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743313294; c=relaxed/simple;
	bh=J1p3ba/zgvASXOSlJh/sj1FwT2Yk5xNUGKUVxwAl3lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNoKiSBou2fNZ3pYsCl/PqWdH7Vuz/66xkFCxUL/twSxOVbwv/3R7HeFsB24+iGB8Cb1FGUsDOXpwD9yd6C2Op+IKD+bbSov/zAnsuhMgTraPj/im9TJtCb5t9vyqo+4wnI20x7gtEpyh/HToulkg2k1iWNgtJ4M7eRw7Khz24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7xwqGIL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7xwqGIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743313292; x=1774849292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1p3ba/zgvASXOSlJh/sj1FwT2Yk5xNUGKUVxwAl3lE=;
  b=U7xwqGILHGl4dL+mZoLwFUzjViVrF9rwwQa0itddzBcO/oZOyI6nup6y
   Bp0VIVb7sk2Zko1DcE1eE/T1dDl2PQeAySZvu+pWJUYRZiwGWJzWIhT71
   BtbbPzNJVYQFJ5lSz++dKvxYCaNcgizj73OY7D9VPcaW97HxLP1ZXsLYY
   Svmb/sNdU+FCVIqfTk5vuXLhDfSPWECMJ9UrWA4S3/cEtiBhXvhBX8tyL
   UT/26gcrcQPhGUSYVl0VpBluaCeZ2WNedH8qaCM0yrepRzTpumhljOue+
   5jXYW8lEareog0uwWLIcolNHoK8Wja9jaXzI0y4umVHU39GmcU1fm8mDb
   A==;
X-CSE-ConnectionGUID: ZQT5x4KeR6C9qQ1g23K2Wg==
X-CSE-MsgGUID: juC+ixdBSXqBqkSxglWbag==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44345729"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="44345729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 22:41:32 -0700
X-CSE-ConnectionGUID: rb4Fjr+VS66TRmMfxkxTXQ==
X-CSE-MsgGUID: 68H34NrSSQ6mFDwdUXB/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="125622932"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2025 22:41:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tylQD-0008XA-1A;
	Sun, 30 Mar 2025 05:41:27 +0000
Date: Sun, 30 Mar 2025 13:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crc 11/11] arch/x86/include/asm/simd.h:8:28: error:
 unknown type name 'bool'
Message-ID: <202503301330.F1M4bqFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crc
head:   e56e2af8867c3690298e889b9febb1cb4d712341
commit: e56e2af8867c3690298e889b9febb1cb4d712341 [11/11] lib/crc_kunit.c: add proper nosimd testing
config: um-randconfig-002-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301330.F1M4bqFC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301330.F1M4bqFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301330.F1M4bqFC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/simd.h:6,
                    from include/linux/simd.h:4,
                    from lib/simd.c:8:
>> arch/um/include/asm/fpu/api.h:14:15: error: unknown type name 'bool'
      14 | static inline bool irq_fpu_usable(void)
         |               ^~~~
   arch/um/include/asm/fpu/api.h: In function 'irq_fpu_usable':
>> arch/um/include/asm/fpu/api.h:16:16: error: 'true' undeclared (first use in this function)
      16 |         return true;
         |                ^~~~
   arch/um/include/asm/fpu/api.h:1:1: note: 'true' is defined in header '<stdbool.h>'; did you forget to '#include <stdbool.h>'?
     +++ |+#include <stdbool.h>
       1 | /* SPDX-License-Identifier: GPL-2.0-or-later */
   arch/um/include/asm/fpu/api.h:16:16: note: each undeclared identifier is reported only once for each function it appears in
      16 |         return true;
         |                ^~~~
   arch/x86/include/asm/simd.h: At top level:
>> arch/x86/include/asm/simd.h:8:28: error: unknown type name 'bool'
       8 | static __must_check inline bool __may_use_simd(void)
         |                            ^~~~


vim +/bool +8 arch/x86/include/asm/simd.h

801201aa256462 Ard Biesheuvel 2013-09-20   7  
e7f69959b31459 Eric Biggers   2025-03-29  @8  static __must_check inline bool __may_use_simd(void)
801201aa256462 Ard Biesheuvel 2013-09-20   9  {
801201aa256462 Ard Biesheuvel 2013-09-20  10  	return irq_fpu_usable();
801201aa256462 Ard Biesheuvel 2013-09-20  11  }
e7f69959b31459 Eric Biggers   2025-03-29  12  

:::::: The code at line 8 was first introduced by commit
:::::: e7f69959b314595d18d8527e1f298d66ab1caca4 lib/simd, crypto: refactor SIMD testing support into lib code

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
