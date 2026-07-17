Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4737E3F889E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297499; cv=none; b=hFt+5flLjSjC39WhaoNssqZJ7vu/N5MFunvtIOri+ArXsNTIBBBOwcxjGV6UzGtDxCNfJnFs9Wz7Xl48Cul1ZuK4ivW1ON2VdGh2ydG2veig+Q7pia/5feEaAUUz+wQCAWwZHav+2GjJJnQdSPyG9IeWruO/YqRO0ydxOqg+nEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297499; c=relaxed/simple;
	bh=7eO7+1HxRvc+JHdU0R42bzMRiVcsJ5isdph+BzZkAEE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Obbo0rd9ZCgLZ+sS9ZW5eIZMeUyfNyO3gbaucrOck10y71G4Rmrs8vK5UXeiwW2tbctUsuZdaDVnbpbhTT/+TfkjNM6BNPmVjo9+bOj5edwaua9KIZmOvUtzzaPYzXTxtH+1GH8rU+71U26qnoCuW34lNCsy1mm1V7SRc9xhz1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noBYrjdP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noBYrjdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784297498; x=1815833498;
  h=date:from:to:cc:subject:message-id;
  bh=7eO7+1HxRvc+JHdU0R42bzMRiVcsJ5isdph+BzZkAEE=;
  b=noBYrjdP9Mh0/i/4fX05pPAJruqsOAvpt3pJpCzKs4G1OhVAh2YUQC1Z
   vHn8eSLr2JJUwcgXzHhdcXRcAIR1HM0KWRWZ9JXLIdrwdMZ0NO9cndzUj
   mYZbNvV+q/ra3YLtbGNKcda2WSspZX6khS30ZnmGvXjAS6fkT2HRZFUx4
   zNI6NPDNhhBmnFyCzJcf08cLiolC6Kq9Uj0EZFSMmO9cbr3YrL2wVesTJ
   DNZIE6atfrUhBxaF/szlfuTvohvljMhzM3Ygwii4X3FBv/kdY/wv1svJU
   L0Y8nUtlWW6tk1URiXrPg3+9nj3EHjtf/LQOcNXXe8/kfQhTaU9VxXb3r
   Q==;
X-CSE-ConnectionGUID: BIUAqkK7TEW51/tZrZqLKA==
X-CSE-MsgGUID: BzWeLZK8Q62kbFAVHczqgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84995343"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84995343"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:11:37 -0700
X-CSE-ConnectionGUID: oLkufuHQSO6VyBcTtlXOrg==
X-CSE-MsgGUID: bV3Htt8kTGypbs9ZjKJ/cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="255030435"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 07:11:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkjHn-00000000Sno-48eA;
	Fri, 17 Jul 2026 14:11:32 +0000
Date: Fri, 17 Jul 2026 22:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 8/8]
 lib/test_ubsan.c:43:4: warning: variable 'data' set but not used
Message-ID: <202607172142.46bQ8Fn9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   407989faed8855296b26bfb40a621f478331816c
commit: aa0cf04b6959adbb54b536307d590d2a350d02d7 [8/8] ubsan: Fix panic from test_ubsan_out_of_bounds
config: arm-randconfig-001-20260716 (https://download.01.org/0day-ci/archive/20260717/202607172142.46bQ8Fn9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172142.46bQ8Fn9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172142.46bQ8Fn9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_ubsan.c: In function 'test_ubsan_out_of_bounds':
>> lib/test_ubsan.c:43:4: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     } data;
       ^~~~
   lib/test_ubsan.c: In function 'test_ubsan_load_invalid_value':
   lib/test_ubsan.c:66:37: warning: variable 'eptr' set but not used [-Wunused-but-set-variable]
     enum ubsan_test_enum eval, eval2, *eptr;
                                        ^~~~
   lib/test_ubsan.c:65:19: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
     bool val, val2, *ptr;
                      ^~~
   At top level:
   lib/test_ubsan.c:104:28: warning: 'skip_ubsan_array' defined but not used [-Wunused-const-variable=]
    static const test_ubsan_fp skip_ubsan_array[] = {
                               ^~~~~~~~~~~~~~~~


vim +/data +43 lib/test_ubsan.c

    35	
    36	static void test_ubsan_out_of_bounds(void)
    37	{
    38		int i = 4, j = 4, k = -1;
    39		volatile struct {
    40			char above[4]; /* Protect surrounding memory. */
    41			int arr[4];
    42			char below[4]; /* Protect surrounding memory. */
  > 43		} data;
    44	
    45		OPTIMIZER_HIDE_VAR(i);
    46		OPTIMIZER_HIDE_VAR(j);
    47		OPTIMIZER_HIDE_VAR(k);
    48	
    49		UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "above");
    50		data.arr[j] = i;
    51	
    52		UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "below");
    53		data.arr[k] = i;
    54	}
    55	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
