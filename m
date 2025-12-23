Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5742228468D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511452; cv=none; b=T8alFnTota1QNdJrzVlzAsP/Ta6QoGX1RfzCzqfkjOUW8XpV/W4kSGXxNQVkF3HS0aMcubISfqPCt/RVBqyk/St5CN+bSdj+puweRSNS4evm7N0zymW6Azw32NSWGx3EWzyKHzTUJrD+CXkxop5gDP61GUf9jyfdHT4+1oguIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511452; c=relaxed/simple;
	bh=vQbD0G3Z9oUiB3hAJgqcOow9MPzvJE+nOVkEjAjS6n4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qi5pKYKV/168DagXGP1dkhjG5HMXnNrXpCY/IdPlLOygiMmZ3oJI8QisRa0NDXFvRTY9wWaZTgK0rDTiK0QD/XzSKQWVdWa7dpR5rPGbnz6KAs/07Oet0GVB503JLF3lTj0w8+tktTQK8Z596CLTQLSwJNMw7XiLaeRpwtmDINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J60rjAVc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J60rjAVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766511450; x=1798047450;
  h=date:from:to:cc:subject:message-id;
  bh=vQbD0G3Z9oUiB3hAJgqcOow9MPzvJE+nOVkEjAjS6n4=;
  b=J60rjAVc2cYcVgNdE0FeTMfmrW+Lb90BhdITt2qJgrKu0Pkf93E3tEO7
   7+zMTSz2W5SZewXzJL7Gbnp0UTdQyXNmXsm30xML7fzO2Qcd8Yq4eaCNs
   u1r2Y2tKp/J3PBPC8n08760njav3trHw3Wy9UfaWdE4YA3lQlDj8BvUzc
   OP/G7LAfI+t4z1wbpRevJTRAts1wGzelhTcvIdQq8RY2152ALX70efUOE
   k5W3tyYYzKTAemnwC61zD0kLHE6FBP/onsmVND9jo/wRjkodo3Cm2QXcu
   rR5F9AeyR+DTIYdIfpcUo5rQunWWPXnoe7cY+iWZQOeRfYsmvHsvLbGpS
   Q==;
X-CSE-ConnectionGUID: 8kCLLQR6Ta6o48u6DHwP/Q==
X-CSE-MsgGUID: eydCzRexQ+KsJ+8ps7GwTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68299555"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68299555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 09:37:30 -0800
X-CSE-ConnectionGUID: nWv1PKyQQOSTBLB7o0NRKA==
X-CSE-MsgGUID: exZJ5IB6R/2UcPGBntdLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204357630"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 09:37:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY6K0-000000002E9-3Azv;
	Tue, 23 Dec 2025 17:37:22 +0000
Date: Wed, 24 Dec 2025 01:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/pci-acpi-gsi-fix 8/8] Warning:
 drivers/acpi/pci_link.c:607 function parameter 'handle' not described in
 'acpi_pci_link_allocate_irq'
Message-ID: <202512240230.fGGtL3LZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/pci-acpi-gsi-fix
head:   cfc67dde3af7103aaabe908e880a200d92422c0b
commit: cfc67dde3af7103aaabe908e880a200d92422c0b [8/8] ACPI/PCI: Handle INTx GSIs as u32 values not int
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251224/202512240230.fGGtL3LZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240230.fGGtL3LZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240230.fGGtL3LZ-lkp@intel.com/

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
