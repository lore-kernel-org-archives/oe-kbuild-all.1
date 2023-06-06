Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E17F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 01:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686014100; x=1717550100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xIbngSTk3+CT0oO6bWAM/lfhn/1xbP0vTBA15KsMUjQ=;
  b=gxKUEhZ00h+Y9ACRVU8jiAIdoLkImDHsnM2JmZ3Xz1nv17bareg0/aly
   DI0WPuRAbfVkTBXt4xU/W687FlMRZG2CriTq5hsTZide11lgwJ48amT0w
   /Ueti45vHm55ypSRxbwkvKrPW5vBwhyaKmid5J42aoKK3FxhBlU9qNa+I
   1QD6l1XDfUW/92Xs9DhAj5fPx6I7htyiVcxJLcAhBNvnWjGqvTlymvuEu
   tBXXoNwqbolAXuczUnQ2/OXc+fT1VmJfoB8o7yIKfwdJCP/cINucZ0vFj
   J9Ww8VGU2LA/CBn6QfxxSywBW1tQBsUqpU/UQyPJ/519JeMaPYjWZdKyp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356535684"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="356535684"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 18:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712005885"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="712005885"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2023 18:13:36 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6LGS-0004dm-0Q;
	Tue, 06 Jun 2023 01:13:36 +0000
Date: Tue, 6 Jun 2023 09:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 41/42]
 include/trace/events/cros_net.h:113:17: warning: format '%d' expects
 argument of type 'int', but argument 7 has type 'size_t' {aka 'long unsigned
 int'}
Message-ID: <202306060907.qFfzTDiH-lkp@intel.com>
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
config: x86_64-randconfig-r021-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060907.qFfzTDiH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 6f4417e6fdbc3ce32575520d4fb5288f424b6a51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060907.qFfzTDiH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/cros_net.h:252,
                    from net/ipv4/af_inet.c:126:
   include/trace/events/cros_net.h: In function 'trace_raw_output_cros_inet_sendmsg_exit':
   include/trace/events/cros_net.h:113:17: warning: unknown conversion type character '-' in format [-Wformat=]
     113 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:464:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     464 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/define_trace.h:32:9: note: in expansion of macro 'TRACE_EVENT'
      32 |         TRACE_EVENT(name,                                               \
         |         ^~~~~~~~~~~
   include/trace/define_trace.h:37:17: note: in expansion of macro 'PARAMS'
      37 |                 PARAMS(print))
         |                 ^~~~~~
   include/trace/events/cros_net.h:87:1: note: in expansion of macro 'TRACE_EVENT_CONDITION'
      87 | TRACE_EVENT_CONDITION(cros_inet_sendmsg_exit,
         | ^~~~~~~~~~~~~~~~~~~~~
   include/trace/events/cros_net.h:112:9: note: in expansion of macro 'TP_printk'
     112 |         TP_printk(
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:498:
   include/trace/events/cros_net.h:113:71: note: format string is defined here
     113 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
         |                                                                       ^
>> include/trace/events/cros_net.h:113:17: warning: format '%d' expects argument of type 'int', but argument 7 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     113 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:464:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     464 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/define_trace.h:32:9: note: in expansion of macro 'TRACE_EVENT'
      32 |         TRACE_EVENT(name,                                               \
         |         ^~~~~~~~~~~
   include/trace/define_trace.h:37:17: note: in expansion of macro 'PARAMS'
      37 |                 PARAMS(print))
         |                 ^~~~~~
   include/trace/events/cros_net.h:87:1: note: in expansion of macro 'TRACE_EVENT_CONDITION'
      87 | TRACE_EVENT_CONDITION(cros_inet_sendmsg_exit,
         | ^~~~~~~~~~~~~~~~~~~~~
   include/trace/events/cros_net.h:112:9: note: in expansion of macro 'TP_printk'
     112 |         TP_printk(
         |         ^~~~~~~~~
   include/trace/events/cros_net.h:113:78: note: format string is defined here
     113 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
         |                                                                             ~^
         |                                                                              |
         |                                                                              int
         |                                                                             %ld
   include/trace/events/cros_net.h:113:17: warning: too many arguments for format [-Wformat-extra-args]
     113 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:464:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     464 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/define_trace.h:32:9: note: in expansion of macro 'TRACE_EVENT'
      32 |         TRACE_EVENT(name,                                               \
         |         ^~~~~~~~~~~
   include/trace/define_trace.h:37:17: note: in expansion of macro 'PARAMS'
      37 |                 PARAMS(print))
         |                 ^~~~~~
   include/trace/events/cros_net.h:87:1: note: in expansion of macro 'TRACE_EVENT_CONDITION'
      87 | TRACE_EVENT_CONDITION(cros_inet_sendmsg_exit,
         | ^~~~~~~~~~~~~~~~~~~~~
   include/trace/events/cros_net.h:112:9: note: in expansion of macro 'TP_printk'
     112 |         TP_printk(
         |         ^~~~~~~~~
   include/trace/events/cros_net.h: In function 'trace_raw_output_cros_inet_sendpage_exit':
   include/trace/events/cros_net.h:187:17: warning: unknown conversion type character '\x0a' in format [-Wformat=]
     187 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:464:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     464 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/define_trace.h:32:9: note: in expansion of macro 'TRACE_EVENT'
      32 |         TRACE_EVENT(name,                                               \
         |         ^~~~~~~~~~~
   include/trace/define_trace.h:37:17: note: in expansion of macro 'PARAMS'
      37 |                 PARAMS(print))
         |                 ^~~~~~
   include/trace/events/cros_net.h:160:1: note: in expansion of macro 'TRACE_EVENT_CONDITION'
     160 | TRACE_EVENT_CONDITION(cros_inet_sendpage_exit,
         | ^~~~~~~~~~~~~~~~~~~~~
   include/trace/events/cros_net.h:186:9: note: in expansion of macro 'TP_printk'
     186 |         TP_printk(
         |         ^~~~~~~~~
   include/trace/events/cros_net.h:187:71: note: format string is defined here
     187 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z",
         |                                                                       ^
   include/trace/events/cros_net.h:187:17: warning: too many arguments for format [-Wformat-extra-args]
     187 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:464:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     464 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:80:30: note: in expansion of macro 'PARAMS'
      80 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/define_trace.h:32:9: note: in expansion of macro 'TRACE_EVENT'
      32 |         TRACE_EVENT(name,                                               \
         |         ^~~~~~~~~~~
   include/trace/define_trace.h:37:17: note: in expansion of macro 'PARAMS'
      37 |                 PARAMS(print))
         |                 ^~~~~~
   include/trace/events/cros_net.h:160:1: note: in expansion of macro 'TRACE_EVENT_CONDITION'
     160 | TRACE_EVENT_CONDITION(cros_inet_sendpage_exit,
         | ^~~~~~~~~~~~~~~~~~~~~
   include/trace/events/cros_net.h:186:9: note: in expansion of macro 'TP_printk'
     186 |         TP_printk(
         |         ^~~~~~~~~
   include/trace/events/cros_net.h: In function 'trace_raw_output_cros_inet_recvmsg_exit':
   include/trace/events/cros_net.h:222:17: warning: unknown conversion type character '-' in format [-Wformat=]
     222 |                 "informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:464:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     464 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~


vim +113 include/trace/events/cros_net.h

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
 > 113			"informational_only_will_be_removed:%pi4:%d-%pi4:%d-%z-prot:%d",
   114			&__entry->saddr4,
   115			__entry->sport,
   116			&__entry->daddr4,
   117			__entry->dport,
   118			__entry->bytes_sent,
   119			__entry->protocol
   120			)
   121	);
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
