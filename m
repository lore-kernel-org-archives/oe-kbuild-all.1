Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC37EBA31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716669181; cv=none; b=d101jrtfLOXAMOLxlD9MNkWDtG0EFKBXXkhvpSu8KpVFHpdn59Tt2fH3gys/UgYo43tO6nQZi2j+yhgi7mdCG0bePtxy12hW4W8tGzDjyQP2OQdNRcJpdX40EVDU2knhm8cdVKb+Qj+8sxqbO5f82pGJCQXmLBHR1BCnpHCwYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716669181; c=relaxed/simple;
	bh=ja8vPRiBOB+xFYPGJMEWMHT0OheXvOs8f4FVqzWZ3IM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+ce849sEzQlHnwdw30l74RZYV3HFzkVulFr7YMK3SGApbBUbdL3ZN5OlK8GzRNU2i3tDeETdqjmUNmfqvCQQiew0WqtlZxVmtXRozwwRHOz5BSdveueUf5BhipPQswjNlYGoUeODLiU43LAE97thH62pXHy6fFEEe/Nu3aAvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HD/qfPMk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD/qfPMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716669178; x=1748205178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ja8vPRiBOB+xFYPGJMEWMHT0OheXvOs8f4FVqzWZ3IM=;
  b=HD/qfPMk0t3h5RMNr7F1htzfPFGsGVe6n55uPmdsCc5eF6RIzprvFo9P
   Qq0VyAryFeLQr1ZxR6UIqDMqEbmQeND18Ro674jKw8SvlhHIx2z8I4ui9
   SkDl61QnUObbeWAPi8uzi7N3LRu9f4JIh1sgeVUcdr3al9QpA7PrxFq36
   ATRYIp3ZAlHxy8gtL/MXs8+0CTVkassqdsRYGBH/CMTqxDFFc+22CM/l/
   zJ17p/K1zdUMmpOfG0dnhuoSfEuocNu2H5bfQ39YUIHh77E3tSLCRP76/
   W3HsBQeO+FmoMeVxBIbA+x9AX9uOtILyzlpKfUBh4Qy+oyMO6tow6TY1r
   w==;
X-CSE-ConnectionGUID: uzXoirCVT7GhkyYw4bsGxQ==
X-CSE-MsgGUID: IKqjRY3sS+azi2TXiWA/zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="13199312"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="13199312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 13:32:58 -0700
X-CSE-ConnectionGUID: Waxf6xMnTQWT64SO4uZoig==
X-CSE-MsgGUID: rWeYykCxQ/C6kDGZNlXY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34854053"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 May 2024 13:32:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAy4V-0007Nh-0G;
	Sat, 25 May 2024 20:32:55 +0000
Date: Sun, 26 May 2024 04:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:mariusz-npem 2/3] npem.c:undefined reference to
 `led_classdev_unregister'
Message-ID: <202405260459.e8UpjbRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux mariusz-npem
head:   8c0fe797b46b074cc47ad3f7aa37f1cb26ab2106
commit: 2b921886c1475171d2408875478dcb02df2b8afe [2/3] PCI/NPEM: Add Native PCIe Enclosure Management support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240526/202405260459.e8UpjbRX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260459.e8UpjbRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260459.e8UpjbRX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/npem.o: in function `pci_npem_init.constprop.0':
>> npem.c:(.text+0x460): undefined reference to `led_classdev_unregister'
   ld: npem.c:(.text+0x4d4): undefined reference to `led_classdev_register_ext'
>> ld: npem.c:(.text+0x557): undefined reference to `led_classdev_unregister'
   ld: drivers/pci/npem.o: in function `pci_npem_remove':
   npem.c:(.text+0x5d0): undefined reference to `led_classdev_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
