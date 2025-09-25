Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B831D6AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798562; cv=none; b=Q7MIFyB3llHzzRqAM7nvndVKnKR1BinDKSgAvrK1f6lBPxE360arwTAmGDQxteXdDJf+uC5KIiRRNcR3nEhEUy/VL+CG5ZpF0QJ2v79j8UbUNbqpP5AM5tiJpLBQQB7kxIMuq1MK37LJRHeeVE1SSNg/B0nomlN8ltZ/AwV/KwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798562; c=relaxed/simple;
	bh=GV4z7kbDv03Cml2lUiGV3sDBc4J48v+LtPXHD4cqpvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpfaP3yc4TriEg3NH11HVpt5jAUjAntNo6owYUgYppHd7j0Rd1bFrTzyOKeaEohxWJyK57WpAEEB/SY9RzzEkdFB38hG0fQe211pV/Y0KhT8CSD1I7m9LnhhjutAFVCYxAXwtgd8O/LwJ35zQFziXVxczkZCTZq4NCBZtATfsVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0gFGcBn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0gFGcBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758798561; x=1790334561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GV4z7kbDv03Cml2lUiGV3sDBc4J48v+LtPXHD4cqpvA=;
  b=L0gFGcBndBkFD4Hvz20kWC/8PllKjWJjful8DJ5ncAIl+YW0tGxPfaPa
   jHTrLdANnzoEZnFO1ZWyuWqmUZZuwAPljRe59Mx54TbqNwuR0D0x/PbCn
   XA3WIp/Ut/8f0ZQW8cRRGNfXCuoZqu+Oun3wOw8XsTXkooEN4X/FIJs9V
   2c3emIgs4fWuZ1h7sjbrh6Yo8Cm+A0D2tRJrJiZ+ytokVdlVVrzb2XmUQ
   BlAR9T6cE58akHBKhqqoFQ7fSIt40cxXdRLAeSMKO8C52x1r7B7shY7gC
   FV6TN+nElhDPTCAl6sWUHyYmNLc8ytOCewOwqT/+jlFJwV9zgR8bEN4eL
   A==;
X-CSE-ConnectionGUID: OTNaBUyBQByAw9fbTTxIjA==
X-CSE-MsgGUID: BoIykQ1ETGeF+RQoEjqKxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61027352"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61027352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 04:09:04 -0700
X-CSE-ConnectionGUID: A3lZUn1qQzuNM6UAXp/tDA==
X-CSE-MsgGUID: v1AGRiNQSAuanizYpdPa1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="181699590"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2025 04:09:02 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1jqN-0005AP-2e;
	Thu, 25 Sep 2025 11:08:59 +0000
Date: Thu, 25 Sep 2025 19:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [niks:b4/uid_slot 2/2] drivers/pci/slot.c:104:30: sparse: sparse:
 symbol 'pci_slot_default_groups' was not declared. Should it be static?
Message-ID: <202509251858.LEIbNYjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git b4/uid_slot
head:   87b502098882192d5986bcaec909f9a44a45cce4
commit: 87b502098882192d5986bcaec909f9a44a45cce4 [2/2] PCI: s390: Expose the UID as an arch specific PCI slot attribute
config: loongarch-randconfig-r133-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251858.LEIbNYjG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251858.LEIbNYjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251858.LEIbNYjG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/slot.c:104:30: sparse: sparse: symbol 'pci_slot_default_groups' was not declared. Should it be static?

vim +/pci_slot_default_groups +104 drivers/pci/slot.c

   103	
 > 104	const struct attribute_group *pci_slot_default_groups[] = {
   105		&pci_slot_default_group,
   106	#ifdef ARCH_PCI_SLOT_GROUPS
   107		ARCH_PCI_SLOT_GROUPS,
   108	#endif
   109		NULL,
   110	};
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
