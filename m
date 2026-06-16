Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41892E88BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599378; cv=none; b=ig66RoSWFINq0SH89VAu6m725P3BQUN5ATe0IpyFK/WMjN3f4j8La4D0x5SC/KMcsMvQ6D97Z2LIq5jo5Iwr8pRBo+lQHX+949lONg22QhciNz/2aISZs10ELpQ/FC0/dmXVf3csJ1hl1E5toAAsKsAOqOLLhy2LDcOYU847hu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599378; c=relaxed/simple;
	bh=XUWVo2SfWn4eB2R/d1q9MnNZCR+A57oXLBc8IID9Bj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5CCAuf/gCAkCEoZrBlKyhtY7kVnAgWAjCQaDg7PSpgMnwNtYxEj2hBVEPz4rTxGwczKn5LyKLq3N6WAxlRy1/QfMxWbpMbrD3abVEfOXS8P2zca05vlLXpBdireFyMLD992P3xjYY5fFsBL0HpCiqxSTXijcy4wst5e4+fMr6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpMCi9rK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpMCi9rK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781599377; x=1813135377;
  h=date:from:to:cc:subject:message-id;
  bh=XUWVo2SfWn4eB2R/d1q9MnNZCR+A57oXLBc8IID9Bj0=;
  b=mpMCi9rKVesSRteSls/B88PlqRbRNzx9BTMsK4enGg0q4cWsErs/QrCk
   0q28FPW9+CEDWsujRUINQg8boWxgDNVU5hrDkesGgy4am3/HCse2qKCUF
   er4UcaqB0S5Iukyr5C+SZzc4yrqMvgauOwKa8RvkffTdHiOA9t3JsHLP0
   at+dq6OdE9LGTJH+TIfUHOvAZbZ0dbkGYtSWrxaNnJ/twU2Az1EGl7WpN
   TPfLtezgg0aIS8VBbI57lpbLQrNCpNrouH7i1CaNzr3E6shmalwMCiR0J
   /r+uMyp9UqRhcdF8PxcV9AYqxqvymhVgA4z5gktiYq7Hirw1iQ6gtqcWc
   g==;
X-CSE-ConnectionGUID: RLt4zeizQgKRD21p8xHr/w==
X-CSE-MsgGUID: 6Tt3Wj3JQvmekdg7ULHLWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84922754"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="84922754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 01:42:56 -0700
X-CSE-ConnectionGUID: wDL6+YrXRsq1rCyw1Wi48g==
X-CSE-MsgGUID: qLR2LC2LTdCV3jy9X6QCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252685507"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 01:42:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZPNk-00000000SwA-07lZ;
	Tue, 16 Jun 2026 08:42:52 +0000
Date: Tue, 16 Jun 2026 16:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kfree_rcu_nolock-v3r2 2/9]
 lib/tests/slub_kunit.c:410:9: error: implicit declaration of function
 'test_nolock'
Message-ID: <202606161614.v4taQKBs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kfree_rcu_nolock-v3r2
head:   ae8ee8383751a6087097cfb02110c1f489b1eace
commit: fb5395cf57a5aff4eef4ea985d132edb5fcb373d [2/9] mm/slab, slub_kunit: register kprobe to trigger _nolock APIs
config: arc-randconfig-r132-20260616 (https://download.01.org/0day-ci/archive/20260616/202606161614.v4taQKBs-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161614.v4taQKBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161614.v4taQKBs-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/tests/slub_kunit.c: In function 'slab_kprobe_pre_handler':
>> lib/tests/slub_kunit.c:410:9: error: implicit declaration of function 'test_nolock' [-Werror=implicit-function-declaration]
     410 |         test_nolock(ctx);
         |         ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/test_nolock +410 lib/tests/slub_kunit.c

   403	
   404	#if defined(CONFIG_KPROBES) && defined(CONFIG_SMP)
   405	static int slab_kprobe_pre_handler(struct kprobe *p, struct pt_regs *regs)
   406	{
   407		struct test_nolock_context *ctx;
   408	
   409		ctx = container_of(p, struct test_nolock_context, kprobe);
 > 410		test_nolock(ctx);
   411		return 0;
   412	}
   413	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
