Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FB26296
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 22:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743201817; cv=none; b=GDiVEN7sUOJD8b3ss24Y3Rer2Q2DsjYEuWgK+3stYC28/IA8G4G0RNyjdTzVgdgWlNmUJCzMraSx3sp1/0NEjGyg1ENVbx+UClFGoLALZyPh6x9Ci7J4L0j5gixakqIKT/FRVB3wyF62u8oOQdQG9cE39qNwUj+kkjKXeaRzeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743201817; c=relaxed/simple;
	bh=siywQ2sBu1FtNIAb8RjQKyXSWmxtgCMYLb/dPntUg40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mr639KBSjBY4KTCX9Rpfa3hdLJpmPTBj1GVbx5VuhoabdtDtvMYVe4Ym8dsVg7AKL4jUTBacX7d15cMeGF5Gl8YHNyPQSENKeIMqbMQGBEmTovsr06r5vXm7N093kG7qyniVwH7EQo25a4FvkeqHTbUVn3G5Y/kzMGEQWThFJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOseB3AU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOseB3AU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743201815; x=1774737815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=siywQ2sBu1FtNIAb8RjQKyXSWmxtgCMYLb/dPntUg40=;
  b=IOseB3AUee8GeElwJlopZXQ5/6JaBNWdjpeA+sgcnj9AofTXRB8PDTiC
   G1X6qWKCMHQ3LVMzogWp2WsBLASGsGn4LAxQJcWDAl6o6rms/52TpSE49
   vmNGW5q9FSw2l96vUObR9WJJDrYBYU92dLVXtrXvf+vSr7Vp/1C1dyJ04
   ntI+uSw7XtMzxxVEG0uveiQqpZBMGbU2Vo634uFhqUMik4K187yQzrLAE
   rJa6xThJAjJUIb3LicsKrEf8w09hXM+xy3nH5kpQWSu8Qk9hoPc4fwnIO
   C7AGTweWAoz3tZvZKLNpNG54RvD+RZhQ7ovyVXu2P4dhSM+5LmhTZkGjJ
   Q==;
X-CSE-ConnectionGUID: czt+VWhYSqWB3b7SkzmFkA==
X-CSE-MsgGUID: afBHUoFRScqnmbxrGZjgBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55952100"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="55952100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 15:43:34 -0700
X-CSE-ConnectionGUID: KEHaZQaUSveOXOXftu8xFA==
X-CSE-MsgGUID: TmHjsA7OQbC3fbwaY+jmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="129696246"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2025 15:43:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyIQF-0007kc-2e;
	Fri, 28 Mar 2025 22:43:31 +0000
Date: Sat, 29 Mar 2025 06:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 221/222] fs/bcachefs/sysfs.c:1001: error:
 unterminated argument list invoking macro "prt_printf"
