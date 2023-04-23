Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E52F2D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682268915; x=1713804915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFmNp+Wlc18065xAQ4u+sce+w3eRAldF1MtqxdQxxwY=;
  b=SBBWbiMYuJcJHM7VQuKjbmwIwhJ13IKND7PNdrvD//cbD9E25E4bjpTi
   RYrXrPt1v7Ha9geKGgr//eqyYMJv3a/khH91OrfNZFpRyd5uaC0mhDGLa
   CRhOK/2iY7sbtJ+YjPk52Dsw5hPKJPoSxRFRNjctdIYRKePKFbAISBnIo
   uQx+p9sfECt0bYx9P7zFimKv/V3+RcSdgVguIOYnmJp0xAu4bb4JzA0rS
   wjGCsOpzuncp1ildhElZZwTNCqQ4zAWfMUot3+ofEucp6seslgBDSUQI4
   XSh2pXlg4ssQnPevI+HO/J7hv2WXbUXY27BqhDKhQqm1ccsmDhQZAsEdI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="335182783"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="335182783"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 09:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="939054046"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="939054046"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2023 09:55:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqczY-000hyy-1v;
	Sun, 23 Apr 2023 16:55:12 +0000
Date: Mon, 24 Apr 2023 00:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [linux-next:master 12586/13717] drivers/net/phy/marvell.c:2887
 m88e1318_led_blink_set() warn: inconsistent indenting
Message-ID: <202304240007.0VEX8QYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: ea9e86485decb2ac1750005bd96c166c9b780406 [12586/13717] net: phy: marvell: Implement led_blink_set()
config: csky-randconfig-m031-20230423 (https://download.01.org/0day-ci/archive/20230424/202304240007.0VEX8QYG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240007.0VEX8QYG-lkp@intel.com/

smatch warnings:
drivers/net/phy/marvell.c:2887 m88e1318_led_blink_set() warn: inconsistent indenting

vim +2887 drivers/net/phy/marvell.c

  2866	
  2867	static int m88e1318_led_blink_set(struct phy_device *phydev, u8 index,
  2868					  unsigned long *delay_on,
  2869					  unsigned long *delay_off)
  2870	{
  2871		int reg;
  2872	
  2873		reg = phy_read_paged(phydev, MII_MARVELL_LED_PAGE,
  2874				     MII_88E1318S_PHY_LED_FUNC);
  2875		if (reg < 0)
  2876			return reg;
  2877	
  2878		switch (index) {
  2879		case 0:
  2880		case 1:
  2881		case 2:
  2882			reg &= ~(0xf << (4 * index));
  2883				reg |= MII_88E1318S_PHY_LED_FUNC_BLINK << (4 * index);
  2884				/* Reset default is 84ms */
  2885				*delay_on = 84 / 2;
  2886				*delay_off = 84 / 2;
> 2887			break;
  2888		default:
  2889			return -EINVAL;
  2890		}
  2891	
  2892		return phy_write_paged(phydev, MII_MARVELL_LED_PAGE,
  2893				       MII_88E1318S_PHY_LED_FUNC, reg);
  2894	}
  2895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
