Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979B2AE68
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558993; cv=none; b=pkqfd/gWuKPuprpTkh6Qmmr0C2Vu5k+U7yE5ltgvU2JZ4Bm+ZYTN1BQQvs+yxu771RD3oxcNjNgtq0jycaybgDA/9rYF0vvQNzm60erZiXxhzR8F/wm9CgLwVNXk8iNIyhjA3eL6pWLqiOL7ZZ6LFp8ynukTXw1GQkeLu8DzZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558993; c=relaxed/simple;
	bh=W8ELZzd4nRRruSQsJsRt8IUOArTtIRBySSjAlc/yg9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QvRJ4ye9NnyE7QIddereQC7uYnFaaSz+6PcgCwMXC29nIEyDuz7QqMCuZa+/6i2LXkCO8OSx3QyIcseOy68rqtqm/MRz1maQ89A3qPUif7rqrTDeHdqQgeE6I9OIIq3bSILmAz4GZMgr4119W/YmA6Dwam3u4xpNWemob64G+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4dQoLDM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4dQoLDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766558992; x=1798094992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8ELZzd4nRRruSQsJsRt8IUOArTtIRBySSjAlc/yg9k=;
  b=l4dQoLDM3DxbGOUH5VK+oNtC5saW2c0wZjJMRPVkfRv4XEjClLszVnFx
   vuo8YQe7bU+77LnBljkV+QW5h0EX7VfULUUlB55KEr8hctcu6M3ewvbMG
   zBp+6WDMHZCTURJzUE8cFmNKB6JE6ND/6TQhFh76SdLciJct79to7aFDt
   3rkEFXMq8Lmx80zencT68ykeDl7NAMMlAKQ5jjIN/KYRsjz12mfUUD7fO
   bYc/etre8Ub93wwdttWV1mFfpswT8pLRZU/lt3Bu2C23j+Gz2ZuBDkM4C
   K6U/AIzbUuiv3ky6dxR3p/isThThzJnso77Stg6mH0PkEF5YeqSmoO900
   Q==;
X-CSE-ConnectionGUID: Dh6cnpV9STqPxReDCWpeCw==
X-CSE-MsgGUID: +hY5EYNaSwmN47LgTIrpkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79519027"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79519027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 22:49:51 -0800
X-CSE-ConnectionGUID: 0jYdjR5IRV+vAZUn+Zu4OA==
X-CSE-MsgGUID: JrbP0r7wSt6TNcHYzswoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="230614824"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 22:49:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYIgu-0000000069k-1esj;
	Wed, 24 Dec 2025 06:49:48 +0000
Date: Wed, 24 Dec 2025 07:48:56 +0100
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/pci-acpi-gsi-fix 8/8] Warning:
 drivers/acpi/pci_link.c:607 function parameter 'handle' not described in
 'acpi_pci_link_allocate_irq'
Message-ID: <202512240728.BW2yHu2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/pci-acpi-gsi-fix
head:   cfc67dde3af7103aaabe908e880a200d92422c0b
commit: cfc67dde3af7103aaabe908e880a200d92422c0b [8/8] ACPI/PCI: Handle INTx GSIs as u32 values not int
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251224/202512240728.BW2yHu2R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240728.BW2yHu2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240728.BW2yHu2R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/pci_link.c:607 function parameter 'handle' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'index' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'triggering' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'polarity' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'name' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'gsi' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'handle' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'index' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'triggering' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'polarity' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'name' not described in 'acpi_pci_link_allocate_irq'
>> Warning: drivers/acpi/pci_link.c:607 function parameter 'gsi' not described in 'acpi_pci_link_allocate_irq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
