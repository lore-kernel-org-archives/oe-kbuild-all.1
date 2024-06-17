Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6E190058
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718657348; cv=none; b=sIas3XFlQ51IQXJ9NwOD6zAQMpZIyTjZdrdmA8xzwWBwSvLV9+96D3rQGu9Hu0RWvnlFfF0Qm+KdS+lWoSAH1lbXSXxW1+vCxzs/hwNWgoJRNThNeu0UlsOS9g1UgudODNxTM0kDEyK94wwFqzsTkSfH4+6qshcnAFXLKz1xtXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718657348; c=relaxed/simple;
	bh=f3+rxih2CG39Lx2xmBcBDtv1H/B7htVyfwWf11XXo5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alY5qfJLfiXv6FGMDMOAfJgQ9CZUcWVZxVctc31LhjuRckXEeODgYRJN6ZC8nFUE0OUmH6vbk3iAGdY5tVky3SK7tuh7TvSJ0jkoeNdxib9CRkEm7Oh1xQ8gWbF24zFjqaNJfdfIc99cnSerhx8Q1SnzT16x1+IJN4wma5IuKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdM1UiLA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdM1UiLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718657346; x=1750193346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3+rxih2CG39Lx2xmBcBDtv1H/B7htVyfwWf11XXo5M=;
  b=RdM1UiLAAoLiUwHjjz0X0V9h8HY1iOZ3QbjxmWVve2+cG4A6LDDPcISP
   2Rh9OOH66JudTDhgdJq/kxux2riQ5M6qx1t6sYHR0v+eFKCdUEa2N8dGE
   QZHz5Rmc/50hfeowAUcNdTHj3c1fQtyFeLuAClFsRKUclsC4tMO76n+y6
   9AEh8FYIyPwvpiyWOimnO8ey2MpxgKpPjU6QMOjOpDq5oQ1nPPtN4STxK
   UaiaGH67abWr9SnKE0c4wTzQ/RWWQTIPScaVZrEHTw6sI+nzx79zoVaVX
   mF59iNtiM3o5/MQVoySJck6wtxyDg2eu4eXrxV0vhv8SPpYIHA0V4tdK7
   g==;
X-CSE-ConnectionGUID: ShbJLX8vT9+nhih+8FNzIA==
X-CSE-MsgGUID: LAFmZngASDyBZFd5bw5z5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15273192"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15273192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 13:49:02 -0700
X-CSE-ConnectionGUID: /hxzX2JURFKxTU0Vm2FkcQ==
X-CSE-MsgGUID: tFowS3TETb+DGuKZDzLCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45845764"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2024 13:49:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJJHf-0004sB-0Y;
	Mon, 17 Jun 2024 20:48:59 +0000
Date: Tue, 18 Jun 2024 04:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21349/22959]
 drivers/mmc/host/phytium-mci-plat.c:169:23: error: lvalue required as unary
 '&' operand
Message-ID: <202406180457.WkPIoFSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f79871cf083fa1da67dce06a8cc2301cdddeab1b
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [21349/22959] mmc: add support for Phytium MMC
config: arm64-randconfig-004-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180457.WkPIoFSW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180457.WkPIoFSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180457.WkPIoFSW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/phytium-mci-plat.c:169:23: error: lvalue required as unary '&' operand
     169 |                 .pm = &phytium_mci_dev_pm_ops,
         |                       ^


vim +169 drivers/mmc/host/phytium-mci-plat.c

   161	
   162	static struct platform_driver phytium_mci_driver = {
   163		.probe = phytium_mci_probe,
   164		.remove = phytium_mci_remove,
   165		.driver = {
   166			.name = "phytium-mci-platform",
   167			.of_match_table = phytium_mci_of_ids,
   168			.acpi_match_table = phytium_mci_acpi_ids,
 > 169			.pm = &phytium_mci_dev_pm_ops,
   170		},
   171	};
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
