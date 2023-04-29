Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582568BEF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 23:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682812157; x=1714348157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+FrRTmz7vCrk4wRt2dKLpvodmPCCaWQ1RuyyABjco1o=;
  b=RJZJdCvxwhIfdcFVHQ/NebhhqPoplEXQJXwYDfkpyH93ZNR2IBXdaSmY
   pbmwFF3DGdZploqccMk6XbFClrj3mg6O0z25/0iJpBUO/9clThHcKIvzX
   4cYXgWLWT5eVtXGd9nFxEja7p3ppNTRGvWpK1FYohl0wYcGv2e/m7V4xX
   i03d7csyZcRZErdjrsHlmVXtwhuWghjR4IbY1IMqiOR/GeTK8IujfSvXb
   6iOPKoILfxJb8ZhEWDJftGZ99y2hNR4EvyQko4lbFw6AYg1sn5G3oFxuw
   X9vrWqbYbvbiQBFVh7Dm0A4/Lq5T+G++NJJLMLg03amzyQkBsdnibDJNo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="332314213"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="332314213"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 16:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="839365642"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="839365642"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2023 16:49:14 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psuJW-0001Or-0f;
	Sat, 29 Apr 2023 23:49:14 +0000
Date: Sun, 30 Apr 2023 07:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-trap-forwarding 65/65]
 arch/arm64/kvm/trace_arm.h:369:34: error: expected ')' before 'is_read'
Message-ID: <202304300755.jDq9KdZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-trap-forwarding
head:   c1a7319dcdd3fb3a9c0336a37c3386c4e09897aa
commit: c1a7319dcdd3fb3a9c0336a37c3386c4e09897aa [65/65] WIP
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230430/202304300755.jDq9KdZE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=c1a7319dcdd3fb3a9c0336a37c3386c4e09897aa
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/nv-trap-forwarding
        git checkout c1a7319dcdd3fb3a9c0336a37c3386c4e09897aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300755.jDq9KdZE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-kvm.h:7,
                    from arch/arm64/kvm/arm.c:9:
   arch/arm64/kvm/trace_arm.h: In function 'trace_kvm_forward_sysreg_trap':
