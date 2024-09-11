Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645C15383B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054493; cv=none; b=ro3HL/2gLMEPi5NN0IeHMadYn6pvLhGsmZrOTl3Q66Z+LeOGsm0C8F4BsSomAve3W1WqmUc+l73msFPSUnEEeSomasR9M3t7TQbypRZLJd5ZuMUd/5wv2O+pdL1qLV5BzN4DHU9T4xKJV8bT1mr6ztcaUBpNDqNInJPlEj3D1nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054493; c=relaxed/simple;
	bh=LxRJrbPPFXztvNnOJkV2WOBM/0IAdKIxF19IvArES2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJiw/0jJn0tI/rLQE2HKEJiNA4Ue/YtM2R7igWZ5XztKd96gGxEzVT4hNqLasg9Mnkpa8o69w02Azh2T3aUjK9lRXrj/RKkaWpo9P95EmPLsBGw9/29WkseWdpx0KqcrYZniPZ/01RIpc/spWxu4uj70987O71xu5QyTpkWkRQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYK7DzVK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYK7DzVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726054492; x=1757590492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LxRJrbPPFXztvNnOJkV2WOBM/0IAdKIxF19IvArES2c=;
  b=XYK7DzVK4PX6vLEU+bQBEaFNsPfYpt6KuGh9ygez4+a5Vf4RzZk8DXAJ
   nz//bE7Vp23LAGCeTabGr1MJjNfNA7sAxo/YvXxqUia0J5pOshlfmVSce
   swYM2opz03tlwCo5ngNKs32gAfYzOYQPPH9nLHJs8pZWKtElfgnhzRFSZ
   7z+R1OvR0tbzE/B8LLpgWX1LSsWR5DPFI4FVq6o/wVlhImvxsvKm4dnx5
   /CSu2V/PQ417XbRaOPaS0TkOht1CcpPVBcV2YP8BNKL87dvZ/KQxGyOiE
   /a3DA0wHxEBwz4cg6pWz8ON4ZH2DdQTT7jlp/Jncm+U/+OfKM1u/G3qa4
   g==;
X-CSE-ConnectionGUID: IJD8u37IQ0yuxCC+6rYSiw==
X-CSE-MsgGUID: zRgJSC9JT+y0uRn98w/bbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42326101"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="42326101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 04:34:51 -0700
X-CSE-ConnectionGUID: C6Pmf3dYTtyvmWSLzovCwQ==
X-CSE-MsgGUID: 0vzHVmQkTyO9V46Sz/RlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67355734"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2024 04:34:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soLcU-0003TA-24;
	Wed, 11 Sep 2024 11:34:46 +0000
Date: Wed, 11 Sep 2024 19:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build-v1.5 29/32]
 arch/x86/include/asm/alternative.h:173:9: error: expected ':' or ')' before
 'FAKE_SYMBOL'
Message-ID: <202409111951.D7k7aTZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-v1.5
head:   2abe29f4f173c4090c0030c43c30053694b1658a
commit: 62e666a6052abd6142d52405ea99e83ab7d48a83 [29/32] x86/alternative: Create symbols for special section entries
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240911/202409111951.D7k7aTZR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111951.D7k7aTZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111951.D7k7aTZR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:29,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/x86/include/asm/arch_hweight.h: In function '__arch_hweight32':
>> arch/x86/include/asm/alternative.h:173:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     173 |         FAKE_SYMBOL(__alt_entry_, 776f)                                       \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/alternative.h:192:9: note: in expansion of macro 'ALTINSTR_ENTRY'
     192 |         ALTINSTR_ENTRY(ft_flags)                                        \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/arch_hweight.h:19:14: note: in expansion of macro 'ALTERNATIVE'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^~~~~~~~~~~
>> arch/x86/include/asm/alternative.h:173:35: error: invalid suffix "f" on integer constant
     173 |         FAKE_SYMBOL(__alt_entry_, 776f)                                       \
         |                                   ^~~~
   arch/x86/include/asm/alternative.h:192:9: note: in expansion of macro 'ALTINSTR_ENTRY'
     192 |         ALTINSTR_ENTRY(ft_flags)                                        \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/arch_hweight.h:19:14: note: in expansion of macro 'ALTERNATIVE'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^~~~~~~~~~~
   arch/x86/include/asm/alternative.h:185:41: error: invalid suffix "f" on integer constant
     185 |         FAKE_SYMBOL(__alt_replacement_, 775f)                           \
         |                                         ^~~~
   arch/x86/include/asm/alternative.h:193:9: note: in expansion of macro 'ALTINSTR_REPLACEMENT'
     193 |         ALTINSTR_REPLACEMENT(newinstr)
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/arch_hweight.h:19:14: note: in expansion of macro 'ALTERNATIVE'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1194: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +173 arch/x86/include/asm/alternative.h

   162	
   163	#define OLDINSTR(oldinstr)						\
   164		"# ALT: oldinstr\n"						\
   165		"771:\n\t" oldinstr "\n772:\n"					\
   166		"# ALT: padding\n"						\
   167		".skip -(((" alt_rlen ")-(" alt_slen ")) > 0) * "		\
   168			"((" alt_rlen ")-(" alt_slen ")),0x90\n"		\
   169		"773:\n"
   170	
   171	#define ALTINSTR_ENTRY(ft_flags)					      \
   172		".pushsection .altinstructions,\"a\"\n"				      \
 > 173		FAKE_SYMBOL(__alt_entry_, 776f)					      \
   174		" .long 771b - .\n"				/* label           */ \
   175		" .long 774f - .\n"				/* new instruction */ \
   176		" .4byte " __stringify(ft_flags) "\n"		/* feature + flags */ \
   177		" .byte " alt_total_slen "\n"			/* source len      */ \
   178		" .byte " alt_rlen "\n"				/* replacement len */ \
   179		"776:\n"							      \
   180		".popsection\n"
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
