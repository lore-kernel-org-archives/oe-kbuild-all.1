Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8BB7F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683857016; x=1715393016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jfKuYSN4KS4ckj6COk6I0134MPrIREZxq/r/vkiXkl0=;
  b=Nk28BeyD91WSzR+SQUtML9503vnr/tmY10INEU+dp/fZCu7+mCMI094d
   wGUuEkWQPdGVPEw31nPqjoLf5K0wGiMjCnsdbLJh3/tBNSff8s9BP4T9J
   1t3LTPKiFayinRWqeLXNav4U7NhZc79fuAk17VUpQbNSASsB5KebXI6Cw
   oI3L88i8H4r2n7OktJ1mhZfwp7VJ6OEe6lQ1IF47RlXnNSKHenHlOrqgP
   LQXQkTakfH0vzW2vdPYfPsU5Vvx1xp9wMvXUTpODeWze5mSmMEnFxLqkF
   RrpVnZvBLQS2S7jBA+vMYCdoCPte2jTLmU9/qfHFeowmUyaYGT6Pb5kA2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353807746"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353807746"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 19:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824195835"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824195835"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2023 19:03:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxI84-0004PI-38;
	Fri, 12 May 2023 02:03:32 +0000
Date: Fri, 12 May 2023 10:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 23/30] drivers/cxl/core/port.c:1980: warning:
 expecting prototype for cxl_port_get_perf_coordinates(). Prototype was for
 cxl_endpoint_get_perf_coordinates() instead
Message-ID: <202305120930.6k11Br3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 996858467895f703eccabdc4f84188fe2344e230 [23/30] cxl: Add helper function that calculate performance data for downstream ports
config: arc-randconfig-r014-20230511 (https://download.01.org/0day-ci/archive/20230512/202305120930.6k11Br3C-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=996858467895f703eccabdc4f84188fe2344e230
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 996858467895f703eccabdc4f84188fe2344e230
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120930.6k11Br3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/port.c:1980: warning: expecting prototype for cxl_port_get_perf_coordinates(). Prototype was for cxl_endpoint_get_perf_coordinates() instead


vim +1980 drivers/cxl/core/port.c

  1969	
  1970	/**
  1971	 * cxl_port_get_perf_coordinates - Retrieve performance numbers stored in dports
  1972	 *				   of CXL path
  1973	 * @port: endpoint cxl_port
  1974	 * @coord: output performance data
  1975	 *
  1976	 * Return: errno on failure, 0 on success.
  1977	 */
  1978	int cxl_endpoint_get_perf_coordinates(struct cxl_port *port,
  1979					      struct access_coordinate *coord)
> 1980	{
  1981		struct access_coordinate c = {
  1982			.read_bandwidth = UINT_MAX,
  1983			.write_bandwidth = UINT_MAX,
  1984		};
  1985		struct cxl_port *iter = port;
  1986		struct cxl_dport *dport;
  1987		struct pci_dev *pdev;
  1988		unsigned int bw;
  1989	
  1990		if (!is_cxl_endpoint(port))
  1991			return -EINVAL;
  1992	
  1993		dport = iter->parent_dport;
  1994		while (iter && !is_cxl_root(iter)) {
  1995			combine_coordinates(&c, &dport->coord);
  1996			c.write_latency += dport->link_latency;
  1997			c.read_latency += dport->link_latency;
  1998	
  1999			if (dport->genport_coord)
  2000				combine_coordinates(&c, dport->genport_coord);
  2001	
  2002			iter = to_cxl_port(iter->dev.parent);
  2003			dport = iter->parent_dport;
  2004		}
  2005	
  2006		/* Get the calculated PCI paths bandwidth */
  2007		pdev = to_pci_dev(port->uport->parent);
  2008		bw = pcie_bandwidth_available(pdev, NULL, NULL, NULL);
  2009		if (bw == 0)
  2010			return -ENXIO;
  2011		bw /= BITS_PER_BYTE;
  2012	
  2013		c.write_bandwidth = min_t(unsigned int, c.write_bandwidth, bw);
  2014		c.read_bandwidth = min_t(unsigned int, c.read_bandwidth, bw);
  2015	
  2016		*coord = c;
  2017	
  2018		return 0;
  2019	}
  2020	EXPORT_SYMBOL_NS_GPL(cxl_endpoint_get_perf_coordinates, CXL);
  2021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
