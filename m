Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43919AD89
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744058439; cv=none; b=DN2y1fnMton5fmJcQ9QrYd8KQFIOYhZxC3K1bCfrNNJTvqodPQ8STiZeAhRPtK3msoHg0K3lZAizHjGvN/f1FzyZIfWFTcHMotrvDaQ2vJTvhFqA9CF3D/cCWVjCmPiC0O9x5RCrmOE7RcUBDQg85T5SqZdoqhnoa4CQI7zxtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744058439; c=relaxed/simple;
	bh=nGlNbDRzTtlATJl2YqLXveoWoSCMytqYYRj7NLsGbYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3tGcbwjWjmdumASO10u7O++DMjYp77uKidk86mZFG7jLxZ8TtIwiFU2V6VHOunZEHSICohrkAKdC+GfcoY3AGU5wmPD1b6gvIoHII72mgg4e9WmUY7KdeGJSPE600f3gUeTCjwgN3C05XBiULprlDcmUKvQ8/bxuX5unOUXzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MusTTxiT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MusTTxiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744058436; x=1775594436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nGlNbDRzTtlATJl2YqLXveoWoSCMytqYYRj7NLsGbYg=;
  b=MusTTxiTHluq1YuZS9D9yfjrhXJSrJrR4sZEqPdfxtqdeM9vOzQO+Qs4
   4ol88AI6v5WYz+EMn41e9ouFVgb7MloffIUFEQi0P3KScpvKPMm3FsF9O
   gdqGuy2ti7l/etgFO5uI4dgodRfkECx0DoY3F8ahx/Q9AwXposXJaA8Nt
   Dz6/aUMdVRlxZ7aElp/KJViPkytdGjrUpKUcwjZ5hGCWHleWVyAk+h4L1
   e42Ug41T0YZlzhTw7h8cLgKN+hRO0dFQHUvk4HE9Iy8+8ZEw0SyC/cEl1
   2dX3tb+P4Ujs1gCtVzSXJfQrCbXWR322EM0xrfkLqMrAKEKPySPLGLW1Z
   w==;
X-CSE-ConnectionGUID: esgZ23wvSNOSb8UQIb+GPA==
X-CSE-MsgGUID: vxeWeczuQqSFWkNKSlXBfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33074375"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="33074375"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 13:40:35 -0700
X-CSE-ConnectionGUID: HTkOobLbQkSYg7VCb+Z5dw==
X-CSE-MsgGUID: Itn/u9KJTBSMK0idq8/26Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128918855"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 13:40:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1tGh-0003ox-2D;
	Mon, 07 Apr 2025 20:40:31 +0000
Date: Tue, 8 Apr 2025 04:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topology2_sched_domain_support 1/1]
 include/linux/printk.h:434:76: error: pointer/integer type mismatch in
 conditional expression
Message-ID: <202504080456.eZVKytj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topology2_sched_domain_support
head:   e7f2745320e2fae66eb1e6d7620062d5377b25b9
commit: e7f2745320e2fae66eb1e6d7620062d5377b25b9 [1/1] ASoC: sof: ipc4-topology: Add support to sched_domain attribute
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504080456.eZVKytj9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080456.eZVKytj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080456.eZVKytj9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/sound/pcm.h:14,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/sof/ipc4-topology.c:12:
   sound/soc/sof/ipc4-topology.c: In function 'sof_ipc4_widget_setup_msg':
>> include/linux/printk.h:434:76: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
     434 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                            ^
   include/linux/printk.h:468:9: note: in expansion of macro '__printk_index_emit'
     468 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:9: note: in expansion of macro 'dev_printk_index_wrap'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pm_qos.h:17,
                    from include/sound/pcm.h:17:
   sound/soc/sof/ipc4-topology.c:510:25: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Wincompatible-pointer-types]
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         |
         |                         char *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sof/ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:36: note: expected 'const struct device *' but argument is of type 'char *'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |               ~~~~~~~~~~~~~~~~~~~~~^~~
   sound/soc/sof/ipc4-topology.c:510:53: error: incompatible type for argument 2 of '_dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                                              ~~~~~~~^~~~~~~~~~~~~
         |                                                     |
         |                                                     enum sof_comp_domain
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/sof/ipc4-topology.c:510:17: note: in expansion of macro 'dev_err'
     510 |                 dev_err("Bad domain val %d", swidget->comp_domain);
         |                 ^~~~~~~
   include/linux/dev_printk.h:50:53: note: expected 'const char *' but argument is of type 'enum sof_comp_domain'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                         ~~~~~~~~~~~~^~~


vim +434 include/linux/printk.h

337015573718b1 Chris Down 2021-06-15  422  
337015573718b1 Chris Down 2021-06-15  423  #define __printk_index_emit(_fmt, _level, _subsys_fmt_prefix)		\
337015573718b1 Chris Down 2021-06-15  424  	do {								\
337015573718b1 Chris Down 2021-06-15  425  		if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
337015573718b1 Chris Down 2021-06-15  426  			/*
337015573718b1 Chris Down 2021-06-15  427  			 * We check __builtin_constant_p multiple times here
337015573718b1 Chris Down 2021-06-15  428  			 * for the same input because GCC will produce an error
337015573718b1 Chris Down 2021-06-15  429  			 * if we try to assign a static variable to fmt if it
337015573718b1 Chris Down 2021-06-15  430  			 * is not a constant, even with the outer if statement.
337015573718b1 Chris Down 2021-06-15  431  			 */						\
337015573718b1 Chris Down 2021-06-15  432  			static const struct pi_entry _entry		\
337015573718b1 Chris Down 2021-06-15  433  			__used = {					\
337015573718b1 Chris Down 2021-06-15 @434  				.fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
337015573718b1 Chris Down 2021-06-15  435  				.func = __func__,			\
337015573718b1 Chris Down 2021-06-15  436  				.file = __FILE__,			\
337015573718b1 Chris Down 2021-06-15  437  				.line = __LINE__,			\
337015573718b1 Chris Down 2021-06-15  438  				.level = __builtin_constant_p(_level) ? (_level) : NULL, \
337015573718b1 Chris Down 2021-06-15  439  				.subsys_fmt_prefix = _subsys_fmt_prefix,\
337015573718b1 Chris Down 2021-06-15  440  			};						\
337015573718b1 Chris Down 2021-06-15  441  			static const struct pi_entry *_entry_ptr	\
337015573718b1 Chris Down 2021-06-15  442  			__used __section(".printk_index") = &_entry;	\
337015573718b1 Chris Down 2021-06-15  443  		}							\
337015573718b1 Chris Down 2021-06-15  444  	} while (0)
337015573718b1 Chris Down 2021-06-15  445  

:::::: The code at line 434 was first introduced by commit
:::::: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format indexing support

:::::: TO: Chris Down <chris@chrisdown.name>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
