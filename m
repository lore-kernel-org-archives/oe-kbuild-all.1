Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A5BE4D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693575042; x=1725111042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h3sFe4RUutAoCSH1xZa/YcmtRfQ5POc3fO5ShVFVmLM=;
  b=kHPi2CvRjitTCr9qky7IZ4IyWwOPucda5xb2g72PnF1QEKToa37CE0RO
   USeT2RbgsWstmfcEj/b8vFmKEU/l6FUHorcVjx0JAPpWw81wQkXqH1ixb
   zPQWedsq7GBYfDodseB8FlFSZpBkbg/deDo2aR5ZMdZSRnsyMQ7HGebiT
   vLpcwlbzTbeVeTZdPnWzt99BCZsJwJuMn/YR+lClUyyheo83Ol3nYj55u
   RlXrL9bZ0oGsKYod74ALCyfTpGtocgtjYBVb7BSUGkmmgfAa/W+EpUFaN
   se6qtNXow2s7fqBwkCa/EmNIx1W6FI0uiTW+td2p39ARU1a104ohFLhc9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442614815"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="442614815"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883188491"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883188491"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 06:30:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc4EP-0001KX-2D;
	Fri, 01 Sep 2023 13:30:37 +0000
Date: Fri, 1 Sep 2023 21:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4393/24603]
 drivers/crypto/caam/ctrl.c:739:24: warning: variable 'jr_inst' set but not
 used
Message-ID: <202309012137.6K18RonN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Horia,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 23f430cd71fbc2b0595dff9e629eaee53ff1665e [4393/24603] LF-292-2 crypto: caam - add power management
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230901/202309012137.6K18RonN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012137.6K18RonN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012137.6K18RonN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/caam/ctrl.c: In function 'caam_state_restore':
>> drivers/crypto/caam/ctrl.c:739:24: warning: variable 'jr_inst' set but not used [-Wunused-but-set-variable]
     739 |         u32 deco_inst, jr_inst;
         |                        ^~~~~~~


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
