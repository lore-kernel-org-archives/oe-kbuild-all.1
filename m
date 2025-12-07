Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88C18871F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765096954; cv=none; b=JV3f5tbqzP0hbK8LrlE4iJnOIsE5KEvkPTSgDpSIisMjSTlpGak5bQfrTme3V+FWkqp82EVe5j6L6/nLsANum6qf6pj6d/TFOb2n8wljH9M828bMXvWlSWxSGlu0Y2lDGBAiYlKYbDbnmHcTVQOgskDcrQfKfF9NyfhEmlKL8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765096954; c=relaxed/simple;
	bh=7iT1isYsUmdO2mhLxlw8Z2yr7thl61gQZ/JKAtZ9WcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JzWknlHKYwD9/T5gwUDcNZVZwOWQt52N+8+m/33yyMbESmuOVBqbVzPNpaJ7+/PB/EQX+CUdMBbbM7RCJhK/Gx9K4at8nxve8iAzOFyBHjVRnU2Bgr3fT+ITRP5Ye3VDqC0PNhu9L/KXASDQsq6XEA86TCeHSipEQm4prS6mU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGV0g5U7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGV0g5U7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765096953; x=1796632953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iT1isYsUmdO2mhLxlw8Z2yr7thl61gQZ/JKAtZ9WcI=;
  b=nGV0g5U7vcuG2xmOPj4TcU471ARfmLSUGVRlJJsncjDqHxUW40McYejz
   tNaNaYSGMVF+IMh17Wr/Yw4lm+e3OHvvfGUp9HQkUOs1GPFzggay1UESf
   dJH2HuyAStBEWSppCeXeKS+DFRcjV0e+BQQD0FXbLEOl3elvRVIwPVObF
   +IHlDdYIY/cXSNgROimHcFBClzlyVyiQpaFhu9W6yZlTyD6bIwUyZ0yPP
   YoOSJdt2jEsg45ya9rfuGuIC9HBHYcATdgwZugLpC7tfL2ouGNchIM1OW
   gZMkpH1S0/QZQaU1C+MvjBXW2H+TFfujqS37miq9BdfD+fnrvZYUfgWiX
   A==;
X-CSE-ConnectionGUID: d5ebFaFeSbWw5uEfDpvCbQ==
X-CSE-MsgGUID: iy5gmfSDRO6OBxJuanGvXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67034201"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67034201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 00:42:32 -0800
X-CSE-ConnectionGUID: n5O1NVVkRnGJ/1Db1QI6hw==
X-CSE-MsgGUID: HNVm0pC3SZeBy6dSzdwvWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="233036521"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2025 00:42:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSALd-00000000J8t-1xR4;
	Sun, 07 Dec 2025 08:42:29 +0000
Date: Sun, 7 Dec 2025 16:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 5/8] include/linux/annotate.h:32: Error:
 unrecognized opcode: `define_macro(__ANNOTATE)'
Message-ID: <202512071652.yapmJfBO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   051df5c21cbf6d9ac396c22b3ab3c51d73c0def7
commit: 28e63e2c890661dc9bcdbe172eba06b26220d455 [5/8] objtool: Convert annotations to assembler macros
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251207/202512071652.yapmJfBO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071652.yapmJfBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071652.yapmJfBO-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/annotate.h: Assembler messages:
>> include/linux/annotate.h:32: Error: unrecognized opcode: `define_macro(__ANNOTATE)'
>> include/linux/annotate.h:33: Error: unrecognized opcode: `define_macro(ANNOTATE(NOENDBR))'
>> include/linux/annotate.h:34: Error: unrecognized opcode: `define_macro(ANNOTATE(RETPOLINE_SAFE))'
>> include/linux/annotate.h:35: Error: unrecognized opcode: `define_macro(ANNOTATE(INSTR_BEGIN))'
>> include/linux/annotate.h:36: Error: unrecognized opcode: `define_macro(ANNOTATE(INSTR_END))'
>> include/linux/annotate.h:37: Error: unrecognized opcode: `define_macro(ANNOTATE(IGNORE_ALTERNATIVE))'
>> include/linux/annotate.h:38: Error: unrecognized opcode: `define_macro(ANNOTATE(INTRA_FUNCTION_CALL))'
>> include/linux/annotate.h:39: Error: unrecognized opcode: `define_macro(ANNOTATE(UNRET_BEGIN))'
>> include/linux/annotate.h:40: Error: unrecognized opcode: `define_macro(ANNOTATE(REACHABLE))'
>> include/linux/annotate.h:41: Error: unrecognized opcode: `define_macro(ANNOTATE(NOCFI))'
>> include/linux/annotate.h:42: Error: unrecognized opcode: `define_macro(ANNOTATE_DATA(DATA_SPECIAL))'


vim +32 include/linux/annotate.h

    31	
  > 32	DEFINE_MACRO(__ANNOTATE);
  > 33	DEFINE_MACRO(ANNOTATE(NOENDBR));
  > 34	DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
  > 35	DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
  > 36	DEFINE_MACRO(ANNOTATE(INSTR_END));
  > 37	DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
  > 38	DEFINE_MACRO(ANNOTATE(INTRA_FUNCTION_CALL));
  > 39	DEFINE_MACRO(ANNOTATE(UNRET_BEGIN));
  > 40	DEFINE_MACRO(ANNOTATE(REACHABLE));
  > 41	DEFINE_MACRO(ANNOTATE(NOCFI));
  > 42	DEFINE_MACRO(ANNOTATE_DATA(DATA_SPECIAL));
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
