Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B0D18025
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690393012; x=1721929012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEPA2aiVeqRXV9jo2FAudvxxZ8Ky/elz+Bln73rkoBM=;
  b=Oe12Cti/+OJnHu5vKZ6ILRDlLF8ukzmCrH6uwx2JqToKrSNBEq4tzgdT
   7K0AuM9diqIz3Qif2esQ4XRW8ub6X7jVfSV6ZprydLtxPw2H/65hTIAoH
   J+DBhskvyPcd4DnFRrr+ELsubchVxhxXtsCq0NNHHUPLnmQl/Xa1lDxZu
   j4KJGiu9hS12FLljYZd4w+7rLo7lcb14iMf42WJ1AoONOEQgCeSYu01OI
   Tdwp8KBoJGCBjHSlRcqG+pKNTMZ5K90kwh48Tfq9hPCOULa0IHNpykqmv
   mO/XAs4gTT6Gq87SAAFx9Qee794slPlgB0VN2tuP8p3Yg0wMfIC7yltLt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399022251"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="399022251"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 10:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="791964682"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="791964682"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 10:36:47 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOiR3-00019O-1K;
	Wed, 26 Jul 2023 17:36:34 +0000
Date: Thu, 27 Jul 2023 01:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 3/6] arch/x86/include/asm/paravirt.h:55:9:
 error: implicit declaration of function 'PVOP_VCALL0'
Message-ID: <202307270118.Vk93Fixo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   1e68adb59894117251d942316d32514d45bd23ef
commit: 5d78ed0959d293a570ef61dd9a6336aee75a483c [3/6] x86/speculation: Add __update_spec_ctrl() helper
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230727/202307270118.Vk93Fixo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270118.Vk93Fixo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270118.Vk93Fixo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/msr.h:236,
                    from arch/x86/include/asm/nospec-branch.h:12,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/paravirt.h: In function 'slow_down_io':
>> arch/x86/include/asm/paravirt.h:55:9: error: implicit declaration of function 'PVOP_VCALL0' [-Werror=implicit-function-declaration]
      55 |         PVOP_VCALL0(cpu.io_delay);
         |         ^~~~~~~~~~~
>> arch/x86/include/asm/paravirt.h:55:21: error: 'cpu' undeclared (first use in this function)
      55 |         PVOP_VCALL0(cpu.io_delay);
         |                     ^~~
   arch/x86/include/asm/paravirt.h:55:21: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/paravirt.h: At top level:
>> arch/x86/include/asm/paravirt.h:67:43: warning: 'struct flush_tlb_info' declared inside parameter list will not be visible outside of this definition or declaration
      67 |                              const struct flush_tlb_info *info);
         |                                           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_local':
>> arch/x86/include/asm/paravirt.h:71:21: error: 'mmu' undeclared (first use in this function)
      71 |         PVOP_VCALL0(mmu.flush_tlb_user);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_global':
   arch/x86/include/asm/paravirt.h:76:21: error: 'mmu' undeclared (first use in this function)
      76 |         PVOP_VCALL0(mmu.flush_tlb_kernel);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_one_user':
>> arch/x86/include/asm/paravirt.h:81:9: error: implicit declaration of function 'PVOP_VCALL1' [-Werror=implicit-function-declaration]
      81 |         PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:81:21: error: 'mmu' undeclared (first use in this function)
      81 |         PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: At top level:
   arch/x86/include/asm/paravirt.h:85:52: warning: 'struct flush_tlb_info' declared inside parameter list will not be visible outside of this definition or declaration
      85 |                                       const struct flush_tlb_info *info)
         |                                                    ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function '__flush_tlb_multi':
>> arch/x86/include/asm/paravirt.h:87:9: error: implicit declaration of function 'PVOP_VCALL2' [-Werror=implicit-function-declaration]
      87 |         PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:87:21: error: 'mmu' undeclared (first use in this function)
      87 |         PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: At top level:
