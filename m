Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D580338D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753498744; cv=none; b=ZcSuGkHSoM/AGEZ7CgSRnUOMv9XkDkXzv/jIyMFGF2Gl137WpmG2MSYHI6d6bTQA0wnYMBZdi+jyFIl385s873gpqpYu0zIbYyDI/HKTNK5yI19QR1ofN4QOL8wyNAMRCMPsjvyqviXP183mBVJMOFf5tEu2N/v/Bi4IdfIhDVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753498744; c=relaxed/simple;
	bh=hG6QTZckQVWGQosq5AgWGvw3uPT6YinfO8/ZUpi4Lg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQTKSda/kW0jRXoODozJWiq0FJ/xD9eKV37QEUwwvo1n48ZO9rw06j6QrvHR48XYqTt6qXGeCiJ2fd8LOyKL7XOl0P1LXjZEdJfxaGF09gIK23nyRHWyQKF1YC7oH0CacrCc0IwvIk0tovimJzPCAgvvPZapaddjoR7dBtBcVR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+ZaZ+1W; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+ZaZ+1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753498743; x=1785034743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hG6QTZckQVWGQosq5AgWGvw3uPT6YinfO8/ZUpi4Lg4=;
  b=M+ZaZ+1WYgx/9jT1FuvxG5TZ+3jHEG46ySCU3Xzi0rNLslvxh+7Ic2Kg
   jrr6BS8HgIAMyeuuZa9IPbYgeMqgfEpmfS+JbKMZK2QrHxgSC3ihurWLZ
   p6omNZNS8uQuy+T3jYHOy9DNKlQxf5VplQiUxCrhUualuyIHzeewG+fjP
   QD745cRM0bLQXp6WGnJvdcH+6criuY/p17x+MbDh8Nj5ou7w4gyrTpSeg
   Ay737OqzV9xhV+KEHRgiBegXVOn5NubUakUvxdQuN9sKdAiDN+Ynf79V7
   2HtOhKk3iTp/baDBQZDdzEG8ptpPC2odcbpe41uTNnjN4+HNLSBAtgVTv
   Q==;
X-CSE-ConnectionGUID: NZ9VxJVnS/KVe6KB5Eogug==
X-CSE-MsgGUID: WJ3A+awoSG2DogbaLQTedA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="66912296"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66912296"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 19:59:02 -0700
X-CSE-ConnectionGUID: aX9YGjUFQNyC8Tdp6IEWnA==
X-CSE-MsgGUID: 5qm7Cfb/Sz6j5xF1z9fbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161212753"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jul 2025 19:59:01 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufV7i-0000DX-2z;
	Sat, 26 Jul 2025 02:58:58 +0000
Date: Sat, 26 Jul 2025 04:58:46 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 89/112] include/linux/pci.h:2066:24: warning:
 no previous prototype for 'pci_bus_isolated'
Message-ID: <202507260425.j2QgNBgF-lkp@intel.com>
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
config: arm-randconfig-2002-20250720 (https://download.01.org/0day-ci/archive/20250726/202507260425.j2QgNBgF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507260425.j2QgNBgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507260425.j2QgNBgF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/mm/iomap.c:9:
>> include/linux/pci.h:2066:24: warning: no previous prototype for 'pci_bus_isolated' [-Wmissing-prototypes]
    enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
                           ^~~~~~~~~~~~~~~~
   include/linux/pci.h: In function 'pci_bus_isolated':
   include/linux/pci.h:2067:10: error: 'PCI_NON_ISOLATED' undeclared (first use in this function); did you mean 'PCIE_NON_ISOLATED'?
    { return PCI_NON_ISOLATED; }
             ^~~~~~~~~~~~~~~~
             PCIE_NON_ISOLATED
   include/linux/pci.h:2067:10: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/arm/mm/iomap.c:9:
>> include/linux/pci.h:2067:1: warning: control reaches end of non-void function [-Wreturn-type]
    { return PCI_NON_ISOLATED; }
    ^


vim +/pci_bus_isolated +2066 include/linux/pci.h

  2065	
> 2066	enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
> 2067	{ return PCI_NON_ISOLATED; }
  2068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
