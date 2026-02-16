Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C6E283FE3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 01:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771204276; cv=none; b=fcRmEquRV0ANKAFLxGdjjfVN5Mw1nEDmuoZHQjpZijFcMNpfcqErkxjPy0Hy+L9nkAdABMOMcHPCK0XAzRMNdM5hmcZ9OJ3Hpv1DvBTKRfno61w6bzFl8WuaclVyUdG6VCiAbiZ/L/hRdpB5xrKbzKhWfkHBJbAHja7jlk/Jsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771204276; c=relaxed/simple;
	bh=YBnmvwzEvTXVvOHKqh8/Tvk7P22/RMjtGpfjKj+AFb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jgIxWLu6EjrITK+yXs8h/vcEP1di947NfMkk1A2n/wlEMi9lMwt4ItZHdkItjV+mWHxjLAflmnYh16O+oXuv9kFKu5mjV3ILtE41mF7h+jxac5gMRTL3rAfbksSiRUhoAR7oM0cMh2K3zIpOz3T0xbK06H84CQqiBS6s8OYhuAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndiuyVFi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndiuyVFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771204276; x=1802740276;
  h=date:from:to:cc:subject:message-id;
  bh=YBnmvwzEvTXVvOHKqh8/Tvk7P22/RMjtGpfjKj+AFb8=;
  b=ndiuyVFiNzDzEjUNoVjyl/dLGdvrb8cKRNkcnxh0pOETdddCUmlL+N2I
   u1zvtBvbzP+I3ad3XLZNP1qoyRROe9HV6ezUYXxzsD7aoMVf2nio3/42f
   c179mBoZkHH0CsrjXJbZkFy88vsefP8ANeVnQ7FlzkMHjQQKOi+7TJehn
   oyP1LdmL9+x87jV5i0f3BdQkUrbUJwdihxnB11DiZs06fiPxbHS5ZsBx4
   gFWwUHvXoVZCM5ta0OXMdh1/6J9cETDp9oBl7jtOpnMEIImHCSKe8MaW2
   gsKvvwipeUlE6YjyBql8YaLUIOwTsbmOKGAv+qchF2zktEDG7nuOhjCij
   A==;
X-CSE-ConnectionGUID: bG4tD2nOSMunerkfPjGrVg==
X-CSE-MsgGUID: ZHPJ3bYDQm62eL3GbFNUrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72003457"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72003457"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:11:14 -0800
X-CSE-ConnectionGUID: 0s8lv1kLS7SVIhnFuWmrYg==
X-CSE-MsgGUID: Nl6kIZ/aSiyY9cbdh41IoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212575240"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Feb 2026 17:11:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrn8o-00000000zHy-0cmd;
	Mon, 16 Feb 2026 01:11:10 +0000
Date: Mon, 16 Feb 2026 09:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 85/86] include/linux/irq.h:1206:9:
 error: implicit declaration of function 'kfree'
Message-ID: <202602160907.hM7DYqGf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   5dae0ec94ba21bf42e2cc04d42968fdab61ea4ca
commit: 55876c97421f598fbe36d017cf422d5710798a3c [85/86] kasan: Fix a build error
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260216/202602160907.hM7DYqGf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160907.hM7DYqGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160907.hM7DYqGf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from arch/mips/include/asm/highmem.h:24,
                    from arch/mips/include/asm/pgtable-32.h:22,
                    from arch/mips/include/asm/pgtable.h:14,
                    from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:9,
                    from include/linux/slab.h:264,
                    from include/linux/fs.h:45,
                    from include/linux/compat.h:17,
                    from arch/mips/kernel/asm-offsets.c:14:
   include/linux/irq.h: In function 'irq_free_generic_chip':
>> include/linux/irq.h:1206:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
    1206 |         kfree(gc);
         |         ^~~~~
   include/linux/slab.h: At top level:
>> include/linux/slab.h:513:6: warning: conflicting types for 'kfree'; have 'void(const void *)'
     513 | void kfree(const void *objp);
         |      ^~~~~
   include/linux/irq.h:1206:9: note: previous implicit declaration of 'kfree' with type 'void(const void *)'
    1206 |         kfree(gc);
         |         ^~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kfree +1206 include/linux/irq.h

088f40b7b027da Thomas Gleixner     2013-05-06  1203  
707188f5f2421a Bartosz Golaszewski 2017-05-31  1204  static inline void irq_free_generic_chip(struct irq_chip_generic *gc)
707188f5f2421a Bartosz Golaszewski 2017-05-31  1205  {
707188f5f2421a Bartosz Golaszewski 2017-05-31 @1206  	kfree(gc);
707188f5f2421a Bartosz Golaszewski 2017-05-31  1207  }
707188f5f2421a Bartosz Golaszewski 2017-05-31  1208  

:::::: The code at line 1206 was first introduced by commit
:::::: 707188f5f2421a304324e6ef3aaf4413cfab0f3d irq/generic-chip: Provide irq_free_generic_chip()

:::::: TO: Bartosz Golaszewski <brgl@bgdev.pl>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
