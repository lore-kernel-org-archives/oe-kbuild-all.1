Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BCA33DE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 11:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678274745; x=1709810745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tm0CFuifuOeLuf0B0B0We9LKovJtvPAbVs99N9jXIjY=;
  b=IWltoux9eTMd64N4kjKH3wb6iNx5DQekM5uQoZhE9V58VRe+bnfmPUWA
   eXXrYFKGy01VnJsjIHHvxSn8ICtRjeRlo0/N5WMrQBtW138HFd+Cj9stB
   HDZ1a4uve9ZWf8t2dtFy2eihihgTgjEOwIUgGdg22V9eqSbNaiAFr1BzM
   zMHRZoHxwld2T4oHZ22JQusem0XJJlOnSV/xuKBNHIAM4cEsLKCsF9i9m
   /5aJ/jT/f2/Yo4iXa0PELNwCLuQ4XekeYgAImESwvn1SBMNwd/Fk3lxmq
   ESa26tlFlGf0ytFfRVbTe5Vng1XGGXvMpw39RPeOC4WiLI9a1+SfBfs/g
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400955473"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="400955473"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 03:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787086020"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="787086020"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 03:25:44 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZrvT-000263-1j;
	Wed, 08 Mar 2023 11:25:43 +0000
Date: Wed, 8 Mar 2023 19:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/8] platform/x86: ISST: Enumerate TPMI SST and create
 framework
Message-ID: <202303081920.WGwy0RG6-lkp@intel.com>
References: <20230308070642.1727167-3-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308070642.1727167-3-srinivas.pandruvada@linux.intel.com>

Hi Srinivas,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc1 next-20230308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Pandruvada/platform-x86-ISST-Add-support-for-MSR-0x54/20230308-150906
patch link:    https://lore.kernel.org/r/20230308070642.1727167-3-srinivas.pandruvada%40linux.intel.com
patch subject: [PATCH v2 2/8] platform/x86: ISST: Enumerate TPMI SST and create framework
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303081920.WGwy0RG6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2e4ff37ca5561b5d2ff368395f8d5d043a684ca5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Pandruvada/platform-x86-ISST-Add-support-for-MSR-0x54/20230308-150906
        git checkout 2e4ff37ca5561b5d2ff368395f8d5d043a684ca5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081920.WGwy0RG6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c: In function 'tpmi_sst_init':
>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:245:11: error: 'struct isst_if_cmd_cb' has no member named 'api_version'
     245 |         cb.api_version = ISST_TPMI_API_VERSION;
         |           ^
>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:246:11: error: 'struct isst_if_cmd_cb' has no member named 'def_ioctl'
     246 |         cb.def_ioctl = isst_if_def_ioctl;
         |           ^
>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:248:37: error: 'ISST_IF_DEV_TPMI' undeclared (first use in this function); did you mean 'ISST_IF_DEV_MMIO'?
     248 |         ret = isst_if_cdev_register(ISST_IF_DEV_TPMI, &cb);
         |                                     ^~~~~~~~~~~~~~~~
         |                                     ISST_IF_DEV_MMIO
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:248:37: note: each undeclared identifier is reported only once for each function it appears in
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c: In function 'tpmi_sst_exit':
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:264:41: error: 'ISST_IF_DEV_TPMI' undeclared (first use in this function); did you mean 'ISST_IF_DEV_MMIO'?
     264 |                 isst_if_cdev_unregister(ISST_IF_DEV_TPMI);
         |                                         ^~~~~~~~~~~~~~~~
         |                                         ISST_IF_DEV_MMIO


vim +245 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

   222	
   223	int tpmi_sst_init(void)
   224	{
   225		struct isst_if_cmd_cb cb;
   226		int ret = 0;
   227	
   228		mutex_lock(&isst_tpmi_dev_lock);
   229	
   230		if (isst_core_usage_count) {
   231			++isst_core_usage_count;
   232			goto init_done;
   233		}
   234	
   235		isst_common.sst_inst = kcalloc(topology_max_packages(),
   236					       sizeof(*isst_common.sst_inst),
   237					       GFP_KERNEL);
   238		if (!isst_common.sst_inst)
   239			return -ENOMEM;
   240	
   241		memset(&cb, 0, sizeof(cb));
   242		cb.cmd_size = sizeof(struct isst_if_io_reg);
   243		cb.offset = offsetof(struct isst_if_io_regs, io_reg);
   244		cb.cmd_callback = NULL;
 > 245		cb.api_version = ISST_TPMI_API_VERSION;
 > 246		cb.def_ioctl = isst_if_def_ioctl;
   247		cb.owner = THIS_MODULE;
 > 248		ret = isst_if_cdev_register(ISST_IF_DEV_TPMI, &cb);
   249		if (ret)
   250			kfree(isst_common.sst_inst);
   251	init_done:
   252		mutex_unlock(&isst_tpmi_dev_lock);
   253		return ret;
   254	}
   255	EXPORT_SYMBOL_NS_GPL(tpmi_sst_init, INTEL_TPMI_SST);
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
