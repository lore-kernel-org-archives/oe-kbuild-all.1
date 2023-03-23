Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BABDA93A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679585982; x=1711121982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kk1T3IDAdWWQqyZ3FkeO9SRgEK4xWJm0ohKktttBU3Q=;
  b=MQ4jh7IZpQ2SG3kk99vT7rAygdchBF2RBsKvrKX4zFJmPc5nGjZcAO5R
   WtuVBxn0xV9U+I6+NPrMH8ZZYrLuUUX2/2swYo3Uu/X5WeAwBUeyug0K6
   0IoFF+YGIX2cW0VNpfpJUE345YP86zIW78VDZPG3cSUlx7U56D+Fjpiky
   Q3d3wsrhRWBg1YwcoLty5Nv99XKRFjy56WHBoykXbaRThokudt++Ycp/A
   nwNbMthYdaezhVGYrdpgIhc0cHSHeOXSFlfba6JNMLVD4xahubJofvzAI
   WvwzbDr1+/6NWMc0F4qrt+jsp6mjG5oMukGakVD4CwL+7kloyLG8wLwUM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339561607"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="339561607"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 08:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682356138"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="682356138"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 08:39:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfN2J-000EUS-2G;
	Thu, 23 Mar 2023 15:39:31 +0000
Date: Thu, 23 Mar 2023 23:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:smp/core 9/13] ld:
 kernel/sched/core.o:include/trace/events/ipi.h:19: multiple definition of
 `__tracepoint_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19:
 first defined here
Message-ID: <202303232305.BrfyAphp-lkp@intel.com>
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
commit: c94ad1090c166d4fc7e61a6d03925cb6b4b4b001 [9/13] treewide: Trace IPIs sent via smp_send_reschedule()
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230323/202303232305.BrfyAphp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=c94ad1090c166d4fc7e61a6d03925cb6b4b4b001
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout c94ad1090c166d4fc7e61a6d03925cb6b4b4b001
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232305.BrfyAphp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: kernel/sched/core.o:include/trace/events/ipi.h:19: multiple definition of `__tracepoint_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here
   ld: kernel/sched/core.o: in function `__SCT__tp_func_ipi_raise':
   core.c:(.static_call.text+0x130): multiple definition of `__SCT__tp_func_ipi_raise'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xb0): first defined here
   ld: kernel/sched/core.o: in function `__traceiter_ipi_raise':
>> include/trace/events/ipi.h:19: multiple definition of `__traceiter_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:38: multiple definition of `__tracepoint_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
   ld: kernel/sched/core.o: in function `__SCT__tp_func_ipi_send_cpumask':
   core.c:(.static_call.text+0x138): multiple definition of `__SCT__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xb8): first defined here
   ld: kernel/sched/core.o: in function `__traceiter_ipi_send_cpumask':
>> include/trace/events/ipi.h:38: multiple definition of `__traceiter_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:86: multiple definition of `__tracepoint_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:86: first defined here
   ld: kernel/sched/core.o: in function `__SCT__tp_func_ipi_entry':
   core.c:(.static_call.text+0x140): multiple definition of `__SCT__tp_func_ipi_entry'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xc0): first defined here
   ld: kernel/sched/core.o: in function `__traceiter_ipi_entry':
>> include/trace/events/ipi.h:86: multiple definition of `__traceiter_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:86: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:102: multiple definition of `__tracepoint_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:102: first defined here
   ld: kernel/sched/core.o: in function `__SCT__tp_func_ipi_exit':
   core.c:(.static_call.text+0x148): multiple definition of `__SCT__tp_func_ipi_exit'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xc8): first defined here
   ld: kernel/sched/core.o: in function `__traceiter_ipi_exit':
>> include/trace/events/ipi.h:102: multiple definition of `__traceiter_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:102: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:102: multiple definition of `__SCK__tp_func_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:102: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:86: multiple definition of `__SCK__tp_func_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:86: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:38: multiple definition of `__SCK__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
>> ld: kernel/sched/core.o:include/trace/events/ipi.h:19: multiple definition of `__SCK__tp_func_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
