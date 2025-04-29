Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F28217F27
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942793; cv=none; b=m9rArb1CIahba0y1tigFAMbZHUw6/fIifk1sMterRZYnpmJj6n3+Rjz09nNZ3Dmho015qGUoG4DmKqLzFWFPO2wDggoodETThYMBEnjR3+o0vvgnKy0B7tTJlOlS5TpAwac5GP9r7EJdGypadLU+DX4uvd8lcImYZ4y/gBHXfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942793; c=relaxed/simple;
	bh=dxJWAuZGk0WD2AirbbJNtr2jC8QxoWAxDy+qf59Evbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJG5gVcxwpd+Im2fuMA1fez/SjSeF452wgnn4lIxNrujopC9gZkb8oj8zWhfMDkL+rNcd+eB06rWnEyX5jRIzlri63Dmh/rOwWyWAFzleCXhKUB0XHBgSFk/Q6VahHWifrWQ/H4OnjpMF1L+u0QOhkyWz+TD75P0ZXxKq2UWSaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5m09u49; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5m09u49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745942792; x=1777478792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxJWAuZGk0WD2AirbbJNtr2jC8QxoWAxDy+qf59Evbk=;
  b=W5m09u49ILVnxDhrjErRCejr50bWwU/LW/vqypGEz6HCAu1Kz7pHGXOg
   It4leEYbHNGNcwqXQThw1lVrOhSGzOzPK2a5CbGpoivq0p7Fx5Q5MOwfH
   2vLoFOApbGD6Bgfnd4AoKwFbK/odMLDT5AxFIgSaueM4aXEpDfJ6SVlO4
   OsBtA0e9nt0zSdmh2l8ZNfI8aY0NykE4dJz9exNGkuXaN7s9L8FX86mBm
   KT23dNHoSc1k6YiT66P8vMzNcoO8v3+5KcOi63YsoD9odWyFSIUmFZlVD
   PJ5DqGTNBiuBsEuHOHJk7kvJOtexuAbpmdUpow67Mx5cOA+L6Y/nR9JcZ
   w==;
X-CSE-ConnectionGUID: 6ouktlAXSm2KOdcFdFGvFQ==
X-CSE-MsgGUID: GU5GiXUPQQCSF+VyhvvkAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51242388"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="51242388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:06:32 -0700
X-CSE-ConnectionGUID: PvMUIUlMRg6dc70BvHt4GQ==
X-CSE-MsgGUID: CdVB8Zy5S/qlgp1hn0vuVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133583394"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 09:06:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9nTX-0000sV-0z;
	Tue, 29 Apr 2025 16:06:27 +0000
Date: Wed, 30 Apr 2025 00:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alessevan <44125445+Alessevan@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 56/195] drivers/net/ethernet/realtek/8139c.c:152:17:
 error: expected ')' before 'RTL8139c_DRIVER_NAME'
Message-ID: <202504292327.LgH3enjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 15b4eed3e4b6bd5d5799c52a1550ad763e31adda [56/195] feat: print MAC address in C driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250429/202504292327.LgH3enjK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292327.LgH3enjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292327.LgH3enjK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/net/ethernet/realtek/8139c.c:10:
   drivers/net/ethernet/realtek/8139c.c:139:43: error: 'rtl8139c_suspend' undeclared here (not in a function); did you mean 'rtl8139c_reset'?
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:313:20: note: in expansion of macro 'pm_sleep_ptr'
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                    ^~~~~~~~~~~~
   include/linux/pm.h:343:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     343 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:441:9: note: in expansion of macro 'SET_SYSTEM_SLEEP_PM_OPS'
     441 |         SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/realtek/8139c.c:139:8: note: in expansion of macro 'SIMPLE_DEV_PM_OPS'
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |        ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/realtek/8139c.c:139:61: error: 'rtl8139c_resume' undeclared here (not in a function); did you mean 'rtl8139c_remove'?
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |                                                             ^~~~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:314:19: note: in expansion of macro 'pm_sleep_ptr'
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:343:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     343 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:441:9: note: in expansion of macro 'SET_SYSTEM_SLEEP_PM_OPS'
     441 |         SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/realtek/8139c.c:139:8: note: in expansion of macro 'SIMPLE_DEV_PM_OPS'
     139 | static SIMPLE_DEV_PM_OPS(rtl8139c_pm_ops, rtl8139c_suspend, rtl8139c_resume);
         |        ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13:
   drivers/net/ethernet/realtek/8139c.c: In function 'rtl8139c_init_module':
>> drivers/net/ethernet/realtek/8139c.c:152:17: error: expected ')' before 'RTL8139c_DRIVER_NAME'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:425:42: note: in definition of macro '__printk_index_emit'
     425 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:574:26: note: in expansion of macro 'pr_fmt'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
   include/linux/printk.h:425:41: note: to match this '('
     425 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
   include/linux/printk.h:472:17: note: in expansion of macro '__printk_index_emit'
     472 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
>> drivers/net/ethernet/realtek/8139c.c:152:17: error: expected ')' before 'RTL8139c_DRIVER_NAME'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:434:61: note: in definition of macro '__printk_index_emit'
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                             ^~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:574:26: note: in expansion of macro 'pr_fmt'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
   include/linux/printk.h:434:60: note: to match this '('
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
   include/linux/printk.h:472:17: note: in expansion of macro '__printk_index_emit'
     472 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
>> drivers/net/ethernet/realtek/8139c.c:152:17: error: expected ')' before 'RTL8139c_DRIVER_NAME'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:434:70: note: in definition of macro '__printk_index_emit'
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                      ^~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:574:26: note: in expansion of macro 'pr_fmt'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
   include/linux/printk.h:434:69: note: to match this '('
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
   include/linux/printk.h:472:17: note: in expansion of macro '__printk_index_emit'
     472 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
>> drivers/net/ethernet/realtek/8139c.c:152:17: error: expected ')' before 'RTL8139c_DRIVER_NAME'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/printk.h:574:26: note: in expansion of macro 'pr_fmt'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                          ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~
   include/linux/printk.h:473:24: note: to match this '('
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/net/ethernet/realtek/8139c.c:152:9: note: in expansion of macro 'pr_info'
     152 |         pr_info(RTL8139c_DRIVER_NAME "\n");
         |         ^~~~~~~


vim +152 drivers/net/ethernet/realtek/8139c.c

   148	
   149	static int __init rtl8139c_init_module(void)
   150	{
   151	#ifdef MODULE
 > 152		pr_info(RTL8139c_DRIVER_NAME "\n");
   153	#endif
   154	
   155		return pci_register_driver(&rtl8139c_pci_driver);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
