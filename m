Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8553A453D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550305; cv=none; b=gLbtckLFRSLFjepE8Rg6oDyPvozj71kKrbkBeZlkAAK/vhKRaQEGwAEiimxN+F2Ccrer0SExLVpcvPra/8UmQekp1b1WtA4SZle4jw2p5rZ+Ony0vVr7mfbb81E7gVpiiE1FPeqXi0kLhq7kZIRyiE1UvTFYutJtNg/vyL5IV4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550305; c=relaxed/simple;
	bh=M1uGkIwzEKhBaNvxLDehEoZBFPibw9Yypsnbd708vF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OdZvjg1U926s4GFjo4N07vmCFVdpAwEP4k6WZ/H6yowolaJ+LdnQaU4T7Bkk+aC835y9d3BzsSjGuPuwQUDBdZM06sh6rmOdzlLh8vcRa/N2THtOYQKk7XfwDh61E7WB3jlJuEkCDCOl7gu8ipF7+N/6xCVr6ztKvs4AX0KqHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5jInOQv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5jInOQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777550304; x=1809086304;
  h=date:from:to:cc:subject:message-id;
  bh=M1uGkIwzEKhBaNvxLDehEoZBFPibw9Yypsnbd708vF8=;
  b=a5jInOQvaM+vMm7JCwXatNDoh/f/H9f7YTxG/qJj+8iSa4RLf6TQB8uW
   5qrUWFIdAenkTsG5wQ4tzBcz++ybCvU5JXi4wjgfaZxgYem0VfyMwxynJ
   US/DnojFcV/nwOoiajY3A6hpT+dH3l0QuJvAHPTN0Lq03R73Jz9+sG82r
   wrRG9z11Go3IG9tlQBVKLV3fmr2nG+e9JjwFiyuEL5y22gV4H0asS/diZ
   hzh5dCNBdCC3mdWLpEF5WBPAEwxBQpR7GZb8waUzZIUTh5fB5widHLJkS
   lTYsx4B3NjjMRLL/D8d6AnfDBhoX3aoo29llnX9leNasCc2eiD935bGCS
   g==;
X-CSE-ConnectionGUID: 2eev+e/9SRyTd6lKRd8Wsw==
X-CSE-MsgGUID: Sp8piuwfRlm9s7jPIYLLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78390946"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78390946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:58:23 -0700
X-CSE-ConnectionGUID: qFU1FrBHTpCwOfXRRl5x4w==
X-CSE-MsgGUID: BBEtstYxS/SuH2LQmsokfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="238537159"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 04:58:22 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQ27-00000000CMm-3oEc;
	Thu, 30 Apr 2026 11:58:19 +0000
Date: Thu, 30 Apr 2026 19:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 0/3] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604301921.0g2JcAIv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: 7c26b11ce540a16cfaaee9da4894d8449bfe32e0 [0/3] net: phy: mxl: toggle SGMII AN on link change
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260430/202604301921.0g2JcAIv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301921.0g2JcAIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301921.0g2JcAIv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
