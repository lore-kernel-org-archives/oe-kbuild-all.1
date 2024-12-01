Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F754277
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733061873; cv=none; b=O0TtBFngRx3dE5GYTFoN6MJJi1C3yCJIUEA8uDqK18ar61PSrPMbMnWKM/c7I9k9pSgIPLZW0CT96iBpP08b53vo4L9QQsdahYedjDdOQmnL5mFHtasyIaxoidhakxW5e+AzOiilGuWrsohXC9tIjeW61ggYR8P1l8LLmpezVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733061873; c=relaxed/simple;
	bh=YjfK6AgVCw6sfyHmoO0ylmnlX/NffQAFrv0ZyltAiJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhreM1grHYLodgGnJlNwNoNJMm4GDnDOFQvQ1Un48VZVLnsQ6e3NAJV3Wh79ZsZv6dspfr11klgqbb0NP5JlPesA2f8zhXvi0cu2ES7r0Tj1Pa4v4/94G2zGa+kM0ioSkm5e3dj/oUsneD6zj6EFiE229lvLl+IoEUZI4BP1glQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpTm00cW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpTm00cW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733061872; x=1764597872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjfK6AgVCw6sfyHmoO0ylmnlX/NffQAFrv0ZyltAiJs=;
  b=HpTm00cWpix6RzRbk6klvRfleDHjxXJxlUyDX5swN7vrA7u7t485+70R
   8ZNRbkTwKbnLDfOssKDTRJAszzz9nE06/EhhtHHcLaEmlPjbAedOqm8wM
   BAycYHgLLhlOLp/UcwvWoHB8p27abTp4jJrKURJmEGTAbY17lHZ/Ug9TF
   wd4Ywbb53m7vYveh26rkhhH0xFCTyED2uahzJ1dvlkj7Rty9dX2fFdSw8
   tQzgZ8SZMwGmTkwptBStzR7Wu+StZvwvyVqyCmqv1XtJo4O78eLMsRuAK
   +7LkJ0t6SCq5tTxsWI7CkYfK6jl5loJnHFeN5Ygo0iDQxpr6HZAzC2T8z
   g==;
X-CSE-ConnectionGUID: R6In14Y2RTe4sXNOeDb5rw==
X-CSE-MsgGUID: 3fAnEqAgQc2lWiIqI2lFjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="37166444"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="37166444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 06:04:31 -0800
X-CSE-ConnectionGUID: ZzdKNYwlS3K8zOW1+qoxFQ==
X-CSE-MsgGUID: 4cl4hyHwTlyrDL+HGM3Drg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97645636"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2024 06:04:30 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHkYl-0001Zk-2r;
	Sun, 01 Dec 2024 14:04:27 +0000
Date: Sun, 1 Dec 2024 22:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 605/605] kernel/livepatch/core.c:75:16:
 warning: no previous prototype for function 'klp_check_patch_kprobed'
