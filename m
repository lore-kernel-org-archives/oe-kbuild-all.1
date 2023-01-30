Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32CBD17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675069077; x=1706605077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAHYEUFxyDqW8laPpB/XPdEk+LiDRG970zraNaPQX4o=;
  b=fP2TE60BD3k8jGdC3sc2NpbIufC2wybvbNwSbIyywFIitH9+d9V7EgY0
   r/K2MfHuubZGbuxRg9K0gSzHlB2J0Ff66TojDbwTVpvppOQNOtB5xd33V
   kwM6Z4I1HPYgHugWjfNmkq2CFAHpZz8bZqSF2JExbD6tkPou5Rn3Inaas
   q2kyDxFJsBgIMwtuJg0ywioj7YMZH6VNVGVJ+68RD4/Gexc7RWjBWaq3V
   MMzYIof/rSD9lpsEBhLAi6BEPY6dLA9A6EuDGJzFFelanR5w8FijTxLbz
   le1n3OaTRrwTScEI6c+W5PDU9C0s7HA9hEWDt1biclI9//8BreblnRzyQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="326175551"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="326175551"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 00:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="665999067"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="665999067"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jan 2023 00:57:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMPz9-0003W4-2G;
	Mon, 30 Jan 2023 08:57:55 +0000
Date: Mon, 30 Jan 2023 16:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 3/3]
 include/asm-generic/memory_model.h:23:19: error: static declaration of
 'pfn_valid' follows non-static declaration
Message-ID: <202301301652.IA2S05jq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   070224895280d442d59cdb72b30160402af90439
commit: 070224895280d442d59cdb72b30160402af90439 [3/3] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: arm-randconfig-r015-20230130 (https://download.01.org/0day-ci/archive/20230130/202301301652.IA2S05jq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=070224895280d442d59cdb72b30160402af90439
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 070224895280d442d59cdb72b30160402af90439
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/memory.h:389,
                    from arch/arm/include/asm/page.h:163,
                    from arch/arm/include/asm/thread_info.h:14,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arm/kernel/asm-offsets.c:11:
>> include/asm-generic/memory_model.h:23:19: error: static declaration of 'pfn_valid' follows non-static declaration
      23 | static inline int pfn_valid(unsigned long pfn)
         |                   ^~~~~~~~~
   arch/arm/include/asm/page.h:160:12: note: previous declaration of 'pfn_valid' with type 'int(long unsigned int)'
     160 | extern int pfn_valid(unsigned long);
         |            ^~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pfn_valid +23 include/asm-generic/memory_model.h

    17	
    18	#define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
    19	#define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
    20					 ARCH_PFN_OFFSET)
    21	
    22	#ifndef pfn_valid
  > 23	static inline int pfn_valid(unsigned long pfn)
    24	{
    25		/* avoid <linux/mm.h> include hell */
    26		extern unsigned long max_mapnr;
    27		unsigned long pfn_offset = ARCH_PFN_OFFSET;
    28	
    29		return pfn >= pfn_offset && pfn < max_mapnr;
    30	}
    31	#define pfn_valid pfn_valid
    32	#endif
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
