Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442883E47B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765751753; cv=none; b=uUzNaWD7yoKnzpW40slldXk0aZZvb88TVb5IZNgBgNcswWDe5C2iWc1rWOa+vT+1l7kzyIocMn/da0eewpaBv7iVvbt094sTpbohHjndtvxXpq/wp2S9+lD7rm3Jqy/qh3kOuKTxjwNfJywEG4IkV+j2zsAs61fYD8uGw40ZpVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765751753; c=relaxed/simple;
	bh=OFkQzxTDzsMGfctHlD49MoZ2kviHlOK4VE2S4z/hfRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGRwMv2dYChh49QHDBgb/O6yMH+0tCB2aF6SMqPRckJZD8xBfwEcCVuvY+zy375f6hGchg4+IvjiHRW3Q+rFD4n8wC68f+tAB3mWQJQ2TRBuaDlk0ZAsqxOyKrENzcRDyWdcFOSalfXMUdb5bNefXrtBUsjzkCwrn+swFWqztrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4KegLOZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4KegLOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765751752; x=1797287752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OFkQzxTDzsMGfctHlD49MoZ2kviHlOK4VE2S4z/hfRQ=;
  b=D4KegLOZLCbxW5xN0EaBlpOozOV4EkMSrsZeGB2dO1yJ+7Y/TJLGJgy+
   kIe0zDHRBwGEAXnF1PnxgCBSvJ531+VkNafc/lBzP2HKZ+BluTzSNQQGd
   ulFZAkKVl2dNylPvBO6qudUxEvamiqPfNU/ZtfYmjh96X/Z8plEtqWNeB
   oIAkkSTLVxmpfrl6DCxnZaiVhtDm1JUwD6Ur+h+nmbOg1A1zXD33V2zMu
   S3K2sRqRNDl69VsmA8StfDjtSvDW/TLhQ9luIooqd+V0Hkgd/U8ZpUjph
   2M+OWo5s3NMXQNs4dCXuQPF0+oszjdlxSidkeINeE3UgmB7y0rprxQLoQ
   g==;
X-CSE-ConnectionGUID: BWO7gsDrRpuX+UGJwTgL/Q==
X-CSE-MsgGUID: Buiq8oBmSP+PMALuYNEAyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78772693"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="78772693"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:35:51 -0800
X-CSE-ConnectionGUID: l5doj6tiRBWQIFb9N/Xshw==
X-CSE-MsgGUID: ejRzsqexQouolGqYAFpQew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202677835"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2025 14:35:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUugt-000000009SP-1uqM;
	Sun, 14 Dec 2025 22:35:47 +0000
Date: Mon, 15 Dec 2025 06:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/livepatch/core.c:97:12:
 warning: no previous prototype for function 'arch_klp_init_func'
Message-ID: <202512150621.RknROZUX-lkp@intel.com>
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
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: eabc33c6f2c91168537f10e9275b0921c9f78c45 [3541/3541] livepatch/ppc64: Implement livepatch without ftrace for ppc64be
config: arm64-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150621.RknROZUX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150621.RknROZUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150621.RknROZUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:97:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
      97 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         | ^
         | static 
   kernel/livepatch/core.c:1756:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1756 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1756 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:2011:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    2011 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:2011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2011 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    2016 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2016 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:2021:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    2021 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:2021:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2021 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:2025:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    2025 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:2025:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2025 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   kernel/livepatch/core.c:2038:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    2038 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2038:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2038 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2052:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2052 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:2052:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2052 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   8 warnings generated.


vim +/arch_klp_init_func +97 kernel/livepatch/core.c

    96	
  > 97	int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
    98	{
    99		return 0;
   100	}
   101	#endif /* CONFIG_LIVEPATCH_FTRACE */
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
