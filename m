Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E92EF66B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772969973; cv=none; b=PosEYuiA/1t+X3aI++0RVC1itNVv7r7SKfnguhhDJxoCARnb0M20qCofM2OvK9vOyoXHocFZVjFLworWHP1SBcmNXpUP8dob6Iz9E6tUaTELF8eXHxiwdBDRnTDZZSLJzPMLPSiK+GWkPm6Yuy/qGo31La9aR2LSeWf7rn5Ro7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772969973; c=relaxed/simple;
	bh=TIUu5LO/k1M84BoYoJWE/IKNSIT9fo3wD8AUZUj17h8=;
	h=Date:From:Cc:Subject:Message-ID; b=tXSWr1ynCkOaU0xuTXAI/Z1N2UJUl/i1BjaPr3C397rtTvEUmgnX8G/6fzffu1d+5v3woUuDqTV2fKB/yqI3G8qk5cH9uGZgnQ+GxVzvYA4FNoPb2NDrU/eT0r5TIGgGsi+nY+OO3O+55aE37MRtSvDz8bTBGd+6uSAZiJtghF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp9hz+RB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp9hz+RB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772969972; x=1804505972;
  h=date:from:cc:subject:message-id;
  bh=TIUu5LO/k1M84BoYoJWE/IKNSIT9fo3wD8AUZUj17h8=;
  b=Qp9hz+RBtPBJ3UfEReWKcpDqNTfg8GsydMEqEmGuT3slAMV7rai6kRuJ
   48LvC/blbGZfkZZVoi+fsezfNCKqbpQzlwzStvpe0sD+O3ifpgLqMWN3G
   PkcL7gBHWN+Kugcax/VJazEtaeoeFmN7E73J1Y8UxNAttd3NoS7+6t6cT
   xb8hQM2uDnQZG9iQZ7dHeCiSeVK2+2tSla6pcyYH3K1AjRLIzF58mGnb5
   +bPCVexY6v9HJ3K5tPbnlhYTzZiCz9N80VD9LR3e51J5ZVh21LLd+8J4Q
   +VCgy80te6VSJve82/2v77LqkPX7hPfH7jDgsHWlu5sQmlBjo13UI4bFG
   w==;
X-CSE-ConnectionGUID: TpZQuMqUSPSLn1VTw30lwA==
X-CSE-MsgGUID: sY3ucPHZS0uMglLR6C0dfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74206762"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="74206762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 04:39:30 -0700
X-CSE-ConnectionGUID: X8ztqWa7ReWfh1AJW0z57w==
X-CSE-MsgGUID: BdqM3nuXQ+OqV6Y3uf6NNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="245562723"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2026 04:39:28 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzCTm-0000000034u-1daU;
	Sun, 08 Mar 2026 11:39:26 +0000
Date: Sun, 08 Mar 2026 19:38:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: arch/xtensa/include/asm/initialize_mmu.h:57: Error: invalid
 register 'atomctl' for 'wsr' instruction
Message-ID: <202603081945.JhpM0yD4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c23719abc3308df7ed3ad35650ad211fb2d2003d
commit: b67e7422d229dead0dddaad7e7c05558f24d552f drm/xe: Fix build with CONFIG_MODULES=n
date:   6 months ago
config: xtensa-randconfig-r053-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081945.JhpM0yD4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081945.JhpM0yD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081945.JhpM0yD4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/include/asm/initialize_mmu.h: Assembler messages:
>> arch/xtensa/include/asm/initialize_mmu.h:57: Error: invalid register 'atomctl' for 'wsr' instruction
   arch/xtensa/boot/boot-elf/bootstrap.S:58:  Info: macro invoked from here
   arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value 0x1a0003000 truncated to 0xa0003000


vim +57 arch/xtensa/include/asm/initialize_mmu.h

c622b29d1f3802 Max Filippov    2012-11-19  40  
c622b29d1f3802 Max Filippov    2012-11-19  41  	.macro	initialize_mmu
c622b29d1f3802 Max Filippov    2012-11-19  42  
c622b29d1f3802 Max Filippov    2012-11-19  43  #if XCHAL_HAVE_S32C1I && (XCHAL_HW_MIN_VERSION >= XTENSA_HWVERSION_RC_2009_0)
c622b29d1f3802 Max Filippov    2012-11-19  44  /*
c622b29d1f3802 Max Filippov    2012-11-19  45   * We Have Atomic Operation Control (ATOMCTL) Register; Initialize it.
87670c577041dc Jonathan Corbet 2023-03-23  46   * For details see Documentation/arch/xtensa/atomctl.rst
c622b29d1f3802 Max Filippov    2012-11-19  47   */
c622b29d1f3802 Max Filippov    2012-11-19  48  #if XCHAL_DCACHE_IS_COHERENT
c622b29d1f3802 Max Filippov    2012-11-19  49  	movi	a3, 0x25	/* For SMP/MX -- internal for writeback,
c622b29d1f3802 Max Filippov    2012-11-19  50  				 * RCW otherwise
c622b29d1f3802 Max Filippov    2012-11-19  51  				 */
c622b29d1f3802 Max Filippov    2012-11-19  52  #else
c622b29d1f3802 Max Filippov    2012-11-19  53  	movi	a3, 0x29	/* non-MX -- Most cores use Std Memory
c622b29d1f3802 Max Filippov    2012-11-19  54  				 * Controlers which usually can't use RCW
c622b29d1f3802 Max Filippov    2012-11-19  55  				 */
c622b29d1f3802 Max Filippov    2012-11-19  56  #endif
c622b29d1f3802 Max Filippov    2012-11-19 @57  	wsr	a3, atomctl
c622b29d1f3802 Max Filippov    2012-11-19  58  #endif  /* XCHAL_HAVE_S32C1I &&
c622b29d1f3802 Max Filippov    2012-11-19  59  	 * (XCHAL_HW_MIN_VERSION >= XTENSA_HWVERSION_RC_2009_0)
c622b29d1f3802 Max Filippov    2012-11-19  60  	 */
c622b29d1f3802 Max Filippov    2012-11-19  61  

:::::: The code at line 57 was first introduced by commit
:::::: c622b29d1f38021411965b7e0170ab055551b257 xtensa: initialize atomctl SR

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Chris Zankel <chris@zankel.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
