Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674FB4A9B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grAyTWTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704921093; x=1736457093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nP0nCe5NQxyJeNH8NkCHhvu/orGzu3BoO1d9Bsy4J40=;
  b=grAyTWTmT7S48mtV+7aYWNVhYmzLsm4Z2OQEVkOSoIn9G4zsM5zJGjl1
   RWfUuNU+GpbMHm8wPW8afbIEbWLK2Y5OhN4W8a4FK+zciV7Md56mFfdur
   L/99FibAEr8jLF1Wuu/qAIF5a28GpV868j7NBinYQWM0LJptMAXU3iikn
   wk6AGgp8r4DYeYs6aYpYV64vAFiG9rmJFepWR+ury78WbvWUIkdo3Hfgg
   RTnIxxLi3OslKDN0P4kX1yUkpm9b0lIV/3CTfX7pUmUufZvEEDSpaO6DK
   trUvN0snKIl6YxTi2tki9cQV9qNhKC0wuqiDi6CShQojoAhp72sk3sfM2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395801076"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="395801076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 13:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="24088047"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2024 13:11:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNfrD-0007Uc-1X;
	Wed, 10 Jan 2024 21:11:27 +0000
Date: Thu, 11 Jan 2024 05:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 11985/13109] ngbe_main.c:undefined reference to
 `phylink_destroy'
Message-ID: <202401110549.ODN0MvHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8cb47d7cd090a690c1785385b2f3d407d4a53ad0
commit: bc2426d74aa35cd8ec9c97a253ef57c2c5cd730c [11985/13109] net: ngbe: convert phylib to phylink
config: parisc-randconfig-r002-20221104 (https://download.01.org/0day-ci/archive/20240111/202401110549.ODN0MvHi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110549.ODN0MvHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110549.ODN0MvHi-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_remove':
>> ngbe_main.c:(.text+0x1c): undefined reference to `phylink_destroy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_close':
>> ngbe_main.c:(.text+0x300): undefined reference to `phylink_stop'
>> hppa-linux-ld: ngbe_main.c:(.text+0x330): undefined reference to `phylink_disconnect_phy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_up':
>> ngbe_main.c:(.text+0x874): undefined reference to `phylink_start'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_open':
>> ngbe_main.c:(.text+0xae0): undefined reference to `phylink_connect_phy'
   hppa-linux-ld: ngbe_main.c:(.text+0xb20): undefined reference to `phylink_disconnect_phy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_main.o: in function `ngbe_probe':
   ngbe_main.c:(.text+0x11c0): undefined reference to `phylink_destroy'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:(.text+0x2cc): undefined reference to `phylink_ethtool_nway_reset'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:202:(.text+0x2f0): undefined reference to `phylink_ethtool_ksettings_get'
   hppa-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:211:(.text+0x318): undefined reference to `phylink_ethtool_ksettings_set'
   hppa-linux-ld: drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.o: in function `ngbe_mdio_init':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c:128:(.text+0x354): undefined reference to `phylink_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
