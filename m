Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBF1755A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048216; cv=none; b=kZu67RJfsPBtDqJLMaMozJqIGYgnN6AKF+I7IFKQQK3cg27+naXvLa1f6lwITpcH54LHnb17YGrUkihiXVDfYrQL5TD/qdFw5hkywRqQ1ILYv1k2yVCNvIdC4XmiffcnnzbErGanwgMGQNbvdUofTJlAWLOuhv/tOcibgOIszrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048216; c=relaxed/simple;
	bh=eK2xOzGpkQHhxaM5f2ZtWml8mizLffoMXlsL1usNozs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urVM8VXPO+9sGeRY4VRZW+wAY93vtfZkG2TJldJLnrYd+2J7ISjeGwivn4IFETHLkeG06mp3OCT744OjR8HNJSyqWs29If3QMYDMlRKA8SovpLN3jgzANiJBD7O39llQzvPZsPuYW4jERspOst0iMT2pju1lgUI/yGVgigiwDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeYGGwA8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeYGGwA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712048213; x=1743584213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eK2xOzGpkQHhxaM5f2ZtWml8mizLffoMXlsL1usNozs=;
  b=YeYGGwA88kmkU4hfYXSwAmpXomFoMithujkPE1xmdR90sfvRzSKdRBY0
   46C4wTzSdLc6uK4ZqJwCh1WS8vQmAcId/+ygboheuzRM5nw7QTXj1V6Tk
   sY/ObOOgBYe+ZW0qKA3ZNpUPxfF4kFt1tCuFPwzJd5zX3GVxFlgAYQS6E
   PpAvHSM6GQx704tSkqH4iYRDrbiIMlTHCfK96qE0oSul90oMgTtjWrURH
   ksMcFKlmyOhsU2joPaPM2deHhSU3ex4i4ddsTmGrqxyvWXMjh+Wl0W68n
   jvwkS4AaK8pRtkggV1dqUJpoQYtPIwzvMKK37cQXyUWOWmwMwCkPg6++6
   A==;
X-CSE-ConnectionGUID: LTtSnBM8QuWJwmDNviISLw==
X-CSE-MsgGUID: EHKW56c5R/i7gjADQKTzng==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7415593"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7415593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 01:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17971351"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2024 01:56:51 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrZwl-00014T-1h;
	Tue, 02 Apr 2024 08:56:47 +0000
Date: Tue, 2 Apr 2024 16:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2559/3220]
 arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'const
 struct gre_protocol *' from 'uintptr_t' {aka 'long unsigned int'} makes
 pointer from integer without a cast
