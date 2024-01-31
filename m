Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CE3B189
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 19:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706730059; cv=none; b=gQyGVblVATppNi8+fp2xE7B1JRz5n7K8IGdvgfJsNREVEqKcBQGpOriMyBBG5GR2ZNxaYSm8mQsltTuNWVo384XI8z58wtA57cdchwjeSXAQcM+ausYlPbB8o91DiuwAKkvAD2VT6o0OrzGnssVABd6pKgHqOttEGx3jU8WqDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706730059; c=relaxed/simple;
	bh=fO4z0O2vueMdyuPDmFxeDxmx+eg+kB/pP8bJLp20BX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mYwaap405O55APjaSs/SvKnXSRx6wJ5mbw7eI/WUZ9EVIffxY+9KQ+eGwtGV40NZR9wzeChVK9pawjx6j7c7+WWKTt6k45NwI25l4przmzbiNC0Kcvawbbrwdgi+KLRTJvEF6hNKYE8kAgNLeocZJM4uoXIeohhGFyD+VDWuTe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAFRu6e/; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAFRu6e/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706730056; x=1738266056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fO4z0O2vueMdyuPDmFxeDxmx+eg+kB/pP8bJLp20BX0=;
  b=hAFRu6e/PQ6fYEjRmVoaTm+sDTCByo8/eOvM02vgS9NfaI8d8OKm0Hbl
   X9gFNMPJguART85b5iPlI9DFggaVxuFTNqgY8yukMc82AX41RknaPgir3
   KrA4gro7akOQq93hvQA1St+vuDuUGl5nQmkiMlu8IF3tYHIY/xrAlroRt
   Zkl57XxopwPnWYDvsFSpQFNNchNUDG+zy08nGglKQuFmQVr2rXVIpKZEm
   ogzIhnKfaKSol6yCO64EihKHf0Odnvjy3m/0686f8zQDKoJNjT1R4msdH
   bAPeMb7huc/NrDOJnDw0+u8KjI/Re5s+S+EmC63XQtVMlxkl2G7gkjbx7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434876039"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="434876039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 11:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="30623772"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2024 11:40:48 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVGRy-0001wE-1t;
	Wed, 31 Jan 2024 19:40:46 +0000
Date: Thu, 1 Feb 2024 03:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Subject: [kees:devel/hardening/v6.8/2-arg-strscpy 1/2]
 sound/isa/azt2320.c:39:12: warning: 'index' defined but not used
Message-ID: <202402010305.gRiisMZA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/hardening/v6.8/2-arg-strscpy
head:   52fcd0404512a41ebc6f406977ac04ffd86349fc
commit: 8f94a332197dea2f8461b136697955624250671b [1/2] string: Allow 2-argument strscpy()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240201/202402010305.gRiisMZA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010305.gRiisMZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010305.gRiisMZA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/alpha/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from sound/isa/azt2320.c:20:
   include/sound/control.h: In function 'snd_ctl_find_id_mixer':
   include/linux/string.h:105:9: error: implicit declaration of function 'CONCATENATE' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: error: '__strscpy' undeclared (first use in this function); did you mean 'strscpy'?
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: note: each undeclared identifier is reported only once for each function it appears in
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:32: error: implicit declaration of function 'COUNT_ARGS' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/io.h:10:
   sound/isa/azt2320.c: At top level:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/azt2320.c:51:1: note: in expansion of macro 'module_param_array'
      51 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/azt2320.c:39:12: warning: 'index' defined but not used [-Wunused-variable]
      39 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/sched.h:16,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/isa.h:9,
                    from sound/isa/cmi8328.c:13:
   include/linux/gameport.h: In function 'gameport_set_name':
   include/linux/string.h:105:9: error: implicit declaration of function 'CONCATENATE' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/gameport.h:112:9: note: in expansion of macro 'strscpy'
     112 |         strscpy(gameport->name, name, sizeof(gameport->name));
         |         ^~~~~~~
   include/linux/string.h:105:21: error: '__strscpy' undeclared (first use in this function); did you mean 'strscpy'?
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/linux/gameport.h:112:9: note: in expansion of macro 'strscpy'
     112 |         strscpy(gameport->name, name, sizeof(gameport->name));
         |         ^~~~~~~
   include/linux/string.h:105:21: note: each undeclared identifier is reported only once for each function it appears in
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/linux/gameport.h:112:9: note: in expansion of macro 'strscpy'
     112 |         strscpy(gameport->name, name, sizeof(gameport->name));
         |         ^~~~~~~
   include/linux/string.h:105:32: error: implicit declaration of function 'COUNT_ARGS' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^~~~~~~~~~
   include/linux/gameport.h:112:9: note: in expansion of macro 'strscpy'
     112 |         strscpy(gameport->name, name, sizeof(gameport->name));
         |         ^~~~~~~
   include/sound/control.h: In function 'snd_ctl_find_id_mixer':
   include/linux/string.h:105:21: error: '__strscpy' undeclared (first use in this function); did you mean 'strscpy'?
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/isa/cmi8328.c:12:
   sound/isa/cmi8328.c: At top level:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/cmi8328.c:50:1: note: in expansion of macro 'module_param_array'
      50 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/cmi8328.c:38:12: warning: 'index' defined but not used [-Wunused-variable]
      38 | static int index[CMI8328_MAX] =     {[0 ... (CMI8328_MAX-1)] = -1};
         |            ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/sched.h:16,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/isa.h:9,
                    from sound/isa/es18xx.c:67:
   include/sound/control.h: In function 'snd_ctl_find_id_mixer':
   include/linux/string.h:105:9: error: implicit declaration of function 'CONCATENATE' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: error: '__strscpy' undeclared (first use in this function); did you mean 'strscpy'?
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: note: each undeclared identifier is reported only once for each function it appears in
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:32: error: implicit declaration of function 'COUNT_ARGS' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/isa/es18xx.c:65:
   sound/isa/es18xx.c: At top level:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/es18xx.c:1917:1: note: in expansion of macro 'module_param_array'
    1917 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/isa/es18xx.c: In function 'snd_es18xx_card_new':
