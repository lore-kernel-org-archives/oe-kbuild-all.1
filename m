Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CDB12B95
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720347286; cv=none; b=n5hkRg2nTYCgUj29ro7Efu5D4g+b23iBtVUF/P9mxcNEaG2nI30nyB2/xOtwczXUuRsRXJlJKWq0A+zHQukK2Jwcs6G9QLlbxprld9fLwSdSXlDngym+3fmO4VFXmR92WOGCbdx5NZ4VrgAT1fdMbanIjZUqPA4+2V1r+7694Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720347286; c=relaxed/simple;
	bh=gnM1vWFz9MMD3TQ/qTpsbUGMCIbgRwWMyRYJSzPIOXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0y5FrMf/trozMrsC0zQL88I57pKCYFWA5boKUq+476AOiApCzXLvxNL6S5Ub12m/SNR9DG5P4qDyd8nfXw1R/YD/XmPz2brSBqLuGQ3i9YmJsr1WcccFjkJNXPKahqFzmgTRgjo6lAAt7a17F/ECSLK6XuMBlQDUcvn7YLOriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7m3+tjX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7m3+tjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720347285; x=1751883285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gnM1vWFz9MMD3TQ/qTpsbUGMCIbgRwWMyRYJSzPIOXY=;
  b=X7m3+tjX0jisECamWwoy85mH70Q0L3GUDd7zIbKAxCF9AnI02tAUfaal
   Fg0v48rRPj2ePLBuYAfZGaOCQSFHlI7QtdK77TQoH2VnPSfbLG6DpH0qy
   Ma6o6t+zGYPRO4L4m20rhWjPZ1AD8tX2lWegZ2YlO4T6blHbO5lACvHrP
   hWZ2Qs6o6fQOWjiQRDNyZA0vCxRXdhCfISyh6CV6DwMm0kOKHEnKfIr2B
   QVT5kbIhfqrZX26dniJtUN459SVhO2zLqNeI0zsw3zmSH4NG8sZimCXou
   VSXiLMOj5vwMCNyOklrp1MeAbIlkYv1fudSe0F9kUw47heRvCvHYikS9f
   w==;
X-CSE-ConnectionGUID: iV8U6UptRryr+UM91cWXwA==
X-CSE-MsgGUID: qg0A++9XQIWgVfCLA/1xqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="20466503"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="20466503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 03:14:44 -0700
X-CSE-ConnectionGUID: ukdCidYZQEWzbqCr4A0GDQ==
X-CSE-MsgGUID: oVA54+05SIKY6Fbs7soxmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="78382383"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jul 2024 03:14:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQOum-000UpE-2j;
	Sun, 07 Jul 2024 10:14:40 +0000
Date: Sun, 7 Jul 2024 18:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 26/42]
 drivers/remoteproc/ti_k3_m4_remoteproc.c:95: warning: Function parameter or
 member 'shut_comp' not described in 'k3_m4_rproc'
Message-ID: <202407071805.jp3WWnts-lkp@intel.com>
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
commit: ab5779c6da0aa74a396c26aaf2bbe8dc52f6aabe [26/42] remoteproc: k3-m4: support for graceful shutdown of remote cores
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407071805.jp3WWnts-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071805.jp3WWnts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071805.jp3WWnts-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_m4_remoteproc.c:95: warning: Function parameter or member 'shut_comp' not described in 'k3_m4_rproc'
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:106: warning: Function parameter or member 'core' not described in 'is_core_in_wfi'
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:106: warning: Excess function parameter 'kproc' description in 'is_core_in_wfi'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +95 drivers/remoteproc/ti_k3_m4_remoteproc.c

