Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DC3C28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689053083; x=1720589083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6O+iqk65gm2uZ2VwHIa+i/jTUnsJV2i//P/AqzwA12o=;
  b=IcURhML5ldzHp2Tt7C1Ism6ETmaI8fPYvxNr0c7TQBuyCfVIlzpyOLAf
   eHmyywfKrYnobov8dQmYxtR/lcCH+VoLBEpEjhI2uOHNXK3MmTnDfe8EW
   rJQg2o3f3f4QcmuXbskzrwa2pvwvlyz7qUiKtlEqpAqqtLMqNJKOoXMWj
   QtHzH/j7ruCQECmvimRcs89rsxDS7U+6AxKjkn5VcgPe226aPtdAVocLz
   JyCKA94Ev4DgJ7/RXles/jkpyzG8UFIvOmMsKt1kyPP9DmDZ287e2Nrol
   gOm8xtwTw8pGYamm5V8HBxbYSi+7bJyhDC372UJPwoBPsHOe4hcjACmsP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428221082"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="428221082"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724285232"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="724285232"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 22:24:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ5re-0004LP-01;
	Tue, 11 Jul 2023 05:24:42 +0000
Date: Tue, 11 Jul 2023 13:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 9/39]
 arch/x86/kernel/cpu/mce/inject.c:437:34: error: 'struct cpuinfo_topology'
 has no member named 'topo'
Message-ID: <202307111334.vqqB1mq3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   3f2657ab54543fb9ee5894d239f8b7131a6ffac8
commit: ea35973627dfe1f61f68306a3664dcfea513d0c8 [9/39] x86/cpu: Move x86_max_cores into topology info
config: x86_64-buildonly-randconfig-r001-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111334.vqqB1mq3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111334.vqqB1mq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111334.vqqB1mq3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/inject.c: In function 'get_nbc_for_node':
>> arch/x86/kernel/cpu/mce/inject.c:437:34: error: 'struct cpuinfo_topology' has no member named 'topo'
     437 |         cores_per_node = (c->topo.topo.num_cores_per_pkg * smp_num_siblings) /
         |                                  ^


vim +437 arch/x86/kernel/cpu/mce/inject.c

   431	
   432	static u32 get_nbc_for_node(int node_id)
   433	{
   434		struct cpuinfo_x86 *c = &boot_cpu_data;
   435		u32 cores_per_node;
   436	
 > 437		cores_per_node = (c->topo.topo.num_cores_per_pkg * smp_num_siblings) /
   438			amd_get_nodes_per_socket();
   439	
   440		return cores_per_node * node_id;
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
