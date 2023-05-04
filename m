Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986F9471
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683242036; x=1714778036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8VPqVyw+7a+eBhsRDJHff8k2gvWmPt9dV+mdOWXYug=;
  b=TiTnxPIEj/pb7XsR0M24ExDfbP/eF5Egr7v6574aYUCUytldXnqi01mm
   qDB0s+D3WAw14RVvCrE/LqhoLGQOdqOUro37Ujyzg2aVBIKffYZMIoK04
   b74QMCF6XsXaWkDUfTN13thaDp/ENGef1hvn9OEV+94f+3WK0GE4/WIaS
   A9IWfSSKQk7hF0CIXPrFAUzSO7LnK9WEcHBi/ELGwvrujqJXzshs9hZwV
   CrD+Mzi/U3hKl2xnPb8ZLp8FBByWlwlMhAcOkA+7BYJK08WbCVJpkMUj2
   0wxgSLxcBwDoqT5bli5DnkKQlju4lIQe/9IExZfStJknfXdTkhOKjZXQg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377153424"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="377153424"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 16:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786789529"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="786789529"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 16:13:55 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pui94-0000Bs-1K;
	Thu, 04 May 2023 23:13:54 +0000
Date: Fri, 5 May 2023 07:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 21/28] drivers/cxl/core/port.c:1954:6: warning: no
 previous prototype for 'combine_coordinates'
Message-ID: <202305050735.96PeJzZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: 46b815fc52e80858ee81a840739850c6bd9bc78d [21/28] cxl: Add helper function that calculate performance data for downstream ports
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230505/202305050735.96PeJzZO-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=46b815fc52e80858ee81a840739850c6bd9bc78d
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 46b815fc52e80858ee81a840739850c6bd9bc78d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050735.96PeJzZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/port.c:1954:6: warning: no previous prototype for 'combine_coordinates' [-Wmissing-prototypes]
    1954 | void combine_coordinates(struct access_coordinate *c1, struct access_coordinate *c2)
         |      ^~~~~~~~~~~~~~~~~~~
--
>> drivers/cxl/core/port.c:1979: warning: expecting prototype for cxl_port_get_perf_coordinates(). Prototype was for cxl_endpoint_get_perf_coordinates() instead


vim +/combine_coordinates +1954 drivers/cxl/core/port.c

  1953	
> 1954	void combine_coordinates(struct access_coordinate *c1, struct access_coordinate *c2)
  1955	{
  1956			if (c2->write_bandwidth)
  1957				c1->write_bandwidth = min_t(unsigned int,
  1958							    c1->write_bandwidth,
  1959							    c2->write_bandwidth);
  1960			c1->write_latency += c2->write_latency;
  1961	
  1962			if (c2->read_bandwidth)
  1963				c1->read_bandwidth = min_t(unsigned int,
  1964							   c1->read_bandwidth,
  1965							   c2->read_bandwidth);
  1966			c1->read_latency += c2->read_latency;
  1967	}
  1968	
  1969	/**
  1970	 * cxl_port_get_perf_coordinates - Retrieve performance numbers stored in dports
  1971	 *				   of CXL path
  1972	 * @port: endpoint cxl_port
  1973	 * @coord: output performance data
  1974	 *
  1975	 * Return: errno on failure, 0 on success.
  1976	 */
  1977	int cxl_endpoint_get_perf_coordinates(struct cxl_port *port,
  1978					      struct access_coordinate *coord)
> 1979	{
  1980		struct access_coordinate c = {
  1981			.read_bandwidth = UINT_MAX,
  1982			.write_bandwidth = UINT_MAX,
  1983		};
  1984		struct cxl_port *iter = port;
  1985		struct cxl_dport *dport;
  1986		struct pci_dev *pdev;
  1987		unsigned int bw;
  1988	
  1989		if (!is_cxl_endpoint(port))
  1990			return -EINVAL;
  1991	
  1992		dport = iter->parent_dport;
  1993		while (iter && !is_cxl_root(iter)) {
  1994			combine_coordinates(&c, &dport->coord);
  1995			c.write_latency += dport->link_latency;
  1996			c.read_latency += dport->link_latency;
  1997	
  1998			if (dport->genport_coord)
  1999				combine_coordinates(&c, dport->genport_coord);
  2000	
  2001			iter = to_cxl_port(iter->dev.parent);
  2002			dport = iter->parent_dport;
  2003		}
  2004	
  2005		/* Get the calculated PCI paths bandwidth */
  2006		pdev = to_pci_dev(port->uport->parent);
  2007		bw = pcie_bandwidth_available(pdev, NULL, NULL, NULL);
  2008		if (bw == 0)
  2009			return -ENXIO;
  2010		bw /= BITS_PER_BYTE;
  2011	
  2012		c.write_bandwidth = min_t(unsigned int, c.write_bandwidth, bw);
  2013		c.read_bandwidth = min_t(unsigned int, c.read_bandwidth, bw);
  2014	
  2015		*coord = c;
  2016	
  2017		return 0;
  2018	}
  2019	EXPORT_SYMBOL_NS_GPL(cxl_endpoint_get_perf_coordinates, CXL);
  2020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
