Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD94243369
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739055737; cv=none; b=gQPNALFU5ffn5wINdzD/Hj5jtcwlnKeAP+vcgVEnKBeQIGvcr1GhH+mze8AF5+xPfEEA+9YJnWIktZiNn+vlLD/B5MvjHvBWBQkbVeV81b/rgx7KDnAcafSiNNSmUjgOTaXe3usLbiagGZ6F1Vzmfl+bvJ3U11g1w8ulMhT+JOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739055737; c=relaxed/simple;
	bh=8sEICPXBWBy5wefnaS5gBvyiAuh26jpc90+VZbCc8CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYHMUnamM2SZsRiw9fj5ONuq5kilBZVwU1BDzg1mI8mZ4XEB2xsj0qY2yWVg87aEnoMBR5FFBjCQkZfxo9y1XE1VamAt2UQZGZRmlVsFsY1R+UQokpjDpoD7U9+1vP1d68QedoBw+k6f/s2P4a5MkJNWLs/9i2XG/CMSvRxCuhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCU2Sk2b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCU2Sk2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739055736; x=1770591736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8sEICPXBWBy5wefnaS5gBvyiAuh26jpc90+VZbCc8CE=;
  b=nCU2Sk2b3jhmtpoCiNIOF60eRKvctKRVZJP/9KjmN+minozDPGc2flJ+
   MN/Qa7np4mG0Bsu0L/LoRihdGsxtvQiLkou9lhvFMn3GLk95xEC5p/p4h
   7L7pTLBVWLYVnp6hwCGXWMkkZyxeCTzY51CiPcQy+G4NZ5W9/xlNKCjtY
   nPFSXRtAfMUM5e5mcxZokaFbrz4kuMTyvwWRbxavB8ir1MGHW5RwRY8PY
   /TcyXiY39X9UwDjFC/x2T1zs+8C7+hptf9hw/cFrszFE1osJK5rBKLw0u
   t7W/7+Xnp8RpTaRTtbgRxgrOhTJV2wD06EILDB+u4kgz90srekN6xayt6
   w==;
X-CSE-ConnectionGUID: 5qlU8i8ARsijj216kLMmQA==
X-CSE-MsgGUID: yPsJG6VkRgmE5Ulz01sQXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="57087402"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="57087402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 15:02:16 -0800
X-CSE-ConnectionGUID: 3qr1XSd+TamPTjZ/p+LTHQ==
X-CSE-MsgGUID: q6F031OyTj+/cil+eTi41g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149040857"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Feb 2025 15:02:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgtq0-0010kl-1F;
	Sat, 08 Feb 2025 23:02:12 +0000
Date: Sun, 9 Feb 2025 07:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:time_stats_sched 63/63] csky-linux-ld:
 time_stats.c:undefined reference to `mean_and_variance_weighted_update'
Message-ID: <202502090655.4OnTu1Jl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs time_stats_sched
head:   d9b1e57f3b38d16fdd7177f3b9636dcbb4c749ed
commit: d9b1e57f3b38d16fdd7177f3b9636dcbb4c749ed [63/63] sched_wakeup_backtrace debugfs
config: csky-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090655.4OnTu1Jl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090655.4OnTu1Jl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090655.4OnTu1Jl-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/sched/core.o: in function `try_to_wake_up':
   core.c:(.text+0x15c6): undefined reference to `__generic_xchg_called_with_bad_pointer'
   csky-linux-ld: core.c:(.text+0x16b8): undefined reference to `__generic_xchg_called_with_bad_pointer'
   csky-linux-ld: kernel/sched/timestats_bt.o: in function `sched_wakeups_open':
   timestats_bt.c:(.text+0xfc): undefined reference to `debugfs_sched'
   csky-linux-ld: lib/time_stats.o: in function `__time_stats_clear_buffer':
   time_stats.c:(.text+0x2fe): undefined reference to `mean_and_variance_weighted_update'
>> csky-linux-ld: time_stats.c:(.text+0x39c): undefined reference to `mean_and_variance_weighted_update'
   csky-linux-ld: time_stats.c:(.text+0x6aa): undefined reference to `mean_and_variance_weighted_update'
   csky-linux-ld: lib/time_stats.o: in function `time_stats_clear_buffer':
   time_stats.c:(.text+0x764): undefined reference to `mean_and_variance_weighted_update'
   csky-linux-ld: lib/time_stats.o: in function `time_stats_update_one':
   time_stats.c:(.text+0x91e): undefined reference to `mean_and_variance_weighted_update'
   csky-linux-ld: lib/time_stats.o:time_stats.c:(.text+0x9a8): more undefined references to `mean_and_variance_weighted_update' follow
   csky-linux-ld: lib/time_stats.o: in function `__time_stats_update':
>> time_stats.c:(.text+0xd0a): undefined reference to `mean_and_variance_weighted_get_mean'
>> csky-linux-ld: time_stats.c:(.text+0xd70): undefined reference to `mean_and_variance_weighted_get_mean'
   csky-linux-ld: lib/time_stats.o: in function `time_stats_to_json':
   time_stats.c:(.text+0xe58): undefined reference to `mean_and_variance_weighted_get_mean'
>> csky-linux-ld: time_stats.c:(.text+0xe74): undefined reference to `mean_and_variance_weighted_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0xefc): undefined reference to `mean_and_variance_weighted_get_mean'
   csky-linux-ld: time_stats.c:(.text+0xf18): undefined reference to `mean_and_variance_weighted_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0xf98): undefined reference to `mean_and_variance_weighted_get_mean'
   csky-linux-ld: time_stats.c:(.text+0xf9c): undefined reference to `mean_and_variance_weighted_get_stddev'
>> csky-linux-ld: time_stats.c:(.text+0x10ae): undefined reference to `mean_and_variance_get_mean'
>> csky-linux-ld: time_stats.c:(.text+0x10d8): undefined reference to `mean_and_variance_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0x10fa): undefined reference to `mean_and_variance_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x111a): undefined reference to `mean_and_variance_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0x1148): undefined reference to `mean_and_variance_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x114c): undefined reference to `mean_and_variance_get_stddev'
   csky-linux-ld: lib/time_stats.o: in function `time_stats_to_seq_buf':
   time_stats.c:(.text+0x128c): undefined reference to `mean_and_variance_weighted_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x12ca): undefined reference to `mean_and_variance_weighted_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0x134a): undefined reference to `mean_and_variance_weighted_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x1386): undefined reference to `mean_and_variance_weighted_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0x13e8): undefined reference to `mean_and_variance_weighted_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x13f0): undefined reference to `mean_and_variance_weighted_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0x1590): undefined reference to `mean_and_variance_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x15c0): undefined reference to `mean_and_variance_get_stddev'
   csky-linux-ld: time_stats.c:(.text+0x15ee): undefined reference to `mean_and_variance_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x161e): undefined reference to `mean_and_variance_get_stddev'
   csky-linux-ld: lib/time_stats.o: in function `time_stats_reset':
>> time_stats.c:(.text+0x1678): undefined reference to `mean_and_variance_get_mean'
   csky-linux-ld: time_stats.c:(.text+0x167c): undefined reference to `mean_and_variance_get_stddev'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
