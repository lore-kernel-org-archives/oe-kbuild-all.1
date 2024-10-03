Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EE04437A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974369; cv=none; b=grcpI8G37y6IY7eMYgmBH1oBam9OFoLFOmmZfMg5H0/L+0g5hikkPugPi1RzK8Pdbeg/M4KMLXEcjhYbh6uu/sWlWDDaVLRdbtPXiVBvStQ4BXsFMrOYgKhalNkYXaSr48DymdQ94zPP+B//uGs/rh9YgFGkXfaXIqjzQr0F+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974369; c=relaxed/simple;
	bh=opRZhM6dfb3M7QKOBi/Z78DXpUjo8lMRyTeJ/RLy+LY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1MfM7Ul78nHhj615L2sntIzy9CjLVol9dBfCqXuAhJcj95lnieYa94N+vdWOWN5bZ86HU/BBopluPLNlhCxD08C5QwceqQNijGGwKJ0Mq+iVUJW2v/x5Qx94F0gmDSTeZ10MHK23hJ+gzkwpECCamwxlEWEBtyfi1KKyL3JbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRZjd/PB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRZjd/PB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727974367; x=1759510367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=opRZhM6dfb3M7QKOBi/Z78DXpUjo8lMRyTeJ/RLy+LY=;
  b=MRZjd/PBT5RXyxdOl+qxzmKWNPgAfZkZvp4eLYmr2Y1soMfzrNVIIPgp
   TJ9vr2lE6lGmFqC/Jhb0F2Ch79v5NxaBoFeUi19c8mFJ/HmK8Ikaxt9Dz
   8TeJAd9hdkxRfOYXc4ZfXLx2Dv/u0RYD6h3zYZAzLnmCS/kYnMvc8t/Id
   pOXPMHUe0OwmzK7TAAQT3E+bz/Rx1FC2ulbaxTphB1S43bV99HT3zCjeg
   DseaTmdkClYYeCogo3qfJ1RXHp7YBqIbvGqh4P3z8f6XrBsYYEp8HMUtw
   TevuU9zcbHlw8vVl491diPfaUH52fgqRrk72YtRulZe6t2zJQPeo+ePD+
   w==;
X-CSE-ConnectionGUID: 2E63owkCQ5a8EVs4MnJwjQ==
X-CSE-MsgGUID: GLiFgb8YQ/O6wLogGJimsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27271864"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27271864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 09:52:45 -0700
X-CSE-ConnectionGUID: u4P9z+uqStuLAEjo0kvGVg==
X-CSE-MsgGUID: aDkjwu55Qxm9wDe92hOn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74528161"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2024 09:52:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swP4C-0000gs-38;
	Thu, 03 Oct 2024 16:52:40 +0000
Date: Fri, 4 Oct 2024 00:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 5/8] pgtable_32.c:(.text+0x0): multiple
 definition of `set_direct_map_valid_noflush';
 arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
Message-ID: <202410040034.DVBWIwZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   78ddd88de53d081958e51e23b23efa53a0472087
commit: e1b0e568561b8fc6c459b1e72f1210493cc0532e [5/8] arch: introduce set_direct_map_valid_noflush()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20241004/202410040034.DVBWIwZP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040034.DVBWIwZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040034.DVBWIwZP-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/mm/pgtable_32.o: in function `set_direct_map_valid_noflush':
>> pgtable_32.c:(.text+0x0): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: kernel/sysctl.o: in function `set_direct_map_valid_noflush':
   sysctl.c:(.text+0x26ec): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: kernel/extable.o: in function `set_direct_map_valid_noflush':
   extable.c:(.text+0x0): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: kernel/dma/direct.o: in function `set_direct_map_valid_noflush':
   direct.c:(.text+0x274): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: kernel/kallsyms.o: in function `set_direct_map_valid_noflush':
   kallsyms.c:(.text+0xb4c): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: mm/vmalloc.o: in function `set_direct_map_valid_noflush':
   vmalloc.c:(.text+0x4628): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: fs/select.o: in function `set_direct_map_valid_noflush':
   select.c:(.text+0x554): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: fs/eventpoll.o: in function `set_direct_map_valid_noflush':
   eventpoll.c:(.text+0x1fdc): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: io_uring/io_uring.o: in function `set_direct_map_valid_noflush':
   io_uring.c:(.text+0x1154): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: io_uring/poll.o: in function `set_direct_map_valid_noflush':
   poll.c:(.text+0x1168): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: io_uring/sqpoll.o: in function `set_direct_map_valid_noflush':
   sqpoll.c:(.text+0x83c): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here
   powerpc-linux-ld: io_uring/register.o: in function `set_direct_map_valid_noflush':
   register.c:(.text+0x34): multiple definition of `set_direct_map_valid_noflush'; arch/powerpc/mm/pageattr.o:pageattr.c:(.text+0x21c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
