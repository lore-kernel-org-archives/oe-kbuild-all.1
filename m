Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C852929CF4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731172496; cv=none; b=QBaejWipn83T2rfMyXf6TYPXqcCXw0xwQ0fKKOCp0ZNtXIDbjSiZd4EKe0aiLLfAVr0T88GSv0qUUuKCZ2R9dSW1XF8ZhWVroe1QNUlnbdWJhAiATLNM1F/s3L4h1jqWDUmeGK9QtoP5Xl6tr//pTSuBRAMeDwWyk4kyvVEyP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731172496; c=relaxed/simple;
	bh=Ji43xD1LtNL/H8f2qCOipTnDDn93zWHExN73SZq964w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZrJkxKxOKM4pKdiY4p6hJjxQLBFf8V5wUdZrr0ulTUVfgNLq4y0am4jH5/FpsKemCpsnxpjrI5r+KyDzWUR81aDA7zjWaXPgZynDxVCP9WahhaDmlXh2r1fCUonuzeONcN20QmHMhuPh74baaB47M3+6abbx4f6P+M/y0dG5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZreoYaN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZreoYaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731172494; x=1762708494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ji43xD1LtNL/H8f2qCOipTnDDn93zWHExN73SZq964w=;
  b=AZreoYaNh24AsyMqQ9JRa0eq3ueak4Lg6RXFOrdg5A6eOIPDUm+5ALa6
   yDoTjtic1eyPXrk/2bUNiTdXg1RD1+Q6Gct6BzInOQFu62rjxM6eFCJEN
   ExcOhzwoe4OgJvjogGI0kZKBCdpBziffJKzrdlDrrZBp14wqTDk2C0DH4
   ag3tj6f66yQeD+ywXYCPakfGzw/aBa0ey+bo+e54P8Vc02bN06FBf4mIL
   jBRkLyjQblbxGTAXQIvtvHIDUUT1BITYcss8P1Aba7bP74s5beNBi9Zyp
   Q/ohs6n6o8+2HfYnqC1UigUCJTumD/e7RvKUiC53tt/Jp1JAY+PqJILtK
   A==;
X-CSE-ConnectionGUID: XLOVsleRQbC2hhABVAir1w==
X-CSE-MsgGUID: KCo+v922QXiZi+aeInWD+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="41662274"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="41662274"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 09:14:53 -0800
X-CSE-ConnectionGUID: +w3STQ3WSIeSHDUvqkp6QQ==
X-CSE-MsgGUID: fwHEDqKeTXuTMp3eRHJ/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86393657"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Nov 2024 09:14:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9p2w-000sUs-0F;
	Sat, 09 Nov 2024 17:14:50 +0000
Date: Sun, 10 Nov 2024 01:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-prot-kernonly 1/1] include/linux/mman.h:147:37:
 error: 'PROT_KERNONLY' undeclared; did you mean 'VM_KERNONLY'?
Message-ID: <202411100106.jNekvhVU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-prot-kernonly
head:   37187db99b42dfb9784b42cb759c3f628de0d808
commit: 322244b2cc99d0abe2f5bf4accb08c2b895e1cd8 [1/1] mm: add PROT_KERNONLY
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241110/202411100106.jNekvhVU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100106.jNekvhVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100106.jNekvhVU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:26:
   include/linux/mman.h: In function 'arch_validate_prot':
   include/linux/mman.h:109:74: error: 'PROT_KERN_ONLY' undeclared (first use in this function); did you mean 'VM_KERNONLY'?
     109 |         return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERN_ONLY)) == 0;
         |                                                                          ^~~~~~~~~~~~~~
         |                                                                          VM_KERNONLY
   include/linux/mman.h:109:74: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/mman.h: In function 'calc_vm_prot_bits':
>> include/linux/mman.h:147:37: error: 'PROT_KERNONLY' undeclared (first use in this function); did you mean 'VM_KERNONLY'?
     147 |                _calc_vm_trans(prot, PROT_KERNONLY,  VM_KERNONLY) |
         |                                     ^~~~~~~~~~~~~
   include/linux/mman.h:134:7: note: in definition of macro '_calc_vm_trans'
     134 |   ((!(bit1) || !(bit2)) ? 0 : \
         |       ^~~~
--
   In file included from mm/mmap.c:18:
   include/linux/mman.h: In function 'arch_validate_prot':
   include/linux/mman.h:109:74: error: 'PROT_KERN_ONLY' undeclared (first use in this function); did you mean 'VM_KERNONLY'?
     109 |         return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERN_ONLY)) == 0;
         |                                                                          ^~~~~~~~~~~~~~
         |                                                                          VM_KERNONLY
   include/linux/mman.h:109:74: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/mman.h: In function 'calc_vm_prot_bits':
