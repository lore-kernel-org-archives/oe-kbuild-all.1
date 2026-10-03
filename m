Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2986D233936
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791011402; cv=none; b=LvSejusucoXIG/ECvxFOwhONuaP2PzkdgNBvtOuglz5Yy9H8o2MT/CYGkdKUN33kU9qEPoHJIRDsIkpRjRbdzqule+FMKZ0nyt9xYYEkcbxW+MWXmhhT8L+9rTI15WwdLhGZlK3gI5p9imiGQPyewNFdwtNtHoYuxNhh8H3bMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791011402; c=relaxed/simple;
	bh=4U0TRdR0e6DKfAJvtDAObXp3Mi2dB7SGZiI8I71NZfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hfa0pnhJUMQlWnkf29K+NlVB847y3Ngf2Z9nbciqEGoRi5DqoNbhsZZUJDyrFd1uFVpUCtajvuDpBihiPDROqMGGncwQyneNfb88pLIihGNkzTfcX3MQprnlGpJbiyxvphn4HCFL2UD6U7j0MX5o4ut2KlmDdRL6wuA3US3tUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgHr7zE5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgHr7zE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791011400; x=1822547400;
  h=date:from:to:cc:subject:message-id;
  bh=4U0TRdR0e6DKfAJvtDAObXp3Mi2dB7SGZiI8I71NZfg=;
  b=RgHr7zE5JHjSwBEB9UZKgqqJHCTMexMiswkQtHd2Bu4BrZU9aJ/IlTN6
   HzmxduMC3B2Fn3O77+wEDB69C2zPA5snYjKvQ+Dk0mh/fd1C2+F8sc9aV
   vL28Qi+XpnhyDmFaKaQYnC7vXpxQauoyvUfCm89opEbt4iP1Qaf+/lYm/
   UklNZTL6/PAQFJRnuS6uURTaCKjEJtFpHvYNYBdZ7OmYFmOpSq4topzAD
   +CnPMRNb/jwZVOpLPYjJ2Lv/qjXl7rtodU/Bs5Pu1K2u5N9mOptk9puCM
   5FYWaslXCPCZ41/LxU4ESf+WjI/+G9uVuRGQoWOcBinhgUee3wmXWIdAL
   Q==;
X-CSE-ConnectionGUID: 2vsD7awdR5KhOHZgVr+XeA==
X-CSE-MsgGUID: jRTuyQ2UQX64KiW2kF7asA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117290422"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="117290422"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 00:09:59 -0700
X-CSE-ConnectionGUID: ncOIk8efQ6qmzKAgnu06Xw==
X-CSE-MsgGUID: k+UOMyCrR+WreK70021PbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="302647136"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Oct 2026 00:09:58 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCtsZ-000000000yz-3EbY;
	Sat, 03 Oct 2026 07:09:55 +0000
Date: Sat, 03 Oct 2026 09:09:36 +0200
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 Amery Hung <ameryhung@gmail.com>
Subject: [linux-next:master 6668/14185]
 arch/xtensa/include/asm/jump_label.h:16:2: error: impossible constraint in
 'asm'
Message-ID: <202610030911.tiEpGxd9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: 369d9dcd8fb855f103a83454f0e1cd1cbc9118be [6668/14185] bpf: Add infrastructure to support attaching struct_ops to cgroups
config: xtensa-randconfig-r2107-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030911.tiEpGxd9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030911.tiEpGxd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030911.tiEpGxd9-lkp@intel.com/

Note: the linux-next/master HEAD f0406245cb9855e6318335a8a223551354291a46 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/jump_label.h:106,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/xtensa/include/asm/bitops.h:208,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from kernel/bpf/cgroup.c:8:
   arch/xtensa/include/asm/jump_label.h: In function '__cgroup_bpf_query':
   arch/xtensa/include/asm/jump_label.h:16:2: warning: asm operand 0 probably doesn't match constraints
     asm goto("1:\n\t"
     ^~~
>> arch/xtensa/include/asm/jump_label.h:16:2: error: impossible constraint in 'asm'


vim +/asm +16 arch/xtensa/include/asm/jump_label.h

64711f9a47d4def Max Filippov   2018-12-19  12  
64711f9a47d4def Max Filippov   2018-12-19  13  static __always_inline bool arch_static_branch(struct static_key *key,
64711f9a47d4def Max Filippov   2018-12-19  14  					       bool branch)
64711f9a47d4def Max Filippov   2018-12-19  15  {
4356e9f841f7fbb Linus Torvalds 2024-02-09 @16  	asm goto("1:\n\t"
64711f9a47d4def Max Filippov   2018-12-19  17  			  "_nop\n\t"
64711f9a47d4def Max Filippov   2018-12-19  18  			  ".pushsection __jump_table,  \"aw\"\n\t"
64711f9a47d4def Max Filippov   2018-12-19  19  			  ".word 1b, %l[l_yes], %c0\n\t"
64711f9a47d4def Max Filippov   2018-12-19  20  			  ".popsection\n\t"
64711f9a47d4def Max Filippov   2018-12-19  21  			  : :  "i" (&((char *)key)[branch]) :  : l_yes);
64711f9a47d4def Max Filippov   2018-12-19  22  
64711f9a47d4def Max Filippov   2018-12-19  23  	return false;
64711f9a47d4def Max Filippov   2018-12-19  24  l_yes:
64711f9a47d4def Max Filippov   2018-12-19  25  	return true;
64711f9a47d4def Max Filippov   2018-12-19  26  }
64711f9a47d4def Max Filippov   2018-12-19  27  

:::::: The code at line 16 was first introduced by commit
:::::: 4356e9f841f7fbb945521cef3577ba394c65f3fc work around gcc bugs with 'asm goto' with outputs

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
