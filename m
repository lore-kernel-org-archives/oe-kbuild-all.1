Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9B139579
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 22:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735338596; cv=none; b=DKTIxGUoP0jR8BSV8cXC8vjdQX6vMyaEP9r6TWjlh5t8NOWWQqnvBnAdAopZyq3eBjovV5s6Ve8Mv3AI7GDiMGJEQr9Hybwm5YuDhpKexF3iGHxSpaFHpmK+9O9MkFbZ/gSgvoBfwgv/Imlfg4YjzaQJGD+hb11hwH2RE2H+YHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735338596; c=relaxed/simple;
	bh=cm50nXXwlDReJqsqhB5uzi7bHAXpbk6N7+DvdCus0wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3uCmwl4O2c7tq0nc2tdIetHhijFQVC7Oq6+yctlFlPoO3fsdzmnepTqIceI/dKJ5biU51YEGz4VV0bB41hcXsjaSGJ0NW6+Kk74mUf0CPJdCz3eHtDz5dr/7XQYwI5IQZu6Um+QQ2WQBiVIKCOH+esyVVE0IZ/vHiIO1BVL+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEMeVIH6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEMeVIH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735338594; x=1766874594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cm50nXXwlDReJqsqhB5uzi7bHAXpbk6N7+DvdCus0wA=;
  b=WEMeVIH6SOkV5EfVT1wtSw7HS7YrgTYd0puwdO0fpWaaLhUd1Onm8ryA
   cLF4rZBAaYHZhM6EwDRQPMpY9Amo6YMc6GUTP8hGJYiij0o3fK+KRgtbj
   BlEwRsHFYDy2sIHBxKgAvyDVrJhDf9abmUpR0ABdO4JNRtuwHaxZbmSOR
   puRqgIdtCZNIG9+z6sCVg/9rQUOhrEfeQxbAXJHtStzfBkk0pRNoi3GtI
   89DumOD2JPwoMga6Hsn1S4XqRByLcc+oeULwyTlxu3Y/8cnqhw/dPjS+3
   xJ1V2ivp24ah1UY7UNfSASTtY5fxPLvWvzDu5mc6nGFAahJ4OJB1wvgji
   Q==;
X-CSE-ConnectionGUID: znrWwxoqQ6WUUqcZXaR6+Q==
X-CSE-MsgGUID: 0aPCzFArQhCZn24bbiWwTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35893507"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35893507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 14:29:53 -0800
X-CSE-ConnectionGUID: 5ToheMfVScyDmdcel6ojKw==
X-CSE-MsgGUID: iV8ov9TeRyOK2LUH/Nsv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="131095708"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2024 14:29:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRIq6-0003ge-07;
	Fri, 27 Dec 2024 22:29:50 +0000
Date: Sat, 28 Dec 2024 06:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13]
 arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
Message-ID: <202412280640.n2fWLrnn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   04e87989806be09036718fa57acd80ea138c2319
commit: 04e87989806be09036718fa57acd80ea138c2319 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241228/202412280640.n2fWLrnn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280640.n2fWLrnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280640.n2fWLrnn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
   arch/x86/include/asm/msr.h:350: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:350: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
--
   arch/x86/include/asm/msr.h: Assembler messages:
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
>> arch/x86/include/asm/msr.h:215: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
   arch/x86/include/asm/msr.h:604: Error: unknown pseudo-op: `.insn'
..


vim +215 arch/x86/include/asm/msr.h

 > 215	
   216		return __rdmsr_variable(msr);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
