Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9FD29D0D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729737937; cv=none; b=P/QyUZJeTI5xr6ZQETTxNokapks0a8995NPHe/Tlv2MzUd3Z2H/kzBRClWq/akYHhLAX/VeAtlgtSBegfpChVqmxjm9QxQK8b65RWqmiaJ+ifjod38qaQI5oDZ1ZSO1RHTvE57TfpY/uhpJKmMlHRbyJZswqynXBAHJ8Z+m/Trs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729737937; c=relaxed/simple;
	bh=nOEvj9z1lbmqE28eabgQpc5BlLgraGLfQiGtHmKz0ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PiPBlN5EaCNxY1eRAEghwimyMOh7H2wzfQdTEmyMBlExwUNzmyU7KjZJK/sWvedDTZ99SE1eu7PnD9gf7J1kIAze19it0lqVttgkCK4zBEuxpXJy6M1P6LqPdNXkrR7LjxZyxf5ooZqJ5zKeK5+vYRF+rT2EGH5G6UgIqiW6oDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6975Rhj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6975Rhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729737935; x=1761273935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOEvj9z1lbmqE28eabgQpc5BlLgraGLfQiGtHmKz0ds=;
  b=A6975Rhjbdm1F8jIIcDictDXs1l6NGxuKTh3E4HmM5Tmb8K57gFyjDXh
   g5lXM6czVx3VvkZsn1EDyhv1daimyszKK+M/y7iBWJFxD4tF8ETnptVDK
   53jB0NQCD0V2bpLpuO1F5EU0Q8MDXwwInbhKl5ysuf9bK6XD6zNu9N6mq
   kf4iyttJY8YS/X1DkPBfbPbUDSOmHXdJ1A5lNmocc5k1TXib2cmtzGvIB
   P+ujrGCabX1jN+fzyl2Xyw+58/hFi5klsLYN1GC6O7PTkqbOLqGBRIlvB
   upAAs+DjnJB3WZG20vGkkVDveERzYYuouFhtNelZD1cuz2ICNJD5x5Hea
   A==;
X-CSE-ConnectionGUID: ENLwDzxsRLGLqo6DOoF5cw==
X-CSE-MsgGUID: FLnvB+XyQf+QVNbnZtxkBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29517004"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29517004"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 19:45:32 -0700
X-CSE-ConnectionGUID: C/P5FWrxQ4qIqFTAxk+ghw==
X-CSE-MsgGUID: kOSvuacbQr2s4Y6AZ7rWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80761748"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 19:45:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3nqq-000Vqo-1F;
	Thu, 24 Oct 2024 02:45:28 +0000
Date: Thu, 24 Oct 2024 10:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/5] drivers/pci/pci.h:615:20:
 warning: 'pci_configure_aspm_l1ss' declared 'static' but never defined
Message-ID: <202410241039.kki04lRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   38edc4724f5ea26f3015dbe044c2ac4f79f7adcf
commit: a9ce883fd2ce3353edce4f3faa8c81ba8cd8e5d7 [2/5] BACKPORT: PCI/ASPM: Save L1 PM Substates Capability for suspend/resume
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241024/202410241039.kki04lRw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241039.kki04lRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241039.kki04lRw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/of.c:16:
   drivers/pci/pci.h:613:61: error: expected identifier or '(' before '{' token
     613 | static inline void pci_save_ltr_state(struct pci_dev *dev); { }
         |                                                             ^
   drivers/pci/pci.h:614:64: error: expected identifier or '(' before '{' token
     614 | static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
         |                                                                ^
   drivers/pci/pci.h:615:66: error: expected identifier or '(' before '{' token
     615 | static inline void pci_configure_aspm_l1ss(struct pci_dev *dev); { }
         |                                                                  ^
   drivers/pci/pci.h:616:67: error: expected identifier or '(' before '{' token
     616 | static inline void pci_save_aspm_l1ss_state(struct pci_dev *dev); { }
         |                                                                   ^
   drivers/pci/pci.h:617:70: error: expected identifier or '(' before '{' token
     617 | static inline void pci_restore_aspm_l1ss_state(struct pci_dev *dev); { }
         |                                                                      ^
   drivers/pci/pci.h:613:20: warning: 'pci_save_ltr_state' declared 'static' but never defined [-Wunused-function]
     613 | static inline void pci_save_ltr_state(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:614:20: warning: 'pci_restore_ltr_state' declared 'static' but never defined [-Wunused-function]
     614 | static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci.h:615:20: warning: 'pci_configure_aspm_l1ss' declared 'static' but never defined [-Wunused-function]
     615 | static inline void pci_configure_aspm_l1ss(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci.h:616:20: warning: 'pci_save_aspm_l1ss_state' declared 'static' but never defined [-Wunused-function]
     616 | static inline void pci_save_aspm_l1ss_state(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pci.h:617:20: warning: 'pci_restore_aspm_l1ss_state' declared 'static' but never defined [-Wunused-function]
     617 | static inline void pci_restore_aspm_l1ss_state(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +615 drivers/pci/pci.h

   589	
   590	/* PCI error reporting and recovery */
   591	pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
   592			pci_channel_state_t state,
   593			pci_ers_result_t (*reset_subordinates)(struct pci_dev *pdev));
   594	
   595	bool pcie_wait_for_link(struct pci_dev *pdev, bool active);
   596	#ifdef CONFIG_PCIEASPM
   597	void pcie_aspm_init_link_state(struct pci_dev *pdev);
   598	void pcie_aspm_exit_link_state(struct pci_dev *pdev);
   599	void pcie_aspm_pm_state_change(struct pci_dev *pdev);
   600	void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
   601	void pci_configure_ltr(struct pci_dev *pdev);
   602	void pci_save_ltr_state(struct pci_dev *dev);
   603	void pci_restore_ltr_state(struct pci_dev *dev);
   604	void pci_configure_aspm_l1ss(struct pci_dev *dev);
   605	void pci_save_aspm_l1ss_state(struct pci_dev *dev);
   606	void pci_restore_aspm_l1ss_state(struct pci_dev *dev);
   607	#else
   608	static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
   609	static inline void pcie_aspm_exit_link_state(struct pci_dev *pdev) { }
   610	static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev) { }
   611	static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
   612	static inline void pci_configure_ltr(struct pci_dev *pdev) { }
   613	static inline void pci_save_ltr_state(struct pci_dev *dev); { }
   614	static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
 > 615	static inline void pci_configure_aspm_l1ss(struct pci_dev *dev); { }
 > 616	static inline void pci_save_aspm_l1ss_state(struct pci_dev *dev); { }
 > 617	static inline void pci_restore_aspm_l1ss_state(struct pci_dev *dev); { }
   618	#endif
   619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
