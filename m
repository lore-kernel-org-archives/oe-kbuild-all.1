Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB5241669
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578871; cv=none; b=QNYEkrouXsfdueSA4IHu98JvZO2saRfXOjvnINiWia6x0rOOFdRLUp7zZgG0lczFXuPNN7dliXyW2tnrJpfOEIvOxF1/BbzY2Jlsex7K7/cJ45F5QBc3knRfKZ1rbfJhvHfFIQdH2MaF6RMNyv6kxCST8QMHUMVb53Gqbea8XiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578871; c=relaxed/simple;
	bh=AMakDFMDNJbdC4z+Pn0XMo5M0PbI2HAGiBL7QxvN3IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSWcvjWGf0q63q8QtmapWQfidEJmTZ1KeGE2Ebuw5kN/7sny44YiF9Uhtuu6OnwQwe1+cqTKM5AU0ahJ8zjPYArs0h8Q0SkBIFzonbtV5i+rnMEytZvpfuDv8f46UJNH1EJp6g99OymnxchgSMloJ6wFlnPxvZknQQtMr2cj8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfFDYreS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfFDYreS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745578869; x=1777114869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AMakDFMDNJbdC4z+Pn0XMo5M0PbI2HAGiBL7QxvN3IY=;
  b=BfFDYreSEvcx9v+pRqzYGb2vqb7wpZGrqcjSYSTKrLTZp152U3SujIiQ
   ZDTx9aEQTzauu+Bgr6wJd1klTRi82cKYmbgoBsFauaayXOHXZu6OorZ5T
   b8m+YvrVtq9ds9QLDDg4uhoyrIfSkoK4A2S8N5ieYOQlwUTS7r1wON/b9
   JH3m+IRYxmMDwXKH7zseuBEqYZZ1tmvUzpNk41zfxpcY/mfY0TOhcGTFJ
   11ApP9aS7euKfGhWmU6iqllpCiM3ovX4QTRjXnlHqiB45mdK99Vwfzdrx
   Nr6gkRSBNBZPfLmqSTgrq+C17a29basd4A1SGOlMn5Ih+dt+y4T5Yr6LS
   Q==;
X-CSE-ConnectionGUID: lR5UerH1R7GUuHPq5ai+KA==
X-CSE-MsgGUID: BP7r6XCYR7a/r+JqRkMaWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46357621"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46357621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:01:06 -0700
X-CSE-ConnectionGUID: NuiKqkVgQ6S55JLkYBpzEg==
X-CSE-MsgGUID: sm5dz20qQVeB4nwOqJfE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137965781"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 04:01:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Gnm-00056H-2T;
	Fri, 25 Apr 2025 11:01:02 +0000
Date: Fri, 25 Apr 2025 19:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510]
 kernel/livepatch/core.c:1013:12: warning: no previous prototype for function
 'arch_klp_func_can_patch'
Message-ID: <202504251813.iV5Qk4NO-lkp@intel.com>
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
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: 7e2ab91ea07673f855f16b54b7c6e6853b2efc1c [1510/1510] livepatch/x86: support livepatch without ftrace
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250425/202504251813.iV5Qk4NO-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251813.iV5Qk4NO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251813.iV5Qk4NO-lkp@intel.com/

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

b700e7f03df5d9 Seth Jennings 2014-12-16  1011  
453d38459f9441 Cheng Jian    2019-01-28  1012  #ifdef CONFIG_LIVEPATCH_WO_FTRACE
453d38459f9441 Cheng Jian    2019-01-28 @1013  int __weak arch_klp_func_can_patch(struct klp_func *func)
453d38459f9441 Cheng Jian    2019-01-28  1014  {
453d38459f9441 Cheng Jian    2019-01-28  1015  	return 0;
453d38459f9441 Cheng Jian    2019-01-28  1016  }
453d38459f9441 Cheng Jian    2019-01-28  1017  #endif
453d38459f9441 Cheng Jian    2019-01-28  1018  

:::::: The code at line 1013 was first introduced by commit
:::::: 453d38459f94417d9d5db7b75ed181a932e34ffc livepatch/arm64: fix func size less than limit

:::::: TO: Cheng Jian <cj.chengjian@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
