Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA433EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 00:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733790936; cv=none; b=G6ZOpgfVNbTZ0VwQ2QKv/0l74POteHDGSY8RhclT8Ssu2oD/dIOIfF71kAKW9vZv+rkLdaHDQhFLB6y43+TdyheaNXnFim6ZT9nEpmTQWyiyda8HqGpYYFCJabuFptk6LiMv6zXtfVsgzCPgEOLhWNf13iy+wYUA7MPlvbnnwtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733790936; c=relaxed/simple;
	bh=uwoSdkxYzQeeXOcOVV+J9w+dIK18ypNar//0T6XPgdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Picy8tqdY7dIWFIIMnnuDvtGPvZyFsBp+FYsKQqfYDE7m/SN9PzGcTrXANCrVy2Gli1ndyAQvg0kj8spSEFx2DGozxXW3NtXxvZ51BhkSnIOct3xQZp1lQTaZvgPqSrKG16N50k3JOBU+ZxZLK4VnWIOMQNhRjmHBuv/IsgMcKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kT++G8Kc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kT++G8Kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733790935; x=1765326935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwoSdkxYzQeeXOcOVV+J9w+dIK18ypNar//0T6XPgdw=;
  b=kT++G8Kc/Oap2vTsN3g1AFqZOQ+lWAknTWHFd+T5foi7oxHoTHoFiiu9
   PmDnuvTHL5ymGuMCRGjFFaIMjgUP8SfSEdpXUKm6xMZlQvM8EYM2jO+Go
   wObfnozeAp01ZyHdbJ/FMOolQH5oMslqRoerLxbfer43zKVAehfiOLdeN
   058rPqm7pJkB4PKWQeinI0/h+JYHhXi9U1+iXV+8kmz7/X2AfIneFSJYR
   NrxpH2cE3bx9ao4qa5HolMpARcOR+qQDMREBjQMegz7cGqhdOLj8AzCGz
   IsRU9Xw6kcefMh09ZQUA4r+MEqV6/A7jQq9+CQhN1fJvZmxQMA51pwwrD
   g==;
X-CSE-ConnectionGUID: yVwfdyeZR+SK3g5kcntDbQ==
X-CSE-MsgGUID: Ng9veHw5SCCoz6lX3c57wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33848550"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="33848550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 16:35:34 -0800
X-CSE-ConnectionGUID: iLzzmT+uRo29pOCM9RIxGw==
X-CSE-MsgGUID: +G35/cQjSPmjADdyoanrpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95717151"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2024 16:35:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKoDq-0004yS-30;
	Tue, 10 Dec 2024 00:35:30 +0000
Date: Tue, 10 Dec 2024 08:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1321/1321] arch/x86/power/cpu.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202412100840.h8kOEWMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Borislav,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   faa52e40c08916893e09ba030e616f92e4fc020b
commit: 27dd57ae7b305c8c1bcf55eab82c45d85b605149 [1321/1321] x86/cpu: Load microcode during restore_processor_state()
config: x86_64-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241210/202412100840.h8kOEWMA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100840.h8kOEWMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100840.h8kOEWMA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/power/cpu.c:27:
   In file included from arch/x86/include/asm/mmu_context.h:12:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   arch/x86/power/cpu.c:78: warning: Function parameter or member 'ctxt' not described in '__save_processor_state'
   arch/x86/power/cpu.c:200: warning: Function parameter or member 'ctxt' not described in '__restore_processor_state'
>> arch/x86/power/cpu.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
