Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC96446B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709192213; cv=none; b=Bg1g2/eMjlsDQWRUR5YkfTfo4oCMBEpEoZUl3hc1+VoKU+qE21zaz7vzsKQs4cxn/19s+J/CqFM2JYZX87rtjVe2QW5qHudenyir5hdZTsnzxCdDHyf4U+nLITYQfsTTPqafjf5jo8TD21wu5n4lCFUhkezJRCs/Wu1jUE9NbFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709192213; c=relaxed/simple;
	bh=Zw8Am4h7p1e2GYZLDAXPdtpYYQY3Dkrlk1JsPIYoZEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjV5rdLN1Le13kNYjdHAlwnjnp2286JuPazgrw/Na9uT+f+ZBwHqwmYJbNBfrwlK5ZCt+Ak3MrNeWv4CRHmozM2138zkbE6IQ2Rh1iSdRhUBLFEdshwArSXAMxMbtrW5aaANhhE8tMzyMxxjRfXB+CyZiaUeajSqVkdcvexCCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSF8lRU+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSF8lRU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709192212; x=1740728212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zw8Am4h7p1e2GYZLDAXPdtpYYQY3Dkrlk1JsPIYoZEU=;
  b=BSF8lRU+3Vd4z+40O1kuZ7b893vbe1YpCaKLOc27D+hIaN3CGurc6/ev
   H0w03ZW67lbT4+wi2PxQ8M5qp6/JslNsAPmIEZTUYYAWNMV0nwSfSfVxK
   TtldeC7cuL0oyRaJPQG+MwqpoEFg31p1pU/7D+85eaqSAuKJhKDYzsRq9
   oW+KfuBUBiGeQnZlIevMm2LSz5CpEDHbLuvbrItGAJmjnh3h+GIui6KCR
   4IVo4OA2iyXLeiE0vZquKAKqNKO4x1kA3r52/lrLZKqtaGJ8O+85/6WlQ
   Q4K0Q3lRF8ESM2BPlIOBvhpMNikGT9UnnOPTYGn187xtf7BMPnCXZUsqn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3808724"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3808724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 23:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="12348967"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Feb 2024 23:36:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfax0-000CjZ-0d;
	Thu, 29 Feb 2024 07:35:53 +0000
Date: Thu, 29 Feb 2024 15:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Tarak Reddy <tarak.reddy@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 820/860]
 drivers/remoteproc/remoteproc_core.c:2115:33: warning: unused variable
 'cluster_pdev'
Message-ID: <202402291538.rdF9Z9Zp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   a33033bade7432af01ed916b9dd7fc6e484d91b9
commit: f1ceb211db230405be380b337c24e220222e3d3b [820/860] remoteproc: Make rproc_get_by_phandle() work for clusters
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240229/202402291538.rdF9Z9Zp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291538.rdF9Z9Zp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291538.rdF9Z9Zp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/remoteproc_core.c: In function 'rproc_get_by_phandle':
>> drivers/remoteproc/remoteproc_core.c:2115:33: warning: unused variable 'cluster_pdev' [-Wunused-variable]
    2115 |         struct platform_device *cluster_pdev;
         |                                 ^~~~~~~~~~~~


vim +/cluster_pdev +2115 drivers/remoteproc/remoteproc_core.c

