Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95528B7CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 07:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168344; cv=none; b=SonnzEZy+IKKh0Li0M9xwON0F2skE7T2bfdiJmBJhRKOA0buSaoERgkgt1mAiLJYZOszm99EA80mCPV1ypLPqL+XzTP9QjfQcTPBHyjvqqNfjKU1srbCuWZq7cN/CPiz9gPHMaVZyNHRKVjU4g1NnOWPOrGVohBv/yfObEIuVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168344; c=relaxed/simple;
	bh=MZtK77MBgKxKTpWrGUTQfgoiX1Bl5+KKgrbA5B4ePrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IlgoSlyqO+usXQ+58jktmAvJMaGFHFZqBwAw/QWHli/H9KV4czapdX6Q8YhGWWjWPij3aOCbNz62yrEl+wKjhin/1ioaiUsfjTGuB8UT8C6HtCgHD+stowswVmRLvqODOW5kVOAklprVAJgHLVD2TZC+wOeuCIJV91Fg5pg8yIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpOBn2Yn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpOBn2Yn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753168343; x=1784704343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZtK77MBgKxKTpWrGUTQfgoiX1Bl5+KKgrbA5B4ePrk=;
  b=fpOBn2YnKY0rpiqVV1zE+epZGiowK5OfuZpZxqbjFKn41W0R39O1f+7e
   uLiSMAQzi8KmmSgQBH8/FtbcMw5HyXeZ1/gxQY6Y5/7+eohw5rQdxKjnq
   ZY7Z9PWhvoZ6jE3Sth2qknUfgElADgT+qQjWI521aXwdgv3tH79rSEOC7
   NEAvWB8xsC4dx0GuIyKTk0FbdFrW5gHPCY2sq8+P1yYZMDS1dz+wORkmi
   0WN05f760fBLfIAIgF8VCOU1XeAU0EcHEZkqtvZIj+nNL1y0h5+t+kf6d
   qep+TwdGUE784SLmnt4B6Crzylqcqb+8WPvOZP5QrdMVmXqfv8fQxYgIi
   w==;
X-CSE-ConnectionGUID: vQswFt/1SVWq87KOlRDStA==
X-CSE-MsgGUID: DDjkuPUIS7isUysSF0IwIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59220230"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="59220230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 00:12:23 -0700
X-CSE-ConnectionGUID: jJXx461wTWGdvN0Vvkzs+g==
X-CSE-MsgGUID: h1Bn7HIKT0OdP9TiTBQMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="190005590"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jul 2025 00:12:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue7Ah-000HY3-2q;
	Tue, 22 Jul 2025 07:12:19 +0000
Date: Tue, 22 Jul 2025 15:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] kismet: WARNING: unmet direct
 dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
Message-ID: <202507221544.4rGZwsB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   98170019bf7a4069eb0c41aba1bad66e55c20835
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [9/9] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20250722/202507221544.4rGZwsB1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507221544.4rGZwsB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221544.4rGZwsB1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
