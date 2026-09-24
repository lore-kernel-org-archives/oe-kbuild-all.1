Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C993385B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 01:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213840; cv=none; b=pqYXW46s5Q3yAcHlVJfdBS5MnHKgfLSWAbd0hB+zqQme+CPn5PNTgCgxcexU9JwUDyaqJxwqW2OX3n6c52T+mIO2xSbZo5jynDz3U9Zre0d41L9MKdJ4tLaetf5w7aGIUmsjAfuMFCHkuqqpEGz5V1dg5AcnOasE5J2AOCBeH8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213840; c=relaxed/simple;
	bh=60PwxtL/DW7RSC8deVobqczq3K1vCL5neIANDhnQViM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l/AcKrtV85FSwpVdzmzNlGQSGVI9I2mTLL+hQI5uwtg6Fett5SpG9tG8W5Hg4nydDqShn361pylZ4mvLBvNxNpRJxyA6LQHQHSvlwTcK6aLuCoUmMickupdNbES33nsTJOslBj8VukynjgmEd77XsZCGU6G37utplT0Nt7owMtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BX+Kxc6r; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BX+Kxc6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790213838; x=1821749838;
  h=date:from:to:cc:subject:message-id;
  bh=60PwxtL/DW7RSC8deVobqczq3K1vCL5neIANDhnQViM=;
  b=BX+Kxc6rtLksS6UK3SNLtV5mFmhNW3AKz2zKp77VT2oVw5er+jXGbI8s
   vQouGWfqXbrFel3NKbw3sm0V4iSVOavOZfyafHPfgS182WapekNB8W+i5
   42tEsRYZ3tZjfv+lXsRSNPPOXmXDlEeZRjhilmGoFyS8aNxJgVbUCPtkE
   0zNb70N8pR/t3lRNt9Fpc6P1T/SAs+6biSa4XPO66LYyYueSo+q6vKmj5
   JG+3udOtf5Etj37tPT1zLWpGGm0efhwq9mLd6olYAVwjV5h2Tkk4tgLmV
   FfaZphn5f5tI1sANrSSJrrtpWhr3HA0XvMJ64AHOgminkcj97gcV/Uaof
   A==;
X-CSE-ConnectionGUID: 1t0UZ/ehRa2aHXk9TH9x0Q==
X-CSE-MsgGUID: sw0njgf/Rr+dNMDq9VENEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1456736"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1456736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:37:17 -0700
X-CSE-ConnectionGUID: ezjnmw21TFyPh3ek9a4PGw==
X-CSE-MsgGUID: fzuk5cB0Tk66NFTP/pLgow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273047243"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 18:37:14 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9YOe-00000000I4o-2ORV;
	Thu, 24 Sep 2026 01:37:12 +0000
Date: Thu, 24 Sep 2026 09:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gang Ba <Gang.Ba@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Jay Cornwall <jay.cornwall@amd.com>
Subject: [agd5f:drm-next 102/114]
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:350:30: sparse: sparse: symbol
 'fault_cleaner_init_regs_aldebaran' was not declared. Should it be static?
Message-ID: <202609240916.py3d9JMN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   cf48bd0a46279f4607956cb17c71bda96ee802e3
commit: a6332b84718710f22b7392d5773675c5942faa7d [102/114] drm/amdkfd: Fix TCP XNACK scoreboard reset race
config: i386-randconfig-1300-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240916.py3d9JMN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240916.py3d9JMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240916.py3d9JMN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:191:30: sparse: sparse: symbol 'vgpr_init_regs_aldebaran' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:245:30: sparse: sparse: symbol 'sgpr112_init_regs_aldebaran' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:287:30: sparse: sparse: symbol 'sgpr96_init_regs_aldebaran' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:328:30: sparse: sparse: symbol 'sgpr64_init_regs_aldebaran' was not declared. Should it be static?
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:350:30: sparse: sparse: symbol 'fault_cleaner_init_regs_aldebaran' was not declared. Should it be static?
   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:2001:33: sparse: sparse: symbol 'gfx_v9_4_2_ras_ops' was not declared. Should it be static?

vim +/fault_cleaner_init_regs_aldebaran +350 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c

   349	
 > 350	const struct soc15_reg_entry fault_cleaner_init_regs_aldebaran[] = {
   351		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_RESOURCE_LIMITS), 0x0000000 },
   352		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_X), 0x40 },
   353		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Y), 1 },
   354		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Z), 1 },
   355		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0xaf0000 },
   356		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0xc8 },
   357		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0xea4fac },
   358		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0xffffffff },
   359		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0xffffffff },
   360		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE2), 0xffffffff },
   361		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE3), 0xffffffff },
   362		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE4), 0xffffffff },
   363		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE5), 0xffffffff },
   364		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE6), 0xffffffff },
   365		{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xffffffff },
   366	};
   367	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
