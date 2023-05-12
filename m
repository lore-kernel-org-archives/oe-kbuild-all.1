Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08B200C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683912174; x=1715448174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yiXUOfkUUN57iu1Rg8Na1hjvy/U4jI4OktQxdAOkfjY=;
  b=hS7NADZb0LAWSyKeRB6dGCwt9bB6xLBvO8gs3v5u4zcBMewdjP/oVO2f
   QbGehcNeI7QbjJXI7/y8ugwR85jtnSLL0l1IHR8BlnK7Zy2sXR2VHbgYk
   BWAsBZ2dpkf3jtUOlmZqOv36LVwP1WkMp1MJznkUfQmkf0DgAjBXSqIan
   zNcitizZP749w+kpWdehOAMDoa/DdKbrN/EZRyrBDxzNkhQ/ok/QBKUMt
   CwFQ/ihil29RoVmwMNKb4lcSXWmuYKbDdWS8H+l+p5gCsEaKqL8OpDWDh
   v1eWPgsa32kwGz0KDhB8WCKf+RE0H5hlDzwKriLT4yVF7u5wujTE5kzsf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340161321"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="340161321"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 10:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030158797"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="1030158797"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 May 2023 10:22:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxWTj-0004zU-1f;
	Fri, 12 May 2023 17:22:51 +0000
Date: Sat, 13 May 2023 01:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] aarch64-linux-ld: Unexpected GOT/PLT
 entries detected!
Message-ID: <202305130136.OmRl8rSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   4be9bb8ca052891e7f668d41946b0a481250974a
commit: 0dc22fade04725281f28b56f80e6ce698f498aea [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230513/202305130136.OmRl8rSY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=0dc22fade04725281f28b56f80e6ce698f498aea
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 0dc22fade04725281f28b56f80e6ce698f498aea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130136.OmRl8rSY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/usb/host/pci-quirks.o: in function `quirk_usb_handoff_uhci':
   drivers/usb/host/pci-quirks.c:745: undefined reference to `uhci_check_and_reset_hc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
