Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4743A2BE642
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902404; cv=none; b=d77gOigUBBz4mXGxY1pHmdljGi/Af9WT+2dp5Dyx43JCBt571Ys9JDdsdTw6AWRmevIPydxLj886h3xmRvfxN2Syg23nvD8OnJqUaxdRRhCMX88lKl0LYGzQxe6hA2wRBdpUarRvhLy5Y+VzTxnzM7YXNJ0lJZvQVTEPc01D5f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902404; c=relaxed/simple;
	bh=zK3kD4eclnp70niUPWBlEypWZH/vcHmOR6GkbPC86lw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HII/b/EEbjoyaV4fI5cOIUZyzYO8+LfYkBfQN6CnNo0LWEoyHlfN7ByOG+FoJyeVaRIxtUaBK3DOZaU3FZPMp3+59j3Tmcxo6lvrjrvEx8NUUsmRgxONT4v/2A1MbUAeskO172u5h7hYXodeuTeArLEKWAXOYFcW+68SJkvCQoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naFB2Tym; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naFB2Tym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774902403; x=1806438403;
  h=date:from:to:cc:subject:message-id;
  bh=zK3kD4eclnp70niUPWBlEypWZH/vcHmOR6GkbPC86lw=;
  b=naFB2TymRoFA4U0GLhwrabcNC6/B2ZEDaEyzfxLCoHxYbrMdnDCO8oG3
   +Uk/0GiZD60BXGzyej106oXiYVmV0OwRnQkUNaO5Z+gTjPvR8dVRYieiz
   wwNHaEiXLmueOcpe25mW6fQfIH/Y37W3qSOKn7fTrIbJ63dFD3NtlSJn8
   CWuRjgNDZ1K9b+XaO1DQaPZfai3rtR+kMMjqaEuCHR8FZUsCzbRvHxCOu
   IFjDmq4SFy/OEtOZXd5b6md9+sGss7/mqQWw0SEjckvwS+YkpdwPZnAq2
   4ixCKUn+ZbnMOZjCE/X7qLEA5uSmCBQ2C84Y1O9VouksbkGokTgwhnObQ
   Q==;
X-CSE-ConnectionGUID: MOEx8VAnSE2EMXb0nbpstA==
X-CSE-MsgGUID: e5nU2kJRRP+3aMEsn1rN4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="78500351"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="78500351"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:26:43 -0700
X-CSE-ConnectionGUID: U0hkqG0BQYaGHRfcLL7wIg==
X-CSE-MsgGUID: 0H5HmMEQTiC8TjSADst8ZA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 13:26:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7JC2-000000001en-31ZE;
	Mon, 30 Mar 2026 20:26:38 +0000
Date: Tue, 31 Mar 2026 04:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 3/14] sound/drivers/dummy.c:49:12:
 warning: 'index' defined but not used
Message-ID: <202603310426.DI9CgrUK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   101e17624801c8d4b8d75e5b3fa3cd59e2e040d4
commit: 73d4b7679a4398f4e3f43b465b7f4de43a5d0683 [3/14] futex: Move futex related mm_struct data into a struct
config: riscv-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260331/202603310426.DI9CgrUK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310426.DI9CgrUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310426.DI9CgrUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched.h:19,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from sound/drivers/dummy.c:9:
   include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      51 |         unsigned int                    __percpu *ref;
         |                                                  ^
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from sound/drivers/dummy.c:7:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:63:1: note: in expansion of macro 'module_param_array'
      63 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/drivers/dummy.c:49:12: warning: 'index' defined but not used [-Wunused-variable]
      49 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/sched.h:19,
                    from include/linux/delay.h:13,
                    from sound/pci/fm801.c:7:
   include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      51 |         unsigned int                    __percpu *ref;
         |                                                  ^
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/riscv/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/fm801.c:44:1: note: in expansion of macro 'module_param_array'
      44 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/fm801.c:30:12: warning: 'index' defined but not used [-Wunused-variable]
      30 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/sched.h:19,
                    from include/linux/delay.h:13,
                    from sound/pci/korg1212/korg1212.c:8:
   include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      51 |         unsigned int                    __percpu *ref;
         |                                                  ^
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/riscv/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/korg1212/korg1212.c:394:1: note: in expansion of macro 'module_param_array'
     394 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/korg1212/korg1212.c:390:12: warning: 'index' defined but not used [-Wunused-variable]
     390 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;     /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/sched.h:19,
                    from include/linux/delay.h:13,
                    from sound/pci/rme9652/hdsp.c:11:
   include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      51 |         unsigned int                    __percpu *ref;
         |                                                  ^
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from sound/pci/rme9652/hdsp.c:10:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdsp.c:38:1: note: in expansion of macro 'module_param_array'
      38 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/rme9652/hdsp.c:34:12: warning: 'index' defined but not used [-Wunused-variable]
      34 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/sched.h:19,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/pnp.h:12,
                    from sound/drivers/mpu401/mpu401.c:9:
   include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      51 |         unsigned int                    __percpu *ref;
         |                                                  ^
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from sound/drivers/mpu401/mpu401.c:8:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/mpu401/mpu401.c:31:1: note: in expansion of macro 'module_param_array'
      31 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/drivers/mpu401/mpu401.c:21:12: warning: 'index' defined but not used [-Wunused-variable]
      21 | static int index[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = -2}; /* exclude the first card */
         |            ^~~~~


vim +/index +49 sound/drivers/dummy.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  48  
^1da177e4c3f41 Linus Torvalds  2005-04-16 @49  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
^1da177e4c3f41 Linus Torvalds  2005-04-16  50  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
a67ff6a54095e2 Rusty Russell   2011-12-15  51  static bool enable[SNDRV_CARDS] = {1, [1 ... (SNDRV_CARDS - 1)] = 0};
d5e1ca05f758fe Jaroslav Kysela 2010-02-02  52  static char *model[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = NULL};
^1da177e4c3f41 Linus Torvalds  2005-04-16  53  static int pcm_devs[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1};
^1da177e4c3f41 Linus Torvalds  2005-04-16  54  static int pcm_substreams[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 8};
^1da177e4c3f41 Linus Torvalds  2005-04-16  55  //static int midi_devs[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
446bc11f861444 YJ Lee          2022-09-12  56  static int mixer_volume_level_min = USE_MIXER_VOLUME_LEVEL_MIN;
446bc11f861444 YJ Lee          2022-09-12  57  static int mixer_volume_level_max = USE_MIXER_VOLUME_LEVEL_MAX;
c631d03c6873b9 Takashi Iwai    2009-09-03  58  #ifdef CONFIG_HIGH_RES_TIMERS
a67ff6a54095e2 Rusty Russell   2011-12-15  59  static bool hrtimer = 1;
c631d03c6873b9 Takashi Iwai    2009-09-03  60  #endif
a67ff6a54095e2 Rusty Russell   2011-12-15  61  static bool fake_buffer = 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  62  

:::::: The code at line 49 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