>> arch/x86/include/asm/paravirt.h:90:53: warning: 'struct mmu_gather' declared inside parameter list will not be visible outside of this definition or declaration
      90 | static inline void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
         |                                                     ^~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_tlb_remove_table':
   arch/x86/include/asm/paravirt.h:92:21: error: 'mmu' undeclared (first use in this function)
      92 |         PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_arch_exit_mmap':
   arch/x86/include/asm/paravirt.h:97:21: error: 'mmu' undeclared (first use in this function); did you mean 'mm'?
      97 |         PVOP_VCALL1(mmu.exit_mmap, mm);
         |                     ^~~
         |                     mm
   arch/x86/include/asm/paravirt.h: In function 'notify_page_enc_status_changed':
>> arch/x86/include/asm/paravirt.h:103:9: error: implicit declaration of function 'PVOP_VCALL3' [-Werror=implicit-function-declaration]
     103 |         PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:103:21: error: 'mmu' undeclared (first use in this function)
     103 |         PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'load_sp0':
   arch/x86/include/asm/paravirt.h:109:21: error: 'cpu' undeclared (first use in this function)
     109 |         PVOP_VCALL1(cpu.load_sp0, sp0);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function '__cpuid':
>> arch/x86/include/asm/paravirt.h:116:9: error: implicit declaration of function 'PVOP_VCALL4' [-Werror=implicit-function-declaration]
     116 |         PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
         |         ^~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:116:21: error: 'cpu' undeclared (first use in this function)
     116 |         PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_get_debugreg':
>> arch/x86/include/asm/paravirt.h:124:16: error: implicit declaration of function 'PVOP_CALL1' [-Werror=implicit-function-declaration]
     124 |         return PVOP_CALL1(unsigned long, cpu.get_debugreg, reg);
         |                ^~~~~~~~~~
>> arch/x86/include/asm/paravirt.h:124:27: error: expected expression before 'unsigned'
     124 |         return PVOP_CALL1(unsigned long, cpu.get_debugreg, reg);
         |                           ^~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'set_debugreg':
   arch/x86/include/asm/paravirt.h:129:21: error: 'cpu' undeclared (first use in this function)
     129 |         PVOP_VCALL2(cpu.set_debugreg, reg, val);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'read_cr0':
>> arch/x86/include/asm/paravirt.h:134:16: error: implicit declaration of function 'PVOP_CALL0' [-Werror=implicit-function-declaration]
     134 |         return PVOP_CALL0(unsigned long, cpu.read_cr0);
         |                ^~~~~~~~~~
   arch/x86/include/asm/paravirt.h:134:27: error: expected expression before 'unsigned'
     134 |         return PVOP_CALL0(unsigned long, cpu.read_cr0);
         |                           ^~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'write_cr0':
   arch/x86/include/asm/paravirt.h:139:21: error: 'cpu' undeclared (first use in this function)
     139 |         PVOP_VCALL1(cpu.write_cr0, x);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'read_cr2':
>> arch/x86/include/asm/paravirt.h:144:16: error: implicit declaration of function 'PVOP_ALT_CALLEE0' [-Werror=implicit-function-declaration]
     144 |         return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
         |                ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:144:33: error: expected expression before 'unsigned'
     144 |         return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
         |                                 ^~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'write_cr2':
   arch/x86/include/asm/paravirt.h:151:21: error: 'mmu' undeclared (first use in this function)
     151 |         PVOP_VCALL1(mmu.write_cr2, x);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function '__read_cr3':
>> arch/x86/include/asm/paravirt.h:156:16: error: implicit declaration of function 'PVOP_ALT_CALL0' [-Werror=implicit-function-declaration]
     156 |         return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
         |                ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:156:31: error: expected expression before 'unsigned'
     156 |         return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
         |                               ^~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'write_cr3':
