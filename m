Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2B2CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688488513; x=1720024513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+mvhIFwSbVFn5fFC5IOLqsqorRk2RBvc8mSlENFgI0=;
  b=b7OejFFIVs2aX3xQab0RBGF2uJ4LrJ64rV1dYC/San/AWUwjOdgxlBV1
   1QbIsrm3gSmTBPhRUy53Aiicn3FVx+kHG3uFyxbNqen+Z3TOfOCQb/BAW
   UJ8SVbepwzJHLBvAthEtZb4yn0KLBxBKrbzR9VpgNBbTTIoRSRjlI8Q4f
   kuCB9CPYbZyKK1csWiaTCIDQ/XwM9NzQaW1ny30YrhFKIKC9s1LC8gAba
   JLa1uH//6m6koql56FN6ToZjbAEzbA0cXIKpqKXbHtom0ueHzpagaQ2yl
   S6/qRRzmJ/7ujJb1XpnC5QYJyXyUWM/TVddO/OHKKz+y7f477uErFRleL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="366639915"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="366639915"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863479265"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="863479265"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2023 09:35:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGizU-000INn-0I;
	Tue, 04 Jul 2023 16:35:00 +0000
Date: Wed, 5 Jul 2023 00:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12990/13166] arch/riscv/kernel/crash_core.c:8:27:
 error: 'VA_BITS' undeclared
Message-ID: <202307050034.tAJSN9qy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1
commit: 8d14224263d97d0d53061cf08c2fa911418b1b7f [12990/13166] riscv/kexec: refactor for kernel/Kconfig.kexec
config: riscv-randconfig-r014-20230704 (https://download.01.org/0day-ci/archive/20230705/202307050034.tAJSN9qy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050034.tAJSN9qy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050034.tAJSN9qy-lkp@intel.com/

Note: the linux-next/master HEAD 1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/crash_core.c:3:
   arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
>> arch/riscv/kernel/crash_core.c:8:27: error: 'VA_BITS' undeclared (first use in this function)
       8 |         VMCOREINFO_NUMBER(VA_BITS);
         |                           ^~~~~~~
   include/linux/crash_core.h:68:64: note: in definition of macro 'VMCOREINFO_NUMBER'
      68 |         vmcoreinfo_append_str("NUMBER(%s)=%ld\n", #name, (long)name)
         |                                                                ^~~~
   arch/riscv/kernel/crash_core.c:8:27: note: each undeclared identifier is reported only once for each function it appears in
       8 |         VMCOREINFO_NUMBER(VA_BITS);
         |                           ^~~~~~~
   include/linux/crash_core.h:68:64: note: in definition of macro 'VMCOREINFO_NUMBER'
      68 |         vmcoreinfo_append_str("NUMBER(%s)=%ld\n", #name, (long)name)
         |                                                                ^~~~
   arch/riscv/kernel/crash_core.c:12:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
      12 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
         |                                                        ~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                        %x
>> arch/riscv/kernel/crash_core.c:14:64: error: 'VMEMMAP_START' undeclared (first use in this function)
      14 |         vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
         |                                                                ^~~~~~~~~~~~~
>> arch/riscv/kernel/crash_core.c:15:62: error: 'VMEMMAP_END' undeclared (first use in this function); did you mean 'MEMREMAP_ENC'?
      15 |         vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
         |                                                              ^~~~~~~~~~~
         |                                                              MEMREMAP_ENC
>> arch/riscv/kernel/crash_core.c:17:64: error: 'MODULES_VADDR' undeclared (first use in this function)
      17 |         vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
         |                                                                ^~~~~~~~~~~~~
>> arch/riscv/kernel/crash_core.c:18:62: error: 'MODULES_END' undeclared (first use in this function)
      18 |         vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
         |                                                              ^~~~~~~~~~~


vim +/VA_BITS +8 arch/riscv/kernel/crash_core.c

649d6b1019a2f2 Xianting Tian 2022-10-26   5  
649d6b1019a2f2 Xianting Tian 2022-10-26   6  void arch_crash_save_vmcoreinfo(void)
649d6b1019a2f2 Xianting Tian 2022-10-26   7  {
649d6b1019a2f2 Xianting Tian 2022-10-26  @8  	VMCOREINFO_NUMBER(VA_BITS);
649d6b1019a2f2 Xianting Tian 2022-10-26   9  	VMCOREINFO_NUMBER(phys_ram_base);
649d6b1019a2f2 Xianting Tian 2022-10-26  10  
649d6b1019a2f2 Xianting Tian 2022-10-26  11  	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
649d6b1019a2f2 Xianting Tian 2022-10-26  12  	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
649d6b1019a2f2 Xianting Tian 2022-10-26  13  	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
649d6b1019a2f2 Xianting Tian 2022-10-26 @14  	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
649d6b1019a2f2 Xianting Tian 2022-10-26 @15  	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
649d6b1019a2f2 Xianting Tian 2022-10-26  16  #ifdef CONFIG_64BIT
649d6b1019a2f2 Xianting Tian 2022-10-26 @17  	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
649d6b1019a2f2 Xianting Tian 2022-10-26 @18  	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);

:::::: The code at line 8 was first introduced by commit
:::::: 649d6b1019a2f243bc3a98cb85902a8ebf74289a RISC-V: Add arch_crash_save_vmcoreinfo support

:::::: TO: Xianting Tian <xianting.tian@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
