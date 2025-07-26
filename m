Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D2262BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 22:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753569167; cv=none; b=ASOMMuoNScx+iYCxYyYUPSloS5jRMXmiL2VF0cyzWoLDgximr2ec8xAmCMd+xF0bB4O/RTGHPIar7PXKlKgMJ0TERzBHzOSiuP27frV5BcPQUKa4rOjw/BIzSbQ17CgnqIFAsRLy6qahNGTGG0A5wtqFlCMuUPJa0EJSBgDto+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753569167; c=relaxed/simple;
	bh=reADTfndVzI2+z9W9/esvxdERdYDZRmhL1BAFMyyizU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbi/hUBljlE50y0SQ0iZUjz9tV/PzMn9krKN33hE9CC3fVzwJ0AZIuerGqC4WdR8RwDgJnwyBI6l/A+DWzQh7YBwPtIK8YSQvu+Y/Sjh3+VUTDbBU+wcgYzd0EjkIv1WguO8AHuRitaMYUoa66/tqbVm6EmhQn/U+Tcxvx/aNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hM6yCRuy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hM6yCRuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753569165; x=1785105165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=reADTfndVzI2+z9W9/esvxdERdYDZRmhL1BAFMyyizU=;
  b=hM6yCRuy4HK10Wln4yzfpfMvEQ9VQtxB8sapK6Vk4mVumgZmqPMoh0eo
   X2/EUX9RPSB6X6W9flinTLFz6LT5rnD5MbU52xWUaZrIdH8AUKVVeB0e3
   qxi+8Q3TbHuvLmFpHYLAFMqkQW9le8zJWz6rozhH70uqbiTTy/jkfPPP/
   sleiHd7UTww3ehdAheOxagFoPFxU+B9nJ2fAhvVIyyWvxQ8gKp6Fh18OQ
   14AMlDpHHjbexz+MizfWbi7yijpigS3PMoNX8DW24ZdWswq0ERKlh67vS
   kgkqER2bzUnSnlB6njg0Y0uTuVBGh77eNr8N4Wt9nqlb+j3Gqr0GRfFY4
   g==;
X-CSE-ConnectionGUID: +p0eepGQRmGz+1TlhuqqwA==
X-CSE-MsgGUID: hF9JfRmARru7OZHW4TurkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55803726"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55803726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 15:32:45 -0700
X-CSE-ConnectionGUID: H44uPCa4TYeMcKyPLztTYw==
X-CSE-MsgGUID: /qgamkR/TBSzg3dQggTxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="185431246"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jul 2025 15:31:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufnQP-000MJn-06;
	Sat, 26 Jul 2025 22:31:29 +0000
Date: Sun, 27 Jul 2025 06:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:thinkpad-t14s-oled-6.16-rc7 82/91]
 kernel/sched/debug.c:557:71: error: 'sched_min_base_slice_fops' undeclared;
 did you mean 'sched_verbose_fops'?
Message-ID: <202507270605.OzrFMI5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux thinkpad-t14s-oled-6.16-rc7
head:   d146b94d36c03f181f3bfb8abb88e849da974e58
commit: e6aea2db083fdaa92d663258d1eb50d7eeaccfdf [82/91] linux6.16-rc5-bore-6.1.0
config: arc-randconfig-001-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270605.OzrFMI5W-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270605.OzrFMI5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270605.OzrFMI5W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:26:
   kernel/sched/debug.c: In function 'sched_init_debug':
>> kernel/sched/debug.c:557:71: error: 'sched_min_base_slice_fops' undeclared (first use in this function); did you mean 'sched_verbose_fops'?
     debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:126:11: note: in definition of macro 'debugfs_create_file'
     _Generic(fops,        \
              ^~~~
   kernel/sched/debug.c:557:71: note: each undeclared identifier is reported only once for each function it appears in
     debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:126:11: note: in definition of macro 'debugfs_create_file'
     _Generic(fops,        \
              ^~~~


vim +557 kernel/sched/debug.c

   555	
   556	#ifdef CONFIG_SCHED_BORE
 > 557		debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
   558		debugfs_create_u32("base_slice_ns", 0444, debugfs_sched, &sysctl_sched_base_slice);
   559	#else // !CONFIG_SCHED_BORE
   560		debugfs_create_u32("base_slice_ns", 0644, debugfs_sched, &sysctl_sched_base_slice);
   561	#endif // CONFIG_SCHED_BORE
   562	
   563		debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
   564		debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
