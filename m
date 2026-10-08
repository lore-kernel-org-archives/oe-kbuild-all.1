Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678523644CF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 04:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433160; cv=none; b=lYVOlf5fg/PhfxQOknFXJ/FGdZX61slJv9Sqjg8QuqP8itz/Uk4JnBZWXr16iixbfX4eYjGcJg1ChvswneaIxyeSZhh4UeZPVbd7JxfkGy3hKFJIbLXPv4dZ5VJRY960kT6tuQKcZBMJ0eKYbIeNJ7YsIKj+dmLVlY0zMO7ydqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433160; c=relaxed/simple;
	bh=bwXVuYbhRL4IJ/OXXNVh39CBBH4Ebnz1+lxoW8eCZNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ozpGj6CHoMjBr8aKf7Ed5t+EYdPt5Dikh4C7mdqhSysAPfxGpVUtmOKz9v1Tf2UkTgwyF6Y2dAR6V6Gb0QmBO7XWVkGSAMVE78/xONSb2wRqeaxSId9POl8mvNPzzJaPwfa1eKbeaWUv7NdR74yPiOPhF7tgZbSmkufz/Sjphg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU+oftV7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU+oftV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791433160; x=1822969160;
  h=date:from:to:cc:subject:message-id;
  bh=bwXVuYbhRL4IJ/OXXNVh39CBBH4Ebnz1+lxoW8eCZNk=;
  b=nU+oftV7VFC2hZ8hAJjYnjJa0DGyioIgk5/B5nFMD3hRl3llxXSSkIOe
   26oNrzBPCoK/pvY3CGsi4mf9LLrc3qznth79XU6NQu9Ak62qW67y/C+N6
   1MNCaeafL+jOT3BHkem8V5XPXNzPY7UJiwytwC+7YLHy0osF8YQNsYkhc
   LPsvCV3tvOJpAZI8r/wfoPUQr9iAjciuQxf9Oc1aAz0bbsh1PM6HQ1J2I
   xOSVQBENNsNx7ZhOPBkfdTCJXsgd82NwJiZ7cLOkjgfcP0iKERue+Fis6
   X1JrqtJZ3AaFAaw1MnKPqPfhiAElyY7Y1ButgUqUv/NtCYi4lVzAE1vEs
   Q==;
X-CSE-ConnectionGUID: f4wREHkCRmCJ4y3/xybKhA==
X-CSE-MsgGUID: kurARdYBRxOmWEmByZg1WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="93791"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="93791"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 21:19:19 -0700
X-CSE-ConnectionGUID: Ge7GLxGoSjezwVKzkxs1tw==
X-CSE-MsgGUID: 7hH2XpewTs+RGpALoO9upw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="229769"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Oct 2026 21:19:16 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEfb8-000000004l9-1Q5h;
	Thu, 08 Oct 2026 04:19:14 +0000
Date: Thu, 08 Oct 2026 06:18:27 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp-round4-backup 27/42]
 include/net/xdp.h:703:37: error: 'bpf_xdp_consume_enabled_key' undeclared
Message-ID: <202610080655.ZV7dX5si-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp-round4-backup
head:   63925314fb03ace1f3949a09d298cfdc0188bc8a
commit: 79cfafda75fd6890e5c21a07a2c3d90f21cbe85e [27/42] xdp: Add XDP_CONSUME for frames a program takes ownership of
config: i386-randconfig-2301-20261006 (https://download.01.org/0day-ci/archive/20261008/202610080655.ZV7dX5si-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080655.ZV7dX5si-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080655.ZV7dX5si-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/static_key.h:1,
                    from include/linux/alloc_tag.h:15,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:12,
                    from include/linux/bpf-cgroup.h:5,
                    from net/socket.c:55:
   include/net/xdp.h: In function 'bpf_prog_run_xdp':
>> include/net/xdp.h:703:37: error: 'bpf_xdp_consume_enabled_key' undeclared (first use in this function)
     703 |         if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:489:50: note: in definition of macro 'static_branch_unlikely'
     489 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   include/net/xdp.h:703:37: note: each undeclared identifier is reported only once for each function it appears in
     703 |         if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:489:50: note: in definition of macro 'static_branch_unlikely'
     489 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
--
   In file included from include/linux/static_key.h:1,
                    from include/linux/alloc_tag.h:15,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:12,
                    from include/linux/filter.h:9,
                    from kernel/bpf/core.c:22:
   kernel/bpf/core.c: In function 'bpf_prog_free_deferred':
>> kernel/bpf/core.c:3098:36: error: 'bpf_xdp_consume_enabled_key' undeclared (first use in this function)
    3098 |                 static_branch_dec(&bpf_xdp_consume_enabled_key);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:514:63: note: in definition of macro 'static_branch_dec'
     514 | #define static_branch_dec(x)            static_key_slow_dec(&(x)->key)
         |                                                               ^
   kernel/bpf/core.c:3098:36: note: each undeclared identifier is reported only once for each function it appears in
    3098 |                 static_branch_dec(&bpf_xdp_consume_enabled_key);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:514:63: note: in definition of macro 'static_branch_dec'
     514 | #define static_branch_dec(x)            static_key_slow_dec(&(x)->key)
         |                                                               ^


vim +/bpf_xdp_consume_enabled_key +703 include/net/xdp.h

   693	
   694	static __always_inline u32 bpf_prog_run_xdp(const struct bpf_prog *prog,
   695						    struct xdp_buff *xdp)
   696	{
   697		/* Driver XDP hooks are invoked within a single NAPI poll cycle and thus
   698		 * under local_bh_disable(), which provides the needed RCU protection
   699		 * for accessing map entries.
   700		 */
   701		u32 act = __bpf_prog_run(prog, xdp, BPF_DISPATCHER_FUNC(xdp));
   702	
 > 703		if (static_branch_unlikely(&bpf_xdp_consume_enabled_key) || unlikely(act == XDP_CONSUME))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