>> arch/x86/include/asm/paravirt.h:162:9: error: implicit declaration of function 'PVOP_ALT_VCALL1' [-Werror=implicit-function-declaration]
     162 |         PVOP_ALT_VCALL1(mmu.write_cr3, x,
         |         ^~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:162:25: error: 'mmu' undeclared (first use in this function)
     162 |         PVOP_ALT_VCALL1(mmu.write_cr3, x,
         |                         ^~~
   arch/x86/include/asm/paravirt.h: In function '__write_cr4':
   arch/x86/include/asm/paravirt.h:168:21: error: 'cpu' undeclared (first use in this function)
     168 |         PVOP_VCALL1(cpu.write_cr4, x);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'arch_safe_halt':
>> arch/x86/include/asm/paravirt.h:173:21: error: 'irq' undeclared (first use in this function)
     173 |         PVOP_VCALL0(irq.safe_halt);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'halt':
   arch/x86/include/asm/paravirt.h:178:21: error: 'irq' undeclared (first use in this function)
     178 |         PVOP_VCALL0(irq.halt);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'wbinvd':
>> arch/x86/include/asm/paravirt.h:185:9: error: implicit declaration of function 'PVOP_ALT_VCALL0' [-Werror=implicit-function-declaration]
     185 |         PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
         |         ^~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:185:25: error: 'cpu' undeclared (first use in this function)
     185 |         PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
         |                         ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_read_msr':
>> arch/x86/include/asm/paravirt.h:190:27: error: expected expression before 'u64'
     190 |         return PVOP_CALL1(u64, cpu.read_msr, msr);
         |                           ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_write_msr':
   arch/x86/include/asm/paravirt.h:196:21: error: 'cpu' undeclared (first use in this function)
     196 |         PVOP_VCALL3(cpu.write_msr, msr, low, high);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_read_msr_safe':
>> arch/x86/include/asm/paravirt.h:201:16: error: implicit declaration of function 'PVOP_CALL2' [-Werror=implicit-function-declaration]
     201 |         return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
         |                ^~~~~~~~~~
   arch/x86/include/asm/paravirt.h:201:27: error: expected expression before 'u64'
     201 |         return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
         |                           ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_write_msr_safe':
>> arch/x86/include/asm/paravirt.h:207:16: error: implicit declaration of function 'PVOP_CALL3' [-Werror=implicit-function-declaration]
     207 |         return PVOP_CALL3(int, cpu.write_msr_safe, msr, low, high);
         |                ^~~~~~~~~~
   arch/x86/include/asm/paravirt.h:207:27: error: expected expression before 'int'
     207 |         return PVOP_CALL3(int, cpu.write_msr_safe, msr, low, high);
         |                           ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_read_pmc':
   arch/x86/include/asm/paravirt.h:254:27: error: expected expression before 'u64'
     254 |         return PVOP_CALL1(u64, cpu.read_pmc, counter);
         |                           ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_alloc_ldt':
   arch/x86/include/asm/paravirt.h:268:21: error: 'cpu' undeclared (first use in this function)
     268 |         PVOP_VCALL2(cpu.alloc_ldt, ldt, entries);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_free_ldt':
   arch/x86/include/asm/paravirt.h:273:21: error: 'cpu' undeclared (first use in this function)
     273 |         PVOP_VCALL2(cpu.free_ldt, ldt, entries);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'load_TR_desc':
   arch/x86/include/asm/paravirt.h:278:21: error: 'cpu' undeclared (first use in this function)
     278 |         PVOP_VCALL0(cpu.load_tr_desc);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'load_gdt':
   arch/x86/include/asm/paravirt.h:282:21: error: 'cpu' undeclared (first use in this function)
     282 |         PVOP_VCALL1(cpu.load_gdt, dtr);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'load_idt':
   arch/x86/include/asm/paravirt.h:286:21: error: 'cpu' undeclared (first use in this function)
     286 |         PVOP_VCALL1(cpu.load_idt, dtr);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'set_ldt':
   arch/x86/include/asm/paravirt.h:290:21: error: 'cpu' undeclared (first use in this function)
     290 |         PVOP_VCALL2(cpu.set_ldt, addr, entries);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_store_tr':
   arch/x86/include/asm/paravirt.h:294:27: error: expected expression before 'unsigned'
     294 |         return PVOP_CALL0(unsigned long, cpu.store_tr);
         |                           ^~~~~~~~
   arch/x86/include/asm/paravirt.h: At top level:
   arch/x86/include/asm/paravirt.h:298:36: warning: 'struct thread_struct' declared inside parameter list will not be visible outside of this definition or declaration
     298 | static inline void load_TLS(struct thread_struct *t, unsigned cpu)
         |                                    ^~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h: In function 'load_TLS':
   arch/x86/include/asm/paravirt.h:300:24: error: request for member 'load_tls' in something not a structure or union
     300 |         PVOP_VCALL2(cpu.load_tls, t, cpu);
         |                        ^
   arch/x86/include/asm/paravirt.h: In function 'load_gs_index':
   arch/x86/include/asm/paravirt.h:305:21: error: 'cpu' undeclared (first use in this function)
     305 |         PVOP_VCALL1(cpu.load_gs_index, gs);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'write_ldt_entry':
   arch/x86/include/asm/paravirt.h:311:21: error: 'cpu' undeclared (first use in this function)
     311 |         PVOP_VCALL3(cpu.write_ldt_entry, dt, entry, desc);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'write_gdt_entry':
   arch/x86/include/asm/paravirt.h:317:21: error: 'cpu' undeclared (first use in this function)
     317 |         PVOP_VCALL4(cpu.write_gdt_entry, dt, entry, desc, type);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'write_idt_entry':
   arch/x86/include/asm/paravirt.h:322:21: error: 'cpu' undeclared (first use in this function)
     322 |         PVOP_VCALL3(cpu.write_idt_entry, dt, entry, g);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'tss_invalidate_io_bitmap':
   arch/x86/include/asm/paravirt.h:328:21: error: 'cpu' undeclared (first use in this function)
     328 |         PVOP_VCALL0(cpu.invalidate_io_bitmap);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'tss_update_io_bitmap':
   arch/x86/include/asm/paravirt.h:333:21: error: 'cpu' undeclared (first use in this function)
     333 |         PVOP_VCALL0(cpu.update_io_bitmap);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_enter_mmap':
   arch/x86/include/asm/paravirt.h:339:21: error: 'mmu' undeclared (first use in this function)
     339 |         PVOP_VCALL1(mmu.enter_mmap, next);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_pgd_alloc':
   arch/x86/include/asm/paravirt.h:344:27: error: expected expression before 'int'
     344 |         return PVOP_CALL1(int, mmu.pgd_alloc, mm);
         |                           ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_pgd_free':
   arch/x86/include/asm/paravirt.h:349:21: error: 'mmu' undeclared (first use in this function); did you mean 'mm'?
     349 |         PVOP_VCALL2(mmu.pgd_free, mm, pgd);
         |                     ^~~
         |                     mm
   arch/x86/include/asm/paravirt.h: In function 'paravirt_alloc_pte':
   arch/x86/include/asm/paravirt.h:354:21: error: 'mmu' undeclared (first use in this function); did you mean 'mm'?
     354 |         PVOP_VCALL2(mmu.alloc_pte, mm, pfn);
         |                     ^~~
         |                     mm
   arch/x86/include/asm/paravirt.h: In function 'paravirt_release_pte':
   arch/x86/include/asm/paravirt.h:358:21: error: 'mmu' undeclared (first use in this function)
     358 |         PVOP_VCALL1(mmu.release_pte, pfn);
         |                     ^~~
   arch/x86/include/asm/paravirt.h: In function 'paravirt_alloc_pmd':
   arch/x86/include/asm/paravirt.h:363:21: error: 'mmu' undeclared (first use in this function); did you mean 'mm'?
     363 |         PVOP_VCALL2(mmu.alloc_pmd, mm, pfn);
         |                     ^~~
         |                     mm
   arch/x86/include/asm/paravirt.h: In function 'paravirt_release_pmd':
   arch/x86/include/asm/paravirt.h:368:21: error: 'mmu' undeclared (first use in this function)
     368 |         PVOP_VCALL1(mmu.release_pmd, pfn);
         |                     ^~~


vim +/PVOP_VCALL0 +55 arch/x86/include/asm/paravirt.h

4e6292114c7412 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11   51  
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   52  /* The paravirtualized I/O functions */
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   53  static inline void slow_down_io(void)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   54  {
eac46b323b2821 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  @55  	PVOP_VCALL0(cpu.io_delay);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   56  #ifdef REALLY_SLOW_IO
eac46b323b2821 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24   57  	PVOP_VCALL0(cpu.io_delay);
eac46b323b2821 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24   58  	PVOP_VCALL0(cpu.io_delay);
eac46b323b2821 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24   59  	PVOP_VCALL0(cpu.io_delay);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   60  #endif
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   61  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   62  
2faf153bb7346b arch/x86/include/asm/paravirt.h Thomas Gleixner     2020-04-21   63  void native_flush_tlb_local(void);
cd30d26cf307b4 arch/x86/include/asm/paravirt.h Thomas Gleixner     2020-04-21   64  void native_flush_tlb_global(void);
127ac915c8e1c1 arch/x86/include/asm/paravirt.h Thomas Gleixner     2020-04-21   65  void native_flush_tlb_one_user(unsigned long addr);
4ce94eabac16b1 arch/x86/include/asm/paravirt.h Nadav Amit          2021-02-20   66  void native_flush_tlb_multi(const struct cpumask *cpumask,
29def599b38bb8 arch/x86/include/asm/paravirt.h Thomas Gleixner     2020-04-21  @67  			     const struct flush_tlb_info *info);
2faf153bb7346b arch/x86/include/asm/paravirt.h Thomas Gleixner     2020-04-21   68  
2faf153bb7346b arch/x86/include/asm/paravirt.h Thomas Gleixner     2020-04-21   69  static inline void __flush_tlb_local(void)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   70  {
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  @71  	PVOP_VCALL0(mmu.flush_tlb_user);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   72  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   73  
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   74  static inline void __flush_tlb_global(void)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   75  {
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   76  	PVOP_VCALL0(mmu.flush_tlb_kernel);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   77  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   78  
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   79  static inline void __flush_tlb_one_user(unsigned long addr)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   80  {
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  @81  	PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   82  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   83  
4ce94eabac16b1 arch/x86/include/asm/paravirt.h Nadav Amit          2021-02-20   84  static inline void __flush_tlb_multi(const struct cpumask *cpumask,
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   85  				      const struct flush_tlb_info *info)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   86  {
4ce94eabac16b1 arch/x86/include/asm/paravirt.h Nadav Amit          2021-02-20  @87  	PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   88  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   89  
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  @90  static inline void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   91  {
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   92  	PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   93  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   94  
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   95  static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   96  {
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   97  	PVOP_VCALL1(mmu.exit_mmap, mm);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   98  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28   99  
064ce6c550a063 arch/x86/include/asm/paravirt.h Brijesh Singh       2021-08-24  100  static inline void notify_page_enc_status_changed(unsigned long pfn,
064ce6c550a063 arch/x86/include/asm/paravirt.h Brijesh Singh       2021-08-24  101  						  int npages, bool enc)
064ce6c550a063 arch/x86/include/asm/paravirt.h Brijesh Singh       2021-08-24  102  {
064ce6c550a063 arch/x86/include/asm/paravirt.h Brijesh Singh       2021-08-24 @103  	PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  104  }
fdc0269e8958a1 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  105  
9bad5658ea710f arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  106  #ifdef CONFIG_PARAVIRT_XXL
da51da189a24bb arch/x86/include/asm/paravirt.h Andy Lutomirski     2017-11-02  107  static inline void load_sp0(unsigned long sp0)
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  108  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  109  	PVOP_VCALL1(cpu.load_sp0, sp0);
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  110  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  111  
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  112  /* The paravirtualized CPUID instruction. */
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  113  static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  114  			   unsigned int *ecx, unsigned int *edx)
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  115  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @116  	PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  117  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  118  
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  119  /*
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  120   * These special macros can be used to get or set a debugging register
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  121   */
f4afb713e5c3a4 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  122  static __always_inline unsigned long paravirt_get_debugreg(int reg)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  123  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @124  	return PVOP_CALL1(unsigned long, cpu.get_debugreg, reg);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  125  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  126  #define get_debugreg(var, reg) var = paravirt_get_debugreg(reg)
7361fac0465ba9 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  127  static __always_inline void set_debugreg(unsigned long val, int reg)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  128  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  129  	PVOP_VCALL2(cpu.set_debugreg, reg, val);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  130  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  131  
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  132  static inline unsigned long read_cr0(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  133  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @134  	return PVOP_CALL0(unsigned long, cpu.read_cr0);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  135  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  136  
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  137  static inline void write_cr0(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  138  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  139  	PVOP_VCALL1(cpu.write_cr0, x);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  140  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  141  
0a53c9acf4da51 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  142  static __always_inline unsigned long read_cr2(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  143  {
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11 @144  	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11  145  				"mov %%cr2, %%rax;",
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11  146  				ALT_NOT(X86_FEATURE_XENPV));
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  147  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  148  
209cfd0cbb6722 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  149  static __always_inline void write_cr2(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  150  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  151  	PVOP_VCALL1(mmu.write_cr2, x);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  152  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  153  
6c690ee1039b25 arch/x86/include/asm/paravirt.h Andy Lutomirski     2017-06-12  154  static inline unsigned long __read_cr3(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  155  {
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11 @156  	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11  157  			      "mov %%cr3, %%rax;", ALT_NOT(X86_FEATURE_XENPV));
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  158  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  159  
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  160  static inline void write_cr3(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  161  {
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11 @162  	PVOP_ALT_VCALL1(mmu.write_cr3, x,
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11  163  			"mov %%rdi, %%cr3", ALT_NOT(X86_FEATURE_XENPV));
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  164  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  165  
1e02ce4cccdcb9 arch/x86/include/asm/paravirt.h Andy Lutomirski     2014-10-24  166  static inline void __write_cr4(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  167  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  168  	PVOP_VCALL1(cpu.write_cr4, x);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  169  }
3dc494e86d1c93 include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  170  
10a099405fdf96 arch/x86/include/asm/paravirt.h Peter Zijlstra      2023-01-12  171  static __always_inline void arch_safe_halt(void)
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  172  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @173  	PVOP_VCALL0(irq.safe_halt);
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  174  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  175  
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  176  static inline void halt(void)
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  177  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  178  	PVOP_VCALL0(irq.halt);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  179  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  180  
10a099405fdf96 arch/x86/include/asm/paravirt.h Peter Zijlstra      2023-01-12  181  extern noinstr void pv_native_wbinvd(void);
10a099405fdf96 arch/x86/include/asm/paravirt.h Peter Zijlstra      2023-01-12  182  
10a099405fdf96 arch/x86/include/asm/paravirt.h Peter Zijlstra      2023-01-12  183  static __always_inline void wbinvd(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  184  {
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11 @185  	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  186  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  187  
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  188  static inline u64 paravirt_read_msr(unsigned msr)
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  189  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @190  	return PVOP_CALL1(u64, cpu.read_msr, msr);
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  191  }
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  192  
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  193  static inline void paravirt_write_msr(unsigned msr,
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  194  				      unsigned low, unsigned high)
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  195  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  196  	PVOP_VCALL3(cpu.write_msr, msr, low, high);
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  197  }
dd2f4a004b016b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  198  
c2ee03b2a94d7b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  199  static inline u64 paravirt_read_msr_safe(unsigned msr, int *err)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  200  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @201  	return PVOP_CALL2(u64, cpu.read_msr_safe, msr, err);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  202  }
132ec92f3f70fe arch/x86/include/asm/paravirt.h Borislav Petkov     2009-08-31  203  
c2ee03b2a94d7b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  204  static inline int paravirt_write_msr_safe(unsigned msr,
c2ee03b2a94d7b arch/x86/include/asm/paravirt.h Andy Lutomirski     2016-04-02  205  					  unsigned low, unsigned high)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  206  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28 @207  	return PVOP_CALL3(int, cpu.write_msr_safe, msr, low, high);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  208  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  209  

:::::: The code at line 55 was first introduced by commit
:::::: eac46b323b28215ad19d53390737df4aa336ac14 x86/paravirt: Use PVOP_* for paravirt calls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
