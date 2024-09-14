Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02D47796
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726293287; cv=none; b=DMLL2oFYuo5EBrtZyurgTU6Stvyx/tbKLqjkQ54qtCntK/DHm0Xzsw1pI0auz/T/NLdqAom3yXIL+uc7B03ZCe41tfWTUBEF9ouZNElNf0a1tFQEhuu3vX+SGeZbKSvDTQ9cI7MBtjRd22HiOZurGzG0CJ7UPcTRdppoSos9O5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726293287; c=relaxed/simple;
	bh=nvb4KgxYSyFIa+LDMRoz49/eaO2rvy/mWTzCGKX2jZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hrKG2cH0xeIK4sWeKfgcexBIzG2tcZUWsgCLhuSPZ6oxiLzFhf9v7U7/KPRmQ6reNRxHDje3ANI3DIOMtlYIoypytZ/i9uowQnyhsnkaoZV9+6mPa+MqLP1dYsLHPLfI9hfzQuhT9GRZh+3+1ElbVFRscGdFPR6GXE16IlM0eO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es07ZyRX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es07ZyRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726293285; x=1757829285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvb4KgxYSyFIa+LDMRoz49/eaO2rvy/mWTzCGKX2jZo=;
  b=Es07ZyRXQxPRvq6hOmMyzFxgI3aNieri4BmOsBCEFuOejEXhqzwGOBPE
   MzXGF+7H5B2P9wq1Gz+ZSL+jkb9+FVZ+PU2RIQ5FX7fcKHvsD2hNpAkXq
   IStqMqDfj9msN5dUeoubz7jjPhH/07aHfqv9RqcUuoNLdjJA/iGTmF/VK
   GqNeiAw9/L9OrkIjJ1eFrpJvDy/7F43cFtZ3SHKVRWbeU3fbMt9bwCaoN
   ftFdKs4s2Eq2rCI+j3Diwbhxu51EOfKzFLblx4XMzICdFVe51Wcjs6VxK
   8dfY4Q6G39uQV1NAmN2pQsNNP5ZZILk2/Nhk+5Hdi4tQOc3W6ef+qTzpr
   g==;
X-CSE-ConnectionGUID: dZm89RY7SciF2iU5n6qhrg==
X-CSE-MsgGUID: +pzRkg31Qm6TpkOOYUW3fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="47713359"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="47713359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 22:54:44 -0700
X-CSE-ConnectionGUID: kZYzq6isSkysxrtRz2Q7TA==
X-CSE-MsgGUID: Sn3OiMJ+Q8KE1kTMSh3aWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="73330427"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Sep 2024 22:54:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spLk1-0007QU-0x;
	Sat, 14 Sep 2024 05:54:41 +0000
Date: Sat, 14 Sep 2024 13:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 45/45]
 drivers/platform/chrome/chromeos_of_hw_prober.c:207:45: warning:
 'chromeos_i2c_probe_hana_trackpad' defined but not used
Message-ID: <202409141358.A1eSxMVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783
commit: 42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783 [45/45] hana trackpad probe rework
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409141358.A1eSxMVB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141358.A1eSxMVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141358.A1eSxMVB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/chrome/chromeos_of_hw_prober.c: In function 'chromeos_sku_component_selector':
   drivers/platform/chrome/chromeos_of_hw_prober.c:102:16: error: cleanup argument not a function
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                ^~~~~~~~~~~~
   drivers/platform/chrome/chromeos_of_hw_prober.c:102:50: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     102 |         struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
         |                                                  ^~~~~~~
   drivers/platform/chrome/chromeos_of_hw_prober.c:102:50: warning: initialization of 'struct of_changeset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/platform/chrome/chromeos_of_hw_prober.c: At top level:
>> drivers/platform/chrome/chromeos_of_hw_prober.c:207:45: warning: 'chromeos_i2c_probe_hana_trackpad' defined but not used [-Wunused-const-variable=]
     207 | static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/chrome/chromeos_of_hw_prober.c:197:38: warning: 'chromeos_i2c_probe_simple_trackpad_cfg' defined but not used [-Wunused-const-variable=]
     197 | static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/chromeos_i2c_probe_hana_trackpad +207 drivers/platform/chrome/chromeos_of_hw_prober.c

   196	
 > 197	static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
   198		.ops = &i2c_of_probe_simple_ops,
   199		.type = "trackpad"
   200	};
   201	
   202	static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_touchscreen_cfg = {
   203		.ops = &i2c_of_probe_simple_ops,
   204		.type = "touchscreen"
   205	};
   206	
 > 207	static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
   208		.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
   209		.opts = &(const struct i2c_of_probe_simple_opts) {
   210			.res_node_compatible = "elan,ekth3000",
   211			.supply_name = "vcc",
   212			.post_power_on_delay_ms = 1,
   213		}
   214	};
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
