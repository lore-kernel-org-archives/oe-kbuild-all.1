Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143111182
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685398488; x=1716934488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rm/Zd2Gr2Tl5IPUVeiK2Ox8VwuonwexCHLkbgSoskDI=;
  b=bawnTaBtPBKuA2+lY2oHpskJhM5Tnhc75Mlu/1gwbXDVX3sWZl0aUvgW
   n6CI4DtBu57Gki34eXrVzM94P3JHp5Zbrgzgt/Jnu/ifLZYRgN0kPpd5W
   oRkuvLS0xxTxgPzd+O5MVyG3oKJV6SyKVQDjEc1nr12rK4FmIW4m8hsXw
   IKP54ycnvDcWopodaGoaUX79VUsuFpEcQcz2SMkHdwpGSF/MK1tIWI3Yu
   Bp90Gbk9QvXuTp7AXRm4AtOMqr0pGOLM/hNzW7KIHJOKbdCysVAwsxseG
   IM/HT99lI13BS0fKNwFuqgvl1FKel2l5w48fxHChTOexqGH2ydFjxIc8D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357149091"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357149091"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 15:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706189008"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="706189008"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 15:14:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3l8U-000L9M-30;
	Mon, 29 May 2023 22:14:42 +0000
Date: Tue, 30 May 2023 06:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>
Subject: [usb:usb-testing 25/35] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST()
 instead
Message-ID: <202305300608.8CuLyqAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   046895105d9666ab56e86ce8dd9786f8003125c6
commit: bfb46b424652a3396b92ca3c96c169ade9b45b8d [25/35] usb: cdns3: Add StarFive JH7110 USB driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305300608.8CuLyqAL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=bfb46b424652a3396b92ca3c96c169ade9b45b8d
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout bfb46b424652a3396b92ca3c96c169ade9b45b8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300608.8CuLyqAL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead


vim +23 drivers/usb/cdns3/cdns3-starfive.c

    22	
  > 23	#define USB_STRAP_HOST			BIT(17)
    24	#define USB_STRAP_DEVICE		BIT(18)
    25	#define USB_STRAP_MASK			GENMASK(18, 16)
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
