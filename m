Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFFE3081A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787254; cv=none; b=Qk7UUpdbB9m4SKx1xJr9skaA+kO2TeMYFl0F5kfy2jpwcAwSDqO9KLFihy9jesQJHsZtcHqLj0wHuVNfqRbXQN3eYm5bQNjvGFIsCf9ZGkTip/PpBOXj33CvU1Qa9HcPITJkuI+UnTuic43YgDnoqN1Ro6xghBN9o8BAgBslUms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787254; c=relaxed/simple;
	bh=e9HEupVdG6TxFiRdvHRrDsVLmge2TORisi9keeKrbLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PzQtDzB3Z56aitbj4YGHpaUgxsErtpS4co0fM/9B8Ystw6/46RVjz3RipmNhwdJ0wYFV/+Gv/aaT0vl9cfvzaDwW63cn3rzHVOouUURZzRd3auJSjE5fkizjAkVQchDKEIuQq7JQsF2EIkvhf1x2xoFmP+o7lIubAZohmi4EIM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJwO17F8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJwO17F8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773787253; x=1805323253;
  h=date:from:to:cc:subject:message-id;
  bh=e9HEupVdG6TxFiRdvHRrDsVLmge2TORisi9keeKrbLo=;
  b=fJwO17F89fZELKfgk1AbM22Qr42MuPvgn+qtfLIpSvy6QyC0/SuNWkaZ
   94rLQgcDbmLpzlr0EOrRdJ3M9KDEhQVszHCGz/bVuI6/qLIYfHY96et4U
   DVB0HywXoQreBzHjSo7BvKqrXJq+3T6BwCHEXnMOngJCNSUK/my38X8hS
   qXTC2yDj8I1wInBJ7264gfYAnB9IGtHWp40lBMsrjZEtTlIyGpjhHr2SA
   bBk1t2ddfqh4UkjG3BDQftTAbjVdefGmZ8PhBOUzizNAhg9WV6jKxJ5dj
   ZdHsYsZfZowqXeq5DdxvDn/z+nYdPmEXjHGjqOtsqvt/dQbrS0fu+FSX0
   w==;
X-CSE-ConnectionGUID: EEMuqsHDQVyH1qoJyPuuBA==
X-CSE-MsgGUID: Fouj3glzSxup9nJTpXQD7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78734002"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78734002"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:40:53 -0700
X-CSE-ConnectionGUID: PkEK1W0VSTSgj8+YgkSmiQ==
X-CSE-MsgGUID: ul8+fnSoSn6hrVwkonab7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222633282"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 15:40:51 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2d5k-0000000027t-0r9B;
	Tue, 17 Mar 2026 22:40:48 +0000
Date: Wed, 18 Mar 2026 06:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 5/5]
 include/trace/events/f2fs.h:2655:12: warning: format '%lld' expects argument
 of type 'long long int', but argument 6 has type 'long unsigned int'
Message-ID: <202603180642.YjrwSbdn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   c85deae607667bb160a277e75324a45879161285
commit: c85deae607667bb160a277e75324a45879161285 [5/5] f2fs: introduce trace_f2fs_map_lock()
config: sparc64-randconfig-002-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180642.YjrwSbdn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180642.YjrwSbdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180642.YjrwSbdn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2665,
                    from fs/f2fs/super.c:41:
   include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_map_lock':
>> include/trace/events/f2fs.h:2655:12: warning: format '%lld' expects argument of type 'long long int', but argument 6 has type 'long unsigned int' [-Wformat=]
     TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:27: note: in definition of macro 'DECLARE_EVENT_CLASS'
     trace_event_printf(iter, print);    \
                              ^~~~~
   include/trace/trace_events.h:45:9: note: in expansion of macro 'PARAMS'
            PARAMS(print));         \
            ^~~~~~
   include/trace/events/f2fs.h:2633:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(f2fs_map_lock,
    ^~~~~~~~~~~
   include/trace/events/f2fs.h:2655:2: note: in expansion of macro 'TP_printk'
     TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
     ^~~~~~~~~
   In file included from include/trace/trace_events.h:256,
                    from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2665,
                    from fs/f2fs/super.c:41:
   include/trace/events/f2fs.h:2655:50: note: format string is defined here
     TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
                                                  ~~~^
                                                  %ld


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
