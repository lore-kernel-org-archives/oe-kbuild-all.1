Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF157200AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915354; x=1715451354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S9gHcfL7nWudC49fLC1BrmQhZ8YtApgyPFJB5Wb9x5M=;
  b=GIxMIjE7Sl/dTSKQGevr1b2n7jJVNDhRp0Ga3dVie90xivx+Mzor+VFk
   fq8Gr/eYQf3DbGdnKnWm5/wV1bsImVY6xWBnN4KPjsi39s7pA/0+pOWjw
   Cnr8A0UnJa3ik0ZhmoRV6IDKV8oOOKjGgg5uPTTCD8Fx/XG4s3hWLjrOW
   0ZRCXcXpw0ZWwyDUK8RGh/543sTA9OMW0jFgOrjJf5tKcjwVhd6Ie1Mnc
   lyTShVkE1g0+emSxU5vv/XJ/mcxnwr28meHvTmv5Wv8hWxuZ9lFbyeLMn
   R+D5+xAhBtCKrdE2a5uusgqX2UFsrPbNEANKLVAlSCf2lveRa5Kir7bEx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="416491405"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="416491405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 11:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650722601"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650722601"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 11:15:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxXJ2-00051i-2A;
	Fri, 12 May 2023 18:15:52 +0000
Date: Sat, 13 May 2023 02:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] pci-quirks.c:undefined reference to
 `uhci_check_and_reset_hc'
Message-ID: <202305130244.tw2YH6xx-lkp@intel.com>
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
config: arm64-randconfig-r002-20230509 (https://download.01.org/0day-ci/archive/20230513/202305130244.tw2YH6xx-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202305130244.tw2YH6xx-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 3433369859
   drivers/usb/host/pci-quirks.o: in function `quirk_usb_early_handoff':
>> pci-quirks.c:(.text+0x1830): undefined reference to `uhci_check_and_reset_hc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
