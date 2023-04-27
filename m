Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3CC19A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 00:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682555103; x=1714091103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lctmXPgPtyWv0gLti7t/QbW6Yllr1druEQPdniYhRyk=;
  b=InZqkuXrTXbh5wDOgDEoWLjmSeQpsJHtXHsy2ueycORu7/vRUhf+EIra
   cP2koXGWAHdRqpnPAOShWhLKWbLkcgetXdSY0PGZtvyMXSi2h0wjupW+D
   Z5clcfWiyFV+fTpTjUx1UvEpfEk7eZz/He0VZRSpMwPUP+4xCV+jOCvPH
   FiGDL3CQ8DfHNS/H+Hwgvarl3kBTVF2M33LlLPFSUpOx3m3fn6ffqVaZH
   Mxx0mVVmQ3gGnMPWtom3rOnykML3CWdX31gwMBjXf+LtUdm4dy/cZb3aQ
   qRIBQCy8XZ6o81jy57VwvB+PjS9lBW+uq5i/d0wzUKQSQOlAtT7/KchPB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336213864"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="336213864"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 17:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696846707"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="696846707"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 17:24:57 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prpRQ-0000ba-23;
	Thu, 27 Apr 2023 00:24:56 +0000
Date: Thu, 27 Apr 2023 08:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Khalid Aziz <khalid.aziz@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 4/4] mm/ptshare: Add page fault handling for page
 table shared regions
Message-ID: <202304270855.a79e6eaa-lkp@intel.com>
References: <9edffd2a12a049a42d9a2c216e3f999aae7e65a4.1682453344.git.khalid.aziz@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9edffd2a12a049a42d9a2c216e3f999aae7e65a4.1682453344.git.khalid.aziz@oracle.com>

Hi Khalid,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on vfs-idmapping/for-next linus/master v6.3 next-20230426]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Aziz/mm-ptshare-Add-vm-flag-for-shared-PTE/20230427-005143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/9edffd2a12a049a42d9a2c216e3f999aae7e65a4.1682453344.git.khalid.aziz%40oracle.com
patch subject: [PATCH RFC v2 4/4] mm/ptshare: Add page fault handling for page table shared regions
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230427/202304270855.a79e6eaa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a2eef9e49f572b7b2dfa23fc32567e83da9573d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Khalid-Aziz/mm-ptshare-Add-vm-flag-for-shared-PTE/20230427-005143
        git checkout a2eef9e49f572b7b2dfa23fc32567e83da9573d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270855.a79e6eaa-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/ptshare.c: In function 'find_shared_vma':
   mm/ptshare.c:126:17: error: implicit declaration of function 'set_pmd'; did you mean 'get_pmd'? [-Werror=implicit-function-declaration]
     126 |                 set_pmd(guest_pmd, *host_pmd);
         |                 ^~~~~~~
         |                 get_pmd
   mm/ptshare.c: In function 'ptshare_new_mm':
>> mm/ptshare.c:171:15: error: 'struct mm_struct' has no member named 'owner'
     171 |         new_mm->owner = NULL;
         |               ^~
   cc1: some warnings being treated as errors


vim +171 mm/ptshare.c

    96	
    97	/*
    98	 * Find the shared page tables in hosting mm struct and install those in
    99	 * the guest mm struct
   100	 */
   101	vm_fault_t
   102	find_shared_vma(struct vm_area_struct **vmap, unsigned long *addrp,
   103				unsigned int flags)
   104	{
   105		struct ptshare_data *info;
   106		struct mm_struct *host_mm;
   107		struct vm_area_struct *host_vma, *guest_vma = *vmap;
   108		unsigned long host_addr;
   109		pmd_t *guest_pmd, *host_pmd;
   110	
   111		if ((!guest_vma->vm_file) || (!guest_vma->vm_file->f_mapping))
   112			return 0;
   113		info = guest_vma->vm_file->f_mapping->ptshare_data;
   114		if (!info) {
   115			pr_warn("VM_SHARED_PT vma with NULL ptshare_data");
   116			dump_stack_print_info(KERN_WARNING);
   117			return 0;
   118		}
   119		host_mm = info->mm;
   120	
   121		mmap_read_lock(host_mm);
   122		host_addr = *addrp - guest_vma->vm_start + host_mm->mmap_base;
   123		host_pmd = get_pmd(host_mm, host_addr);
   124		guest_pmd = get_pmd(guest_vma->vm_mm, *addrp);
   125		if (!pmd_same(*guest_pmd, *host_pmd)) {
 > 126			set_pmd(guest_pmd, *host_pmd);
   127			mmap_read_unlock(host_mm);
   128			return VM_FAULT_NOPAGE;
   129		}
   130	
   131		*addrp = host_addr;
   132		host_vma = find_vma(host_mm, host_addr);
   133		if (!host_vma)
   134			return VM_FAULT_SIGSEGV;
   135	
   136		/*
   137		 * Point vm_mm for the faulting vma to the mm struct holding shared
   138		 * page tables so the fault handling will happen in the right
   139		 * shared context
   140		 */
   141		guest_vma->vm_mm = host_mm;
   142	
   143		return 0;
   144	}
   145	
   146	/*
   147	 * Create a new mm struct that will hold the shared PTEs. Pointer to
   148	 * this new mm is stored in the data structure ptshare_data which also
   149	 * includes a refcount for any current references to PTEs in this new
   150	 * mm. This refcount is used to determine when the mm struct for shared
   151	 * PTEs can be deleted.
   152	 */
   153	int
   154	ptshare_new_mm(struct file *file, struct vm_area_struct *vma)
   155	{
   156		struct mm_struct *new_mm;
   157		struct ptshare_data *info = NULL;
   158		int retval = 0;
   159		unsigned long start = vma->vm_start;
   160		unsigned long len = vma->vm_end - vma->vm_start;
   161	
   162		new_mm = mm_alloc();
   163		if (!new_mm) {
   164			retval = -ENOMEM;
   165			goto err_free;
   166		}
   167		new_mm->mmap_base = start;
   168		new_mm->task_size = len;
   169		if (!new_mm->task_size)
   170			new_mm->task_size--;
 > 171		new_mm->owner = NULL;
   172	
   173		info = kzalloc(sizeof(*info), GFP_KERNEL);
   174		if (!info) {
   175			retval = -ENOMEM;
   176			goto err_free;
   177		}
   178		info->mm = new_mm;
   179		info->start = start;
   180		info->size = len;
   181		refcount_set(&info->refcnt, 1);
   182		file->f_mapping->ptshare_data = info;
   183	
   184		return retval;
   185	
   186	err_free:
   187		if (new_mm)
   188			mmput(new_mm);
   189		kfree(info);
   190		return retval;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
