Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0FBA31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 23:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676330740; x=1707866740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+6NmF77p8sTxc2oOJDBN5pNjGanYhbtPu7jvoRKnv8=;
  b=OcbLMhXvyREifxkmuo+kBodqZJRTmS4jvU5gJMMeOu/sVGmVGupxFN1b
   KHPOGN6HHt+YwKX9RsmNuUgFXSBcShmsAON8mtEPXnZfK3UU6cb4HzfJO
   tZHmNlaECezLNkLBG0bwAfng5KbEqVtLglpOdsFhpcjNIv1bz+MPAcVFU
   7H5xvp8d1cs9XtXohGPjtAv2PeRIjgn9RBH0nu3YNQfckxmLn/uiDmnL0
   NcV5i9XgeiH+KLg0nEvlRJdh/UPAMCS8yq8oyy6hS20ZAepaaqslkl5KN
   ovJCC6Bq7xFuGUweHMsvvAzqPQxTAuzqZX5AP78Fik+v0V5kViFbkrMi0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393426033"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393426033"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 15:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997862194"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="997862194"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 15:25:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRiCX-00083r-36;
	Mon, 13 Feb 2023 23:25:37 +0000
Date: Tue, 14 Feb 2023 07:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>
Subject: drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:1580
 rtl8xxxu_print_chipinfo() warn: always true condition '(priv->chip_cut <=
 15) => (0-15 <= 15)'
Message-ID: <202302140753.71IgU77A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b408817d48840847c00052ae0e02a54311913073
commit: 7b0ac469e331d9f9fd77f4ebb7a6322f5562db67 wifi: rtl8xxxu: Recognise all possible chip cuts
date:   3 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230214/202302140753.71IgU77A-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140753.71IgU77A-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:1580 rtl8xxxu_print_chipinfo() warn: always true condition '(priv->chip_cut <= 15) => (0-15 <= 15)'

Old smatch warnings:
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5675 rtl8xxxu_c2hcmd_callback() warn: potential spectre issue 'rtl8xxxu_legacy_ratetable' [r] (local cap)

vim +1580 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c

  1573	
  1574	static void rtl8xxxu_print_chipinfo(struct rtl8xxxu_priv *priv)
  1575	{
  1576		struct device *dev = &priv->udev->dev;
  1577		char cut = '?';
  1578	
  1579		/* Currently always true: chip_cut is 4 bits. */
> 1580		if (priv->chip_cut <= 15)
  1581			cut = 'A' + priv->chip_cut;
  1582	
  1583		dev_info(dev,
  1584			 "RTL%s rev %c (%s) %iT%iR, TX queues %i, WiFi=%i, BT=%i, GPS=%i, HI PA=%i\n",
  1585			 priv->chip_name, cut, priv->chip_vendor, priv->tx_paths,
  1586			 priv->rx_paths, priv->ep_tx_count, priv->has_wifi,
  1587			 priv->has_bluetooth, priv->has_gps, priv->hi_pa);
  1588	
  1589		dev_info(dev, "RTL%s MAC: %pM\n", priv->chip_name, priv->mac_addr);
  1590	}
  1591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
