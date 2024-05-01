Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904D1304A1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 22:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714603498; cv=none; b=UhnjYOUrNHY4ZhEx6DDRPpvdJbhUxLMp3NmD1ksRzIKCOn4q3fN8u2yBr/x+NiyNsIiO0eiIFMwQ/WrJFqPgeIlw2+lKZ5ONzSVoq7ky5jbpWbeWl3wsHLFHqisQ8Unq8FTnZVsXQTLncET/e9aOS3F+db/sVBRCJ/ovxhZyWRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714603498; c=relaxed/simple;
	bh=7K9CeFAO7uqA97WNZ4xpaNSR4scMPfwD2zluu1eaohM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPWBJ7vVwRU2z5cX7Fri8pmiA+I6N85svKy2KDeXn1EFjzooNYMkC6PZVongeHKAIrDboMkvEU3SxZIl0hhn4BCiWFbVC8g3v76WF6ufCy/yB7tjJpGfyrFZVTuUizamHTCYxCCkq53CwqMJzdlfQHllyOuxkIkc+L2wYaW240M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvdug5uu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvdug5uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714603496; x=1746139496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7K9CeFAO7uqA97WNZ4xpaNSR4scMPfwD2zluu1eaohM=;
  b=lvdug5uuqHeuqjcaxpWs1udqD/z+4csO7zKj5VF0iPR9UemG7S6OtGnn
   sfYVuU3s/55PrgQKXtpBfuM2jkHlwx133LqPQUIhKfaD9OlDt1tRmP4Ai
   tmdQTL/ZZ64c4T15HxcE4soY5GJJlysv9WHE9BCH2zPfPWV4dsWu/kttc
   0xiPOm6WJLpSRUwFwQap2QH670P7p1i1+MTMiN/ekk/m8l5xbyeFWlbIx
   0zvN4yI0rlfyD6TF3m//qDW7NWVE+vafciNWt8JDbSRKXZQ8V41dQ+92p
   k2QYWwojP2xyHq9nAZGmfOsj/T6f6lZKhcZRbRwEBpu1Cza7wF3hEjWNS
   A==;
X-CSE-ConnectionGUID: YRrrsc1dSo6gXDy04FXv9A==
X-CSE-MsgGUID: GHPZ1KcCSv2GVOWjFuirHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="27839999"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27839999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 15:44:55 -0700
X-CSE-ConnectionGUID: sm/VivjUTsaeMMqikf7XnQ==
X-CSE-MsgGUID: nbj5HhITRDCJm6LsaMxSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27033689"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 May 2024 15:44:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Ih1-000A3w-2l;
	Wed, 01 May 2024 22:44:51 +0000
Date: Thu, 2 May 2024 06:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [brauner-vfs:vfs.xattr 2/5] fs/xattr.c:709:82: sparse: sparse:
 dereference of noderef expression
Message-ID: <202405020648.3uFxVzVf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.xattr
head:   0703b9aad555387113b9112cdc84469d12fda266
commit: 71491cbe0205be53be1a044594698eb21c1c15f4 [2/5] fs/xattr: add *at family syscalls
config: x86_64-randconfig-121-20240502 (https://download.01.org/0day-ci/archive/20240502/202405020648.3uFxVzVf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020648.3uFxVzVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020648.3uFxVzVf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xattr.c:709:82: sparse: sparse: dereference of noderef expression
   fs/xattr.c:855:76: sparse: sparse: dereference of noderef expression

vim +709 fs/xattr.c

   689	
   690	SYSCALL_DEFINE6(setxattrat, int, dfd, const char __user *, pathname, unsigned int, at_flags,
   691			const char __user *, name, const struct xattr_args __user *, uargs,
   692			size_t, usize)
   693	{
   694		struct xattr_args args = {};
   695		int error;
   696	
   697		BUILD_BUG_ON(sizeof(struct xattr_args) < XATTR_ARGS_SIZE_VER0);
   698		BUILD_BUG_ON(sizeof(struct xattr_args) != XATTR_ARGS_SIZE_LATEST);
   699	
   700		if (unlikely(usize < XATTR_ARGS_SIZE_VER0))
   701			return -EINVAL;
   702		if (usize > PAGE_SIZE)
   703			return -E2BIG;
   704	
   705		error = copy_struct_from_user(&args, sizeof(args), uargs, usize);
   706		if (error)
   707			return error;
   708	
 > 709		return do_setxattrat(dfd, pathname, at_flags, name, (const void __user *)args.value,
   710				     args.size, args.flags);
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
