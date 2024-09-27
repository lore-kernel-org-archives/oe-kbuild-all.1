Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C56018BBB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727439562; cv=none; b=KAs6yoq226B1uNlIDz7SaNGclhZi99DRTEEpo+1MPYxMBPemG1y6F1epfkCRv3WQHmeaLI1+jIs5FwsWgj6R04Qksq+N9F9w4DrcZ+r2b2AJal40k/SlQ+3pa9hl76yWSRD+pQTXZqZ+NlRuvC7wHBshPLWQ3b6p+uR+2imAqjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727439562; c=relaxed/simple;
	bh=WNb7zQLPYYqg4srD0I8mJRS7v9P6X2Wm3DQxwg/4aRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0LdgsCDoD4UbMo3sSSHfA8qWpK7KlER9NX3dBSF3c9QrVM0MVrA5FSY5P8Ok2sKg4n3lu/eNRHb6UgBaWX9jTNZg+fB28bw3X2m7/GsL5TbxA0TBhSO757iccqbtEcsrJrwo65e3gj7+KnWR8KdL+JyGPz1P9aQ2oZsJp27FbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHeL8Exq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHeL8Exq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727439561; x=1758975561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNb7zQLPYYqg4srD0I8mJRS7v9P6X2Wm3DQxwg/4aRk=;
  b=iHeL8Exq5aqFXV9MZsIzIFlqNsxpja6HbXNvWTKiKpacWbZ0f1dTPn2m
   NMMn8x5/dOU0NIU1PoWoU57e7tIdUkQjzLQyFU1OTIC5aMtmYsgpzUWdp
   0Q6H5DHPsKOpPacpW248veClKJGaJyxM6nefGMV/WXaWfnm5tFiKRdbFX
   FygpYE8e1BhDaKfydG7Y0VvvXrOuhXL0i23uVPIymwqnhimb5i5h1JVfl
   3b9RLaTAYL6FdgR+llU+eSl42uOtJLx+vKSAcBBaPnLKi9581BDWyHk1L
   ierfXrJNmZgRL136FrrK1PBzA7R+YB5zn+FNWTA5MJ7b++Xl5i5/G2A7C
   A==;
X-CSE-ConnectionGUID: ZKZIDcP+RMuLmGCDMXvxpA==
X-CSE-MsgGUID: gcEjTUKYSkqSyICvX8wWIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37162075"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37162075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:19:20 -0700
X-CSE-ConnectionGUID: E3YJjeEbRSqUa72LswGLhA==
X-CSE-MsgGUID: tlyGzWaEQuuowjMkcTCPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72826572"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2024 05:19:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su9wG-000Lt5-1Z;
	Fri, 27 Sep 2024 12:19:12 +0000
Date: Fri, 27 Sep 2024 20:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 643/1001]
 core.c:undefined reference to `ulpi_write'
Message-ID: <202409272042.PBj2fTY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: aca8761729017fb7d788d9c07e6c50b169b425f6 [643/1001] usb: dwc3: core: Add support for disabling vbus when suspended
config: loongarch-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272042.PBj2fTY4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272042.PBj2fTY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272042.PBj2fTY4-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/usb/dwc3/core.o: in function `.LVL441':
>> core.c:(.text+0x1e04): undefined reference to `ulpi_write'
   loongarch64-linux-ld: drivers/usb/dwc3/core.o: in function `.LVL497':
   core.c:(.text+0x202c): undefined reference to `dwc3_gadget_exit_hibernation'
   loongarch64-linux-ld: drivers/usb/dwc3/core.o: in function `.LVL544':
   core.c:(.text+0x21ec): undefined reference to `dwc3_gadget_exit_hibernation'
   loongarch64-linux-ld: drivers/usb/dwc3/core.o: in function `.LVL1045':
   core.c:(.text+0x36b4): undefined reference to `ulpi_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
