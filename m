Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBB125A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776823; cv=none; b=i2yzoG2jIJEtDphwbZwc3sbFGLu1kRJjnW8t9xNJAaiiImI08xm5dBsVdvxkxEGtHkY4MKV+Kuxf/J1XZjyvgFMCEbhmjntHVVitRsvmPWDI9YMLFomKvbWpC26aH7cYAXHXV5pdMizlCR3wQLi0QFzStXalYSJFVIwkAZfZQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776823; c=relaxed/simple;
	bh=aXQVNSP/szE1Wb6K+YrXis2EwNPVCRAFvmOk1oVfm3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LrnjeBjnIwTE9ETCsq2anE36eTlSKc/hfSXcXs8GXKqmVhptT8ViVly2M0KtKZe9GKwTBGdcJq1iykdv6UbP1eDxQ+jOOq+c3rUjWDzU7d8PIm7Jp29WurWop9boLvKwcm/VJBW+Pg5Sq4ylp4NAdY19c7WOMs1AEzRaG77/Evk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LehkM2xu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LehkM2xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773776823; x=1805312823;
  h=date:from:to:cc:subject:message-id;
  bh=aXQVNSP/szE1Wb6K+YrXis2EwNPVCRAFvmOk1oVfm3A=;
  b=LehkM2xuLuHZp1ZaKTDyCikyqBw7Gedbv9aI8/X24wfwBhA7jsvNFOrV
   qtaMS0yrmp/RyoJrr3Ac5KfAoojbPCcFamnYmVWrkg9S3YYk6vPoIi0Wi
   SwJ1+vLZVEF28nUJg3kMGO7LcwHflnRBUxtakuChN1oxUK5jLiG2e6JMb
   4uP/u62IfXPlShMuTVDXOEFhNOO6pRbrwC5xMJwvWikpjbhq5KDlmz1GP
   oHlua+4TEDzV/EL/wrGUi1vhW/GWa6HpJkiYlnOeLfwRH9LMZWpapbrKy
   iR7Iae5BVtjtOCSoehRXu8MmGvsLtv+jDqtp33Q9qzHGCtw7mONUUnmdD
   g==;
X-CSE-ConnectionGUID: 5JsjIrlfTBOrBJokCyQRAw==
X-CSE-MsgGUID: iGvtleVuTiOKPvWoFkBETw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85452086"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85452086"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 12:47:02 -0700
X-CSE-ConnectionGUID: ichaC9nfQrWk8opb4bbUxQ==
X-CSE-MsgGUID: 7wsViJhWTMq9oYkVTvfPKw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2026 12:47:00 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2aNW-000000004Vd-1qnB;
	Tue, 17 Mar 2026 19:46:58 +0000
Date: Tue, 17 Mar 2026 20:46:55 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 5/5]
 include/trace/events/f2fs.h:2655:19: warning: format '%lld' expects argument
 of type 'long long int', but argument 6 has type 'long unsigned int'
Message-ID: <202603172038.fCcFKBQE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   c85deae607667bb160a277e75324a45879161285
commit: c85deae607667bb160a277e75324a45879161285 [5/5] f2fs: introduce trace_f2fs_map_lock()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260317/202603172038.fCcFKBQE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172038.fCcFKBQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172038.fCcFKBQE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2665,
                    from fs/f2fs/super.c:41:
   include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_map_lock':
>> include/trace/events/f2fs.h:2655:19: warning: format '%lld' expects argument of type 'long long int', but argument 6 has type 'long unsigned int' [-Wformat=]
    2655 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/f2fs.h:2633:1: note: in expansion of macro 'TRACE_EVENT'
    2633 | TRACE_EVENT(f2fs_map_lock,
         | ^~~~~~~~~~~
   include/trace/events/f2fs.h:2655:9: note: in expansion of macro 'TP_printk'
    2655 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:256:
   include/trace/events/f2fs.h:2655:57: note: format string is defined here
    2655 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |                                                      ~~~^
         |                                                         |
         |                                                         long long int
         |                                                      %ld


vim +2655 include/trace/events/f2fs.h

  2634	
  2635		TP_PROTO(struct inode *inode, pgoff_t index, int flag, char *string),
  2636	
  2637		TP_ARGS(inode, index, flag, string),
  2638	
  2639		TP_STRUCT__entry(
  2640			__field(dev_t, dev)
  2641			__field(ino_t, ino)
  2642			__field(pgoff_t, index)
  2643			__field(int, flag)
  2644			__field(char *, string)
  2645		),
  2646	
  2647		TP_fast_assign(
  2648			__entry->dev		= inode->i_sb->s_dev;
  2649			__entry->ino		= inode->i_ino;
  2650			__entry->index		= index;
  2651			__entry->flag		= flag;
  2652			__entry->string		= string;
  2653		),
  2654	
> 2655		TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
  2656			show_dev_ino(__entry),
  2657			__entry->index,
  2658			__entry->flag,
  2659			__entry->string)
  2660	);
  2661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
