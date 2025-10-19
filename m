Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E11DEFF5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760851925; cv=none; b=A1vkVu70J1rWr1NQu6TeXfFP8EgfL4LecEkvrXwYSjerhJ2Q2JUQcS1b3vYLmCs5sSGg6hFfE83/zvII5KE+iZCpZh5YrS2TaOOtZcAMomoo190ozWGmifbqJqCZP6hY4oNkBabSLb8uChRgRMCa7C30zM18Th+Uq+NVaXxwvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760851925; c=relaxed/simple;
	bh=DHp5kLXG9ozR57J1V9QGtKJYWlApl4WvGIeiRFq6MlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkc4dtM3GvK5FhB253BZBh+jxdRvH/B9oYYw/tTO9z6kQqlu88pfpD9LHjoEvd0MpcXQhsGaTAFxgfstMqukw4j7lmWatXkGruzWmK99apfU7lIUx/yF6Vh1uhVkA8SQOzz40ky0rStUAHUI/Q0DtilmTmZKeWgdciBjl1F0J18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZEHfDoJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZEHfDoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760851922; x=1792387922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHp5kLXG9ozR57J1V9QGtKJYWlApl4WvGIeiRFq6MlA=;
  b=nZEHfDoJB/fonbT5pAKfD8JduaadmcTsLevieydBNxFsOjHxggurbhVA
   SjA0a4QsFqf37xIjOaWw4Ypt7GF1Au/XFSW7KBRG92kPXDEKJB2yLEpj5
   tI9L0fqQllDmNB+LWIIn7whA2Qy8vMojbULXZqh4ui+poHf+VzVMXTyjF
   AYtAb8iVpO0Bksf1HgqqZtd1Egnz2ttS72BkT5QuVq/+0iKEGd91wVHnN
   mrCwUjONuqNVMU9uqku92R9jWxd2mjiERVVD1uA8dxYdW0gDI9XXqpCDO
   ywZ+Z2phH/wNDmSrfRg/2Ijrb1kn5cgvmC2HQ60jDsNv08e4h7WPtXBCM
   A==;
X-CSE-ConnectionGUID: dgjL8f/EQuuv4CT2mwhJcw==
X-CSE-MsgGUID: yv1wxrytQKWyaWQqSHmvlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50583094"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="50583094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 22:32:02 -0700
X-CSE-ConnectionGUID: BOQ6Q6OXS+edX6IWoyHRQw==
X-CSE-MsgGUID: MizuWHoRS4Sqre+dsz6VOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183554556"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2025 22:32:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAM1K-0008sB-1J;
	Sun, 19 Oct 2025 05:31:56 +0000
Date: Sun, 19 Oct 2025 13:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 14/28] include/linux/stddef.h:8:16:
 error: expected identifier or '(' before 'void'
Message-ID: <202510191300.b3i7AVRW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   fa05815572860da32b9145bb5e396a511cc081a9
commit: 7323ffb6a7a00fcc9c21bcb5ded7119da356110c [14/28] Make  vfio_pci_core_get_dmabuf_phys()
config: i386-buildonly-randconfig-003-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191300.b3i7AVRW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191300.b3i7AVRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191300.b3i7AVRW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/aperture.h:6,
                    from drivers/vfio/pci/vfio_pci_core.c:13:
>> include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/vfio_pci_core.c:2593:5: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
    2593 | int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/vfio_pci_core.c:2593:5: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
    2593 | int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/vfio/pci/vfio_pci_core.c:14:
>> include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
       8 | #define NULL ((void *)0)
         |                ^~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^~~~~~~~~~~~~~~~~
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:23: error: expected ')' before numeric constant
       8 | #define NULL ((void *)0)
         |                       ^
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^~~~~~~~~~~~~~~~~
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler.h:286:29: error: pasting "__addressable_" and "(" does not give a valid preprocessing token
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                             ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:286:21: note: in expansion of macro '__PASTE'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                     ^~~~~~~
   include/linux/compiler.h:289:9: note: in expansion of macro '___ADDRESSABLE'
     289 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:15: error: expected declaration specifiers or '...' before '(' token
       8 | #define NULL ((void *)0)
         |               ^
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:286:9: note: in expansion of macro '__UNIQUE_ID'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:286:21: note: in expansion of macro '__PASTE'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                     ^~~~~~~
   include/linux/compiler.h:289:9: note: in expansion of macro '___ADDRESSABLE'
     289 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^~~~~~~~~~~~~~~~~
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:8:24: error: pasting ")" and "343" does not give a valid preprocessing token
       8 | #define NULL ((void *)0)
         |                        ^
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:286:9: note: in expansion of macro '__UNIQUE_ID'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:286:21: note: in expansion of macro '__PASTE'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                     ^~~~~~~
   include/linux/compiler.h:289:9: note: in expansion of macro '___ADDRESSABLE'
     289 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^~~~~~~~~~~~~~~~~
   include/linux/vfio_pci_core.h:75:39: note: in expansion of macro 'NULL'
      75 | #define vfio_pci_core_get_dmabuf_phys NULL
         |                                       ^~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:19: note: in expansion of macro 'vfio_pci_core_get_dmabuf_phys'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/export.h:35:9: error: pasting "__export_symbol_" and "(" does not give a valid preprocessing token
      35 |         __export_symbol_##sym:                  ASM_NL  \
         |         ^~~~~~~~~~~~~~~~
   include/linux/export.h:79:25: note: in expansion of macro '___EXPORT_SYMBOL'
      79 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_core.c:2602:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2602 | EXPORT_SYMBOL_GPL(vfio_pci_core_get_dmabuf_phys);
         | ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +8 include/linux/stddef.h

^1da177e4c3f415 Linus Torvalds   2005-04-16  6  
^1da177e4c3f415 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f415 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e2182874324727 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
