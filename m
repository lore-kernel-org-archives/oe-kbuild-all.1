Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8612E7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679332192; x=1710868192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jefx8hWlPHglDaYU1Hayg56F2HFLOoMF481tagcqwAI=;
  b=M05c3dazZ2NKIMYHk2JrI2+EBMVpRXjnfW9bouXk8A2QIA0QFis+ucZS
   719A3lJynjTqz8LGgcel6HwWqQm82tBmnWzrgEqxO208q5n6KOAqnVYQ7
   vtFPVDBmptJ5sfOTnu9VpqkUjBupK1JVCDCmYdXYOiMZ2yXNY5VogQs5X
   gBubRFTzcHAxaPzBKmbzxBcX3LBW8OCDh5RlELR/8TLRmxeVM1XQHcnej
   cKlZbGlkmvrkrzlnDUkx1ifrzfJXVtxrv3HjVWFXOGreGuXoxH/2kEU2v
   criWFf4VmCsV3RiL6AOZlfF9zgAIZzaFQ6SW4DVjtyG2p8kyOJ6m2wz6S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318372161"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="318372161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 10:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855330702"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="855330702"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2023 10:09:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peJ13-000BB4-1Y;
	Mon, 20 Mar 2023 17:09:49 +0000
Date: Tue, 21 Mar 2023 01:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from
 providers
Message-ID: <202303210000.Ee8zr8TU-lkp@intel.com>
References: <20230320134217.1685781-2-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320134217.1685781-2-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on clk/clk-next]
[also build test WARNING on rafael-pm/linux-next linus/master pavel-leds/for-next v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230320-214327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230320134217.1685781-2-abel.vesa%40linaro.org
patch subject: [RFC PATCH v2 1/5] PM: domains: Allow power off queuing from providers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303210000.Ee8zr8TU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fef66120c9d99388e95560573d2e0c92c7a547c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230320-214327
        git checkout fef66120c9d99388e95560573d2e0c92c7a547c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/base/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210000.Ee8zr8TU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/base/power/clock_ops.c:18:
>> include/linux/pm_domain.h:282:6: warning: no previous prototype for 'genpd_queue_power_off_work' [-Wmissing-prototypes]
     282 | void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_domain.h: In function 'genpd_queue_power_off_work':
   include/linux/pm_domain.h:284:16: error: 'return' with a value, in function returning void [-Werror=return-type]
     284 |         return -EOPNOTSUPP;
         |                ^
   include/linux/pm_domain.h:282:6: note: declared here
     282 | void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/genpd_queue_power_off_work +282 include/linux/pm_domain.h

   281	
 > 282	void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
   283	{
   284		return -EOPNOTSUPP;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
