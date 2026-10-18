Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F4392C20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335786; cv=none; b=BVDzd6uQL6zNurU6/WOLBmbnuAPKcoI7rAXVdm6GtNz3zmvP6VhHOJItRG+Xs4IfIQGWjQcazyp6SiXBKX636qHHEr/Gxdq3N4x6G1HCL2IoYqShlOMiFXIFJFi6gF0Lb3XUThPCPIlX5hgrAMJLUYVcsqmGPQ7HjSljoDlaqAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335786; c=relaxed/simple;
	bh=U00A7GxugOdRqx5Bd+tjwMzqnn4iSJiKCKjaZQPrgeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tz3qyETefmPofndIiXJBqmPYI7hQ6FOZujpSH3ATmjLDeNnxScTvvHZ8m6kKUDRoUk22cvl8fx+Y5Ok3gUXG1ypNrLkUu2ioKQk3t6H4r6bZlvt4b1jNtN9GFndpJgY7jfadWzlDB8TphZQOU6r8Vg7SxAiw1yuOc/zmItBt4uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYjtGQCK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYjtGQCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792335785; x=1823871785;
  h=date:from:to:cc:subject:message-id;
  bh=U00A7GxugOdRqx5Bd+tjwMzqnn4iSJiKCKjaZQPrgeE=;
  b=nYjtGQCKP0IkACBS9sg0/Myu9d8vhU9+QEH31aYTnMlkhp++XTEUJoUo
   KII0qfLYnwuqJEcCfICA5dpUUTCvd7AwLXujYejBrBsO7VLRZWISykPdK
   C8RIb7/LvKUc+Qed0Ax3wswrJjQUHSAPlpEDw0oxcMtdULHMagC7QvWiE
   Ghpo3ChFGYpFoit9xqRXPefwOMWGKbnQd65GbcH5hNPCKLd/B8SJj3pE0
   UuCVd7EoMZb0BuQegztIlD3yah7mc+zeM71S9NfyZF6O7g62759TvfFl0
   /o9EVUjcFLxFMfgtoVm8LW9rAsRxO/LDnFwItD++Y2CFVKs7MD0XPGGh3
   A==;
X-CSE-ConnectionGUID: 1uMF4OVyRLuS6i7y3WUR1Q==
X-CSE-MsgGUID: 6xrLONBBSfafIaIHj9MYIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="924125"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="924125"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 08:03:04 -0700
X-CSE-ConnectionGUID: mwZfvEYhRSK+W+tSGcDBhw==
X-CSE-MsgGUID: LoBCZVydQmiDQ0D1Yj60JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2420692"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Oct 2026 08:03:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xISPc-00000000KVW-3HWu;
	Sun, 18 Oct 2026 15:03:00 +0000
Date: Sun, 18 Oct 2026 23:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 145/343]
 Warning: drivers/pci/tsm/core.c:661 Excess function parameter 'report_data'
 description in 'pci_tsm_mmio_alloc'
Message-ID: <202610182344.kv6ZAcG5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-backend
head:   6bdc5a1448b75f784490ac2061dc32ee4bd3b5a4
commit: 89c47b66e8684b48e9f93d9500ef265ec4114804 [145/343] PCI/TSM: Support creating encrypted MMIO descriptors via TDISP Report
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261018/202610182344.kv6ZAcG5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182344.kv6ZAcG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182344.kv6ZAcG5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/tsm/core.c:661 Excess function parameter 'report_data' description in 'pci_tsm_mmio_alloc'
>> Warning: drivers/pci/tsm/core.c:661 Excess function parameter 'report_sz' description in 'pci_tsm_mmio_alloc'
>> Warning: drivers/pci/tsm/core.c:661 Excess function parameter 'report_data' description in 'pci_tsm_mmio_alloc'
>> Warning: drivers/pci/tsm/core.c:661 Excess function parameter 'report_sz' description in 'pci_tsm_mmio_alloc'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
