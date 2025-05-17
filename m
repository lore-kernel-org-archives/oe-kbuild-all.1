Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4794B1E5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747470564; cv=none; b=FhgZcVwy9gLCF69+s+T3qk4kOuFygWeDERLgCJWmDx6DhDqHYFS+lLaWBoM7yCKLC58vMc1Cex0b9+zIifzeXPH0+qtxU3mTq3+mHQv1Ik3rOYM4nu8i/tqZ0OrhSlbIk4Gh0iFbcpylauEEalBiAHhllR8eJ7wWGoxPsQALoO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747470564; c=relaxed/simple;
	bh=SvJtYjUm/xrzTSZK9s+ivdHP6kc845+gNTH2kWSE9KU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HTaEvnvKTwao5DXNr5xJDM1UDjURChCG/NQNvLe0uLi+ROapID/CObhNsTB+Yn8e6uVOdJfA86KIrcn0iCEL3DCov/c/aHg13n/vsd/F1OTxxMQaMCGuflMsYJLdzZMzne/1fAixxXN7Pj3wGDg0bGgtgbxZVUQFnLk12k9RAck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDIPVIlF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDIPVIlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747470562; x=1779006562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvJtYjUm/xrzTSZK9s+ivdHP6kc845+gNTH2kWSE9KU=;
  b=ZDIPVIlFuna837EXXa49YjC/5r80c+yjfh4tgt6R9IkpykG9cQ7GWrAg
   r1L+SDIA5XOzKjqE/JJCfQ0sgSSmL2FEXjO2jSorkHtK5GdVs/islYNTO
   wvW+9VAHGfryNO+YiyAPLjdfChfgu6ALparT0EbUUJCy6zY2PZ1oOeIXv
   Eud4yRQZUm2FbTyJpNTLnghQSdSbZNcVYom8kdBAbD9MBWEDJnVgB0BEz
   boBkmPovsFIF+8+UxpCdxELw3JVwf6Oe0OjU0WF5vqWEjFWpALOiV/lSS
   X0uW588fCERdwtqvsBgY/kkU+07gZLLvGzXfENc2+y/touonkPkM+F8Gv
   w==;
X-CSE-ConnectionGUID: m2xniA+mROWz5O+++GjU2Q==
X-CSE-MsgGUID: 0Gh6/CgNSzaju5FmVd4qlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="52065398"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="52065398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 01:29:21 -0700
X-CSE-ConnectionGUID: KeL+Z/N0QxaddlhTlU/Vew==
X-CSE-MsgGUID: Zqc6MloUS3+ej71DgkpxRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="143692112"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2025 01:29:21 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGCv0-0000Vb-1E;
	Sat, 17 May 2025 08:29:18 +0000
Date: Sat, 17 May 2025 16:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 drivers/phy/qualcomm/phy-qcom-qmp.c:2928: warning: Function parameter or
 member 'usb_phy' not described in 'qcom_qmp'
Message-ID: <202505171629.EorJ6lrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: e58df87394be1b4a4e72760ae99461c1e3828073 [1/1] phy: qcom-qmp-combo: fix broken power on
config: arm64-randconfig-2003-20250514 (https://download.01.org/0day-ci/archive/20250517/202505171629.EorJ6lrx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171629.EorJ6lrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171629.EorJ6lrx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-qmp.c:2890: warning: Function parameter or member 'dp_aux_cfg' not described in 'qmp_phy'
   drivers/phy/qualcomm/phy-qcom-qmp.c:2890: warning: Function parameter or member 'dp_opts' not described in 'qmp_phy'
   drivers/phy/qualcomm/phy-qcom-qmp.c:2890: warning: Function parameter or member 'dp_clks' not described in 'qmp_phy'
>> drivers/phy/qualcomm/phy-qcom-qmp.c:2928: warning: Function parameter or member 'usb_phy' not described in 'qcom_qmp'


vim +2928 drivers/phy/qualcomm/phy-qcom-qmp.c

e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2897  
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2898  /**
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2899   * struct qcom_qmp - structure holding QMP phy block attributes
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2900   *
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2901   * @dev: device
efb05a50c956b4 drivers/phy/qualcomm/phy-qcom-qmp.c Manu Gautam  2018-01-16  2902   * @dp_com: iomapped memory space for phy's dp_com control block
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2903   *
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2904   * @clks: array of clocks required by phy
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2905   * @resets: array of resets required by phy
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2906   * @vregs: regulator supplies bulk data
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2907   *
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2908   * @phys: array of per-lane phy descriptors
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2909   * @phy_mutex: mutex lock for PHY common block initialization
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2910   * @init_count: phy common block initialization count
c9b589791fc1b3 drivers/phy/qualcomm/phy-qcom-qmp.c Evan Green   2019-03-21  2911   * @ufs_reset: optional UFS PHY reset handle
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2912   */
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2913  struct qcom_qmp {
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2914  	struct device *dev;
efb05a50c956b4 drivers/phy/qualcomm/phy-qcom-qmp.c Manu Gautam  2018-01-16  2915  	void __iomem *dp_com;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2916  
10939b10741d2f drivers/phy/qualcomm/phy-qcom-qmp.c Vivek Gautam 2018-01-16  2917  	struct clk_bulk_data *clks;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2918  	struct reset_control **resets;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2919  	struct regulator_bulk_data *vregs;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2920  
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2921  	struct qmp_phy **phys;
e58df87394be1b drivers/phy/qualcomm/phy-qcom-qmp.c Johan Hovold 2023-02-03  2922  	struct qmp_phy *usb_phy;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2923  
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2924  	struct mutex phy_mutex;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2925  	int init_count;
c9b589791fc1b3 drivers/phy/qualcomm/phy-qcom-qmp.c Evan Green   2019-03-21  2926  
c9b589791fc1b3 drivers/phy/qualcomm/phy-qcom-qmp.c Evan Green   2019-03-21  2927  	struct reset_control *ufs_reset;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06 @2928  };
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2929  

:::::: The code at line 2928 was first introduced by commit
:::::: e78f3d15e115e8e764d4b1562b4fa538f2e22f6b phy: qcom-qmp: new qmp phy driver for qcom-chipsets

:::::: TO: Vivek Gautam <vivek.gautam@codeaurora.org>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
