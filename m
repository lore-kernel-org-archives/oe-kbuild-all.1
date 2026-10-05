Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C945D931
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193471; cv=none; b=KZp3nb5pxQnsIx16PPbD4s5AvVVXV7FC4/YLbZIr/9P+IIQbWN5kFR+9f9UDWiRd3pjvmebAiDAB2em0hdM2ybR1smNAFYT9PEZlN5/GVPlbGva/I/dWTrjO0sRw0Y3Z3ZfJx0aGCK9r/48RdBFLfdoqsdUhiB/pk10lRPvMq+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193471; c=relaxed/simple;
	bh=K/p5cKo+q00s0bQBcxKp/KESk5w3eFsXQwqTQ99lxmA=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6VT/TXTmnvQ9kC04WBR5qIIGrl3N0pokUlfDj5pDNEiIqXwtrtDqRXgCMpDoqmDQ+j/sQXnYcrPRH3biKyELpNOriAwWXo93rjSr9luuO8OhYWxLeLFShWsd1CK+BoEET6QsPX8H0deYmH7cbqMibe2NtluvWQhSc5HgSMCAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oic+/MX6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oic+/MX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791193465; x=1822729465;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=K/p5cKo+q00s0bQBcxKp/KESk5w3eFsXQwqTQ99lxmA=;
  b=Oic+/MX6UO9rs7JRrm1O1uhVxgvMZFWN4Xgf1x/2B0PybMzs+D5vXoq5
   3G6fD82trDztq995SB6ohaj514g/mgVVJSKUyRnA8u+Nh9NEGC8QeNkq7
   /6yFNQiyU9OblpbGv2riJymVLHgjNvnU0fTL+IxbWoPm3Z/i19HYwYnWa
   uwm+xcJ3K1icvWpaJuwLGWUOfFagfbn7TxYIoqVKJxVN9BqhsnOc8zdcy
   83VsH842THPaJ/wKmEuAKqSGasGOCQa+e4PUxaTkqp8RLrXRwDOH4S5lt
   5w7mECKYOcZn1dOP/RR9zEqm/mhEp7rMtx/DRnrrp7y8I/CDQkIOyE7zJ
   w==;
X-CSE-ConnectionGUID: FSiORwU2QUuKmILPGKgKng==
X-CSE-MsgGUID: niE/m8VXTMqZGz/IBrMHWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91884089"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91884089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 02:44:16 -0700
X-CSE-ConnectionGUID: ZnxRK6tDRGC+wttKXms9Hg==
X-CSE-MsgGUID: sxPdiyv7Ql22/0bUdPOQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="304726213"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2026 02:44:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDfEz-0000000004p-2sOf
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 09:44:13 +0000
Date: Mon, 5 Oct 2026 11:43:52 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: ACPI: Add stub for acpi_has_method() for !CONFIG_ACPI
Message-ID: <202610051145.MTPINzw1-lkp@intel.com>
References: <202610051145.MTPINzw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610051145.MTPINzw1-lkp@intel.com>

Hi Bowen,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Bowen-Yu/ACPI-Add-stub-for-acpi_has_method-for-CONFIG_ACPI/20260929-201347
base:   
patch link:    https://lore.kernel.org/r/202610051145.MTPINzw1-lkp%40intel.com
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261005/202610051145.MTPINzw1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051145.MTPINzw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051145.MTPINzw1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/hda/controllers/intel.c:38:
   include/linux/acpi.h:1033:20: error: redefinition of 'acpi_has_method'
    1033 | static inline bool acpi_has_method(acpi_handle handle, char *name)
         |                    ^~~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:28:
   include/acpi/acpi_bus.h:957:20: note: previous definition of 'acpi_has_method' with type 'bool(void *, char *)' {aka '_Bool(void *, char *)'}
     957 | static inline bool acpi_has_method(acpi_handle handle, char *name)
         |                    ^~~~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/parisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from sound/hda/controllers/intel.c:23:
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:544:20: note: in expansion of macro 'ARRAY_SIZE'
     544 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:528:9: note: in expansion of macro 'module_param_array_named'
     528 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/hda/controllers/intel.c:127:1: note: in expansion of macro 'module_param_array'
     127 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/hda/controllers/intel.c:106:12: warning: 'index' defined but not used [-Wunused-variable]
     106 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/index +106 sound/hda/controllers/intel.c

^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  105  
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07 @106  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  107  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
a67ff6a54095e27 sound/pci/hda/hda_intel.c Rusty Russell     2011-12-15  108  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  109  static char *model[SNDRV_CARDS];
1dac6695c683c66 sound/pci/hda/hda_intel.c Takashi Iwai      2012-09-13  110  static int position_fix[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5c0d7bc103dd1ae sound/pci/hda/hda_intel.c Takashi Iwai      2008-06-10  111  static int bdl_pos_adj[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
5aba4f8ec72b2b8 sound/pci/hda/hda_intel.c Takashi Iwai      2008-01-07  112  static int probe_mask[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = -1};
d4d9cd0338892e7 sound/pci/hda/hda_intel.c Takashi Iwai      2008-12-19  113  static int probe_only[SNDRV_CARDS];
26a6cb6cca225f6 sound/pci/hda/hda_intel.c David Henningsson 2012-10-09  114  static int jackpoll_ms[SNDRV_CARDS];
41438f1314b0f6f sound/pci/hda/hda_intel.c Takashi Iwai      2017-01-12  115  static int single_cmd = -1;
71623855e20c3fe sound/pci/hda/hda_intel.c Takashi Iwai      2009-09-28  116  static int enable_msi = -1;
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  117  #ifdef CONFIG_SND_HDA_PATCH_LOADER
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  118  static char *patch[SNDRV_CARDS];
4ea6fbc8eb23c3a sound/pci/hda/hda_intel.c Takashi Iwai      2009-06-17  119  #endif
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  120  #ifdef CONFIG_SND_HDA_INPUT_BEEP
0920c9b4c4d8960 sound/pci/hda/hda_intel.c Takashi Iwai      2012-07-03  121  static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  122  					CONFIG_SND_HDA_INPUT_BEEP_MODE};
2dca0bba70ce3c2 sound/pci/hda/hda_intel.c Jaroslav Kysela   2009-11-13  123  #endif
7fba6aea4472f01 sound/pci/hda/hda_intel.c Takashi Iwai      2020-01-09  124  static bool dmic_detect = 1;
d045bceff5a904b sound/pci/hda/hda_intel.c Jaroslav Kysela   2023-02-02  125  static bool ctl_dev_id = IS_ENABLED(CONFIG_SND_HDA_CTL_DEV_ID) ? 1 : 0;
^1da177e4c3f415 sound/pci/hda/hda_intel.c Linus Torvalds    2005-04-16  126  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
