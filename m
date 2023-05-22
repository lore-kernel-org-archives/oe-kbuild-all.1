Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFFA174D3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 21:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684791202; x=1716327202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l1PJgOUHITBqDkh1V7+vNszgN0+wOa+vUCcitmaS7iw=;
  b=PQRkT2t2CPXR7vUkCUySzsih/TyCh0gKxaJKWymrdK/cFAu6J3GG4FYa
   VlA/s7Y42W48BzUE/K3tdy8mdCfOZ5bI8EtBys3ENg2jfmDeWYgimb4Gu
   P6EFH4Is233ezmH0YmcBoxMW5zAKeE1bSrnBYLXMeRLgC8gg2/QYzkVZD
   RWEJSNmik7yHRyRZ/PvIXyGdVMUYeCW1FiGFT7io3/7a/pfiFAAWZEJt+
   AnZIyPCpXIZBvZXV2yhqm+4Fv9nzYZNTLhQvKql1YiIwjaC7+8hZ8aHqC
   iAFJrVSlR6lJ6Sjt2f+Vtxan8Y5J5ouPeQTSsenvbR7jZPlkztHHFaH/3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418755100"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="418755100"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 14:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="877911951"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="877911951"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 May 2023 14:33:20 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1D9b-000DBv-18;
	Mon, 22 May 2023 21:33:19 +0000
Date: Tue, 23 May 2023 05:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v5 38/44] drivers/usb/host/pci-quirks.c:745:
 undefined reference to `uhci_check_and_reset_hc'
Message-ID: <202305230510.nBYtZsL3-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230523/202305230510.nBYtZsL3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=8237b16f5306419a8088a2a4c168a580b87d63ac
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v5
        git checkout 8237b16f5306419a8088a2a4c168a580b87d63ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305230510.nBYtZsL3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/usb/host/pci-quirks.o: in function `quirk_usb_handoff_uhci':
>> drivers/usb/host/pci-quirks.c:745: undefined reference to `uhci_check_and_reset_hc'


vim +745 drivers/usb/host/pci-quirks.c

541ab4af11d5b4 Linus Torvalds  2005-10-31  728  
41ac7b3ab7fe1d Bill Pemberton  2012-11-19  729  static void quirk_usb_handoff_uhci(struct pci_dev *pdev)
7586269c0b5297 David Brownell  2005-09-23  730  {
8237b16f530641 Niklas Schnelle 2023-05-10  731  #ifdef CONFIG_HAS_IOPORT
bb200f6eac6372 Alan Stern      2005-10-03  732  	unsigned long base = 0;
bb200f6eac6372 Alan Stern      2005-10-03  733  	int i;
bb200f6eac6372 Alan Stern      2005-10-03  734  
541ab4af11d5b4 Linus Torvalds  2005-10-31  735  	if (!pio_enabled(pdev))
541ab4af11d5b4 Linus Torvalds  2005-10-31  736  		return;
541ab4af11d5b4 Linus Torvalds  2005-10-31  737  
c9c13ba428ef90 Denis Efremov   2019-09-28  738  	for (i = 0; i < PCI_STD_NUM_BARS; i++)
bb200f6eac6372 Alan Stern      2005-10-03  739  		if ((pci_resource_flags(pdev, i) & IORESOURCE_IO)) {
bb200f6eac6372 Alan Stern      2005-10-03  740  			base = pci_resource_start(pdev, i);
7586269c0b5297 David Brownell  2005-09-23  741  			break;
7586269c0b5297 David Brownell  2005-09-23  742  		}
7586269c0b5297 David Brownell  2005-09-23  743  
bb200f6eac6372 Alan Stern      2005-10-03  744  	if (base)
bb200f6eac6372 Alan Stern      2005-10-03 @745  		uhci_check_and_reset_hc(pdev, base);
8237b16f530641 Niklas Schnelle 2023-05-10  746  #endif /* CONFIG_HAS_IOPORT */
7586269c0b5297 David Brownell  2005-09-23  747  }
7586269c0b5297 David Brownell  2005-09-23  748  

:::::: The code at line 745 was first introduced by commit
:::::: bb200f6eac6372839921be1fe87c1f5c292a7bd6 [PATCH] UHCI: unify BIOS handoff and driver reset code

:::::: TO: Alan Stern <stern@rowland.harvard.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
