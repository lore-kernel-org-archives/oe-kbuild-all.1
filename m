Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A2E19E6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683815318; x=1715351318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0Ra3dpxGhtoXsvzx9SltT7x3Psnf25QXHv4DhGZtOw=;
  b=AbvbZQq6hU34rAahL4AMakcWR/C5z0Mf95m/5VzcrGzJC0//SdlhnuCv
   YW/xKR58wOTy0J3GBjMdCslzVvIWOiIDjb7q/6P/vfiCFXZcFDNqpleLu
   QWFwSFWa1qCQvLDM39xzs/OA9vQWewMRLFFb8kZj8RW7ExbGajj/XEnU1
   XK5dxW97h+IEDHKKtA2gTiZRl2SYES9lQSlK/CHqI2oYcPVcnEmoXzbi7
   VRoGg9dgR1U6YGstgAKFVowRV+5i/CPZxc+ymsiUhorPOIQrC32fbK2BT
   ayRurBi87tPISl0LoxGWguurbYBt3hKIL9rV0+pAKEGe80k5zVGcov9SE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335019416"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="335019416"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 07:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="946201305"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="946201305"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 May 2023 07:28:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px7HP-00042u-2q;
	Thu, 11 May 2023 14:28:27 +0000
Date: Thu, 11 May 2023 22:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:506:6:
 warning: no previous prototype for 'usb_amd_pt_check_port'
