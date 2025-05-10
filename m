Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32391A2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746837197; cv=none; b=PHeVZXedqlRXaZ/Vi98MRX8qovCZfDULycyVVHCsg3m/Lntgv5gCguBwIlojLd3FlC16DohfBZ8hFvfQbmAibBHwIDvPh/gPXZ3E6JF/UfMKCIDj/3SSwalQRs1qDa9WgxJJBp55LCpVTjZw0hky12m2P4lTKke41WM0+08YodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746837197; c=relaxed/simple;
	bh=15dk4HRfl3Tj2SYBMkDxQ/ocmZUlOFHxJunAU70Z0Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDCk8Y1z4xWBUmeVkgTXRfF/VDI8/XYsy2ebzCg6YCGaayz414urihj26m3UIFMOaoLgoSCv26U6RrSgeG2FUPxwpqaNYovuJwdgZlifaHBFvs3lWkEixXq8QfXYrmnjfBn/yLttjIfbzi0x57rQoV+DwZGqjY4VNY8FF6jjbGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bq9beBuv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bq9beBuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746837195; x=1778373195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15dk4HRfl3Tj2SYBMkDxQ/ocmZUlOFHxJunAU70Z0Sc=;
  b=bq9beBuvHVS+wWJjkL4QQ+R2wgrlT+n0abWkJ/panQhZrXjng4AMSnvt
   W7BeKDle3Njx8nS+stgDZEwVDZeM0jLcFmf85+8TZMtQ3VZeTATkMZ4fe
   v6Uz8aVp3C9B6NnULPqZOP95VYtW8S7naEK9JTWjjqOa5+Wna0T3XUxFo
   BQyJdONSrBB13rKxgKGOVhoRcf3CEDHPWCtrzNqKhYlOcsw+Q495tWUoF
   Qq/53giOqCp7pl12X/qhiXzxfnwLvsBv0HdqvDzKq7O2YjCr+R4b0eVtb
   XqGKt0Yy8UH/lo2NaOoXEJ9kpNuVHrrC0FMmnzlZauveS/0wFGXJgSOts
   g==;
X-CSE-ConnectionGUID: 5JJN+s6tQSeo1Q1/wcKnsQ==
X-CSE-MsgGUID: uEHejwzgQlO86hA2w25yAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48601780"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48601780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 17:33:14 -0700
X-CSE-ConnectionGUID: I8QhpaB2TrKo9U5FJo4i7A==
X-CSE-MsgGUID: cxkqXNpkQHyXahxYj17BtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137160214"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 17:33:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDY9P-000Cax-24;
	Sat, 10 May 2025 00:33:11 +0000
Date: Sat, 10 May 2025 08:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] fs/proc/stat.c:41:5: warning: no
 previous prototype for function 'get_iowait_time'
Message-ID: <202505100801.ziVFA3Ca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a79e0786f3fa90fd521f198ac6ccf6b11dbf67c2
commit: 3014b20d3d7c0a34a5968c4337314684b0fe0304 [0/94] anolis: cpuacct: export cpuacct.proc_stat interface
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505100801.ziVFA3Ca-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100801.ziVFA3Ca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100801.ziVFA3Ca-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:41:5: warning: no previous prototype for function 'get_iowait_time' [-Wmissing-prototypes]
      41 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |     ^
   fs/proc/stat.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         | ^
         | static 
   1 warning generated.


vim +/get_iowait_time +41 fs/proc/stat.c

    40	
  > 41	u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
    42	{
    43		u64 iowait, iowait_usecs = -1ULL;
    44	
    45		if (cpu_online(cpu))
    46			iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
    47	
    48		if (iowait_usecs == -1ULL)
    49			/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
    50			iowait = kcs->cpustat[CPUTIME_IOWAIT];
    51		else
    52			iowait = iowait_usecs * NSEC_PER_USEC;
    53	
    54		return iowait;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
