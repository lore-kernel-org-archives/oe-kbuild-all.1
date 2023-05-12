Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934D1138F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683874782; x=1715410782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NR7FH+bAgrXuHlwf8ON472YpOPr9cnHIX0RAYBNZqRo=;
  b=DfhEcGVusGAC3vkoRkJajAaSi6DIjo72DgVV4RFVtbTO6xFGrRnVQQcB
   KqxMlfatvdnigeFw72Tnd4nDfjT6zxWyBcilkwdzGW8AMiha1lRHe9wla
   yRFIcKoS/8d1uz1swGt7pn5aOyV+nJS1nH6gGsD0QDzNl+jtr+by8Ez0S
   SMCw/JN4ywFzkhbngScIaSzW2Czab2LPwzo28sX8vAXQhL9fLGleVCje2
   skDxKxJe/wywvq6RLRBIA8GZB/mCYRVyRhbTmPxIKB75T/sGQAIaXyL38
   2urgncWe6sijkB65Hj+6+1g66pwt9yqwUo/PZcZzYf5S9oTOyfOv4S7E1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352967559"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="352967559"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 23:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769674052"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769674052"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2023 23:59:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxMkd-0004cG-27;
	Fri, 12 May 2023 06:59:39 +0000
Date: Fri, 12 May 2023 14:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41]
 drivers/usb/cdns3/../host/pci-quirks.h:19:19: error: static declaration of
 'usb_hcd_amd_remote_wakeup_quirk' follows non-static declaration
Message-ID: <202305121408.ptloDx8N-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230512/202305121408.ptloDx8N-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=22366521cf677f472949762ac1c492baca4a8ffe
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 22366521cf677f472949762ac1c492baca4a8ffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121408.ptloDx8N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/cdns3/../host/xhci.h:23,
                    from drivers/usb/cdns3/host.c:18:
>> drivers/usb/cdns3/../host/pci-quirks.h:19:19: error: static declaration of 'usb_hcd_amd_remote_wakeup_quirk' follows non-static declaration
      19 | static inline int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/cdns3/host.c:17:
   include/linux/usb/hcd.h:489:12: note: previous declaration of 'usb_hcd_amd_remote_wakeup_quirk' with type 'int(struct pci_dev *)'
     489 | extern int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *dev);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/usb_hcd_amd_remote_wakeup_quirk +19 drivers/usb/cdns3/../host/pci-quirks.h

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
