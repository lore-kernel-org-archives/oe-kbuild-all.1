Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B61B281
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CD2Muf5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697210499; x=1728746499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Heo75Xuj/CwhHAA2SfUqEQiC+qxLrHjA/F/pCybQUSk=;
  b=CD2Muf5nK0xBZlVI9dGZD77yh+KdcIns4Jk+p+XjqANlabpS+eM5uQS4
   6R9unx75LcHgNP3khbDePL+aVxF4acilMkbAQbyvb/LJKVD5JqeNDOxJR
   SDIldgHHkxvsiEKLwMF+Ab+Z1Csj6ze0dDasbisUvVzXEhATtladReeuK
   4Fy5dmbnQWdC2lijCFpOexk7xDRU52MsS9kS4Ot32VOVPDOK4Jlvgmc0z
   lOiowYJp36fUrxMkdOruNX2i4jyA8Bm+AjMyLNvU1zz3N//R3elfYBpn9
   1xexrIz7gVoSL9P69QpkxLE0QWjcEStMK30eChjnxhQIK1b6s005MaEjN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370269876"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370269876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 08:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789898462"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="789898462"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 08:21:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrJyn-0004yX-0o;
	Fri, 13 Oct 2023 15:21:33 +0000
Date: Fri, 13 Oct 2023 23:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 699/25021]
 drivers/clk/s32/s32v234/clk-dfs.c:36: warning: Function parameter or member
 'hw' not described in 'clk_dfs'
Message-ID: <202310132354.m69fMEX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 4728b01b3c92448c3fd968ce1ccfe67f1c74821a [699/25021] clk: s32v234: Add dfs clk
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231013/202310132354.m69fMEX8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132354.m69fMEX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132354.m69fMEX8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/s32/s32v234/clk-dfs.c:36: warning: Function parameter or member 'hw' not described in 'clk_dfs'
>> drivers/clk/s32/s32v234/clk-dfs.c:36: warning: Function parameter or member 'plltype' not described in 'clk_dfs'
>> drivers/clk/s32/s32v234/clk-dfs.c:36: warning: Function parameter or member 'mfn' not described in 'clk_dfs'


vim +36 drivers/clk/s32/s32v234/clk-dfs.c

    19	
    20	/**
    21	 * struct clk_dfs - S32 DFS clock
    22	 * @clk_hw:	clock source
    23	 * @reg:	DFS register address
    24	 * @idx:	the index of DFS encoded in the register
    25	 *
    26	 * DFS clock found on S32 series. Each register for DFS has 4 clk_dfs
    27	 * data encoded, and member idx is used to specify the one.
    28	 * Only ARMPLL(3 DFS), ENETPLL(4 DFS) and DDRPLL(3 DFS) has DFS outputs.
    29	 */
    30	struct clk_dfs {
    31		struct clk_hw	hw;
    32		void __iomem	*reg;
    33		enum s32v234_plldig_type plltype;
    34		u8		idx;
    35		u32		mfn;
  > 36	};
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
