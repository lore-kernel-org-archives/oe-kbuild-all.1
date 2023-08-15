Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A8E3207
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 06:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692079424; x=1723615424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmWL8148XO8APcqd77xkkyCD6Kn5Ec7FeYc5z5PSGyw=;
  b=VfBzwwMX1yUQo7qhNOKzyxeHTp26Y3Lojc2mYiMMCfi1dqBL9hOesw0i
   P2Q4q928FIw5lP1swTiNDwoxiEkMDvqpvsa3XszJUbDhi1Y/GMrwTmDYx
   1NrDkUTdG8O5UlQirF1BAo+1qcGEbfDXnkRqaY3ZChuI2S7LT90E4R6D3
   ZJLaTVDeK0C7yUYlsM7BkaAtf27Y70HoSZsKc72Pb/et4cn/GZXdiQ8/k
   nnDaMZF8Z96g+3Q2ZXYilKA5A6T23f+glM4QeGV32CqcfjAlmlM6h6Bbj
   hPWjoiO7QlYpszlvji4x/VCxNjZVrPhnZesBbhtqvl7SiK3svD4bsB4qV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374980277"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="374980277"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 23:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823728116"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="823728116"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 23:03:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVn9S-0000hb-2G;
	Tue, 15 Aug 2023 06:03:34 +0000
Date: Tue, 15 Aug 2023 14:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
Message-ID: <202308151342.ROQ9Urvv-lkp@intel.com>
References: <20230815004813.555115-21-vgupta@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815004813.555115-21-vgupta@kernel.org>

Hi Vineet,

kernel test robot noticed the following build errors:

[auto build test ERROR on vgupta-arc/for-curr]
[cannot apply to vgupta-arc/for-next linus/master v6.5-rc6 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vineet-Gupta/ARC-uaccess-remove-arc-specific-out-of-line-handles-for-Os/20230815-085308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr
patch link:    https://lore.kernel.org/r/20230815004813.555115-21-vgupta%40kernel.org
patch subject: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
config: arc-randconfig-r043-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151342.ROQ9Urvv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151342.ROQ9Urvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151342.ROQ9Urvv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/arc/include/asm/ptrace.h: In function 'regs_get_register':
>> include/linux/stddef.h:16:33: error: 'struct pt_regs' has no member named 'event'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arc/include/asm/ptrace.h:57:24: note: in expansion of macro 'offsetof'
      57 | #define MAX_REG_OFFSET offsetof(struct pt_regs, event)
         |                        ^~~~~~~~
   arch/arc/include/asm/ptrace.h:164:31: note: in expansion of macro 'MAX_REG_OFFSET'
     164 |         if (unlikely(offset > MAX_REG_OFFSET))
         |                               ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1 shuffle=716081594
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=716081594
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=716081594
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=716081594
   make: Target 'prepare' not remade because of errors.


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
