Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29097621
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 00:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676852273; x=1708388273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2zKdQfrDadA/GggbiTNdQvcKWaCjtc4nD14ZZhHEYs=;
  b=Tr67J/aer+8tmt4Cfa99PNhLEW0zLxmv6xGC7nKiNMG6JeAiCyVI/vRF
   jDZ+XXb+vou02418vv8ie2WN+SRgpDInQmyX24xoMtXUzKoeQO65vx2qX
   GY552wCpPZDtVPWsSwWPRM/v/D6sxKJCtBk6+aWEutHAAYFj6NYPBzUtc
   fp4qDJUIdpe8vgeYDuOErkMIoju11lRRETybuGbf7Sc3nkdsE5bsLy2Zh
   ESQSGc/aA68/T3+tp21utBv8pwlVACCDAy8sraI4QLMKS00tA3sAOQYcE
   Ji2ANS5YNpgWn7HMI0EaW9l6clcCQf7k7Zk5YoOUu+TUV72VGPJIMLaMy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="312662604"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="312662604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 16:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="916675977"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="916675977"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2023 16:17:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTtsM-000DVh-25;
	Mon, 20 Feb 2023 00:17:50 +0000
Date: Mon, 20 Feb 2023 08:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>
Subject: drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:1580
 rtl8xxxu_print_chipinfo() warn: always true condition '(priv->chip_cut <=
 15) => (0-15 <= 15)'
Message-ID: <202302200805.crse1DV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 7b0ac469e331d9f9fd77f4ebb7a6322f5562db67 wifi: rtl8xxxu: Recognise all possible chip cuts
date:   4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230220/202302200805.crse1DV5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200805.crse1DV5-lkp@intel.com/

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
