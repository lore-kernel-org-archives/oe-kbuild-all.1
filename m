Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62AC1E51D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 02:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104719; cv=none; b=iVn8FBLk9iZu2fwbXnVK/6VFE7XvhG0ftAUjEQ7RAAkPI0xYP/CsTF+b1OKh9b96C9k2alz6t4tGMlaUDUe76Ay3d3ry8O/X1E1TrRBrF2/Ycj2MAaj5IuQgBT5RgLhJqWjYOap7XtstA1JFX+qPFbqKhMjYrk2SpTgJOCElucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104719; c=relaxed/simple;
	bh=0ZF9r/LtrSgYLlXe5xnrLSryRkpQMpRKe00IqMBwTcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NoUb0xbVDF83DlWX3ZJykXzMMrJ7rneCiyFhDnhAD6r3CsuwifyV1vZVVkm/yCYjRvVzD3HjzmU+/gjtH03Khc+qxVwIV3NDZ3OAVDng10j19zK6wHGudcDt4/i2DYl0+0dDihOBPkjxv5fdC6EfFwZFQ61+Ya1R1Nb9RhT8Sd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAH688aV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAH688aV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747104718; x=1778640718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZF9r/LtrSgYLlXe5xnrLSryRkpQMpRKe00IqMBwTcE=;
  b=cAH688aVFFDRhf44E6DDaZmPwroe5NoKMhG08W1xIHAfmy/K8PaIZH5s
   3Ryv9d61f/jf8VkLD1p//SoL9CVdsPVx1HIrrzZYnLtr5lmZd/dKu3/i4
   /QRGlGbJv/paWX7fnbqDkCMCrCqvy/C+tlfdr0Dy6iBYzxn4qlT/CywaE
   HI3LJZM3LPKGuUH2Yz+JymEIVN3H8E1sBN/j3zpT4XzuTBci6CUpAU6Xk
   hTaVDnoVrnCNUnki8FXOcijpbVtDCYrWDAegGQW6SoVsnggvGrNGv6Zsq
   cEwntuuF5TQzBWn0K2s7tb7C2ItSONM6WI48D5O7p4Ngbu+O04qJ+qZkw
   g==;
X-CSE-ConnectionGUID: KFHFfOy8RjmMIsotPJehLw==
X-CSE-MsgGUID: avFnTP9oRGKZweHNTrC/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48621919"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48621919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 19:51:57 -0700
X-CSE-ConnectionGUID: K8GzXHIRSD2Y3ik3vKSBTA==
X-CSE-MsgGUID: 2YOEK/82Tna8Mp1SwTranw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142513282"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2025 19:51:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEfkH-000Fbx-39;
	Tue, 13 May 2025 02:51:53 +0000
Date: Tue, 13 May 2025 10:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [palmer:for-next 22/38] arch/riscv/kernel/traps_misaligned.c:765:6:
 error: redefinition of 'misaligned_traps_can_delegate'
Message-ID: <202505131054.YSxRKeiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   91c5822e487aa48a1893a864fe69c2d432244fa2
commit: 37f4e1f77de7626258fafb23b835bb369c5e0dfb [22/38] riscv: misaligned: add a function to check misalign trap delegability
config: riscv-randconfig-r121-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131054.YSxRKeiC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505131054.YSxRKeiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131054.YSxRKeiC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/traps_misaligned.c:765:6: error: redefinition of 'misaligned_traps_can_delegate'
     765 | bool misaligned_traps_can_delegate(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/pgtable.h:120,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/riscv/kernel/traps_misaligned.c:7:
   arch/riscv/include/asm/cpufeature.h:82:20: note: previous definition of 'misaligned_traps_can_delegate' with type 'bool(void)' {aka '_Bool(void)'}
      82 | static inline bool misaligned_traps_can_delegate(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/traps_misaligned.c: In function 'misaligned_traps_can_delegate':
>> arch/riscv/kernel/traps_misaligned.c:773:16: error: implicit declaration of function 'all_cpus_unaligned_scalar_access_emulated' [-Wimplicit-function-declaration]
     773 |                all_cpus_unaligned_scalar_access_emulated();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/misaligned_traps_can_delegate +765 arch/riscv/kernel/traps_misaligned.c

   764	
 > 765	bool misaligned_traps_can_delegate(void)
   766	{
   767		/*
   768		 * Either we successfully requested misaligned traps delegation for all
   769		 * CPUS or the SBI does not implemented FWFT extension but delegated the
   770		 * exception by default.
   771		 */
   772		return misaligned_traps_delegated ||
 > 773		       all_cpus_unaligned_scalar_access_emulated();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
