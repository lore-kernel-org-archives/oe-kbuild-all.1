Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC2022B594
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416574; cv=none; b=YFOGO48PKAfDX2j8d8qua10JBPCk4B0b4ycRuD2K0FMaDyMgBjUdOTWc3ptwI0b2G/fDsX9R1kIhiWibhyksJMukbEjjK2XAv8EbdKqiFEqnH0cT+Vk+hl63MJwhZjX0PHsq9t7x2CHt7USLcGIu4IQxEDeM7rlIQk2DsGJkj5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416574; c=relaxed/simple;
	bh=ERPX7EnqwwHf4fsOzVD89lASBPNJkBlQtQPKEI29Kr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqIEbqmtJSwaUSVKyoBwbBuTX6PntnbCAWPwXRNtUAu0H8U3urWNGAOW1d3eBrG4r/8MH+wUxlTKm4a8+udrj8j6c8d1LLcoYVwq+yiJrSjgh7bsGWt9nypaVknBgpSqpkld8G0iZzHhGF1Lgt6N1G4nU3nvVGpOuQYtwF1VfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCWSiurG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCWSiurG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766416571; x=1797952571;
  h=date:from:to:cc:subject:message-id;
  bh=ERPX7EnqwwHf4fsOzVD89lASBPNJkBlQtQPKEI29Kr4=;
  b=aCWSiurGBJKAHNatXx8VuzNy/c5q2J0Pqks8kHUaPBBdzyQgZBt2sis4
   jScrrDoJzi/oJJIejh8HqzrW1wiWVINNsARoajYbvXIJko6acxf1j0z+H
   61hPS4t3NqRPTnma8W2rZ1hvWX7SPHwCdVkdtVZpNiLqbo4dMG1biW/PY
   mHBCQDfFThf22Ws2ZD4+J/rQ7aP37XcivOWApqhTXSKBlitjEfolPNkPb
   TeAI0y+b+MDMVx8G3j75qoRhM4XUZjmMGDpYNXG02lfoGc3SKJ8rJVkhX
   EEdLvYvLgPHc5Ap2ar1byUh8OgP5hjQlqT6mQ+Vksw9p+ln5cQdiOL3Os
   A==;
X-CSE-ConnectionGUID: CgYD6LfNQQC+9fxU2SPgMA==
X-CSE-MsgGUID: jb28FLeyRf+wru4FfBQhfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79388350"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79388350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:16:10 -0800
X-CSE-ConnectionGUID: edMps+tCSn2q1MFW4oOqRQ==
X-CSE-MsgGUID: a/S1ttD4S8KpECw81gQM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200049896"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 07:16:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXhdl-000000000jB-3gdZ;
	Mon, 22 Dec 2025 15:16:05 +0000
Date: Mon, 22 Dec 2025 23:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] mm/memcontrol.c:3147:6:
 warning: no previous prototype for 'hisi_oom_recover'
Message-ID: <202512222346.eorgTDJ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [3541/3541] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251222/202512222346.eorgTDJ9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222346.eorgTDJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222346.eorgTDJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~


vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
