Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0792882AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439733; cv=none; b=Hb30C6zTKM8YRIoQzI24tKQmHoihLwRxtOgg2RjgYylWY9weSOxbqBaq08UKg8nHDmjbBcFW8vV86mRHmd0eeC6FAtnE5mk5Dc1au5LjNMS2xCN1KwxeJSqS5gjkzvPxkuzrVFzvcJ3yCorZzXnoea8vcqa9P2IStYAWN1nOTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439733; c=relaxed/simple;
	bh=4kHHJ3C30tgXCc5ZcfoPVt28SHcxuEvJgC/hwI+NeZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CH5YDACszPs9WXTz/js/isSf0vDgvbY1mhsJqUlihk/pmBJ6W7QKLpi2Hrkd16/Cn8OaWI/amTRzR6Ustw3u2b/hLV6mPRTf8UMdenDhtu7SlhUS3NwVrW4KcbYRibbt+Z54uxe4QQbGr5LEo5q/qnKv7kclDJNgyOva6Melh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG9cWsHx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG9cWsHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748439732; x=1779975732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kHHJ3C30tgXCc5ZcfoPVt28SHcxuEvJgC/hwI+NeZo=;
  b=mG9cWsHxq2j8J/JK9+g48CE5W3cWvSDlijbRRJqDI2UIKGIfcwQg+YsD
   vXfgSpf5qYF4wj5MYUWyWjzKrrmaIqiXGhvRiKp36uWj2Qf7xZ/6pX/o7
   1pF2WJwjabnAtNgm1hhnvbQXAXI8HbbJ2hzMTTvYudd8hx8TW+8nRMzVi
   bPAvW/4bD9tJqSMFo9CjgL6eKMrxoBJTn7kb9uExnWZX9lhSOXKS53SvA
   8dUulHKozmFJD31rlkZ3wyQeGv1GjrmhpoUIYQpMBMfyWgbv2hgRa9VMe
   9DYPNtM6D9HqSv1IZiF8UFjY5/qVvZHTjwQi8EINPaT/c53UyAuOxjbi7
   Q==;
X-CSE-ConnectionGUID: gew7PonLT3S1KQmd2h937g==
X-CSE-MsgGUID: oQILCQXUTAu+HykM10lBRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49579837"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="49579837"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:42:11 -0700
X-CSE-ConnectionGUID: Qo+8DIdUQkidp2/DLRWupQ==
X-CSE-MsgGUID: bQII9sWKRTC/62YZjxkxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="147126087"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2025 06:42:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKH2l-000Via-2A;
	Wed, 28 May 2025 13:42:07 +0000
Date: Wed, 28 May 2025 21:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510]
 kernel/livepatch/core.c:1013:12: warning: no previous prototype for function
 'arch_klp_func_can_patch'
Message-ID: <202505282149.4WfmWgTw-lkp@intel.com>
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
head:   5ae76523ccf96ec8b8d73d541e305bf15b6b697e
commit: 7e2ab91ea07673f855f16b54b7c6e6853b2efc1c [1510/1510] livepatch/x86: support livepatch without ftrace
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250528/202505282149.4WfmWgTw-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282149.4WfmWgTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282149.4WfmWgTw-lkp@intel.com/

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
