Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63416631C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730052565; cv=none; b=FMmmTwG1/rFEXYrf9f0CaOi5WVbTlABNg+wb7bh49kcRQlI6mv5E/w3B0nbyGsujYCTCua+WkfG4wDazVwJl5nM3ab6dc+jMZZrcynPp12ZG6t9YjnFjy7FN5x6WjX4SAsj5hieHAKcHK8TeU2WbSrr7TmGKLIg1zK3/hV1dit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730052565; c=relaxed/simple;
	bh=LDzlnGyIyI6VpzTjlXAGAagJnY0Oy0DnZ9RGSTUbFDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdCF1Mf17R0j+4eaw40RZZCT7rjTq/3aMx3yrR37flsZC8Vcc6zWTz6z61poOL6r3aq2+oXuu4+htQ1EeSBgbosrTbsJ/v9AZ/sslHCRQsZNQwp8Eh7aDGC3mAEAGHHSrmbqDKMgVCgF+3bO0kBGnfXxZ/vVwPg9xpkWlF1BQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4cpoEhE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4cpoEhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730052563; x=1761588563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LDzlnGyIyI6VpzTjlXAGAagJnY0Oy0DnZ9RGSTUbFDo=;
  b=B4cpoEhEwN17A3h8Nb967ryh+WQlLW4jPFPeNcx8zj07qiLk27YXcPBo
   BE4505gYnW+YwKzt6F9+SLphoiJhwthvQnJHhJHLqfn96mlXMb8gm0LN8
   rvpAIwJMRULBX6EDj8zYEWhZKBeZ8Hiv8tmycUlmuDhkUIrnFGQLw6Zto
   BFlmeE0UoAfCGlu5X7biYQ7AfyxVZZrWA552T9Mj3Pi2RRFiOrkknVHqg
   yN3INzldsuxCGAZxqrskFHM+yqpX4eJln9JDXGpU50LM3FWBDyizhLlLe
   iK2PETwM64Yy0IEp/coS+AWeR7kK6kQsRElyONNailhGPUzkb2yd13QnY
   w==;
X-CSE-ConnectionGUID: 5UYPyKYqTW+ZBed5ZqIgSQ==
X-CSE-MsgGUID: JEnll1PbQHyaQMF8Qy99dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33564289"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="33564289"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 11:09:22 -0700
X-CSE-ConnectionGUID: 7+lS4/h5R0CyFqo/lDRLVw==
X-CSE-MsgGUID: tspznC2rT6q1mL/bxnSZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86154419"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2024 11:09:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t57hV-000atY-1s;
	Sun, 27 Oct 2024 18:09:17 +0000
Date: Mon, 28 Oct 2024 02:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5957/23866]
 include/linux/uaccess.h:112:17: warning: 'bind' may be used uninitialized
Message-ID: <202410280214.zmJz4NhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean-Philippe,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 2dd8345826607c5d2d6528de872118da554015b6 [5957/23866] vfio: Add support for Shared Virtual Addressing
config: arm64-randconfig-004-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280214.zmJz4NhI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280214.zmJz4NhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280214.zmJz4NhI-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/compat.h:19,
                    from drivers/vfio/vfio_iommu_type1.c:27:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_bind_process' at drivers/vfio/vfio_iommu_type1.c:1933:6:
   include/linux/uaccess.h:112:17: warning: 'params' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/asm-generic/div64.h:25,
                    from ./arch/arm64/include/generated/asm/div64.h:1,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/compat_time.h:6,
                    from include/linux/compat.h:10:
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_bind_process':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:1920:46: note: 'params' declared here
    1920 |         struct vfio_iommu_type1_bind_process params;
         |                                              ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_unbind_process' at drivers/vfio/vfio_iommu_type1.c:2021:6:
   include/linux/uaccess.h:112:17: warning: 'params' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_unbind_process':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2014:46: note: 'params' declared here
    2014 |         struct vfio_iommu_type1_bind_process params;
         |                                              ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_ioctl' at drivers/vfio/vfio_iommu_type1.c:2084:7:
   include/linux/uaccess.h:112:17: warning: 'info' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2080:46: note: 'info' declared here
    2080 |                 struct vfio_iommu_type1_info info;
         |                                              ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_ioctl' at drivers/vfio/vfio_iommu_type1.c:2104:7:
   include/linux/uaccess.h:112:17: warning: 'map' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2098:49: note: 'map' declared here
    2098 |                 struct vfio_iommu_type1_dma_map map;
         |                                                 ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_ioctl' at drivers/vfio/vfio_iommu_type1.c:2118:7:
   include/linux/uaccess.h:112:17: warning: 'unmap' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2113:51: note: 'unmap' declared here
    2113 |                 struct vfio_iommu_type1_dma_unmap unmap;
         |                                                   ^~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_ioctl' at drivers/vfio/vfio_iommu_type1.c:2136:7:
>> include/linux/uaccess.h:112:17: warning: 'bind' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2132:46: note: 'bind' declared here
    2132 |                 struct vfio_iommu_type1_bind bind;
         |                                              ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vfio_iommu_type1_ioctl' at drivers/vfio/vfio_iommu_type1.c:2155:7:
>> include/linux/uaccess.h:112:17: warning: 'bind' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vfio_iommu_type1_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2151:46: note: 'bind' declared here
    2151 |                 struct vfio_iommu_type1_bind bind;
         |                                              ^~~~


vim +/bind +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
