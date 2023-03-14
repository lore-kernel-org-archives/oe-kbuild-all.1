Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EF6199
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678804422; x=1710340422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7tkk7cX+CBaX3GVaGT4/zKEw8u4iwLH3TT78q6Ah35o=;
  b=aPaEwQ4RB6TuTnsRDJE+XWFMD2DcrRo854X6lqFfvbKLr1b9qmfHQuvV
   ZWaOTt76JYDPMJo/I63PhLlvwlJBCJcrvTr+5u9ZMsIGT/GN23q4QrmD+
   Oz+QOZ5PPmRI/wPQeCGc+D/1R9CnxK6MeWFzfnvse43iHn6j5MeqQsjad
   EMu3O/+4RLZgCnk2bGWRbfZjjwJNl0h6yyegEK7b69SqaS7VX/yuc86S+
   TdsPRNO7JFRkBPlEa9sSt6RWUzi4svcUQc+j6wNuKVPCFg0qGje8Teumz
   S/V9fpnbwybBo6B2bBNQ0/sDxcAR60xccTG+SvuDB0CGpbw2HoXAMAmXp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="423713058"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="423713058"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 07:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629059556"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="629059556"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 07:33:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc5id-0006z2-2b;
	Tue, 14 Mar 2023 14:33:39 +0000
Date: Tue, 14 Mar 2023 22:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 6/7] mmc: sdhci-msm: Switch to the new ICE API
Message-ID: <202303142204.8jbkBoRc-lkp@intel.com>
References: <20230313115202.3960700-7-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313115202.3960700-7-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on robh/for-next]
[also build test ERROR on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-crypto-Add-Qualcomm-Inline-Crypto-Engine/20230313-195431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230313115202.3960700-7-abel.vesa%40linaro.org
patch subject: [RFC PATCH v3 6/7] mmc: sdhci-msm: Switch to the new ICE API
config: csky-randconfig-r031-20230313 (https://download.01.org/0day-ci/archive/20230314/202303142204.8jbkBoRc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/39cf218db06fa3da80324ee72339a8dc4133eb86
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/dt-bindings-crypto-Add-Qualcomm-Inline-Crypto-Engine/20230313-195431
        git checkout 39cf218db06fa3da80324ee72339a8dc4133eb86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142204.8jbkBoRc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/sdhci-msm.c: In function 'sdhci_msm_runtime_suspend':
>> drivers/mmc/host/sdhci-msm.c:2685:16: error: implicit declaration of function 'sdhci_msm_ice_suspend'; did you mean 'sdhci_msm_runtime_suspend'? [-Werror=implicit-function-declaration]
    2685 |         return sdhci_msm_ice_suspend(msm_host);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                sdhci_msm_runtime_suspend
   cc1: some warnings being treated as errors


vim +2685 drivers/mmc/host/sdhci-msm.c

  2673	
  2674	static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
  2675	{
  2676		struct sdhci_host *host = dev_get_drvdata(dev);
  2677		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  2678		struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
  2679	
  2680		/* Drop the performance vote */
  2681		dev_pm_opp_set_rate(dev, 0);
  2682		clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
  2683					   msm_host->bulk_clks);
  2684	
> 2685		return sdhci_msm_ice_suspend(msm_host);
  2686	}
  2687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
