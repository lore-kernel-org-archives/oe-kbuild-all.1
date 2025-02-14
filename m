Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F85115199D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541082; cv=none; b=HjevX0sN+nyRVTu+7szpmgg+QVRtLVrtdFRKG1GQe7HxB70Q/hIO5VXcgUYI4/KdjLzUCq/DAJad0fCcehzFmr3/a/FZD05rwNr4rO/2BfOXDwn1nQ6QJa7778VS5RGeXjiFBwQjjj7Aar3ZXRl/w/GLwkHCTCqqM9YrzAtqKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541082; c=relaxed/simple;
	bh=bPLuGeBHWm7tZwXYMissVYXidkzTipHm6qvEVRvI4bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmDCSFVi/jn0449WviOzSGCcwdss7qMZ33h8tHdqhwjIFFN4UGwNDlf/MXg9Rj0Oe6EBITqP9/oYMNYio3t/B0fNrCTTYFuE+h2/cYMWyL2dYAJhPC8r38KPI9JRsqvOCIibDmLJO6JqViN0/wXlUEM8rDOBVlmi10NKRs9yg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyKa2v5O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyKa2v5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739541081; x=1771077081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPLuGeBHWm7tZwXYMissVYXidkzTipHm6qvEVRvI4bE=;
  b=hyKa2v5OALaO6V+heTSW88xCDtKmH8S4Pmt+9sEyogsqL/qpiBjKF15v
   e7oFtYav/N7DqOaXt1/2bfWGx2geZ3dJWFAolUXUdww+YPUNcz6+s2O1i
   6fYR3Lo4GuoY2aOvRz/QmBj4e+koof/nWyTT5Y/CV09XY+ZZjDlCKXh1r
   riF27wRkXUmfKrFbdVgyy60967M70ju78q9aRjvnBkOWwwbY0KvOEHoyx
   +e4NwmGLoC+F8T4X8vU8sGrpqqqI/xmu0pl8oMcmfN3STQl87KHeVVPFL
   ReMLCxGut3rBmm8o2i0+Lr7WwyFzxZphm2C2aBfOPZN7jDOcPTQeawL86
   A==;
X-CSE-ConnectionGUID: P6LZZxCfRDmtZqQCJNU7+w==
X-CSE-MsgGUID: 15DUL1rIRrKu6tnr3AOQLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40323762"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40323762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:51:21 -0800
X-CSE-ConnectionGUID: l2Ag54xBS0Sd1KOo7YGWkQ==
X-CSE-MsgGUID: oawHhctIRwW3XjBAclwUYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113650238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 05:51:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiw69-0019cB-0T;
	Fri, 14 Feb 2025 13:51:17 +0000
Date: Fri, 14 Feb 2025 21:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 262/262]
 drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or
 member 'hwv_ack_ofs' not described in 'scp_domain_data'
Message-ID: <202502142137.fBht3L1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3bc425c306458b9d5af1effdd97e7efcf09e407a
commit: 6d92b140f31cc31242c5fa928fc8fbfc86c2b05f [262/262] CHROMIUM: pmdomain: mediatek: add checking for domain on
config: i386-buildonly-randconfig-004-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142137.fBht3L1J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142137.fBht3L1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142137.fBht3L1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_comp' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_done_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_set_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_clr_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_en_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_set_sta_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_clr_sta_ofs' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_ack_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'hwv_shift' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'sram_slp_bits' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'sram_slp_ack_bits' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:211: warning: Function parameter or member 'bp_table' not described in 'scp_domain_data'


vim +211 drivers/pmdomain/mediatek/mtk-scpsys.c

41b3e0f067c26d drivers/soc/mediatek/mtk-scpsys.c      James Liao    2015-10-07  177  
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  178  /**
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  179   * struct scp_domain_data - scp domain data for power on/off flow
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  180   * @name: The domain name.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  181   * @sta_mask: The mask for power on/off status bit.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  182   * @ctl_offs: The offset for main power control register.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  183   * @sram_pdn_bits: The mask for sram power control bits.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  184   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  185   * @bus_prot_mask: The mask for single step bus protection.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  186   * @clk_id: The basic clocks required by this power domain.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  187   * @caps: The flag for active wake-up action.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  188   */
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  189  struct scp_domain_data {
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  190  	const char *name;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  191  	const char *hwv_comp;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  192  	u32 sta_mask;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  193  	int ctl_offs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  194  	u32 hwv_done_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  195  	u32 hwv_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  196  	u32 hwv_set_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  197  	u32 hwv_clr_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  198  	u32 hwv_en_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  199  	u32 hwv_set_sta_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  200  	u32 hwv_clr_sta_ofs;
6d92b140f31cc3 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2025-02-09  201  	u32 hwv_ack_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  202  	u8 hwv_shift;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  203  	u32 sram_pdn_bits;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  204  	u32 sram_pdn_ack_bits;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  205  	u32 sram_slp_bits;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  206  	u32 sram_slp_ack_bits;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  207  	u32 bus_prot_mask;
41b3e0f067c26d drivers/soc/mediatek/mtk-scpsys.c      James Liao    2015-10-07  208  	enum clk_id clk_id[MAX_CLKS];
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  209  	struct bus_prot bp_table[MAX_STEPS];
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  210  	u32 caps;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24 @211  };
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  212  

:::::: The code at line 211 was first introduced by commit
:::::: c84e358718a66f76ac0de1681d15d8d0c68fcdab soc: Mediatek: Add SCPSYS power domain driver

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
