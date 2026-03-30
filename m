Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FA840DFCB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 06:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774850503; cv=none; b=DJ0ordpslN4RduB8HTPvYFq/LRbFOvrCzuiJSU0yoW/2yyYBpmFLOYMji7q6p33DoSbQN9nZVRjP5BkFJDWQdfmnMc0dDtvgy2+qvcGXgI1vrImI7RB42jtZy1qx/9tiOLT1CDOd6AdWzyrCsAxnrrtGw1MWmQBnydUqC7/f1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774850503; c=relaxed/simple;
	bh=e1S+ePyCPJcYjhqPne5R8PCroVc1f0HIRtRWSSOs7pk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iPOCmT3YqfDRy9Ra6RQ9RSW/PsuyGQkHByQw+ett3Up1iMwdFX8wrh11jWNy8AyGsKgFQGOVCTJvZaqQjqqG0al7+EEoI88oyT/R3gklyjxMPt+VyZCZTgPKRTRF+t6efXPP/lXGvU/5Nhdv0YPUtKlc/UYHVfdyJAtNXfQMefQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vs8/XZ/S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs8/XZ/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774850501; x=1806386501;
  h=date:from:to:cc:subject:message-id;
  bh=e1S+ePyCPJcYjhqPne5R8PCroVc1f0HIRtRWSSOs7pk=;
  b=Vs8/XZ/SENzXlkMR7RbbGehfmAE/cbMYqrtQhXQP+nu3oYxSc5wQ/VDj
   DcMW32OduyqHmBueKOvhSQ0eLAQn72yAW8hhs2HDOyWq0rYmAd3J1h+rd
   j1Z6WWPKX/0nw2M2fItBhnnC/PBT2MC/pKsXhP5QcpxLf5cuyBNxJEK04
   NJ70OdVcNEkNS7udztb0e8cKJ5xX5d9mSZQILJq/A0k/AgTEk4fxFMyHf
   QM8pfi1oI/b/ivGLgpChUE44iYT/LhiJNEnL8FlLkjvuppUz0a/ImEnY5
   veV14oihGe/C//SxfGQfG0w9+6ESuZ+OZZf1SMhKNZhN5Lajyez8+0B2j
   A==;
X-CSE-ConnectionGUID: w4J8+wjRSb6aCPWiAuVY3Q==
X-CSE-MsgGUID: Rv2PVxo0TDaG1uIOWdX4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63387018"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="63387018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 23:01:33 -0700
X-CSE-ConnectionGUID: jd2i0DzpR42B7mQxjnQIZg==
X-CSE-MsgGUID: 4kBRmxVyRJyIYyygOW1EbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="256466319"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Mar 2026 23:01:30 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w75gl-000000000k7-3NjK;
	Mon, 30 Mar 2026 06:01:27 +0000
Date: Mon, 30 Mar 2026 14:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 mm/memblock.c:2087:13: warning: variable 'memsize_reusable_size' set but not
 used
Message-ID: <202603301319.A7CvfkkX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 99b134ba86250b40a7d8781a43cd62301556ce56 [4/4] ANDROID: memblock: support memsize reusable to consider as reusable
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603301319.A7CvfkkX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301319.A7CvfkkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301319.A7CvfkkX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memblock.c:2082:13: warning: variable 'memsize_memmap' set but not used [-Wunused-but-set-global]
    2082 | static long memsize_memmap;
         |             ^
   mm/memblock.c:2083:22: warning: variable 'memsize_code' set but not used [-Wunused-but-set-global]
    2083 | static unsigned long memsize_code __initdata_memblock;
         |                      ^
   mm/memblock.c:2084:22: warning: variable 'memsize_data' set but not used [-Wunused-but-set-global]
    2084 | static unsigned long memsize_data __initdata_memblock;
         |                      ^
   mm/memblock.c:2085:22: warning: variable 'memsize_ro' set but not used [-Wunused-but-set-global]
    2085 | static unsigned long memsize_ro __initdata_memblock;
         |                      ^
   mm/memblock.c:2086:22: warning: variable 'memsize_bss' set but not used [-Wunused-but-set-global]
    2086 | static unsigned long memsize_bss __initdata_memblock;
         |                      ^
>> mm/memblock.c:2087:13: warning: variable 'memsize_reusable_size' set but not used [-Wunused-but-set-global]
    2087 | static long memsize_reusable_size;
         |             ^
   6 warnings generated.


vim +/memsize_reusable_size +2087 mm/memblock.c

  2079	
  2080	static struct memsize_rgn_struct memsize_rgn[CONFIG_MAX_MEMBLOCK_MEMSIZE] __initdata_memblock;
  2081	static int memsize_rgn_count __initdata_memblock;
  2082	static long memsize_memmap;
  2083	static unsigned long memsize_code __initdata_memblock;
> 2084	static unsigned long memsize_data __initdata_memblock;
  2085	static unsigned long memsize_ro __initdata_memblock;
  2086	static unsigned long memsize_bss __initdata_memblock;
> 2087	static long memsize_reusable_size;
  2088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