Message-ID: <202412012256.7lliU69f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 7e2ab91ea07673f855f16b54b7c6e6853b2efc1c [605/605] livepatch/x86: support livepatch without ftrace
config: x86_64-randconfig-073-20240521 (https://download.01.org/0day-ci/archive/20241201/202412012256.7lliU69f-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012256.7lliU69f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012256.7lliU69f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:75:16: warning: no previous prototype for function 'klp_check_patch_kprobed' [-Wmissing-prototypes]
      75 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         |                ^
   kernel/livepatch/core.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         | ^
         | static 
   kernel/livepatch/core.c:402:5: warning: no previous prototype for function 'klp_try_disable_patch' [-Wmissing-prototypes]
     402 | int klp_try_disable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:402:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     402 | int klp_try_disable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:441:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
     441 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:441:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     441 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:445:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
     445 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:445:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     445 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   kernel/livepatch/core.c:617:5: warning: no previous prototype for function 'klp_try_enable_patch' [-Wmissing-prototypes]
     617 | int klp_try_enable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:617:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     617 | int klp_try_enable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1013:12: warning: no previous prototype for function 'arch_klp_func_can_patch' [-Wmissing-prototypes]
    1013 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:1013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1013 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         | ^
         | static 
   6 warnings generated.


vim +/klp_check_patch_kprobed +75 kernel/livepatch/core.c

7e8d223e3ef865 Cheng Jian 2019-01-28   69  
c8f9d7a3aae362 Cheng Jian 2019-01-28   70  #ifdef CONFIG_LIVEPATCH_RESTRICT_KPROBE
c8f9d7a3aae362 Cheng Jian 2019-01-28   71  /*
c8f9d7a3aae362 Cheng Jian 2019-01-28   72   * Check whether a function has been registered with kprobes before patched.
c8f9d7a3aae362 Cheng Jian 2019-01-28   73   * We can't patched this function util we unregisted the kprobes.
c8f9d7a3aae362 Cheng Jian 2019-01-28   74   */
c8f9d7a3aae362 Cheng Jian 2019-01-28  @75  struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
c8f9d7a3aae362 Cheng Jian 2019-01-28   76  {
c8f9d7a3aae362 Cheng Jian 2019-01-28   77  	struct klp_object *obj;
c8f9d7a3aae362 Cheng Jian 2019-01-28   78  	struct klp_func *func;
c8f9d7a3aae362 Cheng Jian 2019-01-28   79  	struct kprobe *kp;
c8f9d7a3aae362 Cheng Jian 2019-01-28   80  	int i;
c8f9d7a3aae362 Cheng Jian 2019-01-28   81  
c8f9d7a3aae362 Cheng Jian 2019-01-28   82  	klp_for_each_object(patch, obj) {
c8f9d7a3aae362 Cheng Jian 2019-01-28   83  		klp_for_each_func(obj, func) {
c8f9d7a3aae362 Cheng Jian 2019-01-28   84  			for (i = 0; i < func->old_size; i++) {
c8f9d7a3aae362 Cheng Jian 2019-01-28   85  				kp = get_kprobe((void *)func->old_addr + i);
c8f9d7a3aae362 Cheng Jian 2019-01-28   86  				if (kp) {
c8f9d7a3aae362 Cheng Jian 2019-01-28   87  					pr_err("func %s has been probed, (un)patch failed\n",
c8f9d7a3aae362 Cheng Jian 2019-01-28   88  						func->old_name);
c8f9d7a3aae362 Cheng Jian 2019-01-28   89  					return kp;
c8f9d7a3aae362 Cheng Jian 2019-01-28   90  				}
c8f9d7a3aae362 Cheng Jian 2019-01-28   91  			}
c8f9d7a3aae362 Cheng Jian 2019-01-28   92  		}
c8f9d7a3aae362 Cheng Jian 2019-01-28   93  	}
c8f9d7a3aae362 Cheng Jian 2019-01-28   94  
c8f9d7a3aae362 Cheng Jian 2019-01-28   95  	return NULL;
c8f9d7a3aae362 Cheng Jian 2019-01-28   96  }
c8f9d7a3aae362 Cheng Jian 2019-01-28   97  #else
c8f9d7a3aae362 Cheng Jian 2019-01-28   98  static inline struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
c8f9d7a3aae362 Cheng Jian 2019-01-28   99  {
c8f9d7a3aae362 Cheng Jian 2019-01-28  100  	return NULL;
c8f9d7a3aae362 Cheng Jian 2019-01-28  101  }
c8f9d7a3aae362 Cheng Jian 2019-01-28  102  #endif /* CONFIG_LIVEPATCH_RESTRICT_KPROBE */
c8f9d7a3aae362 Cheng Jian 2019-01-28  103  

:::::: The code at line 75 was first introduced by commit
:::::: c8f9d7a3aae362482f81ba7c6819d410d66619ab livepatch/core: Restrict livepatch patched/unpatched when plant kprobe

:::::: TO: Cheng Jian <cj.chengjian@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
