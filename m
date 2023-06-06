Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB37F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 01:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686016602; x=1717552602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLqRZcJIavnXMfdCcwYC3n/syd0NHaeSPr+ljeRc4LY=;
  b=E8W0DV64ijx1mPu6n17rp54dvbcM0NWb01YKwschkMAole3ak6tmOA9v
   JCYiN/EnZlU1Sxr0Jmu4CXzjJha+YbKzBsyvW6cDN87yvgMw7ytZeUDo5
   qhJ76UD2Hrq0Cz9PoUwJ5nGaTzwdbM4Q+4UQsIETPcDUF2iYCkKT/rSpG
   V2jjsnBzk4TiNGRWNpkH3iMfdx/KDOasQi9wB7VqCGoVWiC1Z/lcIvEf9
   gZwcMofAIcby/o4bo1UApgyX3K9UV1DZ6c8L8DRC2xqO/wNsdeCYpPIH5
   11GqhUQu00wtktwPyFT0NK0FmPjHL6stJUZf5DBs/Sc2JXJnzYXjnYwPq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346133217"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="346133217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 18:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738574670"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="738574670"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 18:56:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Lw6-0004gt-1O;
	Tue, 06 Jun 2023 01:56:38 +0000
Date: Tue, 6 Jun 2023 09:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 41/42]
 include/trace/events/cros_net.h:118:3: warning: format specifies type 'int'
 but the argument has type 'size_t' (aka 'unsigned long')
Message-ID: <202306060923.udhfHcru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   2b9adb7e851879f7f7f393e4048aa739c3ee5028
commit: 6f4417e6fdbc3ce32575520d4fb5288f424b6a51 [41/42] CHROMIUM: add cros_net tp for inet send,rcv,accept
config: x86_64-randconfig-a002-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060923.udhfHcru-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 6f4417e6fdbc3ce32575520d4fb5288f424b6a51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060923.udhfHcru-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/af_inet.c:126:
   In file included from include/trace/events/cros_net.h:252:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:498:
   include/trace/events/cros_net.h:113:57: warning: invalid conversion specifier '-' [-Wformat-invalid-specifier]
                   "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
                                                                       ~~^
   include/trace/trace_events.h:319:33: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ^~~
   include/trace/define_trace.h:37:10: note: expanded from macro 'TRACE_EVENT_CONDITION'
                   PARAMS(print))
                          ^~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:80:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                       ^~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:464:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from net/ipv4/af_inet.c:126:
   In file included from include/trace/events/cros_net.h:252:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:498:
>> include/trace/events/cros_net.h:118:3: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                   __entry->bytes_sent,
                   ^~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:316:17: note: expanded from macro '__entry'
   #define __entry field
                   ^
   include/trace/trace_events.h:319:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                   ~~~       ^
   include/trace/define_trace.h:37:10: note: expanded from macro 'TRACE_EVENT_CONDITION'
                   PARAMS(print))
                   ~~~~~~~^~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:80:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:464:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from net/ipv4/af_inet.c:126:
   In file included from include/trace/events/cros_net.h:252:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:498:
   include/trace/events/cros_net.h:119:3: warning: data argument not used by format string [-Wformat-extra-args]
                   __entry->protocol
                   ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:316:17: note: expanded from macro '__entry'
   #define __entry field
                   ^
   include/trace/trace_events.h:319:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                             ^
   include/trace/define_trace.h:37:10: note: expanded from macro 'TRACE_EVENT_CONDITION'
                   PARAMS(print))
                   ~~~~~~~^~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:80:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:464:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from net/ipv4/af_inet.c:126:
   In file included from include/trace/events/cros_net.h:252:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:498:
   include/trace/events/cros_net.h:186:2: warning: invalid conversion specifier '\x0a' [-Wformat-invalid-specifier]
           TP_printk(
           ^~~~~~~~~~
   include/trace/trace_events.h:319:38: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                        ^
   include/trace/define_trace.h:37:10: note: expanded from macro 'TRACE_EVENT_CONDITION'
                   PARAMS(print))
                   ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:80:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:464:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from net/ipv4/af_inet.c:126:
   In file included from include/trace/events/cros_net.h:252:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:498:
   include/trace/events/cros_net.h:192:3: warning: data argument not used by format string [-Wformat-extra-args]
                   __entry->bytes_sent
                   ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:316:17: note: expanded from macro '__entry'
   #define __entry field
                   ^
   include/trace/trace_events.h:319:43: note: expanded from macro 'TP_printk'
   #define TP_printk(fmt, args...) fmt "\n", args
                                             ^
   include/trace/define_trace.h:37:10: note: expanded from macro 'TRACE_EVENT_CONDITION'
                   PARAMS(print))
                   ~~~~~~~^~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/trace/trace_events.h:80:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(print));                   \
                                ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^
   include/trace/trace_events.h:464:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
           trace_event_printf(iter, print);                                \
                                    ^~~~~
   In file included from net/ipv4/af_inet.c:126:
   In file included from include/trace/events/cros_net.h:252:


