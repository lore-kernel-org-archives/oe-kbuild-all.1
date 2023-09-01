Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB56CAD41
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693577623; x=1725113623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1Mgvgi4sGCKTkwWVzQJpCm5fRW7e1qSPADYDYCr3Gg=;
  b=BIR5djPmX7mKJvuD6v7htrT42xlzxkLdUpwKa2BaP66kX+UxWMl9k8pw
   PHI3ztBvUlfx1zRLiAKrNIrKX1lbiw0zFaS8MehfBdVGnKg8UQ2IpQPT7
   MPTRaBrtNMlMDZNl3GNA1Jw/yMa718KfDbi/R3AsE9Ex3Vv4eMtMVsn/e
   EHcl9dfdy1L1eo/Uk5YOw11DJx76haXM5cDZLeSVGXTA/KxXqvPyp2oyY
   YZA40d6EsnKaySoN+PSn/199v0X0WpEH9YzLlksY4BsjqyKecJq47QCuX
   Nl/zvVLltnTQ9hozEewDAt0EFtQoidm8m90QoaQslYgWiYX9My6oOrdr6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407222553"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="407222553"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689782470"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="689782470"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 07:13:41 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc4u2-0001Lf-10;
	Fri, 01 Sep 2023 14:13:38 +0000
Date: Fri, 1 Sep 2023 22:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v6_usb 14/20] drivers/usb/host/pci-quirks.h:16:5:
 warning: no previous prototype for 'usb_hcd_amd_remote_wakeup_quirk'
Message-ID: <202309012219.jflBGI7z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6_usb
head:   e377b4565ebdcaebfefedcd32544f67570b6debd
commit: 56248dffe749c3d60088993e79bcb98105eca3f5 [14/20] usb: pci-quirks: handle HAS_IOPORT dependency for AMD quirk
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309012219.jflBGI7z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012219.jflBGI7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012219.jflBGI7z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/ehci-hcd.c:99:
>> drivers/usb/host/pci-quirks.h:16:5: warning: no previous prototype for 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
      16 | int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/host/pci-quirks.h:42:5: warning: "CONFIG_USB_PCI" is not defined, evaluates to 0 [-Wundef]
      42 | #if CONFIG_USB_PCI
         |     ^~~~~~~~~~~~~~
--
   In file included from drivers/usb/host/ehci-hcd.c:99:
>> drivers/usb/host/pci-quirks.h:42:5: warning: "CONFIG_USB_PCI" is not defined, evaluates to 0 [-Wundef]
      42 | #if CONFIG_USB_PCI
         |     ^~~~~~~~~~~~~~


vim +/usb_hcd_amd_remote_wakeup_quirk +16 drivers/usb/host/pci-quirks.h

     4	
     5	#ifdef CONFIG_USB_PCI_AMD
     6	int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev);
     7	bool usb_amd_hang_symptom_quirk(void);
     8	bool usb_amd_prefetch_quirk(void);
     9	void usb_amd_dev_put(void);
    10	bool usb_amd_quirk_pll_check(void);
    11	void usb_amd_quirk_pll_disable(void);
    12	void usb_amd_quirk_pll_enable(void);
    13	void sb800_prefetch(struct device *dev, int on);
    14	bool usb_amd_pt_check_port(struct device *device, int port);
    15	#else
  > 16	int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
    17	{
    18		return 0;
    19	}
    20	static inline bool usb_amd_hang_symptom_quirk(void)
    21	{
    22		return false;
    23	};
    24	static inline bool usb_amd_prefetch_quirk(void)
    25	{
    26		return false;
    27	}
    28	static inline void usb_amd_quirk_pll_disable(void) {}
    29	static inline void usb_amd_quirk_pll_enable(void) {}
    30	static inline void usb_amd_dev_put(void) {}
    31	static inline bool usb_amd_quirk_pll_check(void)
    32	{
    33		return false;
    34	}
    35	static inline void sb800_prefetch(struct device *dev, int on) {}
    36	static inline bool usb_amd_pt_check_port(struct device *device, int port)
    37	{
    38		return false;
    39	}
    40	#endif /* CONFIG_USB_PCI_AMD */
    41	
  > 42	#if CONFIG_USB_PCI
    43	void uhci_reset_hc(struct pci_dev *pdev, unsigned long base);
    44	int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base);
    45	void usb_asmedia_modifyflowcontrol(struct pci_dev *pdev);
    46	void usb_enable_intel_xhci_ports(struct pci_dev *xhci_pdev);
    47	void usb_disable_xhci_ports(struct pci_dev *xhci_pdev);
    48	#else
    49	struct pci_dev;
    50	static inline void usb_asmedia_modifyflowcontrol(struct pci_dev *pdev) {}
    51	static inline void usb_disable_xhci_ports(struct pci_dev *xhci_pdev) {}
    52	#endif  /* CONFIG_USB_PCI */
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
