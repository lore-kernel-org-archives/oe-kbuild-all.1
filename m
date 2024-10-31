Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960713A865
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400713; cv=none; b=pF4RW9fK5Fzae+dq9RJuX7Blf7zLs7kPPIVirLlzNHrhMjJ+m76Syivxtd8foNJ2ybUupGDdeHPsWV9UEqQp6Bag79jsHeWFxLMUS/kdYzQj2GU5eI5cwhLGZvr911jFNX1fRD+IRejyhTrT86ToKjA5oXreMQyjT2vxKbVrr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400713; c=relaxed/simple;
	bh=597Mj3/6yQpx6A3QKy7pcbEC5TeYOiizAg1QLa6bN2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVXnFofKwUSxZ5dLiJqnZF7ZkTFzyCKhypO/RcFnHpvky9rsI6tMbDluU/RU17xKiupkouTBMXWZHW80UtSZu3ZxHiNv8UeAsGqGfNj6MVz5dWrY921KV+G1W13odBzc9U5kZqGgxRaoMLqu2VJIrWIgYeVF5LP3aI4iLnzLM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVpnub/R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVpnub/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730400711; x=1761936711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=597Mj3/6yQpx6A3QKy7pcbEC5TeYOiizAg1QLa6bN2s=;
  b=jVpnub/RznY9yEnilaN8fPKcgn7wDm+b1rPsgkl20ASL3TjFUgyIsAV6
   hFVQ5tg1/08taYW/R4drB8HQQ3b7xGpbbuvPH177QungexvbWFHYVXVc8
   iWAq854kuo7Oj11iX78wR/sfScxQgP6P6LXOCmFBP6JvkqskVlnTQs8pv
   /wFWNOvO0WzwVezm3ipeID1stm3rHzvgOzXkonjAWjg6+niI9h/eEVV1g
   q8j5AApH6xU5xtBPAc6smUBlR/TK5trfjjcIQarTpjhM5uCs5zyqzXCy5
   GcyWUUv9SFPsyc3lVa4riXo4g37ryxu6RZnnzVjjWfAS22z7xRD7KA59Z
   w==;
X-CSE-ConnectionGUID: VNXPjzQ+S269uxGhA5XLOw==
X-CSE-MsgGUID: 7tYhaoldTAu1p0xXc61BaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="55558176"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="55558176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:51:46 -0700
X-CSE-ConnectionGUID: 2Z/9Mp68Qf+N4mYmsCG5Mg==
X-CSE-MsgGUID: Jr8p6julRbaY3umO8XtJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82392904"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2024 11:51:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6aGi-000gck-1R;
	Thu, 31 Oct 2024 18:51:40 +0000
Date: Fri, 1 Nov 2024 02:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15253/23924]
 arch/arm64/kernel/mpam/mpam_resctrl.c:358:1: warning: conflicting types for
 'mpam_get_raw_resctrl_resource' due to enum/integer mismatch; have 'struct
 raw_resctrl_resource *(enum resctrl_resource_level)'
Message-ID: <202411010258.ysot0OR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e73db5f1f4d00d788085541fcfcb33402ee9221c
commit: a453ee059c9d7c7372b6f413ef152b9ea8ee800e [15253/23924] arm64/mpam: Init resctrl resources' info from resctrl_res selected
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010258.ysot0OR8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010258.ysot0OR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010258.ysot0OR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mpam/mpam_resctrl.c:358:1: warning: conflicting types for 'mpam_get_raw_resctrl_resource' due to enum/integer mismatch; have 'struct raw_resctrl_resource *(enum resctrl_resource_level)' [-Wenum-int-mismatch]
     358 | mpam_get_raw_resctrl_resource(enum resctrl_resource_level level)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/mpam/mpam_resctrl.c:47:
   arch/arm64/kernel/mpam/mpam_internal.h:127:1: note: previous declaration of 'mpam_get_raw_resctrl_resource' with type 'struct raw_resctrl_resource *(u32)' {aka 'struct raw_resctrl_resource *(unsigned int)'}
     127 | mpam_get_raw_resctrl_resource(u32 level);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:784:5: warning: no previous prototype for 'cpus_ctrl_write' [-Wmissing-prototypes]
     784 | int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:872:5: warning: no previous prototype for 'cpus_mon_write' [-Wmissing-prototypes]
     872 | int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: In function 'rdt_last_cmd_printf':
   arch/arm64/kernel/mpam/mpam_resctrl.c:1016:9: warning: function 'rdt_last_cmd_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1016 |         seq_buf_vprintf(&last_cmd_status, fmt, ap);
         |         ^~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: At top level:
   arch/arm64/kernel/mpam/mpam_resctrl.c:1089:5: warning: no previous prototype for 'resctrl_ctrlmon_enable' [-Wmissing-prototypes]
    1089 | int resctrl_ctrlmon_enable(struct kernfs_node *parent_kn,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:1117:6: warning: no previous prototype for 'resctrl_ctrlmon_disable' [-Wmissing-prototypes]
    1117 | void resctrl_ctrlmon_disable(struct kernfs_node *kn_mondata,
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +358 arch/arm64/kernel/mpam/mpam_resctrl.c

   356	
   357	struct raw_resctrl_resource *
 > 358	mpam_get_raw_resctrl_resource(enum resctrl_resource_level level)
   359	{
   360		if (level >= RDT_NUM_RESOURCES)
   361			return NULL;
   362	
   363		return &raw_resctrl_resources_all[level];
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