acc3573ed94e85 Martyn Welch 2024-05-14   63  
acc3573ed94e85 Martyn Welch 2024-05-14   64  /**
acc3573ed94e85 Martyn Welch 2024-05-14   65   * struct k3_m4_rproc - k3 remote processor driver structure
acc3573ed94e85 Martyn Welch 2024-05-14   66   * @dev: cached device pointer
acc3573ed94e85 Martyn Welch 2024-05-14   67   * @rproc: remoteproc device handle
acc3573ed94e85 Martyn Welch 2024-05-14   68   * @mem: internal memory regions data
acc3573ed94e85 Martyn Welch 2024-05-14   69   * @num_mems: number of internal memory regions
acc3573ed94e85 Martyn Welch 2024-05-14   70   * @rmem: reserved memory regions data
acc3573ed94e85 Martyn Welch 2024-05-14   71   * @num_rmems: number of reserved memory regions
acc3573ed94e85 Martyn Welch 2024-05-14   72   * @reset: reset control handle
acc3573ed94e85 Martyn Welch 2024-05-14   73   * @data: pointer to device data
acc3573ed94e85 Martyn Welch 2024-05-14   74   * @tsp: TI-SCI processor control handle
acc3573ed94e85 Martyn Welch 2024-05-14   75   * @ti_sci: TI-SCI handle
acc3573ed94e85 Martyn Welch 2024-05-14   76   * @ti_sci_id: TI-SCI device identifier
acc3573ed94e85 Martyn Welch 2024-05-14   77   * @mbox: mailbox channel handle
acc3573ed94e85 Martyn Welch 2024-05-14   78   * @client: mailbox client to request the mailbox channel
acc3573ed94e85 Martyn Welch 2024-05-14   79   */
acc3573ed94e85 Martyn Welch 2024-05-14   80  struct k3_m4_rproc {
acc3573ed94e85 Martyn Welch 2024-05-14   81  	struct device *dev;
acc3573ed94e85 Martyn Welch 2024-05-14   82  	struct rproc *rproc;
acc3573ed94e85 Martyn Welch 2024-05-14   83  	struct k3_m4_rproc_mem *mem;
acc3573ed94e85 Martyn Welch 2024-05-14   84  	int num_mems;
acc3573ed94e85 Martyn Welch 2024-05-14   85  	struct k3_m4_rproc_mem *rmem;
acc3573ed94e85 Martyn Welch 2024-05-14   86  	int num_rmems;
acc3573ed94e85 Martyn Welch 2024-05-14   87  	struct reset_control *reset;
acc3573ed94e85 Martyn Welch 2024-05-14   88  	const struct k3_m4_rproc_dev_data *data;
acc3573ed94e85 Martyn Welch 2024-05-14   89  	struct ti_sci_proc *tsp;
acc3573ed94e85 Martyn Welch 2024-05-14   90  	const struct ti_sci_handle *ti_sci;
acc3573ed94e85 Martyn Welch 2024-05-14   91  	u32 ti_sci_id;
acc3573ed94e85 Martyn Welch 2024-05-14   92  	struct mbox_chan *mbox;
acc3573ed94e85 Martyn Welch 2024-05-14   93  	struct mbox_client client;
ab5779c6da0aa7 Hari Nagalla 2024-07-02   94  	struct completion shut_comp;
acc3573ed94e85 Martyn Welch 2024-05-14  @95  };
acc3573ed94e85 Martyn Welch 2024-05-14   96  
ab5779c6da0aa7 Hari Nagalla 2024-07-02   97  /**
ab5779c6da0aa7 Hari Nagalla 2024-07-02   98   * is_core_in_wfi - local utility function to check core status
ab5779c6da0aa7 Hari Nagalla 2024-07-02   99   * @kproc: remote core pointer used for checking core status
ab5779c6da0aa7 Hari Nagalla 2024-07-02  100   *
ab5779c6da0aa7 Hari Nagalla 2024-07-02  101   * This utility function is invoked by the shutdown sequence to ensure
ab5779c6da0aa7 Hari Nagalla 2024-07-02  102   * the remote core is in wfi, before asserting a reset.
ab5779c6da0aa7 Hari Nagalla 2024-07-02  103   */
ab5779c6da0aa7 Hari Nagalla 2024-07-02  104  
ab5779c6da0aa7 Hari Nagalla 2024-07-02  105  static int is_core_in_wfi(struct k3_m4_rproc *core)
ab5779c6da0aa7 Hari Nagalla 2024-07-02 @106  {
ab5779c6da0aa7 Hari Nagalla 2024-07-02  107  	int ret;
ab5779c6da0aa7 Hari Nagalla 2024-07-02  108  	u64 boot_vec;
ab5779c6da0aa7 Hari Nagalla 2024-07-02  109  	u32 cfg, ctrl, stat;
ab5779c6da0aa7 Hari Nagalla 2024-07-02  110  
ab5779c6da0aa7 Hari Nagalla 2024-07-02  111  	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
ab5779c6da0aa7 Hari Nagalla 2024-07-02  112  
ab5779c6da0aa7 Hari Nagalla 2024-07-02  113  	if (ret < 0)
ab5779c6da0aa7 Hari Nagalla 2024-07-02  114  		return 0;
ab5779c6da0aa7 Hari Nagalla 2024-07-02  115  
ab5779c6da0aa7 Hari Nagalla 2024-07-02  116  	return (stat & PROC_BOOT_STATUS_FLAG_M4_WFI);
ab5779c6da0aa7 Hari Nagalla 2024-07-02  117  }
ab5779c6da0aa7 Hari Nagalla 2024-07-02  118  

:::::: The code at line 95 was first introduced by commit
:::::: acc3573ed94e855c69e7bec2855bc05caebc829d remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem

:::::: TO: Martyn Welch <martyn.welch@collabora.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
