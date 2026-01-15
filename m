Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48491322A15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514300; cv=none; b=dOLvjDtqiu3cetP7jDQFG92zguggCBys0pFEJeXsL7BZzF1NzsJA5VLiUvTL/Cy17H32+oHzavD2/JuLAMMJEZTFZ53TSx100h2syn3IjKa3U1wkk/870mjdVq8XChB7YU9aSZNogWvmJFLgfZlSrT8n+n+RYqU8wapLG2oOKZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514300; c=relaxed/simple;
	bh=UNfBEZhGmeYN2ehWepReSBq/wyx6G8AN0XOs9saQ3mQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AIjIs8wbdGwiclCmAGKRceK5IF46syhbnkDIEh+tigvYwl60cqBVje6aji+ksL9TBhgoMnUZcmIC6Nw0+HPf0aXAsLqJx2AHnVyebprCRUQyR1/wOOZTIu7KSvLfpiXbeTrWEgz0wdlAbo31d+Soax/p8z+7qVSCuHPPqymPp9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSG9eFuu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSG9eFuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768514299; x=1800050299;
  h=date:from:to:cc:subject:message-id;
  bh=UNfBEZhGmeYN2ehWepReSBq/wyx6G8AN0XOs9saQ3mQ=;
  b=VSG9eFuudv/WhkGTGIVUuA8ySpaaHVovQSFc0X4KsbZknL/QPglZpKNK
   hTcH9xM1pexXe/6/+YrKeqbItAyBPckBTo4+rAUmiw6dQ1QTvMOlt7I0p
   DmyRtW7wYVp0YyqNOplQsR6NpN8fZoiLnGxDP/K34aA+uogLmL2X5ARb9
   QEIjx8Rsxg2QfYZHEtr68RkVQ/+soB4q/DbT0mTCzfkIT8P8yHDjZP4TY
   lVO160sELYRt/fSbZrwHDsoEYRBiKazV9IL3tL9+yPYk6ii/Oqth2h72g
   dE2n83KsIvpqN2t4Ow+rlHBu3+LOg9GU4hP7SvRCeccr7PRSEq3ybnTHG
   Q==;
X-CSE-ConnectionGUID: MKR+1zV0SiuOXriZd5ID/Q==
X-CSE-MsgGUID: nASsIgJIQaq3WNGJb8s6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69810686"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69810686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 13:58:19 -0800
X-CSE-ConnectionGUID: ZQrWrdMtS8+k8ERvg519AA==
X-CSE-MsgGUID: tHgRcpwuQPSztok7ER5ngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209205556"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jan 2026 13:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVM7-00000000K2W-0qeT;
	Thu, 15 Jan 2026 21:58:15 +0000
Date: Fri, 16 Jan 2026 05:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/mips-pic32-header-move 17/17]
 drivers/clk/microchip/clk-core.c:13:10: fatal error: 'asm/traps.h' file not
 found
Message-ID: <202601160551.O8M5ia1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux b4/mips-pic32-header-move
head:   0ffbdd0bc2954abd9c91cddb0b0d5030e87f68d5
commit: 0ffbdd0bc2954abd9c91cddb0b0d5030e87f68d5 [17/17] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: powerpc64-randconfig-r073-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160551.O8M5ia1E-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160551.O8M5ia1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160551.O8M5ia1E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-core.c:13:10: fatal error: 'asm/traps.h' file not found
      13 | #include <asm/traps.h>
         |          ^~~~~~~~~~~~~
   1 error generated.


vim +13 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13 @13  #include <asm/traps.h>
ce6e11884659988 Purna Chandra Mandal 2016-05-13  14  

:::::: The code at line 13 was first introduced by commit
:::::: ce6e1188465998820e7182455261b1f5d508ca17 CLK: microchip: Add Microchip PIC32 clock driver.

:::::: TO: Purna Chandra Mandal <purna.mandal@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
