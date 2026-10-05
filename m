Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695B1EBFE0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 03:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791171078; cv=none; b=cncGao3twtwVZSuAfIhdUyMgVy17H7fG9f+PmGjcADe2fHOrgXDa0fJ5P7BjINEwZBlCsuBSgtesZ9Prtc85w4xagoMHRkaGkj+Tu9BZr6U/cQeqbPNKUORJ0ki/WZ8lsGhF2rWkKM7YIRQhMF8/OTCKQNKbmtYlOOW3UvAuvsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791171078; c=relaxed/simple;
	bh=ZJB8vapwDXqbAfUcpVPIRhvqx99ClilrP4RLtMU+fWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3FohfB0bEbIaW+0dMB3m8z+0HMa0yXhSZEMbWtf0etKU0H6QasiHU29zwhsdSi7H3QZa25jOXAoSJfo7ReJ7CTu73IQ67DLvRw0YrU9unmW008Kjpza4twyM2hhYX9GZ0TsInaU6Tn8C1q/YLAmKMcbHVCyEkQhJy4y17/IKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bG9IuKKD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG9IuKKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791171076; x=1822707076;
  h=date:from:to:cc:subject:message-id;
  bh=ZJB8vapwDXqbAfUcpVPIRhvqx99ClilrP4RLtMU+fWg=;
  b=bG9IuKKDim/i4BRAs0kASWfZGMvsMdxY4/RIxCP5yGDKAtjrUS3RhMoz
   QBksz42lZOB7dPZzhy35aUgG7TJXbeJ2tZGQbbuiHF2F6jOPAf1PG+dsY
   ZhfZTF1Onlsa4iY7hk4kCoahhpqvox0HRyF5NbsVeS8Fr8Z64zbUlvlag
   YidyubO3kEJnidQXS3TVbpQWYEw/AC3IeID5dxDDhAbzkkECwKcPVAsuX
   BNugFvuL+vGmjK2y1W/A85VYusrGObB4l9dplNdjfCwahkfrCepjDp3ZN
   db3gSL3QyBJ9bUzVKgfwHnrnZMb2XKQV2Bvs8uQ99wNpcHVBq3D/uRYwV
   A==;
X-CSE-ConnectionGUID: C4TMHhfQRsuvVBrNX8nm0Q==
X-CSE-MsgGUID: zjGixjYVR7uXpapfjE+WQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94547119"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="94547119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 20:31:16 -0700
X-CSE-ConnectionGUID: KCTRNr03Sj+IphM72RNXEg==
X-CSE-MsgGUID: u60MP+V+Qf6w7pKCIknEMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="279985352"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2026 20:31:15 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDZQ0-000000000Xn-3jfL;
	Mon, 05 Oct 2026 03:31:12 +0000
Date: Mon, 05 Oct 2026 05:30:37 +0200
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:arm_warning 6/11] ld.lld: error: relocation
 refers to a discarded section: .exit.text
Message-ID: <202610050547.a9neJaWM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git arm_warning
head:   73508bb5845d4444a8138da6f0c7a4e6492d1322
commit: ea370e1e782a07c1c22bce146c82765451fdcb11 [6/11] ARM: BUG: Move the __BUG() out of CONFIG_DEBUG_BUGVERBOSE
config: arm-randconfig-r2303-20261005 (https://download.01.org/0day-ci/archive/20261005/202610050547.a9neJaWM-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050547.a9neJaWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050547.a9neJaWM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation refers to a discarded section: .exit.text
   >>> defined in vmlinux.a(crypto/algif_rng.o)
   >>> referenced by algif_rng.c
   >>>               crypto/algif_rng.o:(__bug_table+0x0) in archive vmlinux.a
--
>> ld.lld: error: relocation refers to a discarded section: .exit.text
   >>> defined in vmlinux.a(crypto/algif_aead.o)
   >>> referenced by algif_aead.c
   >>>               crypto/algif_aead.o:(__bug_table+0x0) in archive vmlinux.a
--
>> ld.lld: error: relocation refers to a discarded section: .exit.text
   >>> defined in vmlinux.a(crypto/algif_skcipher.o)
   >>> referenced by algif_skcipher.c
   >>>               crypto/algif_skcipher.o:(__bug_table+0x0) in archive vmlinux.a
--
>> ld.lld: error: relocation refers to a discarded section: .exit.text
   >>> defined in vmlinux.a(drivers/ata/libata-transport.o)
   >>> referenced by libata-transport.c
   >>>               drivers/ata/libata-transport.o:(__bug_table+0x0) in archive vmlinux.a
   >>> referenced by libata-transport.c
   >>>               drivers/ata/libata-transport.o:(__bug_table+0x8) in archive vmlinux.a
   >>> referenced by libata-transport.c
   >>>               drivers/ata/libata-transport.o:(__bug_table+0x10) in archive vmlinux.a
--
>> ld.lld: error: relocation refers to a discarded section: .exit.text
   >>> defined in vmlinux.a(crypto/algboss.o)
   >>> referenced by algboss.c
   >>>               crypto/algboss.o:(__bug_table+0x0) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
