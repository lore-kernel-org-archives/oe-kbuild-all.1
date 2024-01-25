Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320110A3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 06:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706163932; cv=none; b=mLuNp6T9f3TQmB8k/SHulexoyI8/VZjCkM2ajrm9SJ0qPhs0rSdRCETaxRkOnuGJFY7laiTo5OFDdTyheQ3D+CzSLji2m0oIwkcloK4LbIekF3DoZOiVxLqgu45t64UJn51yzaI+neTSd66dkLZ2OZQBbWalmlYWpNw9jFiOS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706163932; c=relaxed/simple;
	bh=9uOf1g0OBdiQaLdKtYXsl2cPKOs4tn54cwDGYcMif6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oiTGoU27VecZ9+LcXQHTj1pYhqZXagTC/dI3eIpL99nUC8HzCf4bxGSm2kJ747JKbcD7mwVvVZO688azmvSv2SkFN/f6qyW+QqRtraOkzjsl9DaOLtut+1Sv/M6NGY7HjghyrGfzkEgtgxZFAvFKgAMi5WkM2yGGBh2DXZJNXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O80jMH3m; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O80jMH3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706163929; x=1737699929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9uOf1g0OBdiQaLdKtYXsl2cPKOs4tn54cwDGYcMif6Q=;
  b=O80jMH3mGe7Fr3WQu/4EIJwvIUsdAWyVrS1q1ZKWXJpnJWP50sBpXBiU
   VECDg9yNUYZpph4WoGPI4/r8KXRpC+aPGHEmeEmowvxDfK6xZ7I7ncQmI
   v6GgrdISBKFxaWeLf/kayaoQOWBNCeZtZwnc2x6JmMg4ctii3WgZyxYVL
   zhELQHJd/4t0LdegxfqBb7lJq5KAE7+YwzJS6EzdbqYX2SxzCAdrl4WPq
   BSw+Rh61IOwjhiGu15uqedC3sZEBNuVBbopEma+Agqz99/sNbspXxAbFz
   ujmAiYLdar8HpBmXfCGcRQfqXLfn242Efb0R5Yoiylnz/vn5/YY7NxSr2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400930458"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="400930458"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 22:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2256047"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jan 2024 22:25:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rStAz-0008m1-08;
	Thu, 25 Jan 2024 06:25:25 +0000
Date: Thu, 25 Jan 2024 14:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pic 5/5] arch/x86/lib/insn-eval.o: warning: objtool:
 get_segment_selector+0x15: can't find switch jump table
Message-ID: <202401251452.rNmim62y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pic
head:   019a7844cc2a63d08a2b5f396f68e2c547224ae7
commit: 019a7844cc2a63d08a2b5f396f68e2c547224ae7 [5/5] x86: Build the core kernel with position independent codegen
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240125/202401251452.rNmim62y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251452.rNmim62y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251452.rNmim62y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/insn-eval.o: warning: objtool: get_segment_selector+0x15: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
