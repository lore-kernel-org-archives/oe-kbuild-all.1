Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660F191F91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618828; cv=none; b=GcFiD/5I3L3BkraXCv7uUreNlxgfqtfOg2WKhCZRWl6hyBqJdL+bPv6f6WTFoFYgZLQbh6S7MH7VH0XSQP4e0eBBeOUnZ9DxjnnGHjpBhy8m/iN/TUuj3fU2et8JvS4C835bNXCa3WaUcG81kfC8Og+ZYnmy86/7j0RCFOPTFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618828; c=relaxed/simple;
	bh=alZgYNIxl2rw78a5DJJGcg6zs0rP4j9fASBj9GPdng4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jg7dzLJrKjjSE69JdwpmznsenHAOliqEyieGPC9c4sdmvb+560AohSCbsqTNFq1eJI0x6J/YRSud9stPT1ImUTOMiI/HXx3QJse57Ykw38OWHkKULBlg0namnap55s2aArs7Cub6gie5L5n9N9+4I6t5/UUhQY+g4w8ffe4LO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7EIgQc/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7EIgQc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778618827; x=1810154827;
  h=date:from:to:cc:subject:message-id;
  bh=alZgYNIxl2rw78a5DJJGcg6zs0rP4j9fASBj9GPdng4=;
  b=M7EIgQc/KeJtKTiAruRf/o4/jxplZ2Tvy2tAe3hHwp4jvdIkH50bq1yn
   jmPxsZGC3y2fodi03ISjHd02F99dxBzc0TZU0oLeZbSfG1SAaYhPux8iX
   JSyMANZDDqzZEJ3NSdnJHshg5kILmpDofmJPwl11+0AOsr6hCYmNQM0zx
   6W1p9RRe5jdifc1JXfTmatWpft7S+A/YGJvULFqJVCsMTRcwwRbqLvogQ
   Ac3qY4wArEfqImmtENA5tEmy02QnmrQmDv7LaaMyqVGeLsz/idQsqBDiz
   Sc7nZnblgC+6Y8S0mml/yENFfCTvtreHEVO7kIVO4oQcAczqgRQ0r/m9B
   A==;
X-CSE-ConnectionGUID: uIc0AEyvSR+iGBlMfjzTnQ==
X-CSE-MsgGUID: MoFh2giKR9CJu12+RSZHrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83153617"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="83153617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:47:06 -0700
X-CSE-ConnectionGUID: 0kFHK3faQxKMH4wmCV2z0g==
X-CSE-MsgGUID: jrUErZ23QKWlaIsTEqekjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="261370606"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 13:47:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMu0M-000000002nT-1K8r;
	Tue, 12 May 2026 20:47:02 +0000
Date: Wed, 13 May 2026 04:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:debug_hc_died_cmdring_race 1/1]
 include/linux/dev_printk.h:154:24: warning: unsupported argument to
 '__builtin_return_address'
Message-ID: <202605130404.DgrTH6fZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git debug_hc_died_cmdring_race
head:   c7d4dfa22bd8c114d3899f9d4105f470d569fd8d
commit: c7d4dfa22bd8c114d3899f9d4105f470d569fd8d [1/1] xhci: add code to debug commad queue and suspend race
config: parisc-randconfig-002-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130404.DgrTH6fZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130404.DgrTH6fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130404.DgrTH6fZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/usb/host/xhci-ring.c:59:
   drivers/usb/host/xhci-ring.c: In function 'queue_command':
