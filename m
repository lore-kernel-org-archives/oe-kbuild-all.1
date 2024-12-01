Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365871BC5C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733025485; cv=none; b=eaVy4mct4c66TyiwqcNJqMK7p2HYIWoXn/+k1AR7Vsc3Bq/HHXtQdR6fWCPSxsIxJDE0ZZY8643+Iu/yrHVcHOsAFZblPzqUyvQyWv2fSLvVGYCfMxP/cJiYz9PRysA7M5qMjxSXpv9m7u9MpJdDZsVOzQ1vZKztMNzl0q3VLRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733025485; c=relaxed/simple;
	bh=pa0F635w48338qtLAzHtskVyXTXa+xiEacSC7VpVfZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGxw7HLCp2vk4PWw/el7CeBCefl+5BoIFCFs/ixd4BE+vst2LReAY8rt7SuJozmElIWd4gnRRpAm6jsiG4lygaMJeG7qn0ioB/s8OUlt4GgaA8mgKsOi0oeDEUblX/ftnz6UBP0mo5i2/O5q0Vadzb9wanKW/oTd0HXn06TSVFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccnfNQM1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccnfNQM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733025483; x=1764561483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pa0F635w48338qtLAzHtskVyXTXa+xiEacSC7VpVfZM=;
  b=ccnfNQM1xo3LNYSs3zexDg2HwqGX7XlMxjpldLeqNbGBZxRDDQ7z4pwI
   /RQZKsiRad/qO0N8x3RQcgnao1YzclCjRjUb8+KvYrIlTXGygYrVwkchr
   fuk4fdxpcMjxzpBfEVFhb4wzS8e8LSsCzmfGGcCOjjvq0cnPSANEBZ6+U
   X2eoyA64tkeaQwb/WvpMTq/D3Iwc33SGk5mKtOwrTZ5x66N6M1cNXXPLD
   MoPdKi9YsYLLSXAnxm9EPGzpT+9vEFZw6d3+b8Kvwn+cdOPITOG/wyLlb
   5SWbFYdLBPCF6ENfbqE25PrlOIHKG75nCf2O3cLS1fR9nbW/5vdIjFSMi
   Q==;
X-CSE-ConnectionGUID: 1cPolg7fQyqk1Vf0HeLBUw==
X-CSE-MsgGUID: EfijDUtnTZ+LN5ipxgzliw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36067654"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="36067654"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 19:58:00 -0800
X-CSE-ConnectionGUID: +Mr26FEnTC+2Nw3IWzVUqg==
X-CSE-MsgGUID: rGRqjQmMRdWHk4aBeYY6ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="116060268"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Nov 2024 19:57:59 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHb5o-0001DJ-2q;
	Sun, 01 Dec 2024 03:57:56 +0000
Date: Sun, 1 Dec 2024 11:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:2006:12:
 warning: no previous prototype for function 'arch_klp_check_breakpoint'
Message-ID: <202412011107.mRfBU6d7-lkp@intel.com>
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
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 470628a716984e1325b92bef4fa2140ff5a062a5 [1474/1474] livepatch: Use breakpoint exception to optimize enabling livepatch
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241201/202412011107.mRfBU6d7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011107.mRfBU6d7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011107.mRfBU6d7-lkp@intel.com/

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
