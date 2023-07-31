Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F0657
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690829807; x=1722365807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Hvd6+4Yb/SLNMJl8u/8HMqYPR1oGWQJm9oQWTAd/14=;
  b=aYPYqQHte1T+7FtLnLgvlAL5swtDrjbIUawzhuFUpoxqzR8jqz8dVcGO
   jfUK3Yld/AbALGkQBGFrNSc99DADqOGYp65TbYtslZMpQnA/gS+sBWfFy
   q+amDU+VpE3Zsu9k1l4P5ly2a2yEwKRCC/sWRZSL/LvJeu49gq5FajpV5
   Yq27ms9KUjEMpyTH4hcuVxM/MXBN725CTI+jJMkKFRBNBV8JgIw75Uqbq
   IAW54onqRpncEHDDkNpAcQtcur6N7yE6dA794cd9KaTrsbHniL2rpl2Zk
   HxiaQP7pLP1BFR4ooSRcY0Ooi0DUtwe47k5Px7rVRhlFqwB3kid5SYITG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435416230"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="435416230"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 11:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="852148763"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="852148763"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jul 2023 11:56:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQY4O-0005Ih-1o;
	Mon, 31 Jul 2023 18:56:41 +0000
Date: Tue, 1 Aug 2023 02:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 22/38]
 arch/riscv/include/asm/pgtable.h:502:65: warning: parameter 'addr' set but
 not used
Message-ID: <202308010208.UGpwOyzk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   ff0989edbd50c98f920d5ab686a71274298fdd76
commit: ee9a62a42d5524162a1e7e66809ed707366ae40b [22/38] riscv: Implement the new page table range API
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010208.UGpwOyzk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010208.UGpwOyzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010208.UGpwOyzk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:502:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     502 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   1 warning generated.
--
   In file included from kernel/trace/trace_syscalls.c:2:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
>> arch/riscv/include/asm/pgtable.h:502:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     502 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   In file included from kernel/trace/trace_syscalls.c:2:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:15:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:254:
   include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     592 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.
--
   In file included from kernel/trace/trace_events.c:15:
   In file included from include/linux/security.h:29:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
>> arch/riscv/include/asm/pgtable.h:502:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     502 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   kernel/trace/trace_events.c:2119:37: warning: unused variable 'ftrace_event_id_fops' [-Wunused-const-variable]
    2119 | static const struct file_operations ftrace_event_id_fops = {
         |                                     ^
   2 warnings generated.
--
   In file included from kernel/trace/trace.c:15:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:502:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     502 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   In file included from kernel/trace/trace.c:8878:
   kernel/trace/trace_selftest.c:605:6: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     605 |         int len;
         |             ^
   2 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
>> arch/riscv/include/asm/pgtable.h:502:65: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     502 | static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
         |                                                                 ^
   1 warning generated.


vim +/addr +502 arch/riscv/include/asm/pgtable.h

   501	
 > 502	static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
   503			pte_t *ptep, pte_t pteval, unsigned int nr)
   504	{
   505		page_table_check_ptes_set(mm, ptep, pteval, nr);
   506	
   507		for (;;) {
   508			__set_pte_at(ptep, pteval);
   509			if (--nr == 0)
   510				break;
   511			ptep++;
   512			addr += PAGE_SIZE;
   513			pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
   514		}
   515	}
   516	#define set_ptes set_ptes
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
