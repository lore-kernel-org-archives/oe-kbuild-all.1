Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF21376
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748140682; cv=none; b=tsZXdj+nauOUWTfgPMnhoBllf6TbXSNvJFp4srpnT8a+jxtlczfu0T6mS4bIVtc0dMx+qtKnI0gr2oWRwmYjYNyit7P6ymk7F+SZsoCjge2oUqcS2vVtvQfZ4+2LsBCP8/2pHt7DR8mTY5C5uLeDfsCxwVxgAEnnct32ICYIex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748140682; c=relaxed/simple;
	bh=kDm2hDKscNqQKnuIg/M6+xt2tAWfx8G9kM1qRvhNkTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQ9VYoaUGth8ANgB2/5SX/+QMbvaBPBim0YJTkCDENggeFWxZ+UrkgVdT1lrsvEvraTEII4Dq4xRSFblmRk8XtSfH0+Z40ehAilxbnNkrWtR73gfqJtYi6dp5Zwgqfbzo4vIf5CXzY9tUuQBqqAhCi/IrYjqgRs71ccd1Ksx1UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFj10wuj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFj10wuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748140682; x=1779676682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDm2hDKscNqQKnuIg/M6+xt2tAWfx8G9kM1qRvhNkTQ=;
  b=QFj10wujhRQplYn8T4nlOcjjr/CGUBCsSmn4Oz2kl72f0NcbcYz/kSAW
   GaXTIFzFS9TIl4fWGk7P6cV6VOXfOD16WBcskr+BbITonvivodqda4js2
   OIADyusZgu1aqcq0oNBhadTCP/HDUw1rZ+HDH5cabKOHCuarfCsORKggu
   aefhZYJ0mgaqSS1DCoZPTsRVTa0k3WmHBmsr1Q2Ehr00tWXUPbalO+PxT
   LvQQyvbSax7wtT5/neef9u0cUz4mHMKTYRU54M4aZUH4fobfQCM4Hz4bQ
   DyZ9A4To6mZsef23khopgSJxn8gCR/rYnaRCHOO1hslwF3oLZUuhVPtTa
   Q==;
X-CSE-ConnectionGUID: 9HJIgswhQE6YWBgiE5DKDA==
X-CSE-MsgGUID: ifPyw8GDSnC5lYxoALsiOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50308388"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="50308388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 19:38:01 -0700
X-CSE-ConnectionGUID: sIfX9AyxR5WPqRoAqhQ9BQ==
X-CSE-MsgGUID: XdKQiwleRf+NnuDzP2j5bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="172702446"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2025 19:37:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ1FN-000Ra4-1h;
	Sun, 25 May 2025 02:37:57 +0000
Date: Sun, 25 May 2025 10:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 2/15] kernel/container.c:97:27: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202505251059.qh3NaukV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 61e7b03ab06fef4e10ee9f799118ed4a648e9823 [2/15] containers: Implement containers as kernel objects
config: arm64-randconfig-r133-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251059.qh3NaukV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250525/202505251059.qh3NaukV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251059.qh3NaukV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/container.c:97:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   kernel/container.c:97:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   kernel/container.c:97:27: sparse:     got unsigned int ( * )( ... )

vim +97 kernel/container.c

    95	
    96	const struct file_operations container_fops = {
  > 97		.poll		= container_poll,
    98		.release	= container_release,
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
