Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE225D8E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608927; cv=none; b=ZDQHRdBtGBhduoT/1vrZcoaBlAzs8UYWzIsX+x3A0oPdtu0jMf0fL552yYrSNz4hFANNpGNDe0AgjMXHFpxnjoWsnogEDyr1+ZLaHp8nmO4vm1oue94LAhjjEmIb/WKIIYYTt6r6FuQkdP88eXe78/Fvk18YLHuHvwr/Hc7Ttvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608927; c=relaxed/simple;
	bh=3NM9fCSqPjuEQvrkksJN159Wo5ngXcg0pkVksitwrVc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lg+4d+pflv1H6q0E92l6r3Z5nxNOcNWkTAeFjlJBgOckvyFIjrYAq69bmZS5iCXor2YepgDphmdOJTbA975g0zhsfmpFXyeeIvmAndHsQQh/V0Cy7vYOINmYA9BjZTa/x8aPW/eQoZ70O3PZTdRfad1hQFRHJEldwdHEcNLdmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtdCLhyf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtdCLhyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740608926; x=1772144926;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3NM9fCSqPjuEQvrkksJN159Wo5ngXcg0pkVksitwrVc=;
  b=BtdCLhyfF6xeDkD9uz78zzpI8HnZ1D8yCIWx4L+bxI0ZW63WFr8lyTE1
   pskOusV5CGLnwi2D9fSuV4DTCTc272PGcjJk1QL8sMjnXIvPOPL+tMEuS
   GbsHT8gQ520AoncUHp3o/FU5iSsSFR+293CoHDt7p3lvCuttmvIqcs8Su
   Oi9fg2SUCuJeYXz7qsBXPfBvb/YCsX1TLoXR2BKmOGZQjbfbHtQTaKr69
   NPrd3kjtcdeqZMssBV2C20eXHCYii9C82+JOLSCOGMMvxKBTSSx8uz/bd
   5b+Jd7NxgoukLT/3I6smBXW/IkSl3QDGSx5O8WkrHXHWb4WriK17+Ezv8
   Q==;
X-CSE-ConnectionGUID: sAQuUEBORzqy7AxFZWCQ7Q==
X-CSE-MsgGUID: 24sEli1cQHuwCN0w3fD9qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45260421"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="45260421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 14:28:45 -0800
X-CSE-ConnectionGUID: r/DWVlL8Q1OIqVtobBDf6w==
X-CSE-MsgGUID: Eqqgf7IGQeyRLkPE5vZ6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117752192"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Feb 2025 14:28:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnPtR-000CYI-3D
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 22:28:41 +0000
Date: Thu, 27 Feb 2025 06:28:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/bus/ti-sysc.c:93: warning: Function
 parameter or member 'mdata' not described in 'sysc'
Message-ID: <202502270604.fbemSrWd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tony,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: a3e92e7b32f2f932239666e826988a13db10e513 [1/1] bus: ti-sysc: Allocate mdata as needed and do platform data based init later
config: arm-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250227/202502270604.fbemSrWd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270604.fbemSrWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270604.fbemSrWd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/ti-sysc.c:93: warning: Function parameter or member 'mdata' not described in 'sysc'
   drivers/bus/ti-sysc.c:93: warning: Function parameter or member 'rsts' not described in 'sysc'
   drivers/bus/ti-sysc.c:93: warning: Function parameter or member 'cookie' not described in 'sysc'
   drivers/bus/ti-sysc.c:93: warning: Function parameter or member 'enabled' not described in 'sysc'
   drivers/bus/ti-sysc.c:93: warning: Function parameter or member 'child_needs_resume' not described in 'sysc'
   drivers/bus/ti-sysc.c:93: warning: Function parameter or member 'idle_work' not described in 'sysc'


vim +93 drivers/bus/ti-sysc.c

