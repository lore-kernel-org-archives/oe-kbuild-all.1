Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F293019259B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 22:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729376349; cv=none; b=UVsuT6/eaEEnUBpOGWuLs6DtAwwiSeStlOvmDFYsV9op+IisZJ1/DH1LFHDidtyjeYOmqWEIReX+WlM3QAEgnG8g0Pip8EDqEfk+9OMdg1KatSbAydMV36Zmibw6gIyRH2IchtSRqsKRYgxVyBLJy2yVtkGelQt27gpqc0dXJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729376349; c=relaxed/simple;
	bh=qGCf+fclHJlCW+xVbGg2wVteE/X42voDIG1TDFSC6vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6A4UECK9K9LNaV0w0ayWe/fkyGs09RV1fMgs8GY4hBAUfzOycsUFx5VOrOktMCD2QToQVbTRImpk9gGp974/aUJ8xZAbzC5UrQco6pblKO/FDX9Raay+JMbzfGO391j5ToEovJrIyMtXO0xQZjvnqi6sS1sFx6A4/iR6RhvyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlsACSsB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlsACSsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729376347; x=1760912347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qGCf+fclHJlCW+xVbGg2wVteE/X42voDIG1TDFSC6vk=;
  b=NlsACSsBLbIjcJbvpc94ZXW5IORHMrNGO8638q/cGLlPjwtlt1w4m3GV
   r91EgObRL6Ob8QKtzdSLDyKlvIiAuZ/dG4/Qk9VDWppaFEWau5pAYkwYd
   aN1w5NcAURi0xqFkmZJdb9SoYMv9hUOiRUICvoEvP2XVCW3SFgwhPLeOS
   l84YI7tEgOZGcCjegEj+BHpcd+6OkuFwSFEafB8IqNXor8KCBUNwQ3ewL
   ogX3tJmc5CzWujupsJpH5W0MvGbBFinuptHEaLV9+Xy9fCLOIv4HAX5cU
   2zf6/Kug00DCa9qIwADQBJ7VM8HGgfBo1f+ppGMls5WpBIjd7j+Zrw6/2
   A==;
X-CSE-ConnectionGUID: ifjCLfypTxCgN84UwzQgNA==
X-CSE-MsgGUID: IEd+aGyURMSdENXhlxWX2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28984540"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28984540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 15:19:04 -0700
X-CSE-ConnectionGUID: ABUu9k49RSqvjYGSk14/Sg==
X-CSE-MsgGUID: wwhZ8v7HRB+qmOMjUfEhHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79186771"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2024 15:19:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Hmn-000Pbh-00;
	Sat, 19 Oct 2024 22:19:01 +0000
Date: Sun, 20 Oct 2024 06:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] remoteproc: k3-r5: Add compile testing support
Message-ID: <202410200636.i36IwjjR-lkp@intel.com>
References: <20241016164141.93401-3-afd@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016164141.93401-3-afd@ti.com>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/remoteproc-k3-dsp-Add-compile-testing-support/20241017-004305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20241016164141.93401-3-afd%40ti.com
patch subject: [PATCH 2/2] remoteproc: k3-r5: Add compile testing support
config: csky-randconfig-r132-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200636.i36IwjjR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410200636.i36IwjjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200636.i36IwjjR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got void [noderef] __iomem *cpu_addr @@
   drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse:     expected void *dest
   drivers/remoteproc/ti_k3_r5_remoteproc.c:490:28: sparse:     got void [noderef] __iomem *cpu_addr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:493:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got void [noderef] __iomem *cpu_addr @@
   drivers/remoteproc/ti_k3_r5_remoteproc.c:493:28: sparse:     expected void *dest
   drivers/remoteproc/ti_k3_r5_remoteproc.c:493:28: sparse:     got void [noderef] __iomem *cpu_addr
   drivers/remoteproc/ti_k3_r5_remoteproc.c:720:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +490 drivers/remoteproc/ti_k3_r5_remoteproc.c

