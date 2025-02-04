Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82D217F50
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694385; cv=none; b=pivG4IN4QGs/g53NR70A0GDY/NgH9UWFwvoKcsgMLZneA6iM1EK/D4gMRmD1voN8QhL+JrUwR/vKVEidZcmjWYmjpMetGyF8hd/6n+FBaDmeDhXxtYXX7/GHz7ddoyn8FVkPlapqc6c8hslvb90AkKqAMKmnmeYLghSBxNd4eZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694385; c=relaxed/simple;
	bh=5S0QKmwTFeUhDozHvQ618I1DgP/95riFUr2oeJFlkeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqK2Bw4WqItlwiEIBR6OdqYbRnDWvLpLt1x1ad7uLaO9RMak0MO7pPZccJySNW0n78K1TOGom2+vL4/IFGzN0dFRhc5f3s08w0i7UQN4El2ldwJXbozm+GgAf5d4ELtdvSwPX8UHIqILS7DAOPncN3h56K5BpCciwhji7q89Vy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9jDB1fy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9jDB1fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738694383; x=1770230383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5S0QKmwTFeUhDozHvQ618I1DgP/95riFUr2oeJFlkeI=;
  b=H9jDB1fybpMm2kIKPH9jmQ3KHwuXSEjNoK+r14XfCznRQa7Wcu8KqTxV
   QaXTT6G/fkN63bA9aykvQNwlPYMal9csLayIC14NtGj/LtVb8JmsipmXp
   Ezah/a3AWndnby8f+Qeo4QsK8Ok0I4CERR2j+JIlAu3n7OU1Nxxm/sgXE
   VzjsEzcxkG1a+bbjDZmyu+BTetySRiP4bsdEfgnX45gI8Jc/pu5iVvSTS
   L30yQTah917I7NHmJmkjfjM5M99n8HJTHYcSdAREfmhdAbNNZKGLZMRsp
   s5N14p4fs68c3YGXytF/69xn5kfbaHyE34N06I4AG06321gWuqWrX3Zwt
   A==;
X-CSE-ConnectionGUID: B8kSInHDTWmwOe6v3sXqqw==
X-CSE-MsgGUID: wcNWdbatSzWV1aM6aQ4oVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39343441"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39343441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:39:42 -0800
X-CSE-ConnectionGUID: c7nQQf1BTK+Ucz1jcLka0g==
X-CSE-MsgGUID: sk/PULpaSdaxihg5meY0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115293722"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2025 10:39:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfNpi-000srb-2R;
	Tue, 04 Feb 2025 18:39:38 +0000
Date: Wed, 5 Feb 2025 02:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_misc_fixes_v1 38/59] include/linux/acpi_rimt.h:9:80:
 warning: 'struct iommu_ops' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202502050203.BfcAxUa6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_misc_fixes_v1
head:   65e185d21a77888b7620a36702a81f2e6c27164a
commit: 544db00508e971a1352eab4881a73ece81c49540 [38/59] IOMMU: RISC-V: ACPI: Register IOMMU
config: riscv-alldefconfig (https://download.01.org/0day-ci/archive/20250205/202502050203.BfcAxUa6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050203.BfcAxUa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050203.BfcAxUa6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu.c:16:
>> include/linux/acpi_rimt.h:9:80: warning: 'struct iommu_ops' declared inside parameter list will not be visible outside of this definition or declaration
       9 | int rimt_iommu_configure_id(struct device *dev, const u32 *id_in, const struct iommu_ops *ops);
         |                                                                                ^~~~~~~~~


vim +9 include/linux/acpi_rimt.h

3dafa382fb9e96 Sunil V L 2024-08-16 @9  int rimt_iommu_configure_id(struct device *dev, const u32 *id_in, const struct iommu_ops *ops);

:::::: The code at line 9 was first introduced by commit
:::::: 3dafa382fb9e96e142e0171bf1d49ffc34ad13ea RISC-V: IOMMU: Add ACPI support using RIMT

:::::: TO: Sunil V L <sunilvl@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
