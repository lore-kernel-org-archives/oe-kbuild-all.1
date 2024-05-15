Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350D2E851
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715805344; cv=none; b=qrOSVEjM9IQIVkobB3WWfYbM92/FIZx+jdQlvyM1XePcdmqESP2QjyoAD+40YNzhhHee/t1I56WHUFlFoEoasQ2ORVoYVbJ6Gf4KS3X3lFumROWRalzYjZ0qj+HZ3wkBA2gWMqwGjpp8kINZ7+reSs2OEFHIl6XTmohz0GM282k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715805344; c=relaxed/simple;
	bh=eW8Uz35PSaLqtyicdNqTm5ERUA3tZ9VIq7IwvBSI1sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eRTh3zffj2zFUWVobG1iVfWu4u6CZ0TmcXSENm8/1UZZKNn/jDJICZonV9if2c0yu7b1iaPdRuam0fGL66NhURMwdeRE3GkuprfR58yo//1eYzhhQW7GLD4fri5AGrTBHvvY8qPW1xUTNp79NZ4EHe7incLiMfoEpr3YyuMxL5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B53IVpu1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B53IVpu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715805343; x=1747341343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eW8Uz35PSaLqtyicdNqTm5ERUA3tZ9VIq7IwvBSI1sU=;
  b=B53IVpu1yE3guu1/zcnBAOqbvCM4llgL6toXzWrYIhERmKudro1ar5Wf
   m2ldINy6bElQssnp7eqlg63cGOjJ9D2OGxzUr85uLeS2gyNKysygjBtBW
   /+81XoDbPB+4WQDxT2csAkMxbBc0H5y30fOdXatjxbsVtMmVlen7EtbJe
   PH6GwgwVwGINLOdQzYaCUSnZbyJKk3fxE3ClmLOK5Z6IuhEcG79P2ZzHK
   WhM+eJ6ug14592lPhh76FUmO0WMmco3ZiGuS+Sg0VJGQOt0w5OGvrhKrn
   5QsJusB3hj1seIp0NoEqNwbfuz49LHoLSR68QHAAjzgDQeseumm01RltT
   w==;
X-CSE-ConnectionGUID: 4zi7pg4WQx2YesWwTS4t3A==
X-CSE-MsgGUID: iRlDzQWzRJm4P7d5a36mQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11715261"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="11715261"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 13:35:07 -0700
X-CSE-ConnectionGUID: 1SD6tuY7Teiir5lkGiGS5g==
X-CSE-MsgGUID: SXan1E+kRWCu7PEGeDPpOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="62372687"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2024 13:35:05 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7LL5-000DFP-0F;
	Wed, 15 May 2024 20:35:03 +0000
Date: Thu, 16 May 2024 04:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13096/13213]
 drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many arguments to
 function 'riscv_ipi_set_virq_range'
Message-ID: <202405160449.hGp9BveB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d92a9a1b9ea0ea52aff27cddd05009b4edad49
commit: f725fb3518e03b48a50a22f63c440cd04b41334a [13096/13213] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-randconfig-001-20240516 (https://download.01.org/0day-ci/archive/20240516/202405160449.hGp9BveB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160449.hGp9BveB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160449.hGp9BveB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain_init':
>> drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many arguments to function 'riscv_ipi_set_virq_range'
      52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/smp.h:119,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2142,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from drivers/irqchip/irq-riscv-imsic-early.c:8:
   arch/riscv/include/asm/smp.h:52:6: note: declared here
      52 | void riscv_ipi_set_virq_range(int virq, int nr);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_ipi_set_virq_range +52 drivers/irqchip/irq-riscv-imsic-early.c

21a8f8a0eb35ce Anup Patel 2024-03-07  41  
21a8f8a0eb35ce Anup Patel 2024-03-07  42  static int __init imsic_ipi_domain_init(void)
21a8f8a0eb35ce Anup Patel 2024-03-07  43  {
21a8f8a0eb35ce Anup Patel 2024-03-07  44  	int virq;
21a8f8a0eb35ce Anup Patel 2024-03-07  45  
21a8f8a0eb35ce Anup Patel 2024-03-07  46  	/* Create IMSIC IPI multiplexing */
21a8f8a0eb35ce Anup Patel 2024-03-07  47  	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
21a8f8a0eb35ce Anup Patel 2024-03-07  48  	if (virq <= 0)
21a8f8a0eb35ce Anup Patel 2024-03-07  49  		return virq < 0 ? virq : -ENOMEM;
21a8f8a0eb35ce Anup Patel 2024-03-07  50  
21a8f8a0eb35ce Anup Patel 2024-03-07  51  	/* Set vIRQ range */
21a8f8a0eb35ce Anup Patel 2024-03-07 @52  	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
21a8f8a0eb35ce Anup Patel 2024-03-07  53  
21a8f8a0eb35ce Anup Patel 2024-03-07  54  	/* Announce that IMSIC is providing IPIs */
21a8f8a0eb35ce Anup Patel 2024-03-07  55  	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
21a8f8a0eb35ce Anup Patel 2024-03-07  56  
21a8f8a0eb35ce Anup Patel 2024-03-07  57  	return 0;
21a8f8a0eb35ce Anup Patel 2024-03-07  58  }
21a8f8a0eb35ce Anup Patel 2024-03-07  59  #else
21a8f8a0eb35ce Anup Patel 2024-03-07  60  static void imsic_ipi_starting_cpu(void) { }
21a8f8a0eb35ce Anup Patel 2024-03-07  61  static void imsic_ipi_dying_cpu(void) { }
21a8f8a0eb35ce Anup Patel 2024-03-07  62  static int __init imsic_ipi_domain_init(void) { return 0; }
21a8f8a0eb35ce Anup Patel 2024-03-07  63  #endif
21a8f8a0eb35ce Anup Patel 2024-03-07  64  

:::::: The code at line 52 was first introduced by commit
:::::: 21a8f8a0eb35ceb21e2c9ddd87468bc3b5ac87c0 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
