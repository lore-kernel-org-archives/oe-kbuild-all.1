Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEDA1922F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638716; cv=none; b=Jm80KI5+FfHd+Sw+dZpJvUruz6XAC12Al5eUU53CQWH4euWv7jE98Xdh6p5dcgPkl6EKuLeVRAC3KIJeoyEE/DROE2eYieoP6qKYP9MrTXg2QS37mU9XNgMQd8+SG1wLc7QhKaRoVH45nAIpUGidjFDfeI52l8eeRN+pBZcDV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638716; c=relaxed/simple;
	bh=c2wXKePkF1KvjQz4z/7yxr5eFZNB3n8QIOan3u6dtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPCd9HHn1RPDBrLkxyOk2Is3bBJTETLs8G2jEr6k3Ksm/qnGQFmxZEm2b+R0TEc8P/A0bmKmMnUwmNp1SxKBIS00tWktiJQO8uVEYxWMgYURt7ahx7zyep6HMWhM6YYqwsgIBGhbSgioy2PjgS+djvl1kGfLVsACB6gkAWrFCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak/XOsVS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak/XOsVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758638714; x=1790174714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c2wXKePkF1KvjQz4z/7yxr5eFZNB3n8QIOan3u6dtxQ=;
  b=Ak/XOsVSLj2wTDlGwl/bOtooJfhMnhO72MDdBI1uxnc4sO1EYweyI1Tt
   fiIa9xGb9KI3ydzeYkcnwRQfogZSjGTcl/12ugng+XNyUN4oL/eXHbz7X
   0ZQfHFFI1LwEXC3NQJ6lPOzFqcjydjNR3nIV0khYFlTkpopTXl4RTzck/
   aCOoFJDZx1ibXjLnuU8AzilNVvKXCYjQIHjiMh8cvA0RDegNnaCtnJo72
   BhU34nikOqI2lbEJG0+2YyZDClqOeQeNE3CJ0DTufYjLztL0/mhFX92rz
   gtomZgUarQ9G3nLNwqO2+wU1x1pE8rDeyLyYNulb6/knDNmb5qBgsRCJZ
   Q==;
X-CSE-ConnectionGUID: 5kEX8RJgQ1qu4OnGOi527w==
X-CSE-MsgGUID: 7ZreH8gaQ52QhWgSCAfUVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64746643"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="64746643"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 07:45:12 -0700
X-CSE-ConnectionGUID: /h0pRrjcRA2jzzcTKM1xLw==
X-CSE-MsgGUID: EP3ca4A8QK+juzvcP32mCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="176723635"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2025 07:45:11 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v14GS-0003CX-2R;
	Tue, 23 Sep 2025 14:45:08 +0000
Date: Tue, 23 Sep 2025 22:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 452/452]
 drivers/net/phy/smsc.c:307:10: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202509232256.f38uTsXy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   7ca4e1afe288a5ac42351e2b9bb4b5425ac28c06
commit: a69c5d81d2ce738155480a0f9a27c4473a0951ac [452/452] net: phy: smsc: add proper reset flags for LAN8710A
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232256.f38uTsXy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509232256.f38uTsXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509232256.f38uTsXy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/smsc.c:307:10: sparse: sparse: Initializer entry defined twice
   drivers/net/phy/smsc.c:309:10: sparse:   also defined here

vim +307 drivers/net/phy/smsc.c

