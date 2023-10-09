Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC39BA40
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 06:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kay43AMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696832684; x=1728368684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sJXqXOIfAPxLhgqSJ8AdIy6V6w61PyA3IJTubSBppkY=;
  b=Kay43AMa18dWN5LQeKBzhdI3OZlf+wNdzXfqW80uNhNtg19Zr3i921ff
   huWm+DHY3ZVr/yMAlGrbCItNm8kQRJ2tmYq9hcT2mXQVUlz8SusqOjxTF
   hzy5CaLoaWOv84Yv5HMl6lsY9MBSLSoLb7abDGuG23dT2bbRA5eyXBKNE
   MGgoNISLynJAZ0Jk/xMZASGZ45FE4HrSiF/bt7tr8tPEozTihno3+YhI3
   XotauWsTi9KH3ExVB6WvmNSrVjmD988+V2J3rPCzzyu21J5UoDEtEcICU
   0hmMoK0RNwOlBAcZuYIFdKyZRNVEHvq8ESgS712ir1uuYIWprCiX4y5Tl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="450575352"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="450575352"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 23:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1000076450"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="1000076450"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Oct 2023 23:24:41 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpjh1-000672-0T;
	Mon, 09 Oct 2023 06:24:39 +0000
Date: Mon, 9 Oct 2023 14:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
	mpe@ellerman.id.au
Cc: oe-kbuild-all@lists.linux.dev, mahesh@linux.vnet.ibm.com,
	adityag@linux.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH v3 1/3] powerpc: make fadump resilient with memory
 add/remove events
Message-ID: <202310091444.dryLmXy1-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.6-rc5 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-make-fadump-resilient-with-memory-add-remove-events/20231009-122519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231009041953.36139-2-sourabhjain%40linux.ibm.com
patch subject: [PATCH v3 1/3] powerpc: make fadump resilient with memory add/remove events
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310091444.dryLmXy1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091444.dryLmXy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310091444.dryLmXy1-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> arch/powerpc/include/asm/page.h:210:2: warning: passing argument 1 of 'fadump_free_buffer' makes integer from pointer without a cast [-Wint-conversion]
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


vim +/fadump_free_buffer +210 arch/powerpc/include/asm/page.h

c4bce84d0bd3f3 Michael Ellerman 2022-04-07  203  
bdbc29c19b2633 Paul Mackerras   2013-08-27  204  /*
bdbc29c19b2633 Paul Mackerras   2013-08-27  205   * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
bdbc29c19b2633 Paul Mackerras   2013-08-27  206   * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
4dd7554a6456d1 Nicholas Piggin  2019-07-24  207   * This also results in better code generation.
bdbc29c19b2633 Paul Mackerras   2013-08-27  208   */
4dd7554a6456d1 Nicholas Piggin  2019-07-24  209  #define __va(x)								\
4dd7554a6456d1 Nicholas Piggin  2019-07-24 @210  ({									\
c4bce84d0bd3f3 Michael Ellerman 2022-04-07  211  	VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);		\
4dd7554a6456d1 Nicholas Piggin  2019-07-24  212  	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
4dd7554a6456d1 Nicholas Piggin  2019-07-24  213  })
4dd7554a6456d1 Nicholas Piggin  2019-07-24  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
