Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138DD1F582E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738653; cv=none; b=j1RVm++LpqMInU8RYjwmrc8qpzHjm59JEBiMWh7RAU2RKK71Pj10x1LbQJ5HRPprj4rfi9hYatpaQtA7m9sMf8hJrzs/MHdd+u63nHjB99gz4ga7ap8axjdkrIATsa6sDRb3MV+2z7Hx+bre4xE6pywRLEINJ7Dueg4OimYhkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738653; c=relaxed/simple;
	bh=0czvS9GsLjY0/yNc94p5H0U+1DTXO0az8lAEyYdPtYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o99UzmYjUjwIj8nvkf58XLmw2GsMkfot4jkKO0vcB1Jol/r/usyhPZXyXdKuQ9p3zmC2SMEuGUQ39dbMKuu7tQpNwGVOOYPlkP9Y6B+6XhGr1VPpvnkeDA1hOKVx5EwTa3262lllbhhE/ps6/EfmXCla6EDYjpAys9Qe3hmkLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2oUyANL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2oUyANL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746738651; x=1778274651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0czvS9GsLjY0/yNc94p5H0U+1DTXO0az8lAEyYdPtYc=;
  b=I2oUyANLu0KS7eOc8t3a11cnacPuQfTf6VFD59cNCg1QPGYo1njos77i
   dSFHK4p9AvKyDhtKz8PogEkuuXd7qiYs3q1BFe0qkeYNMlulq2MFtzpC3
   InEWxHZOMYr9//sg3fweUkUKHHFJ4GqmgPLXLMu/a/Nri7gjAN+cyoZuC
   i9zJ92lpmsU8GtoeQj75ZNrJhR4HoAApPTar5SOzSQ02Nc+2iorAOGdB/
   Fkb+mr4PSJNwbm8Q0Vlc/h+hA+9tZsm/mnplCuQ9hncNzF0LTC6moie5U
   z1FgL/5zSQa/O8ub429LpSR6u/76GBSmaNSF2UkKKZvDX1jBF86afnHMU
   w==;
X-CSE-ConnectionGUID: qO3sstmCQZmP96m73k9PhA==
X-CSE-MsgGUID: RfgcxL+hSPmcqWTZn2pSEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65961142"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="65961142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 14:10:50 -0700
X-CSE-ConnectionGUID: PLnFtUU7SbKlyecoRTbpNA==
X-CSE-MsgGUID: rKtvF/lkSCulb0nf2O1mEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136930054"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 14:10:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD8Vv-000BNf-2n;
	Thu, 08 May 2025 21:10:43 +0000
Date: Fri, 9 May 2025 05:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1]
 drivers/platform/x86/intel/speed_select_if/isst_tpmi.c:44:12: warning:
 'intel_sst_resume' defined but not used
Message-ID: <202505090558.To0kUnGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 902c899032bf3bf1fb28881ab102b0a3e10103a6 [0/1] platform/x86: ISST: Add suspend/resume callbacks
config: x86_64-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090558.To0kUnGU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090558.To0kUnGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090558.To0kUnGU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/speed_select_if/isst_tpmi.c:44:12: warning: 'intel_sst_resume' defined but not used [-Wunused-function]
      44 | static int intel_sst_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/platform/x86/intel/speed_select_if/isst_tpmi.c:37:12: warning: 'intel_sst_suspend' defined but not used [-Wunused-function]
      37 | static int intel_sst_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~


vim +/intel_sst_resume +44 drivers/platform/x86/intel/speed_select_if/isst_tpmi.c

    36	
  > 37	static int intel_sst_suspend(struct device *dev)
    38	{
    39		tpmi_sst_dev_suspend(to_auxiliary_dev(dev));
    40	
    41		return 0;
    42	}
    43	
  > 44	static int intel_sst_resume(struct device *dev)
    45	{
    46		tpmi_sst_dev_resume(to_auxiliary_dev(dev));
    47	
    48		return 0;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
