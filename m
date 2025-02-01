Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7448A1CD1E0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738433988; cv=none; b=gXTdNqVnYESIsBwH7ShsSXWzuMh/yaXGGWDF05/VgEuv1By8YCvRx73JyANYNdVnf6LgR6BHCKA4cJtHpu2Cjp7Lhharzpd9p27ipg5UxUFadZ1W1y1rJJ1TYePYU8G5cTpsNsfEexZL1pfvo7ybRL0LiLMz9aFITAKlozMHk4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738433988; c=relaxed/simple;
	bh=5iYGG1wWPcZ0bzt14T4NPbFk++tOHVWA0UAKJ14kSPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=by0aaEreWCeucmJVzEflr3a5iSIY6wHXDT2LQ5LehgULNxLiCTTNpepPCyOtmsi6OleGSQh6i9O1nORAgHoIN9Bk47blijz+3n48j3sLRz+K1BV97fncFl2+OriCo11mnws3MOaAVHpb1fX59zNzMkjG3OQ81TUG8JLsoibVMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad4x/OK4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad4x/OK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738433986; x=1769969986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5iYGG1wWPcZ0bzt14T4NPbFk++tOHVWA0UAKJ14kSPA=;
  b=ad4x/OK4iPowiUU20E9/SHvSQPDqP//th90c8gbOBYyBz+rVopnzzGzO
   thhdA94+iiGcW5VrfabZYW4ZZScfl81BrzOD48F20zAHOD4TPWg4SGIe0
   AYXaoLBgCJiyaqCgJYNHHKEdm8f0/TmAclknLL8DGeC0+4JxgIMFqA0JG
   qmq4bIe74hoYGkzcuGKAc7pJQZyrdFm3HkXhDYero9Af/lKCUvKLprDFA
   vslDMnaskCMxXL+pQkoxg4rx+95pWVy62rqKl3lBgKfcPBRZikdeXo//L
   8SXbUlbPiVchX91TIBXZ+jR+vJNl15OEe9VGraB3eP1Qa36dmwZrj/ozZ
   g==;
X-CSE-ConnectionGUID: 77qlIEPjT/iFI0mTCpgi8A==
X-CSE-MsgGUID: znek8A4nSA6wvqM9in0FTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42632152"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42632152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 10:19:44 -0800
X-CSE-ConnectionGUID: 1oP0XHJ0Rjmzpy4yzW1Mgg==
X-CSE-MsgGUID: 7Nc9lYCMTCKHXKbzfe3uQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147110974"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Feb 2025 10:19:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teI5k-000oRl-1w;
	Sat, 01 Feb 2025 18:19:40 +0000
Date: Sun, 2 Feb 2025 02:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against
 symbol 'ppc_md'; recompile with -fPIC
Message-ID: <202502020214.5NNn449d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   60c828cf80c07394762a1edfaff63bea55cc8e45
commit: c738866e47ef2e4d543698f0ab370ffe2b7e0d59 bcachefs: check_extents_to_backpointers() now only checks buckets with mismatches
date:   5 weeks ago
config: powerpc-randconfig-r123-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020214.5NNn449d-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250202/202502020214.5NNn449d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020214.5NNn449d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'ppc_md'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/setup-common.o)
   >>> referenced by idle.c:38 (arch/powerpc/kernel/idle.c:38)
   >>>               arch/powerpc/kernel/idle.o:(powersave_off) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
