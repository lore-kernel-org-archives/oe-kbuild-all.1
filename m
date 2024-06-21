Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF1155305
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973310; cv=none; b=aHCqvFf2J4NH62MO2+sSVveBzBHBbRuoyE2QMPSaIFO+fhGQ+QknQCqq1NFgdQ8MBLXvRnfVR3GcSjlpJU5xtRKvG8eZBhcieGlHV5HBOFX/yCSWEKaEltyZFFTy4X3qw83qL8QvkBmyQN+PWamfx1yLoxDZPXK7SM0KlK80MYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973310; c=relaxed/simple;
	bh=oiN4b+0PDZG3VJCGs6Xa4oX0tY3oDKMD0HFGpJfMxzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLLjYGtxKflhBwt2QZGIvJJs8pdJJE638N3IU/XdPlCt93aJ9MWSA5ZpO4284t5UWG4+Xa3BcJifOLWXCpJdR9Q9RndA+HNMaTUqqmzogjPJirZXXv63OxxMEeuQxheL1hXBEQKd+deYg8KGIq8AQ/kgyoVzFIR3R8GDTBNN230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrZnOvkH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrZnOvkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718973308; x=1750509308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oiN4b+0PDZG3VJCGs6Xa4oX0tY3oDKMD0HFGpJfMxzM=;
  b=FrZnOvkHAkdtDZzqSMorhU0ABM4E0ZcjEgESakYE1xhfPlIMYyGeBvCQ
   +iGwi6u8LYIhCcMHdALk0EFdwP4p9quIWSEvcnbfsJkUVceASzEe2ZMgh
   P8m7/RqKdl9S8AOmE0tmDbv7qp1sg2lBqfxDy1G9ZETCu8ppph2VK/GZ8
   LGVqlvQd5sUG2tq/fOPiZuruhMI+QdRPJbApV/G+qcX/nZTvwxXyLEtew
   Reg0ldXaq6cusiLSfZHt+Txf0s2XyebhEjF+sfDvXHJCiCOJ6EgOiYJlx
   YkEf1S24K6BqLfp7JV8l4sGVzfCZtkXyFIeUDqjAXe9W3ejigLohYpQgI
   g==;
X-CSE-ConnectionGUID: z0mfoGdrQdmF2OAgjxWM6A==
X-CSE-MsgGUID: 4CWbnIQcT1WY8XaLD21d+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18911892"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="18911892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 05:35:05 -0700
X-CSE-ConnectionGUID: winOTtbIQdSfOeiJfzOBEg==
X-CSE-MsgGUID: bFuITxZuQDOnq7NrG9Q4Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42686513"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jun 2024 05:35:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKdTp-0008aG-1c;
	Fri, 21 Jun 2024 12:35:01 +0000
Date: Fri, 21 Jun 2024 20:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>
Subject: [ulfh-mmc:next 13/14] include/linux/container_of.h:20:54: error:
 'struct tmio_mmc_host' has no member named 'dma_complete'
Message-ID: <202406212001.I8GmDRFr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   602a73f6dd02fc2501694c8e08b7a1e267b7c14c
commit: 74a3fe7c3784c8cae2e3e14c0078f33c1468fefc [13/14] mmc: Convert from tasklet to BH workqueue
config: arm-randconfig-001-20240621 (https://download.01.org/0day-ci/archive/20240621/202406212001.I8GmDRFr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406212001.I8GmDRFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406212001.I8GmDRFr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from drivers/mmc/host/renesas_sdhi_internal_dmac.c:10:
   drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function 'renesas_sdhi_internal_dmac_complete_work_fn':
>> include/linux/container_of.h:20:54: error: 'struct tmio_mmc_host' has no member named 'dma_complete'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/workqueue.h:535:9: note: in expansion of macro 'container_of'
     535 |         container_of(callback_work, typeof(*var), work_fieldname)
         |         ^~~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:38: note: in expansion of macro 'from_work'
     489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
         |                                      ^~~~~~~~~
   include/linux/compiler_types.h:428:27: error: expression in static assertion is not an integer
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/workqueue.h:535:9: note: in expansion of macro 'container_of'
     535 |         container_of(callback_work, typeof(*var), work_fieldname)
         |         ^~~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:38: note: in expansion of macro 'from_work'
     489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
         |                                      ^~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:299,
                    from include/linux/build_bug.h:5:
>> include/linux/stddef.h:16:33: error: 'struct tmio_mmc_host' has no member named 'dma_complete'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/workqueue.h:535:9: note: in expansion of macro 'container_of'
     535 |         container_of(callback_work, typeof(*var), work_fieldname)
         |         ^~~~~~~~~~~~
   drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:38: note: in expansion of macro 'from_work'
     489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
         |                                      ^~~~~~~~~


vim +20 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 20 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
