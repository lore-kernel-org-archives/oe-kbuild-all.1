Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CC3B27E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371543; cv=none; b=YQvGG52/uRolIdiOCcAOlpsLEw9tTXf78ot0N+m0YvrhjaFJeKEYxgVrzO+2V/DV5KEeHg+Z+Kc2zAwD61nCpsCNihmM3RujIn0knvgPPylKg7p6aXo7YYLcI9T5ZYiZIn7LKo4vo+7RdEIsKl86r3XlHi6Sxq6JOal0FEU9+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371543; c=relaxed/simple;
	bh=bu0pkOowxayXfP47EE5/4PzEWW+eoej6ybVjgwejL8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i6bFfXlTOWKhuHLNBsJ+v3XQJH0hUKK/rMFLAHWHeqg2M+zetOBz6iE58uOoeMIxR5ALoO8i413k/BZ4Ki6vobqx9doPiys1OPRDknmTK3o1hLos413cu8m68AOGY9v2FIq4LdSf9MCfLQGfeuwtiWOhtLwDXuQiwUWgeVF7ugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld7G2LFn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld7G2LFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790371540; x=1821907540;
  h=date:from:to:cc:subject:message-id;
  bh=bu0pkOowxayXfP47EE5/4PzEWW+eoej6ybVjgwejL8o=;
  b=ld7G2LFnt1VaPqSVY+9Z8tMYqS+NRMl40XQMiZ2HeuKg18Hh2KJPvgoc
   VqdYh28lJm/n2AQZzXCrnrFNcBFsMklFDWYnRnhRRbW7yuMtRWfrt3u8f
   Sc1V0dlb9mHzeFjiRNC4+qYOSJaLoXd+KsRP6h/zUCnzO/g11H9NIbYcy
   XNiQ+itdp6ZPeV/CLhq/1McSLqjUrJFPoNwPuKW2yF5Ebuv1aY3TXbvih
   jNmcFF/LqAP0cMoLqMZKamtU2YzfhOcqNz39iUyTHWAbmYHkdA90M2b5K
   6WeHUGI44eerElV4nzTRq6Pk70dtN1x5XRi1/1tJdlscAbIPlIQKngQL7
   w==;
X-CSE-ConnectionGUID: /fRa7XnLShqQci0yL5KYyA==
X-CSE-MsgGUID: QI7StZbBT/idA9tVBXvxwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90382459"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90382459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:25:36 -0700
X-CSE-ConnectionGUID: NNXfdDQvR2uZt7TTXk1SLQ==
X-CSE-MsgGUID: ndKZUt+KTti6js+hkMI6ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303945503"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 14:25:35 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADQC-000000000tw-1tfm;
	Fri, 25 Sep 2026 21:25:32 +0000
Date: Fri, 25 Sep 2026 23:25:13 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:18: warning: variable 'mac'
 set but not used
Message-ID: <202609252249.qfU1jHbY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: ec42a170885c381733f406d05265ccea08e9dca0 [214/214] net: mediatek: add proprietary debugfs
config: s390-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252249.qfU1jHbY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252249.qfU1jHbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252249.qfU1jHbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debug_show':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:18: warning: variable 'mac' set but not used [-Wunused-but-set-variable]
     struct mtk_mac *mac = 0;
                     ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1810:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v2':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1903:6: warning: variable 'score' set but not used [-Wunused-but-set-variable]
     u32 score = 0, ipv4 = 0;
         ^~~~~


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
