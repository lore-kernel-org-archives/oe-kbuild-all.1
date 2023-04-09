Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456571FDE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 23:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681082098; x=1712618098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODElzSrg8IYqzUCwzFYjpqmoMrrOrfWlrVQAOMjIPxY=;
  b=CDBFFgygjhGXpOfMKRYGsFy5gvEzvJ2obEYjqazNwWORddN2MbcdJccB
   VHwXvaLmLKTQsTHdES7GBPS2o6ZlL9QLK2rawoCih7nRSExDQeb4l+t3K
   Eldz72kXGLusb4NKlVGPqC1LIKxhs3Se2BMXSPFt4tSTL/k5F6120DFqB
   x4VHJ3lg7ZHhEXKkvrR8owJSFtPqYf4AENpgmIY6T1RdzF1bG18L2CjqD
   mSW7dCghHct5ep4/zAYLLiTb6GZG5t2bWpNZomOarWr7QD8pPYoF4mC3G
   npYCqQ9QWy7X7txwImavXOUN4pzBUmdNgVtLHtweggc3JMRATR9VuYgfq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406081905"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="406081905"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 16:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="799315626"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="799315626"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2023 16:14:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pleFL-000UqN-0y;
	Sun, 09 Apr 2023 23:14:55 +0000
Date: Mon, 10 Apr 2023 07:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 12/23] drivers/cxl/core/port.c:2067
 cxl_port_get_downstream_qos() warn: unsigned 'lat' is never less than zero.
Message-ID: <202304100756.5MqemjfA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   5c305908f705279678135d3adf13cf2165c0609c
commit: 064b21698b2e5653b5547c639a895141a402edd4 [12/23] cxl: Add helper function that calculate QoS values for PCI path
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230410/202304100756.5MqemjfA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304100756.5MqemjfA-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/port.c:2067 cxl_port_get_downstream_qos() warn: unsigned 'lat' is never less than zero.

Old smatch warnings:
drivers/cxl/core/port.c:344 cxl_root_decoder_visible() error: we previously assumed 'a' could be null (see line 340)

vim +/lat +2067 drivers/cxl/core/port.c

  2028	
  2029	/**
  2030	 * cxl_port_get_downstream_qos - retrieve QoS data for PCIE downstream path
  2031	 * @port: endpoint cxl_port
  2032	 * @bandwidth: writeback value for min bandwidth
  2033	 * @latency: writeback value for total latency
  2034	 *
  2035	 * Return: Errno on failure, 0 on success.
  2036	 */
  2037	int cxl_port_get_downstream_qos(struct cxl_port *port, u64 *bandwidth,
  2038					u64 *latency)
  2039	{
  2040		u64 min_bw = ULONG_MAX;
  2041		struct pci_dev *pdev;
  2042		struct cxl_port *p;
  2043		struct device *dev;
  2044		u64 total_lat = 0;
  2045		int devices = 0;
  2046		u64 lat;
  2047	
  2048		/* Grab the device that is the PCI device for CXL memdev */
  2049		dev = port->uport->parent;
  2050		/* Skip if it's not PCI, most likely a cxl_test device */
  2051		if (!dev_is_pci(dev))
  2052			return 0;
  2053	
  2054		pdev = to_pci_dev(dev);
  2055		min_bw = pcie_bandwidth_available(pdev, NULL, NULL, NULL);
  2056		if (min_bw == 0)
  2057			return -ENXIO;
  2058	
  2059		/* convert to MB/s from Mb/s */
  2060		min_bw >>= 3;
  2061	
  2062		p = port;
  2063		do {
  2064			struct cxl_dport *dport;
  2065	
  2066			lat = cxl_pci_get_latency(pdev);
> 2067			if (lat < 0)
  2068				return lat;
  2069	
  2070			total_lat += lat;
  2071			devices++;
  2072	
  2073			dport = p->parent_dport;
  2074			if (!dport)
  2075				break;
  2076	
  2077			p = dport->port;
  2078			dev = p->uport;
  2079			if (!dev_is_pci(dev))
  2080				break;
  2081			pdev = to_pci_dev(dev);
  2082		} while (1);
  2083	
  2084		*bandwidth = min_bw;
  2085		*latency = total_lat;
  2086		return 0;
  2087	}
  2088	EXPORT_SYMBOL_NS_GPL(cxl_port_get_downstream_qos, CXL);
  2089	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
