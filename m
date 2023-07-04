Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9942575
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688476015; x=1720012015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSPhollXt4Yj2VO+1t5mwpMiH57PfEF29xIHP0tU/XI=;
  b=IyIRND4URtyH0wGl8nktZtKmC9SM173TB0IdHC79aX9H1cKux6bp98wy
   yyP4/Fw5Z9L66w/o8XPUhHNMZb0rFQ8w+N+Wkqp17n250Pv/hspYUaWEk
   YG3c6CM/Cedyimyf7vPKjyTVUjHpNwyOxoBZl7ShQGZ9yEzHzWpGd2Lld
   ofVEmFrXqKc51qDdr5Ccq3mujJBSa7IG6wTLJ4bZu8m6wm+TvjoqteUA0
   kJ0YMAesmmu4H1IZWj8e5u1xDhaO5MS6/zUmnzOHpjcip5hL018iAP4OP
   x+9Dr3dpL5oDoOPqncj0YVoI3J0pxccnehgNRbk7lzZpXTkRiMVk40YH7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343451281"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="343451281"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 06:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842988025"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="842988025"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jul 2023 06:06:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGfk4-000IGR-24;
	Tue, 04 Jul 2023 13:06:52 +0000
Date: Tue, 4 Jul 2023 21:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 9/37]
 arch/x86/kernel/cpu/mce/inject.c:437:34: error: 'struct cpuinfo_topology'
 has no member named 'topo'
Message-ID: <202307042053.NZdGHAIs-lkp@intel.com>
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
head:   53cee0c91c9944ef2e6b784edaea5df7d6ba5648
commit: 1f177511c113ba6edd3963a1a52180f6df4845b1 [9/37] x86/cpu: Move x86_max_cores into topology info
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230704/202307042053.NZdGHAIs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042053.NZdGHAIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042053.NZdGHAIs-lkp@intel.com/

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
