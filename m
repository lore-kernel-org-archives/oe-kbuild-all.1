Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774EF8834
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635661; cv=none; b=ibCV8JZPHPgAU0O4JbtrU2z2/OWOmsYyzfMIJK9jZOP1oXUB1K31Io/mviHejJeggF6jGMuUzwDChfFMHvPAZQ/d9DkuLo3rt23VGJ1NTC61y/64Q3g1kKovMEYPicwn92lJcACr6hiRG0csUhl5LjcNnHLfVNpOEs7WvBCoZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635661; c=relaxed/simple;
	bh=sN9+fyBNzdHeFezNx10pPPS2Zxnwy9KuAi7+3PqXecI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibk/LdjB5RqffSbhRjRKTsHyzkY33n/aA5XxlM1gDLRSC6wTjswQIlgzcxamKZ6sDeZVV4cDM1ZplhWOBgxAKbjHFRQ63rujuNGeFIQJWEo9X5WA8PJXyM/8UDG9HXW3UZz+tpbZP1uPD+TATJMSJeKjJMU62N1EMbFHJq6yqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMVN/JYI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMVN/JYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758635659; x=1790171659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sN9+fyBNzdHeFezNx10pPPS2Zxnwy9KuAi7+3PqXecI=;
  b=IMVN/JYI6nq4EjG85wDq4uuZiilrwKZ6cPzaDOugxwqmdNETS0F1SuCZ
   9iQfyN1Ah+VNJm8gqjVqVvdks1AgYR86oNWdPjqAoDYeatsssaiQZws5H
   qY0ODp2gAexqyqEDHYH6Yz6BuDzYrlZwcMPkiAo0l4FRnIx4h9cDpAIgZ
   r08q636OulGi2YwzHHJHE67rQl2ScXqRN1f5hPKpCZGjZWCKYyQsLUrJp
   q0a5JynWmQI8Dr5WLUE4MfnTFlVKbE4pHMuLQ5c69N+2Uibu4iRpxjo8V
   zTyPrxvyLQ/eN1uBOXMwYklrzwyuUqFmXxSnSVNFHBG9U4q2S8MLxRWw9
   w==;
X-CSE-ConnectionGUID: ozQmnmqHS3GDK3yxwmdB2w==
X-CSE-MsgGUID: pT1WQaCrQY2hXjUoNlXkzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64550963"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="64550963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:54:19 -0700
X-CSE-ConnectionGUID: bQZSvj6hT6Or3Y9VF0F/qQ==
X-CSE-MsgGUID: CxXepJAyQuy1zz0L6ISeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="181941293"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Sep 2025 06:54:18 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v13TC-0003AD-2Z;
	Tue, 23 Sep 2025 13:54:14 +0000
Date: Tue, 23 Sep 2025 21:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909]
 include/../drivers/pci/msi/msi.h:113:57: warning: declaration of 'struct
 msix_entry' will not be visible outside of this function
Message-ID: <202509232154.ZKw00IX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yangxiangkai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f188c8019eb561258fec0741574f196e013c7fa6
commit: ad540a13eb8292fc92651b3bf281088a502a85f9 [2909/2909] virtcca feature: fix msi iova map
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232154.ZKw00IX1-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509232154.ZKw00IX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509232154.ZKw00IX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/coda/coda_pci.c:8:
>> include/../drivers/pci/msi/msi.h:113:57: warning: declaration of 'struct msix_entry' will not be visible outside of this function [-Wvisibility]
   int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
                                                           ^
   1 warning generated.


vim +113 include/../drivers/pci/msi/msi.h

897a0b6aa8c7ee Ahmed S. Darwish 2022-11-11  107  
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  108  /* MSI internal functions invoked from the public APIs */
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  109  void pci_msi_shutdown(struct pci_dev *dev);
18e1926b8c8b7c Ahmed S. Darwish 2022-11-11  110  void pci_msix_shutdown(struct pci_dev *dev);
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  111  void pci_free_msi_irqs(struct pci_dev *dev);
bbda3407982211 Ahmed S. Darwish 2022-11-11  112  int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
be7496c1ef47e1 Ahmed S. Darwish 2022-11-11 @113  int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
be7496c1ef47e1 Ahmed S. Darwish 2022-11-11  114  			    int maxvec,  struct irq_affinity *affd, int flags);
57127da98bc876 Ahmed S. Darwish 2022-11-11  115  void __pci_restore_msi_state(struct pci_dev *dev);
57127da98bc876 Ahmed S. Darwish 2022-11-11  116  void __pci_restore_msix_state(struct pci_dev *dev);
b12d0bec385b7a Ahmed S. Darwish 2022-11-11  117  

:::::: The code at line 113 was first introduced by commit
:::::: be7496c1ef47e1ba8c4b389ee23178fcf066cc4e PCI/MSI: Move pci_enable_msix_range() to api.c

:::::: TO: Ahmed S. Darwish <darwi@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
