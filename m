Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC302F39D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758144081; cv=none; b=HDttnbJVkGAXwKMF1w60hM6OkjRQewwF2mfh/DpERSTUCbLHlt8JmIu/rTASHMBn8iLCvW23tiR52D+l2lu4/eHDr7GMI8Tqv2UpJp9jHQE7tCXwMUre7xLyVo2efQhSeRaPLBe2qOrHY2gjd993s6Kn0IAPZDasfoBwaaJYf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758144081; c=relaxed/simple;
	bh=SqL+TVcLsLrDJjJl6yPSQ0tjObq5G1QCcYSkeF0VPkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFK9nk4eA/bCIY1Q1vZ3ft6Ec4gY+v+aL2kJdt9c8nS5Gb+Z+vGEv3XoFLvdXN+145qCbDSxZeKVN6X+Gpj3Ri/O5rEKo8RAFVf6FU3ltkIVnbw+szsg93IRXEy2UtcOzzK6mt5js8uYkaGu947kM4fXcNtQb9tG8KC5ld2mUCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euZB4v3b; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euZB4v3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758144080; x=1789680080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqL+TVcLsLrDJjJl6yPSQ0tjObq5G1QCcYSkeF0VPkA=;
  b=euZB4v3bzHdERnr0Jgv0xXYUb7eOcQzvfo8aVjeXVMSm5i5jU+Jgws7q
   dGMtfzq7S+cXdwik7QP/pGINKkW4dztzma6SGHb4JAwCjf/kaHtMyUK8P
   TyRE0sMNDp+AdAVUJB7MrRRz+QOsPH0wbsKO3lkzoZ7BYqNVzEZ/FbeyD
   FDe6oQu8CXCj7c32Sgj9846l/068FoBthEm0p7mbesrlhIrbXkyjo8WBi
   CFgd8k6TLCPcdXl1PBSW6yy7Q67KepgD5pLisM2q8qTNm2CDuL8OPI5A1
   ZCHZLqxw8VMqXl/+78/Zv/ZA455mebr1fHZUmNLC1q/chtNFKWZPn3S7L
   w==;
X-CSE-ConnectionGUID: NnxgsEL5TqCitMDTtlfB2w==
X-CSE-MsgGUID: eyIPthlxQmm3K5cD8iD1sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71888944"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="71888944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:21:19 -0700
X-CSE-ConnectionGUID: 4nAJlAu8SX6JAL3CAZb+iA==
X-CSE-MsgGUID: sGqJT+KdQRmqStCq18TVTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="174919107"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2025 14:21:18 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyzaW-0002Rj-0W;
	Wed, 17 Sep 2025 21:21:16 +0000
Date: Thu, 18 Sep 2025 05:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 1122/10189] ld:
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:undefined reference to
 `stmmac_simple_pm_ops'
Message-ID: <202509180514.cgiLM6Pg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
commit: c91918a1e9767fc40488f69436f61af90221615b [1122/10189] net: stmmac: pci: convert to suspend()/resume() methods
config: x86_64-randconfig-075-20250917 (https://download.01.org/0day-ci/archive/20250918/202509180514.cgiLM6Pg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180514.cgiLM6Pg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180514.cgiLM6Pg-lkp@intel.com/

Note: the linux-next/master HEAD ae2d20002576d2893ecaff25db3d7ef9190ac0b6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:(.data+0x320): undefined reference to `stmmac_simple_pm_ops'
   ld: drivers/net/ethernet/stmicro/stmmac/dwmac-intel.o:(.data+0x3e0): undefined reference to `stmmac_simple_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
