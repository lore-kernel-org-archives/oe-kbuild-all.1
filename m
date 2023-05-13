Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9BC4C6B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683999797; x=1715535797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=88jyIMp6SlH8QBy+dqsdhN23w/LtxLvndTg8Q9XNfM4=;
  b=JTKvUcz1bRNLifIyCpHX6k5sMu/i3VrIAN4rS879Bq0wYmHAvo5cwLW7
   mZF0gcIthTrtRIT+OzZjDgwwpFWLuaEIIDaC6qqjzeFxuaCp0Cr+QEpgB
   zodp7K3Gss1N4k8xcgGpprMxgNNWeGtwxqtIUzmzZLt5rOI3auMdsJzJd
   Lqdy8Ko0fg8i8HFNrUJRhfMXgQk1fj50Jp+oY287HeIZcblkqh/Kqrib3
   uKTR/q7usgknqmIhZejbl26d3LYgXbTpWsM6pshCLg1ursB+hKyxv24yA
   qgtWCXVT8zwQhJTA58LTwFvKMRctnki21ilpKc+jeqHuJjDcRqJZc4eZW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330593773"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="330593773"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 10:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="694569206"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="694569206"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2023 10:43:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxtH0-0005cW-1F;
	Sat, 13 May 2023 17:43:14 +0000
Date: Sun, 14 May 2023 01:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bang Li <libang.linuxer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: arch/arc/kernel/smp.c:277:30: sparse: sparse: dereference of noderef
 expression
Message-ID: <202305140134.BC2YZdG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d4d58949a6eac1c45ab022562c8494725e1ac094
commit: c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e ARC: remove redundant READ_ONCE() in cmpxchg loop
date:   1 year, 1 month ago
config: arc-randconfig-s041-20230513 (https://download.01.org/0day-ci/archive/20230514/202305140134.BC2YZdG1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140134.BC2YZdG1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arc/kernel/smp.c:264:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *ipi_data_ptr @@     got unsigned long * @@
   arch/arc/kernel/smp.c:264:48: sparse:     expected unsigned long [noderef] __percpu *ipi_data_ptr
   arch/arc/kernel/smp.c:264:48: sparse:     got unsigned long *
   arch/arc/kernel/smp.c:279:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long [noderef] __percpu *__ai_ptr @@
   arch/arc/kernel/smp.c:279:18: sparse:     expected void const volatile *v
   arch/arc/kernel/smp.c:279:18: sparse:     got unsigned long [noderef] __percpu *__ai_ptr
   arch/arc/kernel/smp.c:413:72: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got int *dev @@
   arch/arc/kernel/smp.c:413:72: sparse:     expected void [noderef] __percpu *percpu_dev_id
   arch/arc/kernel/smp.c:413:72: sparse:     got int *dev
>> arch/arc/kernel/smp.c:277:30: sparse: sparse: dereference of noderef expression

vim +277 arch/arc/kernel/smp.c

   261	
   262	static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
   263	{
 > 264		unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
   265		unsigned long old, new;
   266		unsigned long flags;
   267	
   268		pr_debug("%d Sending msg [%d] to %d\n", smp_processor_id(), msg, cpu);
   269	
   270		local_irq_save(flags);
   271	
   272		/*
   273		 * Atomically write new msg bit (in case others are writing too),
   274		 * and read back old value
   275		 */
   276		do {
 > 277			new = old = *ipi_data_ptr;
   278			new |= 1U << msg;
   279		} while (cmpxchg(ipi_data_ptr, old, new) != old);
   280	
   281		/*
   282		 * Call the platform specific IPI kick function, but avoid if possible:
   283		 * Only do so if there's no pending msg from other concurrent sender(s).
   284		 * Otherwise, receiver will see this msg as well when it takes the
   285		 * IPI corresponding to that msg. This is true, even if it is already in
   286		 * IPI handler, because !@old means it has not yet dequeued the msg(s)
   287		 * so @new msg can be a free-loader
   288		 */
   289		if (plat_smp_ops.ipi_send && !old)
   290			plat_smp_ops.ipi_send(cpu);
   291	
   292		local_irq_restore(flags);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
