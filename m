Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF801111
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684739245; x=1716275245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HzJ1A24fpZkTpXWpUKDpbNdFrWgsLQVzP6FghbSJAU=;
  b=P0gZDWWPkOZQY9lc9vbjIayeubijGobZ6/I00r/SHA8t8lSef6T1lIBF
   pnp/qyPRML7djp29lqRvJGfSRPDA2hfsCKNLL/63QeycbAbTLFsm5Q5lH
   54xT5BGBWg+thtQB/yTn8DdD3j2S435g6h4M+qQvJKIbNR4dYi3z80dxu
   ExxXSdaY0enq+6p7IdrJULjX2v2eSOvXb0YmwZ/2LMphLxMRB3qr1WnD+
   fxq66CwZu+DBn9eeQX+IJcuGEx9+ql5/3IFbjfPTxC3wUx8knMP/s9y2I
   +ToSFGWHOyKRFsgzzTe54bwwOIREOoTItyBPleewIewn1lZBjiEIQyESA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="333211605"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="333211605"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="697540646"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="697540646"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 May 2023 00:07:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q0zda-000Cep-1b;
	Mon, 22 May 2023 07:07:22 +0000
Date: Mon, 22 May 2023 15:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 60/84]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:281:25: error:
 'DPU_CTL_ACTIVE_CFG' undeclared here (not in a function)
Message-ID: <202305221438.DqtX89Fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   db6edf4ef99c9a2fae00d2a3ffdb8818b9ab0c67
commit: ee694c631f691e1dcf3b5919d303bdf1064337fd [60/84] msm:disp:dpu1: setup display datapath for SC7180 target
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230522/202305221438.DqtX89Fv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=ee694c631f691e1dcf3b5919d303bdf1064337fd
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout ee694c631f691e1dcf3b5919d303bdf1064337fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305221438.DqtX89Fv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:19,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:6:
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:281:25: error: 'DPU_CTL_ACTIVE_CFG' undeclared here (not in a function)
     281 |         .features = BIT(DPU_CTL_ACTIVE_CFG), \
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/bits.h:8:44: note: in definition of macro 'BIT'
       8 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:288:9: note: in expansion of macro 'INTF_BLK'
     288 |         INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0),
         |         ^~~~~~~~
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:11:
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h:7:23: warning: 'qcom_compressed_supported_formats' defined but not used [-Wunused-const-variable=]
       7 | static const uint32_t qcom_compressed_supported_formats[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/linux/delay.h:22,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:5:
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c: In function '_setup_ctl_ops':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:528:23: error: 'DPU_CTL_ACTIVE_CFG' undeclared (first use in this function)
     528 |         if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/bits.h:8:44: note: in definition of macro 'BIT'
       8 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:528:23: note: each undeclared identifier is reported only once for each function it appears in
     528 |         if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/bits.h:8:44: note: in definition of macro 'BIT'
       8 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
--
   In file included from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:19,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:8,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h:8,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c:5:
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c: In function '_setup_intf_ops':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c:283:23: error: 'DPU_CTL_ACTIVE_CFG' undeclared (first use in this function)
     283 |         if (cap & BIT(DPU_CTL_ACTIVE_CFG))
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/bits.h:8:44: note: in definition of macro 'BIT'
       8 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c:283:23: note: each undeclared identifier is reported only once for each function it appears in
     283 |         if (cap & BIT(DPU_CTL_ACTIVE_CFG))
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/bits.h:8:44: note: in definition of macro 'BIT'
       8 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~


vim +/DPU_CTL_ACTIVE_CFG +281 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

   273	
   274	/*************************************************************
   275	 * INTF sub blocks config
   276	 *************************************************************/
   277	#define INTF_BLK(_name, _id, _base, _type, _ctrl_id) \
   278		{\
   279		.name = _name, .id = _id, \
   280		.base = _base, .len = 0x280, \
 > 281		.features = BIT(DPU_CTL_ACTIVE_CFG), \
   282		.type = _type, \
   283		.controller_id = _ctrl_id, \
   284		.prog_fetch_lines_worst_case = 24 \
   285		}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
