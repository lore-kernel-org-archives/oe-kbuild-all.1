Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0757F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 01:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683855161; x=1715391161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9n0pqCvxxz/quh9iwgw+bfHIqTFKl0Z3VlAF1Mvv8vw=;
  b=nax/Osk1sj9i5a5vH+hm9kt157mIO2pD7EEUeAlSObxkOkP9fWi/kTip
   30ZrEnSHHUgPZzH3jERvmBHVhdiX/1dlBFKCUQ7AgQhnbej3pZNg+Jes7
   LV/Nd/b8VUEr2R6YA/pNNMqM9+rIVLGYV2ZVQxJOBAnwdCdaGk7E3ZKdm
   ZycQaN5dwBandKz9x0uSnU6utE32o2bb3Ri4MTixD0v9KdK7ylzUKkgDL
   ou+MuhJx0P+7X2KO3+nv7rJznqj3/R0m/F90lcHZxCDAOvkmtsWbJox96
   s/rngCYgVdzGHu9t/YWk3HG7UMRTneGJzi30sfaJBkppnPDHqtidSp8ly
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416300900"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="416300900"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 18:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677477238"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="677477238"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2023 18:32:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxHe4-0004O8-0f;
	Fri, 12 May 2023 01:32:32 +0000
Date: Fri, 12 May 2023 09:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.h:19:19:
 error: static declaration of 'usb_hcd_amd_remote_wakeup_quirk' follows
 non-static declaration
Message-ID: <202305120954.8Ylrk7aZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   68cc8a94b043dfb8a94359d5f0e1fe3dd82c5549
commit: 22366521cf677f472949762ac1c492baca4a8ffe [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230512/202305120954.8Ylrk7aZ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=22366521cf677f472949762ac1c492baca4a8ffe
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 22366521cf677f472949762ac1c492baca4a8ffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120954.8Ylrk7aZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/host/ehci-hcd.c:99:
>> drivers/usb/host/pci-quirks.h:19:19: error: static declaration of 'usb_hcd_amd_remote_wakeup_quirk' follows non-static declaration
      19 | static inline int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/host/ehci-hcd.c:24:
   include/linux/usb/hcd.h:489:12: note: previous declaration of 'usb_hcd_amd_remote_wakeup_quirk' with type 'int(struct pci_dev *)'
     489 | extern int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *dev);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/usb_hcd_amd_remote_wakeup_quirk +19 drivers/usb/host/pci-quirks.h

     7	
     8	#ifdef CONFIG_USB_PCI_AMD
     9	int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev);
    10	bool usb_amd_hang_symptom_quirk(void);
    11	bool usb_amd_prefetch_quirk(void);
    12	void usb_amd_dev_put(void);
    13	bool usb_amd_quirk_pll_check(void);
    14	void usb_amd_quirk_pll_disable(void);
    15	void usb_amd_quirk_pll_enable(void);
    16	void sb800_prefetch(struct device *dev, int on);
    17	bool usb_amd_pt_check_port(struct device *device, int port);
    18	#else
  > 19	static inline int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
    20	{
    21		return 0;
    22	}
    23	static inline bool usb_amd_hang_symptom_quirk(void)
    24	{
    25		return false;
    26	};
    27	static inline bool usb_amd_prefetch_quirk(void)
    28	{
    29		return false;
    30	}
    31	static inline bool usb_amd_quirk_pll_check(void)
    32	{
    33		return false;
    34	}
    35	static inline void usb_amd_quirk_pll_disable(void) {}
    36	static inline void usb_amd_quirk_pll_enable(void) {}
    37	static inline void usb_amd_dev_put(void) {}
    38	static inline void sb800_prefetch(struct device *dev, int on) {}
    39	static inline bool usb_amd_pt_check_port(struct device *device, int port)
    40	{
    41		return false;
    42	}
    43	#endif /* CONFIG_USB_PCI_AMD */
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
