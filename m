Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4EBF4EE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 00:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707351503; cv=none; b=suHn95kNshKU2jtmCyEC1FCY+tsz5gF9ffzkchEE0HJO0xbTnWvqHypmtmg81XYkFAIa6rKiK/4X3fDuwjjZIf6+4oCiAc7Jd4/qyAMzSR6d4fvYX7FXElABS2bq+9ZJ3Vdrizn9mGvGTti6kuOZtbn2aOwBKtrFmdDBeINTaKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707351503; c=relaxed/simple;
	bh=dqJ9BnxzyxkTMA20fLHwy4BH38kuYE2Fn4Z3kwtrjFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jluzRjg/Y7bIV+JrIHcAFt2/cCrjTCDGHjn/64w2KnQIyqBQcp+TK8KO6OS/SgHtUwL/8dsWcq8CKIhXEoBv7OJwZqKYQIRC9YFIBaLEISWoKbxlQsndMWxXDUVtSFXOhPl4leWIlCYl3qNgz0BPLRA4FxW0Qdt6lFa7htpEi7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgtX4q+5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgtX4q+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707351501; x=1738887501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dqJ9BnxzyxkTMA20fLHwy4BH38kuYE2Fn4Z3kwtrjFs=;
  b=DgtX4q+5gfI52JOvowHV3M1cuw4SaHWZsdZvXJsiDhGyuC3aSdr3RYsJ
   wO25POe4U68Cab/gAJIhvmIOTYlC4UVMrsmByVGpzUs4j4SzxgoCHkJfn
   7C/r9Z8LkX7FwPeXgfR0FpgUHD3yanbWNorbEFl6q5QBNTD1dHOp7493L
   yovb/PWuJImHdc6r5QtvUxlghWYazbwKf/UER3f4DC/At+B1SyTVBseZ8
   rV+eQH3GAOxC6qJh4wMzNkx+GS8jgksRLiu3px/WnqC94DblNioG79ZCX
   wLX+ky+BDAGdPZgjBQbXsB53/hLrKnfS6jrQxX34Jk89lWXrnEwtnoi9O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12479245"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="12479245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 16:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6263189"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2024 16:18:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXs7M-0003BI-12;
	Thu, 08 Feb 2024 00:18:16 +0000
Date: Thu, 8 Feb 2024 08:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5957/21625]
 include/linux/uaccess.h:112:17: warning: 'bind' may be used uninitialized
Message-ID: <202402080827.WW0ing81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 2dd8345826607c5d2d6528de872118da554015b6 [5957/21625] vfio: Add support for Shared Virtual Addressing
config: arm64-randconfig-001-20240201 (https://download.01.org/0day-ci/archive/20240208/202402080827.WW0ing81-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080827.WW0ing81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080827.WW0ing81-lkp@intel.com/

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

d597580d373774b Al Viro        2017-03-20  104  
d597580d373774b Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774b Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774b Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774b Al Viro        2017-03-20  108  {
d597580d373774b Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4f Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a73 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4f Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774b Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4f Al Viro        2017-06-29  114  	}
d597580d373774b Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774b Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774b Al Viro        2017-03-20  117  	return res;
d597580d373774b Al Viro        2017-03-20  118  }
d597580d373774b Al Viro        2017-03-20  119  #else
d597580d373774b Al Viro        2017-03-20  120  extern unsigned long
d597580d373774b Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774b Al Viro        2017-03-20  122  #endif
d597580d373774b Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
