Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359C176224
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802860; cv=none; b=NH0szXaZ+zAtTaVeiKTIkDzXdBrQhI5ojshX4IRFtM7mrul9rsszFZsKuzrz90gOzBzQSwtz7Co0KauoX+3n9b18p3yMLIn3kgHSFCsMhNxa/PGWVDpkogJ2ASL0R9xPQgiUtLdAllhTszjyEQBr4jAgwxJWS99kX2bz+uSKA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802860; c=relaxed/simple;
	bh=wu495sbP3mMtrqp/dvQfo0V3p5D15aa0eP5cjifE8eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ilA2n+voVgLGOBjrYHS9aq72hV5I5RlPKj7Sk8Psb02GYA9XoIk1O9KU1ke+t/BbjTtWvXRgnSKP8Sf4UKcvSa+aL714J318HAaTxbDT7EZWZYdP5+X6fgh5V1nTV+pUq+N69EFtmzwcBHdwDUY2NW+4GMgExRJgb7Zm0dH6Fu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SF6nfHcx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SF6nfHcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720802859; x=1752338859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wu495sbP3mMtrqp/dvQfo0V3p5D15aa0eP5cjifE8eM=;
  b=SF6nfHcxv9A3qahlQuC8s8cPCUXZ6mYme+stQABK9wNjHP9bgfoKyZu1
   e4ubfpsxjrxD/OUqAgUl9UFQ9TsLb1MHyVzESYXcYsyxXiQsrGPDv/Qla
   3XrBDgfxbTQcglhakVowC+cS+J8mVoaPjuX9RJFubOH8WF7pSuzwe6Geo
   Jo7ZGzthkjCIhA0y4CKUzcZJUN0jkXf2IJSgHJtKJurO/n+WnzkI0k0UF
   BVPQDwsneBWKPEPRsMjsq5BCC1d3yxVBXUAQoGYeoBx600vGlUGi1TiW5
   jNPuTKxjy5HxInoHS52cwvpmlST63Aa3ZkjbWwfJ1H1f2VlarRZIxmiBN
   Q==;
X-CSE-ConnectionGUID: w+cwyx5bSciAsxg3Vj+a/A==
X-CSE-MsgGUID: hz8ciAY5TmuvyaT8lvLc+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17872911"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="17872911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 09:47:37 -0700
X-CSE-ConnectionGUID: 08QrzsNxQEi3+hQNOYu2Mw==
X-CSE-MsgGUID: lmy+EmbMRo6bsMFWGvt9rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="54157230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2024 09:47:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSJQk-000b0w-0b;
	Fri, 12 Jul 2024 16:47:34 +0000
Date: Sat, 13 Jul 2024 00:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21349/23271]
 drivers/mmc/host/phytium-sdci.c:1483:23: error: lvalue required as unary '&'
 operand
Message-ID: <202407130055.5P1q7PDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   07c988f00903b4f0fbf9c31cea24351fbf885b1c
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [21349/23271] mmc: add support for Phytium MMC
config: arm64-randconfig-001-20240712 (https://download.01.org/0day-ci/archive/20240713/202407130055.5P1q7PDM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130055.5P1q7PDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130055.5P1q7PDM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/phytium-sdci.c: In function 'phytium_sdci_start_data':
   drivers/mmc/host/phytium-sdci.c:271:14: warning: variable 'read' set but not used [-Wunused-but-set-variable]
     271 |         bool read, res;
         |              ^~~~
   drivers/mmc/host/phytium-sdci.c: In function 'phytium_sdci_dma_irq':
   drivers/mmc/host/phytium-sdci.c:1018:29: warning: variable 'cmd' set but not used [-Wunused-but-set-variable]
    1018 |         struct mmc_command *cmd;
         |                             ^~~
   drivers/mmc/host/phytium-sdci.c: At top level:
>> drivers/mmc/host/phytium-sdci.c:1483:23: error: lvalue required as unary '&' operand
    1483 |                 .pm = &phytium_sdci_dev_pm_ops,
         |                       ^


vim +1483 drivers/mmc/host/phytium-sdci.c

  1475	
  1476	static struct platform_driver phytium_sdci_driver = {
  1477		.probe = phytium_sdci_probe,
  1478		.remove = phytium_sdci_remove,
  1479		.driver = {
  1480			.name = "sdci-phytium",
  1481			.of_match_table = phytium_sdci_of_ids,
  1482			.acpi_match_table = phytium_sdci_acpi_ids,
> 1483			.pm = &phytium_sdci_dev_pm_ops,
  1484		},
  1485	};
  1486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
