Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62212EFD8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596263; cv=none; b=uDTVmujP/9B9lCUT+Z1n705f4rqmVuA0BvbTb5w+vXwMX4en4nRqsb8VB1CMOPLCjjLxEZmQIsmSVEKQeDyjD7psGKl4BB9xOGMl0OE1q53jCLHwBe3AAVfhnaHYUAKFSE0Kxq9Qw3/49dqMJEqELGSylpvJky5whJpa/JniEwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596263; c=relaxed/simple;
	bh=VNjD83rpX3i5R31wY6YbXFakISTlJ1B51WM3ZskNCF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AdaV10/6kvLqjT5tF0jq9u2b/K1Bs9lsSTdoQOUu1upsNalLxZ8znYaSgn6zeDvyqhkBPaC8petyKE/QBOP3vg7jnOy8Vqbq0skL7nr14R0F6N8WUtqNKoMw+Uk0AH1Ol20W0idMcnkjTItMDIqVOPJ5GXpIV80XhytK0XoE154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNTYUdT6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNTYUdT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768596261; x=1800132261;
  h=date:from:to:cc:subject:message-id;
  bh=VNjD83rpX3i5R31wY6YbXFakISTlJ1B51WM3ZskNCF8=;
  b=mNTYUdT6Vyp48IrQMWPLNGxpMavARBwhHBw03Tn5jcsJCSTgcCF75KN6
   37JAEGEwFcrF47+OnJsOMnUCUSjCgoWAbMGanBJIXZvAwSOUmhvlKv6SC
   tfBKFMjlpaXg7rCtE7Ms+pLDmM605YbD7XiHz3Tqy+I+5bipR2nUSR666
   IKmVMFE4gTPWdlRPtJtC/Cs1zp3C0bcLlU0Ak+1DiOtKg3e20gYFrP1Mr
   ufWRFD7SLwNEE2L8hpAGrrsfy+VhM6m/VAjAPp30F9uEKcP2FfOVIGvVj
   c3PPWW/RjAJfn2my9q9/VkWIEZh0yjZamhQJJZt+XJXumv23PizDFg+v4
   w==;
X-CSE-ConnectionGUID: j6X0Xbg2QhqQbAsgTb0lIA==
X-CSE-MsgGUID: 9q6NOLh8SNKMJKPhGq5Wiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69966237"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69966237"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:44:21 -0800
X-CSE-ConnectionGUID: OSNx1dUTS9SGq6iAcN82bg==
X-CSE-MsgGUID: SxvN7hD1RYGCspTmmPR32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205129276"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2026 12:44:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgqg5-00000000LEa-0KlG;
	Fri, 16 Jan 2026 20:44:17 +0000
Date: Sat, 17 Jan 2026 04:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 6/6]
 include/trace/events/f2fs.h:2598:19: warning: format '%lld' expects argument
 of type 'long long int', but argument 6 has type 'long unsigned int'
Message-ID: <202601170457.MinsdW9c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   79db93f970fef44c4e01ed7a3d247ed65375a3ab
commit: 79db93f970fef44c4e01ed7a3d247ed65375a3ab [6/6] f2fs: trace_f2fs_map_lock()
config: i386-randconfig-012-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170457.MinsdW9c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170457.MinsdW9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170457.MinsdW9c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2608,
                    from fs/f2fs/super.c:41:
   include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_map_lock':
>> include/trace/events/f2fs.h:2598:19: warning: format '%lld' expects argument of type 'long long int', but argument 6 has type 'long unsigned int' [-Wformat=]
    2598 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/f2fs.h:2576:1: note: in expansion of macro 'TRACE_EVENT'
    2576 | TRACE_EVENT(f2fs_map_lock,
         | ^~~~~~~~~~~
   include/trace/events/f2fs.h:2598:9: note: in expansion of macro 'TP_printk'
    2598 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:256:
   include/trace/events/f2fs.h:2598:57: note: format string is defined here
    2598 |         TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
         |                                                      ~~~^
         |                                                         |
         |                                                         long long int
         |                                                      %ld


vim +2598 include/trace/events/f2fs.h

  2577	
  2578		TP_PROTO(struct inode *inode, pgoff_t index, int flag, char *string),
  2579	
  2580		TP_ARGS(inode, index, flag, string),
  2581	
  2582		TP_STRUCT__entry(
  2583			__field(dev_t, dev)
  2584			__field(ino_t, ino)
  2585			__field(pgoff_t, index)
  2586			__field(int, flag)
  2587			__field(char *, string)
  2588		),
  2589	
  2590		TP_fast_assign(
  2591			__entry->dev		= inode->i_sb->s_dev;
  2592			__entry->ino		= inode->i_ino;
  2593			__entry->index		= index;
  2594			__entry->flag		= flag;
  2595			__entry->string		= string;
  2596		),
  2597	
> 2598		TP_printk("dev = (%d,%d), ino = %lu, index = %lld, flag = %d, %s",
  2599			show_dev_ino(__entry),
  2600			__entry->index,
  2601			__entry->flag,
  2602			__entry->string)
  2603	);
  2604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
