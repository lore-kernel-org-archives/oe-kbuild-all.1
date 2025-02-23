Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937B2036FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740305171; cv=none; b=QtW9iL8H9ijd/Wif+3x9Hwr4Ik+kdqhSQnmaNBZyWlUdzI/hWsJt+3cA/cFxDbSknBrqiVLzpVt9c++V+I7OfuNzKFsF1jvy8AD/wtLlCoM6Hvx/3XtRTlaco4Z3HAEEqb4nVwVRfInnw3GHShMbi1BEAuEO5a/HQQAdoWU6cZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740305171; c=relaxed/simple;
	bh=mIkg58bP3ZttohB6szAjmVd8vHLH49ckFoTYnDbM1gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIt4lkaeXcQL4J78orSkGhCEFguBU0SmLy3Qre1aeOTKm+OzHP+ccB9/xt+XlIliaxpCAx4G0JiylBPwYP+uMWJV94UQtUPfs8atSblLlSjTbMXKdPBQSN+8SozdDE/DqlxvUZ1YS05TKBL64n88rTabl6ClRYEPekphFkDYG64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBUwfBCn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBUwfBCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740305166; x=1771841166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mIkg58bP3ZttohB6szAjmVd8vHLH49ckFoTYnDbM1gE=;
  b=JBUwfBCn10lAsMZiITlOTYkAzlNOkvZjV4m5hRhff43ForqBPMZatRZ0
   ourv7q68rO4oznUhgvHp45w52fHQcCe4ay6h0yEiUxKHq7PUrUuDGR2Gv
   XlDedgxDwbuqGpNrVxr79J15xCHtCUK1qdcnawkUz+fcBMmPP3clEy87g
   Mju+hu2tdX5MdB90yAGyDipbb5JnNq2dt2jXACgRea+FtbbDYtjcvkwkx
   GIuhAw3PV1t9Yg+65D9lFCo9KPMXgUYA0iUteAlTD+3EoAQG1knGTQKRQ
   lqmtJimaldt7LIWahF2MhAn3hjtv9wYX0HYCTqaivo1mz5Y1WZ8qiteYl
   w==;
X-CSE-ConnectionGUID: KBXuzfUSTj2/DtQFFwwIKA==
X-CSE-MsgGUID: S5HuE1PTTByA/7JtVTHR1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40311229"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40311229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:06:04 -0800
X-CSE-ConnectionGUID: iBVXPPvPQVOgwMAzYF1VRA==
X-CSE-MsgGUID: mq8XCqr9SnC1vE7AdWnEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="139017928"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2025 02:06:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm8s4-0007Fz-1r;
	Sun, 23 Feb 2025 10:06:00 +0000
Date: Sun, 23 Feb 2025 18:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: zynqmp_dp_audio.c:undefined reference to `snd_pcm_hw_constraint_step'
Message-ID: <202502231732.itTkOr6v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27102b38b8ca7ffb1622f27bcb41475d121fb67f
commit: 3ec5c15793051c9fe102ed0674c7925a56205385 drm: xlnx: zynqmp_dpsub: Add DP audio support
date:   9 weeks ago
config: arm64-randconfig-r133-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231732.itTkOr6v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250223/202502231732.itTkOr6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231732.itTkOr6v-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o: in function `zynqmp_dp_startup':
>> zynqmp_dp_audio.c:(.text+0xb8): undefined reference to `snd_pcm_hw_constraint_step'
   aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o: in function `zynqmp_audio_init':
>> zynqmp_dp_audio.c:(.text+0x8c0): undefined reference to `devm_snd_soc_register_component'
>> aarch64-linux-ld: zynqmp_dp_audio.c:(.text+0x920): undefined reference to `devm_snd_dmaengine_pcm_register'
   aarch64-linux-ld: zynqmp_dp_audio.c:(.text+0x978): undefined reference to `devm_snd_dmaengine_pcm_register'
>> aarch64-linux-ld: zynqmp_dp_audio.c:(.text+0xab4): undefined reference to `devm_snd_soc_register_card'
>> aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x308): undefined reference to `snd_soc_info_volsw'
>> aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x310): undefined reference to `snd_soc_get_volsw'
>> aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x318): undefined reference to `snd_soc_put_volsw'
   aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x358): undefined reference to `snd_soc_info_volsw'
   aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x360): undefined reference to `snd_soc_get_volsw'
   aarch64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x368): undefined reference to `snd_soc_put_volsw'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
