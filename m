Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3F433B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904977; cv=none; b=s/4ip8D7jAopDnjieyUTgFTsTPlZ0BaVoB+oT2fJ3RzWUk3/6Arpehxvi+XJVciSAEwrEVVZmIk2pOad/CFuOJT5y5VCzbvhRNUfSSOvsXRMMHQ8JJ+XK5C+qDyS7UnHKZxxsT2x36rPKm8fgQnK8QZxVDm0Defuxp+H1FrL0Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904977; c=relaxed/simple;
	bh=bSmn4vXGgg5+WTfp4cKs47zBY2mVAC8bNqS+AS/3aoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJC27dOOJ5po1di7lzjhKYhVjhqDETTdMRZWHAXey+OT5SI7tAss9jESx3FRlZa7ZljhPf9ywjqRa5xVKwfmcCoQuhU8LW7bIygviFbeiWIYsA5rpQL8tAsp8jtlTQMWbHUqhvMlc9twQ/+357G5KQGobg/aBVvk08p5AyOwrlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJ6SSDK1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJ6SSDK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745904976; x=1777440976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bSmn4vXGgg5+WTfp4cKs47zBY2mVAC8bNqS+AS/3aoM=;
  b=lJ6SSDK1hKyGuVMmVCp8BYfW0rHtexyJx36XfdTTKSZnHuD971FfIJKd
   XC1s0QRetR3rYofYIa/WHlxAtltmuJSNYBUOOg/gHo2F5GLxz5pztXWv6
   PAtOLEPF+zZz741qCVc6ax1HhqzCDMyL/g5K4sjg3mBc4UDZPUzN1yWtg
   fB9Rk1HewXLOJaGufcbj0wEPsHrf0Ghz/UVW505QuJkOGh5lhBZei1e6h
   gCS2M3JCKaoPOAFseUczbPU94Cz4Mw0twkUgbdALSZhIOSFJVqLJuxI7V
   enInqvWZycOASzmnEEwMMIHQ4pXpEidKKOhyBFGVMmi4j11dO69b0yAh7
   Q==;
X-CSE-ConnectionGUID: vzvn9onJQ56RzNd48C+YJA==
X-CSE-MsgGUID: Hn2jvWYMQDyRQizp7bBszw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="57715466"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="57715466"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 22:36:15 -0700
X-CSE-ConnectionGUID: NJQrhJnmSfCJg0Q5QrH0Aw==
X-CSE-MsgGUID: ngripj2yQW6VXPcxtV5uug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="156953577"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Apr 2025 22:36:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ddb-0000UJ-2j;
	Tue, 29 Apr 2025 05:36:11 +0000
Date: Tue, 29 Apr 2025 13:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks 17/18]
 arch/arm64/mm/fault.c:914:6: warning: no previous prototype for
 'do_stack_abort'
Message-ID: <202504291308.KSvqxtSl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks
head:   6f50dac461ca66220a13a927db438e4a75708444
commit: 9f8b2eeb16285187ca7653f6e4ad94fdb43c9096 [17/18] HACK: aarch64 dynamic stack
config: arm64-randconfig-003-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291308.KSvqxtSl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291308.KSvqxtSl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291308.KSvqxtSl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/fault.c:914:6: warning: no previous prototype for 'do_stack_abort' [-Wmissing-prototypes]
     914 | void do_stack_abort(unsigned long far, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~


vim +/do_stack_abort +914 arch/arm64/mm/fault.c

   913	
 > 914	void do_stack_abort(unsigned long far, struct pt_regs *regs)
   915	{
   916		unsigned long addr = untagged_addr(far);
   917	
   918		/* Deal with dynamic pagiong in of new physical stack pages */
   919		if (!dynamic_stack_fault(current, addr)) {
   920			/* Not good */
   921			unsigned long esr = read_sysreg(esr_el1);
   922			die_kernel_fault("dynamic_stack_fault", addr, esr, regs);
   923		}
   924	}
   925	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
