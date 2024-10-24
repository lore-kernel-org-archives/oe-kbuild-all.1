Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B3191
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729728566; cv=none; b=XLK7q/OT1RnHdH19yl8doy2yt3t4PxD67/LNi4BrLbHqdbHG+9VhGsw6BRxQdfe1TjVrvFFsMffAR9OiSX5P3KPWRZKH+UvefWcvCuAw9wGXwa8cOdTNe0ybFVppDhLF9PMADHHljwrDsQKhnBhI+Pz1SUg43neZEuvFvzOH3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729728566; c=relaxed/simple;
	bh=DrhAKWph1JNxsh4LQEfW2jJmJ/rx1ze7BRRYqvgr0FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEu+0g6IWH39X/Ro2O98oiRoEPCD5EZThMwjQHa9+0jm09cnaF/NxnLn3KiVitJ4Hc59rHSGrbG6vZfMJUVx96RSx+x/bfgC80I5Ba6oodBMbYM7XsXosWLb5MHAlvkPzSCmg4sptO8hBnEcP1005n+76xgJVS12F39pbgFfVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKZDSuwQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKZDSuwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729728565; x=1761264565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrhAKWph1JNxsh4LQEfW2jJmJ/rx1ze7BRRYqvgr0FU=;
  b=OKZDSuwQ69qj0+bUorOcle5aMRu/rzZ/EjC5UvcpousHMj6keAFMOYjz
   9x3e/XMj1hBTALXReZo8gleaWnaq1HoOuEtH/x+JQQ/2kLQpb1j1zimGp
   /EwhlecTrpl24Ve2ZOSmjb5VyMC+ihp6S91vG4eoOg7EGGUWfX+d/h1vO
   1pScTUw8uHHhK/N74eQqJFql8azCGRQWCeJG+5h42ICPixziW8TkDinxV
   +xT3UbCszdxoEmk6EqtNCh5zCUD7Xp8MoRq3iINX9A1wepHjo1wRncnJ6
   rCUuoBZsIl4NKwz4oIPIA0cm1s1WIc0+OY4Y0pNfwf1A3KZX3FQNuvyHM
   g==;
X-CSE-ConnectionGUID: dBxO7g65Rmy+bimPeKDrEQ==
X-CSE-MsgGUID: GQWOc2NuQEWUG8U0Q2AB2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29273703"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29273703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:09:25 -0700
X-CSE-ConnectionGUID: q4Bq+KLoRxOK6kh6GH6WDg==
X-CSE-MsgGUID: RsHbVA2ITUe97yLof/QKpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="84980628"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2024 17:09:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3lPl-000VjM-0N;
	Thu, 24 Oct 2024 00:09:21 +0000
Date: Thu, 24 Oct 2024 08:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/5] drivers/pci/pci.h:610:61: error:
 expected identifier or '(' before '{' token
Message-ID: <202410240813.ILHkhksS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   38edc4724f5ea26f3015dbe044c2ac4f79f7adcf
commit: eaddd7157d019ff9415b6f65ae506f169a5d54c6 [1/5] BACKPORT: PCI/ASPM: Move pci_save_ltr_state() to aspm.c
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241024/202410240813.ILHkhksS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240813.ILHkhksS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240813.ILHkhksS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/of.c:16:
>> drivers/pci/pci.h:610:61: error: expected identifier or '(' before '{' token
     610 | static inline void pci_save_ltr_state(struct pci_dev *dev); { }
         |                                                             ^
   drivers/pci/pci.h:611:64: error: expected identifier or '(' before '{' token
     611 | static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
         |                                                                ^
>> drivers/pci/pci.h:610:20: warning: 'pci_save_ltr_state' declared 'static' but never defined [-Wunused-function]
     610 | static inline void pci_save_ltr_state(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~
>> drivers/pci/pci.h:611:20: warning: 'pci_restore_ltr_state' declared 'static' but never defined [-Wunused-function]
     611 | static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +610 drivers/pci/pci.h

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
   604	#else
   605	static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
   606	static inline void pcie_aspm_exit_link_state(struct pci_dev *pdev) { }
   607	static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev) { }
   608	static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
   609	static inline void pci_configure_ltr(struct pci_dev *pdev) { }
 > 610	static inline void pci_save_ltr_state(struct pci_dev *dev); { }
 > 611	static inline void pci_restore_ltr_state(struct pci_dev *dev); { }
   612	#endif
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
