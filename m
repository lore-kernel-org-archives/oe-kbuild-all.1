Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB9B18E00
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRBilzOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702155137; x=1733691137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7v25B/RSbwNMG4ZUSFw88YUpmmBfXbEFy0RxnBNYMjA=;
  b=dRBilzOVq6vDAAI4icRwp5fa/HeIMVm5IQTTwOUvfy63VDvZhq+qVRQ1
   5JX/dVyjta9BCohklI3P9nBNTBE/WQLuRcNer7P2CVwRDTLua6p0rtem5
   TEOq/09KaEf6iro1jCCA8oFjYEFey5+DVGDWlLnX0Lw4yPELl1RbB7Fff
   aMy9WvweUpaj/2wpFtpMEo2kPvDCYC82i4JFlPai8Fi9i0N/rMD2j3iyz
   gmdrh/BP7bsoUl/rR6AUHvH1N0ngdyMkEYVRX51q9X9XTU+LAzQyekXfU
   TVh5LhkLRGgcbWH0QHpNUVVvFGjJJx8sSMdpwuMC2a5Rq+aYjVehXf7Xe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="480718239"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="480718239"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 12:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801482509"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="801482509"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2023 12:52:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC4J2-000Fvo-0c;
	Sat, 09 Dec 2023 20:52:12 +0000
Date: Sun, 10 Dec 2023 04:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 21/23] htmldocs: ./drivers/cxl/cxl.h:533:
 warning: Function parameter or member 'coord' not described in 'cxl_region'
Message-ID: <202312100447.ZVOFAHsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   d097ef73f93c1f0d8098ecc5bbaf396ce09c75e2
commit: 6627963c7efe787c713aecfb6eb7fc3fe805dbca [21/23] cxl/region: Calculate performance data for a region
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100447.ZVOFAHsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100447.ZVOFAHsJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/cxl/cxl.h:533: warning: Function parameter or member 'coord' not described in 'cxl_region'

vim +533 ./drivers/cxl/cxl.h

a32320b71f085f Dan Williams 2023-02-10  511  
779dd20cfb56c5 Ben Widawsky 2021-06-08  512  /**
779dd20cfb56c5 Ben Widawsky 2021-06-08  513   * struct cxl_region - CXL region
779dd20cfb56c5 Ben Widawsky 2021-06-08  514   * @dev: This region's device
779dd20cfb56c5 Ben Widawsky 2021-06-08  515   * @id: This region's id. Id is globally unique across all regions
779dd20cfb56c5 Ben Widawsky 2021-06-08  516   * @mode: Endpoint decoder allocation / access mode
779dd20cfb56c5 Ben Widawsky 2021-06-08  517   * @type: Endpoint decoder target type
f17b558d666310 Dan Williams 2022-12-01  518   * @cxl_nvb: nvdimm bridge for coordinating @cxlr_pmem setup / shutdown
f17b558d666310 Dan Williams 2022-12-01  519   * @cxlr_pmem: (for pmem regions) cached copy of the nvdimm bridge
d18bc74aced65e Dan Williams 2022-12-01  520   * @flags: Region state flags
dd5ba0ebbdc414 Ben Widawsky 2021-05-27  521   * @params: active + config params for the region
779dd20cfb56c5 Ben Widawsky 2021-06-08  522   */
779dd20cfb56c5 Ben Widawsky 2021-06-08  523  struct cxl_region {
779dd20cfb56c5 Ben Widawsky 2021-06-08  524  	struct device dev;
779dd20cfb56c5 Ben Widawsky 2021-06-08  525  	int id;
779dd20cfb56c5 Ben Widawsky 2021-06-08  526  	enum cxl_decoder_mode mode;
779dd20cfb56c5 Ben Widawsky 2021-06-08  527  	enum cxl_decoder_type type;
f17b558d666310 Dan Williams 2022-12-01  528  	struct cxl_nvdimm_bridge *cxl_nvb;
f17b558d666310 Dan Williams 2022-12-01  529  	struct cxl_pmem_region *cxlr_pmem;
d18bc74aced65e Dan Williams 2022-12-01  530  	unsigned long flags;
dd5ba0ebbdc414 Ben Widawsky 2021-05-27  531  	struct cxl_region_params params;
6627963c7efe78 Dave Jiang   2023-04-05  532  	struct access_coordinate *coord;
779dd20cfb56c5 Ben Widawsky 2021-06-08 @533  };
779dd20cfb56c5 Ben Widawsky 2021-06-08  534  

:::::: The code at line 533 was first introduced by commit
:::::: 779dd20cfb56c510f89877cca45529fa9f8bc450 cxl/region: Add region creation support

:::::: TO: Ben Widawsky <bwidawsk@kernel.org>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