d3962a39788551 Mathieu Poirier 2021-03-12  2099  
fec47d863587c2 Dave Gerlach    2015-05-22  2100  /**
fec47d863587c2 Dave Gerlach    2015-05-22  2101   * rproc_get_by_phandle() - find a remote processor by phandle
fec47d863587c2 Dave Gerlach    2015-05-22  2102   * @phandle: phandle to the rproc
fec47d863587c2 Dave Gerlach    2015-05-22  2103   *
fec47d863587c2 Dave Gerlach    2015-05-22  2104   * Finds an rproc handle using the remote processor's phandle, and then
fec47d863587c2 Dave Gerlach    2015-05-22  2105   * return a handle to the rproc.
fec47d863587c2 Dave Gerlach    2015-05-22  2106   *
fec47d863587c2 Dave Gerlach    2015-05-22  2107   * This function increments the remote processor's refcount, so always
fec47d863587c2 Dave Gerlach    2015-05-22  2108   * use rproc_put() to decrement it back once rproc isn't needed anymore.
fec47d863587c2 Dave Gerlach    2015-05-22  2109   *
f2867434002387 Suman Anna      2021-05-19  2110   * Return: rproc handle on success, and NULL on failure
fec47d863587c2 Dave Gerlach    2015-05-22  2111   */
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2112  #ifdef CONFIG_OF
fec47d863587c2 Dave Gerlach    2015-05-22  2113  struct rproc *rproc_get_by_phandle(phandle phandle)
fec47d863587c2 Dave Gerlach    2015-05-22  2114  {
2871aebcdd17ff Ben Levinsky    2023-01-12 @2115  	struct platform_device *cluster_pdev;
fec47d863587c2 Dave Gerlach    2015-05-22  2116  	struct rproc *rproc = NULL, *r;
2871aebcdd17ff Ben Levinsky    2023-01-12  2117  	struct device_driver *driver;
fec47d863587c2 Dave Gerlach    2015-05-22  2118  	struct device_node *np;
fec47d863587c2 Dave Gerlach    2015-05-22  2119  
fec47d863587c2 Dave Gerlach    2015-05-22  2120  	np = of_find_node_by_phandle(phandle);
fec47d863587c2 Dave Gerlach    2015-05-22  2121  	if (!np)
fec47d863587c2 Dave Gerlach    2015-05-22  2122  		return NULL;
fec47d863587c2 Dave Gerlach    2015-05-22  2123  
c0abe2ca3605e4 Bjorn Andersson 2020-03-23  2124  	rcu_read_lock();
c0abe2ca3605e4 Bjorn Andersson 2020-03-23  2125  	list_for_each_entry_rcu(r, &rproc_list, node) {
e63ae3f836e66b ye xingchen     2022-11-17  2126  		if (r->dev.parent && device_match_of_node(r->dev.parent, np)) {
fbb6aacb078285 Bjorn Andersson 2016-10-02  2127  			/* prevent underlying implementation from being removed */
2871aebcdd17ff Ben Levinsky    2023-01-12  2128  
2871aebcdd17ff Ben Levinsky    2023-01-12  2129  			/*
2871aebcdd17ff Ben Levinsky    2023-01-12  2130  			 * If the remoteproc's parent has a driver, the
2871aebcdd17ff Ben Levinsky    2023-01-12  2131  			 * remoteproc is not part of a cluster and we can use
2871aebcdd17ff Ben Levinsky    2023-01-12  2132  			 * that driver.
2871aebcdd17ff Ben Levinsky    2023-01-12  2133  			 */
2871aebcdd17ff Ben Levinsky    2023-01-12  2134  			driver = r->dev.parent->driver;
2871aebcdd17ff Ben Levinsky    2023-01-12  2135  
2871aebcdd17ff Ben Levinsky    2023-01-12  2136  			/*
2871aebcdd17ff Ben Levinsky    2023-01-12  2137  			 * If the remoteproc's parent does not have a driver,
2871aebcdd17ff Ben Levinsky    2023-01-12  2138  			 * look for the driver associated with the cluster.
2871aebcdd17ff Ben Levinsky    2023-01-12  2139  			 */
2871aebcdd17ff Ben Levinsky    2023-01-12  2140  			if (!driver) {
f1ceb211db2304 Mathieu Poirier 2024-02-08  2141  				if (r->dev.parent->parent)
f1ceb211db2304 Mathieu Poirier 2024-02-08  2142  					driver = r->dev.parent->parent->driver;
f1ceb211db2304 Mathieu Poirier 2024-02-08  2143  				if (!driver)
2871aebcdd17ff Ben Levinsky    2023-01-12  2144  					break;
2871aebcdd17ff Ben Levinsky    2023-01-12  2145  			}
2871aebcdd17ff Ben Levinsky    2023-01-12  2146  
2871aebcdd17ff Ben Levinsky    2023-01-12  2147  			if (!try_module_get(driver->owner)) {
fbb6aacb078285 Bjorn Andersson 2016-10-02  2148  				dev_err(&r->dev, "can't get owner\n");
fbb6aacb078285 Bjorn Andersson 2016-10-02  2149  				break;
fbb6aacb078285 Bjorn Andersson 2016-10-02  2150  			}
fbb6aacb078285 Bjorn Andersson 2016-10-02  2151  
fec47d863587c2 Dave Gerlach    2015-05-22  2152  			rproc = r;
fec47d863587c2 Dave Gerlach    2015-05-22  2153  			get_device(&rproc->dev);
fec47d863587c2 Dave Gerlach    2015-05-22  2154  			break;
fec47d863587c2 Dave Gerlach    2015-05-22  2155  		}
fec47d863587c2 Dave Gerlach    2015-05-22  2156  	}
c0abe2ca3605e4 Bjorn Andersson 2020-03-23  2157  	rcu_read_unlock();
fec47d863587c2 Dave Gerlach    2015-05-22  2158  
fec47d863587c2 Dave Gerlach    2015-05-22  2159  	of_node_put(np);
fec47d863587c2 Dave Gerlach    2015-05-22  2160  
fec47d863587c2 Dave Gerlach    2015-05-22  2161  	return rproc;
fec47d863587c2 Dave Gerlach    2015-05-22  2162  }
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2163  #else
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2164  struct rproc *rproc_get_by_phandle(phandle phandle)
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2165  {
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2166  	return NULL;
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2167  }
8de3dbd0895beb Ohad Ben-Cohen  2015-06-18  2168  #endif
fec47d863587c2 Dave Gerlach    2015-05-22  2169  EXPORT_SYMBOL(rproc_get_by_phandle);
fec47d863587c2 Dave Gerlach    2015-05-22  2170  

:::::: The code at line 2115 was first introduced by commit
:::::: 2871aebcdd17ffd75a907f6de0cf62aa544bbb6b remoteproc: Make rproc_get_by_phandle() work for clusters

:::::: TO: Ben Levinsky <ben.levinsky@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
