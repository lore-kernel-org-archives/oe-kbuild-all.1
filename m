Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB717BA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754443160; cv=none; b=Sf1OOlNDYc3msmqJHVE4liXzr3VyJYPewlVLQM3ym1qVdF7QsZCq0LErPYQzw5HCFWaOPuIy507rrs7HW082d2Z9sKWzQjC71VlsmjljYbj9U0vokJi6RRQ6H1+9cOePO5ld184GHHwHkV/N7areAn6aDFkk9O0KPgN4NgzljQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754443160; c=relaxed/simple;
	bh=zbxv/tV+53Qonsm4NoE3XsbamYLcNy3256iDjexguoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5W5zSR/pmtO/SaUnXKr2w+K0EQ3kC+FxW+GUSAfsdOUNGStFfk3K2/59SJtrpGH88OL3CBMl+dOSgG+SKd1R/XYyS8O+9vkbaWvi27wgPSCnZ/Z4ORdd4CG5zY+/t7ii+nqXuPbkz92YSFYpQyXa18K4m20FFUNmbWnoEjZSXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiBKdsUA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiBKdsUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754443158; x=1785979158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbxv/tV+53Qonsm4NoE3XsbamYLcNy3256iDjexguoc=;
  b=eiBKdsUAhwYphBdso6S/0Cge3DnlmLVmakN3qw80hX0WGqluYQ9870qj
   Jdi9fPv0CR/u4b0dvAj9EmNk7rNV0dvjxPnZs44l0Rs4CWkRWrGMxWPrb
   cQTjdcufr70aPZCg6Dn968yIdO5cMaJU2e0Ak2iP7HSlm+AIGhFvkq+yO
   lH7p+OCso2XJHxklzWI84dnYT9rPqRiygjJwLVp8OKffVERc8urJfCaFH
   io0uxe5f//aExNeulxNyL3GrIXxsE5YU2h1vd4i3kT034eHKyCB/Eluwb
   wXS1eiu1f0kA/WMi4A/50SgHyEAmakb5liRjqasL+NV0KbtcZL6mpFu+4
   A==;
X-CSE-ConnectionGUID: PAoQ8DJJTVGL3PMerl9eDg==
X-CSE-MsgGUID: wD5MTSr+RpeU/aFb4LLDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44345657"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="44345657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 18:19:18 -0700
X-CSE-ConnectionGUID: 93eov74fTjKj7sHEE2K3RA==
X-CSE-MsgGUID: vIfFt3ywQ82xEEgwD6iVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169090748"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 05 Aug 2025 18:19:17 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujSoE-00026l-2W;
	Wed, 06 Aug 2025 01:19:14 +0000
Date: Wed, 6 Aug 2025 03:18:30 +0200
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12797/13293]
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000
 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202508060314.nd1OkMLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
commit: 10a57c5627e4cfc2a447119973352e6b165147d8 [12797/13293] arm64: zynqmp: Add support for kd240 board
config: arm64-randconfig-2051-20250801 (https://download.01.org/0day-ci/archive/20250806/202508060314.nd1OkMLm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060314.nd1OkMLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060314.nd1OkMLm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
