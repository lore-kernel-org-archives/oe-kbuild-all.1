Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250961F9ED1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016688; cv=none; b=hv8Uass9TiDVMgn+kTFd+R7DA+o7R8k13qm9uGzg9C5hclskJPs/5q/F2DiC6v0lmg4ojPNJsWy+u0voTKEuCLg8110lLRr3ZpTkPKAHQuXM46ig8Ks64ASefWuK19ZXxesCSbrK0blE5YcdBeUBWNPrWcSwxHS5lr8QdZFd8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016688; c=relaxed/simple;
	bh=Nn7ZYV3Po0S80WTQj393Gi55UYM871POvZL//2+cfBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tXv6HK/GxW2by1HT/ssUg/yYsegmIVW1b+IjXh8A+kiNf0sDKuUzmZ6+iYTYUd3ihOe3P3FiDCwhIiNeVdILF1D4MOJHrEBD5eyqgLGiJFVxsOIfXRJI/LasbstWZvMy3hC0DmOA2wWcyvJWL8XieTS3iEjHpBuJqSlK+6R/Zlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLx0a7eL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLx0a7eL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729016687; x=1760552687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nn7ZYV3Po0S80WTQj393Gi55UYM871POvZL//2+cfBo=;
  b=DLx0a7eLt1KiAzqSRay4lf/wFhKjEHDlN/Zuzlq13lutRXZkR1V5oCsh
   onym7AAFSdA4sCwOokz4mOdazGWdZ6negdFD1XwNdiTxGKTkVhmQ4uC4q
   nr0NSU0aUmVQ+Ba+dVSo5og+PcPlNKn3KMF4sQloYO70LjdgfzkUsHQm1
   W71n2F09TRWJYWdEbkQj3jaDhYz2yDh2oqm/gVyyIXTY26K7T6uPqHdGA
   g+WUDxabx1zw3aXjd1MMMH/sGfnI3Xe7jBORqH5ygYrqCOgcOuBJ1vEv2
   WhkWpr6sB6j6u4kD5TqTJ776YAbld1B0kRdQtPehIz7taRwyZMj03Qk/E
   Q==;
X-CSE-ConnectionGUID: 9TDHXvg3RWuP8w89ahmwVg==
X-CSE-MsgGUID: xfnsKJeSTT6dURlJyq+zhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45908211"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45908211"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:24:46 -0700
X-CSE-ConnectionGUID: 12CONR3FQc2m757Tsrc41Q==
X-CSE-MsgGUID: UPfNFvfqRGGfR8pDa8Zxmg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="81957067"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2024 11:24:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0mDq-000Jmr-0o;
	Tue, 15 Oct 2024 18:24:42 +0000
Date: Wed, 16 Oct 2024 02:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5501/5503]
 include/linux/sched/task.h:59:28: error: use of undeclared identifier
 'CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX'
Message-ID: <202410160459.bMIwAHyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c783e8acd1cf0139e2b608eda85e90d30cbd8660
commit: 1827ee5e5a2de323359c04153e268a7288061eda [5501/5503] ANDROID: GKI: Add padding after init_task structure
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241016/202410160459.bMIwAHyh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160459.bMIwAHyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160459.bMIwAHyh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:59:28: error: use of undeclared identifier 'CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX'
      59 | extern u64 vendor_data_pad[CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX / sizeof(u64)];
         |                            ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1265: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:242: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX +59 include/linux/sched/task.h

    56	
    57	extern union thread_union init_thread_union;
    58	extern struct task_struct init_task;
  > 59	extern u64 vendor_data_pad[CONFIG_GKI_TASK_STRUCT_VENDOR_SIZE_MAX / sizeof(u64)];
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
