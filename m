Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815B3009CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765623455; cv=none; b=Z3Efgatlq8e8C1SF5lfVA9AtQYFYFd8b0vANSv/4EEYgMZHXC5qpjKFJWH0CRiwnmQTTUb3zFrUljR9z+CnQsodoLQaDmExG5jHXsVmMuIttmICAhtTVETC+R4QS547HnWeTl8/lz70KxI877KnxO0nMwuW37xy3BrFp1eo6rtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765623455; c=relaxed/simple;
	bh=jwDluBrQVWV8/NoG11OQrpANlSB2uaGKUzlJqPNHCGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTPxbhSPje3h1y0dV72+rcn7QZHj9Lcm4B6OXEESfJ9So5WzKUrAra01nSWsjsUD4qSsZd4ZOM5587l+L3QS1njAV1nw7dFiUnWonMJ2bdGsuS+ahSlBHmqJnlrr40SZwy3BsMaUIr2kDzL9OXcoJiioc6aCTtFYRZTxql0NQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFazn+J8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFazn+J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765623454; x=1797159454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwDluBrQVWV8/NoG11OQrpANlSB2uaGKUzlJqPNHCGg=;
  b=iFazn+J8rJ8Sn0EjUcZ1iWgj3opA36s/EqhD9xTai+t53sbvgDUA7b5v
   CqG4WK5clTlmmINYpUnuFyCxnYGw7JaUjDD3kKy1/dzFKKVHMuSGFRM88
   TSZl5BHTDqYVhe6IM2x9bRbYTkb5iBTpcirizQtHFPS5erT9a84f64xld
   b22Wk/rgN/xwtsS8SPb7AiTqUOY13XaNdR/VtfRYcU081EJKgNO03Pz33
   OPUyPeXaJSUdVdRA9FTu+qavaYGC0tQ7jUyofv/wBQjqjW1YdcU9HUTxv
   L7ncIYppUSWlETohSZvy/Mugicczz3E6w00mdtQ854AFzDJLSKkyMhTCD
   w==;
X-CSE-ConnectionGUID: WRU+WiUCQU6pAnODRGcdZQ==
X-CSE-MsgGUID: m0trmyTsTRKhg+UST1eMDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67647356"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67647356"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:57:33 -0800
X-CSE-ConnectionGUID: Q/SrLPxhRy2YqOsiLiNWCQ==
X-CSE-MsgGUID: LACQwWNsQMmUY/eyCe/iNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196581168"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 02:57:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNJZ-000000007WP-1BZQ;
	Sat, 13 Dec 2025 10:57:29 +0000
Date: Sat, 13 Dec 2025 18:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: restricted
 __le64 degrades to integer
Message-ID: <202512131849.30ZRTBeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 53bb952a625fd3247647c7a28366ce990a579415 arm64: Kconfig: Enable GICv5
date:   5 months ago
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131849.30ZRTBeR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131849.30ZRTBeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131849.30ZRTBeR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: cast to restricted __le64
>> drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: restricted __le64 degrades to integer
>> drivers/irqchip/irq-gic-v5-its.c:854:13: sparse: sparse: restricted __le64 degrades to integer

vim +854 drivers/irqchip/irq-gic-v5-its.c

57d72196dfc850 Lorenzo Pieralisi 2025-07-03  845  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  846  static int gicv5_its_map_event(struct gicv5_its_dev *its_dev, u16 event_id, u32 lpi)
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  847  {
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  848  	struct gicv5_its_chip_data *its = its_dev->its_node;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  849  	u64 itt_entry;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  850  	__le64 *itte;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  851  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  852  	itte = gicv5_its_device_get_itte_ref(its_dev, event_id);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  853  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03 @854  	if (FIELD_GET(GICV5_ITTL2E_VALID, *itte))
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  855  		return -EEXIST;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  856  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  857  	itt_entry = FIELD_PREP(GICV5_ITTL2E_LPI_ID, lpi) |
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  858  		    FIELD_PREP(GICV5_ITTL2E_VALID, 0x1);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  859  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  860  	its_write_table_entry(its, itte, itt_entry);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  861  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  862  	gicv5_its_itt_cache_inv(its, its_dev->device_id, event_id);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  863  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  864  	return 0;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  865  }
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  866  

:::::: The code at line 854 was first introduced by commit
:::::: 57d72196dfc8502b7e376ecdffb11c4f8766f26d irqchip/gic-v5: Add GICv5 ITS support

:::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
