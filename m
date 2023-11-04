Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3253F9FB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm4fWljQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699111120; x=1730647120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4c8uMfCaHE7w4zWqd32BrAtsoXypgSMmnLO6JTE2VFQ=;
  b=Qm4fWljQiSCvq0m5vA3m53WK/wqOhHpHaw0PfVzwYyJQjdl+BHf505Qw
   cEQJmDqJoixiOLBE7Tmu5PwMEm0dW7Fx7p6BWixP4AQjYVpljx1MEdtO4
   6tWZ2v+WLWEyt/rU16W8OeHZ07Y23lkv0VE8O6C6kt4ugJNWTOOKdz2p1
   NQD2i9uH4VCtP5qzOQv9r17yvj3BZosVsc2OlsX1dI2XuF1dkG4vXCKWY
   WttEVMHdAOVTdTLS1IbHm1mg4EHyAZh+7cHKdv7hKFxS/4I9LU5bdvT4Z
   vomaGGx7MgIIhjvY4SiAz0GQ1k17SsbX55gncsm4OMKASJ9OPyvHhUEG3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="420208353"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="420208353"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 08:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="885484108"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="885484108"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2023 08:18:38 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzIQ0-0004VU-0r;
	Sat, 04 Nov 2023 15:18:36 +0000
Date: Sat, 4 Nov 2023 23:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [khilman:wip/ti-genpd-grouping 1/1]
 drivers/genpd/ti/ti_sci_pm_domains.c:34: warning: Function parameter or
 member 'genpd' not described in 'ti_sci_genpd_provider'
Message-ID: <202311042319.KskRAIU0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux.git wip/ti-genpd-grouping
head:   352a1b98d79884d2279ed03643bc1ada9d1cb361
commit: 352a1b98d79884d2279ed03643bc1ada9d1cb361 [1/1] WIP: TI SCI: use subdomains for MAIN, MCU, WKUP
config: arm-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311042319.KskRAIU0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311042319.KskRAIU0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311042319.KskRAIU0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/genpd/ti/ti_sci_pm_domains.c:34: warning: Function parameter or member 'genpd' not described in 'ti_sci_genpd_provider'


vim +34 drivers/genpd/ti/ti_sci_pm_domains.c

52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c   Dave Gerlach 2017-04-04  18  
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c   Dave Gerlach 2017-04-04  19  /**
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  20   * struct ti_sci_genpd_provider: holds common TI SCI genpd provider data
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  21   * @ti_sci: handle to TI SCI protocol driver that provides ops to
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  22   *	    communicate with system control processor.
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  23   * @dev: pointer to dev for the driver for devm allocs
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  24   * @pd_list: list of all the power domains on the device
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  25   * @data: onecell data for genpd core
352a1b98d79884 drivers/genpd/ti/ti_sci_pm_domains.c Kevin Hilman 2023-10-02  26   * @pd: generic_pm_domain for use with the genpd framework
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c   Dave Gerlach 2017-04-04  27   */
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  28  struct ti_sci_genpd_provider {
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  29  	const struct ti_sci_handle *ti_sci;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  30  	struct device *dev;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  31  	struct list_head pd_list;
efa5c01cd7ee20 drivers/soc/ti/ti_sci_pm_domains.c   Tero Kristo  2020-09-11  32  	struct genpd_onecell_data data;
352a1b98d79884 drivers/genpd/ti/ti_sci_pm_domains.c Kevin Hilman 2023-10-02  33  	struct generic_pm_domain genpd;
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c   Dave Gerlach 2017-04-04 @34  };
52835d59fc6cc7 drivers/soc/ti/ti_sci_pm_domains.c   Dave Gerlach 2017-04-04  35  

:::::: The code at line 34 was first introduced by commit
:::::: 52835d59fc6cc7f3c3cfdb4a194ddc9ebd6c0c31 soc: ti: Add ti_sci_pm_domains driver

:::::: TO: Dave Gerlach <d-gerlach@ti.com>
:::::: CC: Santosh Shilimkar <ssantosh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
