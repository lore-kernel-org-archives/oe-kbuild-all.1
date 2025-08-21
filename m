Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72B6270553
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789678; cv=none; b=Sz0o98q5IN/8qcV6yNpOJo/txwMsSjEaqLs7/FXxIWyGyCTvigmtmvTcZWuDz/BIgQEJ6iGEkWKeEKOnZcILWrvQLmdF1DReivGyKG9+/dPe5k1O1K5Re7DBvfCkK9VMl0JTCYZM9pPbay60bd5j+h33e/h34/FckEqH4n3jKCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789678; c=relaxed/simple;
	bh=mfHX1KMyIyhUI/9RJGI702GjkFKp6oikLwwikrOvU18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNUZv/bBbww9MvlSfKwPrTGAQ5HlCiA7io6bwo3aSv5Au5KQ361MMPWqp9ntNw7n5/Ho5bciNJ10vvIXtJKtwL9SBoPKRnjjy/JGOgm5BjdVW4zU/Icj09T55WWopXeiv/DfyFtxxvvRxJcQw0iBhq8l52fBkg2vznaLUhA+bN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pm1II5b8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pm1II5b8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755789676; x=1787325676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mfHX1KMyIyhUI/9RJGI702GjkFKp6oikLwwikrOvU18=;
  b=Pm1II5b8GHsQQDlIb62FajmJZUEWsrEfDAQEIaaHwr2iFoupSzTNxFmy
   FuX6UaH135m1oWmPmI2EnGRD+eHHBc8G0Ky1t9jz2Ojx060F+Tswv22Vm
   zO9lRo5FyM7oE3uijKqOhALg4vcauLw/hKH54qJXnZuEzPezKAJQzX2kZ
   iaJn9aAzv+45SX+8IxvVVAAh09A577N99TzSo06bnxDfEFgoukkEqYnwO
   EyK42/8YTZIEcLY8aeylxvqRTCBadEP1YsGvQDEkIzgopq7yS3aAhOyt1
   II/iRkxb7Yt8cyEItNeYjWPPUsJKIFb+m79AsR0bsv7i1jVUvVfTcq+lW
   w==;
X-CSE-ConnectionGUID: ZqMM8Xh+S763C/WXmg+CQg==
X-CSE-MsgGUID: 7Zvf1VYKTWmNZTquLzarQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68354758"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68354758"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:21:16 -0700
X-CSE-ConnectionGUID: 7Zbk+WNXRqipmybuSGrEoQ==
X-CSE-MsgGUID: riLBg9QxRGClYAJ7ffWkoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168858211"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2025 08:21:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up76B-000KQf-1E;
	Thu, 21 Aug 2025 15:21:08 +0000
Date: Thu, 21 Aug 2025 23:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2700/2700] kernel/livepatch/core.c:2006:12:
 warning: no previous prototype for function 'arch_klp_check_breakpoint'
Message-ID: <202508212350.cdtYa1wJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   65a146fa77b5cff9bb07725ed7ccabb9670bfb54
commit: 470628a716984e1325b92bef4fa2140ff5a062a5 [2700/2700] livepatch: Use breakpoint exception to optimize enabling livepatch
config: arm64-randconfig-001-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212350.cdtYa1wJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212350.cdtYa1wJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212350.cdtYa1wJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/livepatch/core.c:17:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/livepatch/core.c:1728:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:1983:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:1988:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1988 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1988 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1993:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1993 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1993 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1997:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1997 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1997 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
>> kernel/livepatch/core.c:2006:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2011:12: warning: no previous prototype for function 'arch_klp_add_breakpoint' [-Wmissing-prototypes]
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for function 'arch_klp_remove_breakpoint' [-Wmissing-prototypes]
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |             ^
   kernel/livepatch/core.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2020:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:2020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   10 warnings generated.


vim +/arch_klp_check_breakpoint +2006 kernel/livepatch/core.c

  2005	
> 2006	int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2007	{
  2008		return 0;
  2009	}
  2010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
