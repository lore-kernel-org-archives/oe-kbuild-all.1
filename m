Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4D19F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679569393; x=1711105393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jdz9MVVOlSLWdIwcpS/YrzXuILX+gLwbdbQbGVg9p3M=;
  b=Ay3yCoDLWQY7jjantLgIOJLD6P1taPyoj4UNgcP8k9SgmJfaGjGFND+I
   isMOkDEtvi4Zlct8WDNKE+CN1hu7/NQxJULeZPd5ql+tDxqXTCmEV56S8
   EJ8cOstcrCTFum+wjPT8ACMsK6QnMwbwTkbYxmzupKawPah5pOBkz2SO8
   lVp4TUnFMZpgaElKzfaldPX08dwj/8c1wlh/SB6RRRN97OA9tb1uz1FBQ
   IcIvdq3QJkC9m8JTK5bvTHuT356Fhmbd88+GQwdufHaBYrdMQYHNnzWDZ
   2L3AdW1QhbgY/zul9dRtbC8PHbOGH9KKgGTeKLE1Ka8r9hrTnw64++ZH8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340994873"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340994873"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 04:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746675383"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746675383"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 04:02:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfIi6-000EGc-0s;
	Thu, 23 Mar 2023 11:02:22 +0000
Date: Thu, 23 Mar 2023 19:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:smp/core 12/13] include/trace/events/ipi.h:38:
 undefined reference to `__tracepoint_ipi_send_cpu'
Message-ID: <202303231849.D5T2Jhti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   965abfc95e362b8650b49b61c33de7e7691094c6
commit: 07c7eb9a6b5b84820a50dcab63bbbb18dbbaa5bb [12/13] trace: Add trace_ipi_send_cpu()
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230323/202303231849.D5T2Jhti-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=07c7eb9a6b5b84820a50dcab63bbbb18dbbaa5bb
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout 07c7eb9a6b5b84820a50dcab63bbbb18dbbaa5bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231849.D5T2Jhti-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `trace_ipi_send_cpu':
>> include/trace/events/ipi.h:38: undefined reference to `__tracepoint_ipi_send_cpu'
>> ld: include/trace/events/ipi.h:38: undefined reference to `__tracepoint_ipi_send_cpu'
>> ld: include/trace/events/ipi.h:38: undefined reference to `__tracepoint_ipi_send_cpu'
>> ld: include/trace/events/ipi.h:38: undefined reference to `__SCT__tp_func_ipi_send_cpu'
>> ld: vmlinux.o:(__jump_table+0x2438): undefined reference to `__tracepoint_ipi_send_cpu'
   ld: vmlinux.o:(__jump_table+0x2448): undefined reference to `__tracepoint_ipi_send_cpu'
>> ld: vmlinux.o:(.static_call_sites+0x61c): undefined reference to `__SCK__tp_func_ipi_send_cpu'


vim +38 include/trace/events/ipi.h

    37	
  > 38	TRACE_EVENT(ipi_send_cpu,
    39	
    40		TP_PROTO(const unsigned int cpu, unsigned long callsite, void *callback),
    41	
    42		TP_ARGS(cpu, callsite, callback),
    43	
    44		TP_STRUCT__entry(
    45			__field(unsigned int, cpu)
    46			__field(void *, callsite)
    47			__field(void *, callback)
    48		),
    49	
    50		TP_fast_assign(
    51			__entry->cpu = cpu;
    52			__entry->callsite = (void *)callsite;
    53			__entry->callback = callback;
    54		),
    55	
    56		TP_printk("cpu=%u callsite=%pS callback=%pS",
    57			  __entry->cpu, __entry->callsite, __entry->callback)
    58	);
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
