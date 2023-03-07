Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6301220EE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678173722; x=1709709722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SPoeZWWUQHtpWylxmdFy9x36jS7KGshFGL27vK8Q47Q=;
  b=SKZE3vmHgheoKgjElxXMM1gpkAGUEYmFIztN4tYA6sNDtfQ3gsgtDwK5
   MU2NlQtpkAXbOTxjCUoAxEhwFp0MzL7dZfLmY3iGpdl3z06sGrg7ubE8k
   rETQm24+nipl1RkR1aNToO0sgbFqmNQfbJdsEgrBimopsfjVF1PBKKgtr
   X+yAtE3KSMkv3qVVnE/wULqNkkta3jZ5VhYHQ/PqR9Xx8+mhA0IeVC/ZX
   AAMBvYWxScCyIcM2pq7uPrDfj9VLn3HSKOtTIBlFX4e96JKhYaGauowj3
   J0HS/RfPQ7i1UC5yfg9BC/5z20bgmFu1Gvs4jO2N5yby3UenApvbF0+hu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316184245"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="316184245"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 23:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786584585"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="786584585"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 23:22:00 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZRdy-00015d-34;
	Tue, 07 Mar 2023 07:21:54 +0000
Date: Tue, 7 Mar 2023 15:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfsd-next 8/9] fs/lockd/./trace.h:19:19: error:
 'NLM_DEADLCK' undeclared; did you mean 'NLM_F_ACK'?
Message-ID: <202303071503.shUSoIpC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-next
head:   851e44837d2123fcf5e5d4b71bee5680d7f3f28b
commit: 92d9eba92bb3bb721b24f7e2e9df347cedc82df2 [8/9] lockd: add some client-side tracepoints
config: microblaze-randconfig-r033-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071503.shUSoIpC-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=92d9eba92bb3bb721b24f7e2e9df347cedc82df2
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton nfsd-next
        git checkout 92d9eba92bb3bb721b24f7e2e9df347cedc82df2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071503.shUSoIpC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/lockd/trace.h:72,
                    from fs/lockd/trace.c:3:
   fs/lockd/./trace.h: In function 'trace_raw_output_nlmclnt_event':
