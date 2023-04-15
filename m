Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EEDA41
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681541780; x=1713077780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grYnFkInls+VTX7l9sXkC1lqnDTC/3MVEgr3mtxfGfg=;
  b=eykwdhKk+N2oJYKJMrF5nGeR2eqIAU8zGBHbid18eUN2a9/XbQBn8AAq
   KBYerpc7BbhyDF5BHADn4F402oqlx51xT8GWcH7cHiiCVtZRtYOXamc06
   qRExppkCcP0EcCCDtpuyOhy7bbT9hfrO+D+J2RhbirAYTkzdF4aF13poj
   VGXHciPLePkmWc3ANkEhwQkUSA1RiHLEHG/SGLd+aH4mkytJ+OrOLXZHp
   qmbg03k3si13gyYZMPC6mTvpOWlZn7RZMZbe7cAff7UuHkJVgj5SA0kPl
   dIfifKpbz1iNVB44FE3BSUJ41gpzXO4usURZwdNYsqqD1s5a3/FpuNs6Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344618615"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="344618615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 23:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864450997"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="864450997"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 23:56:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnZpZ-000acj-33;
	Sat, 15 Apr 2023 06:56:17 +0000
Date: Sat, 15 Apr 2023 14:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4479/9838]
 drivers/net/ethernet/freescale/dpaa2/dpsw.c:1674: warning: expecting
 prototype for dpsw_lag_set_cfg(). Prototype was for dpsw_lag_set() instead
Message-ID: <202304151422.DdrtsQFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: b15edd63499cd0b2d494ddf772813f28f7cbf58a [4479/9838] dpaa2-switch: Add the necessary MC API for HW LAG configuration
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304151422.DdrtsQFB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b15edd63499cd0b2d494ddf772813f28f7cbf58a
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout b15edd63499cd0b2d494ddf772813f28f7cbf58a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/freescale/dpaa2/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151422.DdrtsQFB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/dpaa2/dpsw.c:1674: warning: expecting prototype for dpsw_lag_set_cfg(). Prototype was for dpsw_lag_set() instead


vim +1674 drivers/net/ethernet/freescale/dpaa2/dpsw.c

  1662	
  1663	/**
  1664	 * dpsw_lag_set_cfg() - Set LAG configuration
  1665	 * @mc_io:   Pointer to MC portal's I/O object
  1666	 * @cmd_flags:      Command flags; one or more of 'MC_CMD_FLAG_'
  1667	 * @token:   Token of DPSW object
  1668	 * @cfg:     pointer to LAG configuration
  1669	 *
  1670	 * Return:   '0' on Success; Error code otherwise.
  1671	 */
  1672	int dpsw_lag_set(struct fsl_mc_io *mc_io, u32 cmd_flags, u16 token,
  1673			 const struct dpsw_lag_cfg *cfg)
> 1674	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
