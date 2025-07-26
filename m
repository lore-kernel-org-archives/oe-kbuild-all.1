Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3551481DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753503068; cv=none; b=mwiy0fLfIu02BZSMofabhotPinZHCgY/CZLX23MNc2jpyIcsAVPZEo0RGK+cTnzW/oLZ/1inyb9fWQ5m03ZlEwCpgxUBX/ETsQZ4dBBmJyL8uwk+FP12to8Vb2c+kJRoXHhZePsVUeCGCzrmJWOYmekeVZujImQPYn6OYsz4uh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753503068; c=relaxed/simple;
	bh=YpjItT2gjinN8jut2jx9ZSpeu4ivaXfMB/v3lKFW/1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBj3IceKAgv3eLWAD3NVqfVdoUR8mVbJXwZHQjdOY3kdHu/8mb4Te27L00wBeWjf0Jvh4qeG690rgcP+9885PuMA3tea6aRp8X24SfzdO7dGLmcLcchqT4f+U+CsRrsV/2tZalbVFQeBDyR+MDvXUvrJYeHoWmfji5SyEYWWTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAm0jMf7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAm0jMf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753503067; x=1785039067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpjItT2gjinN8jut2jx9ZSpeu4ivaXfMB/v3lKFW/1w=;
  b=YAm0jMf7Eirp09ANBtln7220tmOL2zBR1IlgXstN40Nt97xPEakRha4R
   V9ITVe7cvEHuE7/XRJb/ETImHAAzdCO/gZxi9sJUgilpXrBoAxfEebon6
   qJouUMpOYup3h7iVatXN+76GPgsppj4gdBz1ZY1bw63GB/xQ25M6y/lkK
   yuZ1vmRYGnz6uAKQsh33kpttcU/srHDV+vVoP1hQar3nvGiw2fZU5qrOl
   8d8kIAMvkqvfgQrTlVnwBJblifeBA7JjTDf6xA1G+yFszUT4Q5DkuCfqt
   kFcG1HzP3zNvrLG5kByuGz3EmCFOPLXxwmAm5TcVczOX61s5dNTkBJY28
   A==;
X-CSE-ConnectionGUID: VdnJ/8S1TgKMcO5ie1C7BQ==
X-CSE-MsgGUID: L1e8+QGcQkqzP55BpwfPRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55920362"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55920362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 21:11:06 -0700
X-CSE-ConnectionGUID: cFw4GXdpTF6+qY3VA3l1ow==
X-CSE-MsgGUID: pDS0j+KxQkKj26FEsqupmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="184927410"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jul 2025 21:11:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufWFT-0000Dv-02;
	Sat, 26 Jul 2025 04:11:03 +0000
Date: Sat, 26 Jul 2025 06:10:55 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 89/112] include/linux/pci.h:2067:10: error:
 'PCI_NON_ISOLATED' undeclared; did you mean 'PCIE_NON_ISOLATED'?
Message-ID: <202507260640.eQChbdYx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   aea452cc27ca9e5169f7279d7b524190c39e7260
commit: 8397accf4ecdfff9b71532bc1153ad666e3d64bc [89/112] PCI: Add pci_bus_isolation()
config: arm-randconfig-2002-20250720 (https://download.01.org/0day-ci/archive/20250726/202507260640.eQChbdYx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507260640.eQChbdYx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507260640.eQChbdYx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/hwmon.c:22:
   include/linux/pci.h:2066:24: warning: no previous prototype for 'pci_bus_isolated' [-Wmissing-prototypes]
    enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
                           ^~~~~~~~~~~~~~~~
   include/linux/pci.h: In function 'pci_bus_isolated':
>> include/linux/pci.h:2067:10: error: 'PCI_NON_ISOLATED' undeclared (first use in this function); did you mean 'PCIE_NON_ISOLATED'?
    { return PCI_NON_ISOLATED; }
             ^~~~~~~~~~~~~~~~
             PCIE_NON_ISOLATED
   include/linux/pci.h:2067:10: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/pci.h:2067:1: warning: control reaches end of non-void function [-Wreturn-type]
    { return PCI_NON_ISOLATED; }
    ^


vim +2067 include/linux/pci.h

  2065	
  2066	enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
> 2067	{ return PCI_NON_ISOLATED; }
  2068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
