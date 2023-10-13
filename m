Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED5D224CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0q5e14P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697219042; x=1728755042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=isssMBFdZsQrN+rXIgwXrm/pgJ2geeTHMHaSe/CIeNs=;
  b=n0q5e14P+LmdFEuk9vwWYeGf5Mnzx4Ki8FwPAmd5dmfASDCfhTf2X5tl
   jK5L2OR/GjFYEGGwUuGhpN5M/ucgW9jhrSs5x+vRqthdRaayBKV/INgoq
   YIQJEubLE5fj4JfCcIiOIh2/Gby9RxWQo0UKVgpQHfHtu0yyt8ARcBRF/
   GUu8rxVUsvB3xzeXnMv9IAyJ90sp17fT6C0Ocuo6m7wEdN6X4lQ4ly+Sh
   jnAvjI/3JobYlStrualFx+UzfKTwN+JIzag/dovGTR4h+eqnYj0ZkIWDl
   77ZD2Ei84ylw9XzUetopr3Ox/ugXLEM3DIQ/iErZPssOZHOir0xH7PMyL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365492928"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="365492928"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 10:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898645061"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="898645061"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 10:42:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrMCc-0005Cs-1M;
	Fri, 13 Oct 2023 17:43:58 +0000
Date: Sat, 14 Oct 2023 01:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1567/30000]
 drivers/clk/s32/s32v234/clk-dfs.c:36: warning: Function parameter or member
 'hw' not described in 'clk_dfs'
Message-ID: <202310140139.AjT6GO85-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 318d69432b39af3d2d3e5be6b2e57d8a21da55a0 [1567/30000] clk: s32v234: Add dfs clk
config: arm64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140139.AjT6GO85-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140139.AjT6GO85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140139.AjT6GO85-lkp@intel.com/

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
