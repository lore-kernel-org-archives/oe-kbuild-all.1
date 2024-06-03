Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B73122075
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423344; cv=none; b=Q3tDKK3H9CczoctJrmgJN3Z9BoRh9OjaNd2UDmuPutyXiqUkskJM77dRYFCF5C93MD4vnvSJRutqegPTqYYBgjPEhkGGR1yGDoe5GvuY9dGiOCtdp4+z07znwaBNEesL4j6GtjO3ZdISUlqGf8t4rQm6/QskbssgdurhpzvtCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423344; c=relaxed/simple;
	bh=sA+qyuxxhWfpFR7LxqUgciMGCoDaml13Fznw7kCbZCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zhy8lFq0E3UjOPA2AwYdjnmk7gu2/zgtIyQpnUV+UWUC7iXOhED7VABuqaKMfm4UmH6vxvjE/bKznqI1SY1ivvKgs4ZybkdEv17ZSNFZ37qdwPYDmjQz818cxaQXTcAd4fOQOfKtxpAHZ173IAyBQhsdJWMkpsen6sv+LdgYmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSVy3KgR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSVy3KgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717423342; x=1748959342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sA+qyuxxhWfpFR7LxqUgciMGCoDaml13Fznw7kCbZCQ=;
  b=KSVy3KgR9iOo732vWrKQiYna7EdsNslB9GKQ5F/fKVuDTi8skVKAvXiO
   o6SC1o+tg6i4jWleindiKYt7oWFiGTGsplmBOwsYiR18ScMtyvwyJOCTe
   2marVzJSZ3JTH11wue/lPCuoVzrvn68ODHoYyC0D0f83te5EQz4rducv5
   5u5L7c89MXmWGT9jOl/Bv19yUAwvWTozw2PqdszeGuPGO58O4C3WYVlPR
   ATnjToPTIel3JDbkVtfcVXfekkeBhKOKPUSCvRprsDOiXrMsEnJzNZOSv
   OICm12EHQrVHB2PRI6xN2MOfjmaQ1AhjZM4OHanQu2LDvO2yRcV5KvsQC
   Q==;
X-CSE-ConnectionGUID: +Oi9IthDTeWRy7Fvo22STw==
X-CSE-MsgGUID: UAuMI3WNTwiJ5w6lOcCn9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14076245"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14076245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 07:02:21 -0700
X-CSE-ConnectionGUID: ugQXWAG/Rmajcon6FlxLdg==
X-CSE-MsgGUID: +aZx/ZHyS/C4rA9VZeeHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41971870"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2024 07:02:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE8GG-000LiJ-0M;
	Mon, 03 Jun 2024 14:02:08 +0000
Date: Mon, 3 Jun 2024 22:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 2271/2326] net/unix/garbage.c:249:21:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <202406032149.96qRWeN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   ecbb82ce18d073400afead62c777e18a6b64ef28
commit: 51fdba566ffe49757a962bc4e281ad85b46465dc [2271/2326] af_unix: Do not use atomic ops for unix_sk(sk)->inflight.
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240603/202406032149.96qRWeN6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406032149.96qRWeN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406032149.96qRWeN6-lkp@intel.com/

All warnings (new ones prefixed by >>):

                                     ^
   include/linux/rhashtable.h: In function 'rht_grow_above_100':
   include/linux/rhashtable.h:289:34: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return atomic_read(&ht->nelems) > tbl->size &&
                                     ^
   include/linux/rhashtable.h: In function 'rht_grow_above_max':
   include/linux/rhashtable.h:302:34: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            atomic_read(&ht->nelems) >= ht->p.insecure_max_entries;
                                     ^~
   In file included from net/unix/garbage.c:78:0:
   include/linux/netdevice.h: In function '__skb_gro_checksum_validate_needed':
   include/linux/netdevice.h:2396:34: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      skb_checksum_start_offset(skb) <
                                     ^
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from net/unix/garbage.c:71:
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:3034:15: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUG_ON(index >= dev->num_rx_queues);
                  ^
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/netdevice.h:3034:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >= dev->num_rx_queues);
     ^~~~~~
   In file included from net/unix/garbage.c:78:0:
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3310:37: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                                        ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/sch_generic.h:12,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from net/unix/garbage.c:84:
   include/net/netlink.h: In function 'nlmsg_ok':
   include/net/netlink.h:337:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      nlh->nlmsg_len <= remaining);
                     ^~
   include/net/netlink.h: In function 'nlmsg_parse':
   include/net/netlink.h:372:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   include/net/netlink.h: In function 'nlmsg_validate':
   include/net/netlink.h:405:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   In file included from include/net/sch_generic.h:12:0,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from net/unix/garbage.c:84:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from net/unix/garbage.c:71:
   include/net/sch_generic.h: In function 'qdisc_cb_private_validate':
   include/net/sch_generic.h:267:33: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
                                    ^
   include/linux/compiler.h:493:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:513:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/bug.h:50:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bug.h:74:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/net/sch_generic.h:267:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
     ^~~~~~~~~~~~
   In file included from include/net/sock.h:62:0,
                    from net/unix/garbage.c:84:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from net/unix/garbage.c:84:0:
   include/net/sock.h: In function 'skb_do_copy_data_nocache':
   include/net/sock.h:1859:54: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (csum_and_copy_from_iter(to, copy, &csum, from) != copy)
                                                         ^~
   include/net/sock.h:1863:46: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (copy_from_iter_nocache(to, copy, from) != copy)
                                                 ^~
   include/net/sock.h:1865:44: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } else if (copy_from_iter(to, copy, from) != copy)
                                               ^~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from net/unix/garbage.c:71:
   net/unix/garbage.c: In function 'unix_gc':
>> net/unix/garbage.c:249:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      BUG_ON(total_refs < u->inflight);
                        ^
   include/linux/compiler.h:182:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   net/unix/garbage.c:249:3: note: in expansion of macro 'BUG_ON'
      BUG_ON(total_refs < u->inflight);
      ^~~~~~
   net/unix/garbage.c:250:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (total_refs == u->inflight) {
                     ^~


vim +249 net/unix/garbage.c

   209	
   210	/* The external entry point: unix_gc() */
   211	void unix_gc(void)
   212	{
   213		struct unix_sock *u;
   214		struct unix_sock *next;
   215		struct sk_buff_head hitlist;
   216		struct list_head cursor;
   217		LIST_HEAD(not_cycle_list);
   218	
   219		spin_lock(&unix_gc_lock);
   220	
   221		/* Avoid a recursive GC. */
   222		if (gc_in_progress)
   223			goto out;
   224	
   225		/* Paired with READ_ONCE() in wait_for_unix_gc(). */
   226		WRITE_ONCE(gc_in_progress, true);
   227	
   228		/* First, select candidates for garbage collection.  Only
   229		 * in-flight sockets are considered, and from those only ones
   230		 * which don't have any external reference.
   231		 *
   232		 * Holding unix_gc_lock will protect these candidates from
   233		 * being detached, and hence from gaining an external
   234		 * reference.  Since there are no possible receivers, all
   235		 * buffers currently on the candidates' queues stay there
   236		 * during the garbage collection.
   237		 *
   238		 * We also know that no new candidate can be added onto the
   239		 * receive queues.  Other, non candidate sockets _can_ be
   240		 * added to queue, so we must make sure only to touch
   241		 * candidates.
   242		 */
   243		list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
   244			long total_refs;
   245	
   246			total_refs = file_count(u->sk.sk_socket->file);
   247	
   248			BUG_ON(!u->inflight);
 > 249			BUG_ON(total_refs < u->inflight);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
