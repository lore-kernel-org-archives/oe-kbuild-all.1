Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051B372
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679796027; x=1711332027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTeB8giypSlyZqDA5OyRSrMN4WkgbX9lY76uIpz+Yy0=;
  b=hV9b0Hp6K5U8dSKlx4Bj1pl8+wrtd2oMKUc70lrvDwxH1XQrIWjKyACH
   yprGoTzatSG48uc5rXPh7zdzRNm4YijUNKJQJApOoaMWWpOmBmePAmwKX
   Q9q1si9mjKJcrOwRPMrG36zL656h7MufqkWJ5ARnaNcN4NkQnZ55Uw8BH
   qfmJ7hSe0w/47Jacbapz/IBF9Hvnbuqf6zRN45oUkY7YV30UoTZ9Xlly5
   hVBk1bmH9WoPLYzI7ZYS3KBOAJ3n1h/hq/BlEzK62lRNj3lElMVc6PUTL
   +5yW4h/d8c8U/CrjDwAwV7VFIs3Zeyv0wCoIx37gQarxH9wy4bZeDtbAK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="337540331"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="337540331"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 19:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="929066046"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="929066046"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Mar 2023 19:00:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgFgH-000GoB-2S;
	Sun, 26 Mar 2023 02:00:25 +0000
Date: Sun, 26 Mar 2023 10:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh71x0 81/125] ERROR: modpost:
 "devm_platform_ioremap_resource"
 [drivers/phy/starfive/phy-starfive-dphy-rx.ko] undefined!
Message-ID: <202303260907.eHMLPZUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh71x0
head:   a153f8a5fa033441b23eae5f33709513e6a61833
commit: f86f01ce7f0f112d2a9e55544af9fe5da0119723 [81/125] phy: starfive: Add mipi dphy rx support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230326/202303260907.eHMLPZUi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/esmil/linux/commit/f86f01ce7f0f112d2a9e55544af9fe5da0119723
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil jh71x0
        git checkout f86f01ce7f0f112d2a9e55544af9fe5da0119723
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303260907.eHMLPZUi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/phy/starfive/phy-starfive-dphy-rx.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
WARNING: modpost: suppressed 16 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
