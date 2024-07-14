Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7662B3D6A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 01:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720922038; cv=none; b=XkGsuNu3B9Oa5NpyryAE4OBbNOdsGmCz5jCxqL1l8B24haQcpoFb4hpOBpvptfeBqVfRW8TmsSV0uDsvLSkS+l3VAIvBoXnXd1xcXLEx7lFb10xHGyvQAyW9IXfi5/DHr9oOPRiPwkqeaosOz1uUW8Yuw4bezrlmnh/qCwKBLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720922038; c=relaxed/simple;
	bh=Tqob6H167BKC2q1PdbIXy+CJnx2A6/IQ6EVv8a/19Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozlSZelrhIi+y2D3NBUcwSLq3RnyKEb3cxCT4GPde3uoEnUNQOIiPs9W2SKWaQ2FAw79EPhu17Fv0snowPIooVJRI6w5627b7iIMv8BbBUvwn7bf5JMGzoq/OfyhnYtiUylWIunDIdPVUiE6cuEq2+7/DbIXlJKQbGWjUGmY6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfnEo23C; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfnEo23C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720922036; x=1752458036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tqob6H167BKC2q1PdbIXy+CJnx2A6/IQ6EVv8a/19Ks=;
  b=LfnEo23C2LbG18KZQQccgDx4+mcNkreNF74aBISq7oAFbccQaiKoa0Nx
   0PLmNOI/lAZFpGmI2Wi8i8dQK1cpD+k3TrFarNSq9/n/D9yEhYSqAh6YP
   WMWvccA4aHd6MVPMF6X1YzHYwX2eIbtFi4ac1sw0zISSJ7VDnuJkTeP2T
   MvsrgFRqMx9nlxGfqmkpU8gagGi96WtWDwJqVcs0NaTXKGnSJuK1dae9/
   p1KYANdBMTQIPEWYDZ3lj4MCNN/Hygy8UMyy7wVlxWFaED05vPO46PGWu
   i2+l5WqQpm+B9FjcsG0q0yEOfTsxs87v877vGEpEJdmJh+Y4cGaqANTQT
   g==;
X-CSE-ConnectionGUID: jNZJMPZYRp6X5lGAW/S9+A==
X-CSE-MsgGUID: whDzDCkzQIyAgHxIkh4GJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="35873657"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="35873657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 18:53:56 -0700
X-CSE-ConnectionGUID: 4L10kBkNTBiwuEi1ArXI6g==
X-CSE-MsgGUID: 7tqGGvF2QLCQKnvztS0LXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="53832846"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jul 2024 18:53:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSoQy-000cvt-1G;
	Sun, 14 Jul 2024 01:53:52 +0000
Date: Sun, 14 Jul 2024 09:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 30/39]
 drivers/remoteproc/ti_k3_m4_remoteproc.c:100: warning: Function parameter or
 member 'suspend_comp' not described in 'k3_m4_rproc'
Message-ID: <202407140911.3ivARzcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   e7925886029c9eadf1182fa31af4f70ad45b4b35
commit: 4b5be6428b876e9bd42e147b6c3567174b55200a [30/39] remoteproc: k3-m4: Introduce PM suspend/resume handlers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240714/202407140911.3ivARzcZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140911.3ivARzcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140911.3ivARzcZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/ti_k3_m4_remoteproc.c:100: warning: Function parameter or member 'shut_comp' not described in 'k3_m4_rproc'
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:100: warning: Function parameter or member 'suspend_comp' not described in 'k3_m4_rproc'
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:100: warning: Function parameter or member 'pm_notifier' not described in 'k3_m4_rproc'
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:100: warning: Function parameter or member 'suspend_status' not described in 'k3_m4_rproc'
   drivers/remoteproc/ti_k3_m4_remoteproc.c:116: warning: Function parameter or member 'core' not described in 'is_core_in_wfi'
   drivers/remoteproc/ti_k3_m4_remoteproc.c:116: warning: Excess function parameter 'kproc' description in 'is_core_in_wfi'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +100 drivers/remoteproc/ti_k3_m4_remoteproc.c

    65	
    66	/**
    67	 * struct k3_m4_rproc - k3 remote processor driver structure
    68	 * @dev: cached device pointer
    69	 * @rproc: remoteproc device handle
    70	 * @mem: internal memory regions data
    71	 * @num_mems: number of internal memory regions
    72	 * @rmem: reserved memory regions data
    73	 * @num_rmems: number of reserved memory regions
    74	 * @reset: reset control handle
    75	 * @data: pointer to device data
    76	 * @tsp: TI-SCI processor control handle
    77	 * @ti_sci: TI-SCI handle
    78	 * @ti_sci_id: TI-SCI device identifier
    79	 * @mbox: mailbox channel handle
    80	 * @client: mailbox client to request the mailbox channel
    81	 */
    82	struct k3_m4_rproc {
    83		struct device *dev;
    84		struct rproc *rproc;
    85		struct k3_m4_rproc_mem *mem;
    86		int num_mems;
    87		struct k3_m4_rproc_mem *rmem;
    88		int num_rmems;
    89		struct reset_control *reset;
    90		const struct k3_m4_rproc_dev_data *data;
    91		struct ti_sci_proc *tsp;
    92		const struct ti_sci_handle *ti_sci;
    93		u32 ti_sci_id;
    94		struct mbox_chan *mbox;
    95		struct mbox_client client;
    96		struct completion shut_comp;
    97		struct completion suspend_comp;
    98		struct notifier_block pm_notifier;
    99		u32 suspend_status;
 > 100	};
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
