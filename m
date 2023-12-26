Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042C4E1BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJh6/V3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703589836; x=1735125836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dX4lu0JJ2DWDWAPdrM7SqEgs8V3xGnhNaNozOtRExnE=;
  b=VJh6/V3wBhvgvvG5Nx9BMOspXM5yib7LoIr9/oEAfj/+7roAb7D2YCT4
   9+rhqVtM+nS8n/ThiV9NEgiMpJyQ80GxCAq+cfZGkxghW8rW7XJO1jjrW
   eG7tVfARkjyoSlSyxiKQt6HyeczV4rlV9q0PifivJx4nFM8qKuyUZg9pJ
   5Azo1bqj0pKgy2tcOIQ2efxr9OpaZDXzeQH9GAuqWL1VuALquf5bYW9yA
   baplbcX38QK9/Doe9CMSOgvPSfPXEDJoBbRXRuG+O7E1Ip8+rl0z1Aivr
   0/sF6cXwHAmxV71vZ7KQQSjP1wg4Ty+tEX+aT6wE2OPADvAXKVlLnBfOx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3425740"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="3425740"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 03:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="951211446"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="951211446"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Dec 2023 03:23:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rI5XH-000EQr-2Z;
	Tue, 26 Dec 2023 11:23:49 +0000
Date: Tue, 26 Dec 2023 19:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik T Shah <hardik.t.shah@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [intel-lts:4.19/android_s 2388/30000] drivers/sdw/sdw_cnl.c:215:13:
 warning: 'sdw_switch_to_glue' defined but not used
Message-ID: <202312261913.pjZXwmDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hardik,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   2b69ccfcb3117ca97de0f8d4e752e4776133afb8
commit: 2bb2777dedaa6adce2de5a407af68bce8dd6d727 [2388/30000] Soundwire squashed commits
config: i386-randconfig-005-20231226 (https://download.01.org/0day-ci/archive/20231226/202312261913.pjZXwmDu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312261913.pjZXwmDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312261913.pjZXwmDu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/sdw/sdw_cnl.c:39:
   include/linux/sdw_bus.h:549:10: warning: 'struct sdw_impl_def_intr_stat' declared inside parameter list will not be visible outside of this definition or declaration
     549 |   struct sdw_impl_def_intr_stat *intr_status);
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/sdw/sdw_cnl.c: In function 'sdw_pdm_pdi_init':
   drivers/sdw/sdw_cnl.c:362:29: warning: variable 'total_pdm_streams' set but not used [-Wunused-but-set-variable]
     362 |  int pdm_cap, pdm_ch_count, total_pdm_streams;
         |                             ^~~~~~~~~~~~~~~~~
   drivers/sdw/sdw_cnl.c: At top level:
   drivers/sdw/sdw_cnl.c:788:13: warning: no previous prototype for 'cnl_sdw_irq_handler' [-Wmissing-prototypes]
     788 | irqreturn_t cnl_sdw_irq_handler(int irq, void *context)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/sdw/sdw_cnl.c: In function 'cnl_sdw_irq_handler':
   drivers/sdw/sdw_cnl.c:791:27: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     791 |  volatile int int_status, status, wake_sts;
         |                           ^~~~~~
   drivers/sdw/sdw_cnl.c: In function 'sdw_xfer_msg':
   drivers/sdw/sdw_cnl.c:932:20: warning: variable 'response_data' set but not used [-Wunused-but-set-variable]
     932 |  u32 cmd_data = 0, response_data;
         |                    ^~~~~~~~~~~~~
   drivers/sdw/sdw_cnl.c:931:6: warning: variable 'response_base' set but not used [-Wunused-but-set-variable]
     931 |  u32 response_base = SDW_CNL_MCP_RESPONSE_BASE;
         |      ^~~~~~~~~~~~~
   drivers/sdw/sdw_cnl.c: In function 'cnl_sdw_set_ssp_interval':
   drivers/sdw/sdw_cnl.c:1075:22: warning: variable 'check' set but not used [-Wunused-but-set-variable]
    1075 |  int sspctrl_offset, check;
         |                      ^~~~~
   In file included from drivers/sdw/sdw_cnl.c:23:
   drivers/sdw/sdw_cnl.c: At top level:
   include/linux/module.h:133:6: warning: 'init_module' specifies less restrictive attribute than its target 'cnl_sdw_init': 'cold' [-Wmissing-attributes]
     133 |  int init_module(void) __attribute__((alias(#initfn)));
         |      ^~~~~~~~~~~
   drivers/sdw/sdw_cnl.c:1573:1: note: in expansion of macro 'module_init'
    1573 | module_init(cnl_sdw_init);
         | ^~~~~~~~~~~
   drivers/sdw/sdw_cnl.c:1569:19: note: 'init_module' target declared here
    1569 | static int __init cnl_sdw_init(void)
         |                   ^~~~~~~~~~~~
>> drivers/sdw/sdw_cnl.c:215:13: warning: 'sdw_switch_to_glue' defined but not used [-Wunused-function]
     215 | static void sdw_switch_to_glue(struct cnl_sdw *sdw)
         |             ^~~~~~~~~~~~~~~~~~


vim +/sdw_switch_to_glue +215 drivers/sdw/sdw_cnl.c

   214	
 > 215	static void sdw_switch_to_glue(struct cnl_sdw *sdw)
   216	{
   217		u16 ioctl;
   218		struct cnl_sdw_data *data = &sdw->data;
   219		int ioctl_offset = SDW_CNL_IOCTL + (data->inst_id *
   220						SDW_CNL_IOCTL_REG_OFFSET);
   221	
   222		ioctl = cnl_sdw_reg_readw(data->sdw_shim,  ioctl_offset);
   223		ioctl |= CNL_IOCTL_BKE_MASK << CNL_IOCTL_BKE_SHIFT;
   224		ioctl |= CNL_IOCTL_COE_MASK << CNL_IOCTL_COE_SHIFT;
   225		cnl_sdw_reg_writew(data->sdw_shim,  ioctl_offset, ioctl);
   226	
   227		ioctl &= ~(CNL_IOCTL_MIF_MASK << CNL_IOCTL_MIF_SHIFT);
   228		cnl_sdw_reg_writew(data->sdw_shim,  ioctl_offset, ioctl);
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
