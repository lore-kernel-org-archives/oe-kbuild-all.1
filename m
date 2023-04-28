Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DED883B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 23:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682726090; x=1714262090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTVTSC0LAkWhPRPG87+U/8YkDhKis4mCiXYyTR78US8=;
  b=jr8tmqzDt5Hqvg6w1Of9P6Eh3RnVdKkWY6IHHTYlRWDZlbFxV2mf+o9d
   aMflREU4I9nXEXOhHuayL8EHriFpLJiM/zP4lvFxMcLc3tBPR6yC+yRzw
   5nsvmgaAq0tp5WySd5or4m8W2qgJ5JCLlle+Dn4BfqpAgtlztFbbkSTKN
   bpLMvvzFSdsMP45Doe2qqJ9u+cQ3ObveBI+qwdjH+YY/AZYDQDnqtgJ8K
   ov/E1f5iF7Qrxtj9eepOPAEzlAjYmwX2kG/ZrJRxp0ASG8akEhGmaAHAD
   Hu3eYvC1ZkU/llLuo2RRI0hBjCBixqxLcwe2yXkdS8T3wATXGw/98AAfJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="327503361"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="327503361"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 16:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="806586503"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="806586503"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2023 16:54:48 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psXvL-0000lB-1D;
	Fri, 28 Apr 2023 23:54:47 +0000
Date: Sat, 29 Apr 2023 07:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Ahern <dsahern@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dsahern:enfab-6.3 9/10] include/trace/events/tcp.h:204:32: warning:
 cast from pointer to integer of different size
Message-ID: <202304290704.P7HpXrg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dsahern/linux enfab-6.3
head:   a036626ebabac8cfa59cb5f2a4306b20e4006af6
commit: af562ba17b291baad23eb4209013590aa18155ea [9/10] tcp: Add tracepoints to tcp_write_xmit and tcp_sendmsg_locked
config: arc-randconfig-r001-20230428 (https://download.01.org/0day-ci/archive/20230429/202304290704.P7HpXrg7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dsahern/linux/commit/af562ba17b291baad23eb4209013590aa18155ea
        git remote add dsahern https://github.com/dsahern/linux
        git fetch --no-tags dsahern enfab-6.3
        git checkout af562ba17b291baad23eb4209013590aa18155ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290704.P7HpXrg7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/tcp.h:479,
                    from net/core/net-traces.c:35:
   include/trace/events/tcp.h: In function 'trace_event_raw_event_tcp_sendmsg_locked':
>> include/trace/events/tcp.h:204:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     204 |                 __entry->skb = (__u64)skb;
         |                                ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/tcp.h:190:1: note: in expansion of macro 'TRACE_EVENT'
     190 | TRACE_EVENT(tcp_sendmsg_locked,
         | ^~~~~~~~~~~
   include/trace/events/tcp.h:203:9: note: in expansion of macro 'TP_fast_assign'
     203 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   include/trace/events/tcp.h: In function 'perf_trace_tcp_sendmsg_locked':
>> include/trace/events/tcp.h:204:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     204 |                 __entry->skb = (__u64)skb;
         |                                ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/tcp.h:190:1: note: in expansion of macro 'TRACE_EVENT'
     190 | TRACE_EVENT(tcp_sendmsg_locked,
         | ^~~~~~~~~~~
   include/trace/events/tcp.h:203:9: note: in expansion of macro 'TP_fast_assign'
     203 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/neigh.h:255,
                    from net/core/net-traces.c:51:
   include/trace/events/neigh.h: In function 'trace_event_raw_event_neigh_create':
   include/trace/events/neigh.h:42:34: warning: variable 'pin6' set but not used [-Wunused-but-set-variable]
      42 |                 struct in6_addr *pin6;
         |                                  ^~~~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/neigh.h:23:1: note: in expansion of macro 'TRACE_EVENT'
      23 | TRACE_EVENT(neigh_create,
         | ^~~~~~~~~~~
   include/trace/events/neigh.h:41:9: note: in expansion of macro 'TP_fast_assign'
      41 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   include/trace/events/neigh.h: In function 'perf_trace_neigh_create':
   include/trace/events/neigh.h:42:34: warning: variable 'pin6' set but not used [-Wunused-but-set-variable]
      42 |                 struct in6_addr *pin6;
         |                                  ^~~~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/neigh.h:23:1: note: in expansion of macro 'TRACE_EVENT'
      23 | TRACE_EVENT(neigh_create,
         | ^~~~~~~~~~~
   include/trace/events/neigh.h:41:9: note: in expansion of macro 'TP_fast_assign'
      41 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +204 include/trace/events/tcp.h

   191	
   192		TP_PROTO(struct msghdr *msg, struct sk_buff *skb, int size_goal),
   193	
   194		TP_ARGS(msg, skb, size_goal),
   195	
   196		TP_STRUCT__entry(
   197			__field(__u64, skb)
   198			__field(int, skb_len)
   199			__field(int, msg_left)
   200			__field(int, size_goal)
   201		),
   202	
   203		TP_fast_assign(
 > 204			__entry->skb = (__u64)skb;
   205			__entry->skb_len = skb ? skb->len : 0;
   206			__entry->msg_left = msg_data_left(msg);
   207			__entry->size_goal = size_goal;
   208		),
   209	
   210		TP_printk("skb %llx len %d msg_left %d size_goal %d",
   211			  __entry->skb, __entry->skb_len,
   212			  __entry->msg_left, __entry->size_goal)
   213	);
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
