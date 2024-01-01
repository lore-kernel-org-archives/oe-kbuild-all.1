Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04ED20FD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUeMWnI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704107283; x=1735643283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHODkTjKn2McaIQnaehC9M/CEypEHmHBOhTBoqEa/jc=;
  b=nUeMWnI3iJcISQA4k4aYRfHiR4dTegw7BDZE8pBE2zBxJVukM8ZtO6Mk
   iiKApW8LfWFFxlHOwNNy8Rqbk6w2ls5LtRORL8gQ/OUUhCCPg7ZR28dIF
   HVvpPpxq8UT5BuOEP5zbjmkHVnur67ttz5bI7g4aR4r+Tp2vDfEPV3/Ly
   9jf/3Jtx6ThKPW1KT2Ft61iJOeBkFD937l760T61IIsEatNeE3cV7s46x
   NJM4q1zlA5UpkbyaR02rcLirNYWGdiQlmASOAcofe7sFyZ/q5nAq5yx7I
   /XD1Jz/9wrDzX0T+7wzV070PDOG+JMkiTP4Lp8/fwJL6G6ldRCMNdhqjs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="427953440"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="427953440"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 03:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="898212177"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="898212177"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jan 2024 03:08:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKG9G-000K9Y-2C;
	Mon, 01 Jan 2024 11:07:58 +0000
Date: Mon, 1 Jan 2024 19:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-riscv:riscv_kvm_queue 17/27]
 arch/riscv/kernel/paravirt.c:105:19: sparse: sparse: cast to restricted
 __le32
Message-ID: <202401011933.hL9zqmKo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_queue
head:   aad86da229bc9d0390dc2c02eb0db9ab1f50d059
commit: 3e059bff8203010dc4a287a9d4288eb257cadbaf [17/27] RISC-V: paravirt: Implement steal-time support
config: riscv-randconfig-r123-20240101 (https://download.01.org/0day-ci/archive/20240101/202401011933.hL9zqmKo-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 8a4266a626914765c0c69839e8a51be383013c1a)
reproduce: (https://download.01.org/0day-ci/archive/20240101/202401011933.hL9zqmKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401011933.hL9zqmKo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/paravirt.c:105:19: sparse: sparse: cast to restricted __le32
>> arch/riscv/kernel/paravirt.c:106:30: sparse: sparse: restricted __le32 degrades to integer
>> arch/riscv/kernel/paravirt.c:101:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] sequence @@     got restricted __le32 @@
   arch/riscv/kernel/paravirt.c:101:26: sparse:     expected unsigned int [usertype] sequence
   arch/riscv/kernel/paravirt.c:101:26: sparse:     got restricted __le32
>> arch/riscv/kernel/paravirt.c:103:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] steal @@     got restricted __le64 @@
   arch/riscv/kernel/paravirt.c:103:23: sparse:     expected unsigned long long [usertype] steal
   arch/riscv/kernel/paravirt.c:103:23: sparse:     got restricted __le64
>> arch/riscv/kernel/paravirt.c:108:16: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/paravirt.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +105 arch/riscv/kernel/paravirt.c

    89	
    90	static u64 pv_time_steal_clock(int cpu)
    91	{
    92		struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
    93		u32 sequence;
    94		u64 steal;
    95	
    96		/*
    97		 * Check the sequence field before and after reading the steal
    98		 * field. Repeat the read if it is different or odd.
    99		 */
   100		do {
 > 101			sequence = READ_ONCE(st->sequence);
   102			virt_rmb();
 > 103			steal = READ_ONCE(st->steal);
   104			virt_rmb();
 > 105		} while ((le32_to_cpu(sequence) & 1) ||
 > 106			 sequence != READ_ONCE(st->sequence));
   107	
 > 108		return le64_to_cpu(steal);
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
