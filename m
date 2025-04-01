Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966BE2EAF7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527022; cv=none; b=rs6yDqo85JtBj9+okwfi2CprNdBbKF3icrNajxyHd90eXMw+3WrhCfNMTmQiZxh08y0y4Y0kDQnH7n1qjjqmU4QhVe9AypG+AoMjgJLtNsQqizRQo4DmR8Gdh5QsSuIFChqnIzevkkeyE9BNUIsyGJlre+p8LdrYqIRNAF7d1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527022; c=relaxed/simple;
	bh=EYq9uCpwMXf8ridC0NbiyaRLzftVJ+gwyp+FARk2EiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcZh7BxKfMLVT4si4K0FW130MbdAJEzJgCgrjZlDBCrS3zgWMfeyVCYmd1yfqN1LuZWk8OFphQtRHpKlyA0oY01zyELUzi3Q4mQXmcrmIqyn9XuUyulcdpi93wJko4EQ15mcUXohcuYsvHB1GhaKg6m6kaaHjJiaKZiGsr67c9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ip7Z4zea; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ip7Z4zea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743527019; x=1775063019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYq9uCpwMXf8ridC0NbiyaRLzftVJ+gwyp+FARk2EiI=;
  b=ip7Z4zea1+2VL4Nlhzq53bNFWp/C8M2k1Q26f/WAo5StKiwkD7Uh2Csf
   XY557+VB8LTopQc803BNJfoQdGglllFoAcN248CxS/0DGNX76obPcB8tm
   aPgldVCnED+z/BBepHV091iA8opTWUrz5svWvaQxvgqOqiVlKcK6T8AKa
   S/BU/NIu76y96RpU2JTPQRXJOVOhVDdYWl38qvLSFYJIKobwxkiDcV07o
   3xmxoK+AzEjkBssJLaDIjchF+Qk2Pidyrj1osOWWGZaMKaWthpOcRZ3uA
   t7v5Ctore3V/iWtxqZRhND1Lk2dMoPbg6A238UFmbWQYEOZnpalG7AQfO
   Q==;
X-CSE-ConnectionGUID: +EIAuI7hTwWJ/3m8ceYfxQ==
X-CSE-MsgGUID: EVnaaYoWS2CBXSMIPPnGPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62263376"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="62263376"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 10:03:39 -0700
X-CSE-ConnectionGUID: zBG2SU/hQPeKSEpDxUewrQ==
X-CSE-MsgGUID: zWm0RsKaSMKjK27QTPIHAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126969270"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2025 10:03:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzf1T-000A1W-18;
	Tue, 01 Apr 2025 17:03:35 +0000
Date: Wed, 2 Apr 2025 01:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Somlo <gsomlo@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [litex-hub:litex-rebase 8/18] drivers/gpio/gpio-litex.c:157:9:
 error: cleanup argument not a function
Message-ID: <202504020038.n7zQoDwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   27cd831fb75ec1b1667350dcdad43e58d34ac9f5
commit: 639fd3757f161027e4f8ec56033e598bf06d7923 [8/18] fixup: use scoped_guard() with LiteGPIO
config: csky-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020038.n7zQoDwK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020038.n7zQoDwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020038.n7zQoDwK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from include/asm-generic/cmpxchg.h:15,
                    from arch/csky/include/asm/cmpxchg.h:162,
                    from include/asm-generic/atomic.h:12,
                    from arch/csky/include/asm/atomic.h:199,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/gpio/gpio-litex.c:19:
   drivers/gpio/gpio-litex.c: In function 'litex_gpio_irq_unmask':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> drivers/gpio/gpio-litex.c:157:9: error: cleanup argument not a function