e3865c85385aa0c Suman Anna 2022-02-13  430  
6dedbd1d544389d Suman Anna 2020-10-02  431  /*
6dedbd1d544389d Suman Anna 2020-10-02  432   * The R5F cores have controls for both a reset and a halt/run. The code
6dedbd1d544389d Suman Anna 2020-10-02  433   * execution from DDR requires the initial boot-strapping code to be run
6dedbd1d544389d Suman Anna 2020-10-02  434   * from the internal TCMs. This function is used to release the resets on
6dedbd1d544389d Suman Anna 2020-10-02  435   * applicable cores to allow loading into the TCMs. The .prepare() ops is
6dedbd1d544389d Suman Anna 2020-10-02  436   * invoked by remoteproc core before any firmware loading, and is followed
6dedbd1d544389d Suman Anna 2020-10-02  437   * by the .start() ops after loading to actually let the R5 cores run.
ee99ee7c929c3e7 Suman Anna 2021-03-27  438   *
ee99ee7c929c3e7 Suman Anna 2021-03-27  439   * The Single-CPU mode on applicable SoCs (eg: AM64x) only uses Core0 to
ee99ee7c929c3e7 Suman Anna 2021-03-27  440   * execute code, but combines the TCMs from both cores. The resets for both
ee99ee7c929c3e7 Suman Anna 2021-03-27  441   * cores need to be released to make this possible, as the TCMs are in general
ee99ee7c929c3e7 Suman Anna 2021-03-27  442   * private to each core. Only Core0 needs to be unhalted for running the
ee99ee7c929c3e7 Suman Anna 2021-03-27  443   * cluster in this mode. The function uses the same reset logic as LockStep
ee99ee7c929c3e7 Suman Anna 2021-03-27  444   * mode for this (though the behavior is agnostic of the reset release order).
1168af40b1ad8cb Suman Anna 2022-02-13  445   * This callback is invoked only in remoteproc mode.
6dedbd1d544389d Suman Anna 2020-10-02  446   */
6dedbd1d544389d Suman Anna 2020-10-02  447  static int k3_r5_rproc_prepare(struct rproc *rproc)
6dedbd1d544389d Suman Anna 2020-10-02  448  {
6dedbd1d544389d Suman Anna 2020-10-02  449  	struct k3_r5_rproc *kproc = rproc->priv;
6dedbd1d544389d Suman Anna 2020-10-02  450  	struct k3_r5_cluster *cluster = kproc->cluster;
6dedbd1d544389d Suman Anna 2020-10-02  451  	struct k3_r5_core *core = kproc->core;
6dedbd1d544389d Suman Anna 2020-10-02  452  	struct device *dev = kproc->dev;
7508ea19b20da80 Suman Anna 2020-11-18  453  	u32 ctrl = 0, cfg = 0, stat = 0;
7508ea19b20da80 Suman Anna 2020-11-18  454  	u64 boot_vec = 0;
7508ea19b20da80 Suman Anna 2020-11-18  455  	bool mem_init_dis;
6dedbd1d544389d Suman Anna 2020-10-02  456  	int ret;
6dedbd1d544389d Suman Anna 2020-10-02  457  
7508ea19b20da80 Suman Anna 2020-11-18  458  	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
7508ea19b20da80 Suman Anna 2020-11-18  459  	if (ret < 0)
7508ea19b20da80 Suman Anna 2020-11-18  460  		return ret;
7508ea19b20da80 Suman Anna 2020-11-18  461  	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
7508ea19b20da80 Suman Anna 2020-11-18  462  
ee99ee7c929c3e7 Suman Anna 2021-03-27  463  	/* Re-use LockStep-mode reset logic for Single-CPU mode */
ee99ee7c929c3e7 Suman Anna 2021-03-27  464  	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
ee99ee7c929c3e7 Suman Anna 2021-03-27  465  	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
6dedbd1d544389d Suman Anna 2020-10-02  466  		k3_r5_lockstep_release(cluster) : k3_r5_split_release(core);
34f2653686fecc9 Suman Anna 2020-10-02  467  	if (ret) {
6dedbd1d544389d Suman Anna 2020-10-02  468  		dev_err(dev, "unable to enable cores for TCM loading, ret = %d\n",
6dedbd1d544389d Suman Anna 2020-10-02  469  			ret);
6dedbd1d544389d Suman Anna 2020-10-02  470  		return ret;
6dedbd1d544389d Suman Anna 2020-10-02  471  	}
6dedbd1d544389d Suman Anna 2020-10-02  472  
7508ea19b20da80 Suman Anna 2020-11-18  473  	/*
7508ea19b20da80 Suman Anna 2020-11-18  474  	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
7508ea19b20da80 Suman Anna 2020-11-18  475  	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
7508ea19b20da80 Suman Anna 2020-11-18  476  	 * configurable through System Firmware, the default value does perform
7508ea19b20da80 Suman Anna 2020-11-18  477  	 * auto-init, but account for it in case it is disabled
7508ea19b20da80 Suman Anna 2020-11-18  478  	 */
7508ea19b20da80 Suman Anna 2020-11-18  479  	if (cluster->soc_data->tcm_ecc_autoinit && !mem_init_dis) {
7508ea19b20da80 Suman Anna 2020-11-18  480  		dev_dbg(dev, "leveraging h/w init for TCM memories\n");
7508ea19b20da80 Suman Anna 2020-11-18  481  		return 0;
7508ea19b20da80 Suman Anna 2020-11-18  482  	}
7508ea19b20da80 Suman Anna 2020-11-18  483  
34f2653686fecc9 Suman Anna 2020-10-02  484  	/*
34f2653686fecc9 Suman Anna 2020-10-02  485  	 * Zero out both TCMs unconditionally (access from v8 Arm core is not
34f2653686fecc9 Suman Anna 2020-10-02  486  	 * affected by ATCM & BTCM enable configuration values) so that ECC
34f2653686fecc9 Suman Anna 2020-10-02  487  	 * can be effective on all TCM addresses.
34f2653686fecc9 Suman Anna 2020-10-02  488  	 */
34f2653686fecc9 Suman Anna 2020-10-02  489  	dev_dbg(dev, "zeroing out ATCM memory\n");
34f2653686fecc9 Suman Anna 2020-10-02 @490  	memset(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
34f2653686fecc9 Suman Anna 2020-10-02  491  
34f2653686fecc9 Suman Anna 2020-10-02  492  	dev_dbg(dev, "zeroing out BTCM memory\n");
34f2653686fecc9 Suman Anna 2020-10-02  493  	memset(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
34f2653686fecc9 Suman Anna 2020-10-02  494  
34f2653686fecc9 Suman Anna 2020-10-02  495  	return 0;
34f2653686fecc9 Suman Anna 2020-10-02  496  }
34f2653686fecc9 Suman Anna 2020-10-02  497  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