c5a2de97fbd297 Tony Lindgren 2017-12-15  54  
0eecc636e5a2f6 Tony Lindgren 2017-10-10  55  /**
0eecc636e5a2f6 Tony Lindgren 2017-10-10  56   * struct sysc - TI sysc interconnect target module registers and capabilities
0eecc636e5a2f6 Tony Lindgren 2017-10-10  57   * @dev: struct device pointer
0eecc636e5a2f6 Tony Lindgren 2017-10-10  58   * @module_pa: physical address of the interconnect target module
0eecc636e5a2f6 Tony Lindgren 2017-10-10  59   * @module_size: size of the interconnect target module
0eecc636e5a2f6 Tony Lindgren 2017-10-10  60   * @module_va: virtual address of the interconnect target module
0eecc636e5a2f6 Tony Lindgren 2017-10-10  61   * @offsets: register offsets from module base
0eecc636e5a2f6 Tony Lindgren 2017-10-10  62   * @clocks: clocks used by the interconnect target module
09dfe5810762cd Tony Lindgren 2018-04-16  63   * @clock_roles: clock role names for the found clocks
09dfe5810762cd Tony Lindgren 2018-04-16  64   * @nr_clocks: number of clocks used by the interconnect target module
0eecc636e5a2f6 Tony Lindgren 2017-10-10  65   * @legacy_mode: configured for legacy mode if set
70a65240efb111 Tony Lindgren 2017-12-15  66   * @cap: interconnect target module capabilities
70a65240efb111 Tony Lindgren 2017-12-15  67   * @cfg: interconnect target module configuration
566a9b05e1fa47 Tony Lindgren 2017-12-15  68   * @name: name if available
566a9b05e1fa47 Tony Lindgren 2017-12-15  69   * @revision: interconnect target module revision
62020f23123221 Tony Lindgren 2018-02-22  70   * @needs_resume: runtime resume needed on resume from suspend
0eecc636e5a2f6 Tony Lindgren 2017-10-10  71   */
0eecc636e5a2f6 Tony Lindgren 2017-10-10  72  struct sysc {
0eecc636e5a2f6 Tony Lindgren 2017-10-10  73  	struct device *dev;
0eecc636e5a2f6 Tony Lindgren 2017-10-10  74  	u64 module_pa;
0eecc636e5a2f6 Tony Lindgren 2017-10-10  75  	u32 module_size;
0eecc636e5a2f6 Tony Lindgren 2017-10-10  76  	void __iomem *module_va;
0eecc636e5a2f6 Tony Lindgren 2017-10-10  77  	int offsets[SYSC_MAX_REGS];
a3e92e7b32f2f9 Tony Lindgren 2019-03-21  78  	struct ti_sysc_module_data *mdata;
09dfe5810762cd Tony Lindgren 2018-04-16  79  	struct clk **clocks;
09dfe5810762cd Tony Lindgren 2018-04-16  80  	const char **clock_roles;
09dfe5810762cd Tony Lindgren 2018-04-16  81  	int nr_clocks;
5062236ec45876 Tony Lindgren 2018-04-16  82  	struct reset_control *rsts;
0eecc636e5a2f6 Tony Lindgren 2017-10-10  83  	const char *legacy_mode;
70a65240efb111 Tony Lindgren 2017-12-15  84  	const struct sysc_capabilities *cap;
70a65240efb111 Tony Lindgren 2017-12-15  85  	struct sysc_config cfg;
ef70b0bdeaf893 Tony Lindgren 2018-02-22  86  	struct ti_sysc_cookie cookie;
566a9b05e1fa47 Tony Lindgren 2017-12-15  87  	const char *name;
566a9b05e1fa47 Tony Lindgren 2017-12-15  88  	u32 revision;
62020f23123221 Tony Lindgren 2018-02-22  89  	bool enabled;
62020f23123221 Tony Lindgren 2018-02-22  90  	bool needs_resume;
a885f0fe209f26 Tony Lindgren 2018-02-22  91  	bool child_needs_resume;
76f0f772e4691d Tony Lindgren 2018-02-23  92  	struct delayed_work idle_work;
0eecc636e5a2f6 Tony Lindgren 2017-10-10 @93  };
0eecc636e5a2f6 Tony Lindgren 2017-10-10  94  

:::::: The code at line 93 was first introduced by commit
:::::: 0eecc636e5a2f667e69df318867b63edc8b44218 bus: ti-sysc: Add minimal TI sysc interconnect target driver

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
