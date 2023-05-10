Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4A21CC1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683755445; x=1715291445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHsJGJV2OPRhyaWYSoJSPpL7aBQ5tZUirDjPhjUkg3U=;
  b=TskpoVfrUrGbw1hvtCJBLYib2KKM+h2WsT2vBQCv326yfpXrI5wmZ7w5
   bPWjo44U5HieU1xnOAdaa+fwz0lftcrc8w5uE6RGpDgL/deCGfPO6dl/I
   7ohH5M2pmgtjYjQ8DO/EdAOzUPSZhoje6R41QmtkO4mLtVoyP8BrP+mWx
   2ZNAOrAB5JyoYcPdVUR9CFikSRvbq6MlOBG7fiZa5j8LHSaB1ocj8CM8a
   GqwBZY89Tp5eSmAVsGltjWQYtaVyN02ewLx49DheNmM6G6ulfXq3tU2nW
   EW5hXlHYnf25hrjSkbtkOXhCp9UnpICXMmrK/NRUV4Mg8Y1dqapcLg1kV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378445737"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="378445737"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 14:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789109212"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="789109212"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2023 14:49:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwrgx-0003bM-0R;
	Wed, 10 May 2023 21:49:47 +0000
Date: Thu, 11 May 2023 05:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:745:
 undefined reference to `uhci_check_and_reset_hc'
Message-ID: <202305110528.CsuLgV4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230511/202305110528.CsuLgV4v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=216a01adc35d677e5b2db113a4df427faae01e75
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 216a01adc35d677e5b2db113a4df427faae01e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110528.CsuLgV4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `quirk_usb_handoff_uhci':
>> drivers/usb/host/pci-quirks.c:745: undefined reference to `uhci_check_and_reset_hc'
   ld: vmlinux.o: in function `uhci_pci_check_and_reset_hc':
>> drivers/usb/host/uhci-pci.c:40: undefined reference to `uhci_check_and_reset_hc'
   ld: vmlinux.o: in function `uhci_pci_reset_hc':
>> drivers/usb/host/uhci-pci.c:29: undefined reference to `uhci_reset_hc'


vim +745 drivers/usb/host/pci-quirks.c

541ab4af11d5b4 Linus Torvalds  2005-10-31  728  
41ac7b3ab7fe1d Bill Pemberton  2012-11-19  729  static void quirk_usb_handoff_uhci(struct pci_dev *pdev)
7586269c0b5297 David Brownell  2005-09-23  730  {
216a01adc35d67 Niklas Schnelle 2023-05-10  731  #ifdef CONFIG_HAS_IOPORT
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
216a01adc35d67 Niklas Schnelle 2023-05-10  746  #endif
7586269c0b5297 David Brownell  2005-09-23  747  }
7586269c0b5297 David Brownell  2005-09-23  748  

:::::: The code at line 745 was first introduced by commit
:::::: bb200f6eac6372839921be1fe87c1f5c292a7bd6 [PATCH] UHCI: unify BIOS handoff and driver reset code

:::::: TO: Alan Stern <stern@rowland.harvard.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