vim +118 include/trace/events/cros_net.h

    85	
    86	
    87	TRACE_EVENT_CONDITION(cros_inet_sendmsg_exit,
    88		/* The tracepoint signature matches the signature of inet_sendmsg with
    89		 * addition of the return value. This is done to match the expected
    90		 * signature of an fexit bpf program.
    91		 * This is done so that a BPF application can use the same
    92		 * handler for kernels that don't support fexit for ARM64 and those
    93		 * that do.
    94		 */
    95		TP_PROTO(struct socket *sock, struct msghdr *msg, size_t size, int rv),
    96		TP_ARGS(sock, msg, size, rv),
    97		TP_CONDITION(sock && sock->sk),
    98		TP_STRUCT__entry(
    99			__field(size_t, bytes_sent)
   100			__field(__u32, saddr4)
   101			__field(__u32, daddr4)
   102			__field(__u16, sport)
   103			__field(__u16, dport)
   104			__field(__u8, protocol)
   105		),
   106		TP_fast_assign(
   107			struct sock *sk = sock->sk;
   108	
   109			CROS_NET_FILL_ADDR_PORT(sk, __entry);
   110			__entry->bytes_sent = rv;
   111		),
   112		TP_printk(
   113			"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
   114			&__entry->saddr4,
   115			__entry->sport,
   116			&__entry->daddr4,
   117			__entry->dport,
 > 118			__entry->bytes_sent,
   119			__entry->protocol
   120			)
   121	);
   122	
   123	TRACE_EVENT_CONDITION(cros_inet_stream_connect_exit,
   124		/* The tracepoint signature matches the signature of inet_stream_connect
   125		 * with the addition of the return value. This is done to match the
   126		 * expected signature of an fexit bpf program.
   127		 * This is done so that a BPF application can use the same
   128		 * handler for kernels that don't support fexit for ARM64 and those
   129		 * that do.
   130		 */
   131		TP_PROTO(struct socket *sock, struct sockaddr *uaddr, int addr_len, int flags,
   132			int is_sendmsg,  int rv),
   133		TP_ARGS(sock, uaddr, addr_len, flags, is_sendmsg, rv),
   134		TP_CONDITION(sock && sock->sk),
   135		TP_STRUCT__entry(
   136			__field(int, is_sendmsg)
   137			__field(__u32, saddr4)
   138			__field(__u32, daddr4)
   139			__field(__u16, sport)
   140			__field(__u16, dport)
   141			__field(__u8, protocol)
   142		),
   143		TP_fast_assign(
   144			struct sock *sk = sock->sk;
   145	
   146			CROS_NET_FILL_ADDR_PORT(sk, __entry);
   147			__entry->is_sendmsg = is_sendmsg;
   148		),
   149		TP_printk(
   150			"informational_only_will_be_removed:%pi4:%d-%pi4:%d-prot:%d-issendmsg:%d",
   151			&__entry->saddr4,
   152			__entry->sport,
   153			&__entry->daddr4,
   154			__entry->dport,
   155			__entry->protocol,
   156			__entry->is_sendmsg
   157			)
   158	);
   159	
   160	TRACE_EVENT_CONDITION(cros_inet_sendpage_exit,
   161		/* The tracepoint signature matches the signature of inet_sendpage with
   162		 * addition of the return value. This is done to match the expected
   163		 * signature of an fexit bpf program.
   164		 * This is done so that a BPF application can use the same
   165		 * handler for kernels that don't support fexit for ARM64 and those
   166		 * that do.
   167		 */
   168		TP_PROTO(struct socket *sock, struct page *page, int offset, size_t size,
   169			int flags, int rv),
   170		TP_ARGS(sock, page, offset, size, flags, rv),
   171		TP_CONDITION(sock && sock->sk),
   172		TP_STRUCT__entry(
   173			__field(size_t, bytes_sent)
   174			__field(__u32, saddr4)
   175			__field(__u32, daddr4)
   176			__field(__u16, sport)
   177			__field(__u16, dport)
   178			__field(__u8, protocol)
   179		),
   180		TP_fast_assign(
   181			struct sock *sk = sock->sk;
   182	
   183			CROS_NET_FILL_ADDR_PORT(sk, __entry);
   184			__entry->bytes_sent = rv;
   185		),
   186		TP_printk(
   187			"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z",
   188			&__entry->saddr4,
   189			__entry->sport,
   190			&__entry->daddr4,
   191			__entry->dport,
   192			__entry->bytes_sent
   193			)
   194	);
   195	
   196	TRACE_EVENT_CONDITION(cros_inet_recvmsg_exit,
   197		/* The tracepoint signature matches the signature of inet_recvmsg with
   198		 * addition of the return value. This is done to match the expected
   199		 * signature of an fexit bpf program.
   200		 * This is done so that a BPF application can use the same
   201		 * handler for kernels that don't support fexit for ARM64 and those
   202		 * that do.
   203		 */
   204		TP_PROTO(struct socket *sock, struct msghdr *msg, size_t size, int flags, int rv),
   205		TP_ARGS(sock, msg, size, flags, rv),
   206		TP_CONDITION(sock && sock->sk),
   207		TP_STRUCT__entry(
   208			__field(size_t, bytes_sent)
   209			__field(__u32, saddr4)
   210			__field(__u32, daddr4)
   211			__field(__u16, sport)
   212			__field(__u16, dport)
   213			__field(__u8, protocol)
   214		),
   215		TP_fast_assign(
   216			struct sock *sk = sock->sk;
   217	
   218			CROS_NET_FILL_ADDR_PORT(sk, __entry);
   219			__entry->bytes_sent = rv;
   220		),
   221		TP_printk(
   222			"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
   223			&__entry->saddr4,
   224			__entry->sport,
   225			&__entry->daddr4,
   226			__entry->dport,
   227			__entry->bytes_sent,
   228			__entry->protocol
   229			)
   230	);
   231	
   232	TRACE_EVENT_CONDITION(cros_inet_release_enter,
   233		TP_PROTO(struct socket *sock),
   234		TP_ARGS(sock),
   235		TP_CONDITION(sock && sock->sk),
   236		TP_STRUCT__entry(
   237			__field(__u32, saddr4)
   238			__field(__u32, daddr4)
   239			__field(__u16, sport)
   240			__field(__u16, dport)
   241			__field(__u8, protocol)
   242		),
   243		TP_fast_assign(
   244			struct sock *sk = sock->sk;
   245	
   246			CROS_NET_FILL_ADDR_PORT(sk, __entry);
   247		),
   248		TP_printk("informational_only_will_be_removed:%pI4:%d-%pI4:%d",
   249		&__entry->saddr4, __entry->sport, &__entry->daddr4, __entry->dport));
   250	#endif // _TRACE_CROS_NET_H
   251	/* This part must be outside protection */
 > 252	#include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
