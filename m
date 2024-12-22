Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987018CBFB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734881299; cv=none; b=t9nHX4pDYOMGf1464Jk+yZVRZ0/iZPrPt03mbX/5Au5bbeGjXLELXqgeHFp2k+hHZ6wbOXtJ6IlxPZgpwb5yfweqSkcJZVO5KFkP5MFyPYzYZTs9D996fDsWbdUhaXELNXijMJ6L46+ALM9+3VFq8lhw2klvxrvnfMRbEABEt8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734881299; c=relaxed/simple;
	bh=quegypdy6zmaV1AZxTx/3zbpVZLInXFXJ2nIOCTRmZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fVzhi3fqCNnLvMxE4jFfJvtTDtzlKtPuJdDDDwXMlm5P3VgM6MfXA6SUtGtktwxXiPmpJTN5xWaLxSLSR142hJcLOVLRTtQzTN7hzTstsjXLkCPGj5YX1OngL1y/PM+RQchja8xc7jy3d2PPh4Pn0/cydITD2e1UMQho3LSgO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iz+Ev04+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iz+Ev04+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734881297; x=1766417297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quegypdy6zmaV1AZxTx/3zbpVZLInXFXJ2nIOCTRmZY=;
  b=iz+Ev04+Ihvyuq5T97HBPD/mPlqshPOx9Cu1epmSYSUHb3qh3ZYmzH3U
   n4EiPWUqlDuhUYtb6mvO79yF7f9BP2jL3uHr62HmLW+WZuzWv7UthN04v
   DziyAuXxXM9ih2vRAuSDFmuPhIe0EnGPv2ylRRDDgjioJmGYYP6LDOeBF
   x6cIt7hZFUiefV5nyjZgVVfOodndn7HrqlNUhS3TJaZDabkyjAohuhv3g
   AXdoTeEKRHCYSleGL2xzRg77pRmHY25Zn+nF5Jllt//U/2zt21jJwqa4r
   3zaCmstP3RhcvaH7RZ6xka7c3w45hMQhzkOyBPRQKmB4x+nKW0aQQs5Xn
   A==;
X-CSE-ConnectionGUID: vfixNPeASO+o96G57bCzkQ==
X-CSE-MsgGUID: limMBP58T5C5HtRizZ5jEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39300033"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39300033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 07:28:16 -0800
X-CSE-ConnectionGUID: 30FVzh0cQ7acISM2D5yhhg==
X-CSE-MsgGUID: p8OUSo/SSbK8daUF2EtUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="98790715"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2024 07:28:15 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPNsL-00031L-10;
	Sun, 22 Dec 2024 15:28:13 +0000
Date: Sun, 22 Dec 2024 23:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Corey Minyard <cminyard@mvista.com>
Subject: drivers/char/ipmi/ipmb_dev_int.c:344:36: warning: 'acpi_ipmb_id'
 defined but not used
Message-ID: <202412222349.R7qW7Q2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 51bd6f291583684f495ea498984dfc22049d7fd2 Add support for IPMB driver
date:   6 years ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241222/202412222349.R7qW7Q2t-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412222349.R7qW7Q2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412222349.R7qW7Q2t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/ipmi/ipmb_dev_int.c:344:36: warning: 'acpi_ipmb_id' defined but not used [-Wunused-const-variable=]
     344 | static const struct acpi_device_id acpi_ipmb_id[] = {
         |                                    ^~~~~~~~~~~~


vim +/acpi_ipmb_id +344 drivers/char/ipmi/ipmb_dev_int.c

   343	
 > 344	static const struct acpi_device_id acpi_ipmb_id[] = {
   345		{ "IPMB0001", 0 },
   346		{},
   347	};
   348	MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
