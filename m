Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C4CA40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718761418; cv=none; b=b9OPA+p7Hm4Jnvt1cVBy8aIZhxhOMkRLOxCFmupOKq3pkFrS7yUK5MfQ21MhGDEmhv91NrTDejQrUViCwNImwXr1Pbk/PKzr6aB+GocXfmsgAvrtxgFyPI2fpvsspyywVuGk2tUx9J10CYy24NHsIBduvthMc0CKzP5UVkGj5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718761418; c=relaxed/simple;
	bh=Ot/DacuyPl0UjqqhO1eog/VnF85JPtTM2+3Cz00sECI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLtyQYdGz69AFc+D6TTworS9L/i2sP1VHKhzKYNCPRXeYPsFTfsayFVLJiZWEWSwVVQL6vXHqM5Nc0zNhWBOTtzE6J7LYW0jWsOSkjVTOd6rFqlxQrILeVhWINWRkEYsR6mFy62JDP5P9zMqaMyVfNypbplHMO3X8+FzRuKV1as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aczKHjv+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aczKHjv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718761416; x=1750297416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ot/DacuyPl0UjqqhO1eog/VnF85JPtTM2+3Cz00sECI=;
  b=aczKHjv+wXI+GC3+6KIKNXxrbeRBDfBwTHRCt1H2UevsSWeUmkTx2O7c
   dECABumFpVJOMNDlQHm/hf3CO79J5fi+3n2aRCjZ5JJPUXekrUq+fT3sD
   q3PvZ8jzgEZNa9mHtn0LQeWqKqDSNPL6D1FmP5n455/SOLWn/yHCFoNtJ
   tH8raYiwr0NrzM3Qj/7dm5h7+eakG8yRxyoOUCAeMh9w6sMFSrY/1Ktux
   ttUvoFYFkZdYi4MgciBkCTaeIe1ouOFPPziIskhPj5lHfFiO8fkn++khM
   KXk3ny5BAH6p1cV8QE/2nFtwbfdDyu8FTOJmhqFJNFFRfa5InLuNd3Z83
   g==;
X-CSE-ConnectionGUID: sVly0X0vSfahXeGZYvrmlw==
X-CSE-MsgGUID: KCcWKmraSsi6Xe7DWcq7kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26357690"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26357690"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 18:43:34 -0700
X-CSE-ConnectionGUID: P6u0hjDYS7+RlraAkOXKQg==
X-CSE-MsgGUID: WSPkAjfgQ1SWpxR9wKrE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="79212833"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 18:43:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJkME-00068i-1w;
	Wed, 19 Jun 2024 01:43:30 +0000
Date: Wed, 19 Jun 2024 09:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:bak-0618 3/3] drivers/iommu/intel/pasid.h:107:17:
 error: unknown type name 'u128'
Message-ID: <202406190900.jWIXgAwB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git bak-0618
head:   5d36234649d8f6673b0f658ed6591f35ba5c626d
commit: 5d36234649d8f6673b0f658ed6591f35ba5c626d [3/3] TMP: Try to make intel_iommu_set_dev_pasid() no rollback to old hw config in error path
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240619/202406190900.jWIXgAwB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190900.jWIXgAwB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190900.jWIXgAwB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/intel/iommu.c:31:
   drivers/iommu/intel/pasid.h: In function 'pasid_set_entry':
>> drivers/iommu/intel/pasid.h:107:17: error: unknown type name 'u128'
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                 ^~~~
>> drivers/iommu/intel/pasid.h:107:30: error: 'u128' undeclared (first use in this function)
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                              ^~~~
   drivers/iommu/intel/pasid.h:107:30: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/iommu/intel/pasid.h:107:36: error: expected expression before ')' token
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                                    ^
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:374,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/user_32.h:5,
                    from arch/x86/include/asm/user.h:6,
                    from include/linux/user.h:1,
                    from include/linux/elfcore.h:5,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/iommu/intel/iommu.c:16:
   drivers/iommu/intel/pasid.h:111:48: error: expected expression before ')' token
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:48: error: expected expression before ')' token
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:72: error: expected expression before ')' token
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                                        ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:72: error: expected expression before ')' token
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                                        ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4954:55: error: invalid type argument of unary '*' (have 'int')
    4954 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4954:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4954 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/x86/include/asm/bitops.h:432,
                    from include/linux/bitops.h:63,
                    from include/linux/log2.h:12,
                    from include/asm-generic/getorder.h:8,
                    from arch/x86/include/asm/page.h:90:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   include/linux/atomic/atomic-instrumented.h:4955:49: error: invalid type argument of unary '*' (have 'int')
    4955 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                                                 ^~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4955:31: warning: passing argument 1 of 'instrument_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4955 |         instrument_read_write(__ai_oldp, sizeof(*__ai_oldp)); \
         |                               ^~~~~~~~~
         |                               |
         |                               int
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   include/linux/instrumented.h:52:72: note: expected 'const volatile void *' but argument is of type 'int'
      52 | static __always_inline void instrument_read_write(const volatile void *v, size_t size)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/atomic/atomic-arch-fallback.h:325:16: error: invalid type argument of unary '*' (have 'int')
     325 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                ^~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4956:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
>> include/linux/atomic/atomic-arch-fallback.h:325:34: warning: initialization of 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     325 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4956:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:325:34: note: (near initialization for '__ret_warn_on')
     325 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4956:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
>> include/linux/atomic/atomic-arch-fallback.h:326:14: error: void value not ignored as it ought to be
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |              ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4956:9: note: in expansion of macro 'raw_try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.h:111:26: note: in expansion of macro 'try_cmpxchg128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^~~~~~~~~~~~~~
>> drivers/iommu/intel/pasid.h:107:23: warning: unused variable 'ptr' [-Wunused-variable]
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                       ^~~
>> drivers/iommu/intel/pasid.h:104:13: warning: variable 'old' set but not used [-Wunused-but-set-variable]
     104 |         u64 old[2];
         |             ^~~


vim +/u128 +107 drivers/iommu/intel/pasid.h

   100	
   101	static inline void pasid_set_entry(struct pasid_entry *pte,
   102					   struct pasid_entry *new)
   103	{
 > 104		u64 old[2];
   105	
   106		for (int i = 0; i < 4; i++) {
 > 107			u128 *ptr = (u128 *)&new->val[2*i];
   108	
   109			old[0] = READ_ONCE(pte->val[2*i]);
   110			old[1] = READ_ONCE(pte->val[2*i+1]);
   111			WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
   112		}
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
