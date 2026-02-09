Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379973B5316
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770663057; cv=none; b=SO4LvyQEGPUHI6a3DxzOqC976uQsdL+W/CM/yXCmwXxNTzLKrccaLv725o3v4K9JA0FXHkl/2sH7We2+bizxJp+kaQke8L5SNYn6EAbVyMsoZ072YuLmOrrjyoKJwlRSsWTyPXfuF8Xgr2ORqFfjAuVboIn2PShdpol4TzQJc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770663057; c=relaxed/simple;
	bh=DwgfQ6mJc8ozva9GwiQ3/QTqhBdJLRw5AX57vEKRgpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQfn+Tk1a596uKEdiMSFqUp/ddnXR/TLunJ1RGhbdqrU/BGis3zczvcuqmVjJLoFis78AHpVrBqJdfFJKjD3ppGnRSU6Nt92Tzw0VQr4YeX2N+/0IrKr3KDtvpKCxOmzrCbISyGUTgaNe+bwbUOFZNXq9Nr+xaxdNCMECcM9Lmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gADmW44O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gADmW44O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770663056; x=1802199056;
  h=date:from:to:cc:subject:message-id;
  bh=DwgfQ6mJc8ozva9GwiQ3/QTqhBdJLRw5AX57vEKRgpo=;
  b=gADmW44OFgA9TdhDdHWl2JgTMu8F9fh7hwJQsAsoRkuv6fLJ4c8YJ2Gp
   +Z2m2LSFhVz61zUnJDOD8h+cQsLJcPzceCqFr3yOX9dUkvBuPIbVGTjkn
   T/o9VLt3jmoz6DkdQ/Rx7zYONS+VcorGwbGO/S3kvhKBAHARzwbZ/DJql
   5S92mNkVxSXPWEnqrxmcXag7AkKJJTxIMUXIa7ry3enZ4ccw6MPtMB8xP
   Qw8JmlItwReDvI3T4rEYF883NRA/i/0q7buWBz7Uc1nHJsZDWoHm6LRVb
   G5Q0bPDL3vGjbp+n6w3lPqoNQIdYvy8yLkBJI/a5rMJCwhUD9vQd/6yi+
   A==;
X-CSE-ConnectionGUID: +O4O2H/GSRKYOuB0W/E+mA==
X-CSE-MsgGUID: fz6qmzthTC+okkFUs2ku5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71767863"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71767863"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 10:50:55 -0800
X-CSE-ConnectionGUID: v47xMVjTSqyDAQuNznQIjQ==
X-CSE-MsgGUID: NB5NGYqLT6C32sTorrHjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215845148"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 10:50:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpWLU-00000000oFi-0ZET;
	Mon, 09 Feb 2026 18:50:52 +0000
Date: Tue, 10 Feb 2026 02:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_2 1/1]
 kernel/bpf/trampoline.c:40:35: warning: cast from pointer to integer of
 different size
Message-ID: <202602100202.rB8LZs1S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_2
head:   ebbef7d1c33bdfa68df327c0d80101c04ab6d996
commit: ebbef7d1c33bdfa68df327c0d80101c04ab6d996 [1/1] trampoline mutext pool
config: sparc-randconfig-001-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100202.rB8LZs1S-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100202.rB8LZs1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100202.rB8LZs1S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'trampoline_locks_lookup':
>> kernel/bpf/trampoline.c:40:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)];
                                      ^


vim +40 kernel/bpf/trampoline.c

    37	
    38	static struct mutex *trampoline_locks_lookup(struct bpf_trampoline *tr)
    39	{
  > 40		return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)];
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
