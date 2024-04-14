Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542512E68
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 04:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713069999; cv=none; b=C224H437rwKv3UZcvF+nlA5qf8ELnSuLWzd6aZL0/eTCsOKp5Su984nIOA3amfqOgeXcEfS/6U4S09NTvu/TtBGbtW1AQNkq5NYGwk1wq1myIgJU0jlH7JDQea22D3b4MgzIiCbmor3ZJmjuLbDTEIgl83Fn0inDEepxON2pWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713069999; c=relaxed/simple;
	bh=BcTHi/pbHif8KhLnIJtgTJqfBZ9Jj44B0EkTnOnvsU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=in5BX4Ki/3ivp9uJ0bLDtWZEf5uEHc1br5MNgMxj4YWUA9c914v8uun/5qLAdZg5rkp94CvVCuXzOIPfbZb1QeCrD3ZOKCj3vBGKwTZfHHd9NsXrBP6Myoy5LlcQwVrzPJjDjU08cslNgDQ31rc8MRChhpJMqe7f6R5I0xCaHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2RJaM2h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2RJaM2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713069997; x=1744605997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BcTHi/pbHif8KhLnIJtgTJqfBZ9Jj44B0EkTnOnvsU8=;
  b=H2RJaM2hLjH58zHL6BLpk9BozqUr5cv1SLRIoX1lfrMlTHnJKZrignOs
   LhX/pyJi7KIuISLKDTgoxeuPOw7etbbpRjtWHLMOT4O01/h4nxLYXMEIK
   Fta1sawXqtI3/8L4jVp6EOBS/ZYz2qhLz5ISRCNxM/rZf8qwGGe+NUOCq
   zQsRh+MBf9uCainLgm+HO+5fQkf04dlnrRz8gXx8FhaX7ZYep54pJwDDB
   W3d4tCWpdzkJQbPe30d58VFjL3G/uTCvK7st9vq6OnDqilyrpslIYLYCu
   QEhUoGv7c5qxM1Z6+qp0P+EGS567VstmARjV05lrBuszXwuESVFAl/aE/
   g==;
X-CSE-ConnectionGUID: QVk1zjBqQIOBrqqDzvtGbg==
X-CSE-MsgGUID: k15fa0VpQZWsDA9BfwXT4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8340547"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="8340547"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 21:46:36 -0700
X-CSE-ConnectionGUID: qY1DIgK1SC6P/bFPomcIVw==
X-CSE-MsgGUID: JHagFEd5RCGGBbFSf83j8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21584421"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2024 21:46:34 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvrl9-0003N6-1j;
	Sun, 14 Apr 2024 04:46:31 +0000
Date: Sun, 14 Apr 2024 12:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20812/22089]
 include/linux/compiler.h:271:34: warning: array subscript <unknown> is
 outside array bounds of 'const u32[0]' {aka 'const unsigned int[]'}
