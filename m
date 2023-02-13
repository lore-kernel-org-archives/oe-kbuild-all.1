Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD52290B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676313361; x=1707849361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0BghnkqDshzuPOwjVejnCxRL3/Bj0dfY9tcJJzi0068=;
  b=i6VZwgGJeuYh0LoDGZK0X3cyIWaxitvT0ivua9GJyIDYV3I5WrsQvWzF
   PnhvIxSWxtTUkjauoSdzANvLm3IlZKdeWIDmqo79eQ4R5/AyGwz5AkdCQ
   LQjXffXEQ4fFLxWnqk4z8tKa78Xdi2IKSZxxf1qIRjQaYTND+Riqao7jy
   tJhbK+VcP0NBqD7hND3rQxPUcx9NBx+P8rjk9u/2E5TAH3qb1i2rMbCrm
   TVhBthDqaY82tx6uVzXDUa1XV9pFO7KbSegi4u3C17IPvhHd7+oOxBmpw
   xZifAoBROzzVQHwqfQWLRMeozDRRjP6fCZCTvH1NUCuVftSrVP7I9Y/SS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314604675"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="314604675"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 10:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699246187"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699246187"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 10:35:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRdfm-0007wf-2m;
	Mon, 13 Feb 2023 18:35:30 +0000
Date: Tue, 14 Feb 2023 02:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC Zisslpcfi 08/20] riscv: ELF header parsing in GNU
 property for riscv zisslpcfi
Message-ID: <202302140228.ognw1SO3-lkp@intel.com>
References: <20230213045351.3945824-9-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213045351.3945824-9-debug@rivosinc.com>

Hi Deepak,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linus/master arnd-asm-generic/master v6.2-rc8]
[cannot apply to next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20230213045351.3945824-9-debug%40rivosinc.com
patch subject: [PATCH v1 RFC Zisslpcfi 08/20] riscv: ELF header parsing in GNU property for riscv zisslpcfi
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230214/202302140228.ognw1SO3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/20f9ba1925526ea13ae4ba4398b2c4a800e63c53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
        git checkout 20f9ba1925526ea13ae4ba4398b2c4a800e63c53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140228.ognw1SO3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:203:5: warning: no previous prototype for 'allocate_shadow_stack' [-Wmissing-prototypes]
     203 | int allocate_shadow_stack(unsigned long *shadow_stack_base, unsigned long *shdw_size)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/allocate_shadow_stack +203 arch/riscv/kernel/process.c

   201	
   202	
 > 203	int allocate_shadow_stack(unsigned long *shadow_stack_base, unsigned long *shdw_size)
   204	{
   205		int flags = MAP_ANONYMOUS | MAP_PRIVATE;
   206		struct mm_struct *mm = current->mm;
   207		unsigned long addr, populate, size;
   208		*shadow_stack = 0;
   209	
   210		if (!shdw_size)
   211			return -EINVAL;
   212	
   213		size = *shdw_size;
   214	
   215		/* If size is 0, then try to calculate yourself */
   216		if (size == 0)
   217			size = round_up(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G), PAGE_SIZE);
   218		mmap_write_lock(mm);
   219		addr = do_mmap(NULL, 0, size, PROT_SHADOWSTACK, flags, 0,
   220			       &populate, NULL);
   221		mmap_write_unlock(mm);
   222		if (IS_ERR_VALUE(addr))
   223			return PTR_ERR((void *)addr);
   224		*shadow_stack_base = addr;
   225		*shdw_size = size;
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
