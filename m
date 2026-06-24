Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EAF3002C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331492; cv=none; b=Hx6QZqOiP7g1NlfvpnWlJSq/eOatKySYhO9+t26fbY6fdHL8rcH5wWYgCF2/6fJ8EMZnk+VlAuxH/eTmMpW2ZJ6RWQACriyi44zUj3E8P9icYbadGLHPthhIciNt7Yk6eKVnYUmX94O/Ek3ShkkyUHiCbJzUwfYoNVq6BzqS8uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331492; c=relaxed/simple;
	bh=aw55O279xxk+qEe7GBp+QHNC3ZtnsHWF4Px8u2sbgQM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E8jN363Dg8efQRs/BMwHVUR1UznmAK8GqkS2luQl6UDxooRkXpb3j6PI2ykJ/Un2XwwbVX6KXaiArznq2LKJj06sgLtYAm3k9MybWBePjOSyVsuRYo0olkNQUy3oytf2M2Co9aVmglOLs8s0rFlOXt1ETJR86qinIMJM3BJ8hEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R06ulrbz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R06ulrbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782331490; x=1813867490;
  h=date:from:to:cc:subject:message-id;
  bh=aw55O279xxk+qEe7GBp+QHNC3ZtnsHWF4Px8u2sbgQM=;
  b=R06ulrbzpGtKH2ulgO2VN3n1plhHweW/Yv8TUVn80Dv5a8ZUv8GIDSHg
   41xEXAy/yhRHUXaDJmdXLqhGaYOxNMUz5Lu8YeY2KPXoSr06+yseTXeSL
   NKI17q6f07siIYOmyY5leTCARVrbrJIHdK7go1MgoRI1OZq+kJJm6smmr
   fprnfdypZMGqIQ1nuFDdrF/m/wkcqY4hPCv7TXSsnjlqLLs6qe3Qa7NTA
   1BspxUOWiwSp6sqKSzDrcYjedE+6a6dXGGmKsHN2QSlLdzuDMoShyw2Ae
   +A3MMg7vQbf6/2DY8KwjTIkoJPNga7Whypbotsm0Ht2++7kUIp740xyKl
   g==;
X-CSE-ConnectionGUID: 3g9QzH/5QRW1E4oXvg1f0Q==
X-CSE-MsgGUID: udTNsmOJSRGqTDN+4ZGCmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94222862"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="94222862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 13:04:50 -0700
X-CSE-ConnectionGUID: taV+GpSVSBy4ZqH7d3YH1A==
X-CSE-MsgGUID: wX4h8SFRRa6EVYUzNz1W4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="254361166"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Jun 2026 13:04:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcTq1-000000003eZ-22ug;
	Wed, 24 Jun 2026 20:04:45 +0000
Date: Thu, 25 Jun 2026 04:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/hda/controllers/intel.c:104:12: warning: 'index'
 defined but not used
Message-ID: <202606250420.GOprgLwR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Takashi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0e6f20cb52b14c2c441f04e21cef0c95d498cac
commit: 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f ALSA: hda: Move controller drivers into sound/hda/controllers directory
date:   12 months ago
config: loongarch-randconfig-001-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250420.GOprgLwR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250420.GOprgLwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/controllers directory")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250420.GOprgLwR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2209,
                    from include/linux/delay.h:13,
                    from sound/hda/controllers/intel.c:23:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12:
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/hda/controllers/intel.c:125:1: note: in expansion of macro 'module_param_array'
     125 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/hda/controllers/intel.c:104:12: warning: 'index' defined but not used [-Wunused-variable]
     104 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/index +104 sound/hda/controllers/intel.c

33124929a23c5b sound/pci/hda/hda_intel.c Takashi Iwai      2014-06-26  102  
^1da177e4c3f41 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  103  
5aba4f8ec72b2b sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07 @104  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
5aba4f8ec72b2b sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  105  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
a67ff6a54095e2 sound/pci/hda/hda_intel.c Rusty Russell     2011-12-15  106  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
5aba4f8ec72b2b sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  107  static char *model[SNDRV_CARDS];
1dac6695c683c6 sound/pci/hda/hda_intel.c Takashi Iwai      2012-09-13  108  static int position_fix[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5c0d7bc103dd1a sound/pci/hda/hda_intel.c Takashi Iwai      2008-06-10  109  static int bdl_pos_adj[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5aba4f8ec72b2b sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  110  static int probe_mask[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
d4d9cd0338892e sound/pci/hda/hda_intel.c Takashi Iwai      2008-12-19  111  static int probe_only[SNDRV_CARDS];
26a6cb6cca225f sound/pci/hda/hda_intel.c David Henningsson 2012-10-09  112  static int jackpoll_ms[SNDRV_CARDS];
41438f1314b0f6 sound/pci/hda/hda_intel.c Takashi Iwai      2017-01-12  113  static int single_cmd = -1;
71623855e20c3f sound/pci/hda/hda_intel.c Takashi Iwai      2009-09-28  114  static int enable_msi = -1;
4ea6fbc8eb23c3 sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  115  #ifdef CONFIG_SND_HDA_PATCH_LOADER
4ea6fbc8eb23c3 sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  116  static char *patch[SNDRV_CARDS];
4ea6fbc8eb23c3 sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  117  #endif
2dca0bba70ce3c sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  118  #ifdef CONFIG_SND_HDA_INPUT_BEEP
0920c9b4c4d896 sound/pci/hda/hda_intel.c Takashi Iwai      2012-07-03  119  static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
2dca0bba70ce3c sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  120  					CONFIG_SND_HDA_INPUT_BEEP_MODE};
2dca0bba70ce3c sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  121  #endif
7fba6aea4472f0 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  122  static bool dmic_detect = 1;
d045bceff5a904 sound/pci/hda/hda_intel.c Jaroslav Kysela   2023-02-02  123  static bool ctl_dev_id = IS_ENABLED(CONFIG_SND_HDA_CTL_DEV_ID) ? 1 : 0;
^1da177e4c3f41 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  124  

:::::: The code at line 104 was first introduced by commit
:::::: 5aba4f8ec72b2b880c694b5ce58e67be508f7b7a [ALSA] hda-intel - Support multiple devices

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
