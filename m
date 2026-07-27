Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436173D522F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181887; cv=none; b=CojYjF547J4MpbUfvkb14ziH3qLixSspC8k5WpLUhR0MK5Dbqm6vvv2aSijlyZEmLPSUPxT0iTzUDNqF9C72Wkqk/Rn5l4HcMTN5iiG1rSrwlRbNtXgwoMB+2bhep03xyo0wOSEdvIRAT/kT82HLGHIn3RCe1a3ib5NRvZrwYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181887; c=relaxed/simple;
	bh=2MbWTNOxJI+hHruQMm2yN64VqyRnXl+9zHwE9B5bXfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ej8M0tEJjO3LBPx92VfhMdWDUfY5+nL0YDt06nkXf7mkLoG2YuXsrWWiPtzfP7RbUtOPnMvtm8XHQaILnb7kj6N/4X88fHct9vzNq1wo7/g8bKRuZLZXzwLZl0y7iI3CrZ1jhUJ6W3N74KmLNYcmNaYr697GxOPBacjhN9Etl/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBewfDoH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBewfDoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785181884; x=1816717884;
  h=date:from:to:cc:subject:message-id;
  bh=2MbWTNOxJI+hHruQMm2yN64VqyRnXl+9zHwE9B5bXfQ=;
  b=iBewfDoH/gNyPQb3ZP8rzGsGPPpbFkR4dxeCxVGJEPrpd7u3M5aZIjsj
   McIQdF65qT7jpl9QE4fKvWGlzMTDLX8IZEmTjzRwrLVWTxQFoQAhC+yz8
   mTI3968kHQiRH3sBwT8uwxqHM3lFd6Q1di1cYkR0XQLAVrzROi4JwjcGb
   +IL7yArdZHdUxwFr/s2nr+NBXN9zwkAtQiAEL0gekrWP4fCL4jW3BJqoJ
   b4fGo2hADCr8ahjKZmncWQsK8eZ9svIySNZ0zsztt7474vaqFFMe+0cMX
   yukr12Vg4/4WRb41evUck0+rbpDI7iUsO52XJ/7dw5CKoV7SwrAnj4q9X
   w==;
X-CSE-ConnectionGUID: +pzSi730TBKNB9BKriN7QA==
X-CSE-MsgGUID: 3a0i6pisS0mNzYlDHiU57A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85770984"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85770984"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 12:51:23 -0700
X-CSE-ConnectionGUID: uRxQoXSrQMyZid+RXLPWxA==
X-CSE-MsgGUID: GqLJ88feQTiEak2VPJtx5g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2026 12:51:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woRM1-00000000dRs-3EaC;
	Mon, 27 Jul 2026 19:51:16 +0000
Date: Tue, 28 Jul 2026 03:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:fix-p2p-acs-v1 120/121] ERROR: modpost: module
 pci_acs_test uses symbol pci_acs_egress_port_valid from namespace
 EXPORTED_FOR_KUNIT_TESTING, but does not import it.
Message-ID: <202607280355.wH4PgaHm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git fix-p2p-acs-v1
head:   034d02e984825bf85e76d4ee7b483b97cc530a1d
commit: fb7b659028d15c1932a9fffcfc8b15e2c740a913 [120/121] PCI/P2PDMA: Add KUnit tests for ACS routing decisions
config: x86_64-buildonly-randconfig-002-20260727 (https://download.01.org/0day-ci/archive/20260728/202607280355.wH4PgaHm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280355.wH4PgaHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280355.wH4PgaHm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module pci_acs_test uses symbol pci_acs_egress_port_valid from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
>> ERROR: modpost: module pci_acs_test uses symbol pci_acs_p2pdma_decision from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
>> ERROR: modpost: module pci_acs_test uses symbol pci_acs_egress_ctrl_set from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