0a9c453eef65fe Teresa Remmet          2016-01-20  213  
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  214  static struct phy_driver smsc_phy_driver[] = {
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  215  {
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  216  	.phy_id		= 0x0007c0a0, /* OUI=0x00800f, Model#=0x0a */
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  217  	.phy_id_mask	= 0xfffffff0,
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  218  	.name		= "SMSC LAN83C185",
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  219  
dcdecdcfe1fc39 Heiner Kallweit        2019-04-12  220  	/* PHY_BASIC_FEATURES */
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  221  
0a9c453eef65fe Teresa Remmet          2016-01-20  222  	.probe		= smsc_phy_probe,
0a9c453eef65fe Teresa Remmet          2016-01-20  223  
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  224  	/* basic functions */
48c41b9941233a Steve Glendinning      2008-04-28  225  	.config_init	= smsc_phy_config_init,
21009686662fd2 Gwenhael Goavec-Merou  2014-08-15  226  	.soft_reset	= smsc_phy_reset,
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  227  
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  228  	/* IRQ related */
48c41b9941233a Steve Glendinning      2008-04-28  229  	.ack_interrupt	= smsc_phy_ack_interrupt,
48c41b9941233a Steve Glendinning      2008-04-28  230  	.config_intr	= smsc_phy_config_intr,
c9e055ac4fdbb5 Herbert Valerio Riedel 2006-05-07  231  
c64d2a9afbccd0 Steve Glendinning      2009-01-22  232  	.suspend	= genphy_suspend,
c64d2a9afbccd0 Steve Glendinning      2009-01-22  233  	.resume		= genphy_resume,
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  234  }, {
4d9b1a022a33c5 Steve Glendinning      2008-04-28  235  	.phy_id		= 0x0007c0b0, /* OUI=0x00800f, Model#=0x0b */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  236  	.phy_id_mask	= 0xfffffff0,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  237  	.name		= "SMSC LAN8187",
4d9b1a022a33c5 Steve Glendinning      2008-04-28  238  
dcdecdcfe1fc39 Heiner Kallweit        2019-04-12  239  	/* PHY_BASIC_FEATURES */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  240  
0a9c453eef65fe Teresa Remmet          2016-01-20  241  	.probe		= smsc_phy_probe,
0a9c453eef65fe Teresa Remmet          2016-01-20  242  
4d9b1a022a33c5 Steve Glendinning      2008-04-28  243  	/* basic functions */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  244  	.config_init	= smsc_phy_config_init,
21009686662fd2 Gwenhael Goavec-Merou  2014-08-15  245  	.soft_reset	= smsc_phy_reset,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  246  
4d9b1a022a33c5 Steve Glendinning      2008-04-28  247  	/* IRQ related */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  248  	.ack_interrupt	= smsc_phy_ack_interrupt,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  249  	.config_intr	= smsc_phy_config_intr,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  250  
030a89028db07a Andrew Lunn            2017-06-03  251  	/* Statistics */
030a89028db07a Andrew Lunn            2017-06-03  252  	.get_sset_count = smsc_get_sset_count,
030a89028db07a Andrew Lunn            2017-06-03  253  	.get_strings	= smsc_get_strings,
030a89028db07a Andrew Lunn            2017-06-03  254  	.get_stats	= smsc_get_stats,
030a89028db07a Andrew Lunn            2017-06-03  255  
c64d2a9afbccd0 Steve Glendinning      2009-01-22  256  	.suspend	= genphy_suspend,
c64d2a9afbccd0 Steve Glendinning      2009-01-22  257  	.resume		= genphy_resume,
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  258  }, {
4d9b1a022a33c5 Steve Glendinning      2008-04-28  259  	.phy_id		= 0x0007c0c0, /* OUI=0x00800f, Model#=0x0c */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  260  	.phy_id_mask	= 0xfffffff0,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  261  	.name		= "SMSC LAN8700",
4d9b1a022a33c5 Steve Glendinning      2008-04-28  262  
dcdecdcfe1fc39 Heiner Kallweit        2019-04-12  263  	/* PHY_BASIC_FEATURES */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  264  
0a9c453eef65fe Teresa Remmet          2016-01-20  265  	.probe		= smsc_phy_probe,
0a9c453eef65fe Teresa Remmet          2016-01-20  266  
4d9b1a022a33c5 Steve Glendinning      2008-04-28  267  	/* basic functions */
776829de90c597 Igor Plyatov           2015-08-14  268  	.read_status	= lan87xx_read_status,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  269  	.config_init	= smsc_phy_config_init,
21009686662fd2 Gwenhael Goavec-Merou  2014-08-15  270  	.soft_reset	= smsc_phy_reset,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  271  
4d9b1a022a33c5 Steve Glendinning      2008-04-28  272  	/* IRQ related */
4d9b1a022a33c5 Steve Glendinning      2008-04-28  273  	.ack_interrupt	= smsc_phy_ack_interrupt,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  274  	.config_intr	= smsc_phy_config_intr,
4d9b1a022a33c5 Steve Glendinning      2008-04-28  275  
030a89028db07a Andrew Lunn            2017-06-03  276  	/* Statistics */
030a89028db07a Andrew Lunn            2017-06-03  277  	.get_sset_count = smsc_get_sset_count,
030a89028db07a Andrew Lunn            2017-06-03  278  	.get_strings	= smsc_get_strings,
030a89028db07a Andrew Lunn            2017-06-03  279  	.get_stats	= smsc_get_stats,
030a89028db07a Andrew Lunn            2017-06-03  280  
c64d2a9afbccd0 Steve Glendinning      2009-01-22  281  	.suspend	= genphy_suspend,
c64d2a9afbccd0 Steve Glendinning      2009-01-22  282  	.resume		= genphy_resume,
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  283  }, {
fd9abb3d97c2ab Steve Glendinning      2008-11-05  284  	.phy_id		= 0x0007c0d0, /* OUI=0x00800f, Model#=0x0d */
fd9abb3d97c2ab Steve Glendinning      2008-11-05  285  	.phy_id_mask	= 0xfffffff0,
fd9abb3d97c2ab Steve Glendinning      2008-11-05  286  	.name		= "SMSC LAN911x Internal PHY",
fd9abb3d97c2ab Steve Glendinning      2008-11-05  287  
dcdecdcfe1fc39 Heiner Kallweit        2019-04-12  288  	/* PHY_BASIC_FEATURES */
fd9abb3d97c2ab Steve Glendinning      2008-11-05  289  
0a9c453eef65fe Teresa Remmet          2016-01-20  290  	.probe		= smsc_phy_probe,
0a9c453eef65fe Teresa Remmet          2016-01-20  291  
fd9abb3d97c2ab Steve Glendinning      2008-11-05  292  	/* basic functions */
698244ace8b638 Giuseppe Cavallaro     2010-01-06  293  	.config_init	= lan911x_config_init,
fd9abb3d97c2ab Steve Glendinning      2008-11-05  294  
fd9abb3d97c2ab Steve Glendinning      2008-11-05  295  	/* IRQ related */
fd9abb3d97c2ab Steve Glendinning      2008-11-05  296  	.ack_interrupt	= smsc_phy_ack_interrupt,
fd9abb3d97c2ab Steve Glendinning      2008-11-05  297  	.config_intr	= smsc_phy_config_intr,
fd9abb3d97c2ab Steve Glendinning      2008-11-05  298  
c64d2a9afbccd0 Steve Glendinning      2009-01-22  299  	.suspend	= genphy_suspend,
c64d2a9afbccd0 Steve Glendinning      2009-01-22  300  	.resume		= genphy_resume,
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  301  }, {
e072b639dc13b0 Steve Glendinning      2009-03-23  302  	.phy_id		= 0x0007c0f0, /* OUI=0x00800f, Model#=0x0f */
e072b639dc13b0 Steve Glendinning      2009-03-23  303  	.phy_id_mask	= 0xfffffff0,
e072b639dc13b0 Steve Glendinning      2009-03-23  304  	.name		= "SMSC LAN8710/LAN8720",
e072b639dc13b0 Steve Glendinning      2009-03-23  305  
dcdecdcfe1fc39 Heiner Kallweit        2019-04-12  306  	/* PHY_BASIC_FEATURES */
a4307c0ec66131 Heiner Kallweit        2018-11-09 @307  	.flags		= PHY_RST_AFTER_CLK_EN,
e072b639dc13b0 Steve Glendinning      2009-03-23  308  
a69c5d81d2ce73 Buday Csaba            2025-07-28  309  	.flags		= PHY_RST_AFTER_CLK_EN,
0a9c453eef65fe Teresa Remmet          2016-01-20  310  	.probe		= smsc_phy_probe,
0a9c453eef65fe Teresa Remmet          2016-01-20  311  
e072b639dc13b0 Steve Glendinning      2009-03-23  312  	/* basic functions */
4223dbffed9f89 Patrick Trantham       2012-11-15  313  	.read_status	= lan87xx_read_status,
4257d5837e4219 Patrick Trantham       2012-12-06  314  	.config_init	= smsc_phy_config_init,
21009686662fd2 Gwenhael Goavec-Merou  2014-08-15  315  	.soft_reset	= smsc_phy_reset,
e072b639dc13b0 Steve Glendinning      2009-03-23  316  
e072b639dc13b0 Steve Glendinning      2009-03-23  317  	/* IRQ related */
e072b639dc13b0 Steve Glendinning      2009-03-23  318  	.ack_interrupt	= smsc_phy_ack_interrupt,
e072b639dc13b0 Steve Glendinning      2009-03-23  319  	.config_intr	= smsc_phy_config_intr,
e072b639dc13b0 Steve Glendinning      2009-03-23  320  
030a89028db07a Andrew Lunn            2017-06-03  321  	/* Statistics */
030a89028db07a Andrew Lunn            2017-06-03  322  	.get_sset_count = smsc_get_sset_count,
030a89028db07a Andrew Lunn            2017-06-03  323  	.get_strings	= smsc_get_strings,
030a89028db07a Andrew Lunn            2017-06-03  324  	.get_stats	= smsc_get_stats,
030a89028db07a Andrew Lunn            2017-06-03  325  
26706d43b82b88 Joshua Henderson       2016-01-09  326  	.suspend	= genphy_suspend,
26706d43b82b88 Joshua Henderson       2016-01-09  327  	.resume		= genphy_resume,
26706d43b82b88 Joshua Henderson       2016-01-09  328  }, {
26706d43b82b88 Joshua Henderson       2016-01-09  329  	.phy_id		= 0x0007c110,
26706d43b82b88 Joshua Henderson       2016-01-09  330  	.phy_id_mask	= 0xfffffff0,
26706d43b82b88 Joshua Henderson       2016-01-09  331  	.name		= "SMSC LAN8740",
26706d43b82b88 Joshua Henderson       2016-01-09  332  
dcdecdcfe1fc39 Heiner Kallweit        2019-04-12  333  	/* PHY_BASIC_FEATURES */
76db2d466f6a92 Martin Fuzzey          2019-10-23  334  	.flags		= PHY_RST_AFTER_CLK_EN,
26706d43b82b88 Joshua Henderson       2016-01-09  335  
0a9c453eef65fe Teresa Remmet          2016-01-20  336  	.probe		= smsc_phy_probe,
0a9c453eef65fe Teresa Remmet          2016-01-20  337  
26706d43b82b88 Joshua Henderson       2016-01-09  338  	/* basic functions */
26706d43b82b88 Joshua Henderson       2016-01-09  339  	.read_status	= lan87xx_read_status,
26706d43b82b88 Joshua Henderson       2016-01-09  340  	.config_init	= smsc_phy_config_init,
26706d43b82b88 Joshua Henderson       2016-01-09  341  	.soft_reset	= smsc_phy_reset,
26706d43b82b88 Joshua Henderson       2016-01-09  342  
26706d43b82b88 Joshua Henderson       2016-01-09  343  	/* IRQ related */
26706d43b82b88 Joshua Henderson       2016-01-09  344  	.ack_interrupt	= smsc_phy_ack_interrupt,
26706d43b82b88 Joshua Henderson       2016-01-09  345  	.config_intr	= smsc_phy_config_intr,
26706d43b82b88 Joshua Henderson       2016-01-09  346  
030a89028db07a Andrew Lunn            2017-06-03  347  	/* Statistics */
030a89028db07a Andrew Lunn            2017-06-03  348  	.get_sset_count = smsc_get_sset_count,
030a89028db07a Andrew Lunn            2017-06-03  349  	.get_strings	= smsc_get_strings,
030a89028db07a Andrew Lunn            2017-06-03  350  	.get_stats	= smsc_get_stats,
030a89028db07a Andrew Lunn            2017-06-03  351  
e072b639dc13b0 Steve Glendinning      2009-03-23  352  	.suspend	= genphy_suspend,
e072b639dc13b0 Steve Glendinning      2009-03-23  353  	.resume		= genphy_resume,
d5bf9071e71a4d Christian Hohnstaedt   2012-07-04  354  } };
e072b639dc13b0 Steve Glendinning      2009-03-23  355  

:::::: The code at line 307 was first introduced by commit
:::::: a4307c0ec66131e722a8fa0f1da09646c46ee924 net: phy: remove flag PHY_HAS_INTERRUPT from driver configs

:::::: TO: Heiner Kallweit <hkallweit1@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
