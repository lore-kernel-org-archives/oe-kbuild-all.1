Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C4156CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688152543; x=1719688543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ib+PZLaZ5Tt87rRYTH6mtZCYB6CwPXEucU7pSlnHLOQ=;
  b=I8TQ8p82gBTXQAJQANUwOns9Z4UQDb2ZQn+1MiQ5xhTdR5/GCYmYiDDI
   e+WXTzlUikr7piYdv7oh2oqjV4BXBkoV/IK7wzP+5sq/IIN28y9wXqxYJ
   C8gqmivvvW5oIEgqI9LllMSlqyDkJmhUAo0Mvhxspx4oE005MFjJzp8iB
   0cBvu+Ibjq/k4Po6MSG2Esowmimv9XczhTn4xBfEVYW89vooSY3gB71q7
   KCdkwbPIRwHSvZTg2g1CUp4J/jKMoS3gm3a0q+CjmWDDuJ1Ovb8tcR55G
   v+2c2p513jxtD3yPqc83dAk4f8TZP5B/mmQn+5urt9wgf05N6RqzdRY7Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393197928"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="393197928"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 12:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="753081509"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="753081509"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Jun 2023 12:15:40 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFJam-000FIL-0e;
	Fri, 30 Jun 2023 19:15:40 +0000
Date: Sat, 1 Jul 2023 03:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/process.c:190:46: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202307010315.q5hnCLaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   533925cb760431cb496a8c965cfd765a1a21d37e
commit: 49232773d8233ed70c4998851bc84e465fc1c788 LoongArch: Add guess unwinder support
date:   11 months ago
config: loongarch-randconfig-r073-20230627 (https://download.01.org/0day-ci/archive/20230701/202307010315.q5hnCLaT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010315.q5hnCLaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010315.q5hnCLaT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/process.c:190:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:190:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:190:46: sparse:     got unsigned long [noderef] __percpu *
>> arch/loongarch/kernel/process.c:190:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:190:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:190:46: sparse:     got unsigned long [noderef] __percpu *
>> arch/loongarch/kernel/process.c:190:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:190:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:190:46: sparse:     got unsigned long [noderef] __percpu *
>> arch/loongarch/kernel/process.c:190:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long [noderef] __percpu * @@
   arch/loongarch/kernel/process.c:190:46: sparse:     expected void *ptr
   arch/loongarch/kernel/process.c:190:46: sparse:     got unsigned long [noderef] __percpu *
   arch/loongarch/kernel/process.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:232:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:232:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:242:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:242:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:232:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:232:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:232:16: sparse: sparse: cast from unknown type

vim +190 arch/loongarch/kernel/process.c

   186	
   187	bool in_irq_stack(unsigned long stack, struct stack_info *info)
   188	{
   189		unsigned long nextsp;
 > 190		unsigned long begin = (unsigned long)this_cpu_read(irq_stack);
   191		unsigned long end = begin + IRQ_STACK_START;
   192	
   193		if (stack < begin || stack >= end)
   194			return false;
   195	
   196		nextsp = *(unsigned long *)end;
   197		if (nextsp & (SZREG - 1))
   198			return false;
   199	
   200		info->begin = begin;
   201		info->end = end;
   202		info->next_sp = nextsp;
   203		info->type = STACK_TYPE_IRQ;
   204	
   205		return true;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
