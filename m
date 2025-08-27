Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A721212B0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756295884; cv=none; b=VXV2gZS5n0FDjePqVJNoOeLBRyCIoN5izjFpPtV+7vl1twXPNcnh61+z/4drpzwbu/tyM+MUKKTZAY1iB9rN4Nq7O5Nk63uT1JY9Z0xDcwZRqSc227rDNsMZ/Lp94ckBuGAzIHwJGpVzSMGbhnrieDdfpHbN0LviZcCNyOds3W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756295884; c=relaxed/simple;
	bh=tqPhp6oOR8/OpwN/8/3p64TaZ1wjXFy5R4buHZ2yDEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=em/yHZ6+kLc81gGgi15NyZ6UGcSY1PBJsOVNHZPI8Hmp4aG8ovIEGIbQYupF0d5wMsMtFMBl3vaLOqHJEvwAOdQad6Wb8e/5HhN+lahol2BcoPDbIe2AF104nBrxp/5DTTyrlV8FIMICtZ1SfvbUPDH97hS6cjvsSeWhr+9ObkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnWe7A32; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnWe7A32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756295882; x=1787831882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqPhp6oOR8/OpwN/8/3p64TaZ1wjXFy5R4buHZ2yDEg=;
  b=GnWe7A32wX1d4v5nt3IDwcSfXksqOJVwsvzSOMwGRhce3Dr++7QMm83S
   +zJFSMbpbywDqYSuy9WYdVwiue3scKhn0bEuHpLrLduL9anLC2k4zMmSa
   n5107nPvXvMJWFscpScU8qKJ99nXNcW++5h+9u6Ush/gRXSD5fqfav4gr
   00weSQ7e5eyJek7TsVv1QsjZ5V8Dvgx3TUuIOLbiZZ6FxkM8qYsyv1XPq
   r5IAcnn+lemaESk+RsczwltVRWw3yCljhszXge9hWwLj3qBHtQ7MC9+JN
   RwvtJoOVpkNqf1JTPhDpOtRgW7zg0kEKxFybzpZqnxsX1xe4+eWbpYJSm
   w==;
X-CSE-ConnectionGUID: yasiJaMqRs2UnAMvLX6yNQ==
X-CSE-MsgGUID: Lhz++x/zRwSySMRPL27Brw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62190648"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="62190648"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 04:58:02 -0700
X-CSE-ConnectionGUID: NIabe5sOTO2jgtjnF+44sA==
X-CSE-MsgGUID: 3qy8PYQqSjWOEZf0b0VUkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169761083"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2025 04:58:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urEms-000SvB-1Z;
	Wed, 27 Aug 2025 11:57:58 +0000
Date: Wed, 27 Aug 2025 19:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 454/454]
 drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or
 member 'subsys_clk_prefix' not described in 'scp_domain_data'
Message-ID: <202508271946.2IyZoAmP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9aa69a4a326c92e706db5880070c5489ff6739c9
commit: 3c2b278df59897c6ac91d0c8f43e28edc6792986 [454/454] CHROMIUM: pmdomain: mt8189: Porting driver for pd
config: i386-buildonly-randconfig-001-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271946.2IyZoAmP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271946.2IyZoAmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271946.2IyZoAmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_comp' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_done_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_set_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_clr_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_en_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_set_sta_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_clr_sta_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_ack_ofs' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'hwv_shift' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'sram_slp_bits' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'sram_slp_ack_bits' not described in 'scp_domain_data'
>> drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'subsys_clk_prefix' not described in 'scp_domain_data'
   drivers/pmdomain/mediatek/mtk-scpsys.c:228: warning: Function parameter or member 'bp_table' not described in 'scp_domain_data'


vim +228 drivers/pmdomain/mediatek/mtk-scpsys.c

41b3e0f067c26d drivers/soc/mediatek/mtk-scpsys.c      James Liao    2015-10-07  193  
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  194  /**
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  195   * struct scp_domain_data - scp domain data for power on/off flow
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  196   * @name: The domain name.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  197   * @sta_mask: The mask for power on/off status bit.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  198   * @ctl_offs: The offset for main power control register.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  199   * @sram_pdn_bits: The mask for sram power control bits.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  200   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  201   * @bus_prot_mask: The mask for single step bus protection.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  202   * @clk_id: The basic clocks required by this power domain.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  203   * @caps: The flag for active wake-up action.
90a943145e2ef1 drivers/soc/mediatek/mtk-scpsys.c      Weiyi Lu      2019-08-28  204   */
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  205  struct scp_domain_data {
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  206  	const char *name;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  207  	const char *hwv_comp;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  208  	u32 sta_mask;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  209  	int ctl_offs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  210  	u32 hwv_done_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  211  	u32 hwv_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  212  	u32 hwv_set_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  213  	u32 hwv_clr_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  214  	u32 hwv_en_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  215  	u32 hwv_set_sta_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  216  	u32 hwv_clr_sta_ofs;
6d92b140f31cc3 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2025-02-09  217  	u32 hwv_ack_ofs;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  218  	u8 hwv_shift;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  219  	u32 sram_pdn_bits;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  220  	u32 sram_pdn_ack_bits;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  221  	u32 sram_slp_bits;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  222  	u32 sram_slp_ack_bits;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  223  	u32 bus_prot_mask;
41b3e0f067c26d drivers/soc/mediatek/mtk-scpsys.c      James Liao    2015-10-07  224  	enum clk_id clk_id[MAX_CLKS];
3c2b278df59897 drivers/pmdomain/mediatek/mtk-scpsys.c Irving-CH.lin 2024-11-27  225  	const char *subsys_clk_prefix;
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  226  	struct bus_prot bp_table[MAX_STEPS];
5c7b16c63a5bb5 drivers/pmdomain/mediatek/mtk-scpsys.c Guangjie Song 2024-08-15  227  	u32 caps;
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24 @228  };
c84e358718a66f drivers/soc/mediatek/mtk-scpsys.c      Sascha Hauer  2015-06-24  229  

:::::: The code at line 228 was first introduced by commit
:::::: c84e358718a66f76ac0de1681d15d8d0c68fcdab soc: Mediatek: Add SCPSYS power domain driver

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
