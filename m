Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5626F291
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768516462; cv=none; b=r9MsKFDyl0kH/rMJmijusUluiwaQbWgnhgLy+3tZrK68FcgrAEjrosrGuWV6lpT08c6FuN71qca8SiYg98hbYp2eLJqjvcQNtlpSU2DAyxnkZdKf6/DecLz9QkSqk1ZGWVueuYnWZnIyHLShFVaMJv5OI5czckzrewPTz4X3Gp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768516462; c=relaxed/simple;
	bh=8rIAi0qVFNt5HatuhYy2AnMaCTtbuE65YVCGAJ12iFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cNGpCj+HHgGELn2h0Vv5VdkYEUI3QyTExVhGUiiXD6uwhtjCz/fesDS96PapC6NNwUuNEcPx3ge4yhTTnjDmUUvAzsVVGihzOGkH2xnvrjkK+ph0mbZ3U4DrtTbXV/SstibbtWXyQQx6mjkJgmu6RWWFv7Pf7Ohq4pvs7MGR2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4RH+3wS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4RH+3wS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768516461; x=1800052461;
  h=date:from:to:cc:subject:message-id;
  bh=8rIAi0qVFNt5HatuhYy2AnMaCTtbuE65YVCGAJ12iFI=;
  b=S4RH+3wSHGaHRne0z3VwIHfKQCGe3d7PRy97IO9ksZJa3FUVtIzWwIyu
   cLzD3E/dcWM19brzlhNc8SQ0z9GxXka3Iup9ou5JCp0VaWoswrKfPDi8b
   sbivt6CbkewJawpA9WqGonQ3rJfJyOX7WqrsRsAYpIah2mqngx1PtOqc1
   FpvdYj3hT3/GUotCsksqZ3TQadNxX+PZhueCQFD6Kj+fNUcCuLq8APv05
   hwQqUR9scwC4MivzyT1JerLQACnYzvWbqH768YtuoNJume71FHEQY3/WA
   Ly0k6pP6QIBUpVO/Ig5MR6G2bJ1aWKbQtPUjTHi0SNGJ3+EbtYFa6GXMn
   w==;
X-CSE-ConnectionGUID: OCtknuioSiG+UaRSl41emA==
X-CSE-MsgGUID: Csth39dmTW2HLO/pjD2X7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69812753"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69812753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 14:34:20 -0800
X-CSE-ConnectionGUID: kbQK/XmPQ7WcT55O9bCFQw==
X-CSE-MsgGUID: Lf/kyTPzQxCayXqlJQ49Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209560238"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 14:34:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVuy-00000000K4S-2DKd;
	Thu, 15 Jan 2026 22:34:16 +0000
Date: Fri, 16 Jan 2026 06:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/mips-pic32-header-move 17/17]
 drivers/clk/microchip/clk-core.c:13:10: fatal error: asm/traps.h: No such
 file or directory
Message-ID: <202601160637.is1An2Aw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux b4/mips-pic32-header-move
head:   0ffbdd0bc2954abd9c91cddb0b0d5030e87f68d5
commit: 0ffbdd0bc2954abd9c91cddb0b0d5030e87f68d5 [17/17] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: arc-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160637.is1An2Aw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160637.is1An2Aw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160637.is1An2Aw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-core.c:13:10: fatal error: asm/traps.h: No such file or directory
      13 | #include <asm/traps.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13 @13  #include <asm/traps.h>
ce6e11884659988 Purna Chandra Mandal 2016-05-13  14  

:::::: The code at line 13 was first introduced by commit
:::::: ce6e1188465998820e7182455261b1f5d508ca17 CLK: microchip: Add Microchip PIC32 clock driver.

:::::: TO: Purna Chandra Mandal <purna.mandal@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
