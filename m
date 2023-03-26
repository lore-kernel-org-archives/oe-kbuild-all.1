Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D113372
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679791707; x=1711327707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msFDqqU8fSJa9dcgRfgFEalmAYbnV8lc4DAg+p1drDk=;
  b=hBUVBbBJBtpOzeDwTA6CWUiEehFw/HGU/4GdbQ1VmE0sSdVnARQDCwRY
   8aQnN3SlWpGZoxiKUXWkdcicW3nAwsQ9kBvGVAKnMGQyS1RnE0flK0XrT
   AY7LkK9qd5DGdq8A1je0vgHoYflrgkDW8yjt/CDiHyWGEzhbtQtYE5ifs
   84yvMGGOhTse5qyT7st/zJ2tjyNNzq0+ntuR2tacSGaBAq3sVIPcAjHCG
   1nIzfbnj0+qq9Lcmvs5OoMrPi/sJjsJo04YTzImY9WToFwv3GUznOREBk
   zIPbh+9Q+KX/vFWJfbD48suqrERFZx4VyU/OdT4m1x+8VTaoXRwUH6PR+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="320429549"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="320429549"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 17:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="807078459"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="807078459"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Mar 2023 17:48:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgEYa-000GmZ-11;
	Sun, 26 Mar 2023 00:48:24 +0000
Date: Sun, 26 Mar 2023 08:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh71x0 86/125] drivers/usb/cdns3/cdns3-starfive.c:24:
 warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST()
 instead
Message-ID: <202303260841.fQ6XwvZM-lkp@intel.com>
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
commit: 196dbccb3b7cc116114af6b61d97306ab056e276 [86/125] usb: cdns3: add StarFive JH7110 USB driver.
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230326/202303260841.fQ6XwvZM-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/esmil/linux/commit/196dbccb3b7cc116114af6b61d97306ab056e276
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil jh71x0
        git checkout 196dbccb3b7cc116114af6b61d97306ab056e276
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/usb/cdns3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303260841.fQ6XwvZM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:24: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead


vim +24 drivers/usb/cdns3/cdns3-starfive.c

    23	
  > 24	#define USB_STRAP_HOST			BIT(17)
    25	#define USB_STRAP_DEVICE		BIT(18)
    26	#define USB_STRAP_MASK			GENMASK(18, 16)
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