Message-ID: <202404141254.h8C8BQzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ab9b23cd7b3e05b3fc38df24e070593493e1d8e2
commit: f26f5f07f639bba2e12d72fb1cac16f5d1d18efc [20812/22089] rfs: annotate lockless accesses to RFS sock flow table
config: x86_64-randconfig-102-20240413 (https://download.01.org/0day-ci/archive/20240414/202404141254.h8C8BQzT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141254.h8C8BQzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141254.h8C8BQzT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/dev.c:2287:49: warning: array subscript i is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    2287 |                 new_map->queues[i] = map->queues[i];
         |                                      ~~~~~~~~~~~^~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   net/core/dev.c:2287:32: warning: array subscript i is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    2287 |                 new_map->queues[i] = map->queues[i];
         |                 ~~~~~~~~~~~~~~~^~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   In file included from net/core/dev.c:137:
   In function 'cpu_rmap_lookup_index',
       inlined from 'set_rps_cpu' at net/core/dev.c:3989:15:
   include/linux/cpu_rmap.h:47:26: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
      47 |         return rmap->near[cpu].index;
         |                ~~~~~~~~~~^~~~~
   include/linux/cpu_rmap.h: In function 'set_rps_cpu':
   include/linux/cpu_rmap.h:34:25: note: while referencing 'near'
      34 |         }               near[0];
         |                         ^~~~
   net/core/dev.c:4003:25: warning: array subscript flow_id is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4003 |                 rflow = &flow_table->flows[flow_id];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4003:43: warning: array subscript flow_id is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4003 |                 rflow = &flow_table->flows[flow_id];
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:5,
                    from net/core/dev.c:75:
   net/core/dev.c: In function '__get_xps_queue_idx':
   include/linux/compiler.h:271:34: warning: array subscript tci is outside array bounds of 'struct xps_map *[0]' [-Warray-bounds=]
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                  ^~~~
   include/linux/compiler.h:277:22: note: in expansion of macro '__READ_ONCE'
     277 | #define READ_ONCE(x) __READ_ONCE(x, 1)
         |                      ^~~~~~~~~~~
   include/linux/rcupdate.h:347:55: note: in expansion of macro 'READ_ONCE'
     347 |         typeof(*p) *________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                       ^~~~~~~~~
   include/linux/rcupdate.h:502:9: note: in expansion of macro '__rcu_dereference_check'
     502 |         __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:560:28: note: in expansion of macro 'rcu_dereference_check'
     560 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3618:15: note: in expansion of macro 'rcu_dereference'
    3618 |         map = rcu_dereference(dev_maps->attr_map[tci]);
         |               ^~~~~~~~~~~~~~~
   include/linux/netdevice.h:781:31: note: while referencing 'attr_map'
     781 |         struct xps_map __rcu *attr_map[0]; /* Either CPUs map or RXQs map */
         |                               ^~~~~~~~
   net/core/dev.c:3623:50: warning: array subscript <unknown> is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    3623 |                         queue_index = map->queues[reciprocal_scale(
         |                                       ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
    3624 |                                                 skb_get_hash(skb), map->len)];
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   net/core/dev.c:3621:50: warning: array subscript 0 is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    3621 |                         queue_index = map->queues[0];
         |                                       ~~~~~~~~~~~^~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   net/core/dev.c: In function 'rps_may_expire_flow':
   net/core/dev.c:4144:25: warning: array subscript flow_id is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4144 |                 rflow = &flow_table->flows[flow_id];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4144:43: warning: array subscript flow_id is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4144 |                 rflow = &flow_table->flows[flow_id];
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4144:43: warning: array subscript flow_id is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4144 |                 rflow = &flow_table->flows[flow_id];
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4144:43: warning: array subscript flow_id is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4144 |                 rflow = &flow_table->flows[flow_id];
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c: In function 'get_rps_cpu':
>> include/linux/compiler.h:271:34: warning: array subscript <unknown> is outside array bounds of 'const u32[0]' {aka 'const unsigned int[]'} [-Warray-bounds=]
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                  ^~~~
   include/linux/compiler.h:277:22: note: in expansion of macro '__READ_ONCE'
     277 | #define READ_ONCE(x) __READ_ONCE(x, 1)
         |                      ^~~~~~~~~~~
   net/core/dev.c:4067:25: note: in expansion of macro 'READ_ONCE'
    4067 |                 ident = READ_ONCE(sock_flow_table->ents[hash & sock_flow_table->mask]);
         |                         ^~~~~~~~~
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   net/core/dev.c:4067:56: warning: array subscript <unknown> is outside array bounds of 'const u32[0]' {aka 'const unsigned int[]'} [-Warray-bounds=]
    4067 |                 ident = READ_ONCE(sock_flow_table->ents[hash & sock_flow_table->mask]);
   include/linux/compiler.h:271:36: note: in definition of macro '__READ_ONCE'
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                    ^
   net/core/dev.c:4067:25: note: in expansion of macro 'READ_ONCE'
    4067 |                 ident = READ_ONCE(sock_flow_table->ents[hash & sock_flow_table->mask]);
         |                         ^~~~~~~~~
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   net/core/dev.c:4076:25: warning: array subscript <unknown> is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4076 |                 rflow = &flow_table->flows[hash & flow_table->mask];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4076:43: warning: array subscript <unknown> is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4076 |                 rflow = &flow_table->flows[hash & flow_table->mask];
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4076:43: warning: array subscript <unknown> is outside array bounds of 'struct rps_dev_flow[0]' [-Warray-bounds=]
    4076 |                 rflow = &flow_table->flows[hash & flow_table->mask];
         |                          ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:680:29: note: while referencing 'flows'
     680 |         struct rps_dev_flow flows[0];
         |                             ^~~~~
   net/core/dev.c:4108:33: warning: array subscript <unknown> is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    4108 |                 tcpu = map->cpus[reciprocal_scale(hash, map->len)];
         |                        ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:658:13: note: while referencing 'cpus'
     658 |         u16 cpus[0];
         |             ^~~~
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14:
   net/core/dev.c: In function 'remove_xps_queue':
   include/linux/rcupdate.h:356:10: warning: array subscript tci is outside array bounds of 'struct xps_map *[0]' [-Warray-bounds=]
     356 |         ((typeof(*p) __force __kernel *)(p)); \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:551:9: note: in expansion of macro '__rcu_dereference_protected'
     551 |         __rcu_dereference_protected((p), (c), __rcu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:2123:9: note: in expansion of macro 'rcu_dereference_protected'
    2123 |         rcu_dereference_protected((P), lockdep_is_held(&xps_map_mutex))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:2132:23: note: in expansion of macro 'xmap_dereference'
    2132 |                 map = xmap_dereference(dev_maps->attr_map[tci]);
         |                       ^~~~~~~~~~~~~~~~
   include/linux/netdevice.h:781:31: note: while referencing 'attr_map'
     781 |         struct xps_map __rcu *attr_map[0]; /* Either CPUs map or RXQs map */
         |                               ^~~~~~~~
   net/core/dev.c:2137:32: warning: array subscript pos is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    2137 |                 if (map->queues[pos] != index)
         |                     ~~~~~~~~~~~^~~~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   net/core/dev.c:2141:55: warning: array subscript <unknown> is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    2141 |                         map->queues[pos] = map->queues[--map->len];
         |                                            ~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   net/core/dev.c:2141:36: warning: array subscript pos is outside array bounds of 'u16[0]' {aka 'short unsigned int[]'} [-Warray-bounds=]
    2141 |                         map->queues[pos] = map->queues[--map->len];
         |                         ~~~~~~~~~~~^~~~~
   include/linux/netdevice.h:770:13: note: while referencing 'queues'
     770 |         u16 queues[0];
         |             ^~~~~~
   net/core/dev.c: In function '__netif_set_xps_queue':
   include/linux/rcupdate.h:356:10: warning: array subscript tci is outside array bounds of 'struct xps_map *[0]' [-Warray-bounds=]
     356 |         ((typeof(*p) __force __kernel *)(p)); \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:551:9: note: in expansion of macro '__rcu_dereference_protected'
     551 |         __rcu_dereference_protected((p), (c), __rcu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:2123:9: note: in expansion of macro 'rcu_dereference_protected'
    2123 |         rcu_dereference_protected((P), lockdep_is_held(&xps_map_mutex))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:2430:35: note: in expansion of macro 'xmap_dereference'
    2430 |                         new_map = xmap_dereference(new_dev_maps->attr_map[tci]);
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/netdevice.h:781:31: note: while referencing 'attr_map'
     781 |         struct xps_map __rcu *attr_map[0]; /* Either CPUs map or RXQs map */
         |                               ^~~~~~~~
   include/linux/rcupdate.h:356:10: warning: array subscript tci is outside array bounds of 'struct xps_map *[0]' [-Warray-bounds=]
--
   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/linux/crypto.h:20,
                    from include/crypto/hash.h:16,
                    from net/ipv4/tcp.c:250:
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:1002:2,
       inlined from 'sock_rps_record_flow' at include/net/sock.h:1025:4,
       inlined from 'tcp_splice_read' at net/ipv4/tcp.c:803:2:
>> include/linux/compiler.h:271:34: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                  ^~~~
   include/linux/compiler.h:277:22: note: in expansion of macro '__READ_ONCE'
     277 | #define READ_ONCE(x) __READ_ONCE(x, 1)
         |                      ^~~~~~~~~~~
   include/linux/netdevice.h:720:21: note: in expansion of macro 'READ_ONCE'
     720 |                 if (READ_ONCE(table->ents[index]) != val)
         |                     ^~~~~~~~~
   In file included from include/net/inet_sock.h:23,
                    from include/net/ip.h:31,
                    from include/linux/errqueue.h:6,
                    from net/ipv4/tcp.c:272:
   include/linux/netdevice.h: In function 'tcp_splice_read':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:1002:2,
       inlined from 'sock_rps_record_flow' at include/net/sock.h:1025:4,
       inlined from 'tcp_splice_read' at net/ipv4/tcp.c:803:2:
   include/linux/netdevice.h:720:42: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     720 |                 if (READ_ONCE(table->ents[index]) != val)
   include/linux/compiler.h:271:36: note: in definition of macro '__READ_ONCE'
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                    ^
   include/linux/netdevice.h:720:21: note: in expansion of macro 'READ_ONCE'
     720 |                 if (READ_ONCE(table->ents[index]) != val)
         |                     ^~~~~~~~~
   include/linux/netdevice.h: In function 'tcp_splice_read':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:1002:2,
       inlined from 'sock_rps_record_flow' at include/net/sock.h:1025:4,
       inlined from 'tcp_splice_read' at net/ipv4/tcp.c:803:2:
   include/linux/netdevice.h:721:47: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     721 |                         WRITE_ONCE(table->ents[index], val);
   include/linux/compiler.h:296:29: note: in definition of macro 'WRITE_ONCE'
     296 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
   include/linux/netdevice.h: In function 'tcp_splice_read':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:1002:2,
       inlined from 'sock_rps_record_flow' at include/net/sock.h:1025:4,
       inlined from 'tcp_zerocopy_receive' at net/ipv4/tcp.c:1791:2:
>> include/linux/compiler.h:271:34: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                  ^~~~
   include/linux/compiler.h:277:22: note: in expansion of macro '__READ_ONCE'
     277 | #define READ_ONCE(x) __READ_ONCE(x, 1)
         |                      ^~~~~~~~~~~
   include/linux/netdevice.h:720:21: note: in expansion of macro 'READ_ONCE'
     720 |                 if (READ_ONCE(table->ents[index]) != val)
         |                     ^~~~~~~~~
   include/linux/netdevice.h: In function 'tcp_zerocopy_receive':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:1002:2,
       inlined from 'sock_rps_record_flow' at include/net/sock.h:1025:4,
       inlined from 'tcp_zerocopy_receive' at net/ipv4/tcp.c:1791:2:
   include/linux/netdevice.h:720:42: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     720 |                 if (READ_ONCE(table->ents[index]) != val)
   include/linux/compiler.h:271:36: note: in definition of macro '__READ_ONCE'
     271 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                    ^
   include/linux/netdevice.h:720:21: note: in expansion of macro 'READ_ONCE'
     720 |                 if (READ_ONCE(table->ents[index]) != val)
         |                     ^~~~~~~~~
   include/linux/netdevice.h: In function 'tcp_zerocopy_receive':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:1002:2,
       inlined from 'sock_rps_record_flow' at include/net/sock.h:1025:4,
       inlined from 'tcp_zerocopy_receive' at net/ipv4/tcp.c:1791:2:
   include/linux/netdevice.h:721:47: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     721 |                         WRITE_ONCE(table->ents[index], val);
   include/linux/compiler.h:296:29: note: in definition of macro 'WRITE_ONCE'
     296 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
   include/linux/netdevice.h: In function 'tcp_zerocopy_receive':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
..


vim +271 include/linux/compiler.h

230fa253df6352 Christian Borntraeger 2014-11-25  266  
d976441f44bc5d Andrey Ryabinin       2015-10-19  267  #define __READ_ONCE(x, check)						\
d976441f44bc5d Andrey Ryabinin       2015-10-19  268  ({									\
d976441f44bc5d Andrey Ryabinin       2015-10-19  269  	union { typeof(x) __val; char __c[1]; } __u;			\
d976441f44bc5d Andrey Ryabinin       2015-10-19  270  	if (check)							\
d976441f44bc5d Andrey Ryabinin       2015-10-19 @271  		__read_once_size(&(x), __u.__c, sizeof(x));		\
d976441f44bc5d Andrey Ryabinin       2015-10-19  272  	else								\
d976441f44bc5d Andrey Ryabinin       2015-10-19  273  		__read_once_size_nocheck(&(x), __u.__c, sizeof(x));	\
76ebbe78f7390a Will Deacon           2017-10-24  274  	smp_read_barrier_depends(); /* Enforce dependency ordering from x */ \
d976441f44bc5d Andrey Ryabinin       2015-10-19  275  	__u.__val;							\
d976441f44bc5d Andrey Ryabinin       2015-10-19  276  })
d976441f44bc5d Andrey Ryabinin       2015-10-19  277  #define READ_ONCE(x) __READ_ONCE(x, 1)
d976441f44bc5d Andrey Ryabinin       2015-10-19  278  

:::::: The code at line 271 was first introduced by commit
:::::: d976441f44bc5d48635d081d277aa76556ffbf8b compiler, atomics, kasan: Provide READ_ONCE_NOCHECK()

:::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
