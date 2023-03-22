Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987E2F21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679492502; x=1711028502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LagsM0LbwYdEUlprf/2aPzY49I8FBqS5cEQGg5D5i2A=;
  b=eGv9+yCRDaw1X7S5l0q8flpx04hsGzIFtxms8tbmnL1CA8XtmAIwqb6A
   Vli5r+uVn/YJ3SA9CWRs1Df5s5HiOnGyWymA6I2TKddm28aBY6KtIPgiQ
   wYrB24zoMetVpwCnGVhA62B2t9bFWewNz1C/lr1ik5884Xem2MAk+ZjXr
   PZxqM27bgQqltJQ6JdVHCOOblm+LtIFATE8hNDVobbEe2jAEYFckcnPtj
   W+wB7KhFJSR3g/mCJASB3f2T0/4HZ9WgLLX0jZV4v411tS9NuOEug086c
   EpnQu2rVlYur3GSacPIoG5mh9U18YylxTIuBJKk2tctgzYqzdM4W36Ah0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336717214"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336717214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 06:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675269841"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="675269841"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Mar 2023 06:41:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peyig-000DLs-3B;
	Wed, 22 Mar 2023 13:41:38 +0000
Date: Wed, 22 Mar 2023 21:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>
Subject: [palmer:fixes 7/7] arch/riscv/mm/context.c:320:45: error:
 'mm_context_t' has no member named 'id'
Message-ID: <202303222154.W5q82pOI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git fixes
head:   ef2bf1beb0040f40690671b2a0f6ce0071f101d3
commit: ef2bf1beb0040f40690671b2a0f6ce0071f101d3 [7/7] riscv: Ensure only ASIDLEN is used for sfence.vma
config: riscv-randconfig-r022-20230322 (https://download.01.org/0day-ci/archive/20230322/202303222154.W5q82pOI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=ef2bf1beb0040f40690671b2a0f6ce0071f101d3
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer fixes
        git checkout ef2bf1beb0040f40690671b2a0f6ce0071f101d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303222154.W5q82pOI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/context.c: In function 'get_mm_asid':
>> arch/riscv/mm/context.c:320:45: error: 'mm_context_t' has no member named 'id'
     320 |         return atomic_long_read(&mm->context.id) & asid_mask;
         |                                             ^
>> arch/riscv/mm/context.c:320:52: error: 'asid_mask' undeclared (first use in this function); did you mean 'pid_task'?
     320 |         return atomic_long_read(&mm->context.id) & asid_mask;
         |                                                    ^~~~~~~~~
         |                                                    pid_task
   arch/riscv/mm/context.c:320:52: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/mm/context.c:321:1: error: control reaches end of non-void function [-Werror=return-type]
     321 | }
         | ^
   cc1: some warnings being treated as errors


vim +320 arch/riscv/mm/context.c

   317	
   318	unsigned long get_mm_asid(struct mm_struct *mm)
   319	{
 > 320		return atomic_long_read(&mm->context.id) & asid_mask;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
