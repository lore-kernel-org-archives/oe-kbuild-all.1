Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89F2771B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675635338; x=1707171338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xe3gaUk8k5aWbUDGXG+mEoyDN3fe2iTj8XWnM94VYr0=;
  b=RacW9QLPzMOutS9uFScCW7yb4M2KYoq99ExrYzmB9MzMjWAv0iAHcMlk
   2/kjStkrZD4CY3TbcH8XHnC5Vq20n1d2l8gzlFxsBN7NOWdWqP9aw+QIl
   XKLYme0YbXh6C5m3WGqpb7ffgQMY0mSfMlIL6F98r/cUZG2+Yt2iZYJky
   R1rupVSw6jkLucZKTjUyDqjWZhytPVa5qf7u8RRmordCvAjSq3zK3QOX/
   wyp54lreM7mXwE9vUvfi7snWw5xR/IlXxVS+8jiBvAI/TM2ocBcWmjJAL
   mLSY4XoWeWURq+fD2xEJkdNB1SLA+j8rR8fpEO+LeJtkAUENmc6g0Cbw+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="330387234"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="330387234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 14:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="840186665"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840186665"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 14:15:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOnIN-0002FQ-3C;
	Sun, 05 Feb 2023 22:15:36 +0000
Date: Mon, 6 Feb 2023 06:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 14/52]
 arch/powerpc/net/bpf_jit32.h:131:8: error: redefinition of 'struct
 codegen_context'
Message-ID: <202302060626.kvJAWd8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   313db0094b0f240644cea73f448aa0fe83a7dcd2
commit: 88d1b097dbc5fc3bd946cdff8e7373cfab1db520 [14/52] powerpc/bpf: Move common helpers into bpf_jit.h
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230206/202302060626.kvJAWd8R-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=88d1b097dbc5fc3bd946cdff8e7373cfab1db520
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 88d1b097dbc5fc3bd946cdff8e7373cfab1db520
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/net/bpf_jit_comp.c:16:
>> arch/powerpc/net/bpf_jit32.h:131:8: error: redefinition of 'struct codegen_context'
     131 | struct codegen_context {
         |        ^~~~~~~~~~~~~~~
   In file included from arch/powerpc/net/bpf_jit32.h:13:
   arch/powerpc/net/bpf_jit.h:124:8: note: originally defined here
     124 | struct codegen_context {
         |        ^~~~~~~~~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:18:20: error: redefinition of 'bpf_flush_icache'
      18 | static inline void bpf_flush_icache(void *start, void *end)
         |                    ^~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:139:20: note: previous definition of 'bpf_flush_icache' with type 'void(void *, void *)'
     139 | static inline void bpf_flush_icache(void *start, void *end)
         |                    ^~~~~~~~~~~~~~~~


vim +131 arch/powerpc/net/bpf_jit32.h

6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22  130  
6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22 @131  struct codegen_context {
6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22  132  	unsigned int seen;
6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22  133  	unsigned int idx;
6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22  134  	int pc_ret0; /* bpf index of first RET #0 instruction (if any) */
6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22  135  };
6ac0ba5a4f82b4 Naveen N. Rao 2016-06-22  136  

:::::: The code at line 131 was first introduced by commit
:::::: 6ac0ba5a4f82b40b4f6b3a75e7e4f0a15a3d7b9b powerpc/bpf/jit: Isolate classic BPF JIT specifics into a separate header

:::::: TO: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
