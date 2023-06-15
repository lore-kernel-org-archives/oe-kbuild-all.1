Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F404431
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686817181; x=1718353181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyO6y+PdlKExzlF7ToWNEcFBY1y/HLRrJmiIxJONUlA=;
  b=XExp4pPuhh5nyaE2qAQAmMU0sPqS5iNR4SkOhQ5Z3avoJIaMQ+A41OFW
   k0l70Y+kRs/taqROGRTc09ulTE53bT1AZQ+4HiimgfjIg2SYV/gHAEPKi
   vVpUvWPY+0167Vts/lx18Oitg+GFdVWsAw3gNHS+nu/j8ofWIajR6+w5D
   wf1pTq0CedIEoFjyh4vEH29nSEn1Tf4CcamuBs+w3r8nNcJq5wIps9KM4
   0ou/kZ35zBs0TPqtEH/iS7y8of80E33qBUBlR6sl+IwFFSITzrYL0R9M+
   VQKqHLs8Skc0OVYiRMTFg1w3m0TUe2EGlxuR1NF9YmrzZPpTSvQo2xTwK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="358842257"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="358842257"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 01:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="715543019"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="715543019"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 01:19:24 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9iCR-0001eH-2N;
	Thu, 15 Jun 2023 08:19:23 +0000
Date: Thu, 15 Jun 2023 16:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1] PCI: pciehp: Make sure DPC trigger status is reset in
 PDC handler
Message-ID: <202306151528.9ZEmHZMt-lkp@intel.com>
References: <20230615062559.1268404-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615062559.1268404-1-sathyanarayanan.kuppuswamy@linux.intel.com>

Hi Kuppuswamy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.4-rc6 next-20230615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuppuswamy-Sathyanarayanan/PCI-pciehp-Make-sure-DPC-trigger-status-is-reset-in-PDC-handler/20230615-142706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230615062559.1268404-1-sathyanarayanan.kuppuswamy%40linux.intel.com
patch subject: [PATCH v1] PCI: pciehp: Make sure DPC trigger status is reset in PDC handler
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151528.9ZEmHZMt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pci https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
        git fetch pci next
        git checkout pci/next
        b4 shazam https://lore.kernel.org/r/20230615062559.1268404-1-sathyanarayanan.kuppuswamy@linux.intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/pci/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151528.9ZEmHZMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/dpc.c:123: warning: expecting prototype for pci_reset_trigger(). Prototype was for pci_dpc_reset_trigger() instead


vim +123 drivers/pci/pcie/dpc.c

   114	
   115	/**
   116	 * pci_reset_trigger - Clear DPC trigger status
   117	 * @pdev: PCI device
   118	 *
   119	 * It is called from the PCIe hotplug driver to clean the DPC
   120	 * trigger status in the PDC interrupt handler.
   121	 */
   122	void pci_dpc_reset_trigger(struct pci_dev *pdev)
 > 123	{
   124		if (!pdev->dpc_cap)
   125			return;
   126	
   127		pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS,
   128				      PCI_EXP_DPC_STATUS_TRIGGER);
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