>> arch/arm64/kvm/trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:258:25: note: in expansion of macro '__DO_TRACE'
     258 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:259:33: note: in expansion of macro 'TP_ARGS'
     259 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:427:46: note: in expansion of macro 'PARAMS'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:561:44: note: in expansion of macro 'PARAMS'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/linux/tracepoint.h:177:59: note: to match this '('
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                           ^
   include/linux/tracepoint.h:217:17: note: in expansion of macro '__DO_TRACE_CALL'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                 ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:258:25: note: in expansion of macro '__DO_TRACE'
     258 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> include/linux/tracepoint.h:177:41: error: too few arguments to function '__traceiter_kvm_forward_sysreg_trap'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                         ^~~~~~~~~~~~
   include/linux/tracepoint.h:217:17: note: in expansion of macro '__DO_TRACE_CALL'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                 ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:258:25: note: in expansion of macro '__DO_TRACE'
     258 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   include/linux/tracepoint.h:252:20: note: declared here
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h: In function 'trace_kvm_forward_sysreg_trap_rcuidle':
>> arch/arm64/kvm/trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:232:25: note: in expansion of macro '__DO_TRACE'
     232 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:233:33: note: in expansion of macro 'TP_ARGS'
     233 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:265:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:265:50: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:427:46: note: in expansion of macro 'PARAMS'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:561:44: note: in expansion of macro 'PARAMS'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/linux/tracepoint.h:177:59: note: to match this '('
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                           ^
   include/linux/tracepoint.h:217:17: note: in expansion of macro '__DO_TRACE_CALL'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                 ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:232:25: note: in expansion of macro '__DO_TRACE'
     232 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:265:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> include/linux/tracepoint.h:177:41: error: too few arguments to function '__traceiter_kvm_forward_sysreg_trap'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                         ^~~~~~~~~~~~
   include/linux/tracepoint.h:217:17: note: in expansion of macro '__DO_TRACE_CALL'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                 ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:232:25: note: in expansion of macro '__DO_TRACE'
     232 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:265:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   include/linux/tracepoint.h:252:20: note: declared here
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:427:9: note: in expansion of macro '__DECLARE_TRACE'
     427 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:561:9: note: in expansion of macro 'DECLARE_TRACE'
     561 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   arch/arm64/kvm/trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h: In function '__traceiter_kvm_forward_sysreg_trap':
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/linux/tracepoint.h:328:77: note: in definition of macro 'DEFINE_TRACE_FN'
     328 |                                 ((void(*)(void *, proto))(it_func))(__data, args); \
         |                                                                             ^~~~
   include/linux/tracepoint.h:336:58: note: in expansion of macro 'PARAMS'
     336 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                                          ^~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:28:43: note: in expansion of macro 'PARAMS'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                           ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/linux/tracepoint.h:328:68: note: to match this '('
     328 |                                 ((void(*)(void *, proto))(it_func))(__data, args); \
         |                                                                    ^
   include/linux/tracepoint.h:336:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     336 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> include/linux/tracepoint.h:328:34: error: too few arguments to function '(void (*)(void *, struct kvm_vcpu *, u32,  bool))it_func'
     328 |                                 ((void(*)(void *, proto))(it_func))(__data, args); \
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:336:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     336 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from arch/arm64/kvm/trace_arm.h:394,
                    from arch/arm64/kvm/arm.c:28:
   arch/arm64/kvm/./trace_arm.h: In function 'trace_event_raw_event_kvm_forward_sysreg_trap':
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/trace_events.h:392:71: note: in definition of macro 'DECLARE_EVENT_CLASS'
     392 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                       ^~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/trace_events.h:392:53: note: to match this '('
     392 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                     ^
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> include/trace/trace_events.h:392:23: error: too few arguments to function 'trace_event_get_offsets_kvm_forward_sysreg_trap'
     392 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   include/trace/trace_events.h:256:27: note: declared here
     256 | static inline notrace int trace_event_get_offsets_##call(               \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   arch/arm64/kvm/./trace_arm.h: In function 'perf_trace_kvm_forward_sysreg_trap':
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/perf.h:31:71: note: in definition of macro 'DECLARE_EVENT_CLASS'
      31 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                       ^~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/perf.h:31:53: note: to match this '('
      31 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                     ^
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> include/trace/perf.h:31:23: error: too few arguments to function 'trace_event_get_offsets_kvm_forward_sysreg_trap'
      31 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   include/trace/trace_events.h:256:27: note: declared here
     256 | static inline notrace int trace_event_get_offsets_##call(               \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:104:
   arch/arm64/kvm/./trace_arm.h: In function '__bpf_trace_kvm_forward_sysreg_trap':
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/bpf_probe.h:23:16: note: in definition of macro '__CAST_TO_U64'
      23 |         typeof(x) __src = (x); \
         |                ^
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/bpf_probe.h:53:50: note: in expansion of macro 'PARAMS'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |                                                  ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/bpf_probe.h:23:15: note: to match this '('
      23 |         typeof(x) __src = (x); \
         |               ^
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/kernel.h:492:27: note: in expansion of macro '__CONCAT'
     492 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/trace/bpf_probe.h:41:26: note: in expansion of macro 'CONCATENATE'
      41 | #define CAST_TO_U64(...) CONCATENATE(__CAST, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |                          ^~~~~~~~~~~
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/bpf_probe.h:23:28: note: in definition of macro '__CAST_TO_U64'
      23 |         typeof(x) __src = (x); \
         |                            ^
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/bpf_probe.h:53:50: note: in expansion of macro 'PARAMS'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |                                                  ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/bpf_probe.h:23:27: note: to match this '('
      23 |         typeof(x) __src = (x); \
         |                           ^
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/kernel.h:492:27: note: in expansion of macro '__CONCAT'
     492 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/trace/bpf_probe.h:41:26: note: in expansion of macro 'CONCATENATE'
      41 | #define CAST_TO_U64(...) CONCATENATE(__CAST, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |                          ^~~~~~~~~~~
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/bpf_probe.h:17:42: note: in definition of macro 'UINTTYPE'
      17 |         __typeof__(__builtin_choose_expr(size == 1,  (u8)1, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/bpf_probe.h:53:50: note: in expansion of macro 'PARAMS'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |                                                  ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/bpf_probe.h:24:24: note: to match this '('
      24 |         UINTTYPE(sizeof(x)) __dst; \
         |                        ^
   include/trace/bpf_probe.h:17:42: note: in definition of macro 'UINTTYPE'
      17 |         __typeof__(__builtin_choose_expr(size == 1,  (u8)1, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/kernel.h:492:27: note: in expansion of macro '__CONCAT'
     492 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/trace/bpf_probe.h:41:26: note: in expansion of macro 'CONCATENATE'
      41 | #define CAST_TO_U64(...) CONCATENATE(__CAST, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |                          ^~~~~~~~~~~
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/bpf_probe.h:18:42: note: in definition of macro 'UINTTYPE'
      18 |                    __builtin_choose_expr(size == 2, (u16)2, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/bpf_probe.h:53:50: note: in expansion of macro 'PARAMS'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |                                                  ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/bpf_probe.h:24:24: note: to match this '('
      24 |         UINTTYPE(sizeof(x)) __dst; \
         |                        ^
   include/trace/bpf_probe.h:18:42: note: in definition of macro 'UINTTYPE'
      18 |                    __builtin_choose_expr(size == 2, (u16)2, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/kernel.h:492:27: note: in expansion of macro '__CONCAT'
     492 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/trace/bpf_probe.h:41:26: note: in expansion of macro 'CONCATENATE'
      41 | #define CAST_TO_U64(...) CONCATENATE(__CAST, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |                          ^~~~~~~~~~~
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/bpf_probe.h:19:42: note: in definition of macro 'UINTTYPE'
      19 |                    __builtin_choose_expr(size == 4, (u32)3, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/bpf_probe.h:53:50: note: in expansion of macro 'PARAMS'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |                                                  ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/bpf_probe.h:24:24: note: to match this '('
      24 |         UINTTYPE(sizeof(x)) __dst; \
         |                        ^
   include/trace/bpf_probe.h:19:42: note: in definition of macro 'UINTTYPE'
      19 |                    __builtin_choose_expr(size == 4, (u32)3, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/kernel.h:492:27: note: in expansion of macro '__CONCAT'
     492 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/trace/bpf_probe.h:41:26: note: in expansion of macro 'CONCATENATE'
      41 | #define CAST_TO_U64(...) CONCATENATE(__CAST, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |                          ^~~~~~~~~~~
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
>> arch/arm64/kvm/./trace_arm.h:369:34: error: expected ')' before 'is_read'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |                                  ^~~~~~~
   include/trace/bpf_probe.h:20:42: note: in definition of macro 'UINTTYPE'
      20 |                    __builtin_choose_expr(size == 8, (u64)4, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/bpf_probe.h:53:50: note: in expansion of macro 'PARAMS'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |                                                  ^~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:30: note: in expansion of macro 'PARAMS'
      42 |                              PARAMS(args),                     \
         |                              ^~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:369:13: note: in expansion of macro 'TP_ARGS'
     369 |             TP_ARGS(vcpu, sysreg is_read),
         |             ^~~~~~~
   include/trace/bpf_probe.h:24:24: note: to match this '('
      24 |         UINTTYPE(sizeof(x)) __dst; \
         |                        ^
   include/trace/bpf_probe.h:20:42: note: in definition of macro 'UINTTYPE'
      20 |                    __builtin_choose_expr(size == 8, (u64)4, \
         |                                          ^~~~
   include/trace/bpf_probe.h:28:24: note: in expansion of macro '__CAST_TO_U64'
      28 | #define __CAST1(a,...) __CAST_TO_U64(a)
         |                        ^~~~~~~~~~~~~
   include/trace/bpf_probe.h:29:42: note: in expansion of macro '__CAST1'
      29 | #define __CAST2(a,...) __CAST_TO_U64(a), __CAST1(__VA_ARGS__)
         |                                          ^~~~~~~
   include/linux/kernel.h:491:24: note: in expansion of macro '__CAST2'
     491 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/kernel.h:492:27: note: in expansion of macro '__CONCAT'
     492 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/trace/bpf_probe.h:41:26: note: in expansion of macro 'CONCATENATE'
      41 | #define CAST_TO_U64(...) CONCATENATE(__CAST, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
         |                          ^~~~~~~~~~~
   include/trace/bpf_probe.h:48:60: note: in expansion of macro 'CAST_TO_U64'
      48 |         CONCATENATE(bpf_trace_run, COUNT_ARGS(args))(prog, CAST_TO_U64(args));  \
         |                                                            ^~~~~~~~~~~
   include/trace/bpf_probe.h:53:9: note: in expansion of macro '__BPF_DECLARE_TRACE'
      53 |         __BPF_DECLARE_TRACE(call, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/./trace_arm.h:367:1: note: in expansion of macro 'TRACE_EVENT'
     367 | TRACE_EVENT(kvm_forward_sysreg_trap,
         | ^~~~~~~~~~~
..


vim +369 arch/arm64/kvm/trace_arm.h

   366	
   367	TRACE_EVENT(kvm_forward_sysreg_trap,
   368		    TP_PROTO(struct kvm_vcpu *vcpu, u32 sysreg, bool is_read),
 > 369		    TP_ARGS(vcpu, sysreg is_read),
   370	
   371		    TP_STRUCT__entry(
   372			__field(struct kvm_vcpu *, vcpu)
   373			__field(u32,		   sysreg)
   374			__field(bool,		   is_read)
   375		    ),
   376	
   377		    TP_fast_assign(
   378			__entry->vcpu = vcpu;
   379			__entry->sysreg = sysreg;
   380			__entry->is_read = is_read;
   381		    ),
   382	
   383		    TP_printk("%c %x", __entry->is_read ? 'R' : 'W', __entry->sysreg)
   384	);
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
