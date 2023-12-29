Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2806012B88
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 17:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2aJHMeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703872742; x=1735408742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDPqSul4IbGsErpcE2GvBC2sFk7vLEeNqhZnDU1ImNk=;
  b=i2aJHMeg60fA20mV5pI+KjE0kxvPk1b4uTFZT/Do4GSL5JIVDslX3RMr
   5Rl5dBlCPxm4jchZbiyWB0Ahq3AIbEHX4Fo6QyiYTEY7HJbAZeYqDXQ6E
   Dl/Lamn9QN11V/y3ZADWLL8cWffeBOLN+l02CksPLc9KcbcKZ6BkLyA2I
   KlJ0CMnZ6d2JW7KTFYeH8KF9NCGVFNUGSL2q8eUAl/OHrMLRqe5oFoJS7
   pNY5GB3rJZHayZ2x6jgVocvznxwh07QI3c6XOVLXxnB362G4e5bRoxnSM
   Sncg1xzbAsvOMdbd89fCfFAZkJZSL5DrVrVbtaHxtrxmMw5ADT6Yg0HFN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="460981046"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="460981046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 09:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="897568099"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="897568099"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2023 09:58:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJH8C-000HeR-17;
	Fri, 29 Dec 2023 17:58:48 +0000
Date: Sat, 30 Dec 2023 01:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-riscv:riscv_kvm_queue 19/29]
 arch/riscv/kernel/paravirt.c:111:12: warning: no previous prototype for
 'pv_time_init'
Message-ID: <202312300110.1FQKRhVJ-lkp@intel.com>
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
commit: 3efc3343fccb05f06b2c1dd22d976b497f2a13bb [19/29] RISC-V: paravirt: Implement steal-time support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231230/202312300110.1FQKRhVJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300110.1FQKRhVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300110.1FQKRhVJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/paravirt.c:111:12: warning: no previous prototype for 'pv_time_init' [-Wmissing-prototypes]
     111 | int __init pv_time_init(void)
         |            ^~~~~~~~~~~~


vim +/pv_time_init +111 arch/riscv/kernel/paravirt.c

1abc6a650d7abc Andrew Jones 2023-12-20  110  
1abc6a650d7abc Andrew Jones 2023-12-20 @111  int __init pv_time_init(void)

:::::: The code at line 111 was first introduced by commit
:::::: 1abc6a650d7abcb3fd6f643fe56e4892ed86895a RISC-V: paravirt: Add skeleton for pv-time support

:::::: TO: Andrew Jones <ajones@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
