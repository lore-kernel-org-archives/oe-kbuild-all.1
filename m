Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704A288C2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790387452; cv=none; b=nSAqA2nCJQdIKwoiY7JBEn+1DrGt4QeYIuiG4l+6Xgn9V9sA4KNuE0MFdURz0QJ70wIeApVcuVOxWdyWYfpmomShidsLEfJ9T4Mxog3u+/ue1y3ySzpoTSR6MoSRnv3syO24dkSRffl0+/3sFZ6ASiZWCOogf6cRlhM1bpok9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790387452; c=relaxed/simple;
	bh=fJvqgCEqoJ4RoM4Rtko73xTGlUEsXDdItS5vo+Io4yw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tn7GaRgX//uuw4vorP2s43VjW+I45LYg8csSljgmDO3EgSj05yR0mAsrGZH7C5K+YX1Armi2IZhFDDRYMGS4+HVGCXDxSCQZG2rHjP6KHHKcNLOLnZ++BHSPTh35kkpFO1hhX9xzh3fQanIIjtwnTl0rpM4rcl6/kMIfdASz2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZC+t9ZBU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZC+t9ZBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790387450; x=1821923450;
  h=date:from:to:cc:subject:message-id;
  bh=fJvqgCEqoJ4RoM4Rtko73xTGlUEsXDdItS5vo+Io4yw=;
  b=ZC+t9ZBUAabBTMnidXsVLA3Ow/tXDn+eMadDXdpQzVIfG2a0nsRW/Xmf
   x+S8TTniiqCfBHyNNmJhPdyIh9uGJmkq8ldIbzli0D+9EehqPWcvjpWWt
   k9y00G/9h/P72as500ZjtlDoiuM8LCQWbKzvCSZ2pPYGVevqILU16KcEP
   xRCV6ArA+UmKDiVNpe8h+Gd1dc8hbLu7Z7Wx7hjJlBdzUgRa4jrIAMoZL
   tkfQToyc4dklB21r4uBLMngzIhgFjT17itRR1Iu7xUUGpqKRFreoQxkb7
   Vnyu3jimuynK3JfGA+9Ozs8goh6qrccWnLMsafJzMnpqipTky4mQby8Sa
   Q==;
X-CSE-ConnectionGUID: OywNEu5wRxqGSSni6W3gdg==
X-CSE-MsgGUID: roBYxks3Qc2H01HQ9zumPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102541859"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="102541859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 18:50:50 -0700
X-CSE-ConnectionGUID: 1vcbZXFIRbajH4tGfp+HsQ==
X-CSE-MsgGUID: T8q2iJRIS++5a2dDkQDJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272637008"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2026 18:50:49 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAHYs-000000000AB-2CPf;
	Sat, 26 Sep 2026 01:50:46 +0000
Date: Sat, 26 Sep 2026 03:50:34 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1003:4-5: Unneeded semicolon
Message-ID: <202609260328.5En1DMgN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: ec42a170885c381733f406d05265ccea08e9dca0 [214/214] net: mediatek: add proprietary debugfs
config: sparc64-randconfig-r2104-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260328.5En1DMgN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260328.5En1DMgN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1003:4-5: Unneeded semicolon

vim +1003 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

   990	
   991	static void dump_each_port(struct seq_file *seq, struct mtk_eth *eth, u32 base)
   992	{
   993		u32 pkt_cnt = 0;
   994		int i = 0;
   995	
   996		for (i = 0; i < 7; i++) {
   997			if (mtk_is_netsys_v3_or_greater(eth)) {
   998				if ((base == 0x402C) && (i == 6))
   999					base = 0x408C;
  1000				else if ((base == 0x408C) && (i == 6))
  1001					base = 0x402C;
  1002				else {
> 1003				};
  1004			}
  1005			pkt_cnt = mt7530_mdio_r32(eth, (base) + (i * 0x100));
  1006			seq_printf(seq, "%8u ", pkt_cnt);
  1007		}
  1008		seq_puts(seq, "\n");
  1009	}
  1010	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
