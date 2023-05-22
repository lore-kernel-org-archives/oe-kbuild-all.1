Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE0171D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 21:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684791862; x=1716327862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sB+ENvDlMJcRR1LYQZMogwd6uWLn2GH0mUHWclROlUY=;
  b=Djj6WZE/1OCdFicApDIGAfUJVfNPcDjf4wsTHxq50cALyeMtkzg8Kqx8
   YxDoP3dQroqCVhSZsWqSMuhnKEMfdI1W2jFg2C3vscFq+Yv4lAOY/nX/7
   JXfmeL04eGNpjd9lIS3Z5NCFgNNiC191sGpzZWl/xBaIX6J6nLSDz2BEc
   fYJpgPp/3MoXjWUQhXF3KLLutmWG9Zv8yRrBKZ1Qu1ZsjYWMffRB+ma2K
   Y2mHkfsUMlrVhilnRvVVrE3dzRA43CQdCT+mF4dg0KRF73PuV0o38iDdR
   i9MeIHif/sYO0WSOuJekT1ecTgrTyFH/kFyqEGjHVpjzIBl0inP70sLvr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="355400888"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="355400888"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 14:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="950264146"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="950264146"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 May 2023 14:44:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1DKG-000DD9-1G;
	Mon, 22 May 2023 21:44:20 +0000
Date: Tue, 23 May 2023 05:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v5 38/44] pci-quirks.c:undefined reference to
 `uhci_check_and_reset_hc'
Message-ID: <202305230520.rja5CFxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v5
head:   49b6b5ba49f254973ff732c23ebc8ff36576bdd4
commit: 8237b16f5306419a8088a2a4c168a580b87d63ac [38/44] usb: pci-quirks: handle HAS_IOPORT dependencies
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230523/202305230520.rja5CFxH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=8237b16f5306419a8088a2a4c168a580b87d63ac
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v5
        git checkout 8237b16f5306419a8088a2a4c168a580b87d63ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305230520.rja5CFxH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/usb/host/pci-quirks.o: in function `quirk_usb_early_handoff':
>> pci-quirks.c:(.text+0xc9c): undefined reference to `uhci_check_and_reset_hc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
