Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5215E21883E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 03:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770694101; cv=none; b=pIavqsGxaSxb8z7HlTNKJLq4sVGW5i/Qs7BiH1IygFJZyRIIh4lBU1V0oZL4he1cQ1zkS4hlv8yoxtsHc36uaSrYqiLSeEMGvaZdPc0FNWLfr6IotsJMeuupFtLw+1GTi/z2L4uxqGJ7ZALUqBLH9Jt1vbtAKOhyDWMIfOSxeZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770694101; c=relaxed/simple;
	bh=NWCWN7XqwctlP82obuek1j0J2Tdn4PxmrlMzvqSZ0jk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duQ6glj8qJPkhSft4ZXkPJBNcWbEOWkTg32T1axpJEoFz/erec/7Tul7jniJ+PZpK654t/WyGjbXfaPoS06G9uzhumaXTKZHPGpl6wJs5inr9Wk2eYNTnq/XrSdvubxjs29yf7J1i+Z3egu4C3oSYw9dlukUypxlYA31YCzC/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLTn2ete; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLTn2ete"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770694099; x=1802230099;
  h=date:from:to:cc:subject:message-id;
  bh=NWCWN7XqwctlP82obuek1j0J2Tdn4PxmrlMzvqSZ0jk=;
  b=gLTn2eteRzhPAvHLaZ35+d7TJ3XVsk3H+fydaNw5Kh7u9NX+y14cr/cB
   +zhzw7uSn2mSrq3W2KxDFgIZjCjpJccH316oUB5/ywSSRO6ckjxbPZ4Lt
   DoDELYIvJmc0ajSUuEq6I4NeuUiHPQZRR9wHeokoE1Usw8kvoXBFMwnB4
   P/fJG3dLfkIgdFMBLQbO8cqPqbzCmpvKK1D6SrP79oUZHgIC6Dt7VVBz1
   JPGeV5O0whDu4Um8q4Q1bmagX2Rj41uNFIRchVKGCZCOKzQ4petnMEAVL
   nuLsO3taRqWB3mltRLo+h6DAzxulIzWr4RdpugQ0vachhEib6LnPL1dfh
   w==;
X-CSE-ConnectionGUID: z/RcV+YSSqqv6tY8A6p00w==
X-CSE-MsgGUID: RGUnlEMURziJtl/FgP6b0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71717755"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71717755"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 19:28:18 -0800
X-CSE-ConnectionGUID: XYYbgiiWSfexIhgn32dEPQ==
X-CSE-MsgGUID: endlB2PGSV6mYmTuhgzn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216150628"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2026 19:28:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpeQB-00000000oa2-0cDM;
	Tue, 10 Feb 2026 03:28:15 +0000
Date: Tue, 10 Feb 2026 11:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 5/16] kernel/container.c:24:
 warning: "pr_fmt" redefined
Message-ID: <202602101119.UpPZBkII-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   9977221e4d17485700c9229681297e628847d16b
commit: 3f76c2a24020e9099737233f81d0444a6a0c5b1c [5/16] containers: Introduce a container type
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101119.UpPZBkII-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101119.UpPZBkII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101119.UpPZBkII-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/container.c:24: warning: "pr_fmt" redefined
      24 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         | 
   In file included from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from kernel/container.c:6:
   include/linux/printk.h:402: note: this is the location of the previous definition
     402 | #define pr_fmt(fmt) fmt
         | 


vim +/pr_fmt +24 kernel/container.c

    23	
  > 24	#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
