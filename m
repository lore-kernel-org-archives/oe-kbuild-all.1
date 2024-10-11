Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640B2141C5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728646011; cv=none; b=tEWbu+Lrzik868hDDt9Do6bW1DMdpxnNO7JW47cAcXnL6z2VR/kz0MITV0iv/oyMzO+RdqyDxUtS2ij4lPZC4MuOQI5TUNaM498t7Xk469qt0HT5YmyG02VSVLwWaKKBf0sKa584+S/OnnvpRXMIBq0zRJR077jzbs6kbJg5tc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728646011; c=relaxed/simple;
	bh=N3BqvRo+WhFaUOgxreIB71e1o9ByuatAnJTJP2N2Ewk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gixWRyk0kAFq3Yow1UTy6UwbrnGUnbDdbJkElezH3MRcTpreklHq1yR+k2F9aniFLi7N10bfnxJ0RKHH1CIM+82QrjzSxHH66ZQabahJjTcQz8J1i34XaK5lVlyCkt4Vhc17bK0azOAHoNbycpw2vhy0vPQekd2YQQU1oYRM8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Na5U5vui; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Na5U5vui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728646010; x=1760182010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N3BqvRo+WhFaUOgxreIB71e1o9ByuatAnJTJP2N2Ewk=;
  b=Na5U5vuibmHlmy35AM0m+f7T48/V/nQ/R6B1nlq6oEFZFv9vh8pMq4xz
   EtlzMK3wo/Wwe6nH+WMWEjaHn6h7BLofQF1RNKvnS2+u6JD6MVn9UBLny
   6YK8+8pHTN8mdy1yJcGQpRz9qqHNga6nsF8Rsn0mrp9mQaP+UDP9HzKHc
   UAIH5OJNTjucsZEyJpLDPr+hPXyOo9tfjJVzf/Z2FX/RoizRtsUOdiic/
   GFN/C07ebNBVGjGPAY689hf3Dn2omosWsTKTUyg3olaWwGEqEWOhlWpKJ
   YmmU1XJy8yvD1iaKZLbqr0ZqZqt5WMmwZ69ANrHAeikXydw7goKmh888f
   w==;
X-CSE-ConnectionGUID: glIERKseSPKxlzrIvFlT9w==
X-CSE-MsgGUID: JkB846MCRgOPrCaq3VC6dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31837159"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31837159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:25:19 -0700
X-CSE-ConnectionGUID: N6LDAsfaRZSYJJfZAp4qAg==
X-CSE-MsgGUID: cY04OjNpSaSXkS7oWIZpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77350440"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Oct 2024 04:25:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szDle-000CEb-2z;
	Fri, 11 Oct 2024 11:25:10 +0000
Date: Fri, 11 Oct 2024 19:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5957/23827]
 include/linux/uaccess.h:112:17: warning: 'bind' may be used uninitialized
Message-ID: <202410111943.njyjH1kd-lkp@intel.com>
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
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: 2dd8345826607c5d2d6528de872118da554015b6 [5957/23827] vfio: Add support for Shared Virtual Addressing
config: arm64-randconfig-004-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111943.njyjH1kd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111943.njyjH1kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111943.njyjH1kd-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_iommu_type1.c:31:
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'vfio_iommu_type1_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2222:1: note: in expansion of macro 'module_init'
    2222 | module_init(vfio_iommu_type1_init);
         | ^~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2212:19: note: 'init_module' target declared here
    2212 | static int __init vfio_iommu_type1_init(void)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'vfio_iommu_type1_cleanup': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2223:1: note: in expansion of macro 'module_exit'
    2223 | module_exit(vfio_iommu_type1_cleanup);
         | ^~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:2217:20: note: 'cleanup_module' target declared here
    2217 | static void __exit vfio_iommu_type1_cleanup(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
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
d597580d373774 Al Viro        2017-03-20  124  #ifdef INLINE_COPY_TO_USER
d597580d373774 Al Viro        2017-03-20  125  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  126  _copy_to_user(void __user *to, const void *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  127  {
9c5f6908de03a4 Al Viro        2017-06-29  128  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  129  	if (access_ok(to, n)) {
9c5f6908de03a4 Al Viro        2017-06-29  130  		kasan_check_read(from, n);
d597580d373774 Al Viro        2017-03-20  131  		n = raw_copy_to_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  132  	}
d597580d373774 Al Viro        2017-03-20  133  	return n;
d597580d373774 Al Viro        2017-03-20  134  }
d597580d373774 Al Viro        2017-03-20  135  #else
d597580d373774 Al Viro        2017-03-20  136  extern unsigned long
d597580d373774 Al Viro        2017-03-20  137  _copy_to_user(void __user *, const void *, unsigned long);
d597580d373774 Al Viro        2017-03-20  138  #endif
d597580d373774 Al Viro        2017-03-20  139  
d597580d373774 Al Viro        2017-03-20  140  static __always_inline unsigned long __must_check
d597580d373774 Al Viro        2017-03-20  141  copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  142  {
b0377fedb65280 Al Viro        2017-06-29  143  	if (likely(check_copy_size(to, n, false)))
d597580d373774 Al Viro        2017-03-20 @144  		n = _copy_from_user(to, from, n);
d597580d373774 Al Viro        2017-03-20  145  	return n;
d597580d373774 Al Viro        2017-03-20  146  }
d597580d373774 Al Viro        2017-03-20  147  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
