Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06908495
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 05:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695101162; x=1726637162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoJV0tzjCyRhYwvkT6gfn/WianCaD12d93qmVXa5FWc=;
  b=THvMPjw+fQhOmlvFIUXcPEhRpjkjnOk1t9WWi1sDlsuJyYGMnCGuLDZp
   CijJrrLg7F9J50rcUxWCWS1Aa3QwLC6kXYuHL6i3YG/+Ko7sgG7hn/pIg
   +Fj+PYzrUbnL6Ai3hi2HLZzpojNGHBDSGNWnDv3bBV6D29o6xp3KfonWp
   GmrRdGLoRmJgcQOeTJxrcoRjgqrRaMGzPcSREFTGlV1EkXqfRFlik3ieV
   +mmIw97gUn8R+qiW/951PdsflEElSZnB53e3UOaz2Gh40gp/XE5Z87xaD
   PBb8L9brmDfVL9pl0x/0nrH6jt/eM8/6VDHAT+xhRiPR9aYgj2lZsyH1r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378755498"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="378755498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 22:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775412188"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="775412188"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Sep 2023 22:26:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiTFG-0006wW-1b;
	Tue, 19 Sep 2023 05:25:58 +0000
Date: Tue, 19 Sep 2023 13:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 87/92]
 arch/x86/kernel/cpu/topology_common.c:151: undefined reference to
 `topology_get_logical_id'
Message-ID: <202309191325.8q5XsXGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   91418b13c03f8f6c26f4bfca7a82d9b94c4dccde
commit: 78c2272b69e36c329a8639b52af1b4741f2ce967 [87/92] x86/cpu/topology: Use topology logical mapping mechanism
config: i386-randconfig-003-20230919 (https://download.01.org/0day-ci/archive/20230919/202309191325.8q5XsXGn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191325.8q5XsXGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191325.8q5XsXGn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/topology_common.o: in function `topo_set_ids':
>> arch/x86/kernel/cpu/topology_common.c:151: undefined reference to `topology_get_logical_id'
>> ld: arch/x86/kernel/cpu/topology_common.c:152: undefined reference to `topology_get_logical_id'
   ld: arch/x86/kernel/cpu/debugfs.o: in function `dom_debug_show':
   arch/x86/kernel/cpu/debugfs.c:55: undefined reference to `domain_names'


vim +151 arch/x86/kernel/cpu/topology_common.c

   142	
   143	static void topo_set_ids(struct topo_scan *tscan)
   144	{
   145		struct cpuinfo_x86 *c = tscan->c;
   146		u32 apicid = c->topo.apicid;
   147	
   148		c->topo.pkg_id = topo_shift_apicid(apicid, TOPO_PKG_DOMAIN);
   149		c->topo.die_id = topo_shift_apicid(apicid, TOPO_DIE_DOMAIN);
   150	
 > 151		c->topo.logical_pkg_id = topology_get_logical_id(apicid, TOPO_PKG_DOMAIN);
 > 152		c->topo.logical_die_id = topology_get_logical_id(apicid, TOPO_DIE_DOMAIN);
   153	
   154		/* Package relative core ID */
   155		c->topo.core_id = (apicid & topo_domain_mask(TOPO_PKG_DOMAIN)) >>
   156			x86_topo_system.dom_shifts[TOPO_SMT_DOMAIN];
   157	
   158		c->topo.amd_node_id = tscan->amd_node_id;
   159	
   160		if (c->x86_vendor == X86_VENDOR_AMD)
   161			cpu_topology_fixup_amd(tscan);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
