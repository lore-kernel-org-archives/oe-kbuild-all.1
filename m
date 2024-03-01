Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226C2E3FE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 01:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257356; cv=none; b=pyy2DjWTSDfC69dPn7IUH5aJTMFdkjE+o1B508V3P2PnXBwPn63V5zgYUI1cfPRq5fusTuTPocokAoaDZn7Z0vJ5EXyqRqCTqJq8BNvZJQGOg3U2TvLDF5ICwtzDAU0O32C9n6d0vSTQduQLacKSVic+MthU9+iO0Vo8ZmDbr+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257356; c=relaxed/simple;
	bh=xcpzZg/4YOfnTo5nXHx8CCFMze+iOum22XkcK3e96V0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfmoAP5yEyISFmNiu3MKgAnQt8r8NPBmUthNo3NvHhWSJdHtNDU4FQ1nCxhJsMfcSXCwTZ6wMox0Ycrn4NVgUg0ax6zjIJReu2JXqjgs+y7v2jw59pevVu/2qwmdENPs/vlNJbg/orS7MGTBhI3SHcq+PgItSic0L0dIRIJo6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaG8wixR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaG8wixR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709257355; x=1740793355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcpzZg/4YOfnTo5nXHx8CCFMze+iOum22XkcK3e96V0=;
  b=LaG8wixR2Nnvme2G18EjvIUrxXpfC07sTBoUCl79PJYnmO6FLfgVu7B7
   09QyRtw3q6YfRoF7kL1YNeEn3zTJ5xgYweD0+29kBbXQN3RWxPveFzAM9
   vVCOlyO5h0q1ZcgxUE8zNCcVxl+q5eaNdLyK4tECLHFBM4HUgpLZCX26Y
   W2yjJR3Jq1JaRgcrr5YfEaVQYFiNBfVn9QQaDf6TlnEkPHNMrgXF5Ulij
   L6PXFCrzeUXeTN/t48p3XePgytJls8e8weF1JZ1mDI8ROjpscInCpkakY
   lfHm6sT9fp64uI9xeghnIuMd7KC2JBkDi8qCLPsQuKZKw5lBQZ8j0wPS0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7593559"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7593559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 17:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7951147"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 17:42:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfrug-000DRT-1N;
	Fri, 01 Mar 2024 01:42:16 +0000
Date: Fri, 1 Mar 2024 09:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/core 2/6] process.c:undefined reference to
 `arch_needs_tick_broadcast'
Message-ID: <202403010941.6f9ecn59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/core
head:   d42b836ad1ab53c53f6b7016a79fad44d96854aa
commit: e6ca848f8fee8742f078dc7f458475e45ec4549c [2/6] x86/idle: Sanitize X86_BUG_AMD_E400 handling
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240301/202403010941.6f9ecn59-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010941.6f9ecn59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010941.6f9ecn59-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/process.o: in function `arch_post_acpi_subsys_init':
>> process.c:(.init.text+0xff): undefined reference to `arch_needs_tick_broadcast'
>> ld: process.c:(.init.text+0x10d): undefined reference to `arch_needs_tick_broadcast'
   ld: process.c:(.init.text+0x131): undefined reference to `arch_needs_tick_broadcast'
   ld: process.c:(.init.text+0x158): undefined reference to `arch_needs_tick_broadcast'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
