Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB514B07B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712078460; cv=none; b=XwOaoEdmtMc3RYYPcfITyd+ML2nBxwYLeLB7VzB1E1EWxn34i9VfaHOpx5Z/LpgcL2CmV4RwGVR1tzlgVTitmLLWDJlcUq0kCFkzjyMl1b4DOfS28zLFvmC6GD8UhF09SLA0j8HTO2C0iAFxah2Yqvc6725BKDZU1EWX4lHAv5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712078460; c=relaxed/simple;
	bh=UK+3+HxSRTmbngxVPisYm46ZN+zdwzhqfhTYNlZ8FO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2f8kbTY0uKu9ev3zHdwRmEkTeBZAGQ6A13dduIVBFSZKyFdTCYi2NS2RtSt9ZKUiYiMswwayIriCneDuGHSFKU5plG14UCrWcJXpymKqTdYcMWWSD8FTMMCqkkKagwkoxdkXY6Yk1e98G76sJoBnS2iftyHRXvwoVQ8P/DxXJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuJsNdep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuJsNdep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3B5C433C7;
	Tue,  2 Apr 2024 17:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712078460;
	bh=UK+3+HxSRTmbngxVPisYm46ZN+zdwzhqfhTYNlZ8FO0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JuJsNdep86NzuSCIXdfbJlBnDRCabBn8nvVfaE/cDCCrorB3Zk9Xn7ZGHhz5DGoEJ
	 vIHL425HFyzYRRW+g33MmMp3iv5Ftl+t3ZGEJklHJNZ6+9TFysjwHVl1J4VH6XhJLh
	 ZawDyqfaLAC38L9p+GAhVdXzj7WTULkowO9D4zs8fU+49q5DfHZZ+G0LElZ42XEbSj
	 vPBg9ScjKi5YcH5r9uMepswJPK0Ybk2C36r6G7uwXygeEuHfhgg6v01EmAIujK6MyG
	 gPabBrqWik3XZ/UtjHM6sq5X/vatMlMuvuvsIZOSHb4c4nB9v86HznK/gCFcX+3qAU
	 XyEPqjE4rX44g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 91D10CE0FF2; Tue,  2 Apr 2024 10:20:59 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:20:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2559/3220]
 arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct
 tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from
 integer without a cast
Message-ID: <55cfb596-8b21-4177-ab4c-0d531fb74c86@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404021504.YTP51bL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404021504.YTP51bL3-lkp@intel.com>

On Tue, Apr 02, 2024 at 03:08:07PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
> commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2559/3220] riscv: Emulate one-byte and two-byte cmpxchg
> config: riscv-randconfig-r061-20240402 (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404021504.YTP51bL3-lkp@intel.com/

One fix leads to another.  ;-)

Does the patch at the end of this email clear things up?

							Thanx, Paul

> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/riscv/include/asm/atomic.h:19,
>                     from include/linux/atomic.h:7,
>                     from include/linux/cpumask.h:14,
>                     from include/linux/smp.h:13,
>                     from include/linux/lockdep.h:14,
>                     from include/linux/spinlock.h:63,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/slab.h:16,
>                     from drivers/accessibility/speakup/selection.c:2:
>    drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
>    arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
>      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                              ^~~~~
>          |                                                              |
>          |                                                              struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    In file included from arch/riscv/include/asm/cmpxchg.h:12:
>    include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                          ~~~~~~~~~~^~~
>    arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
>      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                                     ^~~~~
>          |                                                                     |
>          |                                                                     struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                                         ~~~~~~~~~~^~~
> >> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
>      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                       ^
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                                                                ^~~~~
>          |                                                                |
>          |                                                                struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>          |                                            ~~~~~~~~~~^~~
>    arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                                                                       ^~~~~
>          |                                                                       |
>          |                                                                       struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>          |                                                           ~~~~~~~~~~^~~
>    arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                       ^
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    drivers/accessibility/speakup/selection.c: In function 'speakup_paste_selection':
>    arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
>      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                              ^~~~~
>          |                                                              |
>          |                                                              struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
>      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                          ~~~~~~~~~~^~~
>    arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
>      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                                                                     ^~~~~
>          |                                                                     |
>          |                                                                     struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
>      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
>          |                                                         ~~~~~~~~~~^~~
> >> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
>      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>          |                       ^
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
>      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                                                                ^~~~~
>          |                                                                |
>          |                                                                struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
>      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>          |                                            ~~~~~~~~~~^~~
>    arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                                                                       ^~~~~
>          |                                                                       |
>          |                                                                       struct tty_struct *
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
>      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
>       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
>          |                                                           ~~~~~~~~~~^~~
>    arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                       ^
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
>      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
>    arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
>      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>          |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
>    arch/riscv/include/asm/cmpxchg.h:334:9: note: here
>      334 |         case 4:                                                         \
>          |         ^~~~
>    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
>      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
>          |                              ^~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
>     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
>          |         ^~~~~~~~~~~
>    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
>       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
>          |             ^~~~~~~
> 
> 
> vim +329 arch/riscv/include/asm/cmpxchg.h
> 
>    319	
>    320	#define __cmpxchg(ptr, old, new, size)					\
>    321	({									\
>    322		__typeof__(ptr) __ptr = (ptr);					\
>    323		__typeof__(*(ptr)) __old = (old);				\
>    324		__typeof__(*(ptr)) __new = (new);				\
>    325		__typeof__(*(ptr)) __ret;					\
>    326		register unsigned int __rc;					\
>    327		switch (size) {							\
>    328		case 1:								\
>  > 329			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
>    330			break;							\
>    331		case 2:								\
>    332			break;							\
>    333			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>    334		case 4:								\
>    335			__asm__ __volatile__ (					\
>    336				"0:	lr.w %0, %2\n"				\
>    337				"	bne  %0, %z3, 1f\n"			\
>    338				"	sc.w.rl %1, %z4, %2\n"			\
>    339				"	bnez %1, 0b\n"				\
>    340				RISCV_FULL_BARRIER				\
>    341				"1:\n"						\
>    342				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
>    343				: "rJ" ((long)__old), "rJ" (__new)		\
>    344				: "memory");					\
>    345			break;							\
>    346		case 8:								\
>    347			__asm__ __volatile__ (					\
>    348				"0:	lr.d %0, %2\n"				\
>    349				"	bne %0, %z3, 1f\n"			\
>    350				"	sc.d.rl %1, %z4, %2\n"			\
>    351				"	bnez %1, 0b\n"				\
>    352				RISCV_FULL_BARRIER				\
>    353				"1:\n"						\
>    354				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
>    355				: "rJ" (__old), "rJ" (__new)			\
>    356				: "memory");					\
>    357			break;							\
>    358		default:							\
>    359			BUILD_BUG();						\
>    360		}								\
>    361		__ret;								\
>    362	})
>    363	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

------------------------------------------------------------------------

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index a5b377481785c..fb1ac86ac2bf6 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -172,11 +172,11 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 1:								\
-		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 		break;							\
 	case 2:								\
 		break;							\
-		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
