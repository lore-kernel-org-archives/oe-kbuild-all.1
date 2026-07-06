Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D594281503
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313019; cv=none; b=HmLlVJNulTRsbW/6Q2r155l7jGpeHaG829DwXbk+ZUDBn7ayZWC/a8yM1UlTRvbPb7/Q82sRFEaynNeXfCxExnQhCKCmUvqFFlW8xqiU7fRWKNHp72AxKzdfHMukF6Qp3Ia0djLuhCaOu94K9C9iI5AAd/toXrMNrvsEEgdjITE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313019; c=relaxed/simple;
	bh=HgHYoNDlbnWEaF4f4Yn/diqEhuvg9vsHpkaRNcF/05I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ByEs/eduyOg+DDWcjeqkxkzDr1VqgqjtgUMqfiDORGQDahgtJ4eJt2P07aj12saExlavynF4zLahWPN36R7C5rDPWLjhYmJCmkYAaloKAjJQzll2wb9tSCzoLAlFd7FpCzwPP5XjHa8SnDXKx7rgoLs1oTsmRcvvk/McvwwB8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSmJSHKl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSmJSHKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783313018; x=1814849018;
  h=date:from:to:cc:subject:message-id;
  bh=HgHYoNDlbnWEaF4f4Yn/diqEhuvg9vsHpkaRNcF/05I=;
  b=VSmJSHKlebPSMFNOAjB+kNmxVeO5lh9G5tGbGRZFeYJL2+jFMy1a/DVR
   M5g1CVF1Lfpax9bbgAsvi7479Ugz6Vjc4PvlFM6vEciTjMl/tqb0jju60
   zdZdGPrB57XmwpTsl1p5yOX1ljPu1JdEwtkR0eUz/xm29qbWNAM/1/ANL
   O9ISPtLNS8eVVACoLC2/Sa1rGmcjO2nWD2FCjQNLHfiTvggnrGdiha/5g
   iThHVu44rftlqm5DvcLB+7s7j4kB98hvQ3W0LJcxoWwptg/MMdMKsPLyi
   RODq/VuAkUM8WMpkq8Wuox8mqb7UbeiCrSdz8EQUxNT8zUlTf0ebFYRCk
   g==;
X-CSE-ConnectionGUID: rO6Oa/wPTQmQQBxfkIVJEA==
X-CSE-MsgGUID: K5xPnMQwR1ixhzBemqXBvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94298762"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94298762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 21:43:38 -0700
X-CSE-ConnectionGUID: 7SJp+OJUQ1SUI+TY/UO0Ug==
X-CSE-MsgGUID: /F5pV9t4SniidMev5mZHog==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2026 21:43:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgbB7-00000000E5L-2ji8;
	Mon, 06 Jul 2026 04:43:33 +0000
Date: Mon, 06 Jul 2026 12:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 8/24]
 include/linux/device/trust.h:35:61: error: invalid use of undefined type
 'struct module'
Message-ID: <202607061212.9ssmRi2I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: 2a323f22915efbb3253657c0b11a0b81b5d582ef [8/24] device core: Initial device trust infrastructure
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260706/202607061212.9ssmRi2I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061212.9ssmRi2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061212.9ssmRi2I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/device/trust.h: In function 'module_driver_trust':
>> include/linux/device/trust.h:35:61: error: invalid use of undefined type 'struct module'
      35 |         pr_warn("module: %s: trust= support disabled\n", mod->name);
         |                                                             ^~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/device/trust.h:35:9: note: in expansion of macro 'pr_warn'
      35 |         pr_warn("module: %s: trust= support disabled\n", mod->name);
         |         ^~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +35 include/linux/device/trust.h

    28	
    29	#ifdef CONFIG_DEVICE_TRUST
    30	void module_driver_trust(struct module *mod, const char *val);
    31	void module_driver_trust_init(struct module *mod, bool distrust);
    32	#else
    33	static inline void module_driver_trust(struct module *mod, const char *val)
    34	{
  > 35		pr_warn("module: %s: trust= support disabled\n", mod->name);
    36	}
    37	static inline void module_driver_trust_init(struct module *mod, bool distrust)
    38	{
    39	}
    40	#endif
    41	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
