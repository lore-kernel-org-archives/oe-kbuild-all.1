Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1833985
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725186284; cv=none; b=quq1VtKPNg+dWfegdPs+L2mn129WcAaAVmBVmD4g0QqA6oP/dTgzE7QPy2G/NFgOTqNXNdhk8T7CPchxCDWrqGg7P+rJGK6/569joU7Gk2pvS33TIFo/HGxw6qdrE856+4Awv1w4gC3iz9bJT0YCYNtp8ivZxXzcWZs2UJ1VTFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725186284; c=relaxed/simple;
	bh=vopfmYVf1H887o0m/s5666rfuQI+L0IUPonaS1POxwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0CfSKGd/LmgenWNygV8JxJEYoFQwrWMinFl+1/g4RDZ5eijvpsT1nt3kUkxCMVpfZ6ODTvWPUbgx8dCFhjw3ME9Xe/9kxqz4/3QvlQy08yV5kgD0n7GN2h3iDfTryjnI9AT3G8aIcE3VBHHbBzI3ojVh8RgZcGlZWvhMwGJSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJDPj9K0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJDPj9K0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725186282; x=1756722282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vopfmYVf1H887o0m/s5666rfuQI+L0IUPonaS1POxwM=;
  b=WJDPj9K0RtacB2XFkelySgzc12N1iNGwlpTrqZrDocWdIhO8NNes/V7M
   u4xpUWHiHhBbeSe1D46KnLxBPvnlzPKuo6xvtjC3ESsW0J36rB/JkEHJM
   jPnEzPPV16wK67DbQfVClgpycTVNz25zmAO1+sVJNTUgoz2/0pRmjAwC2
   JLE/+DeaO1QUlVjQp+DP0+H0HWN20uLk7mFMOcxJa/GigdOTV3o3WLYar
   OmFQ+MopMwSLN4S0J9PLxQqHgUHVW34CA03PQD5a18GS5rUkzwcEPbDn4
   SSIIllrRONmKjzJWw2QcDCouFWq+6UI07hGylQYdUaqu4ESH85HfToEB+
   A==;
X-CSE-ConnectionGUID: rCJYwvKfRPCy6u69me8Cqg==
X-CSE-MsgGUID: eLrEgq5XTmm8heMlpJOMTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23734991"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23734991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 03:24:41 -0700
X-CSE-ConnectionGUID: x5d88FEpSYC/G3dYGGGi4w==
X-CSE-MsgGUID: FRW9YmRdSGO35cQKNT0KNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="87563752"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2024 03:24:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skhl8-0003ag-1x;
	Sun, 01 Sep 2024 10:24:38 +0000
Date: Sun, 1 Sep 2024 18:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29178/30000] arch/x86/kernel/paravirt.c:65:2:
 error: implicit declaration of function '__text_gen_insn'
Message-ID: <202409011810.7nvZJ2lQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   02994a9b68a17040658e1a32a4438a31ae6f273b
commit: 822da186955cbcd69b4715b8a307053e6c756f30 [29178/30000] x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
config: x86_64-buildonly-randconfig-001-20240901 (https://download.01.org/0day-ci/archive/20240901/202409011810.7nvZJ2lQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011810.7nvZJ2lQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011810.7nvZJ2lQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/paravirt.c:65:2: error: implicit declaration of function '__text_gen_insn' [-Werror,-Wimplicit-function-declaration]
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^
>> arch/x86/kernel/paravirt.c:65:29: error: use of undeclared identifier 'CALL_INSN_OPCODE'
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |                                    ^
>> arch/x86/kernel/paravirt.c:66:26: error: use of undeclared identifier 'CALL_INSN_SIZE'
      66 |                         (void *)addr, target, CALL_INSN_SIZE);
         |                                               ^
   arch/x86/kernel/paravirt.c:67:9: error: use of undeclared identifier 'CALL_INSN_SIZE'
      67 |         return CALL_INSN_SIZE;
         |                ^
   arch/x86/kernel/paravirt.c:327:4: warning: cast from 'void (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *, void *)' converts to incompatible function type [-Wcast-function-type-strict]
     327 |                         (void (*)(struct mmu_gather *, void *))tlb_remove_page,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.


vim +/__text_gen_insn +65 arch/x86/kernel/paravirt.c

    61	
    62	static unsigned paravirt_patch_call(void *insn_buff, const void *target,
    63					    unsigned long addr, unsigned len)
    64	{
  > 65		__text_gen_insn(insn_buff, CALL_INSN_OPCODE,
  > 66				(void *)addr, target, CALL_INSN_SIZE);
    67		return CALL_INSN_SIZE;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
