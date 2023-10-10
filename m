Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE745186C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCcd1FEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696974316; x=1728510316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ziS6XIH7FCuChzdyXDqrdUsxUPHcm6FUfN7d0RKRbXo=;
  b=oCcd1FEIfCH2f/OPm9Xh+OJTAuS4G1IwlNtKUoXTTdPHfzQ628feM5DE
   2zRufEMnSX5VwdIaRZ49J4HzRUPgigQO2p0x8qhJU6jO5ZzJlv8PjTS2f
   CjAMQHoHebGbqQGo8AuN/ovRH+ZmH1ONyVx6THfD+1SRTld5g5W3tph5H
   werGgu07NQuR/aNslKaqO/DMVdGiFFQmAaGIiakK3cxyOBf1RtOEXUgj5
   Hni6ebxT9gV0FRIHuHB6dGORUHEZwPkzNGwtIRq48tbriquex1ZLtwDni
   tB/bRLYN8Gxr91JG1IaK7E4FuOVgRgNiySOzg+hu88Fcu7ubJ7GPW+FMA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363865879"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="363865879"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 14:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703459431"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="703459431"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Oct 2023 14:45:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqKXO-0001Ey-09;
	Tue, 10 Oct 2023 21:45:10 +0000
Date: Wed, 11 Oct 2023 05:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
	mpe@ellerman.id.au
Cc: oe-kbuild-all@lists.linux.dev, mahesh@linux.vnet.ibm.com,
	adityag@linux.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH v3 1/3] powerpc: make fadump resilient with memory
 add/remove events
Message-ID: <202310110546.Idw21uuR-lkp@intel.com>
References: <20231009041953.36139-2-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009041953.36139-2-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.6-rc5 next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-make-fadump-resilient-with-memory-add-remove-events/20231009-122519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231009041953.36139-2-sourabhjain%40linux.ibm.com
patch subject: [PATCH v3 1/3] powerpc: make fadump resilient with memory add/remove events
config: powerpc64-randconfig-003-20231011 (https://download.01.org/0day-ci/archive/20231011/202310110546.Idw21uuR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110546.Idw21uuR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110546.Idw21uuR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/mmu.h:143,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from arch/powerpc/kernel/fadump.c:18:
   arch/powerpc/kernel/fadump.c: In function 'fadump_free_elfcorehdr_buf':
>> arch/powerpc/include/asm/page.h:210:2: error: passing argument 1 of 'fadump_free_buffer' makes integer from pointer without a cast [-Werror=int-conversion]
     210 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |  |
         |  void *
     211 |         VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     212 |         (void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     213 | })
         | ~~
   arch/powerpc/kernel/fadump.c:1401:28: note: in expansion of macro '__va'
    1401 |         fadump_free_buffer(__va(fdh->elfcorehdr_addr), fdh->elfcorehdr_size);
         |                            ^~~~
   arch/powerpc/kernel/fadump.c:795:46: note: expected 'long unsigned int' but argument is of type 'void *'
     795 | static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
         |                                ~~~~~~~~~~~~~~^~~~~
   arch/powerpc/kernel/fadump.c: At top level:
   arch/powerpc/kernel/fadump.c:1810:22: error: no previous prototype for 'arch_reserved_kernel_pages' [-Werror=missing-prototypes]
    1810 | unsigned long __init arch_reserved_kernel_pages(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/fadump_free_buffer +210 arch/powerpc/include/asm/page.h

c4bce84d0bd3f39 Michael Ellerman 2022-04-07  203  
bdbc29c19b2633b Paul Mackerras   2013-08-27  204  /*
bdbc29c19b2633b Paul Mackerras   2013-08-27  205   * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
bdbc29c19b2633b Paul Mackerras   2013-08-27  206   * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
4dd7554a6456d12 Nicholas Piggin  2019-07-24  207   * This also results in better code generation.
bdbc29c19b2633b Paul Mackerras   2013-08-27  208   */
4dd7554a6456d12 Nicholas Piggin  2019-07-24  209  #define __va(x)								\
4dd7554a6456d12 Nicholas Piggin  2019-07-24 @210  ({									\
c4bce84d0bd3f39 Michael Ellerman 2022-04-07  211  	VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);		\
4dd7554a6456d12 Nicholas Piggin  2019-07-24  212  	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
4dd7554a6456d12 Nicholas Piggin  2019-07-24  213  })
4dd7554a6456d12 Nicholas Piggin  2019-07-24  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
