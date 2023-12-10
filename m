Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F54695
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUwXcRZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702189533; x=1733725533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+F9jiay/Pbn12wjvZfaBYEXg4qsr0upMIYGqfySYqPI=;
  b=OUwXcRZHWPOrP8WCNINyr7tYVqu3iz0gBMoDROEItlgIO19rXgE2qMCw
   LbMJRD+08l5wWib4YXhINbulA2IfTidkzMGNPDK8cWV8AksUMjwwQob1+
   vprs86brxqb45c8WCwG+oNjHojYAnZmJowrE759WSbRW9cvCGK4jOvvZp
   OeCtpAEIbDakX6bsJ87p3pJ+ukffLZUuM3VJjkNvJWMYvEz8GLcub4IDa
   wGofI3rxD/m07KnmyEGxz+ObZm4HsSkG5KPvIv7xmpnv3iqi4DuAwz72u
   IUr9cv8VZ1z3wj62Bus0mVK+BbqWHEiH40im4h5l7WJif4MHbuaGqF4bR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1412358"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1412358"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 22:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801581285"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="801581285"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2023 22:25:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCDFo-000GTN-2D;
	Sun, 10 Dec 2023 06:25:28 +0000
Date: Sun, 10 Dec 2023 14:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Huang, Ying" <ying.huang@intel.com>
Subject: [djiang:cxl-hmem-report 23/23] htmldocs: ./drivers/cxl/cxl.h:535:
 warning: Function parameter or member 'memory_notifier' not described in
 'cxl_region'
Message-ID: <202312101405.8sesjxat-lkp@intel.com>
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
commit: d097ef73f93c1f0d8098ecc5bbaf396ce09c75e2 [23/23] cxl: Add memory hotplug notifier for cxl region
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101405.8sesjxat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101405.8sesjxat-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/cxl/cxl.h:535: warning: Function parameter or member 'memory_notifier' not described in 'cxl_region'

vim +535 ./drivers/cxl/cxl.h

a32320b71f085f Dan Williams 2023-02-10  512  
779dd20cfb56c5 Ben Widawsky 2021-06-08  513  /**
779dd20cfb56c5 Ben Widawsky 2021-06-08  514   * struct cxl_region - CXL region
779dd20cfb56c5 Ben Widawsky 2021-06-08  515   * @dev: This region's device
779dd20cfb56c5 Ben Widawsky 2021-06-08  516   * @id: This region's id. Id is globally unique across all regions
779dd20cfb56c5 Ben Widawsky 2021-06-08  517   * @mode: Endpoint decoder allocation / access mode
779dd20cfb56c5 Ben Widawsky 2021-06-08  518   * @type: Endpoint decoder target type
f17b558d666310 Dan Williams 2022-12-01  519   * @cxl_nvb: nvdimm bridge for coordinating @cxlr_pmem setup / shutdown
f17b558d666310 Dan Williams 2022-12-01  520   * @cxlr_pmem: (for pmem regions) cached copy of the nvdimm bridge
d18bc74aced65e Dan Williams 2022-12-01  521   * @flags: Region state flags
dd5ba0ebbdc414 Ben Widawsky 2021-05-27  522   * @params: active + config params for the region
779dd20cfb56c5 Ben Widawsky 2021-06-08  523   */
779dd20cfb56c5 Ben Widawsky 2021-06-08  524  struct cxl_region {
779dd20cfb56c5 Ben Widawsky 2021-06-08  525  	struct device dev;
779dd20cfb56c5 Ben Widawsky 2021-06-08  526  	int id;
779dd20cfb56c5 Ben Widawsky 2021-06-08  527  	enum cxl_decoder_mode mode;
779dd20cfb56c5 Ben Widawsky 2021-06-08  528  	enum cxl_decoder_type type;
f17b558d666310 Dan Williams 2022-12-01  529  	struct cxl_nvdimm_bridge *cxl_nvb;
f17b558d666310 Dan Williams 2022-12-01  530  	struct cxl_pmem_region *cxlr_pmem;
d18bc74aced65e Dan Williams 2022-12-01  531  	unsigned long flags;
dd5ba0ebbdc414 Ben Widawsky 2021-05-27  532  	struct cxl_region_params params;
6627963c7efe78 Dave Jiang   2023-04-05  533  	struct access_coordinate *coord;
d097ef73f93c1f Dave Jiang   2023-04-12  534  	struct notifier_block memory_notifier;
779dd20cfb56c5 Ben Widawsky 2021-06-08 @535  };
779dd20cfb56c5 Ben Widawsky 2021-06-08  536  

:::::: The code at line 535 was first introduced by commit
:::::: 779dd20cfb56c510f89877cca45529fa9f8bc450 cxl/region: Add region creation support

:::::: TO: Ben Widawsky <bwidawsk@kernel.org>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
