Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2D2FF650
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755132317; cv=none; b=K13JF/YMZj8oQK8LWNv09SP8jvZewYzEEwpkF8UaFOZ3V5IV050o/Q/ZpeIsq/g9P1wRid2D2HiNInBCDi6b+5PHlIMxTVg82ZcggZBi8dra+dIvF3cPYBd1sNpXqrN4f8SVn7YxGcoPxh2Dhkypn/Q/hxmucP629s3zy+ovlSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755132317; c=relaxed/simple;
	bh=v+byxB+1yIYCZex/54cFMcbgoioUBuPgWyfWbztqLrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lb9MiO3iTAvvGZup8qD+V2UWP7U3BVHmwSnXzQK5VOtBUv8vI6QaBicx8PySR5cZG4aXl3mSFknEeZppXxZ7Bxil1ygIGh/qZ34ettamVbxsad+FsRd/9urq9gyqxNALlEkDJ12TUOHTE692h1IfNd/r0flJS6K6LJcf7rLrLYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLeVfM/X; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLeVfM/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755132316; x=1786668316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+byxB+1yIYCZex/54cFMcbgoioUBuPgWyfWbztqLrY=;
  b=kLeVfM/X0oGn8h8Sog6d1MAx9PKUZt6FIsD8eQh2PStmg64Mobpt+a3s
   Po4gV2BR/35bS3yKbE15/pWDLJ6HVAf/5a4lOeyJtNOlwSZhShIQtlhEo
   GjkMV8jGnFJEm7sa92/2knA0wu99W7Fe9YyRbRKpSf/Pczkp/ch2BIlSz
   IegQFqXErUm7pNlqxGuA+fsxaOCq750arZH5GUayAIA2CzDMB3qNnmPmh
   +XxgPWlymS7pgkxc9MEINSiPucp8S0GhTXvef08JMJIv0VLxSoikgtLTl
   8a+KD2PlWfAagsOwsPhzCiA88jORff2YWbN0CtElWOjAdXV3L+gw0kfDG
   Q==;
X-CSE-ConnectionGUID: qhs4ny8vT4mUyiS1+XsA7A==
X-CSE-MsgGUID: ZZ6DM2MNT8i3CkF+6TRfAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68895917"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68895917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:45:15 -0700
X-CSE-ConnectionGUID: i+JaVff2QoyaJGWCGBFGfw==
X-CSE-MsgGUID: lo66jY3uQ02cJ2ycAHR71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203796932"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 17:45:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umM5e-000ASa-0m;
	Thu, 14 Aug 2025 00:45:10 +0000
Date: Thu, 14 Aug 2025 08:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 19/19] rseq.c:undefined reference to
 `__get_user_bad'
Message-ID: <202508140843.38RVWZDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   c3f9d97d82881880460dacf48da60a280f4797cd
commit: c3f9d97d82881880460dacf48da60a280f4797cd [19/19] rseq: Convert to masked user access where applicable
config: arm-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250814/202508140843.38RVWZDX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140843.38RVWZDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140843.38RVWZDX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/rseq.o: in function `rseq_get_rseq_cs.constprop.0':
>> rseq.c:(.text+0xe2): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: kernel/rseq.o: in function `__do_sys_rseq':
   rseq.c:(.text+0x260): undefined reference to `__get_user_bad'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
