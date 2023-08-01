Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF39182C0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 18:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690914823; x=1722450823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAJ/Gqam9ncHQnGpbz+Yi0HIWtq0SEtal+K4GhpADvk=;
  b=ctJz/i6bqzgFc7jWNfNaVYwBKEwkUhFMYtT4EPD+BteTbytR8zHe2HpG
   WLlyk+iZCWvHYtfKF0NzLfND/DS28peS/RVp5w7yKsgUf2NmgLerYMI2J
   OdfdllKYd6psbr97JatkDU8leDFcfmrDg1yeKq2IYCNdPehIXdACBwefP
   vbuhvtwQR5xMswbuvhAUiwVrIJzYSYs1eetNP+DIfpCKm5bMd1gpArytM
   RHqZitq4PRqzG8N2hk/nbJipCyZqfn+utAaShTCw48FXN7eKjimHtc5bD
   YoB4Fy5q17MGZMrkL6mMxYioAmlbtMZwowE78MKLFuukZrF+3uj2+Jd0p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369383836"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369383836"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="705880069"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="705880069"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 11:33:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQuBd-0000WN-28;
	Tue, 01 Aug 2023 18:33:37 +0000
Date: Wed, 2 Aug 2023 02:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 26/38]
 arch/sparc/include/asm/pgtable_64.h:933:9: error: implicit declaration of
 function 'arch_enter_lazy_mmu_mode'
Message-ID: <202308020232.X2lHrWaK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   7952e5c7f83e890b26d3d18a31ef300cd9c3bfe8
commit: d7068f73da4df760f32bd49d79583f7d68dc501d [26/38] sparc64: Implement the new page table range API
config: sparc64-randconfig-r015-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020232.X2lHrWaK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020232.X2lHrWaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020232.X2lHrWaK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgtable.h:5,
                    from arch/sparc/include/asm/uaccess_64.h:14,
                    from arch/sparc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/proc_fs.h:10,
                    from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:255,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/device.h:8,
                    from include/linux/device.h:34,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from drivers/of/cpu.c:2:
   arch/sparc/include/asm/pgtable_64.h: In function 'set_ptes':
>> arch/sparc/include/asm/pgtable_64.h:933:9: error: implicit declaration of function 'arch_enter_lazy_mmu_mode' [-Werror=implicit-function-declaration]
     933 |         arch_enter_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/include/asm/pgtable_64.h:942:9: error: implicit declaration of function 'arch_leave_lazy_mmu_mode' [-Werror=implicit-function-declaration]
     942 |         arch_leave_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/tlbflush.h:5,
                    from arch/sparc/include/asm/pgtable_64.h:1140:
   arch/sparc/include/asm/tlbflush_64.h: At top level:
>> arch/sparc/include/asm/tlbflush_64.h:45:6: warning: conflicting types for 'arch_enter_lazy_mmu_mode'; have 'void(void)'
      45 | void arch_enter_lazy_mmu_mode(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_64.h:933:9: note: previous implicit declaration of 'arch_enter_lazy_mmu_mode' with type 'void(void)'
     933 |         arch_enter_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/include/asm/tlbflush_64.h:46:6: warning: conflicting types for 'arch_leave_lazy_mmu_mode'; have 'void(void)'
      46 | void arch_leave_lazy_mmu_mode(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_64.h:942:9: note: previous implicit declaration of 'arch_leave_lazy_mmu_mode' with type 'void(void)'
     942 |         arch_leave_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/sparc/include/asm/pgtable.h:5,
                    from arch/sparc/include/asm/uaccess_64.h:14,
                    from arch/sparc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/proc_fs.h:10,
                    from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:255,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/device.h:8,
                    from include/linux/device.h:34,
                    from include/linux/amba/bus.h:15,
                    from drivers/of/platform.c:14:
   arch/sparc/include/asm/pgtable_64.h: In function 'set_ptes':
>> arch/sparc/include/asm/pgtable_64.h:933:9: error: implicit declaration of function 'arch_enter_lazy_mmu_mode' [-Werror=implicit-function-declaration]
     933 |         arch_enter_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/include/asm/pgtable_64.h:942:9: error: implicit declaration of function 'arch_leave_lazy_mmu_mode' [-Werror=implicit-function-declaration]
     942 |         arch_leave_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/tlbflush.h:5,
                    from arch/sparc/include/asm/pgtable_64.h:1140:
   arch/sparc/include/asm/tlbflush_64.h: At top level:
>> arch/sparc/include/asm/tlbflush_64.h:45:6: warning: conflicting types for 'arch_enter_lazy_mmu_mode'; have 'void(void)'
      45 | void arch_enter_lazy_mmu_mode(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_64.h:933:9: note: previous implicit declaration of 'arch_enter_lazy_mmu_mode' with type 'void(void)'
     933 |         arch_enter_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/include/asm/tlbflush_64.h:46:6: warning: conflicting types for 'arch_leave_lazy_mmu_mode'; have 'void(void)'
      46 | void arch_leave_lazy_mmu_mode(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_64.h:942:9: note: previous implicit declaration of 'arch_leave_lazy_mmu_mode' with type 'void(void)'
     942 |         arch_leave_lazy_mmu_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/platform.c:34:34: warning: 'of_skipped_node_table' defined but not used [-Wunused-const-variable=]
      34 | static const struct of_device_id of_skipped_node_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/arch_enter_lazy_mmu_mode +933 arch/sparc/include/asm/pgtable_64.h

   929	
   930	static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
   931			pte_t *ptep, pte_t pte, unsigned int nr)
   932	{
 > 933		arch_enter_lazy_mmu_mode();
   934		for (;;) {
   935			__set_pte_at(mm, addr, ptep, pte, 0);
   936			if (--nr == 0)
   937				break;
   938			ptep++;
   939			pte_val(pte) += PAGE_SIZE;
   940			addr += PAGE_SIZE;
   941		}
 > 942		arch_leave_lazy_mmu_mode();
   943	}
   944	#define set_ptes set_ptes
   945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
