Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C6F22081
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733041068; cv=none; b=tmvVJT5v4ZSXJeWdOwGR23fequBTCPBQoXO6s10gAP/UkZSCtXbQcT4Wg5NONdvXfeE1Wmpx3WpmiZBKFHvdIGYq3opDlJMQ2mnmbK8F9LKkKtY0elLq1hnCXELHafXGgpL4V+E2xMDVelO7D48nLuYJCh2Sj91RbJOHX+3QXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733041068; c=relaxed/simple;
	bh=vhYugjZDadHne+HQ/tASuhw4lTeIMf004B/uB0pJRK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgIgbupN9SyucCc2KvHncxL9P7VPKNz8eDlTbSdnkKZWSXrWQYMfZlXRfg7xEW916+EeJxlEEk/xZTZW5Oius/WvV16O+CmuraULEWSI1wCG03raUglnmYsz4n3CEPq2oIxhOJJOdTlZs4qw1TByW9i1PSH1uw1tyXThLtP42Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7ZphqOq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7ZphqOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733041066; x=1764577066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vhYugjZDadHne+HQ/tASuhw4lTeIMf004B/uB0pJRK4=;
  b=I7ZphqOqoahFxEy6vKF9UOlSQeeqLRKVw2rNl87ndZWKWHA6SI3fShzX
   9MbUqbBR30nkGUez3dGLEBGNqq1ZKi1tcKWes2jVO4OS0nJtEoMEcPQpF
   K8r4wjNOshdn6ZoC7uWjTz2Ut7zg+IS/n0mOIMwtXOwtvjOb7uVQ5/IXv
   Hypj9XyRmZVSu+K9/Bz/OEmL5RCwQUvgCEJYuUsvOxeJ/NuYYBed/0CNB
   HVxvCh8JxnqQxnqYk9Ajs6IxPxR7jNpmyc7LmP/Bg7rU+yz1bvsiHBuHl
   OfNmJqeibQv4yPee+xkzyILOvpFDNebINBZ5iUrRmjJUd3Vpuf8E1kMyk
   g==;
X-CSE-ConnectionGUID: bO6Em3dnSfuJnCp61UcrtQ==
X-CSE-MsgGUID: I6z6vQG4Sgi5nQKi6hYSMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="50622086"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="50622086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 00:17:46 -0800
X-CSE-ConnectionGUID: 6CBYvDXMTTyxoHucMXs5Jw==
X-CSE-MsgGUID: A5MJldUjQlCJh0ClmFK1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92978470"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2024 00:17:44 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHf8r-0001NR-2O;
	Sun, 01 Dec 2024 08:17:26 +0000
Date: Sun, 1 Dec 2024 16:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:484:77: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202412011624.BbzK9R6O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 2991f29868ddf9a3dd2dd132323ae2a4558b7bb0 [1474/1474] drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011624.BbzK9R6O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011624.BbzK9R6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011624.BbzK9R6O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:484:77: sparse: sparse: Using plain integer as NULL pointer

vim +484 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   457	
   458	enum dmub_status dmub_srv_calc_mem_info(struct dmub_srv *dmub,
   459					       const struct dmub_srv_memory_params *params,
   460					       struct dmub_srv_fb_info *out)
   461	{
   462		uint8_t *cpu_base;
   463		uint64_t gpu_base;
   464		uint32_t i;
   465	
   466		if (!dmub->sw_init)
   467			return DMUB_STATUS_INVALID;
   468	
   469		memset(out, 0, sizeof(*out));
   470	
   471		if (params->region_info->num_regions != DMUB_NUM_WINDOWS)
   472			return DMUB_STATUS_INVALID;
   473	
   474		cpu_base = (uint8_t *)params->cpu_fb_addr;
   475		gpu_base = params->gpu_fb_addr;
   476	
   477		for (i = 0; i < DMUB_NUM_WINDOWS; ++i) {
   478			const struct dmub_region *reg =
   479				&params->region_info->regions[i];
   480	
   481			out->fb[i].cpu_addr = cpu_base + reg->base;
   482			out->fb[i].gpu_addr = gpu_base + reg->base;
   483	
 > 484			if (i == DMUB_WINDOW_4_MAILBOX && params->cpu_inbox_addr != 0) {
   485				out->fb[i].cpu_addr = (uint8_t *)params->cpu_inbox_addr + reg->base;
   486				out->fb[i].gpu_addr = params->gpu_inbox_addr + reg->base;
   487			}
   488	
   489			out->fb[i].size = reg->top - reg->base;
   490		}
   491	
   492		out->num_fb = DMUB_NUM_WINDOWS;
   493	
   494		return DMUB_STATUS_OK;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
