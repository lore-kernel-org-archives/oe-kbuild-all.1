Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBA3398E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730268720; cv=none; b=WLriEAdQRLB5QWJfP6Xlorg+WMDanshqZ6CDLfY3A0wYLhPMO8K/Sf8TSCpLeWU5E7/x0eAAaG91qZ+tMMCaosvkHiIEtn3asoOAjdSRpuvPjfmm5e42WGFjXSRD4bOALvgk0NBnRtFn5LMANPAoZwJYznYQICRL13ltSYoyvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730268720; c=relaxed/simple;
	bh=fcnvCn/0mgg8oouX3ga1E97lKMjVpxwI5NhacbVaXu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdPVx4CFCX0IV/Hs7yA/kx8s0JCPLk5N1OCC4N1/GT1bAcYItu/GbGORXolzNZsG/iunraqUhInfMHDf4iPdJIg4VVH7ym6TbbZeKC7sXiNrfctzXZQu1TUzaUj+305/52HFn92KHY8I4zZZnpC/7bqmRrkNXF+ysBjWJ615nN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwfwCDmc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwfwCDmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730268717; x=1761804717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcnvCn/0mgg8oouX3ga1E97lKMjVpxwI5NhacbVaXu4=;
  b=dwfwCDmc61YtpmMAQ307Jsctz9WRsPbPOCRjPaN0e6LkGfKKTwluznZZ
   WY3T3FNoLMkf9zIAcGFQHyVSNYq+nxOz8yz4a9xCPywwQ5CtYwP78TW9z
   vqXDfk0cjJp32jii8NUxmzeFMFOSjlUhQ5qFpQmTr4bdy0zpahFqn++Zk
   mDUQNx7XKezpLT/gdJ7K9ChIeY/j89G67cUpfOKtCk+DqRNL02D/zgHN1
   JorAztg83a4RXN3ZTjTZSCMwJTyqIsOGUHFJo/1Zxjxvtpk5GL12a0xfc
   CBfMu2/bh1fWHXEf54ognnOT96+J9+YGWRoatVlq/PKbSO3ldM6BA6ZAj
   Q==;
X-CSE-ConnectionGUID: siLz77k8R3uy+J+tRlLRiA==
X-CSE-MsgGUID: mIZtnql9TEKlw+7NECAN7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30064253"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="30064253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 23:11:56 -0700
X-CSE-ConnectionGUID: tmcP4tNYRauqx8iK6rNYzA==
X-CSE-MsgGUID: j9EbzNdZTpOUFdsS/3Ciiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="81842441"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2024 23:11:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t61vt-000eZg-2i;
	Wed, 30 Oct 2024 06:11:53 +0000
Date: Wed, 30 Oct 2024 14:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 256/271]
 drivers/md/bcache/util.h:284:8: error: redefinition of 'struct time_stats'
Message-ID: <202410301411.nny4YFwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   ab0339aa32f49d7cce50abab1e0e3e4d648d787c
commit: 4cb3c7a46a03de4e1ec96028e893aaf724c0b4f8 [256/271] vfs: add time stats collection for i_rwsem and the mmap invalidation lock
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410301411.nny4YFwn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301411.nny4YFwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301411.nny4YFwn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/bcache/bset.h:9,
                    from drivers/md/bcache/bcache.h:194,
                    from drivers/md/bcache/alloc.c:64:
