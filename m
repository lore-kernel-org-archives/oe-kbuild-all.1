Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F62E64B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720373216; cv=none; b=ZYHagL+ILiYx59Pwjcgn1sSvCk/jjcyozJErUiPSya9PVyORj8uLY/jX5JdQf2jzboCxDAD4cbPFE5OMAM5bZtLDc9rLr7FVyI1JW2y/OBNXqONsm2p8Fc6NWAGGb7iwjjHM84wHJyjJUbfO9LjcYN0/YNQRlskH7g/mPZcmFYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720373216; c=relaxed/simple;
	bh=OYb6luaHzFr8ZoLfLNacEZGLbdRKURpKjiUsxtVYI18=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhnRz101JtD0jvSN3nLA6cZJRdKzUHW9eqObDwyxUbArDCBfIpvuyv8nGupLCc4lETEypxVXTJgmGLmm37WrCi5Mznoy/wNAIFY55dLdwthNKOYmLLvYVnLKWUjrSaJMDqLllYs0w/O43iL3Zzhls3B8vmqRS3FSiuZNDe9I8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AN+sh8VF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AN+sh8VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720373215; x=1751909215;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OYb6luaHzFr8ZoLfLNacEZGLbdRKURpKjiUsxtVYI18=;
  b=AN+sh8VF7XqtUjRWZUEyXiGhG3tWud0ZonQlRNnaLTMY89TOzbWeV5vC
   WCVNyppwehaZjQQJHcF/upzyEFDqWXwy/4c2VmfsJx6AodduTfGbFXycX
   OqtDwsEoNkREHHaRBu7j9AxWeBEvi7PmTlfPZUZDxU7bNgLD4aY9D8jAg
   C1PrlzM3ulep7Zn7ufzT97ocPLkamCXVePZcxALe5FINXozhzTuYsreq3
   p3NuO99jwsLfZTAlCysePMHsg6sYFyhn75bnLiAkoSIidHgq3vwz+0LkS
   frSp7FZ/WKmJJCHlHLbHfqK/AJh0dvfm76F+fmB8xddrY608dNLOLpXJ3
   A==;
X-CSE-ConnectionGUID: LiULixM/SBiKuYC7Wz85Vg==
X-CSE-MsgGUID: Vr4jWLhuTQOODw8nZP07HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28967770"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="28967770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 10:26:54 -0700
X-CSE-ConnectionGUID: fm+zI1fYQ+6Kt0R2l5Yzow==
X-CSE-MsgGUID: HKkGaukIQnWVMr44ieYkGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="70502281"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2024 10:26:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQVez-000V9O-2g;
	Sun, 07 Jul 2024 17:26:49 +0000
Date: Mon, 8 Jul 2024 01:25:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 32/42]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:119: warning: Function parameter or
 member 'qos_req' not described in 'k3_r5_cluster'
Message-ID: <202407080156.CbL4oY1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   fb89cd4d622ce6cc1b7b254ae21298570d437a08
commit: 346bc05aa1c20a00eebce3b5a0a75e1f2fdc4985 [32/42] remoteproc: k3_r5: add/expose resume latency constraint
config: arm64-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080156.CbL4oY1W-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080156.CbL4oY1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080156.CbL4oY1W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_r5_remoteproc.c:119: warning: Function parameter or member 'qos_req' not described in 'k3_r5_cluster'
   drivers/remoteproc/ti_k3_r5_remoteproc.c:178: warning: Function parameter or member 'shut_comp' not described in 'k3_r5_rproc'


vim +119 drivers/remoteproc/ti_k3_r5_remoteproc.c

7508ea19b20da8 Suman Anna    2020-11-18  103  
6dedbd1d544389 Suman Anna    2020-10-02  104  /**
6dedbd1d544389 Suman Anna    2020-10-02  105   * struct k3_r5_cluster - K3 R5F Cluster structure
6dedbd1d544389 Suman Anna    2020-10-02  106   * @dev: cached device pointer
6dedbd1d544389 Suman Anna    2020-10-02  107   * @mode: Mode to configure the Cluster - Split or LockStep
6dedbd1d544389 Suman Anna    2020-10-02  108   * @cores: list of R5 cores within the cluster
7dcf3e00aa951f Apurva Nandan 2024-05-02  109   * @core_transition: wait queue to sync core state changes
7508ea19b20da8 Suman Anna    2020-11-18  110   * @soc_data: SoC-specific feature data for a R5FSS
6dedbd1d544389 Suman Anna    2020-10-02  111   */
6dedbd1d544389 Suman Anna    2020-10-02  112  struct k3_r5_cluster {
6dedbd1d544389 Suman Anna    2020-10-02  113  	struct device *dev;
6dedbd1d544389 Suman Anna    2020-10-02  114  	enum cluster_mode mode;
6dedbd1d544389 Suman Anna    2020-10-02  115  	struct list_head cores;
7dcf3e00aa951f Apurva Nandan 2024-05-02  116  	wait_queue_head_t core_transition;
7508ea19b20da8 Suman Anna    2020-11-18  117  	const struct k3_r5_soc_data *soc_data;
346bc05aa1c20a Kevin Hilman  2024-07-03  118  	struct dev_pm_qos_request qos_req;
6dedbd1d544389 Suman Anna    2020-10-02 @119  };
6dedbd1d544389 Suman Anna    2020-10-02  120  

:::::: The code at line 119 was first introduced by commit
:::::: 6dedbd1d544389d6ab1727423348572a11e9df5d remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
