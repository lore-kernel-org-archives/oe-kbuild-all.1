Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7230F803
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948436; cv=none; b=gGnh3QP96vDC9EciQCvJ8MAgJZmkKVSIxO+1XB1li30wU6bMAd5qJiNnWe2R6FjoWJCMXGkOgGN3xIkGQWKDyIEDpd4hLTv0E9dL/ffvM7FdPhEtFQbX6YDWDY9SDq/+gGfac8GZFXmZH4IVC+otC9I8HsQW71yfRbEnyVWckp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948436; c=relaxed/simple;
	bh=/6ff612D84STi8lDuj0QG3KDa6zzU9ONYP5YFhmWf3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RuJorzFAfY9i8d8fXp7NsoPMPfEnI0XBDB4q4LI+O9r2M3zxo4nAUTCP3sUm8rfd0kAiy9+QHO4MJFvcTEHFbSn80AZCeI3OYlsvmxkqQ+QVv1h7q57QdzSiM6cxN3BE+diacJWgv78bhkEAapcAwz5j8qaALEB1K8XM5VRZ4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgbVlRpL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgbVlRpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791948435; x=1823484435;
  h=date:from:to:cc:subject:message-id;
  bh=/6ff612D84STi8lDuj0QG3KDa6zzU9ONYP5YFhmWf3g=;
  b=JgbVlRpLo+kAtZB5TCo/4dLKt3Cdom9QwvsV2CwLKrRIoZkN11GsA5fz
   jTIqIYA41nl2eyuYTlT+FjVggfhfsvFK4hh+x+I2xbYTYs5TLUXHv/PPH
   6hmQNAkzhf5JeWto0yHEFpyUf6+UzB14lP+DCb+UIbf2n3uzD0truWdFP
   MmVVL5ep4mTPeqyDRDA1VUiGYw+Il7PWY9MWKWGSPw7VI5MO/jKFxZP3H
   ZdeM47WbrU3Ak2NWSrlgHMRLYkRzSVXRhm84UA1TOo9moPZvQp2pCpYW5
   M79sGbBPEwDaQdagAGe0V/TTDfNxfvwc3xWNBZGm5V78NaGT1sVLcCo1I
   w==;
X-CSE-ConnectionGUID: lbXOUTP7TSCciEKHxhLihA==
X-CSE-MsgGUID: mIzF5YQHROKeXq/lbVXZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="571916"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="571916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:27:14 -0700
X-CSE-ConnectionGUID: SJwz9VTWR66cbPGrTv2LNQ==
X-CSE-MsgGUID: sZbiVYUxS+aTgqion9gPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1531731"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2026 20:27:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGpe1-00000000Apz-2GGV;
	Wed, 14 Oct 2026 03:27:09 +0000
Date: Wed, 14 Oct 2026 05:26:40 +0200
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/eliza-integration-display-on-early-hwe
 17/29] drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c:91:13: warning:
 'hdmi_eliza_dump_regs' defined but not used
Message-ID: <202610140525.Bde8BBc9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux wip/eliza-integration-display-on-early-hwe
head:   bc8619ef46818e58ca3d967ab1c52ad66162306a
commit: e321b0cac731e5db0eea3e32d30f502eced59156 [17/29] WIP/DEBUG: hdmi
config: sparc-randconfig-r2306-20261014 (https://download.01.org/0day-ci/archive/20261014/202610140525.Bde8BBc9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140525.Bde8BBc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140525.Bde8BBc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c:91:13: warning: 'hdmi_eliza_dump_regs' defined but not used [-Wunused-function]
      91 | static void hdmi_eliza_dump_regs(struct hdmi_phy *phy)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/hdmi_eliza_dump_regs +91 drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c

    90	
  > 91	static void hdmi_eliza_dump_regs(struct hdmi_phy *phy)
    92	{
    93		int i;
    94	
    95		for (i = 0; i <= REG_HDMI_ELIZA_PHY_RX2_CONFIG_15; i+=4) {
    96			pr_err("AAA HDMI phy 0x%x=0x%x\n", i,
    97			       hdmi_phy_read(phy, i));
    98		}
    99	}
   100	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
