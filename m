Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9C29CE7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711207214; cv=none; b=S+vy+D2nfDA5VVyNHoZ+Cj+LedZ8yI1tPQ8at7FSNQOWijrUVlxIzE5LIE4irIn3ao1OTttw80NwGPWNE7EHQ7IZiJdZNGTasuKyruBwG6pl3xIcoQHW6tK0dBVY3uHBum3eqhKCaKxBDM66PCOR0j6nhOry1l4G0DdZd03smTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711207214; c=relaxed/simple;
	bh=cRFYz30RuYP53w6tFpibGzxMC/lYyrgVI/1j6bhxP3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1sSoN1z3KyqJn1fb6MmPd6ap/u+z6B4lQcW8P3vFj37z6K/fm1V88RCDpF3vGn8slpob2TO6HowbmBRjpWBCjjkE+CJy0cxX/gsAfHcFPWyD8zcWgPYkhi8vDIvnFK6mHb08RUpMU5Jp7CINNooFOx9cZYinI7crOfDtclaRPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBZbMZIp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBZbMZIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711207212; x=1742743212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRFYz30RuYP53w6tFpibGzxMC/lYyrgVI/1j6bhxP3o=;
  b=jBZbMZIpS0MqQnn8+n8931Ps10Om54x2cX33Teyvo4F/T13jwSdWg3Sh
   +w/Dztr8kog/st57hiuD5c/zN4o2Shj2uyYmsVALai15Uz1aaqwWOGv3l
   fSYcTlYcSi5HjSku/R5kmvXZbnKloOKHH1DKZljdBcuLzkViM0KvIJjfg
   F7wJmFyZi5BWRkH2kIAgQ4AwywklIxMjOtQ9YfA+fnBP8onW986NDbIhJ
   TCGFypbQB3QL1HBgPsa6Dup8/wLFH1CMuU7WewsTvN1OY2fv1458VZaY8
   x66yv6mc8uz9+qsdqv/X8pDxJnbbEw/SAHQ8GK0SgsdwOXR3eCzXUnKnC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6104677"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="6104677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 08:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15094215"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2024 08:20:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro3A7-000LFh-2i;
	Sat, 23 Mar 2024 15:19:59 +0000
Date: Sat, 23 Mar 2024 23:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13138/21930]
 arch/x86/kernel/livepatch.c:225:5: warning: no previous prototype for
 function 'arch_klp_init_func'
Message-ID: <202403232323.GK5ks0fh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   25bf6ba385a44e446068067e861e1b843f6174e2
commit: 7e2ab91ea07673f855f16b54b7c6e6853b2efc1c [13138/21930] livepatch/x86: support livepatch without ftrace
config: x86_64-randconfig-015-20240323 (https://download.01.org/0day-ci/archive/20240323/202403232323.GK5ks0fh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403232323.GK5ks0fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403232323.GK5ks0fh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/livepatch.c:225:5: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
     225 | int arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |     ^
   arch/x86/kernel/livepatch.c:225:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     225 | int arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         | ^
         | static 
>> arch/x86/kernel/livepatch.c:230:6: warning: no previous prototype for function 'arch_klp_free_func' [-Wmissing-prototypes]
     230 | void arch_klp_free_func(struct klp_object *obj, struct klp_func *limit)
         |      ^
   arch/x86/kernel/livepatch.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     230 | void arch_klp_free_func(struct klp_object *obj, struct klp_func *limit)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:258:6: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
     258 | void arch_klp_code_modify_prepare(void)
         |      ^
   arch/x86/kernel/livepatch.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     258 | void arch_klp_code_modify_prepare(void)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:264:6: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
     264 | void arch_klp_code_modify_post_process(void)
         |      ^
   arch/x86/kernel/livepatch.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     264 | void arch_klp_code_modify_post_process(void)
         | ^
         | static 
   4 warnings generated.
--
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
   5 warnings generated.


vim +/arch_klp_init_func +225 arch/x86/kernel/livepatch.c

   224	
 > 225	int arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
   226	{
   227		return 0;
   228	}
   229	
 > 230	void arch_klp_free_func(struct klp_object *obj, struct klp_func *limit)
   231	{
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
