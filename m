Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090092376FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 22:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752792226; cv=none; b=adOPRFoqMSEy+lk8TAeiK6S53O3PtBae7kwTDDLl8rTFLJnJ52ejxYUTcjF5A0/KzwLx/edQfx7nNI+dlVd40E26C4r6EAPKt42UTZReDojjK2gNeDjWf1PaC8MgnTSZpbW30TdrZ6HAA+bHIk9d/wDW8RYK42jQ3pD6wbPBe1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752792226; c=relaxed/simple;
	bh=5ioziW46RWKQgz+I412mRaPRzSs5PXmg9IfJld32ItM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGi5vbEQy2amtF1KWtPLiUaxjI1l8NEOUZYgPNjld2g5gmvEEIiLgspvvLcPdLjIPykU1X2RlJlpxzVTsvT6LcW+Mizz9grK241rongPmqPPTfsG0kuQrtpgdQ2qp7GHeVO3qP6W2Gw3bKHY5nBifGUba70MR3zhVhJqOhGbSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URYze4N4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URYze4N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752792224; x=1784328224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ioziW46RWKQgz+I412mRaPRzSs5PXmg9IfJld32ItM=;
  b=URYze4N4bCVMYw1ky8lmxNVLCHfFFkUuojSWLMRMc5hyPnvuVGhgrg+N
   +/xJlJ8Iiv5Mq8hPa0o+9PYSZAHsIfgHAshbJbSc7ZJAXn13F1tmiMKEU
   +zKpSbSsn7eit2vuh2SimrzrggA5n4OijJlw7HcTg+xh6bTtDLaKtyx1S
   FcaItwxagGZ3nGNsIqFbp8A7p86NNrbedu/KzMJkfrOm9myHlqCj2tlre
   C6iAAhAaP1sK/49jOY9y5Q++lv+yzSCpm9ZW3mRk1Au2Kg8TXolXt1ms2
   vKNgBypWPv/RhvHAqgGwBbneNkLOGMMsUP000pjPJ5GyFfzmDQKkr7QYx
   A==;
X-CSE-ConnectionGUID: eFBjJ3mMTt2d5lP/NhccEg==
X-CSE-MsgGUID: yjJ6w47OSrGcj3t32+BkwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66431499"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="66431499"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 15:43:43 -0700
X-CSE-ConnectionGUID: IPGOJHiASnSbEgxfNo7oyw==
X-CSE-MsgGUID: i60Bd1BzQ6+ole1V4gbY+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="188860904"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jul 2025 15:43:41 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucXKE-000E4b-2y;
	Thu, 17 Jul 2025 22:43:38 +0000
Date: Fri, 18 Jul 2025 06:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dominik Kaszewski <dominik.kaszewski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Ivan Lipski <ivan.lipski@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>, linux-doc@vger.kernel.org
Subject: [agd5f:amd-staging-drm-next 2314/2370]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:380: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202507180659.A4dgugSk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   b78bd8003071f2bcd1a9d2404f274ff0b52a4a6a
commit: c9130176a41e56044df495a72f7eb2027824034a [2314/2370] drm/amd/display: Workaround for stuck I2C arbitrage
config: arc-randconfig-002-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180659.A4dgugSk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180659.A4dgugSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180659.A4dgugSk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:380: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * If we boot without an HDMI display, the I2C engine does not get initialized


vim +380 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c

   378	
   379	/**
 > 380	 * If we boot without an HDMI display, the I2C engine does not get initialized
   381	 * correctly. One of its symptoms is that SW_USE_I2C does not get cleared after
   382	 * acquire, so that after setting SW_DONE_USING_I2C on release, the engine gets
   383	 * immediately reacquired by SW, preventing DMUB from using it.
   384	 */
   385	static void cntl_stuck_hw_workaround(struct dce_i2c_hw *dce_i2c_hw)
   386	{
   387		uint32_t arbitrate = 0;
   388	
   389		REG_GET(DC_I2C_ARBITRATION, DC_I2C_REG_RW_CNTL_STATUS, &arbitrate);
   390		if (arbitrate != DC_I2C_STATUS__DC_I2C_STATUS_USED_BY_SW)
   391			return;
   392	
   393		// Still acquired after release, release again as a workaround
   394		REG_UPDATE(DC_I2C_ARBITRATION, DC_I2C_SW_DONE_USING_I2C_REG, true);
   395		REG_GET(DC_I2C_ARBITRATION, DC_I2C_REG_RW_CNTL_STATUS, &arbitrate);
   396		ASSERT(arbitrate != DC_I2C_STATUS__DC_I2C_STATUS_USED_BY_SW);
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