Message-ID: <202503290609.5mK6AkIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   3720faca3701df3bb8f5cd2a12061664d01ce817
commit: cd655e59f1431415e0170664506952e595bddcde [221/222] bcachefs: read_fua_test
config: riscv-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290609.5mK6AkIO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290609.5mK6AkIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290609.5mK6AkIO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/sysfs.c: In function 'bch2_read_fua_test':
>> fs/bcachefs/sysfs.c:1001: error: unterminated argument list invoking macro "prt_printf"
    1001 | #endif  /* _BCACHEFS_SYSFS_H_ */
   fs/bcachefs/sysfs.c:400:9: error: 'prt_printf' undeclared (first use in this function); did you mean 'bstr_printf'?
     400 |         prt_printf(out, "fua support advertized: %s\n", str_yes_no(bdev_fua(bdev));
         |         ^~~~~~~~~~
         |         bstr_printf
   fs/bcachefs/sysfs.c:400:9: note: each undeclared identifier is reported only once for each function it appears in
   fs/bcachefs/sysfs.c:400:19: error: expected ';' at end of input
     400 |         prt_printf(out, "fua support advertized: %s\n", str_yes_no(bdev_fua(bdev));
         |                   ^
         |                   ;
   ......
   fs/bcachefs/sysfs.c:400:9: error: expected declaration or statement at end of input
     400 |         prt_printf(out, "fua support advertized: %s\n", str_yes_no(bdev_fua(bdev));
         |         ^~~~~~~~~~
   fs/bcachefs/sysfs.c:393:13: warning: unused variable 'stddev_rand' [-Wunused-variable]
     393 |         u64 stddev_rand         = mean_and_variance_get_stddev(stats_random.duration_stats);
         |             ^~~~~~~~~~~
   fs/bcachefs/sysfs.c:392:13: warning: unused variable 'stddev_fua' [-Wunused-variable]
     392 |         u64 stddev_fua          = mean_and_variance_get_stddev(stats_fua.duration_stats);
         |             ^~~~~~~~~~
   fs/bcachefs/sysfs.c:391:13: warning: unused variable 'stddev_nofua' [-Wunused-variable]
     391 |         u64 stddev_nofua        = mean_and_variance_get_stddev(stats_nofua.duration_stats);
         |             ^~~~~~~~~~~~
   fs/bcachefs/sysfs.c:389:13: warning: unused variable 'ns_rand' [-Wunused-variable]
     389 |         u64 ns_rand             = mean_and_variance_get_mean(stats_random.duration_stats);
         |             ^~~~~~~
   fs/bcachefs/sysfs.c:388:13: warning: unused variable 'ns_fua' [-Wunused-variable]
     388 |         u64 ns_fua              = mean_and_variance_get_mean(stats_fua.duration_stats);
         |             ^~~~~~
   fs/bcachefs/sysfs.c:387:13: warning: unused variable 'ns_nofua' [-Wunused-variable]
     387 |         u64 ns_nofua            = mean_and_variance_get_mean(stats_nofua.duration_stats);
         |             ^~~~~~~~
   fs/bcachefs/sysfs.c:384:25: error: label 'err' used but not defined
     384 |                         goto err;
         |                         ^~~~
   fs/bcachefs/sysfs.c: At top level:
   fs/bcachefs/sysfs.c:314:12: warning: 'bch2_read_fua_test' defined but not used [-Wunused-function]
     314 | static int bch2_read_fua_test(struct printbuf *out, struct bch_dev *ca)
         |            ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:300:13: warning: 'bch2_fs_usage_base_to_text' defined but not used [-Wunused-function]
     300 | static void bch2_fs_usage_base_to_text(struct printbuf *out, struct bch_fs *c)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:292:13: warning: 'bch2_gc_gens_pos_to_text' defined but not used [-Wunused-function]
     292 | static void bch2_gc_gens_pos_to_text(struct printbuf *out, struct bch_fs *c)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:251:12: warning: 'bch2_compression_stats_to_text' defined but not used [-Wunused-function]
     251 | static int bch2_compression_stats_to_text(struct printbuf *out, struct bch_fs *c)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:234:15: warning: 'bch2_btree_cache_size' defined but not used [-Wunused-function]
     234 | static size_t bch2_btree_cache_size(struct bch_fs *c)
         |               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:229:33: warning: 'sysfs_time_stat_nocow_lock_contended' defined but not used [-Wunused-variable]
     229 |         static struct attribute sysfs_time_stat_##_name =               \
         |                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:466:9: note: in expansion of macro 'x'
     466 |         x(nocow_lock_contended)
         |         ^
   fs/bcachefs/sysfs.c:231:9: note: in expansion of macro 'BCH_TIME_STATS'
     231 |         BCH_TIME_STATS()
         |         ^~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:229:33: warning: 'sysfs_time_stat_blocked_write_buffer_full' defined but not used [-Wunused-variable]
     229 |         static struct attribute sysfs_time_stat_##_name =               \
         |                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:465:9: note: in expansion of macro 'x'
     465 |         x(blocked_write_buffer_full)            \
         |         ^
   fs/bcachefs/sysfs.c:231:9: note: in expansion of macro 'BCH_TIME_STATS'
     231 |         BCH_TIME_STATS()
         |         ^~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:229:33: warning: 'sysfs_time_stat_blocked_allocate_open_bucket' defined but not used [-Wunused-variable]
     229 |         static struct attribute sysfs_time_stat_##_name =               \
         |                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:464:9: note: in expansion of macro 'x'
     464 |         x(blocked_allocate_open_bucket)         \
         |         ^
   fs/bcachefs/sysfs.c:231:9: note: in expansion of macro 'BCH_TIME_STATS'
     231 |         BCH_TIME_STATS()
         |         ^~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:229:33: warning: 'sysfs_time_stat_blocked_allocate' defined but not used [-Wunused-variable]
     229 |         static struct attribute sysfs_time_stat_##_name =               \
         |                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:463:9: note: in expansion of macro 'x'
     463 |         x(blocked_allocate)                     \
         |         ^
   fs/bcachefs/sysfs.c:231:9: note: in expansion of macro 'BCH_TIME_STATS'
     231 |         BCH_TIME_STATS()
         |         ^~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:229:33: warning: 'sysfs_time_stat_blocked_key_cache_flush' defined but not used [-Wunused-variable]
     229 |         static struct attribute sysfs_time_stat_##_name =               \
         |                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:462:9: note: in expansion of macro 'x'
     462 |         x(blocked_key_cache_flush)              \
         |         ^
   fs/bcachefs/sysfs.c:231:9: note: in expansion of macro 'BCH_TIME_STATS'
     231 |         BCH_TIME_STATS()
         |         ^~~~~~~~~~~~~~
   fs/bcachefs/sysfs.c:229:33: warning: 'sysfs_time_stat_blocked_journal_max_open' defined but not used [-Wunused-variable]
     229 |         static struct attribute sysfs_time_stat_##_name =               \
         |                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:461:9: note: in expansion of macro 'x'


vim +/prt_printf +1001 fs/bcachefs/sysfs.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1000  
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @1001  #endif  /* _BCACHEFS_SYSFS_H_ */

:::::: The code at line 1001 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
