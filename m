Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AED7F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679118398; x=1710654398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXZtVBxXqVz/93gDu2a3c/Voh1hGJ7yBlRIDZK5sUQw=;
  b=GoQy7YdHGalFEVgM/4Ks1ulf7k8MqKETbVvxZ6V5cBoiNhvv7gxko0Sg
   ZyLmX+v2bL96EPanbej0eHV5u0zxpdmXURSA2Y6PQsnfIUR13/sEOYuiW
   xkLFlTY2OIVwa5c8Wh5VbiMmaUP7nxAzDYspB2S8BQB7RshvbjNY3x0Yb
   dW3ecbEHism7pQ4citTv/U3LHOV+l3zbn7cffzjUbxhfrsh0F+WeXEMy7
   +qTo+LIomjz4WoO5y/wDGU0Ils+7HmGVg+bMhlSzcKf6amCGvREEuKaz5
   GbjNCQJ/LA8T4H5mQpxUtcknIdUP701nzq/dKbM0ODfyI3DGE13iSsKR3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424685483"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="424685483"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 22:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="790989681"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="790989681"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 22:46:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdPOk-0009pq-1c;
	Sat, 18 Mar 2023 05:46:34 +0000
Date: Sat, 18 Mar 2023 13:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Brett Creeley <brett.creeley@intel.com>
Subject: [tnguy-next-queue:dev-queue 42/44]
 drivers/net/ethernet/intel/ice/ice_main.c:4561:5: error: redefinition of
 'ice_pf_fwlog_update_modules'
Message-ID: <202303181356.6AePiBhC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   f3c2b472377ca0b45ef0ae86b89c247340459720
commit: a6e11130511dd2437ac5dbdfc3fa9b77eb3e2277 [42/44] ice: add ability to set FW log configuration
config: riscv-randconfig-r042-20230318 (https://download.01.org/0day-ci/archive/20230318/202303181356.6AePiBhC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=a6e11130511dd2437ac5dbdfc3fa9b77eb3e2277
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue dev-queue
        git checkout a6e11130511dd2437ac5dbdfc3fa9b77eb3e2277
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181356.6AePiBhC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_main.c:9:
>> drivers/net/ethernet/intel/ice/ice.h:888:1: warning: no previous prototype for 'ice_pf_fwlog_update_modules' [-Wmissing-prototypes]
     888 | ice_pf_fwlog_update_modules(struct ice_pf *pf, u8 log_level,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_main.c:4561:5: error: redefinition of 'ice_pf_fwlog_update_modules'
    4561 | int ice_pf_fwlog_update_modules(struct ice_pf *pf, u8 log_level,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice.h:888:1: note: previous definition of 'ice_pf_fwlog_update_modules' with type 'int(struct ice_pf *, u8,  u32)' {aka 'int(struct ice_pf *, unsigned char,  unsigned int)'}
     888 | ice_pf_fwlog_update_modules(struct ice_pf *pf, u8 log_level,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/intel/ice/ice_lib.h:7,
                    from drivers/net/ethernet/intel/ice/ice_switch.c:4:
>> drivers/net/ethernet/intel/ice/ice.h:888:1: warning: no previous prototype for 'ice_pf_fwlog_update_modules' [-Wmissing-prototypes]
     888 | ice_pf_fwlog_update_modules(struct ice_pf *pf, u8 log_level,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ice_pf_fwlog_update_modules +4561 drivers/net/ethernet/intel/ice/ice_main.c

  4554	
  4555	/**
  4556	 * ice_pf_fwlog_update_modules - update 1 or more modules via debugfs
  4557	 * @pf: pointer to the PF struct
  4558	 * @log_level: log_level to use for the @events
  4559	 * @events: events to update
  4560	 */
> 4561	int ice_pf_fwlog_update_modules(struct ice_pf *pf, u8 log_level,
  4562					u32 events)
  4563	{
  4564		struct ice_fwlog_module_entry *entries;
  4565		struct ice_hw *hw = &pf->hw;
  4566		u16 max_bits;
  4567		int i;
  4568	
  4569		if (log_level >= ICE_FWLOG_LEVEL_INVALID) {
  4570			dev_err(ice_pf_to_dev(pf), "Invalid FW log level %u, all level(s) >= %u are invalid\n",
  4571				log_level, ICE_FWLOG_LEVEL_INVALID);
  4572			return -EINVAL;
  4573		}
  4574	
  4575		entries = (struct ice_fwlog_module_entry *)hw->fwlog_cfg.module_entries;
  4576	
  4577		max_bits = min_t(u32, BITS_PER_TYPE(u32),
  4578				 ICE_AQC_FW_LOG_ID_MAX);
  4579	
  4580		/* look for the set bits in events. the driver can't use any of the
  4581		 * built in bitops because they all need an unsigned long type which
  4582		 * events is not
  4583		 */
  4584		for (i = 0; i < max_bits; i++) {
  4585			if (BIT(i) & events)
  4586				entries[i].log_level = log_level;
  4587		}
  4588	
  4589		return 0;
  4590	}
  4591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
