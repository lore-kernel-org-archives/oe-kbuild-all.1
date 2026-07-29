Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3962469845
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785344138; cv=none; b=K61oK3vXh9/YXU0PLPHJcc8IVx1iT2jSIcQ/jLCuGWJkF5PyS6l2q+QBqpItT6P4vK9p3jY6bCg1FxAAmJzQvf/sydB379QKTSNCPJ7RB6r27z6jpsSiqpPyW0aeqlMxd7dAHal1nb+ylTbMoGrXVtb+XRfUAb3IkdEtDyJeJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785344138; c=relaxed/simple;
	bh=4vDrJW5J5+Sh0DdCsNIFx4c5MxN7iivgHcfR0fcaU3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TbyafT98Ikfs/bh8vIAfd3U4D0eUjuAfTCyJJj1Pd15CF31uvfOIBFoH70rDS289hMnqXAij6+7q3s/r5S8d8Do+WQS1+pbPQnJVEZhFZml91u28VdP/lP1orOumf60aRGZiKpMx49fEKyhrP38KwcbWcTF45fBoTCkdzLI0RU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXrxBj1L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXrxBj1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785344136; x=1816880136;
  h=date:from:to:cc:subject:message-id;
  bh=4vDrJW5J5+Sh0DdCsNIFx4c5MxN7iivgHcfR0fcaU3U=;
  b=hXrxBj1LKlTrzzmSR6DRklsjVAOQ9fMUc8hDOx3abcF+Z8cBzNY3NAvG
   fF4bp9mbXUxwM7qtPPmHafIcbygmolVrWQpGuajvQ7VoJL6BP1qYUePBh
   JswxnDcsuPuzTcZAz1K2o72kVedMvkkHBu5kt15/2gWzaUJPf3ScccCV5
   nPSFRqHe4nDYBKgtjrNIJafHrBbObMxfYKGWjPHjGGi3RNvpgRc5URV5D
   FRcM1WAdQo7RIZhArDs5sjGit8UaQ8GZ3d5dBRGZBLMKXe75w66t2HHv8
   7FhSThmi4O22JbqDGkjm9IBOlFSoEGLh2bQPON3rHW2brmboTL1U40yjT
   Q==;
X-CSE-ConnectionGUID: a+Vh0O/cTMOI7It2TLsvOQ==
X-CSE-MsgGUID: SfB6judRTTSMDFkXXfVlDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85720512"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85720512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 09:55:36 -0700
X-CSE-ConnectionGUID: RAN+s4XfQ9iGS8uk1o13dw==
X-CSE-MsgGUID: 7n8jX8bWRsuTdisRZ3DFUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="284622699"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2026 09:55:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp7Z4-00000000fXf-3Nv6;
	Wed, 29 Jul 2026 16:55:30 +0000
Date: Thu, 30 Jul 2026 00:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [masneyb:clk-misc-round-two-for-v7.3 45/45]
 drivers/pmdomain/core.c:3554:34: warning: 'idle_state_match' defined but not
 used
Message-ID: <202607300027.9V0a2117-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux clk-misc-round-two-for-v7.3
head:   e2eec03ed313a8180ebe4eb9e32a6b8429f804a5
commit: e2eec03ed313a8180ebe4eb9e32a6b8429f804a5 [45/45] clk: mediatek: Add mt8173-mfgtop driver
config: x86_64-buildonly-randconfig-004-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300027.9V0a2117-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300027.9V0a2117-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300027.9V0a2117-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:3554:34: warning: 'idle_state_match' defined but not used [-Wunused-const-variable=]
    3554 | static const struct of_device_id idle_state_match[] = {
         |                                  ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +/idle_state_match +3554 drivers/pmdomain/core.c

5d6be70add65e3 drivers/base/power/domain.c Ulf Hansson 2018-06-29  3553  
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14 @3554  static const struct of_device_id idle_state_match[] = {
598da548ef7892 drivers/base/power/domain.c Lina Iyer   2016-11-03  3555  	{ .compatible = "domain-idle-state", },
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  3556  	{ }
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  3557  };
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  3558  

:::::: The code at line 3554 was first introduced by commit
:::::: 30f604283e05d34cb10108c7ba017e5f4fc9d62c PM / Domains: Allow domain power states to be read from DT

:::::: TO: Lina Iyer <lina.iyer@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
