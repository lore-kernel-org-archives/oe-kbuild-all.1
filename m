Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0191324E4A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 01:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762823114; cv=none; b=CjMe9DSiTWbPuauFdN44ROyzFQXitZNEUIilp06MVnaQRkWAvYpAqrqM8qeJzGySR1Qv7xqz6WSrwu84jcu4rSLKsZrAQ44XQMpvZFH10Wm5BcnqU+HtBYfeoQZTg9p74SKUoDXcA64r0NCouEXWb/CEBPd1znr+VaHA3eLPCoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762823114; c=relaxed/simple;
	bh=WMEjQd5/E5IVYSGv4MSIo09uG/dr35WBfVaFE+hYyD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBrH/LMRIv2L8nQPDqzRx18sJHW2c4gjLQpP5PRq/fxy7gOJtb90PV8xqy8PSf1hkNS+McK/DrxoIVxH0yanTWiTjssMrtOSeAi41Gfftkfk9+jQYsGfou8RLh/mcWHL9SvlhqfM+DXWAlzTpP7W2Mf4DWPMPxKeOnlgqryDCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZl8sQvb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZl8sQvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762823113; x=1794359113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMEjQd5/E5IVYSGv4MSIo09uG/dr35WBfVaFE+hYyD4=;
  b=iZl8sQvbTLXW4yubsYEev4avxsiUDg/wUQFujRqfR4VRhYFxs6eh94n2
   aKQyw4dZz/vnZyaoJvcsili0SlzQBWqwO3mwL4xq52czQnO1JU2pEfFe7
   nBohA67+vChEtHcflbzjQDzV7iZxxFQZmE4BBpwZ6DkC4lKr0e6FJ1P8m
   6/N2ZQJGbFTGVvmn62L0lo7Es8WlxbeG8odlGJyKX+/em1/jVEZQayCUb
   F6ZW/PGjn1i06DZeIjBslpA9BqMWTinz3ez059vqc79K5dBVCriO2AsaL
   aF3EEwGtThLQI0t/H+5WuSsLlihayhSsfl9RbTreo3quH5LpGmgUVHtJh
   w==;
X-CSE-ConnectionGUID: VZaX5fL2QHmWxMgTXOakAQ==
X-CSE-MsgGUID: QOC/EPQWSJqVQ5nF4WddoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68739780"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="68739780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 17:05:13 -0800
X-CSE-ConnectionGUID: nOcO5URDTUmPyK2WJdjqrw==
X-CSE-MsgGUID: 0jk3Ap8mTZuGIgyOjte45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="193074876"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 17:05:11 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIcon-0001TV-0y;
	Tue, 11 Nov 2025 01:05:09 +0000
Date: Tue, 11 Nov 2025 09:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 15/29]
 drivers/media/platform/dreamchip/rppx1/rppx1.c:57:9: warning: 'CAC_BASE'
 redefined
Message-ID: <202511110900.KQhKyGAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: deb53902b8777a75d24152d85dbfdec4f0e5cbab [15/29] media: rppx1: Add framework to support Dreamchip RPPX1 ISP
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20251111/202511110900.KQhKyGAT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110900.KQhKyGAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110900.KQhKyGAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/dreamchip/rppx1/rppx1.c:57:9: warning: 'CAC_BASE' redefined
      57 | #define CAC_BASE                                0x0880 /* POST */
         |         ^~~~~~~~
   In file included from arch/mips/include/asm/addrspace.h:13,
                    from arch/mips/include/asm/io.h:19,
                    from include/linux/io.h:12,
                    from drivers/media/platform/dreamchip/rppx1/rppx1.c:10:
   arch/mips/include/asm/mach-generic/spaces.h:33:9: note: this is the location of the previous definition
      33 | #define CAC_BASE                _AC(0x80000000, UL)
         |         ^~~~~~~~


vim +/CAC_BASE +57 drivers/media/platform/dreamchip/rppx1/rppx1.c

    47	
    48	/* PRE1/PRE2/POST Pipelines - Base Addresses */
    49	#define ACQ_BASE				0x0080 /* PRE1, PRE2 */
    50	#define BLS_BASE				0x0100 /* PRE1, PRE2 */
    51	#define GAMMA_IN_BASE				0x0200 /* PRE1, PRE2 */
    52	#define LSC_BASE				0x0400 /* PRE1, PRE2 */
    53	#define AWB_GAIN_BASE				0x0500 /* PRE1, PRE2, POST */
    54	#define DPCC_BASE				0x0600 /* PRE1, PRE2 */
    55	#define DPF_BASE				0x0700 /* PRE1, PRE2 */
    56	#define FILT_BASE				0x0800 /* POST */
  > 57	#define CAC_BASE				0x0880 /* POST */
    58	#define CCOR_BASE				0x0900 /* POST */
    59	#define HIST_BASE				0x0a00 /* PRE1, PRE2, POST */
    60	#define HIST256_BASE				0x0b00 /* PRE1 */
    61	#define EXM_BASE				0x0c00 /* PRE1, PRE2 */
    62	#define LTM_BASE				0x1000 /* POST */
    63	#define LTM_MEAS_BASE				0x1200 /* POST */
    64	#define WBMEAS_BASE				0x1700 /* POST */
    65	#define BDRGB_BASE				0x1800 /* POST */
    66	#define SHRP_BASE				0x1a00 /* POST */
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
