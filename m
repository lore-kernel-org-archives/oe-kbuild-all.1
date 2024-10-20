Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5798A19755B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457811; cv=none; b=mibp4fRFbY15ZY1gzNvG3IrHrEN6gJ6kjwJR2iDMnOfedFjbu62lNOJ/lCU5ofdCCBuYtcEDz8YZqN8A+1VfhQBWqtBm6aNHG4pyPliUpX9pAtRJN+xbiye3y93+SU+Yy9GAqaHim+9YVEPfj1t/KULc0lNMwv1wdLcM+/vLGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457811; c=relaxed/simple;
	bh=7G23M+ofckNI7xPQaf90QaTqeGL8jcI8nRabQJa6ytc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a817Iw/Y5POJaSBQWUjhUE1vVKh9p6KuaqTMV8Uzg0gPHUPxzYtZUdC12cx9cIpuYZjMiHMIRfZBze9/TwH7KEkX632DZ2oqV8M4TisJS7a9rA/OHX15uSgWA8VMJKngKMKB7L9fM+Wao4vt0wxBYHM9gIwSzxI7XujMV8fSmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Grz+1kW3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Grz+1kW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729457810; x=1760993810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7G23M+ofckNI7xPQaf90QaTqeGL8jcI8nRabQJa6ytc=;
  b=Grz+1kW3xL48sMlDkCd/FghvAypiDSoySH0dVnyZpTtpC0fkcUB7rQoQ
   e6sNNIZ/nmkUQ6nWCeIV6VO/lhfQkF31FxTXeAnNqX6+UypK7Dwdj9hhI
   NFlgbOQ6o1NNC0oHVX3KdX4lErJxsM9WDe3tqeAu09hJ6IvYG5PTfbEnf
   Z3MbW+EYszesWCYByWr5NQ0+446/3XUhPf7/B/y8XPCLIm904FR7ofPyz
   f5AY7Cn3fmitUgOluHsP0jC6wi+B0yGhI3caoa5isDvDwZd9hrWaWHb3K
   ZNqVvDQMtjkJfWDMjsYSNbIzPMNHFiEC/yL38D/mnXSteb1gFzZaN8ZSI
   w==;
X-CSE-ConnectionGUID: h1U2OA8ORP+WNVDknaWKUw==
X-CSE-MsgGUID: s67upf5ISU+zNCzX1rW6gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="39518560"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="39518560"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 13:56:47 -0700
X-CSE-ConnectionGUID: FbUxvPIaS++LynHtMurY9g==
X-CSE-MsgGUID: u/A9ibKBRked0c10av7Rdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="80154117"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Oct 2024 13:56:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2cyh-000Qnb-1G;
	Sun, 20 Oct 2024 20:56:43 +0000
Date: Mon, 21 Oct 2024 04:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [palmer:for-next 13/26]
 arch/riscv/kernel/unaligned_access_speed.c:25:1: sparse: sparse: symbol
 '__pcpu_scope_vector_misaligned_access' was not declared. Should it be
 static?
Message-ID: <202410210444.zyDYEL7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   d69ba94663e3e892ade64e7f285e64d6417bd553
commit: e7c9d66e313bc0f7cb185c4972c3c9383a0da70f [13/26] RISC-V: Report vector unaligned access speed hwprobe
config: riscv-randconfig-r133-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210444.zyDYEL7e-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410210444.zyDYEL7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210444.zyDYEL7e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/unaligned_access_speed.c:25:1: sparse: sparse: symbol '__pcpu_scope_vector_misaligned_access' was not declared. Should it be static?

vim +/__pcpu_scope_vector_misaligned_access +25 arch/riscv/kernel/unaligned_access_speed.c

f413aae96cda05 Charlie Jenkins 2024-03-08  23  
d1703dc7bc8ec7 Jesse Taube     2024-10-17  24  DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
d1703dc7bc8ec7 Jesse Taube     2024-10-17 @25  DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
f413aae96cda05 Charlie Jenkins 2024-03-08  26  

:::::: The code at line 25 was first introduced by commit
:::::: d1703dc7bc8ec7adb91f5ceaf1556ff1ed212858 RISC-V: Detect unaligned vector accesses supported

:::::: TO: Jesse Taube <jesse@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
