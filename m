Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63999414A2F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692758; cv=none; b=C5lP2oEGcgKOOIqcEs29ZDsIAJA7MYsaMW2pEIEquhElKLgOhZQ0KMOCivijLYCid2Xh3k9iY3jjmlQLnKtZINbhHGEeB60Je36zElvkshYUPiqojKqFaT0vI7tIjECPN7l089XLnQtWvvAC0DoICbhmNdtx0uNGFPlHK2H3Wig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692758; c=relaxed/simple;
	bh=PMnnZ++FlOy9OzqFl3T1Al/1kqpPzJ7ujl3mro/tG5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KdjCc/pTPlbdpsd/Kpwav8+BW/LgK377gxRLON6uPBxC+8oDLr/l8hpD8FkJBhFOIDuqPaPzKbDWXljALOpzqiCT4M7b9P9d360P/fEO7Pzt6S0nbL1siG78co9iWlG4VSrkkDJV4RjynKfDe2NqwCQvj818qxW2tNxLnV308qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6o2xF/y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6o2xF/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786692739; x=1818228739;
  h=date:from:to:cc:subject:message-id;
  bh=PMnnZ++FlOy9OzqFl3T1Al/1kqpPzJ7ujl3mro/tG5U=;
  b=Q6o2xF/yf+xvvbJYbSBfuumJ6Ifa//c/Jw6oWmwRTt2/wz2hX+7IJ5ds
   ija3Wwfai0dtWQGJ6BiIf8FYRk9d6SpVbBhcNq+HY5HzIBbTrDnWcphyY
   7q95MFYUZ+ORwuLnkdFgTcqmgRp1sYXmX9drklI01CT7E2P3rxYez3Oab
   UfwS3Nzk1B1ZgPfJDnNxA2e9mASskyKvhU9EV30WbCaHPtKk2Mc3wgY3X
   Tiegv90VFuNrPbWA5gsX0tNeaRsWH1KKxsZW7Q1ClBsXflxoJcHS2R5/F
   wk8yn4Ul7ifUkV1fhqEnxgHl0o3w/TUl0FcbdKhd9lGxi9ObYXVb7x52c
   g==;
X-CSE-ConnectionGUID: OHydmYGARuOnBLdImPlj1w==
X-CSE-MsgGUID: 0tJEQcgrT66y5SPz96RxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98784932"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98784932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 00:32:15 -0700
X-CSE-ConnectionGUID: 26gRqA8aTfmohJs3m8fM7Q==
X-CSE-MsgGUID: c7N3uACLSKamB+HIZSm0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263714552"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 00:32:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wumOh-00000000YB8-14ps;
	Fri, 14 Aug 2026 07:32:11 +0000
Date: Fri, 14 Aug 2026 15:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/214 3/3]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202608141528.WjLklYyF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/214
head:   894796752b9044f9e75ab8a8ef1d7f18b895ba3b
commit: f6261a83d9f211b58713bae33b28f274b6454612 [3/3] net: mediatek: add proprietary debugfs
config: um-randconfig-001-20260814 (https://download.01.org/0day-ci/archive/20260814/202608141528.WjLklYyF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141528.WjLklYyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141528.WjLklYyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debug_show':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac' set but not used [-Wunused-but-set-variable]
     435 |         struct mtk_mac *mac = 0;
         |                         ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1810:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1810 |         int ret;
         |             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v2':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1903:13: warning: variable 'score' set but not used [-Wunused-but-set-variable]
    1903 |         u32 score = 0, ipv4 = 0;
         |             ^~~~~


vim +/mac +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

   431	
   432	static int mtketh_debug_show(struct seq_file *m, void *private)
   433	{
   434		struct mtk_eth *eth = m->private;
 > 435		struct mtk_mac *mac = 0;
   436		int  i = 0;
   437	
   438		for (i = 0 ; i < MTK_MAX_DEVS ; i++) {
   439			if (!eth->mac[i] ||
   440			    of_phy_is_fixed_link(eth->mac[i]->of_node))
   441				continue;
   442			mac = eth->mac[i];
   443	/* FIXME */
   444	/*
   445			while (j < 30) {
   446				d =  _mtk_mdio_read_c22(eth, mac->phy_dev->addr, j);
   447	
   448				seq_printf(m, "phy=%d, reg=0x%08x, data=0x%08x\n",
   449					   mac->phy_dev->addr, j, d);
   450				j++;
   451			}
   452	*/
   453		}
   454		return 0;
   455	}
   456	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
