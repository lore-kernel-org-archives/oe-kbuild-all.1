Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3597F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709462211; cv=none; b=iNlKih+opTmoSe+fatQdWXuQCJMWhGAQ2lrgZ4372ropj8TR+a7wqkCDevowdFedU1nO91knZzQA5jkncsDQYbM2nerNd5QgeBEQv4hmYYjLJ4XVXx8xGznr7O54DVFuK7fs8xVC0h58vbbd4y+w8leF6C9ek+14YCttNT0IHsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709462211; c=relaxed/simple;
	bh=T9oSNoogE567tkrVAMdP/YOQPWDROU0aYNeaUqIFcpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2+VfI4TbhaJC7Ku3SS/PaAqeNWBXosru61+eH6LCa69vYvru0Y9E7rI4CXD+TWU0FXMaaNDS3Y29kBERleWSomw1z0hh6NwF+YzEtHeaWyt6iBLow/ujfGEQxo9l5LGnccofAzwRRYfkcg7U+sDFV8MH1FhJT6KTsU0aaryPVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvX3qkEy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvX3qkEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709462209; x=1740998209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9oSNoogE567tkrVAMdP/YOQPWDROU0aYNeaUqIFcpE=;
  b=jvX3qkEySdras76dl66mWoWCPXTxdGpmXI2/msbZKvZ4UdCYi4dDVofq
   0yCm8k5zRMg6KfvdVqIMpPMnvZWhw8PfrJmx3DSQPCQpTsSTRHQSJY3VW
   B4iXcfsCPBYSOa7SCMYn+EFRQPIgJ63uuoaF4IUgKcQAgCDYivLSUAw9a
   NJnt0YhjedqUupJvJWvG9jCp3mbrI3Rpjo5i1pcCKEPFJIb+H4tkUX9kt
   GqD2GHaAFiyHed5lrs+zJTqKxq1SNh3JzMoo8XKTUjZcB+4S7hOh8uu10
   L6xgIFp4n7oNrMFpIgTIk1OhOELu02n8kQ+w0DhSI0H3IDlINroyRyrR1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7732025"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="7732025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 02:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13231733"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2024 02:36:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgjD1-0001ic-2D;
	Sun, 03 Mar 2024 10:36:43 +0000
Date: Sun, 3 Mar 2024 18:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Maxwell <jmaxwell37@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli@kernel.org>,
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Suraj Jitindar Singh <surajjs@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [cip:linux-4.4.y-st-rc 1986/2011] net/decnet/dn_route.c:140:10:
 warning: initialization from incompatible pointer type
Message-ID: <202403031850.MhDZQCtg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   b01c108f53cc00abfe18491837bb94881ee164b8
commit: 21d825d4ad52272442958325e792a5266fd1a9f2 [1986/2011] ipv6: remove max_size check inline with ipv4
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403031850.MhDZQCtg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031850.MhDZQCtg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031850.MhDZQCtg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/netdevice.h:2396:34: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      skb_checksum_start_offset(skb) <
                                     ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from net/decnet/dn_route.c:59:
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
   In file included from net/decnet/dn_route.c:65:0:
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3310:37: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                                        ^~
   In file included from include/linux/writeback.h:192:0,
                    from include/linux/memcontrol.h:30,
                    from include/net/sock.h:58,
                    from net/decnet/dn_route.c:70:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (sectors >= bio_sectors(bio))
                 ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/sch_generic.h:12,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from net/decnet/dn_route.c:70:
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
                    from net/decnet/dn_route.c:70:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from net/decnet/dn_route.c:59:
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
                    from net/decnet/dn_route.c:70:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from net/decnet/dn_route.c:70:0:
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
   net/decnet/dn_route.c: At top level:
>> net/decnet/dn_route.c:140:10: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
     .gc =   dn_dst_gc,
             ^~~~~~~~~
   net/decnet/dn_route.c:140:10: note: (near initialization for 'dn_dst_ops.gc')
   net/decnet/dn_route.c: In function 'dn_dst_check_expire':
   net/decnet/dn_route.c:199:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i <= dn_rt_hash_mask; i++) {
                   ^~
   net/decnet/dn_route.c: In function 'dn_dst_gc':
   net/decnet/dn_route.c:231:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i <= dn_rt_hash_mask; i++) {
                   ^~
   net/decnet/dn_route.c: In function 'dn_run_flush':
   net/decnet/dn_route.c:368:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < dn_rt_hash_mask; i++) {
                   ^
   net/decnet/dn_route.c: In function 'dn_cache_dump':
   net/decnet/dn_route.c:1733:25: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(cb->nlh) < sizeof(struct rtmsg))
                            ^
   net/decnet/dn_route.c:1742:15: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for(h = 0; h <= dn_rt_hash_mask; h++) {
                  ^~
   net/decnet/dn_route.c: In function 'dn_route_init':
   net/decnet/dn_route.c:1882:32: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for(order = 0; (1UL << order) < goal; order++)
                                   ^
   net/decnet/dn_route.c:1911:15: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for(i = 0; i <= dn_rt_hash_mask; i++) {
                  ^~
   net/decnet/dn_route.c:510: warning: No description found for parameter 'net'
   net/decnet/dn_route.c:510: warning: No description found for parameter 'sk'
--
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/netdevice.h:3034:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(index >= dev->num_rx_queues);
     ^~~~~~
   In file included from include/linux/inetdevice.h:9:0,
                    from net/ipv4/xfrm4_policy.c:13:
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3310:37: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                                        ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/neighbour.h:29,
                    from include/net/dst.h:17,
                    from net/ipv4/xfrm4_policy.c:15:
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
   In file included from include/net/neighbour.h:29:0,
                    from include/net/dst.h:17,
                    from net/ipv4/xfrm4_policy.c:15:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/linux/writeback.h:192:0,
                    from include/linux/memcontrol.h:30,
                    from include/net/sock.h:58,
                    from include/net/xfrm.h:17,
                    from net/ipv4/xfrm4_policy.c:16:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (sectors >= bio_sectors(bio))
                 ^~
   In file included from include/linux/err.h:4:0,
                    from net/ipv4/xfrm4_policy.c:11:
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
                    from include/net/xfrm.h:17,
                    from net/ipv4/xfrm4_policy.c:16:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from include/net/xfrm.h:17:0,
                    from net/ipv4/xfrm4_policy.c:16:
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
   In file included from include/linux/tcp.h:23:0,
                    from include/linux/ipv6.h:72,
                    from include/net/ipv6.h:16,
                    from include/net/inetpeer.h:15,
                    from include/net/route.h:28,
                    from include/net/ip.h:31,
                    from include/net/xfrm.h:19,
                    from net/ipv4/xfrm4_policy.c:16:
   include/net/inet_connection_sock.h: In function 'inet_csk_reqsk_queue_is_full':
   include/net/inet_connection_sock.h:294:38: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return inet_csk_reqsk_queue_len(sk) >= sk->sk_max_ack_backlog;
                                         ^~
   net/ipv4/xfrm4_policy.c: In function 'xfrm4_garbage_collect':
   net/ipv4/xfrm4_policy.c:227:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return (dst_entries_get_slow(ops) > ops->gc_thresh * 2);
                                       ^
   net/ipv4/xfrm4_policy.c: At top level:
>> net/ipv4/xfrm4_policy.c:268:10: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
     .gc =   xfrm4_garbage_collect,
             ^~~~~~~~~~~~~~~~~~~~~
   net/ipv4/xfrm4_policy.c:268:10: note: (near initialization for 'xfrm4_dst_ops_template.gc')
   net/ipv4/xfrm4_policy.c:1: warning: no structured comments found
--
                    from include/net/if_inet6.h:19,
                    from include/net/addrconf.h:52,
                    from net/ipv6/xfrm6_policy.c:17:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (sectors >= bio_sectors(bio))
                 ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/sch_generic.h:12,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from include/net/if_inet6.h:19,
                    from include/net/addrconf.h:52,
                    from net/ipv6/xfrm6_policy.c:17:
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
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from include/net/if_inet6.h:19,
                    from include/net/addrconf.h:52,
                    from net/ipv6/xfrm6_policy.c:17:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/linux/err.h:4:0,
                    from net/ipv6/xfrm6_policy.c:14:
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
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from include/net/if_inet6.h:19,
                    from include/net/addrconf.h:52,
                    from net/ipv6/xfrm6_policy.c:17:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from include/linux/tcp.h:22:0,
                    from include/linux/ipv6.h:72,
                    from include/net/if_inet6.h:19,
                    from include/net/addrconf.h:52,
                    from net/ipv6/xfrm6_policy.c:17:
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
   In file included from include/linux/tcp.h:23:0,
                    from include/linux/ipv6.h:72,
                    from include/net/if_inet6.h:19,
                    from include/net/addrconf.h:52,
                    from net/ipv6/xfrm6_policy.c:17:
   include/net/inet_connection_sock.h: In function 'inet_csk_reqsk_queue_is_full':
   include/net/inet_connection_sock.h:294:38: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return inet_csk_reqsk_queue_len(sk) >= sk->sk_max_ack_backlog;
                                         ^~
   net/ipv6/xfrm6_policy.c: In function 'xfrm6_garbage_collect':
   net/ipv6/xfrm6_policy.c:224:35: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return dst_entries_get_fast(ops) > ops->gc_thresh * 2;
                                      ^
   net/ipv6/xfrm6_policy.c: At top level:
>> net/ipv6/xfrm6_policy.c:284:10: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
     .gc =   xfrm6_garbage_collect,
             ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/xfrm6_policy.c:284:10: note: (near initialization for 'xfrm6_dst_ops_template.gc')
   net/ipv6/xfrm6_policy.c: In function '_decode_session6':
   net/ipv6/xfrm6_policy.c:153:14: warning: this statement may fall through [-Wimplicit-fallthrough=]
       onlyproto = 1;
       ~~~~~~~~~~^~~
   net/ipv6/xfrm6_policy.c:154:3: note: here
      case NEXTHDR_ROUTING:
      ^~~~
   net/ipv6/xfrm6_policy.c:1: warning: no structured comments found


vim +140 net/decnet/dn_route.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  136  
^1da177e4c3f41 Linus Torvalds   2005-04-16  137  static struct dst_ops dn_dst_ops = {
^1da177e4c3f41 Linus Torvalds   2005-04-16  138  	.family =		PF_DECnet,
^1da177e4c3f41 Linus Torvalds   2005-04-16  139  	.gc_thresh =		128,
^1da177e4c3f41 Linus Torvalds   2005-04-16 @140  	.gc =			dn_dst_gc,
^1da177e4c3f41 Linus Torvalds   2005-04-16  141  	.check =		dn_dst_check,
0dbaee3b37e118 David S. Miller  2010-12-13  142  	.default_advmss =	dn_dst_default_advmss,
ebb762f27fed08 Steffen Klassert 2011-11-23  143  	.mtu =			dn_dst_mtu,
62fa8a846d7de4 David S. Miller  2011-01-26  144  	.cow_metrics =		dst_cow_metrics_generic,
62fa8a846d7de4 David S. Miller  2011-01-26  145  	.destroy =		dn_dst_destroy,
fccd7d5c77ff61 David S. Miller  2012-07-02  146  	.ifdown =		dn_dst_ifdown,
^1da177e4c3f41 Linus Torvalds   2005-04-16  147  	.negative_advice =	dn_dst_negative_advice,
^1da177e4c3f41 Linus Torvalds   2005-04-16  148  	.link_failure =		dn_dst_link_failure,
^1da177e4c3f41 Linus Torvalds   2005-04-16  149  	.update_pmtu =		dn_dst_update_pmtu,
b587ee3ba21f58 David S. Miller  2012-07-12  150  	.redirect =		dn_dst_redirect,
d3aaeb38c40e5a David S. Miller  2011-07-18  151  	.neigh_lookup =		dn_dst_neigh_lookup,
^1da177e4c3f41 Linus Torvalds   2005-04-16  152  };
^1da177e4c3f41 Linus Torvalds   2005-04-16  153  

:::::: The code at line 140 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
