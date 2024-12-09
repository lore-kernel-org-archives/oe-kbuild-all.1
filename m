Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C38C155335
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717823; cv=none; b=rSV9rElySN+LC/GtxZY0q56KuSAtaCaEGNslLinjQXmg4LKPHQjhAG8jczIL/SnF5YGMYk9a2xa5jNZeZaSmJ8mvEQJhH3C8Gw5RbWn9piC8rdxZzATEuNMb3F9y8oP0kbQF8eEDKCWYDcPIwSe9n99lcR5WcOVX7CWSmDe7qHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717823; c=relaxed/simple;
	bh=1fl27rwkrCIsSOR4yCaSqQ/1nF4/def69YvgohMztoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLXdQ5d4/rrH86kYFulHeGcU4u7t41+BRFYNk0TSkyFA20RdH4bhFeauNB3ZKMOM7eXJKZwOnkIP5NrUe3s8exjk9Fgj1qY1/D76jrGprt2tsYG5ADu+WFUnrpTlihYQy7fNhNR0wmPfTiWYy9i4MyCZNtO/dQhyGoRlTFYpDC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DahGAYtL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DahGAYtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717822; x=1765253822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fl27rwkrCIsSOR4yCaSqQ/1nF4/def69YvgohMztoE=;
  b=DahGAYtLKJngrMkOWYyfXS2vAfW033dyh4gjDhLVN2uS8xNZBfzIpFo4
   qBfMZiH0SnDgMk4nUdt9qYefXF3CW6f+gm05cpvPBfqu8fc0YQB5FRU+I
   BLJeeCWf2gNy+Ab+IPX7xJ609pOR79mHWyGCWBFcxaN3Z1/SRZ+jb71Ic
   b/iGSnDqU2+g2VASo1S5m5GSIQE8T3TFuYXu2KSQTnhCuDofO7xx+iOuf
   B7KQJez84T7AK8L3Or06PmTotXXtivXBgqX8dFP6clc5y5RE0nZK/1eQp
   gnLxvbb3EUIIS32PqZwLRxgDIfMFxOIuuwwQSBORyPXEZ9Ta5qNKHelWs
   Q==;
X-CSE-ConnectionGUID: F3IHNQQtSTK6fHU1ICgsbw==
X-CSE-MsgGUID: 7VTky4IYSUmD3alJyX8jKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34235964"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34235964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:16:10 -0800
X-CSE-ConnectionGUID: nvHH4m1JRM2DNaau2QHTyw==
X-CSE-MsgGUID: +WROlKqnRIa+5PVSDs8kuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94823936"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 20:16:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVBm-0003p7-18;
	Mon, 09 Dec 2024 04:16:06 +0000
Date: Mon, 9 Dec 2024 12:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: arch/riscv/kernel/unaligned_access_speed.c:23:1: sparse: sparse:
 symbol '__pcpu_scope_vector_misaligned_access' was not declared. Should it
 be static?
Message-ID: <202412071930.fdm7QFW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: d1703dc7bc8ec7adb91f5ceaf1556ff1ed212858 RISC-V: Detect unaligned vector accesses supported
date:   7 weeks ago
config: riscv-randconfig-r133-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071930.fdm7QFW4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412071930.fdm7QFW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071930.fdm7QFW4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/unaligned_access_speed.c:23:1: sparse: sparse: symbol '__pcpu_scope_vector_misaligned_access' was not declared. Should it be static?

vim +/__pcpu_scope_vector_misaligned_access +23 arch/riscv/kernel/unaligned_access_speed.c

    21	
    22	DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
  > 23	DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
