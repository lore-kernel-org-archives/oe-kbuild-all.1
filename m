Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DB280A24
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109186; cv=none; b=pdydz54wzkdmCTFVEcxWfT2Ea3vdRSJCwkU41a8oezAy2d7xoF6SD8JtbS8zN1Z5ZAx3fg+fj7Vjnjf1ZweR5LiiplnJBBj+OOtMwr8vkjKXxM1dG2XYY9iO+lrsoR8PKXJBlgqdtlSBuDDhu+h5lRI6ctG63HUlU+no5t8DNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109186; c=relaxed/simple;
	bh=tZjnfiokOBeLroFQBLp/chSD77tNVHaADBCXT1jGO8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lATIuGl5SCN4eLYt8nT/I9TBvVguTp7YmaqF5bCtACFbhKI5MpbUKAbhdjTqu8kg42ykgWIHrbiFiWF7FuAIV9v1fb3vIlqA9jjyO5F5Gr9CgVJAw7AkAPMbsmDDPKw2AoHEcsQGW/mgYJGwekpnnsHkOa7GvCTxwKmPHSKwn1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ccxf8IIC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ccxf8IIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741109184; x=1772645184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZjnfiokOBeLroFQBLp/chSD77tNVHaADBCXT1jGO8A=;
  b=Ccxf8IICdbIzMBSshxS7jTQxvtoE+bCdB9ySuedLnBLG2hx43ejMjgll
   uMT2ECi2tTrEaO0btCzEFTtDWYENUbEcaVwXOKDAJ1S7nT/ed4ZdjEFph
   MF0PDHDCjXxA4YewaYFk4d+gBOZZURArlgEVPLOGx+yr4y42kjhUE2ny2
   O7vrg1YtK4/vbSKXlGUC83tJ7NNobSNTBUMLzCeCfHdKiLDtWHCokCG7Y
   0fUOcTFXcqrMhKl3tIdSl8eU041ES9oRhRltCR3f76ypkW2ses/66sDem
   28LDTJoGLoyxK5CSCrUoZyVg7T7cHthLH8YR0WySeP8pYt5vubCsYcxwK
   g==;
X-CSE-ConnectionGUID: 4n45kFNhTR2trFZFNGCo9Q==
X-CSE-MsgGUID: TX1i1CFBRDeQN51mdIK8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64484714"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="64484714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 09:26:24 -0800
X-CSE-ConnectionGUID: gEyadk8UQGGWhFCCJ5I93A==
X-CSE-MsgGUID: dr4+f/AVTKiYe/L9thuMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118581458"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2025 09:26:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpW28-000K4E-2P;
	Tue, 04 Mar 2025 17:26:20 +0000
Date: Wed, 5 Mar 2025 01:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mm_init/mem_init/v0.1 2/13] ERROR: modpost: "high_memory"
 [drivers/mtd/nand/onenand/onenand_samsung.ko] undefined!
Message-ID: <202503050123.WDAkoy5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm_init/mem_init/v0.1
head:   55eb95380e481029d5e7b8b442b0fdfbe79a9d3e
commit: 6daa1f5d8ea5504c283f562a925f9b8b0d1602d2 [2/13] dev: arch, mm: set max_mapnr when allocating memory map
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250305/202503050123.WDAkoy5Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050123.WDAkoy5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050123.WDAkoy5Y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: 'mem_map' exported twice. Previous export was in vmlinux
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "high_memory" [drivers/mtd/nand/onenand/onenand_samsung.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
