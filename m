Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433291FDD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 01:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729472791; cv=none; b=nQKzlvbuLIif4K2zK3YP3p4pBuHZGR18B2AvdcHL/6VulGtqaVXX62XHLXOH9ynaQgEFSPzLuvV95JW1jbTzL8b4FYLloxSlIm6QWrUnjJDPeL+AKFDJrfkCl8R45LN9H1UqcgiG4WqT+0+MHcAozVqWsLH5DPhDU6gmSki1dGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729472791; c=relaxed/simple;
	bh=YMvIsZ95okAjyMW4hhqkCGSu+iBWqJlpx+vJvqfATU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXIp+rVduri+sODH3X25vRc29nwLdAtK0IeHL3JReLIzpbDoFb1RIb4HYtDWhIwP6X/0G6X+fANi892Xi+y7nYp9HIvBmps5j4ceZvy6TJqgJ39fINrNgFYBmfegKB4IxFw5S9EIASjOV9oJznPlHIiLyjnnJklU6nuiwVjw+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuMG95Ya; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuMG95Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729472789; x=1761008789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMvIsZ95okAjyMW4hhqkCGSu+iBWqJlpx+vJvqfATU0=;
  b=EuMG95YaC/k21uhVQcLElP/zPwibTNL2BwbZMOZZZiQEp+P4ze0Q8Vfk
   vKXV4hj4L+q1jcegkSQUJILWrVWnHvUk3TEyFST4K/MRNvihpAG+/CPrG
   lgl1IxVjB+z1SdZN05r5eAzn6mJkyOn0r0fCWvJdwlakhZU4jzx3Xi2Pe
   7k139ctj0/EWgxT/YjSOgk6Yqtr/ij44GtCcULSERY22h2S2gEmaWlC1O
   Pr5kxbRMj2IP5Gw4XtAmpnmF4hPkmXYKS6VHcNaDGo1jTQCQFy4EMDjkN
   DkYRafo9m0K+JQc35SvXpNFvlntMwyp2t1y714etrGo0zcr9qVE3WTlLc
   A==;
X-CSE-ConnectionGUID: UPT+sAXHT3qWLX6PU0KfqQ==
X-CSE-MsgGUID: p+tanM0KT9ONtF1Dk0kmiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29061884"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="29061884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 18:06:29 -0700
X-CSE-ConnectionGUID: DvnNdceXQkuVSuVmDTG36A==
X-CSE-MsgGUID: xxfpbXIAQLy3vmrC2yyd1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84191213"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2024 18:06:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2gsK-000Qxf-2p;
	Mon, 21 Oct 2024 01:06:24 +0000
Date: Mon, 21 Oct 2024 09:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [remoteproc:rproc-next 9/9]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202410210806.0nxKbdVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
head:   be3e6529a8b90b1284a55117a4e23095ccbeaeaf
commit: be3e6529a8b90b1284a55117a4e23095ccbeaeaf [9/9] remoteproc: k3-r5: Add compile testing support
config: arc-randconfig-r122-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210806.0nxKbdVA-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410210806.0nxKbdVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210806.0nxKbdVA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *cpu_addr @@
   drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse:     expected void *ptr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse:     got void [noderef] __iomem *cpu_addr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:493:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *cpu_addr @@
   drivers/remoteproc/ti_k3_r5_remoteproc.c:493:28: sparse:     expected void *ptr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:493:28: sparse:     got void [noderef] __iomem *cpu_addr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:720:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/ti_k3_r5_remoteproc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +490 drivers/remoteproc/ti_k3_r5_remoteproc.c

