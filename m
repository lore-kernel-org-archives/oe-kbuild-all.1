Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B161D36A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679078358; x=1710614358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7bTSljHAqM7MG2tQv/xtsvpZjiGyYDDei8RZI9tKqpE=;
  b=AjM4N7rgwHSjSoI/wOp4zyp7ff5F5alsISaTRwnp0FDYz1fryCFQZilm
   za1ePK1cMvFQbL18yPzeo98qiUmnTtBVshUPBXX3GKPwq3V5of136xTPh
   CbreUwck49CuycJp638tl5TwrfiQDuUW5Dow7wfzrfLN+mDxnHJv4mPuf
   RdN7IWJiHOYSPrS723xSxgSnpV2NcWDsyn+k2OxVKXnYxxJdIGzsAh+Qp
   NiGN7qknpqg3nXRcmWU/k6MWyr+bUkkIKvmlSJdP/xg2OgTPU5XIG9riK
   FG6RmCgpKAu+zg6EIyvjHvh7SS8FzfMj45F1kml5rihe1zJj/q1/I2RZQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326697615"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="326697615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 11:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="854538692"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854538692"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 11:39:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdEyy-0009Ww-1K;
	Fri, 17 Mar 2023 18:39:16 +0000
Date: Sat, 18 Mar 2023 02:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/uaccess/fixes 1/4] lib/usercopy_kunit.c:75: undefined
 reference to `insert_vm_struct'
Message-ID: <202303180213.598v54KB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/uaccess/fixes
head:   bcab174e50dd95f92848c50fdfec65390e201a4b
commit: ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6 [1/4] lib: test copy_{to,from}_user()
config: arm-randconfig-r021-20230315 (https://download.01.org/0day-ci/archive/20230318/202303180213.598v54KB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/uaccess/fixes
        git checkout ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180213.598v54KB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/usercopy_kunit.o: in function `usercopy_mm_alloc':
>> lib/usercopy_kunit.c:75: undefined reference to `insert_vm_struct'


vim +75 lib/usercopy_kunit.c

    53	
    54	static void *usercopy_mm_alloc(struct usercopy_env *env)
    55	{
    56		struct mm_struct *mm;
    57		struct vm_area_struct *vma;
    58		mm = mm_alloc();
    59		if (!mm)
    60			return NULL;
    61	
    62		if (mmap_write_lock_killable(mm))
    63			goto out_free;
    64	
    65		vma = vm_area_alloc(mm);
    66		if (!vma)
    67			goto out_unlock;
    68	
    69		vma_set_anonymous(vma);
    70		vma->vm_start = UBUF_ADDR_BASE;
    71		vma->vm_end = UBUF_ADDR_BASE + PAGE_SIZE;
    72		vm_flags_init(vma, VM_READ | VM_MAYREAD | VM_WRITE | VM_MAYWRITE);
    73		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
    74	
  > 75		if (insert_vm_struct(mm, vma))
    76			goto out_free_vma;
    77	
    78		mmap_write_unlock(mm);
    79		return mm;
    80	
    81	out_free_vma:
    82		vm_area_free(vma);
    83	out_unlock:
    84		mmap_write_unlock(mm);
    85	out_free:
    86		mmput(mm);
    87		return NULL;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
