Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A711DE3DB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754831624; cv=none; b=cMp5AJRLePdBIudiVJFuzur9xv4EEXqsOBE+iaOJ2wWrQUHgLX+4Rv8tAiDaR2/047yr6cEgD8mVy/nWenb2YovnIqGWEXH9tJfIeE90glOEqdOOzdulrg3wgC/W2m1PDLbF4k4LR3KVwV8BQJVbjhknQZ1vZFi7FAeltPk7b4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754831624; c=relaxed/simple;
	bh=x+vFdlBDDH5uf0JPv+STb0SYGHIIDMFNYKbuX4PgVBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m938BWyZR9PiD7Bw1zP8VV8lc/icq5Nm/kY+9r1T2ny9FIVw9D9qOvtW3ozmiAJmInSIJJ3k5YGi2THPCLf1oWbH5m6uMCLAFUdXUjpftgKeifBz0sKEUJbnR+mXo/YwGYzVj/E16YDakt45QJAKMfrqdD/p4rehD/U6uOudyzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL4QKRl0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL4QKRl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754831623; x=1786367623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+vFdlBDDH5uf0JPv+STb0SYGHIIDMFNYKbuX4PgVBQ=;
  b=DL4QKRl0WB79UddIBj3vlfGSuNTCydKPuJoWfSYV2NKo3Z8kA2hYpdmH
   L2swGNsBvClnJxal94bhmJwNIEI/V/oax7HByYYxhGWjEBPM7oVrVxI+m
   HtLsIxQ+ym6tyHvsttme7FFeWLj7Zq9y2ezH4a/tykOdB46GaUvBc5Rmv
   k80ketnhzZOkkW8eGaAatlLq1/pMcmQbv1StBQFg8kPFopifykerarwk1
   DXLKTWxNFzwes8ZsWOH4zUNUbwPQagEaCojRQHKQpq4MsUgfADRCG2q28
   BcDNmsrT7z+c/fANWGKw8wFVDJ/NanlXJFZAQnubvThjFlA4zUiglc5Hi
   g==;
X-CSE-ConnectionGUID: mwnaAAYSSSi2fHxtWWy2gA==
X-CSE-MsgGUID: ZldYQNthT8Gsk9RzD2Kikg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="60949269"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60949269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 06:13:41 -0700
X-CSE-ConnectionGUID: DMH3Zz+tT7CpGM/FefGTbw==
X-CSE-MsgGUID: /ri3eAULTiyf2nR43pSkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169807039"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 10 Aug 2025 06:13:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ul5rl-0005Hs-11;
	Sun, 10 Aug 2025 13:13:37 +0000
Date: Sun, 10 Aug 2025 21:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 3/3]
 block/blk-sysfs.c:277:31: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202508102157.y0jahYV9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   33bc1b6a0df0f487dccdf2e2f27e0e4fa39825d1
commit: 110234da18ab482f6f583d28eff26b9569bf5622 [3/3] block: enable passthrough command statistics
config: i386-randconfig-r111-20250810 (https://download.01.org/0day-ci/archive/20250810/202508102157.y0jahYV9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508102157.y0jahYV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508102157.y0jahYV9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-sysfs.c:277:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long var @@     got restricted blk_flags_t @@
   block/blk-sysfs.c:277:31: sparse:     expected unsigned long var
   block/blk-sysfs.c:277:31: sparse:     got restricted blk_flags_t

vim +277 block/blk-sysfs.c

   274	
   275	static ssize_t queue_iostats_passthrough_show(struct gendisk *disk, char *page)
   276	{
 > 277		return queue_var_show(blk_queue_passthrough_stat(disk->queue), page);
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
