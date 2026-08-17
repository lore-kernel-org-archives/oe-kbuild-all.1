Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C05242925
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978997; cv=none; b=fc7fMPDBD8zbonqVfYNZEiAM8x5j9clUfZmyx7x4uubKQ2oQR8pQOvd0tIGtd2aN0WsVV55lNFdCXhaLqvMFVg1sM3yLGPJ1Hj4I4ctS/ANyiCrxQQFTPesS4EG2hwsuR/ECz6UqKmaddok90WVS0n5wWXCMgIElSbuL8ecvYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978997; c=relaxed/simple;
	bh=FQFf/DXcg85mLcrq5nfoiN+ePkhUxzGiFmb5jahOZF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iY8cw11BjG01ooLvyeIgKLz+jVu/wOhzpwohblSKh0QCAiCLHiXPwKmTHgG5VcKdIflgzP+8LbakNGRv19Txy22EhID7Zc1v/MnJrwo1ltE8an1NRE1yfVhuhlvhF+7JALcX/8KF//1ps4OL+X4r2mdQ265RDfs49LtR6J7p6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VK0GZ3qR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VK0GZ3qR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786978995; x=1818514995;
  h=date:from:to:cc:subject:message-id;
  bh=FQFf/DXcg85mLcrq5nfoiN+ePkhUxzGiFmb5jahOZF8=;
  b=VK0GZ3qRiE/J/2BxF+ejS+HYr6SqmPTY5lPxwXud6v3wgWY4Oy2TskDt
   8NBbnkv0MlGMP5CH8I40IVA4Tep/0mXV8u1Xbn61VmuE95o1iuFA868KH
   CXMgyUMRRm8dVT0xRz4CG/C/kieNX7T/ngvaUkeJYdPosJ3/9rgb8jX/k
   H68laB3XXXS2a5uk5QaRaunmioR3Ck3d3AJJrN46gAUDCL+oQuWxLfMpx
   MNmVfSpto0rdnZ7spuIy+phqy++dlKY2cK4SnH5Va6yFomO2Es9zcO8oS
   QGq0t7bP+6Q2XZv2VRAVM+xuDsJKHWo9TtiHb8BajNIqzv/+Cq3SkUPho
   A==;
X-CSE-ConnectionGUID: vvqmd+3iSiGKOvUhzlzvrg==
X-CSE-MsgGUID: pGDgLqCgQIOB5SrtqPeRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86414524"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="86414524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:03:13 -0700
X-CSE-ConnectionGUID: pkZK2TFyQFG+OuGuZlxwoA==
X-CSE-MsgGUID: Ny66FnFjQLyuthN9sn5+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="261684474"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2026 08:03:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvyrk-00000000dXm-3q2H;
	Mon, 17 Aug 2026 15:03:08 +0000
Date: Mon, 17 Aug 2026 23:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Matt Turner <mattst88@gmail.com>
Subject: [lindholm-alpha:for-next 9/15]
 include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared
 in inline function '__memset' which is not static
Message-ID: <202608172237.efBkiuM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git for-next
head:   b39c748d9db0c6f3ada5e7cef7f56415827d5f81
commit: d1ee975398a357be8f56836a87ae55c51770e4f0 [9/15] alpha: enable lockdep hardirq state tracking
config: alpha-randconfig-r123-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172237.efBkiuM6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172237.efBkiuM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172237.efBkiuM6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from scripts/mod/devicetable-offsets.c:4:
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:3: note: in expansion of macro 'if'
      if (__builtin_constant_p(n)) {
      ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(c)) {
     ^~
--
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/alpha/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/alpha/kernel/asm-offsets.c:11:
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'pte_clear' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/include/asm/pgtable.h:214:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(pte_val(*ptep), 0);
     ^~~~~~~~~~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:3: note: in expansion of macro 'if'
      if (__builtin_constant_p(n)) {
      ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(c)) {
     ^~
--
   In file included from include/linux/jump_label.h:77,
                    from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'ev5_switch_mm' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/mmu_context.h:148:2: note: in expansion of macro 'if'
     if ((mmc ^ asn) & ~HARDWARE_ASN_MASK) {
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__get_new_mm_context' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/mmu_context.h:124:2: note: in expansion of macro 'if'
     if ((asn & HARDWARE_ASN_MASK) >= MAX_ASN) {
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'set_hae' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/io.h:47:2: note: in expansion of macro 'if'
     if (new_hae != alpha_mv.hae_cache)
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'pte_clear' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/include/asm/pgtable.h:214:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(pte_val(*ptep), 0);
     ^~~~~~~~~~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:3: note: in expansion of macro 'if'
      if (__builtin_constant_p(n)) {
      ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(c)) {
     ^~
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from init/do_mounts.c:2:
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'set_hae' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/io.h:47:2: note: in expansion of macro 'if'
     if (new_hae != alpha_mv.hae_cache)
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'pte_clear' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/include/asm/pgtable.h:214:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(pte_val(*ptep), 0);
     ^~~~~~~~~~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:3: note: in expansion of macro 'if'
      if (__builtin_constant_p(n)) {
      ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(c)) {
     ^~
--
   In file included from include/linux/export.h:5,
                    from mm/filemap.c:13:
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'ev5_flush_tlb_current_page' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/tlbflush.h:32:2: note: in expansion of macro 'if'
     if (vma->vm_flags & VM_EXEC)
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'ev5_switch_mm' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/mmu_context.h:148:2: note: in expansion of macro 'if'
     if ((mmc ^ asn) & ~HARDWARE_ASN_MASK) {
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__get_new_mm_context' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/mmu_context.h:124:2: note: in expansion of macro 'if'
     if ((asn & HARDWARE_ASN_MASK) >= MAX_ASN) {
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'set_hae' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/io.h:47:2: note: in expansion of macro 'if'
     if (new_hae != alpha_mv.hae_cache)
     ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function 'pte_clear' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:3: note: in expansion of macro 'if'
      if (!(condition))     \
      ^~
   include/linux/compiler_types.h:690:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/include/asm/pgtable.h:214:2: note: in expansion of macro 'WRITE_ONCE'
     WRITE_ONCE(pte_val(*ptep), 0);
     ^~~~~~~~~~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:3: note: in expansion of macro 'if'
      if (__builtin_constant_p(n)) {
      ^~
>> include/linux/compiler.h:63:3: warning: '__if_trace' is static but declared in inline function '__memset' which is not static
      __if_trace = {    \
      ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                        ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(c)) {
     ^~
..


vim +63 include/linux/compiler.h

a15fd609ad53a6 Linus Torvalds 2019-03-20  56  
a15fd609ad53a6 Linus Torvalds 2019-03-20 @57  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
a15fd609ad53a6 Linus Torvalds 2019-03-20  58  
a15fd609ad53a6 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc9 Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde1 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a6 Linus Torvalds 2019-03-20 @63  		__if_trace = {				\
2bcd521a684cc9 Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  71  })
a15fd609ad53a6 Linus Torvalds 2019-03-20  72  

:::::: The code at line 63 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
