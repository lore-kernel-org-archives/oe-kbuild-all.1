Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A766B376BF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891806; cv=none; b=LVNZhDutbeBD/GBdzWz6jDiPRStInh9iyVbpZF+E26lBtB1oHUp2fuggaIc3lA5FI7EgnMt64qnNU5iMd56ICYLqh5WMrgmexRHcH+rY1v8O+tTXBBG9BALMYC6vFFZxEN3RLpyXKqR/PHHy/CS5q0cWd7RCeN2GYT+aLHKHE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891806; c=relaxed/simple;
	bh=3KVk2vCRhXLg+H6Ux9tznF3N2XV6JTqhe4hIs6hbe5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqlopVb6zDI38LmSfDrKsQbmNEsEKrSNJxTbJaI/W6EiiT2YqEcwQGFGwXU6YPTMSkTeKElfMJfwxLYofpDAgKuAYNaOyOu3Y1z8A3gyejgTTa0xckpP4ZqzS38u3LmCebjKL18bxQq5cwwHYKVFiGeinfRQ+FwN1XgDwtdFki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHzRO+1z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHzRO+1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765891805; x=1797427805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KVk2vCRhXLg+H6Ux9tznF3N2XV6JTqhe4hIs6hbe5I=;
  b=GHzRO+1z0KmH9R52OakQNanMvzMAWVbMm3ek4gBSssfbhcT8h5krVIfK
   uu7BlYS7yv4fRHuOCmhSYhpGeNwvJrnJBLTK7CxPMTUq8eWuIHGH845Dp
   VKjak1BYWVhIrd73ppD8IuhH5r1UpR4ngyzAC6FhdxD9cVUBaEYGX4xG7
   c5VmOMnx6pOoN3zE8T8AnA4GFFqv9dxvx+L3BvDxyTBb0zTpB7n/Y3WSU
   ETNijH4SyH7oaPw3Z/mszMDdp6/ELpWIw8IbhSh+vEykKGeueJV7d+W0r
   LnX163t5ZVEanVhHGCMekra+V10FmkmyXokk3XoPSVAoP4H1SyYl9r8/S
   w==;
X-CSE-ConnectionGUID: XWl6dx+XRyWcekTcRH8umQ==
X-CSE-MsgGUID: YucyKrZRRnKmlRc6Fe2hpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67964598"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67964598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:30:00 -0800
X-CSE-ConnectionGUID: VkCjzn4aQ8COqVnAFriS2Q==
X-CSE-MsgGUID: 1LmfqSH7QbCiEi2lA0zJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198829826"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 05:29:58 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVV7k-000000003EY-10RH;
	Tue, 16 Dec 2025 13:29:56 +0000
Date: Tue, 16 Dec 2025 21:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] arch/arm64/kernel/mte.c:197:13:
 warning: no previous prototype for function 'kasan_hw_tags_enable'
Message-ID: <202512162118.1UADZThi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: b5347f340a2b370346ce24b82dbbf6f8c0657567 [2/2] UPSTREAM: arm64: kasan: mte: move GCR_EL1 switch to task switch when KASAN disabled
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512162118.1UADZThi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162118.1UADZThi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162118.1UADZThi-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/kernel/mte.c:197:13: warning: no previous prototype for function 'kasan_hw_tags_enable' [-Wmissing-prototypes]
     197 | void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
         |             ^
   arch/arm64/kernel/mte.c:197:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     197 | void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
         | ^
         | static 
   arch/arm64/kernel/mte.c:103:20: warning: unused function '__mte_enable_kernel' [-Wunused-function]
     103 | static inline void __mte_enable_kernel(const char *mode, unsigned long tcf)
         |                    ^~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/kasan_hw_tags_enable +197 arch/arm64/kernel/mte.c

   196	
 > 197	void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
   198					 __le32 *updptr, int nr_inst)
   199	{
   200		BUG_ON(nr_inst != 1); /* Branch -> NOP */
   201	
   202		if (kasan_hw_tags_enabled())
   203			*updptr = cpu_to_le32(aarch64_insn_gen_nop());
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
