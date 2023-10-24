Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72E262BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIn8Q414"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698149519; x=1729685519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWgrWeLZqh8l0QIOnr9hKyBySrOL8mVpJAp56+75DYA=;
  b=XIn8Q414YrirhnVSy54zBnUD4xJfgAzVZ2s8HghgSNlQZPrHfZ529KcR
   ookLwH1LJSMLfWhjpYoubw/Xc2ay4QifzYSHMgmOV+BVwKKUlUIWTnp2h
   B+yez8PRelEihD+2LWB+MrUf/Ifd8Nt9eGoncuI5s+pwdi/LWM3gBwi3d
   C99yojWSaGo7AS4KL9rUtm45LQhcQSh91wLXoj8O9jL+crUWdGF5AGaTT
   dl+mG8JZgujZ6ubwRixP0rw6oiqvUSkHzRED581DJuRstFd1EzPolSOna
   HbBYdEHgIDqNT0WadaSaAj5vaxyoxjKc9Hv8XeYbI22edDtR0nGBlCIrj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377417715"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="377417715"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 05:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="828808272"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="828808272"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Oct 2023 05:11:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvGGJ-0007r5-2U;
	Tue, 24 Oct 2023 12:11:55 +0000
Date: Tue, 24 Oct 2023 20:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [avpatel:riscv_sbi_dbcn_v4 34/41]
 drivers/irqchip/irq-riscv-imsic-state.c:288:14: warning: variable
 'is_enabled' set but not used
Message-ID: <202310242029.HMJQdfMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbcn_v4
head:   d407d1520dd0de57732adefb57b0846b1d4fd1e2
commit: 6bab28315147da0fdc4951d7c375bd1e5ebf38a1 [34/41] RISC-V: Select APLIC and IMSIC drivers
config: riscv-randconfig-001-20231024 (https://download.01.org/0day-ci/archive/20231024/202310242029.HMJQdfMy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310242029.HMJQdfMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310242029.HMJQdfMy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-imsic-state.c: In function 'imsic_vector_debug_show':
>> drivers/irqchip/irq-riscv-imsic-state.c:288:14: warning: variable 'is_enabled' set but not used [-Wunused-but-set-variable]
     288 |         bool is_enabled = false;
         |              ^~~~~~~~~~


vim +/is_enabled +288 drivers/irqchip/irq-riscv-imsic-state.c

8c5de98c696667 Anup Patel 2023-08-02  279  
8c5de98c696667 Anup Patel 2023-08-02  280  #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
8c5de98c696667 Anup Patel 2023-08-02  281  void imsic_vector_debug_show(struct seq_file *m,
8c5de98c696667 Anup Patel 2023-08-02  282  			     struct imsic_vector *vec, int ind)
8c5de98c696667 Anup Patel 2023-08-02  283  {
8c5de98c696667 Anup Patel 2023-08-02  284  	unsigned int mcpu = 0, mlocal_id = 0;
8c5de98c696667 Anup Patel 2023-08-02  285  	struct imsic_local_priv *lpriv;
8c5de98c696667 Anup Patel 2023-08-02  286  	bool move_in_progress = false;
8c5de98c696667 Anup Patel 2023-08-02  287  	struct imsic_vector *mvec;
8c5de98c696667 Anup Patel 2023-08-02 @288  	bool is_enabled = false;
8c5de98c696667 Anup Patel 2023-08-02  289  	unsigned long flags;
8c5de98c696667 Anup Patel 2023-08-02  290  
8c5de98c696667 Anup Patel 2023-08-02  291  	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
8c5de98c696667 Anup Patel 2023-08-02  292  	if (WARN_ON(&lpriv->vectors[vec->local_id] != vec))
8c5de98c696667 Anup Patel 2023-08-02  293  		return;
8c5de98c696667 Anup Patel 2023-08-02  294  
8c5de98c696667 Anup Patel 2023-08-02  295  	raw_spin_lock_irqsave(&lpriv->ids_lock, flags);
8c5de98c696667 Anup Patel 2023-08-02  296  	if (test_bit(vec->local_id, lpriv->ids_enabled_bitmap))
8c5de98c696667 Anup Patel 2023-08-02  297  		is_enabled = true;
8c5de98c696667 Anup Patel 2023-08-02  298  	mvec = lpriv->ids_move[vec->local_id];
8c5de98c696667 Anup Patel 2023-08-02  299  	if (mvec) {
8c5de98c696667 Anup Patel 2023-08-02  300  		move_in_progress = true;
8c5de98c696667 Anup Patel 2023-08-02  301  		mcpu = mvec->cpu;
8c5de98c696667 Anup Patel 2023-08-02  302  		mlocal_id = mvec->local_id;
8c5de98c696667 Anup Patel 2023-08-02  303  	}
8c5de98c696667 Anup Patel 2023-08-02  304  	raw_spin_unlock_irqrestore(&lpriv->ids_lock, flags);
8c5de98c696667 Anup Patel 2023-08-02  305  
8c5de98c696667 Anup Patel 2023-08-02  306  	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
8c5de98c696667 Anup Patel 2023-08-02  307  	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
8c5de98c696667 Anup Patel 2023-08-02  308  	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
8c5de98c696667 Anup Patel 2023-08-02  309  		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
8c5de98c696667 Anup Patel 2023-08-02  310  	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "",
8c5de98c696667 Anup Patel 2023-08-02  311  		   (move_in_progress) ? 1 : 0);
8c5de98c696667 Anup Patel 2023-08-02  312  	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "",
8c5de98c696667 Anup Patel 2023-08-02  313  		   (move_in_progress) ? 1 : 0);
8c5de98c696667 Anup Patel 2023-08-02  314  	if (move_in_progress) {
8c5de98c696667 Anup Patel 2023-08-02  315  		seq_printf(m, "%*smove_cpu        : %5u\n", ind, "", mcpu);
8c5de98c696667 Anup Patel 2023-08-02  316  		seq_printf(m, "%*smove_local_id   : %5u\n", ind, "", mlocal_id);
8c5de98c696667 Anup Patel 2023-08-02  317  	}
8c5de98c696667 Anup Patel 2023-08-02  318  }
8c5de98c696667 Anup Patel 2023-08-02  319  

:::::: The code at line 288 was first introduced by commit
:::::: 8c5de98c6966676650b5cfccc1da96347c672ad3 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
