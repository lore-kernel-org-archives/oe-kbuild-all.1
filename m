Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED02D662D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766086291; cv=none; b=C3ylIqxG63J1YqmIo8tLlFKkYXCZOtunTKDENDDuV3JhZwvr8IEAvjjVvnC3738N0/GhRgBOJ5ai+gDR0mPk5ezK6Fe8HXcWpIvVD01so8sumTJLXwH1J0UH3u8uvVFRLDaacne6jgIg4CmHI3+owTBkeAFvsRht1YNzH6byZn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766086291; c=relaxed/simple;
	bh=U/t1yRH96GsCwc5jD19PLbIZznL24DQ8LxdBbIHNlZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uyNcsA2vTqvQ0jBVx7wBWNPgpu/tirdcZAUGZlwY9qeldmFJnMiIuMIj8jWl9+fcjp9ak1By1sqqptD/M2Kqn7rijJyPvlQ0oV0s0QOfViLHGMnvjiOLhAUW9h7axO4B2RaVplwtI00VBVZincqKm42z1evkgsh9m81dwkCQXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP7UNsri; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP7UNsri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766086289; x=1797622289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/t1yRH96GsCwc5jD19PLbIZznL24DQ8LxdBbIHNlZk=;
  b=UP7UNsricG9lWgac+US5/1reYhhHlFlaRwNB1qJjCNJmGyfKgvSqkB6L
   BGpiRy5Gyv8GdrxEy+1VAdTf61BN3vVMOcLKoNhR0tdzen8ksD/R8lkC1
   qkxR9xCG73huISSynZxPjT8lVk+3kr8qdJGRtvZUW0jrCROWCIwlnT2PB
   GbvGw5cnLw3GfygwRitSUU4rTf8To/uQ0yvDUA1a/xq/NKPwcP17t3QbY
   HP0x1glZWZwTA/sjTpPRck5jISoUuPmbLs8ZsH+pmDgRyp3FKObxrVdHq
   mlNBAPRyVVB2wJef24UiAAt3XqG0bsENGHBFb88lRePxJQLr436DWQzQc
   Q==;
X-CSE-ConnectionGUID: VxMMkiH1QZCujVz/3vzJdQ==
X-CSE-MsgGUID: uD2KGWr9SWawHSMEDCEQog==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55629264"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="55629264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:31:25 -0800
X-CSE-ConnectionGUID: qUB8YVEIQ9OIOmD+pJ5wXg==
X-CSE-MsgGUID: fqhM5AqYQJ2hWCYe0Icw+Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 11:31:24 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWJib-000000002VN-3IUH;
	Thu, 18 Dec 2025 19:31:21 +0000
Date: Fri, 19 Dec 2025 03:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/hda/controllers/intel.c:104:12: warning: 'index' defined but
 not used
Message-ID: <202512190303.B3AB6DY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f ALSA: hda: Move controller drivers into sound/hda/controllers directory
date:   5 months ago
config: loongarch-randconfig-r064-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190303.B3AB6DY4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190303.B3AB6DY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190303.B3AB6DY4-lkp@intel.com/

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

