Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C74D8BEE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733033600; cv=none; b=lxd8bSRAvi8AzjrJOkXqql2Yc2ax+m05J9GATpHlZ+L9OjOFiM0jj07QyOdI5F1GertJBnfC7nbctHJimTg+liATPtNphOFM3lND6xvZMQUkeTHPvN+5nDK2Z/G/k+yaNUdhErUWDaNhTF2Nqq2LmFfhvPbTi1n/UaRHLOvWThs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733033600; c=relaxed/simple;
	bh=I0fWQaZfZLiXLzoQZB0Jo61ydf9Yxt9Qs+PdxVcrUUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Syh/1iBBMm4Mc2TBMxWZ4NrdMVlsdYZznQmveP8uewXieojK7M2WwRzuLyOvUiQAWG/fTscSArvSA1xEknzZfLtSrx/J3NTUpwVB1tK5OI5Q9xkVmte0N/3bqhcqRYirc669XEi3llhWlozolGgWRqG6peEfphsB4NjmtXIa1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=McmPNLhA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McmPNLhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733033597; x=1764569597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0fWQaZfZLiXLzoQZB0Jo61ydf9Yxt9Qs+PdxVcrUUE=;
  b=McmPNLhAeVMXKfNnJlPy/D1kPt0PsSanaHrlWP1UYDiuEnwo5GBK5aiV
   NSE1O/Pthcvol7ZbxvzwyklLwSaTBYGg3/STPsC2ACdOVc1Edf3uRVW3C
   +oZFDyhO2MIYepCfOrwDi86EisiBFa11hG5geSFwDsGJqe6YZts0lBQNh
   g6056LfKcrZQfBWUvqdVTwJdNJAtMg3IzGyRL34Hsfj8UvUwa8qkCiG0e
   30WgveSQoMIjJe5fj6EClRbBDvWv5NGHCcN+tjGWhnZ8GHVaPPsbME5l8
   2pvW1ovwhu55V7BX4LA0elPejmAo9bzFpazWnXcKuh5IPICyaN3xfCdhp
   w==;
X-CSE-ConnectionGUID: Fg2zY1ARTVmVsGgCl5FZlA==
X-CSE-MsgGUID: hMm4S2ukTS+vHwYKi14sxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32569501"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="32569501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 22:13:17 -0800
X-CSE-ConnectionGUID: iiRD/yj9SsWgAr3nWfvyqA==
X-CSE-MsgGUID: qvw4GoBoTIydMrORNxpykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="93630846"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Nov 2024 22:13:15 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHdCj-0001Ib-0g;
	Sun, 01 Dec 2024 06:13:13 +0000
Date: Sun, 1 Dec 2024 14:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, laokz <laokz@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:216:13:
 warning: no previous prototype for function 'arch_klp_skip_resolve'
Message-ID: <202412011403.Lq5H9rrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi laokz,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: b8f3220637be1736c165c289c634f27841ac4e01 [1474/1474] livepatch: add arch hook before doing klp_resolve_symbols
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241201/202412011403.Lq5H9rrB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011403.Lq5H9rrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011403.Lq5H9rrB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:97:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
   int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
              ^
   kernel/livepatch/core.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
   ^
   static 
>> kernel/livepatch/core.c:216:13: warning: no previous prototype for function 'arch_klp_skip_resolve' [-Wmissing-prototypes]
   bool __weak arch_klp_skip_resolve(unsigned int type)
               ^
   kernel/livepatch/core.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool __weak arch_klp_skip_resolve(unsigned int type)
   ^
   static 
   kernel/livepatch/core.c:1767:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
              ^
   kernel/livepatch/core.c:1767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
   ^
   static 
   kernel/livepatch/core.c:2022:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
   void __weak *arch_klp_mem_alloc(size_t size)
                ^
   kernel/livepatch/core.c:2022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak *arch_klp_mem_alloc(size_t size)
   ^
   static 
   kernel/livepatch/core.c:2027:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
   void __weak arch_klp_mem_free(void *mem)
               ^
   kernel/livepatch/core.c:2027:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_mem_free(void *mem)
   ^
   static 
   kernel/livepatch/core.c:2032:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_prepare(void)
               ^
   kernel/livepatch/core.c:2032:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_prepare(void)
   ^
   static 
   kernel/livepatch/core.c:2036:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_post_process(void)
               ^
   kernel/livepatch/core.c:2036:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_post_process(void)
   ^
   static 
   kernel/livepatch/core.c:2049:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
              ^
   kernel/livepatch/core.c:2049:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
   ^
   static 
   kernel/livepatch/core.c:2063:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
               ^
   kernel/livepatch/core.c:2063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
   ^
   static 
   9 warnings generated.


vim +/arch_klp_skip_resolve +216 kernel/livepatch/core.c

   214	
   215	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
 > 216	bool __weak arch_klp_skip_resolve(unsigned int type)
   217	{
   218		return false;
   219	}
   220	#endif
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
