Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B4914A9D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246921; cv=none; b=BZNQ3UzDd0G+ILH0QKOSIHnowb8otaMGNcJJCG26uVPkxYuu0PZK4f/t8yMeMRKbLK+m4fTjXd6+tCtDj8aZYfYHiuUv5MRqHm24bSRUnU6TUI86HbXF4dM9ZDaAW461GcGEmws+6+Fi/TiqApBgE2szYNTzdohIrhtYMi5cBCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246921; c=relaxed/simple;
	bh=P8AcbjLfFgXyfuTPADQSKLnyCl4ME5jn+p7UVHgB1IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgDw6jys6JkjBOcG6NKTIBzSe/JaKhvr0cQwBlMuqP7ogUVhPl89VyBhwnMjR+jCvKbcVwRu9wJXD2GJh3P/jHmW+a7q6Xi3J/GRB4+q/uDQplVIVig8yZX8PKv2/IVT1GGtYQLv/bpnUKPqpqv8FJP25mECc6S56fQIckyOST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGlnLy+A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGlnLy+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707246920; x=1738782920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8AcbjLfFgXyfuTPADQSKLnyCl4ME5jn+p7UVHgB1IA=;
  b=OGlnLy+A7JII6xkdeSrcU0lJLzb6fK8Imwpy7k6Jb8A3OvKYh0Nga+UP
   Pqx8voW91phD57mI1nUpgZi8tHM39gaZj0tY7Z2xX5ZhNhnNPbtp8jPI1
   2sHdJw2dTQ055BB5W502U+aU8JYhfari6nssbMmEIG5YCUvNXHtppprNv
   VrEOqA9s+grcqTQ1R7rQBPTnouhSdN1LLgr9zLCDb7Q0IkQfAKuHV6LSq
   FNRuNz8rcsQ1d8FMnsej7eY7LJjrarpmBh42W9SoujJy5vczGcYVHnp7T
   g3bNP56uGsr7bSO5MXFjmS01gmrval76UpKpW0EoRwA4GRZxw/f8Nucck
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1101173"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1101173"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 11:15:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909733588"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="909733588"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2024 11:15:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXQuZ-0001j5-1U;
	Tue, 06 Feb 2024 19:15:15 +0000
Date: Wed, 7 Feb 2024 03:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 59/66] drivers/md/bcache/util.h:366:17:
 error: too few arguments to function 'time_stats_to_seq_buf'
Message-ID: <202402070344.9JjVBlpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   50847e296b34efabe199e408ec4d72f10a866c39
commit: c7caff27eedeef30d457cbe0d5aae0698fcc954f [59/66] time_stats: don't print any output if event count is zero
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240207/202402070344.9JjVBlpj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070344.9JjVBlpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070344.9JjVBlpj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/bcache/bset.h:10,
                    from drivers/md/bcache/bcache.h:195,
                    from drivers/md/bcache/sysfs.c:9:
   drivers/md/bcache/sysfs.c: In function '__bch_cache_set_show':
>> drivers/md/bcache/util.h:366:17: error: too few arguments to function 'time_stats_to_seq_buf'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:747:9: note: in expansion of macro 'sysfs_print_time_stats'
     747 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/md/bcache/bcache.h:189:
   include/linux/time_stats.h:153:6: note: declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/util.h:366:17: error: too few arguments to function 'time_stats_to_seq_buf'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:748:9: note: in expansion of macro 'sysfs_print_time_stats'
     748 |         sysfs_print_time_stats(&c->btree_split_time,    btree_split_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:153:6: note: declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/util.h:366:17: error: too few arguments to function 'time_stats_to_seq_buf'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:749:9: note: in expansion of macro 'sysfs_print_time_stats'
     749 |         sysfs_print_time_stats(&c->sort.time,           btree_sort_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:153:6: note: declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/util.h:366:17: error: too few arguments to function 'time_stats_to_seq_buf'
     366 |                 time_stats_to_seq_buf(&seq, stats);                     \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.c:750:9: note: in expansion of macro 'sysfs_print_time_stats'
     750 |         sysfs_print_time_stats(&c->btree_read_time,     btree_read_times);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/time_stats.h:153:6: note: declared here
     153 | void time_stats_to_seq_buf(struct seq_buf *, struct time_stats *,
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/time_stats_to_seq_buf +366 drivers/md/bcache/util.h

cafe563591446c Kent Overstreet 2013-03-23  356  
cafe563591446c Kent Overstreet 2013-03-23  357  #define __print_time_stat(stats, name, stat, units)			\
cafe563591446c Kent Overstreet 2013-03-23  358  	sysfs_print(name ## _ ## stat ## _ ## units,			\
cafe563591446c Kent Overstreet 2013-03-23  359  		    div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
cafe563591446c Kent Overstreet 2013-03-23  360  
21ba4155ff2f9e Kent Overstreet 2024-01-26  361  #define sysfs_print_time_stats(stats, name)				\
cafe563591446c Kent Overstreet 2013-03-23  362  do {									\
21ba4155ff2f9e Kent Overstreet 2024-01-26  363  	if (attr == &sysfs_##name) {					\
21ba4155ff2f9e Kent Overstreet 2024-01-26  364  		struct seq_buf seq;					\
21ba4155ff2f9e Kent Overstreet 2024-01-26  365  		seq_buf_init(&seq, buf, PAGE_SIZE);			\
21ba4155ff2f9e Kent Overstreet 2024-01-26 @366  		time_stats_to_seq_buf(&seq, stats);			\
21ba4155ff2f9e Kent Overstreet 2024-01-26  367  		return seq.len;						\
21ba4155ff2f9e Kent Overstreet 2024-01-26  368  	}								\
cafe563591446c Kent Overstreet 2013-03-23  369  } while (0)
cafe563591446c Kent Overstreet 2013-03-23  370  

:::::: The code at line 366 was first introduced by commit
:::::: 21ba4155ff2f9e17cf4d27f1ad2ea42fecfed4ae bcache: Convert to lib/time_stats

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
