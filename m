Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5AE15AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfZzMSsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702107029; x=1733643029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hq9D28mNvGQJ7/ly5CBoZvJxb1npon/81q6NLxAy0co=;
  b=cfZzMSsVDN/hAOBsNQoxGY5pZRAyfK9m6P4YMAibz5DzdGK37eJIZNo6
   w4fjNayiQgr6Wx5kKVapSrsKNp9f5b8pIs27G8E60McA9Z/i9+4vcHk+x
   O0Xa7cIkruBI+SGsIuRanLaonaFl5Zz2vi3GSMnbkyKPUgUZjx1irzSKp
   JmAOo5BY7pbfFgG8swwca65QrtCjh9jOOEUXAMiAb8OFxGhQGc1GFmrAe
   I3UEDVlvrtN7Hr+ekZ9YDtSnE1dcK3gDhWnfobFlSUpYU80mfltO/AbcM
   6gDdpDYnA/aQmrrTCvuN9j+BrI9LG8c5UAdrE+DUGPeCpd5b+4Ny0Zhni
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7825367"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="7825367"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 23:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="776038063"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="776038063"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 08 Dec 2023 23:30:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBrn6-000Eyw-1n;
	Sat, 09 Dec 2023 07:30:24 +0000
Date: Sat, 9 Dec 2023 15:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Iago Toral Quiroga <itoral@igalia.com>
Subject: [linux-next:master 3648/6165] drivers/gpu/drm/v3d/v3d_bo.c:178:14:
 error: call to undeclared function 'vmap'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202312091544.9mAHr8uc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: 7c13132c4073628b5fe23b5188ac583a2882a6b0 [3648/6165] drm/v3d: Enable BO mapping
config: mips-randconfig-r113-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091544.9mAHr8uc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091544.9mAHr8uc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091544.9mAHr8uc-lkp@intel.com/

Note: the linux-next/master HEAD bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/v3d/v3d_bo.c:25:
   drivers/gpu/drm/v3d/v3d_drv.h:319:24: error: use of empty enum
     319 | enum v3d_cpu_job_type {};
         |                        ^
>> drivers/gpu/drm/v3d/v3d_bo.c:178:14: error: call to undeclared function 'vmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     178 |         bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
         |                     ^
   drivers/gpu/drm/v3d/v3d_bo.c:178:14: note: did you mean 'bmap'?
   include/linux/fs.h:2669:19: note: 'bmap' declared here
    2669 | static inline int bmap(struct inode *inode,  sector_t *block)
         |                   ^
>> drivers/gpu/drm/v3d/v3d_bo.c:178:61: error: use of undeclared identifier 'VM_MAP'
     178 |         bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
         |                                                                    ^
>> drivers/gpu/drm/v3d/v3d_bo.c:184:2: error: call to undeclared function 'vunmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |         vunmap(bo->vaddr);
         |         ^
   drivers/gpu/drm/v3d/v3d_bo.c:184:2: note: did you mean 'iounmap'?
   arch/mips/include/asm/io.h:154:6: note: 'iounmap' declared here
     154 | void iounmap(const volatile void __iomem *addr);
         |      ^
   4 errors generated.


vim +/vmap +178 drivers/gpu/drm/v3d/v3d_bo.c

   173	
   174	void v3d_get_bo_vaddr(struct v3d_bo *bo)
   175	{
   176		struct drm_gem_shmem_object *obj = &bo->base;
   177	
 > 178		bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
   179				 pgprot_writecombine(PAGE_KERNEL));
   180	}
   181	
   182	void v3d_put_bo_vaddr(struct v3d_bo *bo)
   183	{
 > 184		vunmap(bo->vaddr);
   185		bo->vaddr = NULL;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
