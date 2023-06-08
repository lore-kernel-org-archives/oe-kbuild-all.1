Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60482ECD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 01:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686188111; x=1717724111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g0TQOua/4os5SR4gknue4rodi5u99F2FOm7cnaImmIs=;
  b=QogBhxJHf68JFPRq4ZrPm7ZakY02VM8Lxs4eI+RUSdPHh/sxXuQxNWI2
   rJ9k+v+KSeXqezZeUbmsEkbp5r/BCCwjStkSpZoZL0DJftZ0vyr8KPrW1
   8vQ6AlxhJdkvkKLW1FabErenh6SUaC7gq9giU8BhCBtDvtcPic0f8lceo
   Fqp09rP59U4kAa+7IvWfJ8b1ovOjdIsGw/BfnBXFJOBTy1i7lZh6fqWgh
   FtpCJSrjXwz0SI0+kZZeTg4Q8rCAFqiSRnTqjdGWkKXmLIzlArZ8MKmjn
   REEK+ZYwq/RtJTJjTWgNOZNQk5SfayLQVOxqJ1Zp5st6uEdzQEQaOPeTy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346778439"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="346778439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 18:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739508913"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="739508913"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 18:35:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q74YP-000767-0I;
	Thu, 08 Jun 2023 01:35:09 +0000
Date: Thu, 8 Jun 2023 09:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v12 2/4] ice: configure FW
 logging
Message-ID: <202306080937.OACUPgYJ-lkp@intel.com>
References: <20230607222443.119-3-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607222443.119-3-paul.m.stillwell.jr@intel.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230608-062658
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230607222443.119-3-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v12 2/4] ice: configure FW logging
config: riscv-randconfig-r042-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080937.OACUPgYJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/20230607222443.119-3-paul.m.stillwell.jr@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080937.OACUPgYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_main.c:9:
   drivers/net/ethernet/intel/ice/ice.h: In function 'ice_pf_fwlog_update_module':
   drivers/net/ethernet/intel/ice/ice.h:863:16: error: 'return' with a value, in function returning void [-Werror=return-type]
     863 |         return -EOPNOTSUPP;
         |                ^
   drivers/net/ethernet/intel/ice/ice.h:861:1: note: declared here
     861 | ice_pf_fwlog_update_module(struct ice_pf *pf, int log_level, int module)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c: At top level:
>> drivers/net/ethernet/intel/ice/ice_main.c:4335:6: error: redefinition of 'ice_pf_fwlog_update_module'
    4335 | void ice_pf_fwlog_update_module(struct ice_pf *pf, int log_level, int module)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice.h:861:1: note: previous definition of 'ice_pf_fwlog_update_module' with type 'void(struct ice_pf *, int,  int)'
     861 | ice_pf_fwlog_update_module(struct ice_pf *pf, int log_level, int module)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice.h:861:1: warning: 'ice_pf_fwlog_update_module' defined but not used [-Wunused-function]
   cc1: some warnings being treated as errors


vim +/ice_pf_fwlog_update_module +4335 drivers/net/ethernet/intel/ice/ice_main.c

  4328	
  4329	/**
  4330	 * ice_pf_fwlog_update_module - update 1 module
  4331	 * @pf: pointer to the PF struct
  4332	 * @log_level: log_level to use for the @module
  4333	 * @module: module to update
  4334	 */
> 4335	void ice_pf_fwlog_update_module(struct ice_pf *pf, int log_level, int module)
  4336	{
  4337		struct ice_fwlog_module_entry *entries;
  4338		struct ice_hw *hw = &pf->hw;
  4339	
  4340		entries = (struct ice_fwlog_module_entry *)hw->fwlog_cfg.module_entries;
  4341	
  4342		entries[module].log_level = log_level;
  4343	}
  4344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
