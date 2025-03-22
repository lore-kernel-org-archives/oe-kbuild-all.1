Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF3E3FD1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 00:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742603097; cv=none; b=L+5KYuI5HFUbNhB1t+ivIsTGmy+zKc+rhpyODQQWYmEN2U8bte8hTL3SIMXBM0zjlnmFryvRIw5QE/EcRfB93y+duE/ALcJM5CWGhDU6ApXjskJjINsbcOh2fyr+kEk3aK7qVWpG/gfrmiBUGzwgY8zpBt6D1k2eAUFx70ILpr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742603097; c=relaxed/simple;
	bh=ev83QMg24uRY/E8FLIYXeUS8ievnliYHzQGDjUGbyBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMCIQ3kTCitDCznbu8BJY1i7rsBnTgUGOBDDH5+OlFE7ClAtso3IW/0ziWLr11FFAF0bZoa7sCU8ybOC7RSJyVw359EmXmJh3aBlLmWOFT8JKD0RFqKlTF9cJTa+I020mvdQSWR1Vj0ReA1SnZ8ZC2qmeHYiip5St+08jSpj8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oao56bdY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oao56bdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742603096; x=1774139096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ev83QMg24uRY/E8FLIYXeUS8ievnliYHzQGDjUGbyBQ=;
  b=Oao56bdYhov/RdVR0UjsFDADTm6k0WuFGKpomefA4Z3wAP1KggjEbFGx
   PdSkjzFl70I4hVR2UHm2Ab4B48aD5sNTgzmwCJ5Kv0nRYcOlyRfwtPTRb
   GQfkLvSKbw6IdHJhHABxbyymPkuoYtIw3XRhcU3gv3G+uK8JdAwnB4Cww
   LN999P4BjagFl9ftY6neQvSdeMEwNXR8x5FjRpGDd+gqGMXrduFlt4BHZ
   e3ZCMxnMYPykKAl1C0kzkOMK2SHkWUKm3TADc8inZpcQG74gRk61C9C5u
   l70CPjKkUDvmJkhtSktZbZTPK980vcO6h9315DmP0gGCRuHJYphIel6bT
   g==;
X-CSE-ConnectionGUID: lGE3G3tqQR6FUvX4UrAPKg==
X-CSE-MsgGUID: HIRn8zL6T3KXM2Us5cZQvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61276743"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="61276743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 17:24:55 -0700
X-CSE-ConnectionGUID: s63kIevQQO61R/Zmkgvk6g==
X-CSE-MsgGUID: NbjBMu6KRyedDcUX4Epi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128214162"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2025 17:24:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvmfA-0001nt-0h;
	Sat, 22 Mar 2025 00:24:34 +0000
Date: Sat, 22 Mar 2025 08:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510]
 kernel/livepatch/core.c:1013:12: warning: no previous prototype for function
 'arch_klp_func_can_patch'
Message-ID: <202503220808.5u1Nsd2B-lkp@intel.com>
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
head:   db5f05c237bbdb9b4d5862fc59bdbdafa8f72a73
commit: 7e2ab91ea07673f855f16b54b7c6e6853b2efc1c [1510/1510] livepatch/x86: support livepatch without ftrace
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220808.5u1Nsd2B-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220808.5u1Nsd2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220808.5u1Nsd2B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:75:16: warning: no previous prototype for function 'klp_check_patch_kprobed' [-Wmissing-prototypes]
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
>> kernel/livepatch/core.c:1013:12: warning: no previous prototype for function 'arch_klp_func_can_patch' [-Wmissing-prototypes]
    1013 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:1013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1013 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         | ^
         | static 
   6 warnings generated.


vim +/arch_klp_func_can_patch +1013 kernel/livepatch/core.c

b700e7f03df5d92 Seth Jennings 2014-12-16  1011  
453d38459f94417 Cheng Jian    2019-01-28  1012  #ifdef CONFIG_LIVEPATCH_WO_FTRACE
453d38459f94417 Cheng Jian    2019-01-28 @1013  int __weak arch_klp_func_can_patch(struct klp_func *func)
453d38459f94417 Cheng Jian    2019-01-28  1014  {
453d38459f94417 Cheng Jian    2019-01-28  1015  	return 0;
453d38459f94417 Cheng Jian    2019-01-28  1016  }
453d38459f94417 Cheng Jian    2019-01-28  1017  #endif
453d38459f94417 Cheng Jian    2019-01-28  1018  

:::::: The code at line 1013 was first introduced by commit
:::::: 453d38459f94417d9d5db7b75ed181a932e34ffc livepatch/arm64: fix func size less than limit

:::::: TO: Cheng Jian <cj.chengjian@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
