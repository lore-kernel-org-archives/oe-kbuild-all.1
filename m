Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BA882A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675354420; x=1706890420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FTCexVA2t25KT5Hlrfc45RvAf2A5/jsi+Jv8099TVU=;
  b=h3UmK/96WPFBVA7BJ2bMRpDRGjCH71CNNZKdiuc3t+I5DR9EkLJKkjOt
   xmw/0Q6tMqf7B+HtZL3T4zNcpc66TfUvfsKKcU0D6QWr39gfbr3z7QqCL
   vgNyiO/vH6TT0OFUiJjsXy5Wc4uHI09AFI3vGx4HPpMNNmjWAdbP/MaEI
   rEyM5NRc5kqVjSTtfy8EsAqfcigBem/2hQxnApwdzLORShmAaVKg3J5+v
   IyTc52EWH4/+b8idNzEQYR5gTQkme4b2NZad7VfrGukFH2Oiva0KiGEbS
   NSkFnttGsO+DQDjS6KkYRxL9Lk9nO2kPkvY+PKPmM0ZnKXVaKG9fLZ0Sf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328503607"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="328503607"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 08:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="994149559"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="994149559"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2023 08:13:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNcDR-0006em-2D;
	Thu, 02 Feb 2023 16:13:37 +0000
Date: Fri, 3 Feb 2023 00:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 14/40] arch/powerpc/kernel/pci_32.c:233:5: error:
 no previous prototype for 'pci_device_from_OF_node'
Message-ID: <202302030001.HQPCI490-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   9ffcf6a19dbb2a24de2c2d7b2af1e130986cd565
commit: 869363998da87c80c16ff1221e95b41b2d3cceb2 [14/40] powerpc/pci: Allow to disable filling deprecated pci-OF-bus-map
config: powerpc-buildonly-randconfig-r006-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030001.HQPCI490-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=869363998da87c80c16ff1221e95b41b2d3cceb2
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 869363998da87c80c16ff1221e95b41b2d3cceb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/pci_32.c:233:5: error: no previous prototype for 'pci_device_from_OF_node' [-Werror=missing-prototypes]
     233 | int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/pci_device_from_OF_node +233 arch/powerpc/kernel/pci_32.c

   229	
   230	/*
   231	 * Returns the PCI device matching a given OF node without pci_to_OF_bus_map
   232	 */
 > 233	int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
   234	{
   235		const __be32 *reg;
   236		int size;
   237	
   238		/* Check if it might have a chance to be a PCI device */
   239		if (!pci_find_hose_for_OF_device(node))
   240			return -ENODEV;
   241	
   242		reg = of_get_property(node, "reg", &size);
   243		if (!reg || size < 5 * sizeof(u32))
   244			return -ENODEV;
   245	
   246		*bus = (be32_to_cpup(&reg[0]) >> 16) & 0xff;
   247		*devfn = (be32_to_cpup(&reg[0]) >> 8) & 0xff;
   248	
   249		return 0;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
