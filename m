Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9F1869
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVLw4tps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697286988; x=1728822988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0vITkoKlk88QIyYhYlpC0Y0X/GJFFoZtoh2tPdjBF/U=;
  b=UVLw4tpsJQgrjOVimCzIcLPfbaZIToDbUyIzgPX+yurCqOJlhQFdmdIS
   xKfMUuX4R2onH6XlXobY6Q89gMsuVLgiWDGFv1WRYVn8wCDdan2l15K3F
   WT4qy3odGF6QyA5fPz/Wn9GLnfv1OS5cM9r8+awLhkDGvUrNhsRtmQQrz
   xR+7abpzRfZYi3daBRwHm79EEslgUeygmWK96rLQG1z1rXCihQDWqKpcB
   cnMkBuG7AJNUxLbQBdMrxYLPrOCA07hWDgAq4gWiGmdfJ7p0N6pNynlpA
   SuEqcWYDYcXyKtf1f4GBivCYNlzJ/Ms+Gn6Dp5anvIi5oFqh6IlEX1JRe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382552499"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="382552499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748664970"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748664970"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 05:36:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdsW-0006AA-0V;
	Sat, 14 Oct 2023 12:36:24 +0000
Date: Sat, 14 Oct 2023 20:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4143/15767]
 drivers/crypto/caam/ctrl.c:739:24: warning: variable 'jr_inst' set but not
 used
Message-ID: <202310142036.TNsFspy4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: effcaae1b7b00fc296ba82d2bb7b26b0435de9b6 [4143/15767] LF-292-2 crypto: caam - add power management
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142036.TNsFspy4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142036.TNsFspy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142036.TNsFspy4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/caam/ctrl.c: In function 'caam_state_restore':
>> drivers/crypto/caam/ctrl.c:739:24: warning: variable 'jr_inst' set but not used [-Wunused-but-set-variable]
     739 |         u32 deco_inst, jr_inst;
         |                        ^~~~~~~
   drivers/crypto/caam/ctrl.c: At top level:
   drivers/crypto/caam/ctrl.c:821:13: warning: 'needs_entropy_delay_adjustment' defined but not used [-Wunused-function]
     821 | static bool needs_entropy_delay_adjustment(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/jr_inst +739 drivers/crypto/caam/ctrl.c

   733	
   734	static void caam_state_restore(const struct device *dev)
   735	{
   736		const struct caam_drv_private *ctrlpriv = dev_get_drvdata(dev);
   737		const struct caam_ctl_state *state = &ctrlpriv->state;
   738		struct caam_ctrl __iomem *ctrl = ctrlpriv->ctrl;
 > 739		u32 deco_inst, jr_inst;
   740		int i;
   741	
   742		wr_reg32(&ctrl->mcr, state->mcr);
   743		wr_reg32(&ctrl->scfgr, state->scfgr);
   744	
   745		deco_inst = (rd_reg32(&ctrl->perfmon.cha_num_ms) &
   746			     CHA_ID_MS_DECO_MASK) >> CHA_ID_MS_DECO_SHIFT;
   747		for (i = 0; i < deco_inst; i++) {
   748			wr_reg32(&ctrl->deco_mid[i].liodn_ms,
   749				 state->deco_mid[i].liodn_ms);
   750			wr_reg32(&ctrl->deco_mid[i].liodn_ls,
   751				 state->deco_mid[i].liodn_ls);
   752		}
   753	
   754		jr_inst = (rd_reg32(&ctrl->perfmon.cha_num_ms) &
   755			   CHA_ID_MS_JR_MASK) >> CHA_ID_MS_JR_SHIFT;
   756		for (i = 0; i < ctrlpriv->total_jobrs; i++) {
   757			wr_reg32(&ctrl->jr_mid[i].liodn_ms,
   758				 state->jr_mid[i].liodn_ms);
   759			wr_reg32(&ctrl->jr_mid[i].liodn_ls,
   760				 state->jr_mid[i].liodn_ls);
   761		}
   762	
   763		if (ctrlpriv->virt_en == 1)
   764			clrsetbits_32(&ctrl->jrstart, 0, JRSTART_JR0_START |
   765				      JRSTART_JR1_START | JRSTART_JR2_START |
   766				      JRSTART_JR3_START);
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
