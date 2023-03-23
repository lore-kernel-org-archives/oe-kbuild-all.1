Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AA8F4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 12:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679574267; x=1711110267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbH2JvTnCHtQG4EAI4/6DYMLYUPv3W6FjJ9yr0pL6q4=;
  b=KdpK7anAqVKbNsWqIZt6hiVYugEFcAI5bmLIywHIq3IFoQ/x2Pewx3hJ
   lKi8p4DCgZArrj89GFltv5kYEbf8IbbNFHhB4NmJpX9YkfaXxzAEIvjki
   YMuWq5UxBHP59E5GLYlhWW2PYypD9ido0W7CbeGHRRwpz1lcYZowXxbHe
   0NHiDETdglvVVx/GrJF5b9X6exai4G9ni/ZtGh0DfKhBv8I4ApjKuf8C0
   l8Bq4dgAOME9EMuXzS3I2zJx/1JpkoNWeahporzlB0Yq6nTi9GwfhJ9qu
   9I9gqAcsrUdPLy5IfsxeIdrINd58BZBuXnXJt8IDA5S6y/C3AZfHxpmhv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327849738"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="327849738"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 05:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714766105"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714766105"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 05:24:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfJzU-000EKq-3B;
	Thu, 23 Mar 2023 12:24:24 +0000
Date: Thu, 23 Mar 2023 20:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:smp/core 9/13] ld:
 kernel/smp.o:include/trace/events/ipi.h:19: multiple definition of
 `__tracepoint_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19:
 first defined here
Message-ID: <202303232045.1ogTRwLK-lkp@intel.com>
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
commit: dac32ddd3c4f2d55f9df1d64a0a93993d10f6978 [9/13] treewide: Trace IPIs sent via smp_send_reschedule()
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230323/202303232045.1ogTRwLK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=dac32ddd3c4f2d55f9df1d64a0a93993d10f6978
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout dac32ddd3c4f2d55f9df1d64a0a93993d10f6978
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232045.1ogTRwLK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: kernel/smp.o:include/trace/events/ipi.h:19: multiple definition of `__tracepoint_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_raise':
>> smp.c:(.static_call.text+0x0): multiple definition of `__SCT__tp_func_ipi_raise'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xb0): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_raise':
>> kernel/smp.c:19: multiple definition of `__traceiter_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:38: multiple definition of `__tracepoint_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_send_cpumask':
>> smp.c:(.static_call.text+0x8): multiple definition of `__SCT__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xb8): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_send_cpumask':
>> kernel/smp.c:38: multiple definition of `__traceiter_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:86: multiple definition of `__tracepoint_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:86: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_entry':
>> smp.c:(.static_call.text+0x10): multiple definition of `__SCT__tp_func_ipi_entry'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xc0): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_entry':
>> kernel/smp.c:86: multiple definition of `__traceiter_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:86: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:102: multiple definition of `__tracepoint_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:102: first defined here
   ld: kernel/smp.o: in function `__SCT__tp_func_ipi_exit':
>> smp.c:(.static_call.text+0x18): multiple definition of `__SCT__tp_func_ipi_exit'; virt/kvm/kvm_main.o:kvm_main.c:(.static_call.text+0xc8): first defined here
   ld: kernel/smp.o: in function `__traceiter_ipi_exit':
>> kernel/smp.c:102: multiple definition of `__traceiter_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:102: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:102: multiple definition of `__SCK__tp_func_ipi_exit'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:102: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:86: multiple definition of `__SCK__tp_func_ipi_entry'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:86: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:38: multiple definition of `__SCK__tp_func_ipi_send_cpumask'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:38: first defined here
>> ld: kernel/smp.o:include/trace/events/ipi.h:19: multiple definition of `__SCK__tp_func_ipi_raise'; virt/kvm/kvm_main.o:include/trace/events/ipi.h:19: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
