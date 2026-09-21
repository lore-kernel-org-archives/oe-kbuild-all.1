Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB37494817
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Sep 2026 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996478; cv=none; b=UfmRicAN5E/Ald4LyYPz5q/ZCYLuO9c2BbNyL8O0I27B9upSy6fsqwaeG4AooZMy3l6KBdtc8RBZICqStYCJxNhlTxNg1GfkPDcxhvlf+uIRprMF9TAwwWUGlq2QIQFXjQkoSYZSc1+femaU08T2UiH9WbqpXs+YdOLtIrF8JjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996478; c=relaxed/simple;
	bh=kMbq7hxdE1RJj9pJEkCo6pVkuxRR3LYudbx0wgMaE4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PKu9vG61liHFUl0A7rqgnf0kVSco6XPTnL4A40MLEjUZipa7y6FZGYp2eich2n52yimA2TcAQSN+u+vdelp3tuOhbafU7Ew8kj8j52dv/ZBcfhWzgWAjERGj8R8KBQZ0itRufH2STycGgPFmeU5LuW0vO+5+qXG4ECpfAOXs/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGsYebDx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGsYebDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789996475; x=1821532475;
  h=date:from:to:cc:subject:message-id;
  bh=kMbq7hxdE1RJj9pJEkCo6pVkuxRR3LYudbx0wgMaE4c=;
  b=YGsYebDxSeNdpIu2v+jZ4QxaWXPXjPyd0zCVxkJ3uRZG1U/qWRrUjaH/
   RltzNSI2VtmDO+f2UPs1pDD44nc0wPq6Zq9QPlkcF500c1NcSmEUl24Cj
   kfjxzKaB2naQLS5JAaziLi/Ya3okzfx1V/uYd48iiUiu3/U5xKyg4R1jW
   287A/dEz6Juki10E7G8re/R7nYv3y2k6wdH4iLaS7j+6XWzf4JUf16Mwd
   7RZq5WyggQ1bWw/cY9KbuLZG9Pd+u80BvWvayEHAGpgE1aPtkwxMETPq7
   nor5WFOb25dcwyuuNovPRfT4CZ93HKgPyT/oV8B8PCZjYOSho4Q6lEl8n
   w==;
X-CSE-ConnectionGUID: URtIboz/RDORVjFiHphnQA==
X-CSE-MsgGUID: GgRT4v5pTgm2ZHUYJtZkBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90627273"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="90627273"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 06:14:35 -0700
X-CSE-ConnectionGUID: Gcqu3dM/RFiPv0/TT43J5A==
X-CSE-MsgGUID: p/OxicuyRDSljQBUokhT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="280679986"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Sep 2026 06:14:33 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8dql-0000000005L-0fKa;
	Mon, 21 Sep 2026 13:14:27 +0000
Date: Mon, 21 Sep 2026 15:13:31 +0200
From: kernel test robot <lkp@intel.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [linux-next:master 7478/8449]
 drivers/char/tpm/tpm_tis.c:249:61: error: 'tpm_tis_resume' undeclared here
 (not in a function); did you mean 'tpm_tis_remove'?
Message-ID: <202609211540.IJG9MjgJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: 69178fc202218a6da564f02dc5a2630dadbb7bf8 [7478/8449] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609211540.IJG9MjgJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/processor.h:25,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
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
--
   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/processor.h:25,
                    from include/linux/sched.h:13,
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


vim +249 drivers/char/tpm/tpm_tis.c

   248	
 > 249	static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
   250	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
