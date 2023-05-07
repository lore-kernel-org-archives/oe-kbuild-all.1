Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F75717D8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 04:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683434913; x=1714970913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zrLkM0qI8DvBusYeXToeA2O0S4pPGuk4fJcrmK3FHKI=;
  b=h+bKdxvuQQYIAQZoYNOI+A2JLfFnX9el2WfGbsDHMNDr78GnPEoz/DPy
   XNrUiDLvin6PKkWPzsXyFbc01aIQiLptplggbqcN0GXvUmNQInR5Q29tf
   OgLaky1AIWZyMK6NTQ5dYICoB7ViarfdQL6YSftHZQjQZpMkeT4M0GpRL
   hvSK0pV1quzQM2eWVriqt7ederSa6wMVnxefgdfTqXaqzaY8zLPzMCxUs
   bnbgdsBBvFrbt10XWCnHg1Yhn0mFjgbB7o+cmX1+vV//ERT5Gk+uxMn3r
   H14Wjde5zZfO4AdbxO3oMhNvb5J/8UmMtnTOtSKN1B37PEnPfyA7WPU6B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435767179"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435767179"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 21:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692204454"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="692204454"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 21:48:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvWJv-0000cB-1G;
	Sun, 07 May 2023 04:48:27 +0000
Date: Sun, 7 May 2023 12:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs
 inode iterator
Message-ID: <202305071217.Lv6hIeQy-lkp@intel.com>
References: <20230507040107.3755166-3-houtao@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507040107.3755166-3-houtao@huaweicloud.com>

