Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A6746E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 00:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730940647; cv=none; b=hHYscXxWObTeGMUMoFJ287xlgyNz9n1GnvwH0CCjnKDxQnjfkJNSkOpgfVun5IqShMctkEKA8B8Yw6JhHg7/FyyWOn673jo3AtKX9WnFYrmuBUCqT87SdzRUfx9Snw56mjyaQdac3vvlOpZfMbcxHyCwT8xy1L2MIbY55kuofKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730940647; c=relaxed/simple;
	bh=AhmxPsUV4Jx/uy15Ct//BIB1DKKgvYm4/O57H1ZXv+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bm4EO1mHeVxy5v72ouqBc/jYdiTD3k+LF1tcmCqtF14/i7F03TmxLBxRI8ifI8kCaLnX5o+twL3acjoNCqPR80WNvR6UM0sqpMIe4MqoX2PGa4MSY+xDJqAdssTROf7HFlTb5+f/YKepmHv9JExBaBiexkSHoUd8btipf7bHJeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZU8Ue9H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZU8Ue9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730940646; x=1762476646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhmxPsUV4Jx/uy15Ct//BIB1DKKgvYm4/O57H1ZXv+g=;
  b=QZU8Ue9HZYZvbohfovkdNIjZVwTtWgwZqyXk0t6qcDca7DY24Tco61Ag
   PLel8PhihNTaO9CMukAb5ZBOhCwT2gEEdrog1J92n8tlCnulRHvy+O0HD
   xIy3mxMInAQvmJo199JzIYiZp9XUhs93Ub5fqzlGH1rJlSIuo268yXGx+
   A2ZlPmK2vpNuD9w3RNAacZQ3sipAdaGoOGIX3cbtrqebMlhLBr52FRJJo
   NTC3xyhN65s79zyq9CC7vNK9bIEfQMiuM/2g3syWGlLax5+dmk+AEPyz7
   4eQtvXKPyt8XKx/H6IO8RMZh+Uk3GTF3vA0n+0AsNjC41JHXRogQFFcyI
   A==;
X-CSE-ConnectionGUID: H6JjeuM0RousayAF3l2pgw==
X-CSE-MsgGUID: ZlVDGjCsT4GHuOJ0NjOMfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48227123"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48227123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 16:50:45 -0800
X-CSE-ConnectionGUID: FgiPR/S/QrmuHTh/ArvbrQ==
X-CSE-MsgGUID: Q0Aeyvr8QeOs1g2OYDIciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="85262728"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2024 16:50:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qjS-000paZ-0D;
	Thu, 07 Nov 2024 00:50:42 +0000
Date: Thu, 7 Nov 2024 08:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_resctrl.c:1741:19: warning: variable 'times' set
 but not used
Message-ID: <202411070826.nwr0luMf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: e0aed913079d6b30aafeb50318f26d49bfb3d95b [1231/1231] arm64/mpam: resctrl: Add rmid file in resctrl sysfs
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241107/202411070826.nwr0luMf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070826.nwr0luMf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070826.nwr0luMf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_resctrl.c:221:1: warning: conflicting types for 'mpam_get_raw_resctrl_resource' due to enum/integer mismatch; have 'struct raw_resctrl_resource *(enum resctrl_resource_level)' [-Wenum-int-mismatch]
     221 | mpam_get_raw_resctrl_resource(enum resctrl_resource_level level)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/mpam/mpam_resctrl.c:48:
   arch/arm64/kernel/mpam/mpam_internal.h:327:1: note: previous declaration of 'mpam_get_raw_resctrl_resource' with type 'struct raw_resctrl_resource *(u32)' {aka 'struct raw_resctrl_resource *(unsigned int)'}
     327 | mpam_get_raw_resctrl_resource(u32 level);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:525:5: warning: no previous prototype for 'closid_bitmap_init' [-Wmissing-prototypes]
     525 | int closid_bitmap_init(void)
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:1319:5: warning: no previous prototype for 'cpus_ctrl_write' [-Wmissing-prototypes]
    1319 | int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:1374:5: warning: no previous prototype for 'cpus_mon_write' [-Wmissing-prototypes]
    1374 | int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: In function 'rdt_last_cmd_printf':
   arch/arm64/kernel/mpam/mpam_resctrl.c:1554:9: warning: function 'rdt_last_cmd_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1554 |         seq_buf_vprintf(&last_cmd_status, fmt, ap);
         |         ^~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: In function 'resctrl_group_rmid_show':
>> arch/arm64/kernel/mpam/mpam_resctrl.c:1741:19: warning: variable 'times' set but not used [-Wunused-but-set-variable]
    1741 |         u32 flag, times;
         |                   ^~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: In function 'mpam_resctrl_update_component_cfg':
   arch/arm64/kernel/mpam/mpam_resctrl.c:2083:25: warning: implicit conversion from 'enum resctrl_ctrl_type' to 'enum rdt_event_id' [-Wenum-conversion]
    2083 |                         type, slave_mpam_cfg);
         |                         ^~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:570: warning: Function parameter or member 'cols' not described in 'rmid_transform'


vim +/times +1741 arch/arm64/kernel/mpam/mpam_resctrl.c

  1735	
  1736	static int resctrl_group_rmid_show(struct kernfs_open_file *of,
  1737				       struct seq_file *s, void *v)
  1738	{
  1739		int ret = 0;
  1740		struct rdtgroup *rdtgrp;
> 1741		u32 flag, times;
  1742	
  1743		hw_alloc_times_validate(times, flag);
  1744	
  1745		rdtgrp = resctrl_group_kn_lock_live(of->kn);
  1746		if (rdtgrp) {
  1747			if (flag)
  1748				seq_printf(s, "%u-%u\n", rdtgrp->mon.rmid,
  1749					rdtgrp->mon.rmid + 1);
  1750			else
  1751				seq_printf(s, "%u\n", rdtgrp->mon.rmid);
  1752		} else
  1753			ret = -ENOENT;
  1754		resctrl_group_kn_unlock(of->kn);
  1755	
  1756		return ret;
  1757	}
  1758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