e3865c85385aa0 Suman Anna 2022-02-13  430  
6dedbd1d544389 Suman Anna 2020-10-02  431  /*
6dedbd1d544389 Suman Anna 2020-10-02  432   * The R5F cores have controls for both a reset and a halt/run. The code
6dedbd1d544389 Suman Anna 2020-10-02  433   * execution from DDR requires the initial boot-strapping code to be run
6dedbd1d544389 Suman Anna 2020-10-02  434   * from the internal TCMs. This function is used to release the resets on
6dedbd1d544389 Suman Anna 2020-10-02  435   * applicable cores to allow loading into the TCMs. The .prepare() ops is
6dedbd1d544389 Suman Anna 2020-10-02  436   * invoked by remoteproc core before any firmware loading, and is followed
6dedbd1d544389 Suman Anna 2020-10-02  437   * by the .start() ops after loading to actually let the R5 cores run.
ee99ee7c929c3e Suman Anna 2021-03-27  438   *
ee99ee7c929c3e Suman Anna 2021-03-27  439   * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to
ee99ee7c929c3e Suman Anna 2021-03-27  440   * execute code, but combines the TCMs from both cores. The resets for both
ee99ee7c929c3e Suman Anna 2021-03-27  441   * cores need to be released to make this possible, as the TCMs are in general
ee99ee7c929c3e Suman Anna 2021-03-27  442   * private to each core. Only Core0 needs to be unhalted for running the
ee99ee7c929c3e Suman Anna 2021-03-27  443   * cluster in this mode. The function uses the same reset logic as LockStep
ee99ee7c929c3e Suman Anna 2021-03-27  444   * mode for this (though the behavior is agnostic of the reset release order).
1168af40b1ad8c Suman Anna 2022-02-13  445   * This callback is invoked only in remoteproc mode.
6dedbd1d544389 Suman Anna 2020-10-02  446   */
6dedbd1d544389 Suman Anna 2020-10-02  447  static int k3_r5_rproc_prepare(struct rproc *rproc)
6dedbd1d544389 Suman Anna 2020-10-02  448  {
6dedbd1d544389 Suman Anna 2020-10-02  449  	struct k3_r5_rproc *kproc = rproc->priv;
6dedbd1d544389 Suman Anna 2020-10-02  450  	struct k3_r5_cluster *cluster = kproc->cluster;
6dedbd1d544389 Suman Anna 2020-10-02  451  	struct k3_r5_core *core = kproc->core;
6dedbd1d544389 Suman Anna 2020-10-02  452  	struct device *dev = kproc->dev;
7508ea19b20da8 Suman Anna 2020-11-18  453  	u32 ctrl = 0, cfg = 0, stat = 0;
7508ea19b20da8 Suman Anna 2020-11-18  454  	u64 boot_vec = 0;
7508ea19b20da8 Suman Anna 2020-11-18  455  	bool mem_init_dis;
6dedbd1d544389 Suman Anna 2020-10-02  456  	int ret;
6dedbd1d544389 Suman Anna 2020-10-02  457  
7508ea19b20da8 Suman Anna 2020-11-18  458  	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
7508ea19b20da8 Suman Anna 2020-11-18  459  	if (ret < 0)
7508ea19b20da8 Suman Anna 2020-11-18  460  		return ret;
7508ea19b20da8 Suman Anna 2020-11-18  461  	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
7508ea19b20da8 Suman Anna 2020-11-18  462  
ee99ee7c929c3e Suman Anna 2021-03-27  463  	/* Re-use LockStep-mode reset logic for Single-CPU mode */
ee99ee7c929c3e Suman Anna 2021-03-27  464  	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
ee99ee7c929c3e Suman Anna 2021-03-27  465  	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
6dedbd1d544389 Suman Anna 2020-10-02  466  		k3_r5_lockstep_release(cluster) : k3_r5_split_release(core);
34f2653686fecc Suman Anna 2020-10-02  467  	if (ret) {
6dedbd1d544389 Suman Anna 2020-10-02  468  		dev_err(dev, "unable to enable cores for TCM loading, ret = %d\n",
6dedbd1d544389 Suman Anna 2020-10-02  469  			ret);
6dedbd1d544389 Suman Anna 2020-10-02  470  		return ret;
6dedbd1d544389 Suman Anna 2020-10-02  471  	}
6dedbd1d544389 Suman Anna 2020-10-02  472  
7508ea19b20da8 Suman Anna 2020-11-18  473  	/*
7508ea19b20da8 Suman Anna 2020-11-18  474  	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
7508ea19b20da8 Suman Anna 2020-11-18  475  	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
7508ea19b20da8 Suman Anna 2020-11-18  476  	 * configurable through System Firmware, the default value does perform
7508ea19b20da8 Suman Anna 2020-11-18  477  	 * auto-init, but account for it in case it is disabled
7508ea19b20da8 Suman Anna 2020-11-18  478  	 */
7508ea19b20da8 Suman Anna 2020-11-18  479  	if (cluster->soc_data->tcm_ecc_autoinit && !mem_init_dis) {
7508ea19b20da8 Suman Anna 2020-11-18  480  		dev_dbg(dev, "leveraging h/w init for TCM memories\n");
7508ea19b20da8 Suman Anna 2020-11-18  481  		return 0;
7508ea19b20da8 Suman Anna 2020-11-18  482  	}
7508ea19b20da8 Suman Anna 2020-11-18  483  
34f2653686fecc Suman Anna 2020-10-02  484  	/*
34f2653686fecc Suman Anna 2020-10-02  485  	 * Zero out both TCMs unconditionally (access from v8 Arm core is not
34f2653686fecc Suman Anna 2020-10-02  486  	 * affected by ATCM & BTCM enable configuration values) so that ECC
34f2653686fecc Suman Anna 2020-10-02  487  	 * can be effective on all TCM addresses.
34f2653686fecc Suman Anna 2020-10-02  488  	 */
34f2653686fecc Suman Anna 2020-10-02  489  	dev_dbg(dev, "zeroing out ATCM memory\n");
34f2653686fecc Suman Anna 2020-10-02 @490  	memset(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
34f2653686fecc Suman Anna 2020-10-02  491  
34f2653686fecc Suman Anna 2020-10-02  492  	dev_dbg(dev, "zeroing out BTCM memory\n");
34f2653686fecc Suman Anna 2020-10-02  493  	memset(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
34f2653686fecc Suman Anna 2020-10-02  494  
34f2653686fecc Suman Anna 2020-10-02  495  	return 0;
34f2653686fecc Suman Anna 2020-10-02  496  }
34f2653686fecc Suman Anna 2020-10-02  497  

:::::: The code at line 490 was first introduced by commit
:::::: 34f2653686fecc9bd5a4ee16724768c72953fb57 remoteproc: k3-r5: Initialize TCM memories for ECC

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
