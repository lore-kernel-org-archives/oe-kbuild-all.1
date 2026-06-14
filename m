Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8363171BB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 05:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781414504; cv=none; b=AZZSOQFDX1ZtuxiirjOrGn0PAiLovB+HiLeohCeomoqYCE87JrsPQnypW2IWXmE5x64ReqO7mbALShphNV6D9zjoVXFjYnEwwIMma2V1spmKaxDBa6ycSHp+T7/082zSQHpovBAQmkLEnMtKM5X8uthFtA73dz5PKBcQyvMJxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781414504; c=relaxed/simple;
	bh=R7VWXqAenGt9DLj/xTSvX9C2PFmpoypPgkp6oK1PJn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=etV93Iiqmp1yVIXtlPXNvejzApTU9GhpR70aJlyiuqVqYILLjI9BGVOqshRQgL4dKiyINJv6lOVBkdlZk3Xap2eQhvtaqbgtaDRlVoECetpnyoP7IJiL66qIVctPxl/a988+D25vxA54avewJKfWmmeHCoxvkT+H+crAJGlFEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hluYyeBi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hluYyeBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781414503; x=1812950503;
  h=date:from:to:cc:subject:message-id;
  bh=R7VWXqAenGt9DLj/xTSvX9C2PFmpoypPgkp6oK1PJn0=;
  b=hluYyeBiAlyx+SVWaZmY12R93SLyAgXvkJ1Mtm4iiNXhIrhypcHXZ3MX
   KHwJMQdPL2sMWdaYBvFFwB/w9xd9WInvh6W1GG9i4oWCk9VrKxZAfsAt3
   16NUFQLb+twnwgq+dMM2sdN4MQaSwPJwumZGovYyWvJxQJ5sqT8XOZS3d
   J64IJgr3dLHHKRQXwKX9eEHdwKbQJa5JmZD8qIJ+RMxmMgPuPwiQQE4t9
   MYgxHW75547JTBrIY6I4skvAkoLSBnnPAytxZLXBuPGs3bbTrPCviP1Y3
   l8QolK4gDC9fv1Pa+r+rLXiP/isLeBeQ3q0qmzAVGj1A4dJRsqWal3aZy
   w==;
X-CSE-ConnectionGUID: S3NStmRSTmCHda3TR3JMtw==
X-CSE-MsgGUID: MdP0rPXDQbeMs8iL3fbelA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="69735682"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="69735682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 22:21:42 -0700
X-CSE-ConnectionGUID: LDf/5rTkRzypFU5QnEC/+A==
X-CSE-MsgGUID: E6g4dpY/Q5ijfSFFPd9fhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="271238119"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2026 22:21:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYdHu-00000000Qav-0rEE;
	Sun, 14 Jun 2026 05:21:38 +0000
Date: Sun, 14 Jun 2026 13:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 12773/13763]
 include/linux/dev_printk.h:154:24: warning: 'len' is used uninitialized in
 this function
Message-ID: <202606141301.iyVdFgl7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 4f2692a5383e4bdd43ae940cda012360f7217a2d [12773/13763] mtd: rawnand: ndfc: use ioread32be/iowrite32be and allow COMPILE_TEST
config: alpha-randconfig-r062-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141301.iyVdFgl7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141301.iyVdFgl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141301.iyVdFgl7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/mtd/mtd.h:13,
                    from include/linux/mtd/rawnand.h:16,
                    from drivers/mtd/nand/raw/ndfc.c:20:
   drivers/mtd/nand/raw/ndfc.c: In function 'ndfc_probe':
>> include/linux/dev_printk.h:154:24: warning: 'len' is used uninitialized in this function [-Wuninitialized]
     dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                           ^~~~~~~~
   drivers/mtd/nand/raw/ndfc.c:191:11: note: 'len' was declared here
     int err, len;
              ^~~


vim +/len +154 include/linux/dev_printk.h

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
