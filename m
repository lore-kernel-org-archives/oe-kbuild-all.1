Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2B13C02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676363342; x=1707899342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3klYLMoiGtelzbcdIQY+yNvdGedUgsv7SvX0teHR7A=;
  b=OwPKBEttMYQrtQme6aDQKhZpDQmIWR9fczOZrqw5HKZ+/NsoNfMXhD/G
   WYSuwNt2WbjyhEoIbp2R7y5CpxQpcoYbGTfMwpyw723JxM/Q6G34gX99A
   mdsUeM1kVu6UmW6tlboIUW72ZQ7h7zrQy81kiSq1c9s+j2kU7eNmCUmR/
   zC3sPEO/mxpFVM4cRdtPV2Ul3upQcNprHgdEOZ65CpjsR1aWgPfbouplb
   /Xa1wnwktd8DcRgmbZAzrK+TLTLd/sYJtlwZledQ2EWuDrb/4STbg7Mzr
   cyfwWUK4QTVO/yNlFlM5k8CEQW0ERBFx0yLT+T8TKtkuz2nl7/KGgoSJW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329735389"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="329735389"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 00:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914659047"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="914659047"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2023 00:29:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRqgN-0008KF-20;
	Tue, 14 Feb 2023 08:28:59 +0000
Date: Tue, 14 Feb 2023 16:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/3] lib/unwind_kunit.c:49:5: warning: no
 previous prototype for 'uwd_test_init'
Message-ID: <202302141646.VZdNr7i2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   249fff101e1a3a5a356947f74a3d7933583c109f
commit: 249fff101e1a3a5a356947f74a3d7933583c109f [3/3] WIP: unwind tests
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230214/202302141646.VZdNr7i2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=249fff101e1a3a5a356947f74a3d7933583c109f
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout 249fff101e1a3a5a356947f74a3d7933583c109f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141646.VZdNr7i2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/unwind_kunit.c:49:5: warning: no previous prototype for 'uwd_test_init' [-Wmissing-prototypes]
      49 | int uwd_test_init(struct kunit *test)
         |     ^~~~~~~~~~~~~
>> lib/unwind_kunit.c:59:6: warning: no previous prototype for 'uwd_test_exit' [-Wmissing-prototypes]
      59 | void uwd_test_exit(struct kunit *test)
         |      ^~~~~~~~~~~~~
>> lib/unwind_kunit.c:67:6: warning: no previous prototype for 'uwd_save_stacktrace' [-Wmissing-prototypes]
      67 | void uwd_save_stacktrace(struct unwind_data *uwd)
         |      ^~~~~~~~~~~~~~~~~~~
   lib/unwind_kunit.c: In function 'uwd_save_stacktrace':
   lib/unwind_kunit.c:69:20: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_tracer_enable'? [-Werror=implicit-function-declaration]
      69 |         uwd->len = stack_trace_save(uwd->stack_trace,
         |                    ^~~~~~~~~~~~~~~~
         |                    stack_tracer_enable
   lib/unwind_kunit.c: At top level:
>> lib/unwind_kunit.c:75:6: warning: no previous prototype for 'uwd_save_stacktrace_reliable' [-Wmissing-prototypes]
      75 | void uwd_save_stacktrace_reliable(struct unwind_data *uwd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:83:6: warning: no previous prototype for 'uwd_save_stacktrace_regs' [-Wmissing-prototypes]
      83 | void uwd_save_stacktrace_regs(struct unwind_data *uwd, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/unwind_kunit.c: In function 'uwd_save_stacktrace_regs':
   lib/unwind_kunit.c:85:20: error: implicit declaration of function 'stack_trace_save_regs' [-Werror=implicit-function-declaration]
      85 |         uwd->len = stack_trace_save_regs(regs,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/uwd_test_init +49 lib/unwind_kunit.c

    48	
  > 49	int uwd_test_init(struct kunit *test)
    50	{
    51		struct unwind_data *uwd = kunit_kzalloc(test, sizeof(*uwd), GFP_KERNEL);
    52		if (!uwd)
    53			return -ENOMEM;
    54	
    55		test->priv = uwd;
    56		return 0;
    57	}
    58	
  > 59	void uwd_test_exit(struct kunit *test)
    60	{
    61		if (test->status == KUNIT_FAILURE)
    62			uwd_dump(test, test->priv);
    63	
    64		kunit_kfree(test, test->priv);
    65	}
    66	
  > 67	void uwd_save_stacktrace(struct unwind_data *uwd)
    68	{
    69		uwd->len = stack_trace_save(uwd->stack_trace,
    70					    NR_STACKTRACE_ELEMS,
    71					    0);
    72		uwd->hit = true;
    73	}
    74	
  > 75	void uwd_save_stacktrace_reliable(struct unwind_data *uwd)
    76	{
    77		uwd->len = stack_trace_save_tsk_reliable(current,
    78							 uwd->stack_trace,
    79							 NR_STACKTRACE_ELEMS);
    80		uwd->hit = true;
    81	}
    82	
  > 83	void uwd_save_stacktrace_regs(struct unwind_data *uwd, struct pt_regs *regs)
    84	{
    85		uwd->len = stack_trace_save_regs(regs,
    86						 uwd->stack_trace,
    87						 NR_STACKTRACE_ELEMS,
    88						 0);
    89		uwd->hit = true;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
