Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67DF51B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720936506; cv=none; b=iz1fsrZA5JQ5lMgu36+VOlATddZj7kmVCZ06d9EotsFjpa6sf4roMOR3Abw4YpEwg6ha8uS3GXAHR3bI+OMcBhPekRs89hpXyUA2gzBwS5WIwfcybFAf+lbWOEs2wCZGcF71sNE2/h74hoJgRwDAIdA+hxUWOWxvhtj96u23QbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720936506; c=relaxed/simple;
	bh=rkqoIA4i/Ekv6x2dk3+91ayCVSRgkGT3fmKOmzspzm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pp2t8W+oTPvpruwdGQe4/k6n+iQFDszSbp0pPwLMpNwOT3Y4JYeyrZ3Sw+nydvDJZOxyUWHLFnqXIHF3qjz+io0gb+uKRLFSXivzBf98cxgDql5izee3SGTK0i5tEPtLiDhY/ariqGhsFurFC/qDqqO5iHiKOMVyRnUHbR+wKnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU2Eagg+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU2Eagg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720936505; x=1752472505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkqoIA4i/Ekv6x2dk3+91ayCVSRgkGT3fmKOmzspzm4=;
  b=PU2Eagg+UDcW3OTR0HAsyeewyRZkYc1mVY7d7NrJStKOa58D+sHPNsLp
   19lUUN26bERp9mWH4VmO25Pdwc76+/Dj3jLzY0R/amchM9Zqg1ahmCevy
   unmCpzGbt6cdx+CbacZKggU5xIl2rC4WttQ5XqoRtS2GywiDq+avYagGn
   ulgT/esvl86Lq9VieH4+L7spqUF8A3x3FzBoiOJOr27h3Xrgk4IENBvD4
   G6ZXE7YfXHvTSs8hCiDC9FUZ0xYFF2iZmPLWFkByRWF65fIPDkL6lqLSj
   f/jlG1pYsvKHxlTYGTjFuzZeYRH7im3hlMdjOpZ4TCvvIKrWj4Y+gGMx9
   A==;
X-CSE-ConnectionGUID: eT7KrLJdTfqXWVpof7/+9w==
X-CSE-MsgGUID: linj/hE5R1eh02BZmTmfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29014387"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="29014387"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 22:55:04 -0700
X-CSE-ConnectionGUID: E58PUJNhRzimkoV5NnSwSw==
X-CSE-MsgGUID: 82On5IKBRw2cWJhyanYN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="54484866"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jul 2024 22:55:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSsCK-000d8c-28;
	Sun, 14 Jul 2024 05:55:00 +0000
Date: Sun, 14 Jul 2024 13:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 29/39]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:187: warning: Function parameter or
 member 'suspend_status' not described in 'k3_r5_rproc'
Message-ID: <202407141310.b35zEmIz-lkp@intel.com>
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
commit: 1dc201a1afb1fbf1fc5491706cfce40ed6396391 [29/39] remoteproc: k3-r5: Introduce PM suspend/resume handlers
config: arm64-randconfig-001-20240714 (https://download.01.org/0day-ci/archive/20240714/202407141310.b35zEmIz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141310.b35zEmIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141310.b35zEmIz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/ti_k3_r5_remoteproc.c:125: warning: Function parameter or member 'qos_req' not described in 'k3_r5_cluster'
   drivers/remoteproc/ti_k3_r5_remoteproc.c:187: warning: Function parameter or member 'shut_comp' not described in 'k3_r5_rproc'
   drivers/remoteproc/ti_k3_r5_remoteproc.c:187: warning: Function parameter or member 'suspend_comp' not described in 'k3_r5_rproc'
   drivers/remoteproc/ti_k3_r5_remoteproc.c:187: warning: Function parameter or member 'pm_notifier' not described in 'k3_r5_rproc'
>> drivers/remoteproc/ti_k3_r5_remoteproc.c:187: warning: Function parameter or member 'suspend_status' not described in 'k3_r5_rproc'


vim +187 drivers/remoteproc/ti_k3_r5_remoteproc.c

6dedbd1d544389 Suman Anna   2020-10-02  162  
6dedbd1d544389 Suman Anna   2020-10-02  163  /**
6dedbd1d544389 Suman Anna   2020-10-02  164   * struct k3_r5_rproc - K3 remote processor state
6dedbd1d544389 Suman Anna   2020-10-02  165   * @dev: cached device pointer
6dedbd1d544389 Suman Anna   2020-10-02  166   * @cluster: cached pointer to parent cluster structure
6dedbd1d544389 Suman Anna   2020-10-02  167   * @mbox: mailbox channel handle
6dedbd1d544389 Suman Anna   2020-10-02  168   * @client: mailbox client to request the mailbox channel
6dedbd1d544389 Suman Anna   2020-10-02  169   * @rproc: rproc handle
6dedbd1d544389 Suman Anna   2020-10-02  170   * @core: cached pointer to r5 core structure being used
6dedbd1d544389 Suman Anna   2020-10-02  171   * @rmem: reserved memory regions data
6dedbd1d544389 Suman Anna   2020-10-02  172   * @num_rmems: number of reserved memory regions
6dedbd1d544389 Suman Anna   2020-10-02  173   */
6dedbd1d544389 Suman Anna   2020-10-02  174  struct k3_r5_rproc {
6dedbd1d544389 Suman Anna   2020-10-02  175  	struct device *dev;
6dedbd1d544389 Suman Anna   2020-10-02  176  	struct k3_r5_cluster *cluster;
6dedbd1d544389 Suman Anna   2020-10-02  177  	struct mbox_chan *mbox;
6dedbd1d544389 Suman Anna   2020-10-02  178  	struct mbox_client client;
6dedbd1d544389 Suman Anna   2020-10-02  179  	struct rproc *rproc;
6dedbd1d544389 Suman Anna   2020-10-02  180  	struct k3_r5_core *core;
6dedbd1d544389 Suman Anna   2020-10-02  181  	struct k3_r5_mem *rmem;
6dedbd1d544389 Suman Anna   2020-10-02  182  	int num_rmems;
7aa5007e280246 Hari Nagalla 2024-07-02  183  	struct completion shut_comp;
1dc201a1afb1fb Hari Nagalla 2024-07-11  184  	struct completion suspend_comp;
1dc201a1afb1fb Hari Nagalla 2024-07-11  185  	struct notifier_block pm_notifier;
1dc201a1afb1fb Hari Nagalla 2024-07-11  186  	u32 suspend_status;
6dedbd1d544389 Suman Anna   2020-10-02 @187  };
6dedbd1d544389 Suman Anna   2020-10-02  188  

:::::: The code at line 187 was first introduced by commit
:::::: 6dedbd1d544389d6ab1727423348572a11e9df5d remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
