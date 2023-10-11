Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995E3D7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1ifZO/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696999502; x=1728535502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQg4C4OvIMpDzkiOF8NbsjIS6+bpHOFcQcjlw1g+aOk=;
  b=J1ifZO/TZgjKfPGwVruaGU4ytTGBZ1Har7MIBxvFFHw6FRHoIaDfmBtt
   pTFqbDnU/QGFkllSCAc8C6A85Y0hq+HgNp3oBJQWcw3dmqaLeAZ0UwDJz
   BY6neV3BHdLszEwltuvbQ8TcjGSDnvPirmgKCN0T+Xn5mVzrdp2ejZF6D
   uVltuAQpi2XRvpTJSXIpIHk/Wkb/TgLcRiBvlerDaOFR2oNi0aLYk9p6z
   eTIBXI4WZ51IW4w4Lk2gaj5TFJ7ZGErBDyQPKsOXmQIN07djAo9kNRLih
   LD6GX2DNa/IJyDlhqepcnHnR3prPJqHGmw0hLDMFi5Axd1f2aL490KLVP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="369640210"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="369640210"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1000960318"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="1000960318"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2023 21:44:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqR5d-0001ja-1H;
	Wed, 11 Oct 2023 04:44:57 +0000
Date: Wed, 11 Oct 2023 12:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-qtg 17/23] drivers/cxl/core/pci.c:848: warning: Function
 parameter or member 'pdev' not described in 'cxl_pci_get_latency'
Message-ID: <202310111258.Hkd1mKNu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   22f6e78423f99447c27187f6fb88be594fd4d97e
commit: 9e75b380fd8c75170327f8be08808bd163e7a1b0 [17/23] cxl: Calculate and store PCI link latency for the downstream ports
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231011/202310111258.Hkd1mKNu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111258.Hkd1mKNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111258.Hkd1mKNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/pci.c:848: warning: Function parameter or member 'pdev' not described in 'cxl_pci_get_latency'


vim +848 drivers/cxl/core/pci.c

   831	
   832	/**
   833	 * cxl_pci_get_latency - calculate the link latency for the PCIe link
   834	 * @pdev - PCI device
   835	 *
   836	 * return: calculated latency or 0 for no latency
   837	 *
   838	 * CXL Memory Device SW Guide v1.0 2.11.4 Link latency calculation
   839	 * Link latency = LinkPropagationLatency + FlitLatency + RetimerLatency
   840	 * LinkProgationLatency is negligible, so 0 will be used
   841	 * RetimerLatency is assumed to be negligible and 0 will be used
   842	 * FlitLatency = FlitSize / LinkBandwidth
   843	 * FlitSize is defined by spec. CXL rev3.0 4.2.1.
   844	 * 68B flit is used up to 32GT/s. >32GT/s, 256B flit size is used.
   845	 * The FlitLatency is converted to picoseconds.
   846	 */
   847	long cxl_pci_get_latency(struct pci_dev *pdev)
 > 848	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