>> include/linux/dev_printk.h:154:24: warning: unsupported argument to '__builtin_return_address'
     154 |  dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                        ^
   include/linux/dev_printk.h:110:3: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |   ^~~~~~~
   drivers/usb/host/xhci.h:1743:2: note: in expansion of macro 'dev_err'
    1743 |  dev_err(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
         |  ^~~~~~~
   drivers/usb/host/xhci-ring.c:4368:3: note: in expansion of macro 'xhci_err'
    4368 |   xhci_err(xhci, "called by %pS from %pS\n",
         |   ^~~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from xhci-ring.c:59:
   xhci-ring.c: In function 'queue_command':
>> include/linux/dev_printk.h:154:24: warning: unsupported argument to '__builtin_return_address'
     154 |  dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                        ^
   include/linux/dev_printk.h:110:3: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |   ^~~~~~~
   xhci.h:1743:2: note: in expansion of macro 'dev_err'
    1743 |  dev_err(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
         |  ^~~~~~~
   xhci-ring.c:4368:3: note: in expansion of macro 'xhci_err'
    4368 |   xhci_err(xhci, "called by %pS from %pS\n",
         |   ^~~~~~~~


vim +/__builtin_return_address +154 include/linux/dev_printk.h

af628aae8640c26 Greg Kroah-Hartman 2019-12-09   99  
ad7d61f159db739 Chris Down         2021-06-15  100  /*
ad7d61f159db739 Chris Down         2021-06-15  101   * Need to take variadic arguments even though we don't use them, as dev_fmt()
ad7d61f159db739 Chris Down         2021-06-15  102   * may only just have been expanded and may result in multiple arguments.
ad7d61f159db739 Chris Down         2021-06-15  103   */
ad7d61f159db739 Chris Down         2021-06-15  104  #define dev_printk_index_emit(level, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  105  	printk_index_subsys_emit("%s %s: ", level, fmt)
ad7d61f159db739 Chris Down         2021-06-15  106  
ad7d61f159db739 Chris Down         2021-06-15  107  #define dev_printk_index_wrap(_p_func, level, dev, fmt, ...)		\
ad7d61f159db739 Chris Down         2021-06-15  108  	({								\
ad7d61f159db739 Chris Down         2021-06-15  109  		dev_printk_index_emit(level, fmt);			\
ad7d61f159db739 Chris Down         2021-06-15  110  		_p_func(dev, fmt, ##__VA_ARGS__);			\
ad7d61f159db739 Chris Down         2021-06-15  111  	})
ad7d61f159db739 Chris Down         2021-06-15  112  
ad7d61f159db739 Chris Down         2021-06-15  113  /*
ad7d61f159db739 Chris Down         2021-06-15  114   * Some callsites directly call dev_printk rather than going through the
ad7d61f159db739 Chris Down         2021-06-15  115   * dev_<level> infrastructure, so we need to emit here as well as inside those
ad7d61f159db739 Chris Down         2021-06-15  116   * level-specific macros. Only one index entry will be produced, either way,
ad7d61f159db739 Chris Down         2021-06-15  117   * since dev_printk's `fmt` isn't known at compile time if going through the
ad7d61f159db739 Chris Down         2021-06-15  118   * dev_<level> macros.
ad7d61f159db739 Chris Down         2021-06-15  119   *
ad7d61f159db739 Chris Down         2021-06-15  120   * dev_fmt() isn't called for dev_printk when used directly, as it's used by
ad7d61f159db739 Chris Down         2021-06-15  121   * the dev_<level> macros internally which already have dev_fmt() processed.
ad7d61f159db739 Chris Down         2021-06-15  122   *
ad7d61f159db739 Chris Down         2021-06-15  123   * We also can't use dev_printk_index_wrap directly, because we have a separate
ad7d61f159db739 Chris Down         2021-06-15  124   * level to process.
ad7d61f159db739 Chris Down         2021-06-15  125   */
ad7d61f159db739 Chris Down         2021-06-15  126  #define dev_printk(level, dev, fmt, ...)				\
ad7d61f159db739 Chris Down         2021-06-15  127  	({								\
ad7d61f159db739 Chris Down         2021-06-15  128  		dev_printk_index_emit(level, fmt);			\
ad7d61f159db739 Chris Down         2021-06-15  129  		_dev_printk(level, dev, fmt, ##__VA_ARGS__);		\
ad7d61f159db739 Chris Down         2021-06-15  130  	})
ad7d61f159db739 Chris Down         2021-06-15  131  
c26ec799042a388 Geert Uytterhoeven 2024-02-28  132  /*
c26ec799042a388 Geert Uytterhoeven 2024-02-28  133   * Dummy dev_printk for disabled debugging statements to use whilst maintaining
c26ec799042a388 Geert Uytterhoeven 2024-02-28  134   * gcc's format checking.
c26ec799042a388 Geert Uytterhoeven 2024-02-28  135   */
c26ec799042a388 Geert Uytterhoeven 2024-02-28  136  #define dev_no_printk(level, dev, fmt, ...)				\
c26ec799042a388 Geert Uytterhoeven 2024-02-28  137  	({								\
c26ec799042a388 Geert Uytterhoeven 2024-02-28  138  		if (0)							\
c26ec799042a388 Geert Uytterhoeven 2024-02-28  139  			_dev_printk(level, dev, fmt, ##__VA_ARGS__);	\
c26ec799042a388 Geert Uytterhoeven 2024-02-28  140  	})
c26ec799042a388 Geert Uytterhoeven 2024-02-28  141  
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  142  /*
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  143   * #defines for all the dev_<level> macros to prefix with whatever
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  144   * possible use of #define dev_fmt(fmt) ...
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  145   */
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  146  
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  147  #define dev_emerg(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  148  	dev_printk_index_wrap(_dev_emerg, KERN_EMERG, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  149  #define dev_crit(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  150  	dev_printk_index_wrap(_dev_crit, KERN_CRIT, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  151  #define dev_alert(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  152  	dev_printk_index_wrap(_dev_alert, KERN_ALERT, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  153  #define dev_err(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15 @154  	dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  155  #define dev_warn(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  156  	dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  157  #define dev_notice(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  158  	dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  159  #define dev_info(dev, fmt, ...) \
ad7d61f159db739 Chris Down         2021-06-15  160  	dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
af628aae8640c26 Greg Kroah-Hartman 2019-12-09  161  

:::::: The code at line 154 was first introduced by commit
:::::: ad7d61f159db73974f1b0352f21afe04b0bbd920 printk: index: Add indexing support to dev_printk

:::::: TO: Chris Down <chris@chrisdown.name>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
