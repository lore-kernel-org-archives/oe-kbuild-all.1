Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0136D111A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDpL3qz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703854084; x=1735390084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJoPyLbXEZ9o1uceop3uiGF9hwj0PG/ipBjqIBLCvl4=;
  b=FDpL3qz49zeEI1OIaPih5XG/xpGxc1f9hSoeL7dzWKf7eSkiKJDXlAgT
   zHafeyJlh6lSE+L0Y/jSOWszA73Q5Eb1hSX99dpKPDFOyk/Re7BDG2YOW
   62iOEp2TFPurhbwJ7DkLfv+hGWAb1w7mdDTc7tSrwaTiIUB3sizSZSHBL
   M2sVm5kLJ1Sw7dKnlDIMF08BofqPK+1vam7tcvgpDjgSHwmNltlpiFIde
   2McdtNkHwnV0vhfsDA8Li+FUzLurCIJd+lwonyC8eIP06n13mYNdbyCvs
   Dp1ZsX7o174md1SFURXTp0ub3pzoUKfsv94F4irE0nCMJIUycnKr9mErg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="381618970"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="381618970"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 04:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="902219399"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="902219399"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Dec 2023 04:48:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJCHO-000HST-2N;
	Fri, 29 Dec 2023 12:47:58 +0000
Date: Fri, 29 Dec 2023 20:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] thermal/debugfs: Add thermal cooling device
 debugfs information
Message-ID: <202312292034.s1RRYNUY-lkp@intel.com>
References: <20231227104532.2671761-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227104532.2671761-1-daniel.lezcano@linaro.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-debugfs-Add-thermal-debugfs-information-for-mitigation-episodes/20231227-184900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231227104532.2671761-1-daniel.lezcano%40linaro.org
patch subject: [PATCH v5 1/2] thermal/debugfs: Add thermal cooling device debugfs information
config: riscv-randconfig-r081-20231229 (https://download.01.org/0day-ci/archive/20231229/202312292034.s1RRYNUY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312292034.s1RRYNUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312292034.s1RRYNUY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:82: warning: expecting prototype for struct cdev_value. Prototype was for struct cdev_record instead
>> drivers/thermal/thermal_debugfs.c:101: warning: Function parameter or struct member 'cdev_dbg' not described in 'thermal_debugfs'
>> drivers/thermal/thermal_debugfs.c:101: warning: Excess struct member 'cdev' description in 'thermal_debugfs'


vim +101 drivers/thermal/thermal_debugfs.c

    83	
    84	/**
    85	 * struct thermal_debugfs - High level structure for a thermal object in debugfs
    86	 *
    87	 * The thermal_debugfs structure is the common structure used by the
    88	 * cooling device to compute the statistics.
    89	 *
    90	 * @d_top: top directory of the thermal object directory
    91	 * @lock: per object lock to protect the internals
    92	 *
    93	 * @cdev: a cooling device debug structure
    94	 */
    95	struct thermal_debugfs {
    96		struct dentry *d_top;
    97		struct mutex lock;
    98		union {
    99			struct cdev_debugfs cdev_dbg;
   100		};
 > 101	};
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
