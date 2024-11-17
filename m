Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C2161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 01:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731808173; cv=none; b=VlZzAfO7LVKB0aMPF9vh+sfE5k8bAuS4XnqCmGhanUxln0szl/UdMYnMSldnuItiyxgP5WbUT5d3P45d3vIeowY4pdXOu/xjyoCVnTV9Q3KQ2LTx8F0HTBk7Itr0Q16P2PqW1OkwbtphPinpjTMgFJ90iZSYKURv9+0ixCJWl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731808173; c=relaxed/simple;
	bh=9SiZfx+gGajjgHZGLc5SDshhTU5O87e+29hU+F/iqDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sEQ+FMerdijPp/9UZdS3/8TpzT6FXkz4xvusIdUkr7j9DRmBvnBzoUCPiUJsPwQiPyUbbmBIWfRFgHRZ2117tJMLKuobTgv/ZagKMLP3jzQ+Ivbmpunm8xrcs5y/VILHkRmBnXqGAfsU2sHyZSgjYhSpEq7UOa7vCKIk8UWgggw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvE8ZACs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvE8ZACs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731808172; x=1763344172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SiZfx+gGajjgHZGLc5SDshhTU5O87e+29hU+F/iqDI=;
  b=JvE8ZACs9fI0EREXAUrw6rTrf7ulMfEyKdDYewVLoLiWJ2ktyXDKjdPq
   QaWRQ8fpRCAc/rgj8arwDL8B+kKM2aQONTR31EobJP3knkse5Qy69IKnA
   JeogrADVKTfj3klomJ6MvqK9r8shclrWqDi0U6cacGeiJMYdvGJPJCyOa
   +1ks72LyZmv1gGRrH+gZ0Mw9zJYudU1Zlo113uQG6k7FIu1bLoJcgoP6T
   KgTe5NS5XIzfB6J6gwGlkqeyQr3r4fm20yryzf8tHV6k96WEfh+1bkamq
   c5qWryEWflQhhKGmd2qQWJmb9rxG3GCKuesl6Lwba/k2/nA7+k4nMtZOp
   Q==;
X-CSE-ConnectionGUID: 08u0fjntQDW+tMQTOJEUxA==
X-CSE-MsgGUID: B7NhWgRcQcO60NjB9KMyAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="34652254"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="34652254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 17:49:31 -0800
X-CSE-ConnectionGUID: U5/RmNjoTaG5slqZ4p0vzQ==
X-CSE-MsgGUID: 3TgyCPCIR1S18Av9LKhHXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88655768"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 17:49:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCUPn-0001DZ-0q;
	Sun, 17 Nov 2024 01:49:27 +0000
Date: Sun, 17 Nov 2024 09:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:2006:12:
 warning: no previous prototype for function 'arch_klp_check_breakpoint'
Message-ID: <202411170907.1enJR1qQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 470628a716984e1325b92bef4fa2140ff5a062a5 [1474/1474] livepatch: Use breakpoint exception to optimize enabling livepatch
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170907.1enJR1qQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170907.1enJR1qQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170907.1enJR1qQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:1728:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
              ^
   kernel/livepatch/core.c:1728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
   ^
   static 
   kernel/livepatch/core.c:1983:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
   void __weak *arch_klp_mem_alloc(size_t size)
                ^
   kernel/livepatch/core.c:1983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak *arch_klp_mem_alloc(size_t size)
   ^
   static 
   kernel/livepatch/core.c:1988:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
   void __weak arch_klp_mem_free(void *mem)
               ^
   kernel/livepatch/core.c:1988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_mem_free(void *mem)
   ^
   static 
   kernel/livepatch/core.c:1993:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_prepare(void)
               ^
   kernel/livepatch/core.c:1993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_prepare(void)
   ^
   static 
   kernel/livepatch/core.c:1997:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_post_process(void)
               ^
   kernel/livepatch/core.c:1997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_post_process(void)
   ^
   static 
>> kernel/livepatch/core.c:2006:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
              ^
   kernel/livepatch/core.c:2006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
   ^
   static 
   kernel/livepatch/core.c:2011:12: warning: no previous prototype for function 'arch_klp_add_breakpoint' [-Wmissing-prototypes]
   int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
              ^
   kernel/livepatch/core.c:2011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
   ^
   static 
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for function 'arch_klp_remove_breakpoint' [-Wmissing-prototypes]
   void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
               ^
   kernel/livepatch/core.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
   ^
   static 
>> kernel/livepatch/core.c:2020:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
               ^
   kernel/livepatch/core.c:2020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
   ^
   static 
   9 warnings generated.


vim +/arch_klp_check_breakpoint +2006 kernel/livepatch/core.c

  2005	
> 2006	int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2007	{
  2008		return 0;
  2009	}
  2010	
  2011	int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2012	{
  2013		return -EOPNOTSUPP;
  2014	}
  2015	
  2016	void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2017	{
  2018	}
  2019	
> 2020	void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
  2021	{
  2022		func_node->brk_func = new_func;
  2023	}
  2024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
