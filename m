Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A60142659
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727545772; cv=none; b=qx1qj+ZWMjpkV7VfRKGoKwTpWx1UyECytycX3ZtUJf4a46Bma6vsAfy3UaIbLQO+E/uyh4wka1gRbLVHNXdzJyjmZJ0s8uaM/cQfX2bhL6pqBhO+cS6ocHmeDWxV8QEivkkc6coS+Ya5vIjLbk6cA2DW8vULhOFY0hXtIUaNOfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727545772; c=relaxed/simple;
	bh=PPjL6WGeGEoEP7VmQzQw71R5MPnwC4ZZjuNQ4V0dMyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTRLc/Nm4bkhl2Qg17c5FVKx66RLEnGSTcxv+v9NRjSt+DTMp0SAaeI7nXYaLsLiN/aOFaWc9gvAlgwjrFywDc1nnljoT3S59HNOOtEm5JUoHPIMj7SudqS0oCo2qhIl4ZGYivsuomaeqGMPc4b04i0uWThS89E8d3TyXAqPx2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBtESWA4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBtESWA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727545770; x=1759081770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPjL6WGeGEoEP7VmQzQw71R5MPnwC4ZZjuNQ4V0dMyU=;
  b=CBtESWA4YRP2x64B2k8NASTw81XMzrH6NkIp1tyaGhEPYLzPAjxS6wRn
   wRjUpZ7Sw85sVNCX/d2xmHNa1YPNBhflflRc5PENAOPzrKRceUjBtgHch
   s2/ZaoPiE7IfReY5h1uqsNC2NU1h5Xusc+xA+/QoVzjcS2jilk2JvPPyU
   enRvHVOupwSAaf9VFJUNVOM9EMixZuNk0ca9ggaftOB1H+Lz6Pko1HOL5
   /g6cdIUQa/ImKVjurdn5E2bxNO7O+1aDYD8LVdgvqZkV7huxeDLUchh+h
   AJnDRxpmSf7VQP0i+eE0l130LARftcpvtYUIctgMQIwLqtj70IZMkm5Q+
   A==;
X-CSE-ConnectionGUID: Bb6p171uRkavqCk9coafpQ==
X-CSE-MsgGUID: v/A0kMPZSx+gXzvSghO+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26184867"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26184867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 10:49:27 -0700
X-CSE-ConnectionGUID: vJc95K0yTsqZepMni97Yrg==
X-CSE-MsgGUID: 79K8ZC+aQbK+iQRzaGXIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77787946"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 10:49:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1subZL-000NVJ-23;
	Sat, 28 Sep 2024 17:49:23 +0000
Date: Sun, 29 Sep 2024 01:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21349/23799]
 drivers/mmc/host/phytium-mci-plat.c:169:23: error: lvalue required as unary
 '&' operand
Message-ID: <202409290132.fGKHm3da-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [21349/23799] mmc: add support for Phytium MMC
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290132.fGKHm3da-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290132.fGKHm3da-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290132.fGKHm3da-lkp@intel.com/

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