>> include/linux/cleanup.h:259:17: error: implicit declaration of function 'class_spin_lock_irqsave_constructor'; did you mean 'class_spinlock_irqsave_constructor'? [-Werror=implicit-function-declaration]
     259 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:321:28: error: implicit declaration of function 'class_spin_lock_irqsave_lock_ptr'; did you mean 'class_spinlock_irqsave_lock_ptr'? [-Werror=implicit-function-declaration]
     321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^~~~~~
   include/linux/cleanup.h:335:14: note: in expansion of macro '__guard_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:322:30: note: each undeclared identifier is reported only once for each function it appears in
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   drivers/gpio/gpio-litex.c: In function 'litex_gpio_irq_mask':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:173:9: note: in expansion of macro 'scoped_guard'
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:173:9: error: cleanup argument not a function
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:173:9: note: in expansion of macro 'scoped_guard'
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:173:9: note: in expansion of macro 'scoped_guard'
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   drivers/gpio/gpio-litex.c: In function 'litex_gpio_irq_set_type':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:191:9: note: in expansion of macro 'scoped_guard'
     191 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:191:9: error: cleanup argument not a function
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:191:9: note: in expansion of macro 'scoped_guard'
     191 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:191:9: note: in expansion of macro 'scoped_guard'
     191 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   drivers/gpio/gpio-litex.c: In function 'litex_gpio_irq_eoi':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:231:9: note: in expansion of macro 'scoped_guard'
     231 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock)
         |         ^~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:231:9: error: cleanup argument not a function
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:231:9: note: in expansion of macro 'scoped_guard'
     231 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock)
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-litex.c:231:9: note: in expansion of macro 'scoped_guard'
     231 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock)
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/irqflags.h:17,
                    from include/asm-generic/cmpxchg.h:15,
                    from arch/csky/include/asm/cmpxchg.h:162,
                    from include/asm-generic/atomic.h:12,
                    from arch/csky/include/asm/atomic.h:199,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from gpio-litex.c:19:
   gpio-litex.c: In function 'litex_gpio_irq_unmask':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   gpio-litex.c:157:9: error: cleanup argument not a function
>> include/linux/cleanup.h:259:17: error: implicit declaration of function 'class_spin_lock_irqsave_constructor'; did you mean 'class_spinlock_irqsave_constructor'? [-Werror=implicit-function-declaration]
     259 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:321:28: error: implicit declaration of function 'class_spin_lock_irqsave_lock_ptr'; did you mean 'class_spinlock_irqsave_lock_ptr'? [-Werror=implicit-function-declaration]
     321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^~~~~~
   include/linux/cleanup.h:335:14: note: in expansion of macro '__guard_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |              ^~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:322:30: note: each undeclared identifier is reported only once for each function it appears in
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:157:9: note: in expansion of macro 'scoped_guard'
     157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   gpio-litex.c: In function 'litex_gpio_irq_mask':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:173:9: note: in expansion of macro 'scoped_guard'
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   gpio-litex.c:173:9: error: cleanup argument not a function
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:173:9: note: in expansion of macro 'scoped_guard'
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:173:9: note: in expansion of macro 'scoped_guard'
     173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   gpio-litex.c: In function 'litex_gpio_irq_set_type':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:191:9: note: in expansion of macro 'scoped_guard'
     191 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   gpio-litex.c:191:9: error: cleanup argument not a function
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:191:9: note: in expansion of macro 'scoped_guard'
     191 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:191:9: note: in expansion of macro 'scoped_guard'
     191 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
         |         ^~~~~~~~~~~~
   gpio-litex.c: In function 'litex_gpio_irq_eoi':
>> include/linux/cleanup.h:258:9: error: unknown type name 'class_spin_lock_irqsave_t'; did you mean 'class_spinlock_irqsave_t'?
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   include/linux/cleanup.h:334:14: note: in expansion of macro 'CLASS'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ^~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:231:9: note: in expansion of macro 'scoped_guard'
     231 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock)
         |         ^~~~~~~~~~~~
   gpio-litex.c:231:9: error: cleanup argument not a function
>> include/linux/cleanup.h:334:9: error: declaration of non-variable 'class_spin_lock_irqsave_constructor' in 'for' loop initial declaration
     334 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:231:9: note: in expansion of macro 'scoped_guard'
     231 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock)
         |         ^~~~~~~~~~~~
>> include/linux/cleanup.h:322:30: error: 'class_spin_lock_irqsave_is_conditional' undeclared (first use in this function); did you mean 'class_spinlock_irqsave_is_conditional'?
     322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:335:45: note: in expansion of macro '__is_cond_ptr'
     335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
         |                                             ^~~~~~~~~~~~~
   include/linux/cleanup.h:343:9: note: in expansion of macro '__scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   gpio-litex.c:231:9: note: in expansion of macro 'scoped_guard'
     231 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock)
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +157 drivers/gpio/gpio-litex.c

   145	
   146	static void litex_gpio_irq_unmask(struct irq_data *idata)
   147	{
   148		struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
   149		struct litex_gpio *gpio_s = gpiochip_get_data(chip);
   150		int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
   151		u32 bit = BIT(offset);
   152		u32 enable;
   153	
   154		gpiochip_enable_irq(chip, idata->hwirq);
   155	
   156		/* Clear any sticky pending interrupts */
 > 157		scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
   158			litex_gpio_set_reg(gpio_s, LITEX_GPIO_PENDING_OFFSET, bit);
   159			enable = litex_gpio_get_reg(gpio_s, LITEX_GPIO_ENABLE_OFFSET);
   160			enable |= bit;
   161			litex_gpio_set_reg(gpio_s, LITEX_GPIO_ENABLE_OFFSET, enable);
   162		}
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