Message-ID: <202305112201.J7Yu1ib4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   fcecef87091e4f08191045aeffe0a93b54adba86
commit: 96ffabef0a84bae16aff7e26ac08322a27358e1b [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230511/202305112201.J7Yu1ib4-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=96ffabef0a84bae16aff7e26ac08322a27358e1b
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 96ffabef0a84bae16aff7e26ac08322a27358e1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305112201.J7Yu1ib4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/pci-quirks.c:506:6: warning: no previous prototype for 'usb_amd_pt_check_port' [-Wmissing-prototypes]
     506 | bool usb_amd_pt_check_port(struct device *device, int port)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/usb_amd_pt_check_port +506 drivers/usb/host/pci-quirks.c

7586269c0b5297 David Brownell  2005-09-23  499  
bde0716d1f076e Joe Lee         2018-02-12  500  /*
bde0716d1f076e Joe Lee         2018-02-12  501   * Check if port is disabled in BIOS on AMD Promontory host.
bde0716d1f076e Joe Lee         2018-02-12  502   * BIOS Disabled ports may wake on connect/disconnect and need
bde0716d1f076e Joe Lee         2018-02-12  503   * driver workaround to keep them disabled.
bde0716d1f076e Joe Lee         2018-02-12  504   * Returns true if port is marked disabled.
bde0716d1f076e Joe Lee         2018-02-12  505   */
bde0716d1f076e Joe Lee         2018-02-12 @506  bool usb_amd_pt_check_port(struct device *device, int port)
bde0716d1f076e Joe Lee         2018-02-12  507  {
bde0716d1f076e Joe Lee         2018-02-12  508  	unsigned char value, port_shift;
bde0716d1f076e Joe Lee         2018-02-12  509  	struct pci_dev *pdev;
bde0716d1f076e Joe Lee         2018-02-12  510  	u16 reg;
bde0716d1f076e Joe Lee         2018-02-12  511  
bde0716d1f076e Joe Lee         2018-02-12  512  	pdev = to_pci_dev(device);
bde0716d1f076e Joe Lee         2018-02-12  513  	pci_write_config_word(pdev, PT_ADDR_INDX, PT_SIG_1_ADDR);
bde0716d1f076e Joe Lee         2018-02-12  514  
bde0716d1f076e Joe Lee         2018-02-12  515  	pci_read_config_byte(pdev, PT_READ_INDX, &value);
bde0716d1f076e Joe Lee         2018-02-12  516  	if (value != PT_SIG_1_DATA)
bde0716d1f076e Joe Lee         2018-02-12  517  		return false;
bde0716d1f076e Joe Lee         2018-02-12  518  
bde0716d1f076e Joe Lee         2018-02-12  519  	pci_write_config_word(pdev, PT_ADDR_INDX, PT_SIG_2_ADDR);
bde0716d1f076e Joe Lee         2018-02-12  520  
bde0716d1f076e Joe Lee         2018-02-12  521  	pci_read_config_byte(pdev, PT_READ_INDX, &value);
bde0716d1f076e Joe Lee         2018-02-12  522  	if (value != PT_SIG_2_DATA)
bde0716d1f076e Joe Lee         2018-02-12  523  		return false;
bde0716d1f076e Joe Lee         2018-02-12  524  
bde0716d1f076e Joe Lee         2018-02-12  525  	pci_write_config_word(pdev, PT_ADDR_INDX, PT_SIG_3_ADDR);
bde0716d1f076e Joe Lee         2018-02-12  526  
bde0716d1f076e Joe Lee         2018-02-12  527  	pci_read_config_byte(pdev, PT_READ_INDX, &value);
bde0716d1f076e Joe Lee         2018-02-12  528  	if (value != PT_SIG_3_DATA)
bde0716d1f076e Joe Lee         2018-02-12  529  		return false;
bde0716d1f076e Joe Lee         2018-02-12  530  
bde0716d1f076e Joe Lee         2018-02-12  531  	pci_write_config_word(pdev, PT_ADDR_INDX, PT_SIG_4_ADDR);
bde0716d1f076e Joe Lee         2018-02-12  532  
bde0716d1f076e Joe Lee         2018-02-12  533  	pci_read_config_byte(pdev, PT_READ_INDX, &value);
bde0716d1f076e Joe Lee         2018-02-12  534  	if (value != PT_SIG_4_DATA)
bde0716d1f076e Joe Lee         2018-02-12  535  		return false;
bde0716d1f076e Joe Lee         2018-02-12  536  
bde0716d1f076e Joe Lee         2018-02-12  537  	/* Check disabled port setting, if bit is set port is enabled */
bde0716d1f076e Joe Lee         2018-02-12  538  	switch (pdev->device) {
bde0716d1f076e Joe Lee         2018-02-12  539  	case 0x43b9:
bde0716d1f076e Joe Lee         2018-02-12  540  	case 0x43ba:
bde0716d1f076e Joe Lee         2018-02-12  541  	/*
bde0716d1f076e Joe Lee         2018-02-12  542  	 * device is AMD_PROMONTORYA_4(0x43b9) or PROMONTORYA_3(0x43ba)
bde0716d1f076e Joe Lee         2018-02-12  543  	 * PT4_P1_REG bits[7..1] represents USB2.0 ports 6 to 0
bde0716d1f076e Joe Lee         2018-02-12  544  	 * PT4_P2_REG bits[6..0] represents ports 13 to 7
bde0716d1f076e Joe Lee         2018-02-12  545  	 */
bde0716d1f076e Joe Lee         2018-02-12  546  		if (port > 6) {
bde0716d1f076e Joe Lee         2018-02-12  547  			reg = PT4_P2_REG;
bde0716d1f076e Joe Lee         2018-02-12  548  			port_shift = port - 7;
bde0716d1f076e Joe Lee         2018-02-12  549  		} else {
bde0716d1f076e Joe Lee         2018-02-12  550  			reg = PT4_P1_REG;
bde0716d1f076e Joe Lee         2018-02-12  551  			port_shift = port + 1;
bde0716d1f076e Joe Lee         2018-02-12  552  		}
bde0716d1f076e Joe Lee         2018-02-12  553  		break;
bde0716d1f076e Joe Lee         2018-02-12  554  	case 0x43bb:
bde0716d1f076e Joe Lee         2018-02-12  555  	/*
bde0716d1f076e Joe Lee         2018-02-12  556  	 * device is AMD_PROMONTORYA_2(0x43bb)
bde0716d1f076e Joe Lee         2018-02-12  557  	 * PT2_P1_REG bits[7..5] represents USB2.0 ports 2 to 0
bde0716d1f076e Joe Lee         2018-02-12  558  	 * PT2_P2_REG bits[5..0] represents ports 9 to 3
bde0716d1f076e Joe Lee         2018-02-12  559  	 */
bde0716d1f076e Joe Lee         2018-02-12  560  		if (port > 2) {
bde0716d1f076e Joe Lee         2018-02-12  561  			reg = PT2_P2_REG;
bde0716d1f076e Joe Lee         2018-02-12  562  			port_shift = port - 3;
bde0716d1f076e Joe Lee         2018-02-12  563  		} else {
bde0716d1f076e Joe Lee         2018-02-12  564  			reg = PT2_P1_REG;
bde0716d1f076e Joe Lee         2018-02-12  565  			port_shift = port + 5;
bde0716d1f076e Joe Lee         2018-02-12  566  		}
bde0716d1f076e Joe Lee         2018-02-12  567  		break;
bde0716d1f076e Joe Lee         2018-02-12  568  	case 0x43bc:
bde0716d1f076e Joe Lee         2018-02-12  569  	/*
bde0716d1f076e Joe Lee         2018-02-12  570  	 * device is AMD_PROMONTORYA_1(0x43bc)
bde0716d1f076e Joe Lee         2018-02-12  571  	 * PT1_P1_REG[7..4] represents USB2.0 ports 3 to 0
bde0716d1f076e Joe Lee         2018-02-12  572  	 * PT1_P2_REG[5..0] represents ports 9 to 4
bde0716d1f076e Joe Lee         2018-02-12  573  	 */
bde0716d1f076e Joe Lee         2018-02-12  574  		if (port > 3) {
bde0716d1f076e Joe Lee         2018-02-12  575  			reg = PT1_P2_REG;
bde0716d1f076e Joe Lee         2018-02-12  576  			port_shift = port - 4;
bde0716d1f076e Joe Lee         2018-02-12  577  		} else {
bde0716d1f076e Joe Lee         2018-02-12  578  			reg = PT1_P1_REG;
bde0716d1f076e Joe Lee         2018-02-12  579  			port_shift = port + 4;
bde0716d1f076e Joe Lee         2018-02-12  580  		}
bde0716d1f076e Joe Lee         2018-02-12  581  		break;
bde0716d1f076e Joe Lee         2018-02-12  582  	default:
bde0716d1f076e Joe Lee         2018-02-12  583  		return false;
bde0716d1f076e Joe Lee         2018-02-12  584  	}
bde0716d1f076e Joe Lee         2018-02-12  585  	pci_write_config_word(pdev, PT_ADDR_INDX, reg);
bde0716d1f076e Joe Lee         2018-02-12  586  	pci_read_config_byte(pdev, PT_READ_INDX, &value);
bde0716d1f076e Joe Lee         2018-02-12  587  
bde0716d1f076e Joe Lee         2018-02-12  588  	return !(value & BIT(port_shift));
bde0716d1f076e Joe Lee         2018-02-12  589  }
bde0716d1f076e Joe Lee         2018-02-12  590  EXPORT_SYMBOL_GPL(usb_amd_pt_check_port);
96ffabef0a84ba Niklas Schnelle 2023-05-10  591  #endif /* CONFIG_USB_PCI_AMD */
96ffabef0a84ba Niklas Schnelle 2023-05-10  592  

:::::: The code at line 506 was first introduced by commit
:::::: bde0716d1f076e4c913c7946bcc858f71243c7a0 xhci: workaround for AMD Promontory disabled ports wakeup

:::::: TO: Joe Lee <asmt.swfae@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