Hi Hou,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]
[also build test ERROR on linus/master]
[cannot apply to bpf-next/master akpm-mm/mm-everything v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230507040107.3755166-3-houtao%40huaweicloud.com
patch subject: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs inode iterator
config: sparc64-randconfig-r033-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071217.Lv6hIeQy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93ea1c2e394182d3547673f69a808b8c1fa994e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
        git checkout 93ea1c2e394182d3547673f69a808b8c1fa994e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071217.Lv6hIeQy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/decompress/mm.h:80,
                    from lib/decompress_inflate.c:32:
   arch/sparc/include/asm/mman.h: In function 'sparc_calc_vm_prot_bits':
>> arch/sparc/include/asm/mman.h:43:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      43 |                 return VM_SPARC_ADI;
         |                        ^~~~~~~~~~~~
   arch/sparc/include/asm/mman.h:43:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/sparc/include/asm/mman.h: In function 'arch_validate_flags':
   arch/sparc/include/asm/mman.h:67:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      67 |         if (vm_flags & VM_SPARC_ADI) {
         |                        ^~~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:33: error: 'VM_PFNMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                 ^~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:45: error: 'VM_MIXEDMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                             ^~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:83:32: error: 'VM_MERGEABLE' undeclared (first use in this function); did you mean 'MADV_MERGEABLE'?
      83 |                 if (vm_flags & VM_MERGEABLE)
         |                                ^~~~~~~~~~~~
         |                                MADV_MERGEABLE
   lib/decompress_inflate.c: At top level:
   lib/decompress_inflate.c:42:17: warning: no previous prototype for '__gunzip' [-Wmissing-prototypes]
      42 | STATIC int INIT __gunzip(unsigned char *buf, long len,
         |                 ^~~~~~~~
--
   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/decompress/mm.h:80,
                    from lib/decompress_unlz4.c:16:
   arch/sparc/include/asm/mman.h: In function 'sparc_calc_vm_prot_bits':
>> arch/sparc/include/asm/mman.h:43:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      43 |                 return VM_SPARC_ADI;
         |                        ^~~~~~~~~~~~
   arch/sparc/include/asm/mman.h:43:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/sparc/include/asm/mman.h: In function 'arch_validate_flags':
   arch/sparc/include/asm/mman.h:67:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      67 |         if (vm_flags & VM_SPARC_ADI) {
         |                        ^~~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:33: error: 'VM_PFNMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                 ^~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:45: error: 'VM_MIXEDMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                             ^~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:83:32: error: 'VM_MERGEABLE' undeclared (first use in this function); did you mean 'MADV_MERGEABLE'?
      83 |                 if (vm_flags & VM_MERGEABLE)
         |                                ^~~~~~~~~~~~
         |                                MADV_MERGEABLE
--
   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/decompress/mm.h:80,
                    from lib/decompress_unxz.c:107:
   arch/sparc/include/asm/mman.h: In function 'sparc_calc_vm_prot_bits':
>> arch/sparc/include/asm/mman.h:43:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      43 |                 return VM_SPARC_ADI;
         |                        ^~~~~~~~~~~~
   arch/sparc/include/asm/mman.h:43:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/sparc/include/asm/mman.h: In function 'arch_validate_flags':
   arch/sparc/include/asm/mman.h:67:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      67 |         if (vm_flags & VM_SPARC_ADI) {
         |                        ^~~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:33: error: 'VM_PFNMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                 ^~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:45: error: 'VM_MIXEDMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                             ^~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:83:32: error: 'VM_MERGEABLE' undeclared (first use in this function); did you mean 'MADV_MERGEABLE'?
      83 |                 if (vm_flags & VM_MERGEABLE)
         |                                ^~~~~~~~~~~~
         |                                MADV_MERGEABLE
   lib/decompress_unxz.c: At top level:
   lib/decompress_unxz.c:251:17: warning: no previous prototype for 'unxz' [-Wmissing-prototypes]
     251 | STATIC int INIT unxz(unsigned char *in, long in_size,
         |                 ^~~~
--
   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/decompress/mm.h:80,
                    from lib/decompress_unzstd.c:74:
   arch/sparc/include/asm/mman.h: In function 'sparc_calc_vm_prot_bits':
>> arch/sparc/include/asm/mman.h:43:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      43 |                 return VM_SPARC_ADI;
         |                        ^~~~~~~~~~~~
   arch/sparc/include/asm/mman.h:43:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/sparc/include/asm/mman.h: In function 'arch_validate_flags':
   arch/sparc/include/asm/mman.h:67:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      67 |         if (vm_flags & VM_SPARC_ADI) {
         |                        ^~~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:33: error: 'VM_PFNMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                 ^~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:45: error: 'VM_MIXEDMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                             ^~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:83:32: error: 'VM_MERGEABLE' undeclared (first use in this function); did you mean 'MADV_MERGEABLE'?
      83 |                 if (vm_flags & VM_MERGEABLE)
         |                                ^~~~~~~~~~~~
         |                                MADV_MERGEABLE
   lib/decompress_unzstd.c: At top level:
   lib/decompress_unzstd.c:331:17: warning: no previous prototype for 'unzstd' [-Wmissing-prototypes]
     331 | STATIC int INIT unzstd(unsigned char *buf, long len,
         |                 ^~~~~~
--
   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/proc_fs.h:10,
                    from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:261,
                    from include/linux/clk-provider.h:9,
                    from lib/vsprintf.c:23:
   arch/sparc/include/asm/mman.h: In function 'sparc_calc_vm_prot_bits':
>> arch/sparc/include/asm/mman.h:43:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      43 |                 return VM_SPARC_ADI;
         |                        ^~~~~~~~~~~~
   arch/sparc/include/asm/mman.h:43:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/sparc/include/asm/mman.h: In function 'arch_validate_flags':
   arch/sparc/include/asm/mman.h:67:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      67 |         if (vm_flags & VM_SPARC_ADI) {
         |                        ^~~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:33: error: 'VM_PFNMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                 ^~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:45: error: 'VM_MIXEDMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                             ^~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:83:32: error: 'VM_MERGEABLE' undeclared (first use in this function); did you mean 'MADV_MERGEABLE'?
      83 |                 if (vm_flags & VM_MERGEABLE)
         |                                ^~~~~~~~~~~~
         |                                MADV_MERGEABLE
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1681:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1681 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/proc_fs.h:10,
                    from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:261,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/device.h:8,
                    from include/linux/device.h:33,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from lib/radix-tree.c:15:
   arch/sparc/include/asm/mman.h: In function 'sparc_calc_vm_prot_bits':
>> arch/sparc/include/asm/mman.h:43:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      43 |                 return VM_SPARC_ADI;
         |                        ^~~~~~~~~~~~
   arch/sparc/include/asm/mman.h:43:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/sparc/include/asm/mman.h: In function 'arch_validate_flags':
   arch/sparc/include/asm/mman.h:67:24: error: 'VM_SPARC_ADI' undeclared (first use in this function)
      67 |         if (vm_flags & VM_SPARC_ADI) {
         |                        ^~~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:33: error: 'VM_PFNMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                 ^~~~~~~~~
>> arch/sparc/include/asm/mman.h:72:45: error: 'VM_MIXEDMAP' undeclared (first use in this function)
      72 |                 if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
         |                                             ^~~~~~~~~~~
>> arch/sparc/include/asm/mman.h:83:32: error: 'VM_MERGEABLE' undeclared (first use in this function); did you mean 'MADV_MERGEABLE'?
      83 |                 if (vm_flags & VM_MERGEABLE)
         |                                ^~~~~~~~~~~~
         |                                MADV_MERGEABLE
   lib/radix-tree.c: At top level:
   lib/radix-tree.c:288:6: warning: no previous prototype for 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/VM_SPARC_ADI +43 arch/sparc/include/asm/mman.h

74a04967482faa Khalid Aziz 2018-02-23  29  
74a04967482faa Khalid Aziz 2018-02-23  30  #define arch_calc_vm_prot_bits(prot, pkey) sparc_calc_vm_prot_bits(prot)
74a04967482faa Khalid Aziz 2018-02-23  31  static inline unsigned long sparc_calc_vm_prot_bits(unsigned long prot)
74a04967482faa Khalid Aziz 2018-02-23  32  {
74a04967482faa Khalid Aziz 2018-02-23  33  	if (adi_capable() && (prot & PROT_ADI)) {
74a04967482faa Khalid Aziz 2018-02-23  34  		struct pt_regs *regs;
74a04967482faa Khalid Aziz 2018-02-23  35  
74a04967482faa Khalid Aziz 2018-02-23  36  		if (!current->mm->context.adi) {
74a04967482faa Khalid Aziz 2018-02-23  37  			regs = task_pt_regs(current);
74a04967482faa Khalid Aziz 2018-02-23  38  			regs->tstate |= TSTATE_MCDE;
74a04967482faa Khalid Aziz 2018-02-23  39  			current->mm->context.adi = true;
74a04967482faa Khalid Aziz 2018-02-23  40  			on_each_cpu_mask(mm_cpumask(current->mm),
74a04967482faa Khalid Aziz 2018-02-23  41  					 ipi_set_tstate_mcde, current->mm, 0);
74a04967482faa Khalid Aziz 2018-02-23  42  		}
74a04967482faa Khalid Aziz 2018-02-23 @43  		return VM_SPARC_ADI;
74a04967482faa Khalid Aziz 2018-02-23  44  	} else {
74a04967482faa Khalid Aziz 2018-02-23  45  		return 0;
74a04967482faa Khalid Aziz 2018-02-23  46  	}
74a04967482faa Khalid Aziz 2018-02-23  47  }
74a04967482faa Khalid Aziz 2018-02-23  48  
74a04967482faa Khalid Aziz 2018-02-23  49  #define arch_validate_prot(prot, addr) sparc_validate_prot(prot, addr)
74a04967482faa Khalid Aziz 2018-02-23  50  static inline int sparc_validate_prot(unsigned long prot, unsigned long addr)
74a04967482faa Khalid Aziz 2018-02-23  51  {
74a04967482faa Khalid Aziz 2018-02-23  52  	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI))
74a04967482faa Khalid Aziz 2018-02-23  53  		return 0;
147d8622f2a26e Khalid Aziz 2020-10-23  54  	return 1;
147d8622f2a26e Khalid Aziz 2020-10-23  55  }
74a04967482faa Khalid Aziz 2018-02-23  56  
147d8622f2a26e Khalid Aziz 2020-10-23  57  #define arch_validate_flags(vm_flags) arch_validate_flags(vm_flags)
147d8622f2a26e Khalid Aziz 2020-10-23  58  /* arch_validate_flags() - Ensure combination of flags is valid for a
147d8622f2a26e Khalid Aziz 2020-10-23  59   *	VMA.
74a04967482faa Khalid Aziz 2018-02-23  60   */
147d8622f2a26e Khalid Aziz 2020-10-23  61  static inline bool arch_validate_flags(unsigned long vm_flags)
147d8622f2a26e Khalid Aziz 2020-10-23  62  {
147d8622f2a26e Khalid Aziz 2020-10-23  63  	/* If ADI is being enabled on this VMA, check for ADI
147d8622f2a26e Khalid Aziz 2020-10-23  64  	 * capability on the platform and ensure VMA is suitable
147d8622f2a26e Khalid Aziz 2020-10-23  65  	 * for ADI
147d8622f2a26e Khalid Aziz 2020-10-23  66  	 */
147d8622f2a26e Khalid Aziz 2020-10-23 @67  	if (vm_flags & VM_SPARC_ADI) {
147d8622f2a26e Khalid Aziz 2020-10-23  68  		if (!adi_capable())
147d8622f2a26e Khalid Aziz 2020-10-23  69  			return false;
147d8622f2a26e Khalid Aziz 2020-10-23  70  
147d8622f2a26e Khalid Aziz 2020-10-23  71  		/* ADI can not be enabled on PFN mapped pages */
147d8622f2a26e Khalid Aziz 2020-10-23 @72  		if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
147d8622f2a26e Khalid Aziz 2020-10-23  73  			return false;
74a04967482faa Khalid Aziz 2018-02-23  74  
74a04967482faa Khalid Aziz 2018-02-23  75  		/* Mergeable pages can become unmergeable
74a04967482faa Khalid Aziz 2018-02-23  76  		 * if ADI is enabled on them even if they
74a04967482faa Khalid Aziz 2018-02-23  77  		 * have identical data on them. This can be
74a04967482faa Khalid Aziz 2018-02-23  78  		 * because ADI enabled pages with identical
74a04967482faa Khalid Aziz 2018-02-23  79  		 * data may still not have identical ADI
74a04967482faa Khalid Aziz 2018-02-23  80  		 * tags on them. Disallow ADI on mergeable
74a04967482faa Khalid Aziz 2018-02-23  81  		 * pages.
74a04967482faa Khalid Aziz 2018-02-23  82  		 */
147d8622f2a26e Khalid Aziz 2020-10-23 @83  		if (vm_flags & VM_MERGEABLE)
147d8622f2a26e Khalid Aziz 2020-10-23  84  			return false;
74a04967482faa Khalid Aziz 2018-02-23  85  	}
147d8622f2a26e Khalid Aziz 2020-10-23  86  	return true;
74a04967482faa Khalid Aziz 2018-02-23  87  }
74a04967482faa Khalid Aziz 2018-02-23  88  #endif /* CONFIG_SPARC64 */
74a04967482faa Khalid Aziz 2018-02-23  89  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