>> drivers/md/bcache/util.h:284:8: error: redefinition of 'struct time_stats'
     284 | struct time_stats {
         |        ^~~~~~~~~~
   In file included from include/linux/fs.h:49,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from drivers/md/bcache/bcache.h:181:
   include/linux/time_stats.h:69:8: note: originally defined here
      69 | struct time_stats {
         |        ^~~~~~~~~~
--
   In file included from fs/bcachefs/util.h:25,
                    from fs/bcachefs/vstructs.h:5,
                    from fs/bcachefs/bcachefs_format.h:80,
                    from fs/bcachefs/bcachefs.h:207,
                    from fs/bcachefs/acl.c:3:
>> fs/bcachefs/time_stats.h:33:8: error: redefinition of 'struct time_unit'
      33 | struct time_unit {
         |        ^~~~~~~~~
   In file included from include/linux/fs.h:49,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from fs/bcachefs/bcachefs.h:188:
   include/linux/time_stats.h:32:8: note: originally defined here
      32 | struct time_unit {
         |        ^~~~~~~~~
>> fs/bcachefs/time_stats.h:55:8: error: redefinition of 'struct quantiles'
      55 | struct quantiles {
         |        ^~~~~~~~~
   include/linux/time_stats.h:54:8: note: originally defined here
      54 | struct quantiles {
         |        ^~~~~~~~~
>> fs/bcachefs/time_stats.h:56:16: error: redefinition of 'struct quantile_entry'
      56 |         struct quantile_entry {
         |                ^~~~~~~~~~~~~~
   include/linux/time_stats.h:55:16: note: originally defined here
      55 |         struct quantile_entry {
         |                ^~~~~~~~~~~~~~
>> fs/bcachefs/time_stats.h:62:8: error: redefinition of 'struct time_stat_buffer'
      62 | struct time_stat_buffer {
         |        ^~~~~~~~~~~~~~~~
   include/linux/time_stats.h:61:8: note: originally defined here
      61 | struct time_stat_buffer {
         |        ^~~~~~~~~~~~~~~~
>> fs/bcachefs/time_stats.h:64:16: error: redefinition of 'struct time_stat_buffer_entry'
      64 |         struct time_stat_buffer_entry {
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:63:16: note: originally defined here
      63 |         struct time_stat_buffer_entry {
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/time_stats.h:98:33: error: conflicting types for 'time_stats_to_quantiles'; have 'struct quantiles *(struct bch2_time_stats *)'
      98 | static inline struct quantiles *time_stats_to_quantiles(struct bch2_time_stats *stats)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:98:33: note: previous definition of 'time_stats_to_quantiles' with type 'struct quantiles *(struct time_stats *)'
      98 | static inline struct quantiles *time_stats_to_quantiles(struct time_stats *stats)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/time_stats.h:130:20: error: conflicting types for 'track_event_change'; have 'bool(struct bch2_time_stats *, bool)' {aka '_Bool(struct bch2_time_stats *, _Bool)'}
     130 | static inline bool track_event_change(struct bch2_time_stats *stats, bool v)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:130:20: note: previous definition of 'track_event_change' with type 'bool(struct time_stats *, bool)' {aka '_Bool(struct time_stats *, _Bool)'}
     130 | static inline bool track_event_change(struct time_stats *stats, bool v)
         |                    ^~~~~~~~~~~~~~~~~~


vim +284 drivers/md/bcache/util.h

cafe563591446c Kent Overstreet 2013-03-23  283  
cafe563591446c Kent Overstreet 2013-03-23 @284  struct time_stats {
65d22e911bfc4f Kent Overstreet 2013-07-31  285  	spinlock_t	lock;
cafe563591446c Kent Overstreet 2013-03-23  286  	/*
cafe563591446c Kent Overstreet 2013-03-23  287  	 * all fields are in nanoseconds, averages are ewmas stored left shifted
cafe563591446c Kent Overstreet 2013-03-23  288  	 * by 8
cafe563591446c Kent Overstreet 2013-03-23  289  	 */
cafe563591446c Kent Overstreet 2013-03-23  290  	uint64_t	max_duration;
cafe563591446c Kent Overstreet 2013-03-23  291  	uint64_t	average_duration;
cafe563591446c Kent Overstreet 2013-03-23  292  	uint64_t	average_frequency;
cafe563591446c Kent Overstreet 2013-03-23  293  	uint64_t	last;
cafe563591446c Kent Overstreet 2013-03-23  294  };
cafe563591446c Kent Overstreet 2013-03-23  295  

:::::: The code at line 284 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
