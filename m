Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53005136E0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721303740; cv=none; b=WN9jfczD1IXH6bKdVmXggAMYvarznarzrlLMbUtzHSw4MRS6KjutC4lrTS630OfF57CuTH4tEe33FQPoavhrL3+MHfI1AbJJrfq0chFrKz4Zl0QFrkZz7Ci/DYg+WuvVLi0lvbFKamhFOiQeHYKVwV73NYcs+TookYm377hZAlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721303740; c=relaxed/simple;
	bh=su+Rak191dgpXV4B58HibFyj2mt+B50CMII36hS7e4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hH81lCR9ansJh8H7Pwe88mPu5CaTgJVm/xqjqzpOEDOJ/kUxk11/36dVHtBYq2nNtfOxFKl7zwwIqlAYzcToK5A61Pl67iuibcQS6kY+Nd96/0KpZ8GYENJOy8uo0nPiOMmnV52jiSK3I5f4XUffeECZ6eDj+FoImENSPDRvWWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaonLauD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaonLauD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721303739; x=1752839739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=su+Rak191dgpXV4B58HibFyj2mt+B50CMII36hS7e4w=;
  b=JaonLauD0CZBavEYb56FGoFnCyOQkQbAxneXU2tRSya197hVMALdvJQl
   BbbGowd2yvVtEyZXaZqOQ9iJEPvxPDcVACduK3xbM4h8Eq0npPyZfT0aE
   6VQ3uIosV9ime5CcJ2YhWFWN8xyDVaClX3K1Wja1vqTT5RhIWZ+MEgYVa
   K5QNAayjR/JMl0VnOgoLBWMFVTD8H03fgA1KEOU7VsiCEDX8KmNBfOwH7
   jgUqJ3w5+6UpnaZZnqt6HZ+UkpVytvukH4iNFSD95m3tVntT+AW0U9+5H
   c4B9RKmaOvfZRtLHzOU1sX414dQ8ovsL+7xfVmWUv8mnS/p1zozpLZFzP
   Q==;
X-CSE-ConnectionGUID: jAhyZKtOTsCf0R8NdmcmqA==
X-CSE-MsgGUID: yoJcBjXLTo2x/jPTej2xgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="19001409"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="19001409"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:55:38 -0700
X-CSE-ConnectionGUID: hmqLMjdWRCyf5OnuVxIT3g==
X-CSE-MsgGUID: Kkh9WkgLRJKO9TJr3tkVSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="50495920"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jul 2024 04:55:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUPjS-000hCy-1Y;
	Thu, 18 Jul 2024 11:55:34 +0000
Date: Thu, 18 Jul 2024 19:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [khilman-omap:lpm-v6.10/constraints 11/15]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:117: warning: Function parameter or
 struct member 'qos_req' not described in 'k3_r5_cluster'
Message-ID: <202407181914.BwEea9F5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints
head:   e2d1fd7e6367d7aa0db506b7d3794eb61553d29c
commit: ce0f95516f4551c13b110fa810b0694c94cbd5f5 [11/15] remoteproc: k3_r5: add/expose resume latency constraint
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240718/202407181914.BwEea9F5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181914.BwEea9F5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181914.BwEea9F5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_r5_remoteproc.c:117: warning: Function parameter or struct member 'qos_req' not described in 'k3_r5_cluster'


vim +117 drivers/remoteproc/ti_k3_r5_remoteproc.c

7508ea19b20da8 Suman Anna    2020-11-18  101  
6dedbd1d544389 Suman Anna    2020-10-02  102  /**
6dedbd1d544389 Suman Anna    2020-10-02  103   * struct k3_r5_cluster - K3 R5F Cluster structure
6dedbd1d544389 Suman Anna    2020-10-02  104   * @dev: cached device pointer
6dedbd1d544389 Suman Anna    2020-10-02  105   * @mode: Mode to configure the Cluster - Split or LockStep
6dedbd1d544389 Suman Anna    2020-10-02  106   * @cores: list of R5 cores within the cluster
61f6f68447aba0 Apurva Nandan 2024-04-30  107   * @core_transition: wait queue to sync core state changes
7508ea19b20da8 Suman Anna    2020-11-18  108   * @soc_data: SoC-specific feature data for a R5FSS
6dedbd1d544389 Suman Anna    2020-10-02  109   */
6dedbd1d544389 Suman Anna    2020-10-02  110  struct k3_r5_cluster {
6dedbd1d544389 Suman Anna    2020-10-02  111  	struct device *dev;
6dedbd1d544389 Suman Anna    2020-10-02  112  	enum cluster_mode mode;
6dedbd1d544389 Suman Anna    2020-10-02  113  	struct list_head cores;
61f6f68447aba0 Apurva Nandan 2024-04-30  114  	wait_queue_head_t core_transition;
7508ea19b20da8 Suman Anna    2020-11-18  115  	const struct k3_r5_soc_data *soc_data;
ce0f95516f4551 Kevin Hilman  2024-07-17  116  	struct dev_pm_qos_request qos_req;
6dedbd1d544389 Suman Anna    2020-10-02 @117  };
6dedbd1d544389 Suman Anna    2020-10-02  118  

:::::: The code at line 117 was first introduced by commit
:::::: 6dedbd1d544389d6ab1727423348572a11e9df5d remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
