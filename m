Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEF15444B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 23:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708470436; cv=none; b=k0WOC8yhm5S5NGx7dMr+EiesAkkL7qDLoaQtDWbaCdAXU6kwTpas7S+HPKc3V5m9h5KB/dlCPg0k0B1FafhEdDqj1zYjQIw2dLVeKi5kHNfxkzzyFG0R+rDJYDeY1Nj9b8OlB+ulU2YDPS74kpMOyJlvjsQ0Dd2MxLdrICRx6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708470436; c=relaxed/simple;
	bh=exh5TGrbbZeLKHiKPlWh3sUFz1sJPco3hvEA2Rw+P7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZX5ji4Dhi4ZulGpxcMpt2AuIhGHS92upXt1diSzpR9ZquIztLQ9kGxVQtFGmSNi/NSqKr1s1byUfGa+6mgKtFYpNTs3XsO2aGBSjqheOUKOISNGtXKBlWQjZil6ZX0gKA3hZPdYDyBkQ3Yuz8dWu+rI1bKZdNEhh2txLBsPMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbWSp36e; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbWSp36e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708470434; x=1740006434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=exh5TGrbbZeLKHiKPlWh3sUFz1sJPco3hvEA2Rw+P7A=;
  b=MbWSp36eWoBbKX3cJzS+uX8i/Coz5r/YmPjbghiOvxXUMBI/WZue7YRq
   QGX2cOcMRa4pHhV/qjh1PHJ9c/OF+Sr9NmKOnkTQ6L9LQ66CGXty79TQP
   Tq8IFbCVRz7hI8YcZtOCyd4OGDMNHhM3QBzN0RWIfIXKRl7Zk/cbzqooc
   KGhmEEc0Op4OFJE8TOG17jZDJUUqqulKodaLes1KtTwwrs05PTA1ZoW2M
   vEjr8fsubb3/NMjG0OVSL8a8VAM6Gni6M/AOEBCJ1f7sg4kAn66MF7dCZ
   8yoRSKUuiRdyYlu8UqbtOQPbkgWk//AyOxA1tfiaS3cCl+dVu4UvSZN2F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20037531"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="20037531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 15:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4912934"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 15:07:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcZCf-0004sC-01;
	Tue, 20 Feb 2024 23:07:09 +0000
Date: Wed, 21 Feb 2024 07:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/50 6/9] arch/um/include/asm/uaccess.h:17:36:
 error: comparison of unsigned expression in '>= 0' is always true
Message-ID: <202402210716.uLc3keD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/50
head:   b3bf5911a5d9f6eb8112d294ffaf5f474dccc686
commit: ce8c582c6121469db64197b1b4aa4e4c377c660f [6/9] [wifi] adding driver-folder
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240221/202402210716.uLc3keD9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210716.uLc3keD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402210716.uLc3keD9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/uaccess.h:14,
                    from include/linux/poll.h:12,
                    from drivers/misc/mediatek/btif/common/mtk_btif.c:23:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/misc/mediatek/btif/common/mtk_btif.c:16:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:31:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:338:32: note: in definition of macro '__compiletime_assert'
     338 |                 int __cond = !(condition);                              \
         |                                ^~~~~~~~~
   include/linux/compiler.h:361:9: note: in expansion of macro '_compiletime_assert'
     361 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/kfifo.h:56,
                    from drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:23,
                    from drivers/misc/mediatek/btif/common/plat_inc/btif_pub.h:17,
                    from drivers/misc/mediatek/btif/common/mtk_btif.c:37:
   include/linux/mm.h: In function 'pgtable_init':
