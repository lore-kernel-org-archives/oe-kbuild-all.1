Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F81137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 03:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711165549; cv=none; b=evpiOwoR6ZT7+bWf/+ZhF2WJ006x+6cwcozsFq0YbGvbJCiAGzHVbzHwJCBKGzZ0LIXMty33/KoGSe1toTV35G3i21Oka1LXwtM/w53H2jfvfeepqOXo9Ol4R7OsbbH0q1iiA67CO5Q46paK0yZEbeFDNa7iQZXsHccCCCFrkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711165549; c=relaxed/simple;
	bh=pZrB6A+eqjSlasOwhQojn3RRB6jEfzVRTqfeUYfDkew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lt8C8L3/KQp+xeDY1zr8y1qRKbIUyTN0WVG3O+ZiY6Xk6FU/AgZEgR7yuCvat7V5WaeYpcNqDXPnOXO19FwqN8z2FkfZ+frDsviaPVelizDlGy07Ua5KAXIGrmyV9OgRk7O/6PyEb49O2wYwcYzjlyU3V25tLYtKZqwKNMi07Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwBM1Muo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwBM1Muo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711165549; x=1742701549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZrB6A+eqjSlasOwhQojn3RRB6jEfzVRTqfeUYfDkew=;
  b=IwBM1MuoXtbx3FXNf/NggFzTR84R2FPY/xNlaVpwlC3pO7BHCd9sADma
   C0HwEsr+xyzidN9OQJcOZjTTPCG0tmKlm6JjtBX3do/NRpllvGilhw0AU
   PGYGETtgOdU+GAy0T68HJ2mEbkHl2oPgpBDNVhPFbdushIeYR0S1tVuig
   HewARXP6aym1tGzX6kRYADG5AkpWU9MEuT65DCYexF9M1atNAQygLo1T6
   fDjpVGymmNBIizUKN7b8XtdKohcDnXFUGzY6lQcodUBzqxXAh0GpofE65
   ts9uIV3YMFUX43A2A8Qrh8vI4bzH89Bzfogm/ObWgCdgxKWajIXjYiyOt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6351653"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6351653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 20:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="19653885"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2024 20:45:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnsKF-000KqJ-1h;
	Sat, 23 Mar 2024 03:45:43 +0000
Date: Sat, 23 Mar 2024 11:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, nebula_matrix <open@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21053/30000]
 drivers/net/ethernet/nebula-matrix/m1600/debug.c:564:39: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 9
Message-ID: <202403231156.PXmnaRGK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   459341c4b4845b283c7a884e6a0dc4bd8cdb89e6
commit: 01e6e2075c432fde7fb5a66202b41bbd469de620 [21053/30000] Net: m1600: Add m1600-driver for nebula-matrix m1600 series smart NIC.
config: x86_64-randconfig-075-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231156.PXmnaRGK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231156.PXmnaRGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231156.PXmnaRGK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/m1600/debug.c:18:0:
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:131:19: warning: 'nbl_priv_flags' defined but not used [-Wunused-const-variable=]
    static const char nbl_priv_flags[][ETH_GSTRING_LEN] = {
                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:116:19: warning: 'nbl_gstrings_test' defined but not used [-Wunused-const-variable=]
    static const char nbl_gstrings_test[][ETH_GSTRING_LEN] = {
                      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:57:39: warning: 'nbl_gstrings_stats' defined but not used [-Wunused-const-variable=]
    static const struct nbl_ethtool_stats nbl_gstrings_stats[] = {
                                          ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/ethtool.h:13:18: warning: 'nbl_regs_dump_list' defined but not used [-Wunused-const-variable=]
    static const u32 nbl_regs_dump_list[] = {
                     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/debug.c: In function 'nbl_debugfs_hw_init':
>> drivers/net/ethernet/nebula-matrix/m1600/debug.c:564:39: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 9 [-Wformat-truncation=]
       snprintf(buf, sizeof(buf), "txring-%d", i);
                                          ^~
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:564:31: note: directive argument in the range [0, 2147483646]
       snprintf(buf, sizeof(buf), "txring-%d", i);
                                  ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:564:4: note: 'snprintf' output between 9 and 18 bytes into a destination of size 16
       snprintf(buf, sizeof(buf), "txring-%d", i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:573:39: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 9 [-Wformat-truncation=]
       snprintf(buf, sizeof(buf), "rxring-%d", i);
                                          ^~
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:573:31: note: directive argument in the range [0, 2147483646]
       snprintf(buf, sizeof(buf), "rxring-%d", i);
                                  ^~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:573:4: note: 'snprintf' output between 9 and 18 bytes into a destination of size 16
       snprintf(buf, sizeof(buf), "rxring-%d", i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +564 drivers/net/ethernet/nebula-matrix/m1600/debug.c

   534	
   535	/* function init and cleanup */
   536	void nbl_debugfs_hw_init(struct nbl_hw *hw)
   537	{
   538		int i;
   539		char buf[16];
   540		struct nbl_adapter *adapter;
   541	
   542		adapter = (struct nbl_adapter *)hw->back;
   543	
   544		if (!nblx4_debug_root)
   545			return;
   546	
   547		snprintf(buf, sizeof(buf), "%04x:%02x:%02x.%x",
   548			 pci_domain_nr(adapter->pdev->bus), hw->bus, hw->devid, hw->function);
   549		hw->nbl_debug_root = debugfs_create_dir(buf, nblx4_debug_root);
   550	
   551		if (is_af(hw)) {
   552			debugfs_create_file("dvn", 0444,
   553					    hw->nbl_debug_root, hw, &dvn_fops);
   554			debugfs_create_file("uvn", 0644,
   555					    hw->nbl_debug_root, hw, &uvn_fops);
   556			debugfs_create_file("nic-statistics", 0444,
   557					    hw->nbl_debug_root, hw, &nic_statistics_fops);
   558			debugfs_create_file("tables", 0644,
   559					    hw->nbl_debug_root, hw, &tables_fops);
   560		}
   561	
   562		if (adapter->num_txq) {
   563			for (i = 0; i < adapter->num_txq; i++) {
 > 564				snprintf(buf, sizeof(buf), "txring-%d", i);
   565				debugfs_create_file(buf, 0444,
   566						    hw->nbl_debug_root,
   567						    adapter->tx_rings[i], &ring_fops);
   568			}
   569		}
   570	
   571		if (adapter->num_rxq) {
   572			for (i = 0; i < adapter->num_rxq; i++) {
   573				snprintf(buf, sizeof(buf), "rxring-%d", i);
   574				debugfs_create_file(buf, 0444,
   575						    hw->nbl_debug_root,
   576						    adapter->rx_rings[i], &ring_fops);
   577			}
   578		}
   579	
   580		debugfs_create_file("bar", 0444, hw->nbl_debug_root, hw, &bar_fops);
   581	
   582		hw->debugfs_reg_bar = 0;
   583		hw->debugfs_reg_offset = 0;
   584		hw->debugfs_reg_length = 8;
   585		debugfs_create_file("reg", 0444, hw->nbl_debug_root, hw, &reg_fops);
   586	}
   587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
