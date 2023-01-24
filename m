Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB0F10E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674553971; x=1706089971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OuTRdUvURoyRxToZgF00U7bx31QcOMCMmQJxYgLhP5U=;
  b=HqLa2dWo9nHTv6bcECk7ZEfy7p02GKQkxEazCkrAfM4Chw3uhjXM21Q+
   hzLC5cu+zk6R56xpzkkaTTDngpO8D3UKgzo4h8FIJsEg1Iyr39XjneZwx
   apHFl/7OhBMSKEAvlM4jPtDM3hdKS67P95Z7n5j6ZPZpSnXEUyl/NIuug
   2eoK1i04Ig+dhKFw2tNKIh8O4NKnbcKSxvfGQIfQ6GBiuSpOL4w12oJMJ
   m0AYoGmllOJMesLj6vP2eEIK7QUcQC2MtAO1P4WdG6Elf/qDCmC+O/c2J
   fBeL6EitY8BRPVxNRRuj8OqdJRe7nUue2Yyqt6KGzq8pxjyYr+TdB0u/v
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324935817"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324935817"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 01:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639524284"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="639524284"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2023 01:52:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKFyy-0006Jg-0e;
	Tue, 24 Jan 2023 09:52:48 +0000
Date: Tue, 24 Jan 2023 17:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 16/19] mm/util: Refactor account_locked_vm
Message-ID: <202301241747.9HloKRGF-lkp@intel.com>
References: <e72f46bd6be4f3e3c85ba6a560201cf23bdb39a9.1674538665.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72f46bd6be4f3e3c85ba6a560201cf23bdb39a9.1674538665.git-series.apopple@nvidia.com>

Hi Alistair,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on 2241ab53cbb5cdb08a6b2d4688feb13971058f65]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-Introduce-vm_account/20230124-135027
base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
patch link:    https://lore.kernel.org/r/e72f46bd6be4f3e3c85ba6a560201cf23bdb39a9.1674538665.git-series.apopple%40nvidia.com
patch subject: [RFC PATCH 16/19] mm/util: Refactor account_locked_vm
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230124/202301241747.9HloKRGF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c089a7b505673ff339d4e034218c0d1207d26f5e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alistair-Popple/mm-Introduce-vm_account/20230124-135027
        git checkout c089a7b505673ff339d4e034218c0d1207d26f5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/pages.c: In function 'update_mm_locked_vm':
>> drivers/iommu/iommufd/pages.c:846:60: error: incompatible type for argument 3 of '__account_locked_vm'
     846 |         rc = __account_locked_vm(pages->source_mm, npages, inc,
         |                                                            ^~~
         |                                                            |
         |                                                            bool {aka _Bool}
   In file included from include/linux/scatterlist.h:8,
                    from include/linux/iommu.h:10,
                    from drivers/iommu/iommufd/pages.c:50:
   include/linux/mm.h:2095:45: note: expected 'struct task_struct *' but argument is of type 'bool' {aka '_Bool'}
    2095 |                         struct task_struct *task, bool bypass_rlim);
         |                         ~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/iommu/iommufd/pages.c:846:14: error: too many arguments to function '__account_locked_vm'
     846 |         rc = __account_locked_vm(pages->source_mm, npages, inc,
         |              ^~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2094:5: note: declared here
    2094 | int __account_locked_vm(struct mm_struct *mm, unsigned long pages,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/__account_locked_vm +846 drivers/iommu/iommufd/pages.c

f394576eb11dbc Jason Gunthorpe 2022-11-29  826  
f394576eb11dbc Jason Gunthorpe 2022-11-29  827  /* This is the accounting method used for compatibility with VFIO */
f394576eb11dbc Jason Gunthorpe 2022-11-29  828  static int update_mm_locked_vm(struct iopt_pages *pages, unsigned long npages,
f394576eb11dbc Jason Gunthorpe 2022-11-29  829  			       bool inc, struct pfn_reader_user *user)
f394576eb11dbc Jason Gunthorpe 2022-11-29  830  {
f394576eb11dbc Jason Gunthorpe 2022-11-29  831  	bool do_put = false;
f394576eb11dbc Jason Gunthorpe 2022-11-29  832  	int rc;
f394576eb11dbc Jason Gunthorpe 2022-11-29  833  
f394576eb11dbc Jason Gunthorpe 2022-11-29  834  	if (user && user->locked) {
f394576eb11dbc Jason Gunthorpe 2022-11-29  835  		mmap_read_unlock(pages->source_mm);
f394576eb11dbc Jason Gunthorpe 2022-11-29  836  		user->locked = 0;
f394576eb11dbc Jason Gunthorpe 2022-11-29  837  		/* If we had the lock then we also have a get */
f394576eb11dbc Jason Gunthorpe 2022-11-29  838  	} else if ((!user || !user->upages) &&
f394576eb11dbc Jason Gunthorpe 2022-11-29  839  		   pages->source_mm != current->mm) {
f394576eb11dbc Jason Gunthorpe 2022-11-29  840  		if (!mmget_not_zero(pages->source_mm))
f394576eb11dbc Jason Gunthorpe 2022-11-29  841  			return -EINVAL;
f394576eb11dbc Jason Gunthorpe 2022-11-29  842  		do_put = true;
f394576eb11dbc Jason Gunthorpe 2022-11-29  843  	}
f394576eb11dbc Jason Gunthorpe 2022-11-29  844  
f394576eb11dbc Jason Gunthorpe 2022-11-29  845  	mmap_write_lock(pages->source_mm);
f394576eb11dbc Jason Gunthorpe 2022-11-29 @846  	rc = __account_locked_vm(pages->source_mm, npages, inc,
f394576eb11dbc Jason Gunthorpe 2022-11-29  847  				 pages->source_task, false);
f394576eb11dbc Jason Gunthorpe 2022-11-29  848  	mmap_write_unlock(pages->source_mm);
f394576eb11dbc Jason Gunthorpe 2022-11-29  849  
f394576eb11dbc Jason Gunthorpe 2022-11-29  850  	if (do_put)
f394576eb11dbc Jason Gunthorpe 2022-11-29  851  		mmput(pages->source_mm);
f394576eb11dbc Jason Gunthorpe 2022-11-29  852  	return rc;
f394576eb11dbc Jason Gunthorpe 2022-11-29  853  }
f394576eb11dbc Jason Gunthorpe 2022-11-29  854  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
