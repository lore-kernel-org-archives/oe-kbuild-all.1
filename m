Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261665;
	b=ALj7F9HK8zqiV/3Wg2PH/k48d/Db3Mk3LdKWploEhBCIVi9hpp6Ey1B9TZS6aDLYEPhk
	 pGUyvRbwSiL+1bRFIIzVLY1IJb8VpyyhGM0s/DY9t9vzMlAW1R95m3eFKEuFQsum0yCf8
	 g3+1VRvipssf987lUkJSrAtctfxedwwjNjOb54Xff+e8cjepdzavgB72e+Z6ZKOEYTeVm
	 qCkElRVwsQcp0Fw9kLQDD0sQuWPxbodvLmzBY4f6qjebQW6pQsrqqp1/9BuIkpEJSPbk5
	 v91KKzAoi/fE8FM80h8OFsxGwDFZ3r4tIozHtNaxm+pbMH3vvu/rXei78W95LVpihIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261665;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cWl36M9KFsnLAjNqA4VB7rDOdlw4SIjM0/hGlv/v5ic=;
	b=hc3KMAZt8lzpoFOmEy2QF6dVrAPrA6JEdiARZTUczMd/ohjy2msIn+7hvUhxGTIghxNc
	 rhElmlUCGhwwdbKIeHybI+yZuZY8Z/2WWHb044YnUWTklrDKIwaQA2sIwjT/dE/Q0KPAb
	 A5Ablbhv+WkqmiHOLblIFqzvfa0YdPrhXysGfRunr2yZaD4VaZvDnykmzx32K5eaOrFi8
	 ceobbNxqAHzc0gV8LcpS6dfMYfZ5RBirV68vrsEcLBIOwlOM7CUgRlTCnvtLsiFDYltpj
	 lR/q9EUSsmJ2ylBzqFbdvt/xwlIT+LCe+rQ/+ftQ6/OmpX+ittqtLiigfG3Xn8ZxtLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glm0hOPC;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27028606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 08:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27028606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glm0hOPC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793261665; x=1824797665;
  h=date:from:to:cc:subject:message-id;
  bh=sOCZjfn7vy4aHNeBEE2hMMc3yK7j5hen/IC02jW2btc=;
  b=glm0hOPCc2gyZhjGbrkCXyNQgNwEjuM0dQsfe27a/nAMNzItc9Nbab3S
   7XA68bKieoggD+hrgSOB1GzICzDa0OliS73LqNZ+Ndi2G3nC+SWgncsjY
   rv08XNN7ZEs8B9EtMeNNMWXNA2N/GktG+pv9alh5ScYFOt7MkegrhfeHw
   IWY2H8ejGtnUuwy3MwDFXrclWBiFuAhk22cPTYe54LGo6dEZiTvSlr9KR
   6fC4mPFXNQb8SJx96PzgysbYJFPX69Umgz3SMuDMchCdfuAoKfl2G3X5d
   dB6Lwtc65RcwhbrsQAB/UO7hB11Ui3jex1C8XVg/CohVzl9ytAA1LbOvS
   Q==;
X-CSE-ConnectionGUID: 6aT9RYNXQDuKSYTrCvDYYw==
X-CSE-MsgGUID: S1+fR3XLSheVkynVzwePnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1879678"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1879678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:14:24 -0700
X-CSE-ConnectionGUID: Q8ky6diTQL2QetX3+EY7QA==
X-CSE-MsgGUID: Z1U9+W7+QOeKSzH9B8tndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5406694"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2026 01:14:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMLHA-00000000Zoe-0JtG;
	Thu, 29 Oct 2026 08:14:20 +0000
Date: Thu, 29 Oct 2026 16:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 1/1]
 mm/memblock.c:2169:13: warning: variable 'memsize_reusable_size' set but not
 used
Message-ID: <202610291512.oEmOZYbF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   7aa62a531907e90da2a2bcd2aa20be3e26c4d37e
commit: e501b42d39e7c088623b7ab375252b9ce1328eda [1/1] ANDROID: memblock: support memsize reusable to consider as reusable
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261029/202610291512.oEmOZYbF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1da436a23e613c425fc9b868fc8deb979ede47a4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291512.oEmOZYbF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291512.oEmOZYbF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memblock.c:2164:13: warning: variable 'memsize_memmap' set but not used [-Wunused-but-set-global]
    2164 | static long memsize_memmap;
         |             ^
   mm/memblock.c:2165:22: warning: variable 'memsize_code' set but not used [-Wunused-but-set-global]
    2165 | static unsigned long memsize_code __initdata_memblock;
         |                      ^
   mm/memblock.c:2166:22: warning: variable 'memsize_data' set but not used [-Wunused-but-set-global]
    2166 | static unsigned long memsize_data __initdata_memblock;
         |                      ^
   mm/memblock.c:2167:22: warning: variable 'memsize_ro' set but not used [-Wunused-but-set-global]
    2167 | static unsigned long memsize_ro __initdata_memblock;
         |                      ^
   mm/memblock.c:2168:22: warning: variable 'memsize_bss' set but not used [-Wunused-but-set-global]
    2168 | static unsigned long memsize_bss __initdata_memblock;
         |                      ^
>> mm/memblock.c:2169:13: warning: variable 'memsize_reusable_size' set but not used [-Wunused-but-set-global]
    2169 | static long memsize_reusable_size;
         |             ^
   6 warnings generated.


vim +/memsize_reusable_size +2169 mm/memblock.c

  2161	
  2162	static struct memsize_rgn_struct memsize_rgn[CONFIG_MAX_MEMBLOCK_MEMSIZE] __initdata_memblock;
  2163	static int memsize_rgn_count __initdata_memblock;
  2164	static long memsize_memmap;
  2165	static unsigned long memsize_code __initdata_memblock;
  2166	static unsigned long memsize_data __initdata_memblock;
  2167	static unsigned long memsize_ro __initdata_memblock;
  2168	static unsigned long memsize_bss __initdata_memblock;
> 2169	static long memsize_reusable_size;
  2170	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
