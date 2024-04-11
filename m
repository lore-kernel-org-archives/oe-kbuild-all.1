Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C2145345
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828904; cv=none; b=kW3aLSYysNXvWtUsklFpneCkVUCx3Vi7B8YScP8ogaQ2S4yhN4eODoTjWeApIzh4AV85I8YWgLExLow9649AMzqEDx0UPzz7f6ARFVI8AiUxc5+JHvaNMvH0f4/ZMML6LyC4MJuN/imw8dve97vP/VTD0SAfUrB2ch3lRMzv0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828904; c=relaxed/simple;
	bh=6X2w158Z+OLozX7jLzey4rKeDAn4nIvqp/AeiompXZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1kilk8a906nWCre1EXfzoyfzkne3WsLZEkrbbDXPpIgNE4OqXH5V3ek/LTcwkwvamp1t3EKk4qyv0USEZAxF1K6e+oOZ8hm4ShDcdfS73hZbpFar9a5kMV2Pu5Z1zqZsMc81FRl6z1X68QO1AaBIDECATDaTR1/nWnbJvvTqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M47OSBGr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M47OSBGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712828902; x=1744364902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6X2w158Z+OLozX7jLzey4rKeDAn4nIvqp/AeiompXZc=;
  b=M47OSBGrnBd0bGiDHY/PGltTNNBGtGQQO1rvSxxZFVsXpA8uiIOtimCc
   f7fpCzMGfgc4Qt4a3L5HRY4MkU9N8r0mAnMQIymGJh5DG8PLb1HAde0xF
   0kHf/iwftgNIM6o5lrx6L+ANxnekWzn3aEX7LJeRkjyDLsEHRLMTeltcV
   fOOIfWzMuTHa8N0MFCVoCGzLbJ2PqcdVvW7kMEuqqBCF1SkRdSdkwffVw
   labsUHqNxAU3Nory01xb1cQ4gX9AY6BQr3MwikaiXgTKEsz6BJKy7HXDB
   38R1ZIfuDbD75hYF5kZQlA7ReBQlGAKI2AnoflzhHMQIpR4QPD00DVzf9
   w==;
X-CSE-ConnectionGUID: j9nzrHWZRB+3RMC4eSDwIw==
X-CSE-MsgGUID: s73h9YRtRW6vtHn1C8+4aQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8087755"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8087755"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:48:20 -0700
X-CSE-ConnectionGUID: /z6lBPnoQ4qfWPRuCi8PwQ==
X-CSE-MsgGUID: SZId6Il/TzKqkvF5JH2OiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20901604"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2024 02:48:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rur2W-0008Tl-0X;
	Thu, 11 Apr 2024 09:48:16 +0000
Date: Thu, 11 Apr 2024 17:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhua Han <hanchuanhua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Barry Song <v-songbaohua@oppo.com>
Subject: [akpm-mm:mm-unstable 360/372] do_mounts.c:(.text+0xc): multiple
 definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined
 here
