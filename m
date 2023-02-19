Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F1D2918
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676833124; x=1708369124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6Y6g57xn0yA7Gx0plozwU9eevNiOte6moJp4D/KImi0=;
  b=NpYYt7cuwZ8JhUac46KRkpxSgowg2Vux/EcHBt/p2EcJ0BBKAWf20ayT
   1vK9H0a/YdxsmsF7ft3uCDadW6Bl0cQz0bxkdjd8tECPxSpI2nVuQ4nqL
   Q4yT7/eHpQLKRX+fa3TciPhszX1GhEsTp8/T0kNoLid1z7t/VXAUhfa4T
   +nlhLGeNiXHfcxQR7u5FGzWZfJuaA3hiEF0qTl3/xCpv9U2j+uFek7PP9
   Nt0HKgb6Uf3qTIpeoacTRRUB5XTDe7Y3R3LD0KTw3YepG4z28JGPZ9zae
   n+2WoLXplAqXF6zjdcz0O6CVbUAAlND7zqKazPKx0Toi8De/LmZyEyZig
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="418499537"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="418499537"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="813917773"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="813917773"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 10:58:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTotW-000DQ9-1m;
	Sun, 19 Feb 2023 18:58:42 +0000
Date: Mon, 20 Feb 2023 02:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 9/54] drivers/phy/apple/atc.c:1858:13:
 warning: unused variable 'ret'
Message-ID: <202302200223.zVttyT6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: 168464bc07a38655ea673ba03febe4aeb6cfa5e2 [9/54] WIP: phy: apple: Add Apple Type-C PHY
config: i386-buildonly-randconfig-r001-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200223.zVttyT6t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/168464bc07a38655ea673ba03febe4aeb6cfa5e2
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout 168464bc07a38655ea673ba03febe4aeb6cfa5e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/phy/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200223.zVttyT6t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/apple/atc.c: In function 'atcphy_usb3_power_on':
   drivers/phy/apple/atc.c:1586:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1586 |         int ret = 0;
         |             ^~~
   drivers/phy/apple/atc.c: In function 'atcphy_usb4_power_on':
>> drivers/phy/apple/atc.c:1858:13: warning: unused variable 'ret' [-Wunused-variable]
    1858 |         int ret = 0;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/ret +1858 drivers/phy/apple/atc.c

  1854	
  1855	static int atcphy_usb4_power_on(struct phy *phy)
  1856	{
  1857		struct apple_atcphy *atcphy = phy_get_drvdata(phy);
> 1858		int ret = 0;
  1859	
  1860		mutex_lock(&atcphy->lock);
  1861		/*if (atcphy->mode != APPLE_ATCPHY_MODE_USB4) {
  1862			reinit_completion(&atcphy->atcphy_online_event);
  1863			mutex_unlock(&atcphy->lock);
  1864			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1865						    msecs_to_jiffies(2000));
  1866			mutex_lock(&atcphy->lock);
  1867		}
  1868	
  1869		if (WARN_ON((atcphy->mode != APPLE_ATCPHY_MODE_USB4)))
  1870			ret = -EINVAL;*/
  1871	
  1872		atcphy->nhi_online = true;
  1873		complete(&atcphy->nhi_online_event);
  1874	
  1875		if (atcphy->mode != APPLE_ATCPHY_MODE_USB4) {
  1876			reinit_completion(&atcphy->atcphy_online_event);
  1877			mutex_unlock(&atcphy->lock);
  1878			wait_for_completion_timeout(&atcphy->atcphy_online_event,
  1879						    msecs_to_jiffies(2000));
  1880			mutex_lock(&atcphy->lock);
  1881		}
  1882	
  1883		// ¯\_(ツ)_/¯
  1884		printk("###### before: %x\n", readl(atcphy->regs.pmgr));
  1885		set32(atcphy->regs.pmgr, 1);
  1886		printk("###### after: %x\n", readl(atcphy->regs.pmgr));
  1887		msleep(1000);
  1888		printk("###### after sleep: %x\n", readl(atcphy->regs.pmgr));
  1889	
  1890		mutex_unlock(&atcphy->lock);
  1891		return 0;
  1892	}
  1893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
