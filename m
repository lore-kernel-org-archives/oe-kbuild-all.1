Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C3A7B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 03:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678333149; x=1709869149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gsO9F5yTQpAzcPBK5xDvs5ykYTxCADh1lcZlziHCxYY=;
  b=jwAoD7Ml+mxhWZY9qOE2iHTz9NX16Sw+ArQWAA27syXRp+JWDmdg4RK+
   HgM8VDM7tZMbHWySxZLW0kUQLK1YrJndkNFu03t29Xg61tlxEwayk7boM
   60hBJBSQvHHhE2kHGIEsIdC7Zw8BJKxV9cmamVg1A4PYHu7/Hy7v+Lr/h
   4urotN8uZ1+i95oaUCqwRyWToOix3Y5m2euui8/d9n7Devh7FwoP8C8kh
   On8ex2sem1HxaS8DAvKoNxg23pAAixcXS20Q/gNd/XXYAD61dGS+mMTa7
   wjxKaAySqRizSXPWKqRLY90LmZPYffCY68jP+Vuv0QeQWWq6VzGZ46MV+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324662545"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="324662545"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 19:39:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707435862"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="707435862"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 19:39:07 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa77T-0002aX-0C;
	Thu, 09 Mar 2023 03:39:07 +0000
Date: Thu, 9 Mar 2023 11:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Brian Gerst <brgerst@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [dwmw2:parallel-6.2-v14 9/12] arch/x86/kernel/cpu/topology.c:35:5:
 warning: no previous prototype for 'check_extended_topology_leaf'
Message-ID: <202303091146.RrViPavq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-v14
head:   09fe2cb4dcbf4dce5b30501259605c1aeb8ab4d6
commit: 8e06b9843fec8b88bf8583c9e6915aa2aaa115ac [9/12] x86/smpboot: Support parallel startup of secondary CPUs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303091146.RrViPavq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-v14
        git checkout 8e06b9843fec8b88bf8583c9e6915aa2aaa115ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091146.RrViPavq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/topology.c:35:5: warning: no previous prototype for 'check_extended_topology_leaf' [-Wmissing-prototypes]
      35 | int check_extended_topology_leaf(int leaf)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/check_extended_topology_leaf +35 arch/x86/kernel/cpu/topology.c

    30	
    31	#ifdef CONFIG_SMP
    32	/*
    33	 * Check if given CPUID extended topology "leaf" is implemented
    34	 */
  > 35	int check_extended_topology_leaf(int leaf)
    36	{
    37		unsigned int eax, ebx, ecx, edx;
    38	
    39		cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
    40	
    41		if (ebx == 0 || (LEAFB_SUBTYPE(ecx) != SMT_TYPE))
    42			return -1;
    43	
    44		return 0;
    45	}
    46	/*
    47	 * Return best CPUID Extended Topology Leaf supported
    48	 */
    49	static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
    50	{
    51		if (c->cpuid_level >= 0x1f) {
    52			if (check_extended_topology_leaf(0x1f) == 0)
    53				return 0x1f;
    54		}
    55	
    56		if (c->cpuid_level >= 0xb) {
    57			if (check_extended_topology_leaf(0xb) == 0)
    58				return 0xb;
    59		}
    60	
    61		return -1;
    62	}
    63	#endif
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
