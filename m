Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4251990C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731936336; cv=none; b=qB9Oikmrm+ZtvdQSVZ7JGxfG7MA8F5Q1pa+uhQ7KspUHWMPuICB1exIRcKsDoGkC2QpjI8YzLXY8c9WYFUkuiyw2kHC5Ll05yzqVPxL/tRiCzCncoQ7sedTDclfqEoAnOK2tQ2ehv5Uzx5jIsQgkLWZf4JE7/s2Vw4eKiheaq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731936336; c=relaxed/simple;
	bh=xSYz/BXULaJ9leIAeW8LboIp6qTFDLHBtCKAGtIYnKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MW7rjeSjTpsitCpgSS8p+J2Qoy1apQw0NAxBVIwm4iLOTmKcxmepiyi3jaZnbYeme+3CipX55MxVLL3juRYVKZxcpSD3X2rPuR1TuRXa8OEqZx7FS9BUGSjTGz00OtUSda2qFy6zhTM2QLExx0JvL7N6QwgxOiHJKLO5jXx+uTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb045wNr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb045wNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731936335; x=1763472335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSYz/BXULaJ9leIAeW8LboIp6qTFDLHBtCKAGtIYnKw=;
  b=Yb045wNrETpVyTWTr7EbKan7fKAPmBYe1Jf+h+tQ/DwWs7/Yt/p0xQwW
   35bLafVxSXNrCXUT6PVvInAMPr5JL0FcKKqHt0nkT6LPfiZ2gsHEm5rrt
   jjlMpCWZ+U0W0ab4ODFDWnK8C5J3ZPAtlT0kUsQnrI4tCY/+/MClzlfDH
   UBA1jkEyukLPwC05AnGu39Y87p2dUjU4GWQGRbBpZVpjbPojrSdpPMiI9
   /inn6FXrQJ3qM9wouUheWPbH9C5bMQ/9+6PgPgT+7ctma+lOUX5rEDB+0
   dnVxW7Xo499PZS1FOJB6iJ+p++jaIy1zvIrXR3fuCAFF5EgChdO0FCx4i
   Q==;
X-CSE-ConnectionGUID: JuI2V3ikTUWHT9ef/BSzdA==
X-CSE-MsgGUID: jg6OsSrUSISIntdbguqhuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35665254"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="35665254"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 05:25:34 -0800
X-CSE-ConnectionGUID: xCbbr6SRSKClPyyn/PVgAA==
X-CSE-MsgGUID: Jhi5PknIQzKEX34z5L2NBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94037314"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2024 05:25:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD1kw-0002RJ-1M;
	Mon, 18 Nov 2024 13:25:30 +0000
Date: Mon, 18 Nov 2024 21:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:484:77: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202411182104.9oMPXZuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 2991f29868ddf9a3dd2dd132323ae2a4558b7bb0 [1474/1474] drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182104.9oMPXZuE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182104.9oMPXZuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182104.9oMPXZuE-lkp@intel.com/

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
