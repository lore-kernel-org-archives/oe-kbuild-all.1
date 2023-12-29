Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE714A92
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 22:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FINOw47S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703890014; x=1735426014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OC3TA98HFHTSeoCLSuCDDLZQaNR5a7D1yWp5g/4YBAY=;
  b=FINOw47SFMaakT03FIqJfauSfecz17ETc54OFmbUw4aHCnUHdt9GFmLh
   /Ig00GJknPM1jSd6SRSzrqCEYpGQui8RFVF9luaE0fGfzZ4gspzwrxVyZ
   lJ3meLeCy1G8uaSfMaDwv3z3czOnhCiC+Lq9ZOzcspGwnyL2259kAEgRY
   DjvGgY2K1yuyRTlohFfkOXzVzdjX3/NK652T+Ts/Fbv+yM3OzBgApFAvh
   hIckv82fWkx8W7sZxhO3K4HbDy14KQ7v6SOMj3srhyBwdfCEAvGtnn6Cx
   XEpskOxRtyv93viyUlhnSUhgUhqpqBXUt1p8xk+M3Iiq7Z1K6SNjJr+/n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="460996607"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="460996607"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 14:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="952179498"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="952179498"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Dec 2023 14:46:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJLcr-000HsD-2D;
	Fri, 29 Dec 2023 22:46:45 +0000
Date: Sat, 30 Dec 2023 06:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-riscv:riscv_kvm_queue 17/27]
 arch/riscv/kernel/paravirt.c:111:12: warning: no previous prototype for
 function 'pv_time_init'
Message-ID: <202312300626.qkK8S3zA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_queue
head:   b2c261d4bfc34918e4cd405fae59d103ab170d38
commit: 3e059bff8203010dc4a287a9d4288eb257cadbaf [17/27] RISC-V: paravirt: Implement steal-time support
config: riscv-randconfig-r054-20231230 (https://download.01.org/0day-ci/archive/20231230/202312300626.qkK8S3zA-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 8a4266a626914765c0c69839e8a51be383013c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300626.qkK8S3zA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300626.qkK8S3zA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/paravirt.c:111:12: warning: no previous prototype for function 'pv_time_init' [-Wmissing-prototypes]
     111 | int __init pv_time_init(void)
         |            ^
   arch/riscv/kernel/paravirt.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     111 | int __init pv_time_init(void)
         | ^
         | static 
   1 warning generated.


vim +/pv_time_init +111 arch/riscv/kernel/paravirt.c

a7c7ed23a12d76 Andrew Jones 2023-12-20  110  
a7c7ed23a12d76 Andrew Jones 2023-12-20 @111  int __init pv_time_init(void)

:::::: The code at line 111 was first introduced by commit
:::::: a7c7ed23a12d76a284dd7d8c9575e0139f2910a0 RISC-V: paravirt: Add skeleton for pv-time support

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
