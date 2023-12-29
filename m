Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257C12B93
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXem85Yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703875787; x=1735411787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LzcxZ/QrkSgX8LeDqr7ab0PMFTqwJr6C5HT0Ov2HD9M=;
  b=TXem85YoRsFSQJuKvaQ/7cgpR/MW5MB73r3ywGL1CP0lT23zE1W/kDvN
   cZGMIne2XknnoZjZP9vFD6jAmjRRt843Z2AdHiI9lUDiv/lz+waaTZzLv
   L+t5NGinmuTYrPDGOHs7A/E/zUxk2gciviGfE+IiivGXNlljX2nNErXC0
   mybnBCSPdSdwny+qvBnCx6oGKBcGpZtRoYltyuY1Cd3TK0LRcvsPCefkU
   dRAf+Bf7+Qx68dAvK7YNSIDjtm3/I3nwWMV5pGPfui69O8HcmC3Ht9wI+
   LzdATnXY6n+NzpHnJ2sOMzysaThZz2hxFz7tfO+Q1IyKzv34h9b5T9Uy+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3504703"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="3504703"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 10:49:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="755085150"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="755085150"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Dec 2023 10:49:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJHvS-000HiD-0x;
	Fri, 29 Dec 2023 18:49:42 +0000
Date: Sat, 30 Dec 2023 02:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/2] thermal/debugfs: Add thermal debugfs information
 for mitigation episodes
Message-ID: <202312300228.1kl5NffV-lkp@intel.com>
References: <20231227104532.2671761-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227104532.2671761-2-daniel.lezcano@linaro.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on next-20231222]
[cannot apply to linus/master v6.7-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-debugfs-Add-thermal-debugfs-information-for-mitigation-episodes/20231227-184900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231227104532.2671761-2-daniel.lezcano%40linaro.org
patch subject: [PATCH v5 2/2] thermal/debugfs: Add thermal debugfs information for mitigation episodes
config: riscv-randconfig-r081-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300228.1kl5NffV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300228.1kl5NffV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300228.1kl5NffV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/thermal_debugfs.c:85: warning: expecting prototype for struct cdev_value. Prototype was for struct cdev_record instead
   drivers/thermal/thermal_debugfs.c:169: warning: Function parameter or struct member 'cdev_dbg' not described in 'thermal_debugfs'
>> drivers/thermal/thermal_debugfs.c:169: warning: Function parameter or struct member 'tz_dbg' not described in 'thermal_debugfs'
   drivers/thermal/thermal_debugfs.c:169: warning: Excess struct member 'cdev' description in 'thermal_debugfs'
>> drivers/thermal/thermal_debugfs.c:169: warning: Excess struct member 'tz' description in 'thermal_debugfs'


vim +169 drivers/thermal/thermal_debugfs.c

fafb2eabb846fd Daniel Lezcano 2023-12-27  149  
520a83215f818c Daniel Lezcano 2023-12-27  150  /**
520a83215f818c Daniel Lezcano 2023-12-27  151   * struct thermal_debugfs - High level structure for a thermal object in debugfs
520a83215f818c Daniel Lezcano 2023-12-27  152   *
520a83215f818c Daniel Lezcano 2023-12-27  153   * The thermal_debugfs structure is the common structure used by the
fafb2eabb846fd Daniel Lezcano 2023-12-27  154   * cooling device or the thermal zone to store the statistics.
520a83215f818c Daniel Lezcano 2023-12-27  155   *
520a83215f818c Daniel Lezcano 2023-12-27  156   * @d_top: top directory of the thermal object directory
520a83215f818c Daniel Lezcano 2023-12-27  157   * @lock: per object lock to protect the internals
520a83215f818c Daniel Lezcano 2023-12-27  158   *
520a83215f818c Daniel Lezcano 2023-12-27  159   * @cdev: a cooling device debug structure
fafb2eabb846fd Daniel Lezcano 2023-12-27  160   * @tz: a thermal zone debug structure
520a83215f818c Daniel Lezcano 2023-12-27  161   */
520a83215f818c Daniel Lezcano 2023-12-27  162  struct thermal_debugfs {
520a83215f818c Daniel Lezcano 2023-12-27  163  	struct dentry *d_top;
520a83215f818c Daniel Lezcano 2023-12-27  164  	struct mutex lock;
520a83215f818c Daniel Lezcano 2023-12-27  165  	union {
520a83215f818c Daniel Lezcano 2023-12-27  166  		struct cdev_debugfs cdev_dbg;
fafb2eabb846fd Daniel Lezcano 2023-12-27  167  		struct tz_debugfs tz_dbg;
520a83215f818c Daniel Lezcano 2023-12-27  168  	};
520a83215f818c Daniel Lezcano 2023-12-27 @169  };
520a83215f818c Daniel Lezcano 2023-12-27  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
