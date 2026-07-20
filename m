Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093DA18DB35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510610; cv=none; b=jiwPmtOwY5KuL3zYvfkbZxfy6TGE/j6QRusIjmohePDzadZgOGKF9v3PxMPlRBTlXRpvNdz6l/JuqHgzQuxFZ8nvy7MC9KmfFLUtqYfbk2KgREQtZ6tAxDisuKNbW3ZG/F8STDi3DDmynaGzwGmKVU+0yIfgoZoC9KhIFeEhr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510610; c=relaxed/simple;
	bh=Bd4C+BC6jMDBa+MHhPqyqyQCuSL5PYxyU4KEZkL2yr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GRnTmeRjdNhqxTejmMjQwIo/Lk7zwcMdqXy+sUf6H3TSVgCnOaSjM61ykBSPNM6GefeWSIxMd9bX/H96goPTlFVUpZZfBVGecMecFtAPL5Kygdr26GSKOC2jYkFtPYAjT03ksNjXAGcroEL2Uz3dVZFbRuy1xq9o3x1qnZeWpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wr6mRpdt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wr6mRpdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784510608; x=1816046608;
  h=date:from:to:cc:subject:message-id;
  bh=Bd4C+BC6jMDBa+MHhPqyqyQCuSL5PYxyU4KEZkL2yr0=;
  b=Wr6mRpdt73he+HYHbTthlAQG/SNPa11RWN6spyfKAXCJ1j41hhcfrJ0h
   XIUHl7CGHNPshVRIb/XxBW0NaY16xpntwPU+yGXbVy/h0G8qs+blO8yV4
   5CVHJem3jsBwOoCgdJpmFMeh13ioaM9UD/J/588t1QXDNOhT0o/IbIC5e
   pQq/jBbY2yq5ll/BNhgho8ISnCrc+csbQ8wBCMMc3NZGlArsAnsM3kjDv
   pB1mowyqesB4O3Ca0cJyp0NzxV2Y9/YipI1FAyhKV95Sb6NpjGrD+4BiL
   OPnFhzb7GnnzcQRD0MKbp+pjBeDk2Kc9ZDinME9JiSwy515dtDLnKW4dF
   w==;
X-CSE-ConnectionGUID: jN8Wt0IjT0qbSgxhc+Je/w==
X-CSE-MsgGUID: tCOh9V7lSPK0cMGicJ31EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85037767"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="85037767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 18:23:27 -0700
X-CSE-ConnectionGUID: 4LXxJEiYR5mrwmWvkIGklQ==
X-CSE-MsgGUID: krWZ1ETpS8mrPS4bugh1aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="260882642"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Jul 2026 18:23:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlcj2-00000000VrB-1yaS;
	Mon, 20 Jul 2026 01:23:21 +0000
Date: Mon, 20 Jul 2026 09:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202607200842.H676K6gO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: 91e698058e91dcaef669afae07e2f23fee6bce9a [12/12] ASoC: cs42l43: Add codec force suspend/resume ops
config: x86_64-randconfig-r111-20260716 (https://download.01.org/0day-ci/archive/20260720/202607200842.H676K6gO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200842.H676K6gO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200842.H676K6gO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined twice
   sound/soc/codecs/cs42l43.c:2449:9: sparse:   also defined here

vim +2446 sound/soc/codecs/cs42l43.c

64353af49fecbd Charles Keepax 2024-02-06  2444  
64353af49fecbd Charles Keepax 2024-02-06  2445  static const struct dev_pm_ops cs42l43_codec_pm_ops = {
64353af49fecbd Charles Keepax 2024-02-06 @2446  	SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend, cs42l43_codec_resume)
64353af49fecbd Charles Keepax 2024-02-06  2447  	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend_noirq, cs42l43_codec_resume_noirq)
64353af49fecbd Charles Keepax 2024-02-06  2448  	RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
91e698058e91dc Maciej Strozek 2025-01-09  2449  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
64353af49fecbd Charles Keepax 2024-02-06  2450  };
fc918cbe874eee Charles Keepax 2023-08-04  2451  

:::::: The code at line 2446 was first introduced by commit
:::::: 64353af49fecbdec1de9aadf2369d54fc00f1899 ASoC: cs42l43: Add system suspend ops to disable IRQ

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