Message-ID: <202404021638.QKhbdQ4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2559/3220] riscv: Emulate one-byte and two-byte cmpxchg
config: riscv-randconfig-r036-20230619 (https://download.01.org/0day-ci/archive/20240402/202404021638.QKhbdQ4E-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021638.QKhbdQ4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021638.QKhbdQ4E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from arch/riscv/include/asm/mmiowb.h:12,
                    from arch/riscv/include/asm/mmio.h:16,
                    from arch/riscv/include/asm/clint.h:10,
                    from arch/riscv/include/asm/timex.h:15,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/ipv4/gre_demux.c:10:
   net/ipv4/gre_demux.c: In function 'gre_add_protocol':
   arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
         |                                                              |
         |                                                              const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   In file included from arch/riscv/include/asm/cmpxchg.h:12:
   include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                          ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                         ~~~~~~~~~~^~~
>> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'const struct gre_protocol *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                ^~~~~
         |                                                                |
         |                                                                const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                            ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                       ^~~~~
         |                                                                       |
         |                                                                       const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                           ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'const struct gre_protocol *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   net/ipv4/gre_demux.c: In function 'gre_del_protocol':
   arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
         |                                                              |
         |                                                              const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:48:16: note: in expansion of macro 'cmpxchg'
      48 |         ret = (cmpxchg((const struct gre_protocol **)&gre_proto[version], proto, NULL) == proto) ?
         |                ^~~~~~~
   include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                          ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:48:16: note: in expansion of macro 'cmpxchg'
      48 |         ret = (cmpxchg((const struct gre_protocol **)&gre_proto[version], proto, NULL) == proto) ?
         |                ^~~~~~~
   include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                         ~~~~~~~~~~^~~
>> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'const struct gre_protocol *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:48:16: note: in expansion of macro 'cmpxchg'
      48 |         ret = (cmpxchg((const struct gre_protocol **)&gre_proto[version], proto, NULL) == proto) ?
         |                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                ^~~~~
         |                                                                |
         |                                                                const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:48:16: note: in expansion of macro 'cmpxchg'
      48 |         ret = (cmpxchg((const struct gre_protocol **)&gre_proto[version], proto, NULL) == proto) ?
         |                ^~~~~~~
   include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                            ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                       ^~~~~
         |                                                                       |
         |                                                                       const struct gre_protocol *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:48:16: note: in expansion of macro 'cmpxchg'
      48 |         ret = (cmpxchg((const struct gre_protocol **)&gre_proto[version], proto, NULL) == proto) ?
         |                ^~~~~~~
   include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'const struct gre_protocol *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                           ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'const struct gre_protocol *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:48:16: note: in expansion of macro 'cmpxchg'
      48 |         ret = (cmpxchg((const struct gre_protocol **)&gre_proto[version], proto, NULL) == proto) ?
         |                ^~~~~~~
   net/ipv4/gre_demux.c: In function 'gre_add_protocol':
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
     334 |         case 4:                                                         \
         |         ^~~~
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   net/ipv4/gre_demux.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |         return (cmpxchg((const struct gre_protocol **)&gre_proto[version], NULL, proto) == NULL) ?
         |                 ^~~~~~~
--
   In file included from arch/riscv/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/erofs/internal.h:10,
                    from fs/erofs/compress.h:9,
                    from fs/erofs/zdata.c:7:
   fs/erofs/zdata.c: In function 'z_erofs_try_to_claim_pcluster':
   arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
         |                                                              |
         |                                                              z_erofs_next_pcluster_t {aka void *}
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   In file included from arch/riscv/include/asm/cmpxchg.h:12:
   include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'z_erofs_next_pcluster_t' {aka 'void *'}
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                          ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     z_erofs_next_pcluster_t {aka void *}
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'z_erofs_next_pcluster_t' {aka 'void *'}
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                         ~~~~~~~~~~^~~
>> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'z_erofs_next_pcluster_t' {aka 'void *'} from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                ^~~~~
         |                                                                |
         |                                                                z_erofs_next_pcluster_t {aka void *}
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'z_erofs_next_pcluster_t' {aka 'void *'}
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                            ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                       ^~~~~
         |                                                                       |
         |                                                                       z_erofs_next_pcluster_t {aka void *}
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'z_erofs_next_pcluster_t' {aka 'void *'}
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                           ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'z_erofs_next_pcluster_t' {aka 'void *'} from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:334:9: note: here
     334 |         case 4:                                                         \
         |         ^~~~
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/erofs/zdata.c:751:13: note: in expansion of macro 'cmpxchg'
     751 |         if (cmpxchg(&pcl->next, Z_EROFS_PCLUSTER_NIL,
         |             ^~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
..


vim +329 arch/riscv/include/asm/cmpxchg.h

   319	
   320	#define __cmpxchg(ptr, old, new, size)					\
   321	({									\
   322		__typeof__(ptr) __ptr = (ptr);					\
   323		__typeof__(*(ptr)) __old = (old);				\
   324		__typeof__(*(ptr)) __new = (new);				\
   325		__typeof__(*(ptr)) __ret;					\
   326		register unsigned int __rc;					\
   327		switch (size) {							\
   328		case 1:								\
 > 329			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
   330			break;							\
   331		case 2:								\
   332			break;							\
   333			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
   334		case 4:								\
   335			__asm__ __volatile__ (					\
   336				"0:	lr.w %0, %2\n"				\
   337				"	bne  %0, %z3, 1f\n"			\
   338				"	sc.w.rl %1, %z4, %2\n"			\
   339				"	bnez %1, 0b\n"				\
   340				RISCV_FULL_BARRIER				\
   341				"1:\n"						\
   342				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
   343				: "rJ" ((long)__old), "rJ" (__new)		\
   344				: "memory");					\
   345			break;							\
   346		case 8:								\
   347			__asm__ __volatile__ (					\
   348				"0:	lr.d %0, %2\n"				\
   349				"	bne %0, %z3, 1f\n"			\
   350				"	sc.d.rl %1, %z4, %2\n"			\
   351				"	bnez %1, 0b\n"				\
   352				RISCV_FULL_BARRIER				\
   353				"1:\n"						\
   354				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
   355				: "rJ" (__old), "rJ" (__new)			\
   356				: "memory");					\
   357			break;							\
   358		default:							\
   359			BUILD_BUG();						\
   360		}								\
   361		__ret;								\
   362	})
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