>> arch/um/include/asm/pgtable.h:35:33: error: suggest braces around empty body in 'do' statement [-Werror=empty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1898:9: note: in expansion of macro 'pgtable_cache_init'
    1898 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h: In function 'hal_log_print':
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:64:9: error: function 'hal_log_print' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]
      64 |         vsnprintf(temp_sring, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif.c: In function 'mtk_btif_restore_noirq':
   drivers/misc/mediatek/btif/common/mtk_btif.c:379:13: error: variable 'i_ret' set but not used [-Werror=unused-but-set-variable]
     379 |         int i_ret = 0;
         |             ^~~~~
   drivers/misc/mediatek/btif/common/mtk_btif.c: At top level:
   drivers/misc/mediatek/btif/common/mtk_btif.c:522:6: error: no previous prototype for 'btif_rx_notify_cb' [-Werror=missing-prototypes]
     522 | void btif_rx_notify_cb(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif.c: In function 'flag_store':
   drivers/misc/mediatek/btif/common/mtk_btif.c:773:13: error: variable 'result' set but not used [-Werror=unused-but-set-variable]
     773 |         int result = 0;
         |             ^~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif.c: In function '_btif_pio_write':
   drivers/misc/mediatek/btif/common/mtk_btif.c:2778:56: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
    2778 |                 if ((++retry > max_tx_retry) || (i_ret < 0)) {
         |                                                        ^
   drivers/misc/mediatek/btif/common/mtk_btif.c: In function 'btif_log_buf_dmp_out':
   drivers/misc/mediatek/btif/common/mtk_btif.c:3033:24: error: variable 'p_buf' set but not used [-Werror=unused-but-set-variable]
    3033 |         unsigned char *p_buf = NULL;
         |                        ^~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/misc/mediatek/btif/common/inc/mtk_btif.h:18,
                    from drivers/misc/mediatek/btif/common/mtk_btif_exp.c:20:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:31:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:338:32: note: in definition of macro '__compiletime_assert'
     338 |                 int __cond = !(condition);                              \
         |                                ^~~~~~~~~
   include/linux/compiler.h:361:9: note: in expansion of macro '_compiletime_assert'
     361 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from drivers/misc/mediatek/btif/common/inc/mtk_btif.h:24:
   include/linux/mm.h: In function 'pgtable_init':
>> arch/um/include/asm/pgtable.h:35:33: error: suggest braces around empty body in 'do' statement [-Werror=empty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1898:9: note: in expansion of macro 'pgtable_cache_init'
    1898 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:14,
                    from drivers/misc/mediatek/btif/common/inc/mtk_btif.h:32:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/btif/common/plat_inc/btif_pub.h:17,
                    from drivers/misc/mediatek/btif/common/inc/mtk_btif.h:37:
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h: In function 'hal_log_print':
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:64:9: error: function 'hal_log_print' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]
      64 |         vsnprintf(temp_sring, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c: At top level:
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:24:12: error: no previous prototype for 'btif_exp_srh_id' [-Werror=missing-prototypes]
      24 | p_mtk_btif btif_exp_srh_id(unsigned long u_id)
         |            ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:511:5: error: no previous prototype for 'btif_open_no_id' [-Werror=missing-prototypes]
     511 | int btif_open_no_id(void)
         |     ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:526:5: error: no previous prototype for 'btif_close_no_id' [-Werror=missing-prototypes]
     526 | int btif_close_no_id(void)
         |     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:540:5: error: no previous prototype for 'btif_write_no_id' [-Werror=missing-prototypes]
     540 | int btif_write_no_id(const unsigned char *p_buf, unsigned int len)
         |     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:561:5: error: no previous prototype for 'btif_dpidle_ctrl_no_id' [-Werror=missing-prototypes]
     561 | int btif_dpidle_ctrl_no_id(ENUM_BTIF_DPIDLE_CTRL en_flag)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:585:5: error: no previous prototype for 'btif_loopback_ctrl_no_id' [-Werror=missing-prototypes]
     585 | int btif_loopback_ctrl_no_id(ENUM_BTIF_LPBK_MODE enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/mtk_btif_exp.c:596:5: error: no previous prototype for 'btif_dbg_ctrl_no_id' [-Werror=missing-prototypes]
     596 | int btif_dbg_ctrl_no_id(ENUM_BTIF_DBG_ID flag)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/kernel.h:10,
                    from drivers/misc/mediatek/btif/common/btif_dma_plat.c:14:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:31:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:338:32: note: in definition of macro '__compiletime_assert'
     338 |                 int __cond = !(condition);                              \
         |                                ^~~~~~~~~
   include/linux/compiler.h:361:9: note: in expansion of macro '_compiletime_assert'
     361 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from drivers/misc/mediatek/btif/common/plat_inc/btif_dma_pub.h:17,
                    from drivers/misc/mediatek/btif/common/plat_inc/btif_dma_priv.h:18,
                    from drivers/misc/mediatek/btif/common/btif_dma_plat.c:22:
   include/linux/mm.h: In function 'pgtable_init':
>> arch/um/include/asm/pgtable.h:35:33: error: suggest braces around empty body in 'do' statement [-Werror=empty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1898:9: note: in expansion of macro 'pgtable_cache_init'
    1898 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/btif/common/plat_inc/btif_dma_pub.h:19:
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h: In function 'hal_log_print':
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:64:9: error: function 'hal_log_print' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]
      64 |         vsnprintf(temp_sring, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/btif/common/btif_dma_plat.c: In function 'hal_dma_pm_ops':
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1315:38: error: variable 'flag' set but not used [-Werror=unused-but-set-variable]
    1315 |                         unsigned int flag = 0;
         |                                      ^~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-/include/mach: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/kernel.h:10,
                    from drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:17,
                    from drivers/misc/mediatek/btif/common/plat_inc/btif_pub.h:17,
                    from drivers/misc/mediatek/btif/common/btif_plat.c:21:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:31:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:338:32: note: in definition of macro '__compiletime_assert'
     338 |                 int __cond = !(condition);                              \
         |                                ^~~~~~~~~
   include/linux/compiler.h:361:9: note: in expansion of macro '_compiletime_assert'
     361 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/kfifo.h:56,
                    from drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:23:
   include/linux/mm.h: In function 'pgtable_init':
>> arch/um/include/asm/pgtable.h:35:33: error: suggest braces around empty body in 'do' statement [-Werror=empty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1898:9: note: in expansion of macro 'pgtable_cache_init'
    1898 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h: In function 'hal_log_print':
   drivers/misc/mediatek/btif/common/plat_inc/plat_common.h:64:9: error: function 'hal_log_print' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]
      64 |         vsnprintf(temp_sring, DBG_LOG_STR_SIZE, str, args);
         |         ^~~~~~~~~
   drivers/misc/mediatek/btif/common/btif_plat.c: In function 'hal_btif_hw_init':
   drivers/misc/mediatek/btif/common/btif_plat.c:518:39: error: implicit conversion from 'enum <anonymous>' to 'ENUM_BTIF_MODE' {aka 'enum _ENUM_BTIF_MODE_'} [-Werror=enum-conversion]
     518 |         hal_btif_tx_mode_ctrl(p_btif, false);
         |                                       ^~~~~
   drivers/misc/mediatek/btif/common/btif_plat.c:520:39: error: implicit conversion from 'enum <anonymous>' to 'ENUM_BTIF_MODE' {aka 'enum _ENUM_BTIF_MODE_'} [-Werror=enum-conversion]
     520 |         hal_btif_rx_mode_ctrl(p_btif, false);
         |                                       ^~~~~
   drivers/misc/mediatek/btif/common/btif_plat.c: In function 'hal_btif_pm_ops':
   drivers/misc/mediatek/btif/common/btif_plat.c:1348:38: error: variable 'flag' set but not used [-Werror=unused-but-set-variable]
    1348 |                         unsigned int flag = 0;
         |                                      ^~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/uaccess.h:14,
                    from include/linux/poll.h:12,
                    from drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h:26,
                    from drivers/misc/mediatek/connectivity/common/common_detect/mtk_wcn_stub_alps.c:64:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/common_detect/mtk_wcn_stub_alps.c: At top level:
   drivers/misc/mediatek/connectivity/common/common_detect/mtk_wcn_stub_alps.c:440:5: error: no previous prototype for 'mtk_wcn_cmb_stub_do_reset' [-Werror=missing-prototypes]
     440 | int mtk_wcn_cmb_stub_do_reset(unsigned int type)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/common/common_detect/mtk_wcn_stub_alps.c:475:13: error: no previous prototype for 'mtk_wcn_cmb_sdio_eirq_handler_stub' [-Werror=missing-prototypes]
     475 | irqreturn_t mtk_wcn_cmb_sdio_eirq_handler_stub(int irq, void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   drivers/misc/mediatek/connectivity/common/common_detect/wmt_stp_exp.c:14:10: fatal error: osal_typedef.h: No such file or directory
      14 | #include "osal_typedef.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/misc/mediatek/connectivity/common/common_detect/wmt_gpio.c:15:
   drivers/misc/mediatek/connectivity/common/common_detect/wmt_gpio.h:24:10: fatal error: osal.h: No such file or directory
      24 | #include "osal.h"
         |          ^~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: arch/arm/mach-//dct/dct: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/uaccess.h:14,
                    from include/linux/poll.h:12,
                    from drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.h:26,
                    from drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.c:23:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.c:24:
   drivers/misc/mediatek/connectivity/common/common_detect/wmt_gpio.h: At top level:
   drivers/misc/mediatek/connectivity/common/common_detect/wmt_gpio.h:24:10: fatal error: osal.h: No such file or directory
      24 | #include "osal.h"
         |          ^~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
..


vim +17 arch/um/include/asm/uaccess.h

^1da177e4c3f41 include/asm-um/uaccess.h      Linus Torvalds     2005-04-16  11  
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  12  #define __under_task_size(addr, size) \
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  13  	(((unsigned long) (addr) < TASK_SIZE) && \
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  14  	 (((unsigned long) (addr) + (size)) < TASK_SIZE))
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  15  
f8d65d27e677da arch/um/include/asm/uaccess.h Richard Weinberger 2015-05-12  16  #define __access_ok_vsyscall(addr, size) \
f8d65d27e677da arch/um/include/asm/uaccess.h Richard Weinberger 2015-05-12 @17  	  (((unsigned long) (addr) >= FIXADDR_USER_START) && \
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  18  	  ((unsigned long) (addr) + (size) <= FIXADDR_USER_END) && \
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  19  	  ((unsigned long) (addr) + (size) >= (unsigned long)(addr)))
fced95cacfc21b arch/um/include/asm/uaccess.h Al Viro            2011-08-18  20  

:::::: The code at line 17 was first introduced by commit
:::::: f8d65d27e677da0ce33de570e3068308a77ed2b1 um: Rework uaccess code

:::::: TO: Richard Weinberger <richard@nod.at>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
