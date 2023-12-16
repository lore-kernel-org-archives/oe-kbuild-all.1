Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97537D01
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbXc9Q0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702766166; x=1734302166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbOK8JiLVCYJhwUuO533AcC86nc0hFwXYWwkFbeEg6g=;
  b=MbXc9Q0magoWBBAHLARqzANS5aQGVPTl+oDO3ZqkyMhtrNQ27GHslHlW
   8ApZ5/tJwGLSrcQrE4FS+f03Zy9mB9w6QQhtEs0nk3XY6LQBoQzV4eqd0
   Bfidxq2DzwQ9+tFH14ZFMkVr7kdaPTa6c4TzAKOoM3sthkB4W6ilvRcMK
   fcSh3hME5MViIxKVdZ1mI4VRp+7Vup3X3Z5z8bZoBHQ6IfcFMEbp3gFQb
   WuP51zdRbghOA8/TIAinsyq2K5ZZb8FQZHxqK07KBgFgKMiYW80Jv/umq
   gif0OuCyvAuuPqwiUNMGfYCwm6ps5yNqxOwA5R6odcv3ybcKAL/S2xiAh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="16947458"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16947458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="841056121"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="841056121"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Dec 2023 14:36:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdGK-0002Hq-04;
	Sat, 16 Dec 2023 22:36:00 +0000
Date: Sun, 17 Dec 2023 06:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 13658/16025]
 drivers/phy/freescale/phy-fsl-lynx-xgkr-algorithm.c:742:6: warning: variable
 'prev_coe' set but not used
Message-ID: <202312170614.Edt7W2M4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 9efb96bdd5e1624d75a56d045ee12e4b02d13206 [13658/16025] phy: lynx-28g: add algorithm for IEEE 802.3 C72 (10GBase-KR) link training
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170614.Edt7W2M4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170614.Edt7W2M4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170614.Edt7W2M4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/freescale/phy-fsl-lynx-xgkr-algorithm.c:742:6: warning: variable 'prev_coe' set but not used [-Wunused-but-set-variable]
           u32 prev_coe;
               ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/prev_coe +742 drivers/phy/freescale/phy-fsl-lynx-xgkr-algorithm.c

   734	
   735	static enum coef_status
   736	lynx_xgkr_inc_dec_one(struct lynx_xgkr_algorithm *algorithm,
   737			      enum coef_field field, enum coef_update request)
   738	{
   739		u32 ld_limit[COEF_FIELD_MAX], ld_coe[COEF_FIELD_MAX], step[COEF_FIELD_MAX];
   740		struct lynx_xgkr_local_tx_status *lts = &algorithm->lts;
   741		struct lynx_xgkr_tx_eq new_tx_eq = {};
 > 742		u32 prev_coe;
   743		bool passes;
   744	
   745		ld_coe[COEF_FIELD_COP1] = lts->tuned_tx_eq.ratio_post1q;
   746		ld_coe[COEF_FIELD_COZ] = lts->tuned_tx_eq.adapt_eq;
   747		ld_coe[COEF_FIELD_COM1] = lts->tuned_tx_eq.ratio_preq;
   748	
   749		step[COEF_FIELD_COP1] = -1;
   750		step[COEF_FIELD_COZ] = +1;
   751		step[COEF_FIELD_COM1] = -1;
   752	
   753		prev_coe = ld_coe[field];
   754	
   755		/* IEEE 802.3 72.6.10.2.5 Coefficient update process
   756		 * Upon execution of a received increment or decrement request,
   757		 * the status is reported as updated, maximum, or minimum.
   758		 */
   759		switch (request) {
   760		case COEF_UPD_INC:
   761			ld_limit[COEF_FIELD_COP1] = POST_COE_MAX;
   762			ld_limit[COEF_FIELD_COZ] = ZERO_COE_MAX;
   763			ld_limit[COEF_FIELD_COM1] = PRE_COE_MAX;
   764	
   765			if (ld_coe[field] == ld_limit[field])
   766				return COEF_STAT_MAX;
   767	
   768			ld_coe[field] += step[field];
   769			break;
   770		case COEF_UPD_DEC:
   771			ld_limit[COEF_FIELD_COP1] = POST_COE_MIN;
   772			ld_limit[COEF_FIELD_COZ] = ZERO_COE_MIN;
   773			ld_limit[COEF_FIELD_COM1] = PRE_COE_MIN;
   774	
   775			if (ld_coe[field] == ld_limit[field])
   776				return COEF_STAT_MIN;
   777	
   778			ld_coe[field] -= step[field];
   779			break;
   780		case COEF_UPD_HOLD:
   781			return COEF_STAT_NOT_UPDATED;
   782		default:
   783			WARN_ON(1);
   784			return COEF_STAT_NOT_UPDATED;
   785		}
   786	
   787		passes = lynx_check_tx_hw_restrictions(ld_coe[COEF_FIELD_COP1],
   788						       ld_coe[COEF_FIELD_COZ],
   789						       ld_coe[COEF_FIELD_COM1]);
   790		if (!passes) {
   791			if (request == COEF_UPD_DEC)
   792				return COEF_STAT_MIN;
   793	
   794			/* implicitly COEF_UPD_INC */
   795			return COEF_STAT_MAX;
   796		}
   797	
   798		/* accept new tx_eq */
   799		new_tx_eq.ratio_preq = ld_coe[COEF_FIELD_COM1];
   800		new_tx_eq.ratio_post1q = ld_coe[COEF_FIELD_COP1];
   801		new_tx_eq.adapt_eq = ld_coe[COEF_FIELD_COZ];
   802		new_tx_eq.amp_reduction = algorithm->default_tx_eq.amp_reduction;
   803		lynx_tune_tx_eq(algorithm, &new_tx_eq);
   804	
   805		return COEF_STAT_UPDATED;
   806	}
   807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
