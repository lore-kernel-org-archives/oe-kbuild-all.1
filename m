Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8581EE01A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 03:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783307238; cv=none; b=MKuP12wUPlIAcC+AunDt6qlbcx3lg6Q3nyZ7FD9+cNingk/jgL+RX9AZFofrhGrDZZ7Xxr4/GV0pIhiOXEkynDSL6DxtJZX2g+C9rInA7RKtA1JQXH+msaTudLuv0GwjeHhbA6TkURrxxfDnBUo+R//hTUZEVz003SPr6azZke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783307238; c=relaxed/simple;
	bh=2dPtSzUTZT4IXz61iMQbTq9VZ8vz8iRz2B61AuJ+Dn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MwLupoi8TZ/rY5j2DRSHyuFIHUX/D1srCeg2XoOfknGObSiDKZ/jyx9LBYjTyFnPFFkCE5vaEdeUe1Ys1e5dQ+fjvoyEc7w+4rh8C3PH6vHzMZOCl7vzKQk+f4X51E20iDjloZ0jB8j2QmSlQG0a8Yb/8Rp67BMjSQPv5NYpi0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1zg7C/r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1zg7C/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783307236; x=1814843236;
  h=date:from:to:cc:subject:message-id;
  bh=2dPtSzUTZT4IXz61iMQbTq9VZ8vz8iRz2B61AuJ+Dn0=;
  b=h1zg7C/rRvBv1Xyd1bQ6B0ui0biyuAW3QSCPKeTzHnGZkaO3VaQCfQat
   WhPLGb1+7huiQpLGRwdNNDW0WzcDO7I/YO4aBYWwREf6WIQASj6R9vT5w
   M3yuW4lXefuQHEXBjUyze9GbrZI4WQA7XCnAMeaOLL+JBg1nt8yCgq5CP
   w5qy8E3U+W4Nvp+efI0+2taWe6oXwFlNLK80irlHjBDxxM0mLOh/fxCY6
   GozD1Ot+zHGI0wPquv1f68OdAwBRznrkoTsqGEwD7YO7KMfpp7PPJ4xiH
   Acu2AtbpNH/fifZw+p2DfVRVwxZ2xw+QFw/2KAveoiKXcIj6WGZsfaWbx
   w==;
X-CSE-ConnectionGUID: pWFdWiNKTIy21hxjAGVgOQ==
X-CSE-MsgGUID: MeFZoYgeRqOg0a0u7QDpiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87846618"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87846618"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:07:16 -0700
X-CSE-ConnectionGUID: buTJqbKeTaq/gWFXYBGqAA==
X-CSE-MsgGUID: CxDQrvdWQ5y/sjGx6cXCsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250240137"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jul 2026 20:07:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgZfr-00000000E2x-0zYa;
	Mon, 06 Jul 2026 03:07:11 +0000
Date: Mon, 06 Jul 2026 11:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 13/24]
 include/linux/pci-tsm.h:190:27: error: 'struct pci_dev' has no member named
 'ide_cap'; did you mean 'devcap'?
Message-ID: <202607061003.qAFuCy2e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: a2be27064cb1e7ccb165e331527d1123a4df0fc9 [13/24] PCI, device core: Add private memory access for DEVICE_TRUST_TCB
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260706/202607061003.qAFuCy2e-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061003.qAFuCy2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061003.qAFuCy2e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-driver.c:22:
   include/linux/pci-tsm.h: In function 'is_pci_tsm_pf0':
>> include/linux/pci-tsm.h:190:27: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
     190 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                           ^~~~~~~
         |                           devcap


vim +190 include/linux/pci-tsm.h

f224c20c3d7613 Dan Williams 2026-03-02  166  
3225f52cde56f4 Dan Williams 2025-10-31  167  /* physical function0 and capable of 'connect' */
3225f52cde56f4 Dan Williams 2025-10-31  168  static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
3225f52cde56f4 Dan Williams 2025-10-31  169  {
3225f52cde56f4 Dan Williams 2025-10-31  170  	if (!pdev)
3225f52cde56f4 Dan Williams 2025-10-31  171  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  172  
3225f52cde56f4 Dan Williams 2025-10-31  173  	if (!pci_is_pcie(pdev))
3225f52cde56f4 Dan Williams 2025-10-31  174  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  175  
3225f52cde56f4 Dan Williams 2025-10-31  176  	if (pdev->is_virtfn)
3225f52cde56f4 Dan Williams 2025-10-31  177  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  178  
3225f52cde56f4 Dan Williams 2025-10-31  179  	/*
3225f52cde56f4 Dan Williams 2025-10-31  180  	 * Allow for a Device Security Manager (DSM) associated with function0
3225f52cde56f4 Dan Williams 2025-10-31  181  	 * of an Endpoint to coordinate TDISP requests for other functions
3225f52cde56f4 Dan Williams 2025-10-31  182  	 * (physical or virtual) of the device, or allow for an Upstream Port
3225f52cde56f4 Dan Williams 2025-10-31  183  	 * DSM to accept TDISP requests for the Endpoints downstream of the
3225f52cde56f4 Dan Williams 2025-10-31  184  	 * switch.
3225f52cde56f4 Dan Williams 2025-10-31  185  	 */
3225f52cde56f4 Dan Williams 2025-10-31  186  	switch (pci_pcie_type(pdev)) {
3225f52cde56f4 Dan Williams 2025-10-31  187  	case PCI_EXP_TYPE_ENDPOINT:
3225f52cde56f4 Dan Williams 2025-10-31  188  	case PCI_EXP_TYPE_UPSTREAM:
3225f52cde56f4 Dan Williams 2025-10-31  189  	case PCI_EXP_TYPE_RC_END:
3225f52cde56f4 Dan Williams 2025-10-31 @190  		if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
3225f52cde56f4 Dan Williams 2025-10-31  191  			break;
3225f52cde56f4 Dan Williams 2025-10-31  192  		fallthrough;
3225f52cde56f4 Dan Williams 2025-10-31  193  	default:
3225f52cde56f4 Dan Williams 2025-10-31  194  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  195  	}
3225f52cde56f4 Dan Williams 2025-10-31  196  
3225f52cde56f4 Dan Williams 2025-10-31  197  	return PCI_FUNC(pdev->devfn) == 0;
3225f52cde56f4 Dan Williams 2025-10-31  198  }
3225f52cde56f4 Dan Williams 2025-10-31  199  

:::::: The code at line 190 was first introduced by commit
:::::: 3225f52cde56f46789a4972d3c54df8a4d75f022 PCI/TSM: Establish Secure Sessions and Link Encryption

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
