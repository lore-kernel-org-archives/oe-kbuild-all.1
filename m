Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A701A9FAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857029; cv=none; b=j1x4VfEMmrkM2cPOyzJPup3y4UxH0PfRyDrmU+HOV9ySUbYWHBYgB/cybvNDp8e2gK5UrkrLmldtz7l8s5h1zHqIzi3jmK8/Yz7iwF8OlZvWJKcjQjafHeaOIOcQwDt4h98bmLC15lWUngJxjzsbwkTBl0W+m+NN3H4nQl+NtZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857029; c=relaxed/simple;
	bh=1c2PpNaqeAWcl8eHlAMMMSMNiumYisi0PL7DMBiNQX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2tK/JY5EASH6eZwTcFf6rSs5kzHCPA1aJXroUfwha9teBnU749ed0eUnM6H0PQMpHyb/9DRZjXLxBHLx2yrO4w10K9IdyNE+2m1ll9BmhIqctC3JJakbqnvhE3cw5DWaXnQ4+wrcf+TdvJugSF2GkelhznEKYxYOxcJLJoGtXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePb7dXLe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePb7dXLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782857028; x=1814393028;
  h=date:from:to:cc:subject:message-id;
  bh=1c2PpNaqeAWcl8eHlAMMMSMNiumYisi0PL7DMBiNQX8=;
  b=ePb7dXLejbOOBLGdziIoP/CTWriwlAMz0VZ4nTgFNVJHy7FJmUFGKd28
   PGLN7Roy1m7y3slW2SqCKhlv+MvW2gwfTIjFc7T7dsrKXA5I2fSNiYOKK
   EZOsqFPGsrAP7utoPO0yCwD5hpV9TAkYraOJ63JSBk+ZzjrHjlqo6eo0o
   FsA8HFiCEllR6iErIdAh6BFuUBZVJnIpfZFH2Rfj5xq8wfGud/J/daHUp
   sX+qCR+A7o1uKfQdSoQW/ZBWt1bA7SK0+cEEGmrusfmrI/wVwDgOdwAqX
   +dMCQ6EL6+CLLNlrhM4DPusPLCRHBWyv77upFapAoUDGqO/+9TaDjYNP7
   w==;
X-CSE-ConnectionGUID: Buqp0/EWRIG62j1A8oCk/g==
X-CSE-MsgGUID: xFxzS8P+TTqtWIGFUasR5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87493711"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="87493711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 15:03:47 -0700
X-CSE-ConnectionGUID: wDkm+WyqT/iu90lbCHG2hA==
X-CSE-MsgGUID: 5QaiA3lURk2X8HtPulcWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="248394171"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2026 15:03:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wegYP-000000008iv-3RvA;
	Tue, 30 Jun 2026 22:03:41 +0000
Date: Wed, 01 Jul 2026 06:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sohil Mehta <sohil.mehta@intel.com>
Subject: lib/crypto/mips/poly1305-core.S:95:9: error: invalid operand
 for instruction
