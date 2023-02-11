Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9202883B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 21:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676151268; x=1707687268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5lQnSIboUpHGZZxDLLXfuZJCH+DGODHCO59VxKPvmM=;
  b=BRV5VbMqlyASGEYKKXszHnzQEtGQI3n5qvPH9jWXGZZbbaJYOR1g5q7Q
   Z3PMFYh6EpXG3CxrL2m2unyjNWpL02D5t8HbIoflHvPVwGbVHqdN8O49n
   yhzblx33RHcXZlZro+DP4IAhj2tMK6K/ZDzsveoeDDVWK1K52bvTy8ivY
   E8PX1dFSJbyniA1R9DIGRtQYn0GuvULTu7SqK/ENnTENb/fc/Ot8fYLEW
   iHtzmwmJKM0uEDJvTgmPlxrdyDx2OveAt9DO/iXyWWA2pzMozMrzn7B08
   wVN2MSD4B2ixbxIOQ3Ara3u01Z9lORzEAIW7Fgh8u2yVvP965TSNOoiMZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="314300303"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="314300303"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 13:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="668402534"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="668402534"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Feb 2023 13:34:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQxVp-0006oh-1a;
	Sat, 11 Feb 2023 21:34:25 +0000
Date: Sun, 12 Feb 2023 05:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.10 8/105]
 arch/powerpc/net/bpf_jit32.h:131:8: error: redefinition of 'struct
 codegen_context'
Message-ID: <202302120550.FfTfDIyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.10
head:   9ff628d4688675caf3ffe3356e353fcb4af8ba92
commit: 8db4374c40363a75c6eb9d18dd12b3fc4a41d291 [8/105] powerpc/bpf: Move common helpers into bpf_jit.h
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230212/202302120550.FfTfDIyg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/8db4374c40363a75c6eb9d18dd12b3fc4a41d291
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.10
        git checkout 8db4374c40363a75c6eb9d18dd12b3fc4a41d291
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120550.FfTfDIyg-lkp@intel.com/

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
