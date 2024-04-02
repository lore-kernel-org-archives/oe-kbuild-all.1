Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6A7323D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712041702; cv=none; b=aJV9zcPvjSrO1HDoOsmtWaKRyhYs0DCz7EqEwwLnDZL05q377hyi9tO5OA/DRmVxRE30Udko0K5D8mfUQK6ZcLGs4KmZqM1LvLmV9DqR823fy2tnPI+ZAt2PsGPCmjCWRu8fQABif/kTR6uhA5lPFtJLUFN1K3YIfe0czjia0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712041702; c=relaxed/simple;
	bh=0IGzbOIGZ4Hzl9EAiDL2+hhhqdrmtTSnQ0aJxT6S7tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rm1CCukO8Y/QM0UW22+bLvsd+O4YrPzQPG7P7bEbEC0v2CCc6dpdLDKZfBTS0O3f6UOPHq3nCwWFzn1ibXI+QugIdZcX8xsjhE4c2iN4kAvplQEXQzDHab3Cfv8kyVDWreiFXCZZdXLiWxE1f82LV2I4BoaLAYKmWsuUn6jDGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGb0SwpV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGb0SwpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712041699; x=1743577699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IGzbOIGZ4Hzl9EAiDL2+hhhqdrmtTSnQ0aJxT6S7tM=;
  b=YGb0SwpVPnU18JOoWe3mvn1xlwvArHx/sXHs10aHCz1G3aM5d2Wfj55M
   mL550KMD98YXnjzCU+92u7RGzBuNqm26mDR5M2AY87a/xmSmNQ2zzDhCB
   ix4y0uExCBbkBZeQBvvxgLRMrGjdMm00ZEQdfHKmtctDzHAhjDTSsiZvx
   O8bQiyIaxAL0Z9MwVTLdSdm14YysWlLKRKAppHFH9M7YmDDfLYnnXKUkL
   psljrG17JIDVgNm9NkPkXllqltyRt1cNn1ZcodXYkaNLliosgHQZxB+AM
   2F6anDybW1u69G0S6LP73yAOdzcCxi5r9VdsISlUy/CmzermjRDYhU4d1
   w==;
X-CSE-ConnectionGUID: Z4ECIuXZRPGgp0ilfvzkHw==
X-CSE-MsgGUID: MZzyYkhOSdqw15oYtV2LOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18643788"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18643788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 00:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18021166"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2024 00:08:16 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrYFi-0000zR-27;
	Tue, 02 Apr 2024 07:08:14 +0000
Date: Tue, 2 Apr 2024 15:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2559/3220]
 arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct
 tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from
 integer without a cast
Message-ID: <202404021504.YTP51bL3-lkp@intel.com>
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
config: riscv-randconfig-r061-20240402 (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021504.YTP51bL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/accessibility/speakup/selection.c:2:
   drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
   arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
         |                                                              |
         |                                                              struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~
   In file included from arch/riscv/include/asm/cmpxchg.h:12:
   include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                          ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                         ~~~~~~~~~~^~~
>> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                ^~~~~
         |                                                                |
         |                                                                struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                            ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                       ^~~~~
         |                                                                       |
         |                                                                       struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                           ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~
   drivers/accessibility/speakup/selection.c: In function 'speakup_paste_selection':
   arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                              ^~~~~
         |                                                              |
         |                                                              struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
     124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                          ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
     329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
     124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
         |                                                         ~~~~~~~~~~^~~
>> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
     124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
         |             ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                ^~~~~
         |                                                                |
         |                                                                struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
     124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                            ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
     333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                                                                       ^~~~~
         |                                                                       |
         |                                                                       struct tty_struct *
   arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
     368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
     124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
         |             ^~~~~~~
   include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
      14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
         |                                                           ~~~~~~~~~~^~~
   arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
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
   drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
     124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
         |             ^~~~~~~
   drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
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
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
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
   drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
      71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
         |             ^~~~~~~


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
