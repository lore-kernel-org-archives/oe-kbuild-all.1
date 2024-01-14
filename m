Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E323A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVnH/v0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705238256; x=1736774256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kt/ElPMbWCdpN2iRY3i06s4N2fcqN+ByySShummY9+0=;
  b=FVnH/v0s+He7ei0o6QdHpi4AUMnUaBkK6b7SYm5Ja0KEgvYfTbJnGvWE
   i93HyU7gBpm8i7CPB80mj1juwTmiVjVYhFZ91HgM5ZTKB7Bws2VZ5RQ5b
   JcZnuzHLeMn8PeZAhS+8POzy/eKL1ND7AOQJQtUPEMUTzyJ6y/BB8l72J
   oOyw7OCHInjzVzsxPpGL8jBMC3apJnH3V+Js1Mbdl+fijjXztVtxK804y
   /QOld+qSfiQErQI1I1Ss98+eU+gOjV1Bs9nW3Lq6EmU3T4T6SikwuudiO
   0xj/uRVAo5qgtOQ9ikPDY7rmDOtzOcMPJALwpGl0JxhzmSx/73aHViQD7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="20936757"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="20936757"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 05:17:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="786839495"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="786839495"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2024 05:17:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP0Ml-000BWy-32;
	Sun, 14 Jan 2024 13:17:31 +0000
Date: Sun, 14 Jan 2024 21:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20235/21544] kernel/irq/chip.c:524:3:
 error: implicit declaration of function 'printk_safe_enter'
Message-ID: <202401142134.K1jV9ePr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: db0bbc90d1fcecb9e947da03cb95eef1b10efe1f [20235/21544] genirq: add printk safe in irq context
config: x86_64-buildonly-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240114/202401142134.K1jV9ePr-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401142134.K1jV9ePr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401142134.K1jV9ePr-lkp@intel.com/

Note: the openeuler/openEuler-1.0-LTS HEAD 1f0983450549eeea71fb9333517330947a779262 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/irq/chip.c:524:3: error: implicit declaration of function 'printk_safe_enter' [-Werror,-Wimplicit-function-declaration]
     524 |                 printk_safe_enter();
         |                 ^
   kernel/irq/chip.c:524:3: note: did you mean 'printk_nmi_enter'?
   include/linux/printk.h:154:20: note: 'printk_nmi_enter' declared here
     154 | static inline void printk_nmi_enter(void) { }
         |                    ^
>> kernel/irq/chip.c:527:3: error: implicit declaration of function 'printk_safe_exit' [-Werror,-Wimplicit-function-declaration]
     527 |                 printk_safe_exit();
         |                 ^
   2 errors generated.


vim +/printk_safe_enter +524 kernel/irq/chip.c

   504	
   505	static bool irq_may_run(struct irq_desc *desc)
   506	{
   507		unsigned int mask = IRQD_IRQ_INPROGRESS | IRQD_WAKEUP_ARMED;
   508	
   509		/*
   510		 * If the interrupt is not in progress and is not an armed
   511		 * wakeup interrupt, proceed.
   512		 */
   513		if (!irqd_has_set(&desc->irq_data, mask))
   514			return true;
   515	
   516		if (irqd_get(&desc->irq_data) & IRQD_IRQ_INPROGRESS) {
   517			const char *name = NULL;
   518	
   519			if (desc->name)
   520				name = desc->name;
   521			else if (desc->action)
   522				name = desc->action->name;
   523	
 > 524			printk_safe_enter();
   525			pr_warn("irq %u(%s) may be reentrant in multiple cpus.\n",
   526				desc->irq_data.irq, name == NULL ? "NULL" : name);
 > 527			printk_safe_exit();
   528		}
   529	
   530		/*
   531		 * If the interrupt is an armed wakeup source, mark it pending
   532		 * and suspended, disable it and notify the pm core about the
   533		 * event.
   534		 */
   535		if (irq_pm_check_wakeup(desc))
   536			return false;
   537	
   538		/*
   539		 * Handle a potential concurrent poll on a different core.
   540		 */
   541		return irq_check_poll(desc);
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
