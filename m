Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B92916
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675526211; x=1707062211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTcT02PzffMDrhUwUMJ1CIEsrrgcZGIwYR3GHiVoRYs=;
  b=kS4OW+L0I9zr7lzS0BnHguf0p+p0W70RfIyOrDj3lCv4zJhQUk1ulav1
   Lze8CtJK5iOldzuCSltEoeyvNE7vcIU2/K8amtKP5+6D41IBC2GraAF/A
   EXJ44AICsPcaMSOXwnGJEHQmLa9s0SpsamsgcPO4QVnGo+a6FtBbvhEdv
   g12aWVfQyvsdEUQI4oQI6PYMfbKM52aKd+nujfHSfm7Dbmy/TpMJHTbGA
   4/pHtVQ2CJGleyo/U/VSXkx4hvaRu8bOYyUrSXG8aveAzgXNqG/kO0tnF
   CNd0PxeNMG4j1nMnzo9iKO5t/1IEzDFEGRuSRf+Ut/BzWnwyCX35UV+hV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393550664"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393550664"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 07:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698397761"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="698397761"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 07:56:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOKuG-0001P2-0N;
	Sat, 04 Feb 2023 15:56:48 +0000
Date: Sat, 4 Feb 2023 23:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/ia64/kernel/machine_kexec.c:132:43: error: 'ia64_boot_param'
 undeclared
