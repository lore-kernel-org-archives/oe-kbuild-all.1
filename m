Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C3D10E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 01:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726881744; cv=none; b=Z+bgM6z0/ns08qfuOHvGMbFXwZfGCqxvQfqov0s2RYYshSHZlxN4oHoqgPCSMMjo6ctg2vqGcXlNcdq3DmPCA0mWt9LIQ9QS8uhAO1RSXm9tjDJcabWP6wZgKNQYsznRa8PM1f52uTjHgUl+FRkAavH4cUUdqoz5kgRvsqWvg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726881744; c=relaxed/simple;
	bh=QEhQ00cxqrl1PMxw1SvPiMUKZkROL8cqajgSsFplrfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Loorm8KX4nK9knJzgXVjulTZDGonnKYlrGn/0f9Gw6QM80lP2oU5/stUmsCvyuen1a+390mNn9kSwHKuRzM4xiIehOCgMg2NzRYqTY5DhFIsmHKx+VuLYb9LmcGDPEeHlXphpRvjdWMiD2f/wobsGTZVBlKgeIsGwYbtbxLjAr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNMlQQzE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNMlQQzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726881742; x=1758417742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QEhQ00cxqrl1PMxw1SvPiMUKZkROL8cqajgSsFplrfQ=;
  b=mNMlQQzE81dCY1DHDu52gJpsrO9pnISFncbcne2OncULJr4F0q39ZxNy
   gy6Le8ECmPH+t1KCEmEdjIOSpZngNxCXEA2MiZ+pvLwsmOUf2+nAvuoAw
   1SEMyDPcOG+Ydch9DGsYTRcl9x80fFjo0nTQseYqQnpZDGfh5HaY6Whqi
   vEFM4hJ8sn005XPVlsIo9YwkHpOcYCCIBpBNHNhDAwqnDiJRbir9r+OWA
   R7kjShDitHZBUrJ69NxYVR+zFrGQRf3nxGTLr8vWqQUjU0YDx34b7qaNM
   okudRUOGpmNzWc5q2+FHcgJZ0x1Slyv4+4oHxxXiA26Svuitb7QRDP8nR
   g==;
X-CSE-ConnectionGUID: cAi8pLgRQe2hsxJYn2gaGA==
X-CSE-MsgGUID: PXd52+vJQgSyzOmj9+dkAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37276758"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="37276758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 18:22:21 -0700
X-CSE-ConnectionGUID: MU6wUpRPQlSuboEXtUE20Q==
X-CSE-MsgGUID: +jrfaZVGQhS4TGpcOCq2Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="93810646"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2024 18:22:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sropG-000F19-25;
	Sat, 21 Sep 2024 01:22:18 +0000
Date: Sat, 21 Sep 2024 09:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:ftrace/stress-test 1/1] kernel/trace/fstress.c:28:15: error:
 no member named 'trampoline' in 'struct ftrace_ops'
Message-ID: <202409210924.zNifo21M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git ftrace/stress-test
head:   3c154bddff894d321f1e43f1eec711a477f44bf9
commit: 3c154bddff894d321f1e43f1eec711a477f44bf9 [1/1] HACK: ftrace stress test
config: x86_64-randconfig-r122-20240921 (https://download.01.org/0day-ci/archive/20240921/202409210924.zNifo21M-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210924.zNifo21M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210924.zNifo21M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/fstress.c:28:15: error: no member named 'trampoline' in 'struct ftrace_ops'
      28 |                 (void *)op->trampoline,
         |                         ~~  ^
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> kernel/trace/fstress.c:29:7: error: no member named 'ops_func' in 'struct ftrace_ops'
      29 |                 op->ops_func,
         |                 ~~  ^
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> kernel/trace/fstress.c:30:7: error: no member named 'managed' in 'struct ftrace_ops'
      30 |                 op->managed);
         |                 ~~  ^
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   3 errors generated.


vim +28 kernel/trace/fstress.c

    13	
    14	static void dump_ftrace_ops(struct ftrace_ops *op)
    15	{
    16		pr_warn("%ps = {\n"
    17			"  .func = %pS\n"
    18			"  .flags = 0x%lx\n"
    19			"  .saved_func = %pS\n"
    20			"  .trampoline = %pS\n"
    21			"  .ops_func = %pS\n"
    22			"  .managed = %pS\n"
    23			"}\n",
    24			op,
    25			op->func,
    26			op->flags,
    27			op->saved_func,
  > 28			(void *)op->trampoline,
  > 29			op->ops_func,
  > 30			op->managed);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
