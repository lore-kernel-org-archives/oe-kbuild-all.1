Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFAC944E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679581651; x=1711117651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRKpmIOGveoZ4OId1aWugqcgxgKXG+CxOJPSLzAIcbk=;
  b=mgIYFWlUEBgeduGYzcjfQaCsjdRHQv0NtJTeNbu3b/VZFKIsgQRP29pl
   u9P0D/+hS26PoKqmU/m/+aB59nWWN0lPS3Oz86wsPoyieYDrsbLkWa9RM
   w9D6eM3J8KE4fulXKHFIaQUH53FfgqfYaVDYUJPgj44txZ/c5twF2UfB0
   kUbLHTmIReRvzqCYZ9axy17RuWN/xS5ShgWmR74/bxL1P7bt3fs+kP5wB
   g7QAqsPY2s8/NAGMlXrXkVk8PDJY4hSocuurX3aJXjdjEGcxs5UCpLNCh
   crgqDMLukRGm5DWixIE/jXRWbDcJfLT8viuDQBVYx+Bp588vDFIlqXCAV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323363648"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="323363648"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 07:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714829276"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="714829276"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 07:27:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfLua-000ERc-2t;
	Thu, 23 Mar 2023 14:27:28 +0000
Date: Thu, 23 Mar 2023 22:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:smp/core 12/13] ld:
 kernel/smp.o:include/trace/events/ipi.h:38: multiple definition of
 `__tracepoint_ipi_send_cpu';
 virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
Message-ID: <202303232231.sfIJ9ayv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   6ce99af1c9685e7dd788092089a03e75612bd6ed
commit: 07c7eb9a6b5b84820a50dcab63bbbb18dbbaa5bb [12/13] trace: Add trace_ipi_send_cpu()
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230323/202303232231.sfIJ9ayv-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303232231.sfIJ9ayv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/smp.o:include/trace/events/ipi.h:19: multiple definition of `__tracepoint_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_raise':
   smp.c:(.static_call.text+0x0): multiple definition of `__SCT__tp_func_ipi_raise'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xb0): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_raise':
   include/trace/events/ipi.h:19: multiple definition of `__traceiter_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:38: multiple definition of `__tracepoint_ipi_send_cpu'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_send_cpu':
>> smp.c:(.static_call.text+0x8): multiple definition of `__SCT__tp_func_ipi_send_cpu'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xb8): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_send_cpu':
>> include/trace/events/ipi.h:38: multiple definition of `__traceiter_ipi_send_cpu'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:60: multiple definition of `__tracepoint_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:60: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_send_cpumask':
   smp.c:(.static_call.text+0x10): multiple definition of `__SCT__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xc0): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_send_cpumask':
   include/trace/events/ipi.h:60: multiple definition of `__traceiter_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:60: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:108: multiple definition of `__tracepoint_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:108: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_entry':
   smp.c:(.static_call.text+0x18): multiple definition of `__SCT__tp_func_ipi_entry'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xc8): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_entry':
   include/trace/events/ipi.h:108: multiple definition of `__traceiter_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:108: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:124: multiple definition of `__tracepoint_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:124: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_exit':
   smp.c:(.static_call.text+0x20): multiple definition of `__SCT__tp_func_ipi_exit'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xd0): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_exit':
   include/trace/events/ipi.h:124: multiple definition of `__traceiter_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:124: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:124: multiple definition of `__SCK__tp_func_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:124: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:108: multiple definition of `__SCK__tp_func_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:108: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:60: multiple definition of `__SCK__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:60: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:38: multiple definition of `__SCK__tp_func_ipi_send_cpu'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
   ld: kernel/smp.o:include/trace/events/ipi.h:19: multiple definition of `__SCK__tp_func_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
