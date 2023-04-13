Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62266AB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681392892; x=1712928892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jt+UpTrwNaj1WvP7me0tV5M0iF7n4h+nH9AoHnwNKMs=;
  b=fNRUf2LyTtXGw6Y5tbFfK/a1DusOeyMmfEIWYWKYW3k7gohyIUzHuoNP
   xSL5ytUDeKDMl9gCbw6kHwR8e9faKJt6RSdx55f8ymDc2135G1JexNkUu
   D9ZWXgj5T7Wc4xAwyBPz2U6kEmv5Yuk+54cuqc+Kdg+cZ+1pcndUXe3fW
   Ne4uv53BIK2QyQrryC1Ht0AVY5gB/M4RvqxfN6Z8c+639I42wI/KUrVpX
   GAfVaK3zugwo8iNr7pwAxMttgc+75dBbVIpiWDSnCgyuJkv133csud81k
   oR0Td8rN1oq2YCjfIJhL2acWQtIX0Abq9zLWJIWCP3PSDb+RMdT5I//Ga
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430468313"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="430468313"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 06:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="639668701"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="639668701"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 06:34:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmx69-000YiD-2m;
	Thu, 13 Apr 2023 13:34:49 +0000
Date: Thu, 13 Apr 2023 21:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/upm_base_support 22/30] mm/restrictedmem.c:87:46:
 error: passing argument 1 of 'memfd->f_inode->i_op->getattr' from
 incompatible pointer type
Message-ID: <202304132151.ue9E18UQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

First bad commit (maybe != root cause):

tree:   https://github.com/sean-jc/linux x86/upm_base_support
head:   9c985077b313ff50af5393d0b2268486b8ac63af
commit: 3aee70b28225d56a4a6f072cf9fffe2e20a7c61b [22/30] KVM: x86: Add support for "protected VMs" that can utilize private memory
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304132151.ue9E18UQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/3aee70b28225d56a4a6f072cf9fffe2e20a7c61b
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/upm_base_support
        git checkout 3aee70b28225d56a4a6f072cf9fffe2e20a7c61b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132151.ue9E18UQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/restrictedmem.c: In function 'restrictedmem_getattr':
>> mm/restrictedmem.c:87:46: error: passing argument 1 of 'memfd->f_inode->i_op->getattr' from incompatible pointer type [-Werror=incompatible-pointer-types]
      87 |         return memfd->f_inode->i_op->getattr(mnt_userns, path, stat,
         |                                              ^~~~~~~~~~
         |                                              |
         |                                              struct user_namespace *
   mm/restrictedmem.c:87:46: note: expected 'struct mnt_idmap *' but argument is of type 'struct user_namespace *'
   mm/restrictedmem.c: In function 'restrictedmem_setattr':
>> mm/restrictedmem.c:107:45: error: passing argument 1 of 'memfd->f_inode->i_op->setattr' from incompatible pointer type [-Werror=incompatible-pointer-types]
     107 |         ret = memfd->f_inode->i_op->setattr(mnt_userns,
         |                                             ^~~~~~~~~~
         |                                             |
         |                                             struct user_namespace *
   mm/restrictedmem.c:107:45: note: expected 'struct mnt_idmap *' but argument is of type 'struct user_namespace *'
   mm/restrictedmem.c: At top level:
>> mm/restrictedmem.c:113:20: error: initialization of 'int (*)(struct mnt_idmap *, const struct path *, struct kstat *, u32,  unsigned int)' {aka 'int (*)(struct mnt_idmap *, const struct path *, struct kstat *, unsigned int,  unsigned int)'} from incompatible pointer type 'int (*)(struct user_namespace *, const struct path *, struct kstat *, u32,  unsigned int)' {aka 'int (*)(struct user_namespace *, const struct path *, struct kstat *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     113 |         .getattr = restrictedmem_getattr,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   mm/restrictedmem.c:113:20: note: (near initialization for 'restrictedmem_iops.getattr')
>> mm/restrictedmem.c:114:20: error: initialization of 'int (*)(struct mnt_idmap *, struct dentry *, struct iattr *)' from incompatible pointer type 'int (*)(struct user_namespace *, struct dentry *, struct iattr *)' [-Werror=incompatible-pointer-types]
     114 |         .setattr = restrictedmem_setattr,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   mm/restrictedmem.c:114:20: note: (near initialization for 'restrictedmem_iops.setattr')
   cc1: some warnings being treated as errors


vim +87 mm/restrictedmem.c

640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   78  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   79  static int restrictedmem_getattr(struct user_namespace *mnt_userns,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   80  				 const struct path *path, struct kstat *stat,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   81  				 u32 request_mask, unsigned int query_flags)
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   82  {
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   83  	struct inode *inode = d_inode(path->dentry);
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   84  	struct restrictedmem *rm = inode->i_mapping->private_data;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   85  	struct file *memfd = rm->memfd;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   86  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  @87  	return memfd->f_inode->i_op->getattr(mnt_userns, path, stat,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   88  					     request_mask, query_flags);
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   89  }
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   90  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   91  static int restrictedmem_setattr(struct user_namespace *mnt_userns,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   92  				 struct dentry *dentry, struct iattr *attr)
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   93  {
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   94  	struct inode *inode = d_inode(dentry);
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   95  	struct restrictedmem *rm = inode->i_mapping->private_data;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   96  	struct file *memfd = rm->memfd;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   97  	int ret;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   98  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02   99  	if (attr->ia_valid & ATTR_SIZE) {
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  100  		if (memfd->f_inode->i_size)
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  101  			return -EPERM;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  102  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  103  		if (!PAGE_ALIGNED(attr->ia_size))
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  104  			return -EINVAL;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  105  	}
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  106  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02 @107  	ret = memfd->f_inode->i_op->setattr(mnt_userns,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  108  					    file_dentry(memfd), attr);
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  109  	return ret;
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  110  }
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  111  
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  112  static const struct inode_operations restrictedmem_iops = {
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02 @113  	.getattr = restrictedmem_getattr,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02 @114  	.setattr = restrictedmem_setattr,
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  115  };
640d00a4c1780f8 Kirill A. Shutemov 2022-12-02  116  

:::::: The code at line 87 was first introduced by commit
:::::: 640d00a4c1780f8a68396dac4edad0049e408883 mm: Introduce memfd_restricted system call to create restricted user memory

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
