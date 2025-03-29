Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4160F70821
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743261415; cv=none; b=WioimJbOuGf7YTwA5FBnfB+9zPMQeozt0ZO23SdWpHNunyZJQbBkQYGSoVWv9ai81dMRhU99f3qFTobWMqDqMVjqog8dmyfYlceLO2SZ8hKBihvmyuWwj76n2PKaD7DppG7jqZuXvXa3bNf4TzNnBp0jDLnfefEj8nM0bAZYUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743261415; c=relaxed/simple;
	bh=nZ/QbJaGizrLVlBZ5kECimPy8mYV2nFq5kTPBm78B+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPNKzAOqRHvwQ5xzDIt9BHxg02Er53CJO3cT6+qG9JbSbJwTJzF3xc0shGeL3Hh+q82NKdjbaOnUe+EevowIsyXHVLQdNbehomwsakhMZ1eVQfzO7AnqBvdhTBVffT99q0UvuAkRAFvGLuE+HBwe4G7DuQFA0L8b9N4UVkqHlbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N843t2tt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N843t2tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743261413; x=1774797413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZ/QbJaGizrLVlBZ5kECimPy8mYV2nFq5kTPBm78B+k=;
  b=N843t2ttCeFg1zl2/NB3nxrFit9ItKMRs+MiWTRKEV3OjllG8vD9V7dx
   lZsB7oUP63kAttWE8HCW7B/lpdUl5U0i9OmV8wGmCkoloHddtI9eMC+83
   EMCHRSpCOf6+dXYutQcc2/fM5uDb+W/7Cd0NQNc8T2lPsZH6lcaAYUJXY
   ydLhVAh+5J5U0miu2sV6qSzTVsGUiXhyqgDBI7O+NcFSGxAc0qQ5PwMOj
   WWLfPLfrB6ZWHdisK15tUb/myh4heHHEq6pgZRP1xusomgw3/0mQfhd/J
   ioWTvSH6b/Vjc4YidRFsVHd3fAdnGWunftDx31u4n6ECyXrPPirMEEdBM
   A==;
X-CSE-ConnectionGUID: beT370TuTii9BFoB3NjAvg==
X-CSE-MsgGUID: TowR1k3IQvCVXbvWynYtYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="47332017"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="47332017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 08:16:52 -0700
X-CSE-ConnectionGUID: M6yHuhtOTYCItxVWvHBYYg==
X-CSE-MsgGUID: hHegWtAXQOOfB0Gr7+IUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="130401360"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Mar 2025 08:16:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyXvV-0008BO-29;
	Sat, 29 Mar 2025 15:16:49 +0000
Date: Sat, 29 Mar 2025 23:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sundongxu <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2827/2827] kernel/time/clocksource.o: warning:
 objtool: __clocksource_register_scale()+0x1c0: unreachable instruction
Message-ID: <202503292344.LYgqFDQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0e7e8faca7062a439fd0a56574c2c3860ceb2088
commit: 3e04146d67272c65eef5abc5a60c04cf8529ec71 [2827/2827] time: Add mechanism to recognize clocksource in time_get_snapshot
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250329/202503292344.LYgqFDQe-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292344.LYgqFDQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503292344.LYgqFDQe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/clocksource.o: warning: objtool: __clocksource_register_scale()+0x1c0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
