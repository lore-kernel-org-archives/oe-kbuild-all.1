Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4BE3AE183
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783309881; cv=none; b=MYg22Pv2QHuQNMlTJ2GDrk1N2d4C+Gew0GVshE5v6/jwFMDAlWyKM23SoKVNTB8QfJ9ypiKptFsbpWleTS6ijFyK+7SdB9OmpzHGyPTkWTAkydndi0Lckee9II3vXD3ygcMSHjXDjCFnIwBh1k+clMbezejjev0nWyZE+VuE0pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783309881; c=relaxed/simple;
	bh=cq5g6da2CYHkUoRG2vKi66RSihnCqh6yinnIylFuw8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ea6reZhsfu76lpziIRYzBi2rXjsJ+i6PYOwDdujvKspszAuBRyxaAAKMy25c/K1ydquZlUZtAw67FkewC7wHl9Rzg2X+mBgwi2E3M13X0UVWlTEMz1SXCtjcvKSu44dcwGYupJrvG1l4wBILWPHVUxLQQ8MDoFpKMA5s3IQ1SIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVj/xl6V; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVj/xl6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783309878; x=1814845878;
  h=date:from:to:cc:subject:message-id;
  bh=cq5g6da2CYHkUoRG2vKi66RSihnCqh6yinnIylFuw8I=;
  b=lVj/xl6Vjc4Z4iOCr+ETvrUXxqLf2coNTCpwjfQ8kidabioBxW4cTptv
   CVEq9jfGx0KVF1eorjUjzm9EmFecC51V9YX22GqyutVeHdQQDUu9XBnuD
   TqSKOPkHlbP7jixNUeuqM9g3RuFZ4obOxImwlCFn7huc3VEdjnUTOdhgs
   gwa4VjFEf+D0lBzRpDdznO2pnbPz/ykd8Ig4jHJ5BbGA5waPrpz+5vchq
   ZRXdPELbt3yoR0fiG991jKLfYgMwt1L0+J9AUzTe+8EyVVfD7nGqCVy9d
   OJDj5dTlVYqyEwiWBCMolsigDqcp84tOMYuPEPHK88Fc+BHrB8DiRYEDB
   Q==;
X-CSE-ConnectionGUID: khKHLDZbSD6duD+SFxsSCQ==
X-CSE-MsgGUID: G3jOb5b2SZKQkZGUnt1PXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83985114"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83985114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 20:51:17 -0700
X-CSE-ConnectionGUID: WYdCogIdTnGRty/vAL20mQ==
X-CSE-MsgGUID: 9vaIUU78Rz6pdQIO53qFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="249150231"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jul 2026 20:51:16 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgaMT-0000000025R-3ROv;
	Mon, 06 Jul 2026 03:51:13 +0000
Date: Mon, 06 Jul 2026 05:50:52 +0200
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/pci-tsm.h:190:27: error: 'struct pci_dev'
 has no member named 'ide_cap'; did you mean 'devcap'?
Message-ID: <202607060515.wyuwMYg6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/netlink-specs-Introduce-multi-message-blobs-for-SPDM/20260706-061114
head:   7b0e3368e5752b280b3e103dc5c66344b4127b08
commit: 75a7f7785a2652c0a4cf4a34ed858dfd556f62fb PCI, device core: Add private memory access for DEVICE_TRUST_TCB
date:   6 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260706/202607060515.wyuwMYg6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060515.wyuwMYg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060515.wyuwMYg6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-driver.c:22:
   ./include/linux/pci-tsm.h: In function 'is_pci_tsm_pf0':
>> ./include/linux/pci-tsm.h:190:27: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
     190 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                           ^~~~~~~
         |                           devcap


vim +190 ./include/linux/pci-tsm.h

aec427df4c0da0 Dan Williams 2026-07-05  166  
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
