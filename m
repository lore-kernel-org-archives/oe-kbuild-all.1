Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A215696F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712182863; cv=none; b=VESNtx3CP2yHwYV0kSLBqP0MC4BxfrkD9+veW+wj7FvdzR2lxmSr7uGBdE+iqFOPaPFRVYmhw6TV3MF0PR1PIM7Aj1m5aoxk/OLuF4GxK0sCujhA4PZzqeEVY/I0bAXCtSONDTA2VhdRe7rHuoyXhZtunN7La1nZ0YVLRsc3U9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712182863; c=relaxed/simple;
	bh=X7pZJ+BPmVyNZv0MS4k9GJdhejgN9Ot2AEgbc9gfr5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jkc4knRtS5cibOSOpGu6tanTgs3eExQl99HW4/IT5/MnsPe0HPrs4ySoCdi1OveN2eoL0yRr46o4ouseC6ZH5/3Jr4gCQKq9tqw76Y0flMmPTu6kKku1EMNhNsT6vj8kaj8PL+Apq0Tb/5+HgEf07EX/0964dLnjp6wt45L9eww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcPak80Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcPak80Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E85C433C7;
	Wed,  3 Apr 2024 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712182862;
	bh=X7pZJ+BPmVyNZv0MS4k9GJdhejgN9Ot2AEgbc9gfr5w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DcPak80Q3IRPu5RKHnkJGNB+hi/O2lH3GkvZPAJhXnEuaf2wadlMYVVLbNPcDSXVX
	 JFE95UyOuRiHEuS5bW4LCBBwBbvdSUh1w5Fl8nhOGc4avFBOwEyriUxIr3dY0wh/p7
	 yV1qcwgJGWkmbMY7gJALr3/rzJAr2cHgJf/67YotSY12pyVdORGGaCdTV6EK3w9NyS
	 iOrxnlayy/s8joHOoWDCwL7ltnaKu6zp8OvIonSn35cjzXISv0gw+93mwOTrHTnIsV
	 L1CKsAcLtcsij10C+VhUJgDEmLBmmLBeC/tjjLQIXAIWFfb/4EReSODy+zHQtrB38U
	 R9VFoGg2thUew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 663E6CE109B; Wed,  3 Apr 2024 15:21:02 -0700 (PDT)
Date: Wed, 3 Apr 2024 15:21:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2559/3220]
 arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct
 tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from
 integer without a cast
Message-ID: <e9b05cbe-7e1d-426c-8d4a-805561342015@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404021504.YTP51bL3-lkp@intel.com>
 <55cfb596-8b21-4177-ab4c-0d531fb74c86@paulmck-laptop>
 <Zgz98szFLLjTIZSO@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zgz98szFLLjTIZSO@yujie-X299>

On Wed, Apr 03, 2024 at 02:57:54PM +0800, Yujie Liu wrote:
> Hi Paul,
> 
> On Tue, Apr 02, 2024 at 10:20:59AM -0700, Paul E. McKenney wrote:
> > On Tue, Apr 02, 2024 at 03:08:07PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
> > > commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2559/3220] riscv: Emulate one-byte and two-byte cmpxchg
> > > config: riscv-randconfig-r061-20240402 (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/config)
> > > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202404021504.YTP51bL3-lkp@intel.com/
> > 
> > One fix leads to another.  ;-)
> > 
> > Does the patch at the end of this email clear things up?
> 
> Please kindly see the inline comments.

Good points, thank you, and alleged fix in progress.  ;-)

							Thanx, Paul

> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from arch/riscv/include/asm/atomic.h:19,
> > >                     from include/linux/atomic.h:7,
> > >                     from include/linux/cpumask.h:14,
> > >                     from include/linux/smp.h:13,
> > >                     from include/linux/lockdep.h:14,
> > >                     from include/linux/spinlock.h:63,
> > >                     from include/linux/mmzone.h:8,
> > >                     from include/linux/gfp.h:7,
> > >                     from include/linux/slab.h:16,
> > >                     from drivers/accessibility/speakup/selection.c:2:
> > >    drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
> > >    arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> > >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                                                              ^~~~~
> > >          |                                                              |
> > >          |                                                              struct tty_struct *
> 
> This warning is fixed after adding uintptr_t cast for __old and __new.
> 
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    In file included from arch/riscv/include/asm/cmpxchg.h:12:
> > >    include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > >          |                                          ~~~~~~~~~~^~~
> > >    arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> > >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                                                                     ^~~~~
> > >          |                                                                     |
> > >          |                                                                     struct tty_struct *
> 
> So is this one.
> 
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > >          |                                                         ~~~~~~~~~~^~~
> > > >> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> > >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                       ^
> 
> This warning still exists.
> 
> Seems it needs another cast like below to fix this warning:
> 
>    __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new);
> 
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                                                                ^~~~~
> > >          |                                                                |
> > >          |                                                                struct tty_struct *
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> > >          |                                            ~~~~~~~~~~^~~
> > >    arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                                                                       ^~~~~
> > >          |                                                                       |
> > >          |                                                                       struct tty_struct *
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> > >          |                                                           ~~~~~~~~~~^~~
> > >    arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                       ^
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    drivers/accessibility/speakup/selection.c: In function 'speakup_paste_selection':
> > >    arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> > >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                                                              ^~~~~
> > >          |                                                              |
> > >          |                                                              struct tty_struct *
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> > >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > >          |                                          ~~~~~~~~~~^~~
> > >    arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> > >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                                                                     ^~~~~
> > >          |                                                                     |
> > >          |                                                                     struct tty_struct *
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> > >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > >          |                                                         ~~~~~~~~~~^~~
> > > >> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> > >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >          |                       ^
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> > >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                                                                ^~~~~
> > >          |                                                                |
> > >          |                                                                struct tty_struct *
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> > >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> > >          |                                            ~~~~~~~~~~^~~
> > >    arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                                                                       ^~~~~
> > >          |                                                                       |
> > >          |                                                                       struct tty_struct *
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> > >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> > >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> > >          |                                                           ~~~~~~~~~~^~~
> > >    arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                       ^
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> > >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
> > >    arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
> > >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > >          |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Here is a fallthrough warning. Looks like a copy-paste typo. The "break"
> line and the "__ret = ..." line need to be swapped.
> 
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > >    arch/riscv/include/asm/cmpxchg.h:334:9: note: here
> > >      334 |         case 4:                                                         \
> > >          |         ^~~~
> > >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> > >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> > >          |                              ^~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> > >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> > >          |         ^~~~~~~~~~~
> > >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> > >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> > >          |             ^~~~~~~
> > > 
> > > 
> > > vim +329 arch/riscv/include/asm/cmpxchg.h
> > > 
> > >    319	
> > >    320	#define __cmpxchg(ptr, old, new, size)					\
> > >    321	({									\
> > >    322		__typeof__(ptr) __ptr = (ptr);					\
> > >    323		__typeof__(*(ptr)) __old = (old);				\
> > >    324		__typeof__(*(ptr)) __new = (new);				\
> > >    325		__typeof__(*(ptr)) __ret;					\
> > >    326		register unsigned int __rc;					\
> > >    327		switch (size) {							\
> > >    328		case 1:								\
> > >  > 329			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > >    330			break;							\
> > >    331		case 2:								\
> > >    332			break;							\
> > >    333			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> 
> Seems "break" is supposed to come after the assignment of __ret.
> 
> > >    334		case 4:								\
> > >    335			__asm__ __volatile__ (					\
> > >    336				"0:	lr.w %0, %2\n"				\
> > >    337				"	bne  %0, %z3, 1f\n"			\
> > >    338				"	sc.w.rl %1, %z4, %2\n"			\
> > >    339				"	bnez %1, 0b\n"				\
> > >    340				RISCV_FULL_BARRIER				\
> > >    341				"1:\n"						\
> > >    342				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> > >    343				: "rJ" ((long)__old), "rJ" (__new)		\
> > >    344				: "memory");					\
> > >    345			break;							\
> > >    346		case 8:								\
> > >    347			__asm__ __volatile__ (					\
> > >    348				"0:	lr.d %0, %2\n"				\
> > >    349				"	bne %0, %z3, 1f\n"			\
> > >    350				"	sc.d.rl %1, %z4, %2\n"			\
> > >    351				"	bnez %1, 0b\n"				\
> > >    352				RISCV_FULL_BARRIER				\
> > >    353				"1:\n"						\
> > >    354				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> > >    355				: "rJ" (__old), "rJ" (__new)			\
> > >    356				: "memory");					\
> > >    357			break;							\
> > >    358		default:							\
> > >    359			BUILD_BUG();						\
> > >    360		}								\
> > >    361		__ret;								\
> > >    362	})
> > >    363	
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index a5b377481785c..fb1ac86ac2bf6 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -172,11 +172,11 @@
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> >  	case 1:								\
> > -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  		break;							\
> >  	case 2:								\
> >  		break;							\
> > -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> > +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\
> 
> I drafted an extended fix patch as below. Could you help review? Not
> sure if similar fixes should also be applied to the patches for other
> architectures in the series?
> 
> Thanks,
> Yujie
> 
> -------------------------------------------------------------------------
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index a5b377481785c..4d5c281b1aced 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -172,11 +172,11 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 2:                                                         \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
>                         "0:     lr.w %0, %2\n"                          \
> @@ -222,11 +222,11 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 2:                                                         \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
>                         "0:     lr.w %0, %2\n"                          \
> @@ -274,11 +274,11 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 2:                                                         \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
>                         RISCV_RELEASE_BARRIER                           \
> @@ -326,11 +326,11 @@
>         register unsigned int __rc;                                     \
>         switch (size) {                                                 \
>         case 1:                                                         \
> -               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
>         case 2:                                                         \
> +               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>                 break;                                                  \
> -               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
>                         "0:     lr.w %0, %2\n"                          \
> 