Message-ID: <202302042336.A9pRbElx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230203-160118
head:   25be89d3c286e3bab7eedaa49d83ddab673cfb2b
commit: 00c59885b1a3b277c97d4f82753ff79dbfab547b ia64: Remove COMMAND_LINE_SIZE from uapi
date:   32 hours ago
config: ia64-defconfig (https://download.01.org/0day-ci/archive/20230204/202302042336.A9pRbElx-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/00c59885b1a3b277c97d4f82753ff79dbfab547b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230203-160118
        git checkout 00c59885b1a3b277c97d4f82753ff79dbfab547b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kexec.h:36,
                    from arch/ia64/kernel/machine_kexec.c:12:
   arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
   arch/ia64/kernel/machine_kexec.c:32:48: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 |                                         struct ia64_boot_param *boot_param,
         |                                                ^~~~~~~~~~~~~~~
   arch/ia64/kernel/machine_kexec.c: In function 'ia64_machine_kexec':
>> arch/ia64/kernel/machine_kexec.c:132:43: error: 'ia64_boot_param' undeclared (first use in this function)
     132 |         (*rnk)(image->head, image->start, ia64_boot_param,
         |                                           ^~~~~~~~~~~~~~~
   arch/ia64/kernel/machine_kexec.c:132:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/ia64_boot_param +132 arch/ia64/kernel/machine_kexec.c

a79561134f38de Zou Nan hai      2006-12-07  @12  #include <linux/kexec.h>
a79561134f38de Zou Nan hai      2006-12-07   13  #include <linux/cpu.h>
a79561134f38de Zou Nan hai      2006-12-07   14  #include <linux/irq.h>
abac08dbb4739f Horms            2007-02-05   15  #include <linux/efi.h>
fd59d231f81cb0 Ken'ichi Ohmichi 2007-10-16   16  #include <linux/numa.h>
fd59d231f81cb0 Ken'ichi Ohmichi 2007-10-16   17  #include <linux/mmzone.h>
7259888e84d5b6 Andrew Morton    2007-10-17   18  
8ff059b8531f3b Ard Biesheuvel   2021-01-18   19  #include <asm/efi.h>
7259888e84d5b6 Andrew Morton    2007-10-17   20  #include <asm/numa.h>
a79561134f38de Zou Nan hai      2006-12-07   21  #include <asm/mmu_context.h>
a79561134f38de Zou Nan hai      2006-12-07   22  #include <asm/setup.h>
a79561134f38de Zou Nan hai      2006-12-07   23  #include <asm/delay.h>
a79561134f38de Zou Nan hai      2006-12-07   24  #include <asm/meminit.h>
00cab92f9e91c0 Ken'ichi Ohmichi 2007-10-16   25  #include <asm/processor.h>
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   26  #include <asm/sal.h>
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   27  #include <asm/mca.h>
a79561134f38de Zou Nan hai      2006-12-07   28  
9402c95f34a66e Joe Perches      2012-01-12   29  typedef void (*relocate_new_kernel_t)(
53da5763bf129d Horms            2006-12-12   30  					unsigned long indirection_page,
53da5763bf129d Horms            2006-12-12   31  					unsigned long start_address,
53da5763bf129d Horms            2006-12-12   32  					struct ia64_boot_param *boot_param,
ff2d8b19a3a625 Joe Perches      2012-01-12   33  					unsigned long pal_addr) __noreturn;
a79561134f38de Zou Nan hai      2006-12-07   34  
a79561134f38de Zou Nan hai      2006-12-07   35  struct kimage *ia64_kimage;
a79561134f38de Zou Nan hai      2006-12-07   36  
a79561134f38de Zou Nan hai      2006-12-07   37  struct resource efi_memmap_res = {
a79561134f38de Zou Nan hai      2006-12-07   38          .name  = "EFI Memory Map",
a79561134f38de Zou Nan hai      2006-12-07   39          .start = 0,
a79561134f38de Zou Nan hai      2006-12-07   40          .end   = 0,
a79561134f38de Zou Nan hai      2006-12-07   41          .flags = IORESOURCE_BUSY | IORESOURCE_MEM
a79561134f38de Zou Nan hai      2006-12-07   42  };
a79561134f38de Zou Nan hai      2006-12-07   43  
a79561134f38de Zou Nan hai      2006-12-07   44  struct resource boot_param_res = {
a79561134f38de Zou Nan hai      2006-12-07   45          .name  = "Boot parameter",
a79561134f38de Zou Nan hai      2006-12-07   46          .start = 0,
a79561134f38de Zou Nan hai      2006-12-07   47          .end   = 0,
a79561134f38de Zou Nan hai      2006-12-07   48          .flags = IORESOURCE_BUSY | IORESOURCE_MEM
a79561134f38de Zou Nan hai      2006-12-07   49  };
a79561134f38de Zou Nan hai      2006-12-07   50  
a79561134f38de Zou Nan hai      2006-12-07   51  
a79561134f38de Zou Nan hai      2006-12-07   52  /*
a79561134f38de Zou Nan hai      2006-12-07   53   * Do what every setup is needed on image and the
a79561134f38de Zou Nan hai      2006-12-07   54   * reboot code buffer to allow us to avoid allocations
a79561134f38de Zou Nan hai      2006-12-07   55   * later.
a79561134f38de Zou Nan hai      2006-12-07   56   */
a79561134f38de Zou Nan hai      2006-12-07   57  int machine_kexec_prepare(struct kimage *image)
a79561134f38de Zou Nan hai      2006-12-07   58  {
a79561134f38de Zou Nan hai      2006-12-07   59  	void *control_code_buffer;
a79561134f38de Zou Nan hai      2006-12-07   60  	const unsigned long *func;
a79561134f38de Zou Nan hai      2006-12-07   61  
a79561134f38de Zou Nan hai      2006-12-07   62  	func = (unsigned long *)&relocate_new_kernel;
a79561134f38de Zou Nan hai      2006-12-07   63  	/* Pre-load control code buffer to minimize work in kexec path */
a79561134f38de Zou Nan hai      2006-12-07   64  	control_code_buffer = page_address(image->control_code_page);
a79561134f38de Zou Nan hai      2006-12-07   65  	memcpy((void *)control_code_buffer, (const void *)func[0],
a79561134f38de Zou Nan hai      2006-12-07   66  			relocate_new_kernel_size);
a79561134f38de Zou Nan hai      2006-12-07   67  	flush_icache_range((unsigned long)control_code_buffer,
a79561134f38de Zou Nan hai      2006-12-07   68  			(unsigned long)control_code_buffer + relocate_new_kernel_size);
a79561134f38de Zou Nan hai      2006-12-07   69  	ia64_kimage = image;
a79561134f38de Zou Nan hai      2006-12-07   70  
a79561134f38de Zou Nan hai      2006-12-07   71  	return 0;
a79561134f38de Zou Nan hai      2006-12-07   72  }
a79561134f38de Zou Nan hai      2006-12-07   73  
a79561134f38de Zou Nan hai      2006-12-07   74  void machine_kexec_cleanup(struct kimage *image)
a79561134f38de Zou Nan hai      2006-12-07   75  {
a79561134f38de Zou Nan hai      2006-12-07   76  }
a79561134f38de Zou Nan hai      2006-12-07   77  
a79561134f38de Zou Nan hai      2006-12-07   78  /*
a79561134f38de Zou Nan hai      2006-12-07   79   * Do not allocate memory (or fail in any way) in machine_kexec().
a79561134f38de Zou Nan hai      2006-12-07   80   * We are past the point of no return, committed to rebooting now.
a79561134f38de Zou Nan hai      2006-12-07   81   */
a79561134f38de Zou Nan hai      2006-12-07   82  static void ia64_machine_kexec(struct unw_frame_info *info, void *arg)
a79561134f38de Zou Nan hai      2006-12-07   83  {
a79561134f38de Zou Nan hai      2006-12-07   84  	struct kimage *image = arg;
a79561134f38de Zou Nan hai      2006-12-07   85  	relocate_new_kernel_t rnk;
a79561134f38de Zou Nan hai      2006-12-07   86  	void *pal_addr = efi_get_pal_addr();
36a45e74178362 Wei Yongjun      2012-09-10   87  	unsigned long code_addr;
a79561134f38de Zou Nan hai      2006-12-07   88  	int ii;
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   89  	u64 fp, gp;
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   90  	ia64_fptr_t *init_handler = (ia64_fptr_t *)ia64_os_init_on_kdump;
a79561134f38de Zou Nan hai      2006-12-07   91  
c2c77fe8df3e03 Bernhard Walle   2007-01-28   92  	BUG_ON(!image);
36a45e74178362 Wei Yongjun      2012-09-10   93  	code_addr = (unsigned long)page_address(image->control_code_page);
a79561134f38de Zou Nan hai      2006-12-07   94  	if (image->type == KEXEC_TYPE_CRASH) {
a79561134f38de Zou Nan hai      2006-12-07   95  		crash_save_this_cpu();
a79561134f38de Zou Nan hai      2006-12-07   96  		current->thread.ksp = (__u64)info->sw - 16;
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   97  
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   98  		/* Register noop init handler */
07a6a4ae827b54 Hidetoshi Seto   2009-08-06   99  		fp = ia64_tpa(init_handler->fp);
07a6a4ae827b54 Hidetoshi Seto   2009-08-06  100  		gp = ia64_tpa(ia64_getreg(_IA64_REG_GP));
07a6a4ae827b54 Hidetoshi Seto   2009-08-06  101  		ia64_sal_set_vectors(SAL_VECTOR_OS_INIT, fp, gp, 0, fp, gp, 0);
07a6a4ae827b54 Hidetoshi Seto   2009-08-06  102  	} else {
07a6a4ae827b54 Hidetoshi Seto   2009-08-06  103  		/* Unregister init handlers of current kernel */
07a6a4ae827b54 Hidetoshi Seto   2009-08-06  104  		ia64_sal_set_vectors(SAL_VECTOR_OS_INIT, 0, 0, 0, 0, 0, 0);
a79561134f38de Zou Nan hai      2006-12-07  105  	}
a79561134f38de Zou Nan hai      2006-12-07  106  
6cc3efcdf01cf8 Hidetoshi Seto   2009-08-06  107  	/* Unregister mca handler - No more recovery on current kernel */
6cc3efcdf01cf8 Hidetoshi Seto   2009-08-06  108  	ia64_sal_set_vectors(SAL_VECTOR_OS_MCA, 0, 0, 0, 0, 0, 0);
6cc3efcdf01cf8 Hidetoshi Seto   2009-08-06  109  
a79561134f38de Zou Nan hai      2006-12-07  110  	/* Interrupts aren't acceptable while we reboot */
a79561134f38de Zou Nan hai      2006-12-07  111  	local_irq_disable();
a79561134f38de Zou Nan hai      2006-12-07  112  
a79561134f38de Zou Nan hai      2006-12-07  113  	/* Mask CMC and Performance Monitor interrupts */
a79561134f38de Zou Nan hai      2006-12-07  114  	ia64_setreg(_IA64_REG_CR_PMV, 1 << 16);
a79561134f38de Zou Nan hai      2006-12-07  115  	ia64_setreg(_IA64_REG_CR_CMCV, 1 << 16);
a79561134f38de Zou Nan hai      2006-12-07  116  
a79561134f38de Zou Nan hai      2006-12-07  117  	/* Mask ITV and Local Redirect Registers */
a79561134f38de Zou Nan hai      2006-12-07  118  	ia64_set_itv(1 << 16);
a79561134f38de Zou Nan hai      2006-12-07  119  	ia64_set_lrr0(1 << 16);
a79561134f38de Zou Nan hai      2006-12-07  120  	ia64_set_lrr1(1 << 16);
a79561134f38de Zou Nan hai      2006-12-07  121  
a79561134f38de Zou Nan hai      2006-12-07  122  	/* terminate possible nested in-service interrupts */
a79561134f38de Zou Nan hai      2006-12-07  123  	for (ii = 0; ii < 16; ii++)
a79561134f38de Zou Nan hai      2006-12-07  124  		ia64_eoi();
a79561134f38de Zou Nan hai      2006-12-07  125  
a79561134f38de Zou Nan hai      2006-12-07  126  	/* unmask TPR and clear any pending interrupts */
a79561134f38de Zou Nan hai      2006-12-07  127  	ia64_setreg(_IA64_REG_CR_TPR, 0);
a79561134f38de Zou Nan hai      2006-12-07  128  	ia64_srlz_d();
a62c9fe4637f62 Simon Horman     2007-09-19  129  	while (ia64_get_ivr() != IA64_SPURIOUS_INT_VECTOR)
a79561134f38de Zou Nan hai      2006-12-07  130  		ia64_eoi();
a79561134f38de Zou Nan hai      2006-12-07  131  	rnk = (relocate_new_kernel_t)&code_addr;
a79561134f38de Zou Nan hai      2006-12-07 @132  	(*rnk)(image->head, image->start, ia64_boot_param,
a79561134f38de Zou Nan hai      2006-12-07  133  		     GRANULEROUNDDOWN((unsigned long) pal_addr));
a79561134f38de Zou Nan hai      2006-12-07  134  	BUG();
a79561134f38de Zou Nan hai      2006-12-07  135  }
a79561134f38de Zou Nan hai      2006-12-07  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
