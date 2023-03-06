Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7653A6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 22:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678142080; x=1709678080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MiFJ0VjNLWwn46foQSqyN9rBclOxjgMO6d+4JU+dqBU=;
  b=jahQzLGJlgf5+lSlcYwYfjcbuzentXWdCJtO/OdY4LQIckXHBj5vYMmu
   2+CvTLPnHWqlDAkWVRtq4O/7lJAOsLiBKNmKC+oG4seCSgKNFr9Ghrwmg
   l1T/hAGgSpKxXXqhupqMqVdiSSVh3qoX7z1s9+6wTg5/kd+4lYFZGT2oz
   /VbK9d5M/HA6OiOmwO1EWl2W5Q/Npmjm8vi9IzUk5BpdpWxPOa0KX6DbC
   3e4UH8gvO+v1yxNK08+kxMfqtX26nEHfdwXSqE8Fe6Jm0x90j8UhzRU1u
   Gyyury9GIIg61vgR0p4aC3HiWJ/VPxtnaB17mbdfmxkQcepyHGA5TWNTR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338021152"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="338021152"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 14:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="765388056"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="765388056"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Mar 2023 14:34:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZJPh-0000h3-0P;
	Mon, 06 Mar 2023 22:34:37 +0000
Date: Tue, 7 Mar 2023 06:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:unmapped-alloc/rfc-v1 5/5] mm/secretmem.c:56:23: warning:
 unused variable 'addr'
Message-ID: <202303070609.HOppmoFR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git unmapped-alloc/rfc-v1
head:   2f53d9d6383b30f320f5030bcc466b96737b9606
commit: 2f53d9d6383b30f320f5030bcc466b96737b9606 [5/5] EXPERIMENTAL: mm/secretmem: use __GFP_UNMAPPED
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230307/202303070609.HOppmoFR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=2f53d9d6383b30f320f5030bcc466b96737b9606
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt unmapped-alloc/rfc-v1
        git checkout 2f53d9d6383b30f320f5030bcc466b96737b9606
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070609.HOppmoFR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/secretmem.c: In function 'secretmem_fault':
>> mm/secretmem.c:56:23: warning: unused variable 'addr' [-Wunused-variable]
      56 |         unsigned long addr;
         |                       ^~~~


vim +/addr +56 mm/secretmem.c

9a436f8ff6316c Mike Rapoport       2021-07-07  49  
1507f51255c9ff Mike Rapoport       2021-07-07  50  static vm_fault_t secretmem_fault(struct vm_fault *vmf)
1507f51255c9ff Mike Rapoport       2021-07-07  51  {
1507f51255c9ff Mike Rapoport       2021-07-07  52  	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
1507f51255c9ff Mike Rapoport       2021-07-07  53  	struct inode *inode = file_inode(vmf->vma->vm_file);
1507f51255c9ff Mike Rapoport       2021-07-07  54  	pgoff_t offset = vmf->pgoff;
1507f51255c9ff Mike Rapoport       2021-07-07  55  	gfp_t gfp = vmf->gfp_mask;
1507f51255c9ff Mike Rapoport       2021-07-07 @56  	unsigned long addr;
1507f51255c9ff Mike Rapoport       2021-07-07  57  	struct page *page;
84ac013046ccc4 Mike Rapoport       2022-07-07  58  	vm_fault_t ret;
1507f51255c9ff Mike Rapoport       2021-07-07  59  	int err;
1507f51255c9ff Mike Rapoport       2021-07-07  60  
1507f51255c9ff Mike Rapoport       2021-07-07  61  	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
1507f51255c9ff Mike Rapoport       2021-07-07  62  		return vmf_error(-EINVAL);
1507f51255c9ff Mike Rapoport       2021-07-07  63  
84ac013046ccc4 Mike Rapoport       2022-07-07  64  	filemap_invalidate_lock_shared(mapping);
84ac013046ccc4 Mike Rapoport       2022-07-07  65  
1507f51255c9ff Mike Rapoport       2021-07-07  66  retry:
1507f51255c9ff Mike Rapoport       2021-07-07  67  	page = find_lock_page(mapping, offset);
1507f51255c9ff Mike Rapoport       2021-07-07  68  	if (!page) {
2f53d9d6383b30 Mike Rapoport (IBM  2022-11-17  69) 		page = alloc_page(gfp | __GFP_ZERO | __GFP_UNMAPPED);
84ac013046ccc4 Mike Rapoport       2022-07-07  70  		if (!page) {
84ac013046ccc4 Mike Rapoport       2022-07-07  71  			ret = VM_FAULT_OOM;
84ac013046ccc4 Mike Rapoport       2022-07-07  72  			goto out;
84ac013046ccc4 Mike Rapoport       2022-07-07  73  		}
1507f51255c9ff Mike Rapoport       2021-07-07  74  
1507f51255c9ff Mike Rapoport       2021-07-07  75  		__SetPageUptodate(page);
1507f51255c9ff Mike Rapoport       2021-07-07  76  		err = add_to_page_cache_lru(page, mapping, offset, gfp);
1507f51255c9ff Mike Rapoport       2021-07-07  77  		if (unlikely(err)) {
1507f51255c9ff Mike Rapoport       2021-07-07  78  			put_page(page);
1507f51255c9ff Mike Rapoport       2021-07-07  79  			if (err == -EEXIST)
1507f51255c9ff Mike Rapoport       2021-07-07  80  				goto retry;
1507f51255c9ff Mike Rapoport       2021-07-07  81  
84ac013046ccc4 Mike Rapoport       2022-07-07  82  			ret = vmf_error(err);
84ac013046ccc4 Mike Rapoport       2022-07-07  83  			goto out;
1507f51255c9ff Mike Rapoport       2021-07-07  84  		}
1507f51255c9ff Mike Rapoport       2021-07-07  85  	}
1507f51255c9ff Mike Rapoport       2021-07-07  86  
1507f51255c9ff Mike Rapoport       2021-07-07  87  	vmf->page = page;
84ac013046ccc4 Mike Rapoport       2022-07-07  88  	ret = VM_FAULT_LOCKED;
84ac013046ccc4 Mike Rapoport       2022-07-07  89  
84ac013046ccc4 Mike Rapoport       2022-07-07  90  out:
84ac013046ccc4 Mike Rapoport       2022-07-07  91  	filemap_invalidate_unlock_shared(mapping);
84ac013046ccc4 Mike Rapoport       2022-07-07  92  	return ret;
1507f51255c9ff Mike Rapoport       2021-07-07  93  }
1507f51255c9ff Mike Rapoport       2021-07-07  94  

:::::: The code at line 56 was first introduced by commit
:::::: 1507f51255c9ff07d75909a84e7c0d7f3c4b2f49 mm: introduce memfd_secret system call to create "secret" memory areas

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
