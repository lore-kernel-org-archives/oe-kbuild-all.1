Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6617AD4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685462147; x=1716998147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfV0bZkWChaXe8bp4fbMZk/ohc3rYpv8mkdD7Vp9QG0=;
  b=UfagrZ+/pCVgl73psI0WDNtvtrEHUE1gzXJjM9w5KHihyYI81jkOST1e
   /ws+wdj1s/EgZeTnFeG1wY2T4AgV3DC5AQ33XltxkSsL27nGsjvWJ7ZX/
   G4khm0aQmefq6ohLoR4NkeutIhT5H114727xPShhdUg+7fYRnGPPSYjw2
   sMiCTzvu6tJcxkYVtE3f9BHX8X5KTypHjyccnOSda8pSk3xkmsqSwuvx9
   Bf7GxY8r+DbNDNdWU31IwLzqgbsaNM1e61z5+DnMILavTH2l6kmPXcT+t
   F8XZmqF/Y1xqIaxb7qHovkxQ49tRNUDoLzKwVtbyik/nZYK4/EjwGp5m/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="339548604"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="339548604"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 08:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="656923475"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="656923475"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 May 2023 08:55:30 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q41h3-0000el-0P;
	Tue, 30 May 2023 15:55:29 +0000
Date: Tue, 30 May 2023 23:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] kernel/sched/sched.h:1204:
 undefined reference to `clock_task_mult'
Message-ID: <202305302301.524I0mrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   40259b07af18a32a176706341075482aa23d3515
commit: 4e709a85e578d28a2626832c4f2cf5e9031d435c [1/1] ANDROID: fix kernelci issue for allnoconfig builds
config: x86_64-randconfig-a012-20230530 (https://download.01.org/0day-ci/archive/20230530/202305302301.524I0mrJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout 4e709a85e578d28a2626832c4f2cf5e9031d435c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305302301.524I0mrJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: kernel/sched/fair.o: in function `rq_clock_task_mult':
>> kernel/sched/sched.h:1204: undefined reference to `clock_task_mult'
>> ld: kernel/sched/sched.h:1204: undefined reference to `clock_task_mult'
>> ld: kernel/sched/sched.h:1204: undefined reference to `clock_task_mult'
>> ld: kernel/sched/sched.h:1204: undefined reference to `clock_task_mult'
>> ld: kernel/sched/sched.h:1204: undefined reference to `clock_task_mult'
   ld: kernel/sched/fair.o:kernel/sched/sched.h:1204: more undefined references to `clock_task_mult' follow


vim +1204 kernel/sched/sched.h

  1198	
  1199	static inline u64 rq_clock_task_mult(struct rq *rq)
  1200	{
  1201		lockdep_assert_held(&rq->lock);
  1202		assert_clock_updated(rq);
  1203	
> 1204		return per_cpu(clock_task_mult, cpu_of(rq));
  1205	}
  1206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
