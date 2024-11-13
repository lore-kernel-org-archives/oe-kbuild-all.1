Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DFC206E93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 19:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731526376; cv=none; b=KZmzfVJM9vdWcsyImi6djD/6rNSRYbnswutXAqiXKL8Sv2+XY21+G/485RZp7ACiuaaNulAhc4zCkYpCkK7jYi8htwd+1N2qbhVKdUYyX0uupvOPphtKIDGYnE823I8PRlpN9CI7APToNU1qKgE4BrfAnFH8TqpIaAZlD/+ydQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731526376; c=relaxed/simple;
	bh=jWl4YVQX8+R0RFAkZ1t0z9G+iDAvIlM7UDfQAbkumuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oBDJDr2IChzHOLhK5Nbqf77T5h/wY1QCy6fxIKw+jVMNNRzsYTx3BeutaRUMTAKL7086NgJwTLFEripn6OX40HtdYtI3lAnl7xx7+9Q8kVyo6RSlNqtFlk3LrLuSqLOakzDhOu8mJdqJoUReylIu9HmmA0TPQMXurvBYRIOSZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhLCvsly; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhLCvsly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731526374; x=1763062374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWl4YVQX8+R0RFAkZ1t0z9G+iDAvIlM7UDfQAbkumuk=;
  b=GhLCvslyA/nJ8NjjdzqJsyMYKNP4eGeIjPFcMNGqWhoPqKEJOpOQZu/u
   rl/M3c6N3FyZaLiEJYu/xnGY788E6CQ7QJG+bzYmlIisNWFangYdJFvqO
   g7qlpLzu7GbclfhLMtOd1n+FSkGP8pD1gjrirSTpo2AolcGErBG5cYdE6
   Cu8UMoB+2PuwFZRL+c8Zec1dJ9OGt/2LKzJ8h0R3P2ZrkIgSF+yFsHxwc
   kSvStAJ+NFWHEUPf/4E3ePyvc1PtAsro+W/lAcJMvqZast9PtAOut9GIC
   d+THW3AgshRCVLJdm3vJhyXMaE1U3pQVQIDFwv7jZ0Yn8PVd25+AXs7Ra
   w==;
X-CSE-ConnectionGUID: k5wWVIAbSuSyvU0nn7WXVw==
X-CSE-MsgGUID: Q0Sd6O67TaObrcTbySQuRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19043220"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="19043220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 11:32:51 -0800
X-CSE-ConnectionGUID: LOSGxEPOQ2+ZkTtIXqXH0A==
X-CSE-MsgGUID: 54NUDd3HRqm+8LguSwFi0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="87955577"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 11:32:28 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBJ6H-0000f1-1F;
	Wed, 13 Nov 2024 19:32:25 +0000
Date: Thu, 14 Nov 2024 03:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/spi/spi-phytium-plat.c:192:36: warning: 'phytium_spi_acpi_match'
 defined but not used
Message-ID: <202411140310.Hie7iwxT-lkp@intel.com>
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
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1294/1294] spi: add phytium spi support
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140310.Hie7iwxT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140310.Hie7iwxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140310.Hie7iwxT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:192:36: warning: 'phytium_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     192 | static const struct acpi_device_id phytium_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/phytium_spi_acpi_match +192 drivers/spi/spi-phytium-plat.c

   191	
 > 192	static const struct acpi_device_id phytium_spi_acpi_match[] = {
   193		{"PHYT000E", 0},
   194		{}
   195	};
   196	MODULE_DEVICE_TABLE(acpi, phytium_spi_acpi_match);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
