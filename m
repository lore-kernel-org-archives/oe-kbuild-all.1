Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54AA2747B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756747785; cv=none; b=RO/29sIHIe6VQBlyBZ8YrAQcocDJvxKWwoEQh5wMhZBXwBNePUtU3+QBfm5SE3+tOMZMBuLZ36UTuGDzVY8zTv0en2DS5f4cemmTNq53kWMexL15lVTFUOLknP3NmzwqR8mk7bJ+zykJsZZ5wyaqw5V0xaYrDfAShgUJdgX2k0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756747785; c=relaxed/simple;
	bh=ny/nx2T+Jz07i8ZPD0lTXqpGzTdGOElIETsgIxPtSHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAbyzb+nDlydoSO/Fdcy7iPUuhCYPmE9kOJigopNzXlKpo0MvwlHic/p02YgJdVcsTi9gn35SXPGS1KyJVWawRTWgjbZ+Ey7a9S6X3htaPX5wn7iFR867p/rdwHoAvXhzvmBbSVwtVmI5eq6rF7Y3dyatUtQMjcduHRMI0f2JMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeS/UHuB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeS/UHuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756747784; x=1788283784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ny/nx2T+Jz07i8ZPD0lTXqpGzTdGOElIETsgIxPtSHI=;
  b=PeS/UHuBb1MkwBtppS4XLbNNwq8x9e2nKFMNfc8k4aCucI2xWb7WlFjy
   yuGHs/4rJecY5RQ+GlMwNH7wtR1ogTzE2C/g2n12RhQ3drGZnR41eS7kD
   RSuJEFi4wijryTWRiRLnN55vmpPBDaTTlluclO6CXkja75OGD3dLshA61
   7iOXzfglb3GuKQliOMEbpxbUB+9WxDJWXnJ0xAy910EuxnrBn5maRUjcY
   6as/jqD3hrpnntBgwY+FwaxEcWdPtvbNaHNgr5esAr8yk9LwPO2n2NFly
   UeUiT61zrNL9Ave67CQYsRb2r28Or3NNbSSei6m+TjiC3C0b1KMQWUqMR
   w==;
X-CSE-ConnectionGUID: /sdMbMxpR6iB5ryhDjlGOg==
X-CSE-MsgGUID: LJyhrJsUTRiGSjbA47aA9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59152939"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="59152939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 10:29:44 -0700
X-CSE-ConnectionGUID: w24ja9q7RC+PcCYm4/hM8w==
X-CSE-MsgGUID: Nw1xQP2mSMa4lVRv9idMIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171929735"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2025 10:29:42 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut8Lb-0000rz-2R;
	Mon, 01 Sep 2025 17:29:39 +0000
Date: Tue, 2 Sep 2025 01:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3364/5291] include/linux/compiler_types.h:572:38:
 error: call to '__compiletime_assert_679' declared with attribute error:
 FIELD_PREP: value too large for the field
Message-ID: <202509020109.vNCZ636X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33bcf93b9a6b028758105680f8b538a31bc563cf
commit: cbc654d18d3743cff70b2dafb64c903b8cd01f2b [3364/5291] bitops: Add __attribute_const__ to generic ffs()-family implementations
config: riscv-randconfig-r131-20250901 (https://download.01.org/0day-ci/archive/20250902/202509020109.vNCZ636X-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250902/202509020109.vNCZ636X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020109.vNCZ636X-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/pci/pci.c: In function 'pcie_set_readrq':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_679' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:5952:6: note: in expansion of macro 'FIELD_PREP'
     v = FIELD_PREP(PCI_EXP_DEVCTL_READRQ, ffs(rq) - 8);
         ^~~~~~~~~~


vim +/__compiletime_assert_679 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
