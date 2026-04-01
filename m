Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F81D7E5C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 04:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775018680; cv=none; b=VBXu+i1FPJoKDmImhzTxPSNlZOkXth6utzrvAtDHlWjyRTcmgP2PZDHmDTgBwHe6vlk+//RumAnpoTUhLAnOnZqbZHWbvT0YM8/tDU7yBAeGXmcRdvQ6fnR11LNMO2Wj6ynaLai2UyYIp7ivMSvJVkoNbf8juclEnZTxLh2PPqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775018680; c=relaxed/simple;
	bh=byGmCghH7rQiVXehAQx14+OQPCpm3bpQRmIdETd7JPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uBrneFlWj9CZL6Nm5xge9QdWOF2pdAc4LXOX2a3UhPHyQdmUm9xPzoGh67k35EtBubsyXxZF8R+suwX7mMvsQnDugQtVUmHN4CFrjORUyYehLuzWtnYzNgkfcTAlLi5qMhwRQUP3ieWheCL7yYePpwTiO84N0GAH6a5Id1hK05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCdzPSFR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCdzPSFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775018679; x=1806554679;
  h=date:from:to:cc:subject:message-id;
  bh=byGmCghH7rQiVXehAQx14+OQPCpm3bpQRmIdETd7JPk=;
  b=fCdzPSFRBMmex2ZqC4OealTB3m6fxLZudtyK7vSXVqLjoa+pbibTTXVa
   NyVOyEzcD/AxtcB45h/R0N9JGBDmPsPWYxjWX9shnViiiKKs8ClxMuA6j
   MNdTvgBFQolEdMrWOrutkeSX6eNJs+OOS5gmysrH2lq8gZZ1ly+l7NRxf
   kEiAFU83FGX1B/UFDBl0QIJdoiAl5VICs3boVcgyJfMJI8gaIl+5VyJPh
   Vr/3ocWZ8VqZX5YB9lle/9r0MvpfsTTAEc3OzIDiHGJqImKhoHBc5X8RW
   CSSD4QM4PhqDzbRfdJPYoBS1UvBHbXPiqksJdmlog/kwZhlXgpx9sHt1x
   w==;
X-CSE-ConnectionGUID: cYd31T83TCuuaMNSj9ZDVg==
X-CSE-MsgGUID: +MrwL4e1SUCPC2q52ktUTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75932801"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75932801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 21:44:38 -0700
X-CSE-ConnectionGUID: wAquJ7RCRTqK9DQK3xPHdA==
X-CSE-MsgGUID: S1R6DYsYQvCAwvgYRxL9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221712348"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2026 21:44:37 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7nRS-000000004n6-3uUH;
	Wed, 01 Apr 2026 04:44:34 +0000
Date: Wed, 01 Apr 2026 12:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 10415/10705] pwrseq-pcie-m2.c:undefined
 reference to `serdev_device_remove'
Message-ID: <202604011226.KGNn5974-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 3f736aecbdc8e4faf2ed82c981812a6bfc76ea98 [10415/10705] power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
config: powerpc64-randconfig-r073-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011226.KGNn5974-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011226.KGNn5974-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011226.KGNn5974-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: powerpc64-linux-ld: DWARF error: could not find abbrev number 22
   drivers/power/sequencing/pwrseq-pcie-m2.o: in function `pwrseq_pcie_m2_remove_serdev':
>> pwrseq-pcie-m2.c:(.text+0x260): undefined reference to `serdev_device_remove'
   powerpc64-linux-ld: drivers/power/sequencing/pwrseq-pcie-m2.o: in function `pwrseq_m2_pcie_notify':
>> pwrseq-pcie-m2.c:(.text+0x924): undefined reference to `of_find_serdev_controller_by_node'
>> powerpc64-linux-ld: pwrseq-pcie-m2.c:(.text+0x9c8): undefined reference to `serdev_device_alloc'
>> powerpc64-linux-ld: pwrseq-pcie-m2.c:(.text+0xc00): undefined reference to `serdev_device_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
