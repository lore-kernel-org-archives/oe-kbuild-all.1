Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66D04772B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213727; cv=none; b=dJxiTq+oWz2OryKhryqFNxe/TU6qRcfaGyW5qY+5Rd2TpmVMjmABATsLKD6LlGs8IQFQ1CcZj/8Gd3oSgbUKMm01py9ndLLlP+8jdfdGyacRrOjjoWFdmN5Rkaeloh5udi+AVQOoW0B+3hyYpZ7pNDPSn/DIv9iGPOKpK3HLhlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213727; c=relaxed/simple;
	bh=rozqtQOCcVb3+A/okIaRzPoQvSnGKMG2MYlezvB4+Gc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GemUB29ZPHOCPYC0wp9/xTUi9+BaNvVLwT85Fc+yq5yK2KefMdgh5XVnEmLraWm064tDezoTbTOK7rtnjJ9gb6t2rbTWpWdiw/7W3Lf+Mb4qT5kPNiftwoVvDXZot5TpG+sY0/KmuW3sCsxi/Fd4JeZ4qOIZjgpVZjw/idIIsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYjC6aHF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYjC6aHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789213725; x=1820749725;
  h=date:from:to:cc:subject:message-id;
  bh=rozqtQOCcVb3+A/okIaRzPoQvSnGKMG2MYlezvB4+Gc=;
  b=JYjC6aHFoP7rjvFX5AdA47StKz+FHVq7cmljhoib9sxFcSBw4L1ondeI
   zRCl+Xw2FydOGdRwe0REcifHkQrdfhfDTPvDYuhJzuhV6R6qXvU4lqY+d
   sBTd47dmDDeezyOirEJjUKAZTX9YKww7q3cHV1ThAOEbs//FD5kBs7Ogq
   NYbfsfEbtgpVeNGmuQAtEz3KBsD510KEldCji5rP8tZ/x26ABC1kqDT3Y
   eS6fg8WG/qJCKl7Is3CT+0zwvPULVpUWCQVp6CSFUb6nNqLGPvL78BOAK
   5rTtXJ9ENSepZDcjpIxF347e8r0+6o2ikArnzddMYwjLCUUDQZ8osREgI
   Q==;
X-CSE-ConnectionGUID: C3UqZaUTRzuIJ0Ji4mu4vQ==
X-CSE-MsgGUID: w4zGDfkWTOGtlicN5dB6oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100250642"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="100250642"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:48:44 -0700
X-CSE-ConnectionGUID: NhR5KqGmTpuZ5pY8VFwPcg==
X-CSE-MsgGUID: 86cl+ryNSZ+P0T8D1Ahz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275918148"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2026 04:48:41 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5MDl-0000000015b-1DZL;
	Sat, 12 Sep 2026 11:48:37 +0000
Date: Sat, 12 Sep 2026 13:48:04 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 8/10]
 drivers/char/tpm/tpm_tis_i2c.c:322:61: error: use of undeclared identifier
 'tpm_tis_resume'
Message-ID: <202609121338.qo2mQWRl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   b5f1b25b21f56c9fff87ad0235791883d1bf01a9
commit: 2249200ee4202c7596b612360e0e201a5fef0064 [8/10] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()
config: i386-randconfig-053-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121338.qo2mQWRl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121338.qo2mQWRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121338.qo2mQWRl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tis_i2c.c:322:61: error: use of undeclared identifier 'tpm_tis_resume'
     322 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |                                                             ^~~~~~~~~~~~~~
>> drivers/char/tpm/tpm_tis_i2c.c:322:61: error: use of undeclared identifier 'tpm_tis_resume'
     322 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |                                                             ^~~~~~~~~~~~~~
>> drivers/char/tpm/tpm_tis_i2c.c:322:61: error: use of undeclared identifier 'tpm_tis_resume'
     322 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
         |                                                             ^~~~~~~~~~~~~~
   3 errors generated.
--
>> drivers/char/tpm/tpm_infineon.c:615:61: error: use of undeclared identifier 'tpm_inf_resume'; did you mean 'tpm_pm_resume'?
     615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
         |                                                             ^~~~~~~~~~~~~~
         |                                                             tpm_pm_resume
   include/linux/pm.h:417:39: note: expanded from macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |                                              ^~~~~~~~~
   include/linux/pm.h:375:34: note: expanded from macro '_DEFINE_DEV_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                                         ^~~~~~~~~
   include/linux/pm.h:316:25: note: expanded from macro 'SYSTEM_SLEEP_PM_OPS'
     316 |         .resume = pm_sleep_ptr(resume_fn), \
         |                                ^~~~~~~~~
   include/linux/pm.h:474:65: note: expanded from macro 'pm_sleep_ptr'
     474 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^~~~
   include/linux/util_macros.h:136:38: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/char/tpm/tpm.h:79:5: note: 'tpm_pm_resume' declared here
      79 | int tpm_pm_resume(struct device *dev);
         |     ^
>> drivers/char/tpm/tpm_infineon.c:615:61: error: use of undeclared identifier 'tpm_inf_resume'; did you mean 'tpm_pm_resume'?
     615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
         |                                                             ^~~~~~~~~~~~~~
         |                                                             tpm_pm_resume
   include/linux/pm.h:417:39: note: expanded from macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |                                              ^~~~~~~~~
   include/linux/pm.h:375:34: note: expanded from macro '_DEFINE_DEV_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                                         ^~~~~~~~~
   include/linux/pm.h:318:23: note: expanded from macro 'SYSTEM_SLEEP_PM_OPS'
     318 |         .thaw = pm_sleep_ptr(resume_fn), \
         |                              ^~~~~~~~~
   include/linux/pm.h:474:65: note: expanded from macro 'pm_sleep_ptr'
     474 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^~~~
   include/linux/util_macros.h:136:38: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/char/tpm/tpm.h:79:5: note: 'tpm_pm_resume' declared here
      79 | int tpm_pm_resume(struct device *dev);
         |     ^
>> drivers/char/tpm/tpm_infineon.c:615:61: error: use of undeclared identifier 'tpm_inf_resume'; did you mean 'tpm_pm_resume'?
     615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
         |                                                             ^~~~~~~~~~~~~~
         |                                                             tpm_pm_resume
   include/linux/pm.h:417:39: note: expanded from macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |                                              ^~~~~~~~~
   include/linux/pm.h:375:34: note: expanded from macro '_DEFINE_DEV_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                                         ^~~~~~~~~
   include/linux/pm.h:320:26: note: expanded from macro 'SYSTEM_SLEEP_PM_OPS'
     320 |         .restore = pm_sleep_ptr(resume_fn),
         |                                 ^~~~~~~~~
   include/linux/pm.h:474:65: note: expanded from macro 'pm_sleep_ptr'
     474 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^~~~
   include/linux/util_macros.h:136:38: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/char/tpm/tpm.h:79:5: note: 'tpm_pm_resume' declared here
      79 | int tpm_pm_resume(struct device *dev);
         |     ^
   3 errors generated.


vim +/tpm_tis_resume +322 drivers/char/tpm/tpm_tis_i2c.c

   321	
 > 322	static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
   323	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
