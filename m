Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F0D288BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721250583; cv=none; b=sCApnc/ROcDG9W3A+EqNAmLs6eHjhBTW3EC3OJeVKF3Ihc4GmtTPaMdoCRCNjA96mOl/ZCshY+vLhTLCYC39yOuN1DCR0dYGEoLVaIUW5rTtwnJOtrjnQN4D7RyI7xW2VtFca5su7v0oRlskE5DTyNx/shT+L5bue3OHitHNBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721250583; c=relaxed/simple;
	bh=NInnpERN0zUxE66yk0Fys1KafyzH8+CJcg0wR8TdSxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJ/nHlGnPGXTYX1K3CKRK+E4QTT7p9HZ56xJUlEfdabAmJfq+BvRWhXEx4dp9DY0dGPxvGYFyHN/xWYCyazWlP19Gu3gHUIG57IKhrKiPRZIAceinopQrOMUZZhaQl2UvC1BeE4iFBOtDm0xDf5I4dIBHmFzPt9P2DkAqX1DumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtXOqBH+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtXOqBH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721250581; x=1752786581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NInnpERN0zUxE66yk0Fys1KafyzH8+CJcg0wR8TdSxg=;
  b=PtXOqBH+Di5D2yXwgdWLXTPR/P4SPTGtvgvGIoSOrAxhfb5mUzFa2Orb
   OPPgokvv1zJbtjfIZk9axgu2w/3kxe8/HyLF7ktCjBkNdrVW6G2gD8Z1t
   JIDMfbc3cm1gYqZ6yLGedmCDt/YFHeCK7aKeTDyU9wJebucWBXpXNcVlG
   dUxIPb8CD0IEyurbOQeEB3a8n11PNYnImE8G89BNSMnc6s0d4dydW3xPq
   85nqgohWyLBNZMH58nJCbainixBIuYSfVC6fO4ZTYbCWteNCxzQCFTEjh
   lidf9qZi92w6Rau4OBAphk8U2azQByo3toXRiAA/JxwWUYPOZnmfNbzxE
   w==;
X-CSE-ConnectionGUID: yP9461m1SY6p/3d4VYWm3A==
X-CSE-MsgGUID: kxldbg9mSOGUveCIDw8qkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596133"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="12596133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 14:09:39 -0700
X-CSE-ConnectionGUID: 3A5pglBURLCoJu2Hx3TZ8A==
X-CSE-MsgGUID: dwtgsBiyQ7iHofmCqLYtOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="51246248"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jul 2024 14:09:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUBu3-000gfp-22;
	Wed, 17 Jul 2024 21:09:35 +0000
Date: Thu, 18 Jul 2024 05:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:syscall-tbl-6.11 97/98] riscv64-linux-ld:
 arch/riscv/kernel/syscall_table.o:undefined reference to
 `__riscv_sys_setxattrat'
Message-ID: <202407180400.SzsjPaHl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git syscall-tbl-6.11
head:   9a99991d90521113a738c2a4761a4147fe4b31ca
commit: ba754a0c3990ba735ee924a005c9e7f11894ad30 [97/98] fixup syscall.tbl
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240718/202407180400.SzsjPaHl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180400.SzsjPaHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180400.SzsjPaHl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-ld: arch/riscv/kernel/syscall_table.o:(.rodata+0xe78): undefined reference to `__riscv_sys_setxattrat'
>> riscv64-linux-ld: arch/riscv/kernel/syscall_table.o:(.rodata+0xe80): undefined reference to `__riscv_sys_getxattrat'
>> riscv64-linux-ld: arch/riscv/kernel/syscall_table.o:(.rodata+0xe88): undefined reference to `__riscv_sys_listxattrat'
>> riscv64-linux-ld: arch/riscv/kernel/syscall_table.o:(.rodata+0xe90): undefined reference to `__riscv_sys_removexattrat'
>> riscv64-linux-ld: arch/riscv/kernel/syscall_table.o:(.rodata+0xe98): undefined reference to `__riscv_sys_uretprobe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
