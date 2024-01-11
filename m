Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79742106
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLQ32ieN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704953931; x=1736489931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YqB9pE7EJuvoFrF8RrrcGO03hiCVYoM9z/rIiG8qluU=;
  b=XLQ32ieNoWW8/VP/oFfUm7NyO7LYHqtngb5wWW2qYoSlYaxHhEBD40cw
   POPP6bh8wdJ/uqVMVApFIUlZ7vNLJFxKXwGC8a63CooPaoDA6fUieyXWs
   U3JexYXeb1spahV/XuK0pfcxV0mqEFTTUCzt+5qAYHB22ygvQcswRFU8u
   PNoTKIv88MZ6p/31SjYQLmkDZu4wqULbPdwLM7r65xCQpzCGf8C0+97wb
   /IgX5G7fF4KmywNAsV6D0X/o8eid7udWCKEwrjlAoyiTM9JuqmTTAlVYx
   IIUi0hsMsr7FE6fiJ4pfraOLDMciWGiWiLPe+vabQYCeH9ZYVkFOKBp1n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389189005"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="389189005"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="782506827"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="782506827"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Jan 2024 22:18:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNoOt-0007uA-1g;
	Thu, 11 Jan 2024 06:18:47 +0000
Date: Thu, 11 Jan 2024 14:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2303/2334] mm/memcontrol.c:4344:5: warning: no
 previous prototype for function 'memcg_swapmax_read'
Message-ID: <202401111446.NU1YIMBF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [2303/2334] memcg: add restrict to swap to cgroup1
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240111/202401111446.NU1YIMBF-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111446.NU1YIMBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111446.NU1YIMBF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:3223:6: warning: no previous prototype for function 'hisi_oom_recover' [-Wmissing-prototypes]
    3223 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^
   mm/memcontrol.c:3223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3223 | void hisi_oom_recover(struct obj_cgroup *objcg)
         | ^
         | static 
>> mm/memcontrol.c:4344:5: warning: no previous prototype for function 'memcg_swapmax_read' [-Wmissing-prototypes]
    4344 | u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
         |     ^
   mm/memcontrol.c:4344:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4344 | u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_swapmax_read +4344 mm/memcontrol.c

  4343	
> 4344	u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
  4345	{
  4346		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  4347	
  4348		if (!static_branch_likely(&memcg_swap_qos_key))
  4349			return PAGE_COUNTER_MAX * PAGE_SIZE;
  4350	
  4351		return READ_ONCE(memcg->swap_dev->max) * PAGE_SIZE;
  4352	}
  4353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