>> sound/isa/es18xx.c:2048:1: warning: control reaches end of non-void function [-Wreturn-type]
    2048 | }
         | ^
   sound/isa/es18xx.c: At top level:
>> sound/isa/es18xx.c:1900:12: warning: 'index' defined but not used [-Wunused-variable]
    1900 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/sched.h:16,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/isa.h:9,
                    from sound/isa/opl3sa2.c:9:
   include/sound/control.h: In function 'snd_ctl_find_id_mixer':
   include/linux/string.h:105:9: error: implicit declaration of function 'CONCATENATE' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: error: '__strscpy' undeclared (first use in this function); did you mean 'strscpy'?
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: note: each undeclared identifier is reported only once for each function it appears in
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:32: error: implicit declaration of function 'COUNT_ARGS' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   In file included from include/linux/init.h:5,
                    from sound/isa/opl3sa2.c:7:
   sound/isa/opl3sa2.c: At top level:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/opl3sa2.c:42:1: note: in expansion of macro 'module_param_array'
      42 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/opl3sa2.c:26:12: warning: 'index' defined but not used [-Wunused-variable]
      26 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from sound/isa/sc6000.c:15:
   include/sound/control.h: In function 'snd_ctl_find_id_mixer':
   include/linux/string.h:105:9: error: implicit declaration of function 'CONCATENATE' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: error: '__strscpy' undeclared (first use in this function); did you mean 'strscpy'?
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:21: note: each undeclared identifier is reported only once for each function it appears in
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   include/linux/string.h:105:32: error: implicit declaration of function 'COUNT_ARGS' [-Werror=implicit-function-declaration]
     105 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^~~~~~~~~~
   include/sound/control.h:166:9: note: in expansion of macro 'strscpy'
     166 |         strscpy(id.name, name, sizeof(id.name));
         |         ^~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   sound/isa/sc6000.c: At top level:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/sc6000.c:45:1: note: in expansion of macro 'module_param_array'
      45 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/sc6000.c:33:12: warning: 'index' defined but not used [-Wunused-variable]
      33 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
   cc1: some warnings being treated as errors
..


vim +/index +39 sound/isa/azt2320.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  38  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @39  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
a67ff6a54095e2 Rusty Russell  2011-12-15  41  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_ISAPNP; /* Enable this card */
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  static long port[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;	/* PnP setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  static long wss_port[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;	/* PnP setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  static long mpu_port[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;	/* PnP setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  static long fm_port[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;	/* PnP setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  46  static int irq[SNDRV_CARDS] = SNDRV_DEFAULT_IRQ;	/* Pnp setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  47  static int mpu_irq[SNDRV_CARDS] = SNDRV_DEFAULT_IRQ;	/* Pnp setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  48  static int dma1[SNDRV_CARDS] = SNDRV_DEFAULT_DMA;	/* PnP setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  49  static int dma2[SNDRV_CARDS] = SNDRV_DEFAULT_DMA;	/* PnP setup */
^1da177e4c3f41 Linus Torvalds 2005-04-16  50  

:::::: The code at line 39 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