Message-ID: <202404111752.Kgu9bb5I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: introduce swap_free_nr() for batched swap_free()
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111752.Kgu9bb5I-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111752.Kgu9bb5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111752.Kgu9bb5I-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: init/do_mounts.o: in function `swap_free_nr':
>> do_mounts.c:(.text+0xc): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: arch/sh/mm/init.o: in function `swap_free_nr':
   init.c:(.text+0x0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/fork.o: in function `swap_free_nr':
   fork.c:(.text+0x8d0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/cpu.o: in function `swap_free_nr':
   cpu.c:(.text+0x4c0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/sysctl.o: in function `swap_free_nr':
   sysctl.c:(.text+0x16e4): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/sys.o: in function `swap_free_nr':
   sys.c:(.text+0x1134): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/umh.o: in function `swap_free_nr':
   umh.c:(.text+0x6e0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/reboot.o: in function `swap_free_nr':
   reboot.c:(.text+0x7bc): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/sched/core.o: in function `swap_free_nr':
   core.c:(.text+0x528): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/sched/build_policy.o: in function `swap_free_nr':
   build_policy.c:(.text+0x2498): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: kernel/time/timer.o: in function `swap_free_nr':
   timer.c:(.text+0xed4): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/filemap.o: in function `swap_free_nr':
   filemap.c:(.text+0x22f0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/oom_kill.o: in function `swap_free_nr':
   oom_kill.c:(.text+0x650): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/fadvise.o: in function `swap_free_nr':
   fadvise.c:(.text+0x250): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/maccess.o: in function `swap_free_nr':
   maccess.c:(.text+0xb0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/page-writeback.o: in function `swap_free_nr':
   page-writeback.c:(.text+0x1948): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/folio-compat.o: in function `swap_free_nr':
   folio-compat.c:(.text+0x1b0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/readahead.o: in function `swap_free_nr':
   readahead.c:(.text+0x890): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/swap.o: in function `swap_free_nr':
   swap.c:(.text+0x1708): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/truncate.o: in function `swap_free_nr':
   truncate.c:(.text+0x660): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/vmscan.o: in function `swap_free_nr':
   vmscan.c:(.text+0x1d2c): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/shrinker.o: in function `swap_free_nr':
   shrinker.c:(.text+0x3e8): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/shmem.o: in function `swap_free_nr':
   shmem.c:(.text+0x1dc): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/util.o: in function `swap_free_nr':
   util.c:(.text+0x8c0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/vmstat.o: in function `swap_free_nr':
   vmstat.c:(.text+0x874): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/backing-dev.o: in function `swap_free_nr':
   backing-dev.c:(.text+0x648): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/mm_init.o: in function `swap_free_nr':
   mm_init.c:(.text+0x0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/slab_common.o: in function `swap_free_nr':
   slab_common.c:(.text+0x844): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/compaction.o: in function `swap_free_nr':
   compaction.c:(.text+0x0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/show_mem.o: in function `swap_free_nr':
   show_mem.c:(.text+0xc0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/shmem_quota.o: in function `swap_free_nr':
   shmem_quota.c:(.text+0x0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/list_lru.o: in function `swap_free_nr':
   list_lru.c:(.text+0x25c): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/workingset.o: in function `swap_free_nr':
   workingset.c:(.text+0x2e4): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/debug.o: in function `swap_free_nr':
   debug.c:(.text+0x2d4): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/gup.o: in function `swap_free_nr':
   gup.c:(.text+0xc48): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/nommu.o: in function `swap_free_nr':
   nommu.c:(.text+0xc64): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/page_alloc.o: in function `swap_free_nr':
   page_alloc.c:(.text+0x128c): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/memblock.o: in function `swap_free_nr':
   memblock.c:(.text+0x40): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/slub.o: in function `swap_free_nr':
   slub.c:(.text+0x1824): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: mm/sparse.o: in function `swap_free_nr':
   sparse.c:(.text+0x0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/file_table.o: in function `swap_free_nr':
   file_table.c:(.text+0x6a0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/exec.o: in function `swap_free_nr':
   exec.c:(.text+0x1610): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/inode.o: in function `swap_free_nr':
   inode.c:(.text+0x2634): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/namespace.o: in function `swap_free_nr':
   namespace.c:(.text+0x33ec): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/splice.o: in function `swap_free_nr':
   splice.c:(.text+0x1b88): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/coredump.o: in function `swap_free_nr':
   coredump.c:(.text+0xf14): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/drop_caches.o: in function `swap_free_nr':
   drop_caches.c:(.text+0xb0): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/iomap/buffered-io.o: in function `swap_free_nr':
   buffered-io.c:(.text+0x3fdc): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/proc/nommu.o: in function `swap_free_nr':
   nommu.c:(.text+0x1bc): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/proc/base.o: in function `swap_free_nr':
   base.c:(.text+0x262c): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here
   sh4-linux-ld: fs/proc/array.o: in function `swap_free_nr':
   array.c:(.text+0x6b4): multiple definition of `swap_free_nr'; init/main.o:main.c:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
