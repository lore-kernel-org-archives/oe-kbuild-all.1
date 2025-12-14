Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34741182D2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 02:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765677702; cv=none; b=QpnsJJWY6vhnqmyMBgga5R055JCwIo5ZNfaHWlRc3/uiryUR+LoBigXbJom/GDcL3CuaM+mCp/lr+ZFE1pXVjUOyOjcxaxw2GAyZI8fNWXhIWjrvBiowJp0ridqrzDhOAsNfSy4r1s9lh76BjX75dgZqwe1tD5gCWJ4I78zkbbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765677702; c=relaxed/simple;
	bh=RmBGISsk2PX50Mjz10v3DBlkVtQlsuh1LboeSz6NRxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8Y56gTwuoKOl+59wFJGmESOX7YQHPmpNWRL5Ttww722//EGOmer4uktDikgA8U7ThBTMjW2iEW6WPl07LL9zxL/Y53Fk1QPSikQTCBVkmlQNW0UcApOA81P45vloyWUKunMwG+DJB3zLe02attolSo5XvYN/CN1S1kQ02d8kts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZGLt9pA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZGLt9pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765677700; x=1797213700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmBGISsk2PX50Mjz10v3DBlkVtQlsuh1LboeSz6NRxE=;
  b=MZGLt9pA9SGC+Pw47NhWrl3itqlqAJJQh8vOI5BHZc1vVyr7WIinOSFp
   OCopXxwQAqQwYQf0WEPNd2h4UX7Qn4XMZMBU0kLjgHbc/nUGGf0YxG7J9
   YFMt09UwQJ63WJBfuF1IsO74m8rWCUZPJk/xS4QcjGN7U6hEL/+OwL0rw
   WP6SujLCYt47JkBb2+T4neVygtlvktk4jalg0CWxc9f2MIK9TiNqG/wtA
   Ui8xQw/1B2nbJ1jQ3qsgwq+a0IYlBVhNg6apROq2CDZY8nrCbpgm4Myum
   2lW+Se0gkDSujjVDNXRLszbLS+7Nwi93s8JUIqdC2Nq4Wi8HxI3CWhl6c
   g==;
X-CSE-ConnectionGUID: UQ+fCeoTSEqcwG1f7VS5jQ==
X-CSE-MsgGUID: l7RZpDxmSnqxnjKr1qePOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71256943"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71256943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:01:39 -0800
X-CSE-ConnectionGUID: o6a7TVBsQhO6Q083IqvFYg==
X-CSE-MsgGUID: RUd25pihQYavxWfD+DbwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201610377"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 18:01:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbQW-000000008SR-2dRY;
	Sun, 14 Dec 2025 02:01:36 +0000
Date: Sun, 14 Dec 2025 10:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:416:77: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202512141013.VJGKROW3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: 595b051c83a1374b1d53ab44de1c27ac60b95979 [1/1] drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
config: i386-randconfig-061-20251212 (https://download.01.org/0day-ci/archive/20251214/202512141013.VJGKROW3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141013.VJGKROW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141013.VJGKROW3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:416:77: sparse: sparse: Using plain integer as NULL pointer

vim +416 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   389	
   390	enum dmub_status dmub_srv_calc_mem_info(struct dmub_srv *dmub,
   391					       const struct dmub_srv_memory_params *params,
   392					       struct dmub_srv_fb_info *out)
   393	{
   394		uint8_t *cpu_base;
   395		uint64_t gpu_base;
   396		uint32_t i;
   397	
   398		if (!dmub->sw_init)
   399			return DMUB_STATUS_INVALID;
   400	
   401		memset(out, 0, sizeof(*out));
   402	
   403		if (params->region_info->num_regions != DMUB_NUM_WINDOWS)
   404			return DMUB_STATUS_INVALID;
   405	
   406		cpu_base = (uint8_t *)params->cpu_fb_addr;
   407		gpu_base = params->gpu_fb_addr;
   408	
   409		for (i = 0; i < DMUB_NUM_WINDOWS; ++i) {
   410			const struct dmub_region *reg =
   411				&params->region_info->regions[i];
   412	
   413			out->fb[i].cpu_addr = cpu_base + reg->base;
   414			out->fb[i].gpu_addr = gpu_base + reg->base;
   415	
 > 416			if (i == DMUB_WINDOW_4_MAILBOX && params->cpu_inbox_addr != 0) {
   417				out->fb[i].cpu_addr = (uint8_t *)params->cpu_inbox_addr + reg->base;
   418				out->fb[i].gpu_addr = params->gpu_inbox_addr + reg->base;
   419			}
   420	
   421			out->fb[i].size = reg->top - reg->base;
   422		}
   423	
   424		out->num_fb = DMUB_NUM_WINDOWS;
   425	
   426		return DMUB_STATUS_OK;
   427	}
   428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