>> include/linux/mman.h:147:37: error: 'PROT_KERNONLY' undeclared (first use in this function); did you mean 'VM_KERNONLY'?
     147 |                _calc_vm_trans(prot, PROT_KERNONLY,  VM_KERNONLY) |
         |                                     ^~~~~~~~~~~~~
   include/linux/mman.h:134:7: note: in definition of macro '_calc_vm_trans'
     134 |   ((!(bit1) || !(bit2)) ? 0 : \
         |       ^~~~
>> include/linux/mman.h:149:1: warning: control reaches end of non-void function [-Wreturn-type]
     149 | }
         | ^
--
   In file included from mm/mprotect.c:15:
   include/linux/mman.h: In function 'arch_validate_prot':
   include/linux/mman.h:109:74: error: 'PROT_KERN_ONLY' undeclared (first use in this function); did you mean 'VM_KERNONLY'?
     109 |         return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERN_ONLY)) == 0;
         |                                                                          ^~~~~~~~~~~~~~
         |                                                                          VM_KERNONLY
   include/linux/mman.h:109:74: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/mman.h: In function 'calc_vm_prot_bits':
>> include/linux/mman.h:147:37: error: 'PROT_KERNONLY' undeclared (first use in this function); did you mean 'VM_KERNONLY'?
     147 |                _calc_vm_trans(prot, PROT_KERNONLY,  VM_KERNONLY) |
         |                                     ^~~~~~~~~~~~~
   include/linux/mman.h:134:7: note: in definition of macro '_calc_vm_trans'
     134 |   ((!(bit1) || !(bit2)) ? 0 : \
         |       ^~~~
   include/linux/mman.h: In function 'arch_validate_prot':
   include/linux/mman.h:110:1: warning: control reaches end of non-void function [-Wreturn-type]
     110 | }
         | ^
   include/linux/mman.h: In function 'calc_vm_prot_bits':
>> include/linux/mman.h:149:1: warning: control reaches end of non-void function [-Wreturn-type]
     149 | }
         | ^


vim +147 include/linux/mman.h

    99	
   100	#ifndef arch_validate_prot
   101	/*
   102	 * This is called from mprotect().  PROT_GROWSDOWN and PROT_GROWSUP have
   103	 * already been masked out.
   104	 *
   105	 * Returns true if the prot flags are valid
   106	 */
   107	static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
   108	{
 > 109		return (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_KERN_ONLY)) == 0;
   110	}
   111	#define arch_validate_prot arch_validate_prot
   112	#endif
   113	
   114	#ifndef arch_validate_flags
   115	/*
   116	 * This is called from mmap() and mprotect() with the updated vma->vm_flags.
   117	 *
   118	 * Returns true if the VM_* flags are valid.
   119	 */
   120	static inline bool arch_validate_flags(unsigned long flags)
   121	{
   122		return true;
   123	}
   124	#define arch_validate_flags arch_validate_flags
   125	#endif
   126	
   127	/*
   128	 * Optimisation macro.  It is equivalent to:
   129	 *      (x & bit1) ? bit2 : 0
   130	 * but this version is faster.
   131	 * ("bit1" and "bit2" must be single bits)
   132	 */
   133	#define _calc_vm_trans(x, bit1, bit2) \
   134	  ((!(bit1) || !(bit2)) ? 0 : \
   135	  ((bit1) <= (bit2) ? ((x) & (bit1)) * ((bit2) / (bit1)) \
   136	   : ((x) & (bit1)) / ((bit1) / (bit2))))
   137	
   138	/*
   139	 * Combine the mmap "prot" argument into "vm_flags" used internally.
   140	 */
   141	static inline unsigned long
   142	calc_vm_prot_bits(unsigned long prot, unsigned long pkey)
   143	{
   144		return _calc_vm_trans(prot, PROT_READ,  VM_READ ) |
   145		       _calc_vm_trans(prot, PROT_WRITE, VM_WRITE) |
   146		       _calc_vm_trans(prot, PROT_EXEC,  VM_EXEC) |
 > 147		       _calc_vm_trans(prot, PROT_KERNONLY,  VM_KERNONLY) |
   148		       arch_calc_vm_prot_bits(prot, pkey);
 > 149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
