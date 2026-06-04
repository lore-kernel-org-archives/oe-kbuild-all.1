Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703F3B19B3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599484; cv=none; b=tMfyqPzFAlaa4DmfSX4Hbuky5tP72anrIyrB/MpeX/rNCs36GLO2iF0pUYqFieBvCufr9oMm6J6b7pbvyIAoJOES87EqW+rJHQjmOw74yPuJ5DFOVLwUqTaFl+9qGLmWQ7zUloz0MGhZsqkKdBY03HxwkwXuU4qTcnJ+iNmQq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599484; c=relaxed/simple;
	bh=t9ug7YNdGb8gBDtpUHZ8sIJpXsx+iEtDTNVAUU9AQGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pudCmxtyLEMoSJxFoN1IYuEmTP3YvHSCsyK3E5r6w8ufF537/FoRaNIIpdgu50PpFkjyQlgMHKHYwevQLxbcJpb24gBLAjAUElXOTqQvqXAMM1yPxdIt9nzRTioVvhMXKPMtKTyFEXb0quY1T8PmtnyHefzuwRNm72Xq0Ccpxhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5ay7fgq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5ay7fgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780599483; x=1812135483;
  h=date:from:to:cc:subject:message-id;
  bh=t9ug7YNdGb8gBDtpUHZ8sIJpXsx+iEtDTNVAUU9AQGo=;
  b=T5ay7fgq2dkUhiXIb+5QZ9s0RBqve5F1fSAsbJXViVm4GNAWwoB+ZwHo
   Ey7nYMZ3E+NWuAd8p5iTroNbPSvPMHFec0d7dbus5kYmr2KFLJOInrLK0
   J1pjU7JYrm6K2NsARIIgc24TxBqCaPdDI9o1T47lRnDgj4xC+9hQE7Bij
   PlCRpja9AYw1IKkl+wHkdOBSEfdEdYtOu/ZqLJbd8lIc+5xSD8cNcg90D
   4ZgOFQrJ64lXntg1CBG4VmaUafaMtppL/8mM51r51thQllpq6RpFRXj5y
   wb0T+LXNT8AH3f+1BJgV3Gj56e2whLqAt/TppQyuez6MdaJIabLZwrsVL
   g==;
X-CSE-ConnectionGUID: ZcQTBdvlR+ST4cDSGMfIcw==
X-CSE-MsgGUID: TfxMtQ+yQAqZKDI3zJ5Ipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92807120"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="92807120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 11:58:02 -0700
X-CSE-ConnectionGUID: 6Yzg5+PHQUOt0UjVSlDODQ==
X-CSE-MsgGUID: naylkVEEQyO4frrf3HAGSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="249550553"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2026 11:58:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVDGQ-00000000F5o-2eiQ;
	Thu, 04 Jun 2026 18:57:58 +0000
Date: Fri, 05 Jun 2026 02:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 164/164]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202606050242.HmvWLeZf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ebfa00052eb2eb7ab8e1e7afe14dfe29a9ca2c4f
commit: f80e8cdc0b64cfd9fd2eaeda91d3ea10be7dd1aa [164/164] net: mediatek: add proprietary debugfs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606050242.HmvWLeZf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050242.HmvWLeZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050242.HmvWLeZf-lkp@intel.com/

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