Message-ID: <202607010554.rOjGEzLt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 7e54e993ab8c98d912f54ad6f46bfcc9dcd65368 lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/
date:   1 year ago
config: mips-randconfig-r073-20260701 (https://download.01.org/0day-ci/archive/20260701/202607010554.rOjGEzLt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010554.rOjGEzLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7e54e993ab8c ("lib/crypto: mips: Move arch/mips/lib/crypto/ into lib/crypto/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010554.rOjGEzLt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/crypto/mips/poly1305-core.S:95:9: error: invalid operand for instruction
    lwl $8,0+3($5)
           ^
   lib/crypto/mips/poly1305-core.S:96:9: error: invalid operand for instruction
    lwl $9,4+3($5)
           ^
   lib/crypto/mips/poly1305-core.S:97:10: error: invalid operand for instruction
    lwl $10,8+3($5)
            ^
   lib/crypto/mips/poly1305-core.S:98:10: error: invalid operand for instruction
    lwl $11,12+3($5)
            ^
   lib/crypto/mips/poly1305-core.S:99:9: error: invalid operand for instruction
    lwr $8,0+0($5)
           ^
   lib/crypto/mips/poly1305-core.S:100:9: error: invalid operand for instruction
    lwr $9,4+0($5)
           ^
   lib/crypto/mips/poly1305-core.S:101:10: error: invalid operand for instruction
    lwr $10,8+0($5)
            ^
   lib/crypto/mips/poly1305-core.S:102:10: error: invalid operand for instruction
    lwr $11,12+0($5)
            ^
   lib/crypto/mips/poly1305-core.S:265:9: error: invalid operand for instruction
    lwl $8,0+3($5) # load input
           ^
   lib/crypto/mips/poly1305-core.S:266:9: error: invalid operand for instruction
    lwl $9,4+3($5)
           ^
   lib/crypto/mips/poly1305-core.S:267:10: error: invalid operand for instruction
    lwl $10,8+3($5)
            ^
   lib/crypto/mips/poly1305-core.S:268:10: error: invalid operand for instruction
    lwl $11,12+3($5)
            ^
   lib/crypto/mips/poly1305-core.S:269:9: error: invalid operand for instruction
    lwr $8,0+0($5)
           ^
   lib/crypto/mips/poly1305-core.S:270:9: error: invalid operand for instruction
    lwr $9,4+0($5)
           ^
   lib/crypto/mips/poly1305-core.S:271:10: error: invalid operand for instruction
    lwr $10,8+0($5)
            ^
   lib/crypto/mips/poly1305-core.S:272:10: error: invalid operand for instruction
    lwr $11,12+0($5)
            ^
   lib/crypto/mips/poly1305-core.S:395:2: error: instruction requires a CPU feature not currently enabled
    multu $17,$8 # d0*r0
    ^
   lib/crypto/mips/poly1305-core.S:396:2: error: instruction requires a CPU feature not currently enabled
    mflo $12
    ^
   lib/crypto/mips/poly1305-core.S:397:2: error: instruction requires a CPU feature not currently enabled
    mfhi $13
    ^
   lib/crypto/mips/poly1305-core.S:402:2: error: instruction requires a CPU feature not currently enabled
    multu $23,$9 # d1*s3
    ^
   lib/crypto/mips/poly1305-core.S:403:2: error: instruction requires a CPU feature not currently enabled
    mflo $1
    ^
   lib/crypto/mips/poly1305-core.S:404:2: error: instruction requires a CPU feature not currently enabled
    mfhi $2
    ^
   lib/crypto/mips/poly1305-core.S:410:2: error: instruction requires a CPU feature not currently enabled
    multu $22,$10 # d2*s2
    ^
   lib/crypto/mips/poly1305-core.S:411:2: error: instruction requires a CPU feature not currently enabled
    mflo $7
    ^
   lib/crypto/mips/poly1305-core.S:412:2: error: instruction requires a CPU feature not currently enabled
    mfhi $24
    ^
   lib/crypto/mips/poly1305-core.S:415:2: error: instruction requires a CPU feature not currently enabled
    multu $21,$11 # d3*s1
    ^
   lib/crypto/mips/poly1305-core.S:419:2: error: instruction requires a CPU feature not currently enabled
    mflo $1
    ^
   lib/crypto/mips/poly1305-core.S:420:2: error: instruction requires a CPU feature not currently enabled
    mfhi $2
    ^
   lib/crypto/mips/poly1305-core.S:423:2: error: instruction requires a CPU feature not currently enabled
    multu $18,$8 # d0*r1
    ^
   lib/crypto/mips/poly1305-core.S:428:2: error: instruction requires a CPU feature not currently enabled
    mflo $7
    ^
   lib/crypto/mips/poly1305-core.S:429:2: error: instruction requires a CPU feature not currently enabled
    mfhi $14
    ^
   lib/crypto/mips/poly1305-core.S:432:2: error: instruction requires a CPU feature not currently enabled
    multu $17,$9 # d1*r0
    ^
   lib/crypto/mips/poly1305-core.S:436:2: error: instruction requires a CPU feature not currently enabled
    mflo $1
    ^
   lib/crypto/mips/poly1305-core.S:437:2: error: instruction requires a CPU feature not currently enabled
    mfhi $2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
