Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67BB30EF64
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509284; cv=none; b=nzHaUG1doXEBAzfardt7DY+BQD0ikMljDe6MJMRyQKLzayeTugHXqJSFVM5iGcZ61QXHPtSQv9GIkDSi8QfoPhNra8YEAhw15PF2SOGM8Thgzct3tQEYY7fIKqHZv4OklPqSZ9cT8Nm9EzqyTBC9qY17i0urHExXu7X+jaIQ7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509284; c=relaxed/simple;
	bh=C2pjXr4Ls5zr1WN0pZoZSPGBUUhKZnFLSGJrPdLibtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYWlvaGmUdGWofrusc8SRmitCSjUvhr3jnBFPFgezKcBZAahPbat4LvhNz5sZIL+5ge+18qA5kIPS02GN0RBTM55i/jorbp4Q9DW/t3eOY+N+5yWzjLLJpLp4Bc4YCVcToGyHJ9C4/yVETxbqJHVIYW0nfFaGXuIa6faEc6A7D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhPQxW8r; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhPQxW8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755509283; x=1787045283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2pjXr4Ls5zr1WN0pZoZSPGBUUhKZnFLSGJrPdLibtw=;
  b=WhPQxW8r1Z7B0iTBBjGCFb6ERjzliQquxMMwrbTUefXoBMvqIwePEDcV
   6H5as8Ihdq8wy8X0dOS+KpyQVAumXccDEm53ykF0XboYiB5Ma7FNxp5NA
   98qOayMmzkr+ZO1LLI3Ak2U0X4erUHO+501S4aBkBMRiWm4o8QC61PSzW
   +dWUWJL1I8No4pVIxn+UDdXXCBS8qwPA3MXk1Adr2RCHak7c7z3GDL3oc
   LwMlaxC+XWCl6ss4fq507KsJ8Uih1cFNSXWu0+VwQ4OgPmmSoGPCWhHDy
   uMD20SLqhmVA7Wz7Mv4LdxwnAqv8YvedSwy5ErWNW6Pu9s9dQs+k7RlLp
   A==;
X-CSE-ConnectionGUID: zMjKzbZwTEGAXa1Ldttogg==
X-CSE-MsgGUID: PRQfri7TTlWTCaVS1JqsaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75179772"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75179772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 02:28:02 -0700
X-CSE-ConnectionGUID: tbQOhWw8TOmgKu74Ap7jPA==
X-CSE-MsgGUID: V08+qMPKTqOfYSqzkX+whQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167884899"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Aug 2025 02:27:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unw8J-000E6Z-2m;
	Mon, 18 Aug 2025 09:27:12 +0000
Date: Mon, 18 Aug 2025 17:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 28/29] filecache.c:undefined reference to
 `nfsd_handle_dir_event'
Message-ID: <202508181702.85pmFFUA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   0e4fdae38169391dbfa82752190fe91699d27376
commit: a7d58c75cc7c5f9bb12baa7e2e246f8bc14b1029 [28/29] nfsd: add notification handlers for dir events
config: arm-netwinder_defconfig (https://download.01.org/0day-ci/archive/20250818/202508181702.85pmFFUA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181702.85pmFFUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181702.85pmFFUA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nfsd/filecache.o: in function `nfsd_dir_fsnotify_handle_event':
>> filecache.c:(.text+0x204): undefined reference to `nfsd_handle_dir_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
