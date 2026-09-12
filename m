Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A4D455162
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789211122; cv=none; b=OigeJgoSSH5+OTUeRfLFPL2L/vHo8zH/wPLrGK+woX1WG0LTjyHDBw4t59rkrkEtElPkEgc2/Sl+si/mMnV8tjxxD386zdA8sldQdHMy0zmPtFxflpk2g7JdnRkzEjq1y1bg+/9wXUYRRPHFTQBOhZriQAmd7OowyKdjy03+7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789211122; c=relaxed/simple;
	bh=Z2cueWYTiyHKLkP2vvbSOjG5jZXXFjzxKH593XYqPsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g7C1ywJABzxmiv86ONspC99RzL0YSLiJJWryyyQi/+XXgyraOMXK9C0K50IjA6qrBijxb7NHKEmcAUOG6ioQe54hjrhfql94JSjhx38H4/8iwMu8J23QMuZVOlAs7l+C9VhPr672SRyAc9AOHZ3ugLdpTAru7Y+2x6kFFt9rqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViwyuMT8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViwyuMT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789211120; x=1820747120;
  h=date:from:to:cc:subject:message-id;
  bh=Z2cueWYTiyHKLkP2vvbSOjG5jZXXFjzxKH593XYqPsE=;
  b=ViwyuMT8hJ2NJ5n9NcPTPUOqgJUGfoSUS5h/x8rEZ5s0H0/GwJnXpxBW
   qIe2P1uMnNebMAcVAEI8M+ZhDPdgTNvkfciw3FNW4zJyG6Xk5UF+7I+RW
   KMaWaAkBd0blCVA892+2vpND5XjKI4LqkArCw13EdZyk9YsRYEkF6pseT
   CaIAAA8gfXukeoBE+k13q1FXbOEMeUX3++iQV4T/i/nv7HCXSIEZ0dDqy
   bolHn0ecgcSKuKjdGrGf3crDZcimSs5RDp4MmnFHLKVhk8i7m/7hNowcq
   5pwvCT3k+wc7x8N/d4AR2rluazVcvBsQyXynDeIBwVFrr3DWW0QwOKY4R
   Q==;
X-CSE-ConnectionGUID: 0T9QHzJCS9KB/o6+UN4LCQ==
X-CSE-MsgGUID: F2TvGhc+TseoM5RKfrvgng==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89782012"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89782012"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:05:20 -0700
X-CSE-ConnectionGUID: v4yoPOGZTN+q822SS0DzKg==
X-CSE-MsgGUID: nq1s9PvqRbS2tiaHoaDAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="552035"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 12 Sep 2026 04:05:19 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5LXn-0000000014B-48nk;
	Sat, 12 Sep 2026 11:05:15 +0000
Date: Sat, 12 Sep 2026 13:04:45 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 8/10]
 drivers/char/tpm/tpm_infineon.c:615:61: error: 'tpm_inf_resume' undeclared
 here (not in a function); did you mean 'tpm_pm_resume'?
Message-ID: <202609121207.tM2OfBmR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   b5f1b25b21f56c9fff87ad0235791883d1bf01a9
commit: 2249200ee4202c7596b612360e0e201a5fef0064 [8/10] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()
config: arc-randconfig-r072-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121207.tM2OfBmR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121207.tM2OfBmR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121207.tM2OfBmR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/sched.h:38,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/pnp.h:12,
                    from drivers/char/tpm/tpm_infineon.c:15:
>> drivers/char/tpm/tpm_infineon.c:615:61: error: 'tpm_inf_resume' undeclared here (not in a function); did you mean 'tpm_pm_resume'?
     615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
         |                                                             ^~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_infineon.c:615:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/char/tpm/tpm_tis_i2c.c:13:
>> drivers/char/tpm/tpm_tis_i2c.c:322:61: error: 'tpm_tis_resume' undeclared here (not in a function); did you mean 'tpm_tis_remove'?
     322 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |                                                             ^~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_i2c.c:322:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     322 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/char/tpm/tpm_tis.c:19:
>> drivers/char/tpm/tpm_tis.c:249:61: error: 'tpm_tis_resume' undeclared here (not in a function); did you mean 'tpm_tis_remove'?
     249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |                                                             ^~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis.c:249:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +615 drivers/char/tpm/tpm_infineon.c

   596	
   597	#ifdef CONFIG_PM_SLEEP
   598	static int tpm_inf_resume(struct device *dev)
   599	{
   600		/* Re-configure TPM after suspending */
   601		tpm_config_out(ENABLE_REGISTER_PAIR, TPM_INF_ADDR);
   602		tpm_config_out(IOLIMH, TPM_INF_ADDR);
   603		tpm_config_out((tpm_dev.data_regs >> 8) & 0xff, TPM_INF_DATA);
   604		tpm_config_out(IOLIML, TPM_INF_ADDR);
   605		tpm_config_out((tpm_dev.data_regs & 0xff), TPM_INF_DATA);
   606		/* activate register */
   607		tpm_config_out(TPM_DAR, TPM_INF_ADDR);
   608		tpm_config_out(0x01, TPM_INF_DATA);
   609		tpm_config_out(DISABLE_REGISTER_PAIR, TPM_INF_ADDR);
   610		/* disable RESET, LP and IRQC */
   611		tpm_data_out(RESET_LP_IRQC_DISABLE, CMD);
   612		return tpm_pm_resume(dev);
   613	}
   614	#endif
 > 615	static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
   616	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