>> fs/lockd/./trace.h:19:19: error: 'NLM_DEADLCK' undeclared (first use in this function); did you mean 'NLM_F_ACK'?
      19 |                 { NLM_DEADLCK,                  "DEADLCK" },                    \
         |                   ^~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/lockd/./trace.h:51:17: note: in expansion of macro 'TP_printk'
      51 |                 TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
         |                 ^~~~~~~~~
   fs/lockd/./trace.h:13:9: note: in expansion of macro '__print_symbolic'
      13 |         __print_symbolic(val,                                                   \
         |         ^~~~~~~~~~~~~~~~
   fs/lockd/./trace.h:54:25: note: in expansion of macro 'show_nlm_status'
      54 |                         show_nlm_status(__entry->status)
         |                         ^~~~~~~~~~~~~~~
   fs/lockd/./trace.h:19:19: note: each undeclared identifier is reported only once for each function it appears in
      19 |                 { NLM_DEADLCK,                  "DEADLCK" },                    \
         |                   ^~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/lockd/./trace.h:51:17: note: in expansion of macro 'TP_printk'
      51 |                 TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
         |                 ^~~~~~~~~
   fs/lockd/./trace.h:13:9: note: in expansion of macro '__print_symbolic'
      13 |         __print_symbolic(val,                                                   \
         |         ^~~~~~~~~~~~~~~~
   fs/lockd/./trace.h:54:25: note: in expansion of macro 'show_nlm_status'
      54 |                         show_nlm_status(__entry->status)
         |                         ^~~~~~~~~~~~~~~
>> fs/lockd/./trace.h:20:19: error: 'NLM_ROFS' undeclared (first use in this function)
      20 |                 { NLM_ROFS,                     "ROFS" },                       \
         |                   ^~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/lockd/./trace.h:51:17: note: in expansion of macro 'TP_printk'
      51 |                 TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
         |                 ^~~~~~~~~
   fs/lockd/./trace.h:13:9: note: in expansion of macro '__print_symbolic'
      13 |         __print_symbolic(val,                                                   \
         |         ^~~~~~~~~~~~~~~~
   fs/lockd/./trace.h:54:25: note: in expansion of macro 'show_nlm_status'
      54 |                         show_nlm_status(__entry->status)
         |                         ^~~~~~~~~~~~~~~
>> fs/lockd/./trace.h:21:19: error: 'NLM_STALE_FH' undeclared (first use in this function)
      21 |                 { NLM_STALE_FH,                 "STALE_FH" },                   \
         |                   ^~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/lockd/./trace.h:51:17: note: in expansion of macro 'TP_printk'
      51 |                 TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
         |                 ^~~~~~~~~
   fs/lockd/./trace.h:13:9: note: in expansion of macro '__print_symbolic'
      13 |         __print_symbolic(val,                                                   \
         |         ^~~~~~~~~~~~~~~~
   fs/lockd/./trace.h:54:25: note: in expansion of macro 'show_nlm_status'
      54 |                         show_nlm_status(__entry->status)
         |                         ^~~~~~~~~~~~~~~
>> fs/lockd/./trace.h:22:19: error: 'NLM_FBIG' undeclared (first use in this function)
      22 |                 { NLM_FBIG,                     "FBIG" },                       \
         |                   ^~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/lockd/./trace.h:51:17: note: in expansion of macro 'TP_printk'
      51 |                 TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
         |                 ^~~~~~~~~
   fs/lockd/./trace.h:13:9: note: in expansion of macro '__print_symbolic'
      13 |         __print_symbolic(val,                                                   \
         |         ^~~~~~~~~~~~~~~~
   fs/lockd/./trace.h:54:25: note: in expansion of macro 'show_nlm_status'
      54 |                         show_nlm_status(__entry->status)
         |                         ^~~~~~~~~~~~~~~
>> fs/lockd/./trace.h:23:19: error: 'NLM_FAILED' undeclared (first use in this function); did you mean 'NUD_FAILED'?
      23 |                 { NLM_FAILED,                   "FAILED" })
         |                   ^~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/lockd/./trace.h:51:17: note: in expansion of macro 'TP_printk'
      51 |                 TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
         |                 ^~~~~~~~~
   fs/lockd/./trace.h:13:9: note: in expansion of macro '__print_symbolic'
      13 |         __print_symbolic(val,                                                   \
         |         ^~~~~~~~~~~~~~~~
   fs/lockd/./trace.h:54:25: note: in expansion of macro 'show_nlm_status'
      54 |                         show_nlm_status(__entry->status)
         |                         ^~~~~~~~~~~~~~~


vim +19 fs/lockd/./trace.h

    11	
    12	#define show_nlm_status(val)							\
    13		__print_symbolic(val,							\
    14			{ NLM_LCK_GRANTED,		"LCK_GRANTED" },		\
    15			{ NLM_LCK_DENIED,		"LCK_DENIED" },			\
    16			{ NLM_LCK_DENIED_NOLOCKS,	"LCK_DENIED_NOLOCKS" },		\
    17			{ NLM_LCK_BLOCKED,		"LCK_BLOCKED" },		\
    18			{ NLM_LCK_DENIED_GRACE_PERIOD,	"LCK_DENIED_GRACE_PERIOD" },	\
  > 19			{ NLM_DEADLCK,			"DEADLCK" },			\
  > 20			{ NLM_ROFS,			"ROFS" },			\
  > 21			{ NLM_STALE_FH,			"STALE_FH" },			\
  > 22			{ NLM_FBIG,			"FBIG" },			\
  > 23			{ NLM_FAILED,			"FAILED" })
    24	
    25	DECLARE_EVENT_CLASS(nlmclnt_event,
    26			TP_PROTO(
    27				const struct nlm_rqst *req
    28			),
    29	
    30			TP_ARGS(req),
    31	
    32			TP_STRUCT__entry(
    33				__field(u64, start)
    34				__field(u64, len)
    35				__field(u32, status)
    36				__field(u32, oh)
    37				__field(u32, svid)
    38				__sockaddr(host, req->a_host->h_addrlen)
    39			),
    40	
    41			TP_fast_assign(
    42				__entry->start = req->a_args.lock.lock_start;
    43				__entry->len = req->a_args.lock.lock_len;
    44				__entry->status = be32_to_cpu(req->a_res.status);
    45				__entry->oh = ~crc32_le(0xffffffff, req->a_args.lock.oh.data,
    46								req->a_args.lock.oh.len);
    47				__entry->svid = req->a_args.lock.svid;
    48				__assign_sockaddr(host, &req->a_host->h_addr, req->a_host->h_addrlen);
    49			),
    50	
  > 51			TP_printk("addr=%pISpc oh=%x svid=%x start=%llu len=%llu status=%s",
    52				__get_sockaddr(host), __entry->oh, __entry->svid,
    53				__entry->start, __entry->len,
    54				show_nlm_status(__entry->status)
    55			)
    56	);
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
