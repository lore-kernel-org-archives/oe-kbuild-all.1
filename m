Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6419223DF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 23:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758671287; cv=none; b=Vm9PCJAfXy6/G683EBKNMmm4hKXK73W3euAdmPbhxIhfgoqmMhzSCGCrrG3U8i1qFUdvDXowhJmVshgpwPkXUlWb11804lOPiWw8piRCiNf4KUbNtCVQxJ0YakynMW9WVONsYRYJHXKOTQNRYEREneL8ssvxh/5+RgYPIkN/7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758671287; c=relaxed/simple;
	bh=NvKSu2Fjr8Yf2kcvPE1+Um2EJGV7AwCaV49RRAY4Yh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kflagx5QgqSc3BzcigwMLxpkmhc1EeJQp0ClaAgN2fOltcHiYKcBKRI5QLz4dwyLfuTvl9d3i5hS0uHDjZ7PTCfOnZfOvxQopy/uhmWqpZU4yNYD+QpJ+Ghih0K7KRo9Hz82kDAGu7HHn0OUql95Kul1dq3DWpGCB9giC2LS52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsgZ/7TW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsgZ/7TW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758671286; x=1790207286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvKSu2Fjr8Yf2kcvPE1+Um2EJGV7AwCaV49RRAY4Yh8=;
  b=DsgZ/7TW9Q65/MKEz1/PY2btMKzsisNwHgOQMaMVnwq+w0jh2ByKMAhT
   mb7975upE04mLlL6Nmxx06hP5nTGo4ke21uZI3uRdqVkVqQO9hDOurjoZ
   dAAddhh+/k9CHqS7FT2Up4Yw8VUFV0x3cPRHfPYmkRidwQ/ASVnJnexTw
   s878SipzbQR/7W7y/89OIG4kcYR2SQ2tZkw5/Go5NyDD+L/I40+yMUkid
   aaBCz6JrNyV2L9pkuPwGvwfuTiuhWGXyxz3D+bDKH+lAmUbncwQXv06au
   rdelSxZhQr4Hc8C6HGSjxpuIKBjwLPMdZcjdqzS4crO3uDHPOmJ69Lw2K
   w==;
X-CSE-ConnectionGUID: zCyopEISTKe8J5jTS4uO6g==
X-CSE-MsgGUID: m0Qs9b73RsSIppTY32wciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60902147"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60902147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 16:48:05 -0700
X-CSE-ConnectionGUID: cvMqVunNTjeMgA0Z1Qyzeg==
X-CSE-MsgGUID: ItBIbUQJShG5iolhOvck6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="181195436"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2025 16:48:05 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Cjq-0003dh-1E;
	Tue, 23 Sep 2025 23:48:02 +0000
Date: Wed, 24 Sep 2025 07:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 2/10] include/linux/ftrace.h:557:5: warning: no
 previous prototype for 'register_ftrace_direct_hash'
Message-ID: <202509240746.b3jrShMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git test
head:   1b7fc74c36a93e90816f58c37a84522f0949095a
commit: 9e61f8f6a969f104f5beb67d18c95deeabfba73a [2/10] ftrace: Add register_ftrace_direct_hash function
config: alpha-randconfig-r073-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240746.b3jrShMl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240746.b3jrShMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240746.b3jrShMl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:43,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from init/main.c:22:
>> include/linux/ftrace.h:557:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
    int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_ftrace_direct_hash +557 include/linux/ftrace.h

   556	
 > 557	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   558	{
   559		return -ENODEV;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