33124929a23c5b5 sound/pci/hda/hda_intel.c Takashi Iwai      2014-06-26  102  
^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  103  
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07 @104  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  105  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
a67ff6a54095e27 sound/pci/hda/hda_intel.c Rusty Russell     2011-12-15  106  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  107  static char *model[SNDRV_CARDS];
1dac6695c683c66 sound/pci/hda/hda_intel.c Takashi Iwai      2012-09-13  108  static int position_fix[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5c0d7bc103dd1ae sound/pci/hda/hda_intel.c Takashi Iwai      2008-06-10  109  static int bdl_pos_adj[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  110  static int probe_mask[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
d4d9cd0338892e7 sound/pci/hda/hda_intel.c Takashi Iwai      2008-12-19  111  static int probe_only[SNDRV_CARDS];
26a6cb6cca225f6 sound/pci/hda/hda_intel.c David Henningsson 2012-10-09  112  static int jackpoll_ms[SNDRV_CARDS];
41438f1314b0f6f sound/pci/hda/hda_intel.c Takashi Iwai      2017-01-12  113  static int single_cmd = -1;
71623855e20c3fe sound/pci/hda/hda_intel.c Takashi Iwai      2009-09-28  114  static int enable_msi = -1;
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  115  #ifdef CONFIG_SND_HDA_PATCH_LOADER
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  116  static char *patch[SNDRV_CARDS];
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  117  #endif
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  118  #ifdef CONFIG_SND_HDA_INPUT_BEEP
0920c9b4c4d8960 sound/pci/hda/hda_intel.c Takashi Iwai      2012-07-03  119  static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  120  					CONFIG_SND_HDA_INPUT_BEEP_MODE};
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  121  #endif
7fba6aea4472f01 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  122  static bool dmic_detect = 1;
d045bceff5a904b sound/pci/hda/hda_intel.c Jaroslav Kysela   2023-02-02  123  static bool ctl_dev_id = IS_ENABLED(CONFIG_SND_HDA_CTL_DEV_ID) ? 1 : 0;
^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  124  
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07 @125  module_param_array(index, int, NULL, 0444);
^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  126  MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  127  module_param_array(id, charp, NULL, 0444);
^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  128  MODULE_PARM_DESC(id, "ID string for Intel HD audio interface.");
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  129  module_param_array(enable, bool, NULL, 0444);
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  130  MODULE_PARM_DESC(enable, "Enable Intel HD audio interface.");
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  131  module_param_array(model, charp, NULL, 0444);
^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  132  MODULE_PARM_DESC(model, "Use the given board model.");
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  133  module_param_array(position_fix, int, NULL, 0444);
4cb36310848fd17 sound/pci/hda/hda_intel.c David Henningsson 2010-09-30  134  MODULE_PARM_DESC(position_fix, "DMA pointer read method."
c02f77d32d2c45c sound/pci/hda/hda_intel.c Takashi Iwai      2019-08-06  135  		 "(-1 = system default, 0 = auto, 1 = LPIB, 2 = POSBUF, 3 = VIACOMBO, 4 = COMBO, 5 = SKL+, 6 = FIFO).");
555e219ffaeecbd sound/pci/hda/hda_intel.c Takashi Iwai      2008-06-10  136  module_param_array(bdl_pos_adj, int, NULL, 0644);
555e219ffaeecbd sound/pci/hda/hda_intel.c Takashi Iwai      2008-06-10  137  MODULE_PARM_DESC(bdl_pos_adj, "BDL position adjustment offset.");
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  138  module_param_array(probe_mask, int, NULL, 0444);
606ad75fb5372c0 sound/pci/hda/hda_intel.c Takashi Iwai      2005-11-24  139  MODULE_PARM_DESC(probe_mask, "Bitmask to probe codecs (default = -1).");
079e683ebd88265 sound/pci/hda/hda_intel.c Jaroslav Kysela   2010-03-26  140  module_param_array(probe_only, int, NULL, 0444);
d4d9cd0338892e7 sound/pci/hda/hda_intel.c Takashi Iwai      2008-12-19  141  MODULE_PARM_DESC(probe_only, "Only probing and no codec initialization.");
26a6cb6cca225f6 sound/pci/hda/hda_intel.c David Henningsson 2012-10-09  142  module_param_array(jackpoll_ms, int, NULL, 0444);
26a6cb6cca225f6 sound/pci/hda/hda_intel.c David Henningsson 2012-10-09  143  MODULE_PARM_DESC(jackpoll_ms, "Ms between polling for jack events (default = 0, using unsol events only)");
41438f1314b0f6f sound/pci/hda/hda_intel.c Takashi Iwai      2017-01-12  144  module_param(single_cmd, bint, 0444);
d01ce99fc53271c sound/pci/hda/hda_intel.c Takashi Iwai      2007-07-27  145  MODULE_PARM_DESC(single_cmd, "Use single command to communicate with codecs "
d01ce99fc53271c sound/pci/hda/hda_intel.c Takashi Iwai      2007-07-27  146  		 "(for debugging only).");
ac9ef6cf9196107 sound/pci/hda/hda_intel.c Takashi Iwai      2012-01-20  147  module_param(enable_msi, bint, 0444);
134a11f0c37c043 sound/pci/hda/hda_intel.c Takashi Iwai      2006-11-10  148  MODULE_PARM_DESC(enable_msi, "Enable Message Signaled Interrupt (MSI)");
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  149  #ifdef CONFIG_SND_HDA_PATCH_LOADER
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  150  module_param_array(patch, charp, NULL, 0444);
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  151  MODULE_PARM_DESC(patch, "Patch file for Intel HD audio interface.");
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  152  #endif
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  153  #ifdef CONFIG_SND_HDA_INPUT_BEEP
0920c9b4c4d8960 sound/pci/hda/hda_intel.c Takashi Iwai      2012-07-03  154  module_param_array(beep_mode, bool, NULL, 0444);
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  155  MODULE_PARM_DESC(beep_mode, "Select HDA Beep registration mode "
0920c9b4c4d8960 sound/pci/hda/hda_intel.c Takashi Iwai      2012-07-03  156  			    "(0=off, 1=on) (default=1).");
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  157  #endif
7fba6aea4472f01 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  158  module_param(dmic_detect, bool, 0444);
7fba6aea4472f01 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  159  MODULE_PARM_DESC(dmic_detect, "Allow DSP driver selection (bypass this driver) "
7fba6aea4472f01 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  160  			     "(0=off, 1=on) (default=1); "
7fba6aea4472f01 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  161  		 "deprecated, use snd-intel-dspcfg.dsp_driver option instead");
d045bceff5a904b sound/pci/hda/hda_intel.c Jaroslav Kysela   2023-02-02  162  module_param(ctl_dev_id, bool, 0444);
d045bceff5a904b sound/pci/hda/hda_intel.c Jaroslav Kysela   2023-02-02  163  MODULE_PARM_DESC(ctl_dev_id, "Use control device identifier (based on codec address).");
606ad75fb5372c0 sound/pci/hda/hda_intel.c Takashi Iwai      2005-11-24  164  

:::::: The code at line 104 was first introduced by commit
:::::: 5aba4f8ec72b2b880c694b5ce58e67be508f7b7a [ALSA] hda-intel - Support multiple devices

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
