Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B815AF1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716043971; cv=none; b=INY/Jcom3ZjSfE30Hcsgwu/CQbyDt9/t/IhqG17T4XWi+Vg5moEtC1sfPWqtlhGm+AlFmyEz1s6ji7Hnr4E3NnpoQuStdo2WnCvHuOpuPZfKuTY2daStsus27DaSSMW1Y/u7fmxtNwMIrhLAjxLcbwuFqsRsEEb2F0NUd1cnNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716043971; c=relaxed/simple;
	bh=gWNZOYqWhBOb7wOz8oZk0u+Tp1Y+xf3+xx8MeJ6zsr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLJ/nYBeXxrSKkzgl7vwMC8GRjiwwbRGk4sq/BaAph4XAWt3Mjlp6FSSB3k78kfb5x9ic0QfWdAStjhAk5omkh7Z9FjZzcdsv/YakLXA9rpwh8/0VZWpDeevJdQjclxyls62OiWXZq8j9XFIlyWu0rrvubXKA0Xz0roEqkbRILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnLFF7hG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnLFF7hG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716043970; x=1747579970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWNZOYqWhBOb7wOz8oZk0u+Tp1Y+xf3+xx8MeJ6zsr8=;
  b=RnLFF7hGl5EqjCVcMvXkSz/HU5HMzmQihgC6HFzl738tyg5Tn/mMxfhr
   q/yqfGLMisNt8bXsFYt+wLq9na37+HRE0y2eq4+YCdZzj4jjFsHo9xSH2
   eJpUfTH1tVbqIrcTBgZH5b1OnpcZlAjluIpFY29Do+dB/tXqdyX09vTyT
   OdFAGPemZaewIF51wuFwXnff4pzaM8S7WaPIfvQYKVhIFzlpnBZ0KG/0I
   rPL5iXU1QwY7X9RzI/nYWEOhgqS7sfC37kU1z3d9+hbwjyTH4lGSze8Xy
   I+sCLW7vyi4Rpq7iP6DR7/72w75aaH7/Nhb24CQ7MjKztzz6EyyWLX52H
   w==;
X-CSE-ConnectionGUID: 5f+lc/Z9T0WeYsfTij5kag==
X-CSE-MsgGUID: gJ+ZAha9R0m1aP/isQp24g==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12161234"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12161234"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 07:52:49 -0700
X-CSE-ConnectionGUID: WXAaUTrVQ3yS9bHLt/oEGQ==
X-CSE-MsgGUID: DTgQR+T9Qt+VRE9nxmV38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32100973"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2024 07:52:47 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8LQF-0002Ig-10;
	Sat, 18 May 2024 14:52:34 +0000
Date: Sat, 18 May 2024 22:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 32/55]
 drivers/gpu/drm/tidss/tidss_oldi.c:143:13: warning: variable 'mask' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202405182234.qhrfuZZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   01e1dc239f2d2e61c92f01e905c6bffffc482084
commit: f4fe7a54ab5fd4f889efb4968af2bf4ae463942c [32/55] drm/tidss: Add OLDI bridge support
config: i386-buildonly-randconfig-005-20240518 (https://download.01.org/0day-ci/archive/20240518/202405182234.qhrfuZZM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182234.qhrfuZZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182234.qhrfuZZM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tidss/tidss_oldi.c:143:13: warning: variable 'mask' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     143 |                         else if (oldi->oldi_instance == OLDI(1))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_oldi.c:146:10: note: uninitialized use occurs here
     146 |                         val = mask;
         |                               ^~~~
   drivers/gpu/drm/tidss/tidss_oldi.c:143:9: note: remove the 'if' if its condition is always true
     143 |                         else if (oldi->oldi_instance == OLDI(1))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     144 |                                 mask = OLDI_PWRDN_TX(1);
   drivers/gpu/drm/tidss/tidss_oldi.c:111:19: note: initialize the variable 'mask' to silence this warning
     111 |         u32 val = 0, mask;
         |                          ^
         |                           = 0
   1 warning generated.


vim +143 drivers/gpu/drm/tidss/tidss_oldi.c

   108	
   109	static void tidss_oldi_tx_power(struct tidss_oldi *oldi, bool power)
   110	{
   111		u32 val = 0, mask;
   112	
   113		if (WARN_ON(!oldi->io_ctrl))
   114			return;
   115	
   116		/*
   117		 * The power control bits are Active Low, and remain powered off by
   118		 * default. That is, the bits are set to 1. To power on the OLDI TXes,
   119		 * the bits must be cleared to 0. Since there are cases where not all
   120		 * OLDI TXes are being used, the power logic selectively powers them
   121		 * on.
   122		 * Setting the variable 'val' to particular bit masks, makes sure that
   123		 * the unrequired OLDI TXes remain powered off.
   124		 */
   125	
   126		if (power) {
   127			val = 0;
   128			switch (oldi->link_type) {
   129			case OLDI_MODE_SINGLE_LINK:
   130				if (oldi->oldi_instance == OLDI(0))
   131					mask = OLDI_PWRDN_TX(0) | OLDI_PWRDN_BG;
   132				else if (oldi->oldi_instance == OLDI(1))
   133					mask = OLDI_PWRDN_TX(1) | OLDI_PWRDN_BG;
   134	
   135				break;
   136			case OLDI_MODE_CLONE_SINGLE_LINK:
   137			case OLDI_MODE_DUAL_LINK:
   138				mask = OLDI_PWRDN_TX(0) | OLDI_PWRDN_TX(1) | OLDI_PWRDN_BG;
   139				break;
   140			default:
   141				if (oldi->oldi_instance == OLDI(0))
   142					mask = OLDI_PWRDN_TX(0);
 > 143				else if (oldi->oldi_instance == OLDI(1))
   144					mask = OLDI_PWRDN_TX(1);
   145	
   146				val = mask;
   147				break;
   148			}
   149		} else {
   150			switch (oldi->link_type) {
   151			case OLDI_MODE_CLONE_SINGLE_LINK:
   152			case OLDI_MODE_DUAL_LINK:
   153				mask = OLDI_PWRDN_TX(0) | OLDI_PWRDN_TX(1) | OLDI_PWRDN_BG;
   154				break;
   155			case OLDI_MODE_SINGLE_LINK:
   156			default:
   157				if (oldi->oldi_instance == OLDI(0))
   158					mask = OLDI_PWRDN_TX(0);
   159				else if (oldi->oldi_instance == OLDI(1))
   160					mask = OLDI_PWRDN_TX(1);
   161	
   162				break;
   163			}
   164			val = mask;
   165		}
   166	
   167		regmap_update_bits(oldi->io_ctrl, OLDI_PD_CTRL, mask, val);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
