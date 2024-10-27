Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B618C31
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 05:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730007674; cv=none; b=VKx5cceM+6AH0/aaxjieh5bDGqc1XFSy5X+g8w4vCDAla5xh3Io6bl2CgLPN53+qbQd9uJS6J7czyxmz2vcKosGP1JubDAo7EeIA9iLbco73v45MLG1zLW7HdIl5ks6mDdknfh8eNU+UxkiQKO9zQdX8Mbbgz3EqWLgX2UNBesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730007674; c=relaxed/simple;
	bh=DWSPsfxpzMkflrHHItdxqGkuhthpRfWkk+2GuMkix3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=soVYm8ah7+UC0WxcNmWgyJ79Jy5jNuFICrguQk+sAl+YFdUI4UqSpy3WI/uUZpcFKrmNfXLfwf1eIFSIFnGM9BafH3fjHM0LGsInJSkTt4RyDxrnoDMnicNXnswuqmzb8hnPng3HGY4gA3xiM8HpwlO2QvFX+5aRobYZOfZCH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y98qW5FD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y98qW5FD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730007672; x=1761543672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWSPsfxpzMkflrHHItdxqGkuhthpRfWkk+2GuMkix3g=;
  b=Y98qW5FDvQ765D8BXyPGOqt0FC5dtCL3Z8XN+pHHmugmYadxjCypAMO8
   tYYnCgNQPdSLZRPomJrbUi8Dws/dSXFD6LJ5ZzvRiSE+QP8yweTANOh3n
   NwK+zWPMPl4q33y+rWjzoHWkX3m2nRubHkUp2lQ5APKdlW0U6ZVeOVDn5
   ZvjJgvSwdWDpM2Zl4Gc7ZmFFyT639UDNEfm4tG+vKb6dKl4lijFPSHceG
   A1Z1i2y7sfG02OZ3LHkREO9dMNzmKxpBTUdwnJGvk8A8p1GQjOJcW4m3N
   s+NnmW8zjrh2K/17g3/z2BCS4g9POOFXYGSjdxM8U5UHF2HuXULPVGuRE
   w==;
X-CSE-ConnectionGUID: Z9adaojVTOi5WRFlAsnSUA==
X-CSE-MsgGUID: ko1HkkZTShKAo+haJ4bNXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29588702"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29588702"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 22:41:12 -0700
X-CSE-ConnectionGUID: ECwujHljRmaU0C2aEFrA5w==
X-CSE-MsgGUID: gzG8iKXnQrqtrCtYQp7dIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="86073761"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Oct 2024 22:41:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4w1U-000aPM-2H;
	Sun, 27 Oct 2024 05:41:08 +0000
Date: Sun, 27 Oct 2024 13:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Chen Ziqiang <chenziqiang1686@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21351/23866]
 drivers/mailbox/phytium_mailbox.c:116:36: warning: 'phytium_mbox_acpi_match'
 defined but not used
Message-ID: <202410271354.1mcAMLbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 1ae9436b02e93f1f2b9cfc10226812197fbfcd04 [21351/23866] mailbox: add phytium mailbox driver
config: arm64-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271354.1mcAMLbG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271354.1mcAMLbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271354.1mcAMLbG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/phytium_mailbox.c:116:36: warning: 'phytium_mbox_acpi_match' defined but not used [-Wunused-const-variable=]
     116 | static const struct acpi_device_id phytium_mbox_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_mbox_acpi_match +116 drivers/mailbox/phytium_mailbox.c

   115	
 > 116	static const struct acpi_device_id phytium_mbox_acpi_match[] = {
   117		{ "PHYT0009", 0 },
   118		{ },
   119	};
   120	MODULE_DEVICE_TABLE(acpi, phytium_mbox_acpi_match);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
