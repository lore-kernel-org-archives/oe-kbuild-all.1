Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470181FF5F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765683831; cv=none; b=lz8lKQ/5in3Ht6f7lrN3ynM84WxSNqqBfPbzaPQ0HJbghyHOZdrAB/RNoCGDwhY8oL3DnNMRi62IbhhrG2HYYd2cc5cyHs4EQ9XHZRx4402DlpFA3eHBiYue6WWiAdOv6nXwjmQIx6Ms6D3P00dukUPrAbKsIROexooiA4MNjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765683831; c=relaxed/simple;
	bh=wMgPmulW563gLU61URXSIwJakOPc4C9FyzIM5MhoEJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KBQly5eJ6VAoLKwclqIt4yEIQO+1wdpu222etSCuMU9E07MF8qeTDvCoy2ukFPqm8antZsNmGdP2oqHgIStjm/K6eyKVwsC3ll0979RCYAfxrzwSePJ0NufThFf0eVhUORas0pAhtjMyS5i8/50y0I6G1X97MDdPoagK9LfeIwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZ5pSv36; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZ5pSv36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765683829; x=1797219829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMgPmulW563gLU61URXSIwJakOPc4C9FyzIM5MhoEJw=;
  b=HZ5pSv36KJG23QBecZWuz80RLgZHgzvqrBVdszgR1/rIN61AsGOiceR+
   ViVQ/D6XdR1SVAIAx5bBQsKTQDtrg35YpskCBmp3wOzeZmYUSCPrEByjI
   ZRds0EDOLpyaYWkiqYBXln9tqQmO9zeizkMKuy6b6MYjiUfqXKCDtV6O3
   yDqHf3ZvqrcdNaAJxFoNS0rsKwy/9Kv0wdTV98kh+h1b/RC+/Q8qNbITe
   hv4uZn7PZoqc/EOjfiDOp9F7k09MKip6p1TFXyDs/8b0YT5HdM+uBlIoP
   NgS1c1MsP3AyccIZLol40uog4zv3NBRIz4e9OdYrGIgSxL+u0dOD5D60s
   w==;
X-CSE-ConnectionGUID: TaBS/FGNQ9GPZbfBGeVdPQ==
X-CSE-MsgGUID: tAPEnERITjiiQmjl7icj5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67668663"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67668663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:43:47 -0800
X-CSE-ConnectionGUID: MdzQtuDXTe6kaNlEb62o5w==
X-CSE-MsgGUID: LtSY+yRiSTa9rxKK/Zrl6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196717579"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 19:43:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUd1L-000000008XT-233F;
	Sun, 14 Dec 2025 03:43:43 +0000
Date: Sun, 14 Dec 2025 11:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 arch/x86/kernel/cpu/hygon.c:439:14: warning: no previous prototype for
 function 'get_nt_block_copy_mini_len'
Message-ID: <202512141155.8Du6BuMt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 1e3cb18ebe2976b3294e85c3d162736cc3c7c92b [1942/1942] x86: Enhanced copy capabilities for Hygon processor
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512141155.8Du6BuMt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141155.8Du6BuMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141155.8Du6BuMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   arch/x86/kernel/cpu/hygon.c:434:6: warning: no previous prototype for function 'set_c86_features_para_invalid' [-Wmissing-prototypes]
     434 | void set_c86_features_para_invalid(void)
         |      ^
   arch/x86/kernel/cpu/hygon.c:434:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     434 | void set_c86_features_para_invalid(void)
         | ^
         | static 
>> arch/x86/kernel/cpu/hygon.c:439:14: warning: no previous prototype for function 'get_nt_block_copy_mini_len' [-Wmissing-prototypes]
     439 | unsigned int get_nt_block_copy_mini_len(void)
         |              ^
   arch/x86/kernel/cpu/hygon.c:439:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     439 | unsigned int get_nt_block_copy_mini_len(void)
         | ^
         | static 
   3 warnings generated.
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.
--
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/x86/kernel/fpu/core.c:149:14: warning: no previous prototype for function 'get_fpustate_free_space' [-Wmissing-prototypes]
     149 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^
   arch/x86/kernel/fpu/core.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     149 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         | ^
         | static 
>> arch/x86/kernel/fpu/core.c:175:14: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     175 |         struct fpu *fpu = &current->thread.fpu;
         |                     ^
   3 warnings generated.
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.


vim +/get_nt_block_copy_mini_len +439 arch/x86/kernel/cpu/hygon.c

   438	
 > 439	unsigned int get_nt_block_copy_mini_len(void)
   440	{
   441		unsigned int mini_len = hygon_c86_data.nt_cpy_mini_len;
   442	
   443		return mini_len;
   444	}
   445	EXPORT_SYMBOL_GPL(get_nt_block_copy_mini_len);
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
