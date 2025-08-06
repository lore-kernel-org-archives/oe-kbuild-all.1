Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C15486337
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754481959; cv=none; b=CkqXRzxc9Y2zDzlQ/C4b1dcFR4cKUBSngRERjU7AGZ96QX86K918b2w0sbt8BeGniVlHUryWGHYrlVoP4y+m5h8q32yvS7D1I1+dbiX4Yc4k8c2whWhndpOpu2v1F8vnmS49DCQbcRtRvTVHV/wfNk91O0ZKb4yGiSeov4BIFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754481959; c=relaxed/simple;
	bh=hGjlGo29v0u/Ypk7QR5vg0D745Y6UnnheGNn13pNRcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxLBuc8zZYbYtXTJ+4LvX5FL+847mLqarjDuwcu8EVM5ptf6fS5kYM0yFBHTXgJbK+U3gUiOVVxPdhWh68+3EAxksA2pVspxcnQt80luZJW6X/uFsSONZImO9g4TnWlC/hQ0eqzHfrUZevcSpkkxwf5re1VZLScN4MZscQpbiGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJwBHmiC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJwBHmiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754481957; x=1786017957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGjlGo29v0u/Ypk7QR5vg0D745Y6UnnheGNn13pNRcw=;
  b=hJwBHmiC/2jkZglzDNdlNL5h8OcOH1R+Z7jL8ClJRY0hqx8eBa1tF5j7
   i52tH5DWM7dl8OrsTaxD7hG0nlj1dllO+1HYwb6d9U/sw9FKHJ+XiIJbC
   PGvyG1zvkvOE24yl0cOC+9awPK2h6RhnEJOpRaQzQ0HCOBSTtLq0QoA+7
   ZLpx6lzhyHYlHl8osqTzzZcsSqG56ZYNSEm6bOWIRYRB/y47MQOwDq+rU
   yZtf6OlDsKUCxT70KowwtDxv9WKDAlvHnFZlUSlDMlL5E55XhIGPqXgf2
   2/0GHrH9xMC0xl4mJvtGQU9C6M90U2f6Q+XnFt2K+1gkUQw+P+TdRy+t6
   w==;
X-CSE-ConnectionGUID: n6txaI7uSaKhceKnRywZBA==
X-CSE-MsgGUID: WOpx2U04RQOFOBCvQqJ5EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68244874"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68244874"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 05:05:56 -0700
X-CSE-ConnectionGUID: Cm8fSvG6T1qoerCPMVMB4g==
X-CSE-MsgGUID: aEbzRUBBQlqrzApkS/u0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="170132599"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2025 05:05:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujcu0-0002CZ-2S;
	Wed, 06 Aug 2025 12:05:52 +0000
Date: Wed, 6 Aug 2025 14:05:36 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2658/2658]
 drivers/char/ipmi/ipmi_si_ls2k500.c:92:5: warning: no previous prototype for
 function 'ipmi_si_sim_setup'
Message-ID: <202508061418.ItIqDS25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8551213150db5f8eebd27273dae93f6fe258d63a
commit: 4fbeaa84ef36adce930088074f8c088e5dd780c0 [2658/2658] ipmi: add ls2k500 bmc ipmi support.
config: loongarch-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061418.ItIqDS25-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061418.ItIqDS25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061418.ItIqDS25-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/ipmi/ipmi_si_ls2k500.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/ipmi/ipmi_si_ls2k500.c:92:5: warning: no previous prototype for function 'ipmi_si_sim_setup' [-Wmissing-prototypes]
      92 | int ipmi_si_sim_setup(struct si_sm_io *io)
         |     ^
   drivers/char/ipmi/ipmi_si_ls2k500.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | int ipmi_si_sim_setup(struct si_sm_io *io)
         | ^
         | static 
   5 warnings generated.


vim +/ipmi_si_sim_setup +92 drivers/char/ipmi/ipmi_si_ls2k500.c

    91	
  > 92	int ipmi_si_sim_setup(struct si_sm_io *io)
    93	{
    94		io->inputb = intf_sim_inb;
    95		io->outputb = intf_sim_outb;
    96		io->io_cleanup = ipmi_ls2k500_cleanup;
    97		return 0;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
