Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D11F584C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182869; cv=none; b=GyQdHGR4jLfA2uFcBddGD84eaNPPXRi/zwHB1b1IWKpjb6I2dV+AJRlRfENDRMICDX7aegyu1CefpgEpWgwMjtpKluh4jCEyYuTrISNqpm3XzHjy9VtEj6sSw348Bdr5aaetpdm/lL8Y9bMFmCp8WMi/ReZ53lgMx0TOXrygUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182869; c=relaxed/simple;
	bh=0QjBmDa1A555aR4ZDZlGYszuAo01IYE2ZJ/zTSZeMbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFFIlIrN7dqP0qZ3FBy+GFjadDG1O8zEme/LOvzU89Tmpyw54Ia1H0J/n/8wp1hjg3WhacgFLgsczj4D1O2pf1Cmhcwb3olB6nT6w3anJ0v+nuqCyLn18AvKHSrASbIjV9GwT+TtpCGQwjYN6tKc0g3PpDqga4VmaoIzrPs/vx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBqbC60J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBqbC60J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755182868; x=1786718868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QjBmDa1A555aR4ZDZlGYszuAo01IYE2ZJ/zTSZeMbw=;
  b=KBqbC60Jf5eCTVPY8oP0+Eo0xH4NXAIUMNJb0jSGfoOEocCOyZcHyDtR
   ZluGYn7rmDBpfCYCTr3/O2sOUYZzZXUJHHm0Dl1+fbERbpgIK5JklMaaJ
   zuzv7QZ6CfMRL9IPUr5M9An67haLaisyMVcmC6vCV1t4AifpbfgI4DCj7
   epd3rP109goWPOJwwZeOzsTdFs19imGPzSYE5QTR3+S+ooeySkiCX4hOF
   4Ej6MrD/IfB5J4cVci8quLSgE4ouzSR7xYb/JfLN5kq+ckhQU81egSvHd
   vgyhh2wluC0zWf9iudj77Fh6O5oXnxS/xlijRqKUZTyKuo4vW3RKzeEAN
   w==;
X-CSE-ConnectionGUID: ou5abqCxRLOal4yXIeOKUg==
X-CSE-MsgGUID: BNKEyJ+NSMa+nYaGhnD9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80077961"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="80077961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 07:47:48 -0700
X-CSE-ConnectionGUID: iR2oe+kCRT2QEyNZxAix1g==
X-CSE-MsgGUID: E9OAeuKLTBGaiikWwDtvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="171237930"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2025 07:47:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umZEy-000B3Q-1L;
	Thu, 14 Aug 2025 14:47:41 +0000
Date: Thu, 14 Aug 2025 22:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.17-rc1 14/14]
 arch/arm64/kernel/irq.c:36:1: sparse: sparse: symbol
 '__pcpu_scope_sync_stack_ptr' was not declared. Should it be static?
Message-ID: <202508142245.nuuB3yp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.17-rc1
head:   70a9e57f826256b02474b9c2dba3acffd167b824
commit: 70a9e57f826256b02474b9c2dba3acffd167b824 [14/14] arm64: Support dynamic kernel stacks
config: arm64-randconfig-r112-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142245.nuuB3yp4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508142245.nuuB3yp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142245.nuuB3yp4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/irq.c:36:1: sparse: sparse: symbol '__pcpu_scope_sync_stack_ptr' was not declared. Should it be static?

vim +/__pcpu_scope_sync_stack_ptr +36 arch/arm64/kernel/irq.c

    34	
    35	#ifdef CONFIG_DYNAMIC_STACK
  > 36	DEFINE_PER_CPU(unsigned long *, sync_stack_ptr);
    37	#endif
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
