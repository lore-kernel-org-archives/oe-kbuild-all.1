Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E123EA973
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990946; cv=none; b=S/mJVCHFH73chjhAPnN5bfcObHhYRvdw6oGV75b/GKcl1IV7hk53P3KQ4pawLGZpv03zhz3VrDGKELxlkAvraSkrW7ixjbluLStIK2ki8RCuOTjPdJjLVIkjhOkTxHU3WK6qDhEc9GO5yHHJn5+JurUQJlvMlpbxQOYrXvm6v18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990946; c=relaxed/simple;
	bh=pBrYWR/fGJJ0H1sDnoOXXbFL1VdbMcrzuqSQn3joA2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aLHZwvPYm3PpB9aGWw4x20hTUibosrKTMIc0TmIyTng5fZmCi9eq7hzgZ/nK1qm8bsWZa3isFdV1D5LeciaiAqrUKlEOjW9jRo9ReBASnlueZkaPc05Uo68D4kQ5Gl0hXlfk9PkUaw+87T3zKTcPA1mF9NNtr9f3WUUhcr1duE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QF5cfA7K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QF5cfA7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782990943; x=1814526943;
  h=date:from:to:cc:subject:message-id;
  bh=pBrYWR/fGJJ0H1sDnoOXXbFL1VdbMcrzuqSQn3joA2I=;
  b=QF5cfA7KRzXiaUAVWNARf65LPyrAXZtnn2wAN791MTT2vVHBSq5AMNhS
   QBevhdETQdB2/BFCAHPEwSZ/tJiOmKvkGjmhIfM5wmWdpdHeNWLOvDNmD
   +CmrSJ5SK8TkWyGosXR1pfeI99s4bIcEOiXr0zEFIWtsVFCfVWrEVge2w
   EEGdNWJUNCjyqFiwWC/Dx6rVdUEW2bpHRd6zs3IFfsfaVtsi5qS6eIvkB
   f4lTVqerDLn9/D5Kyvld2jkoIUwCJNucyS2Kh3eLJNlChabssARsT1Vj/
   AG2QQKtOlTeN7qrNxcZNcsdkKtD7txnz+W5iM7F/dl7MlO40/hd1g9KYu
   Q==;
X-CSE-ConnectionGUID: n0HYkllLTFSdTNZXt4vxbQ==
X-CSE-MsgGUID: CKGuzhdaTjiCfd1zIYrzlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83792491"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83792491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:15:40 -0700
X-CSE-ConnectionGUID: SQfyT/QrSiqOKvB1o6vxKQ==
X-CSE-MsgGUID: Kdye6x3iR7OXtIvTJeDvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257728814"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2026 04:15:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfFOK-00000000AjJ-2vTA;
	Thu, 02 Jul 2026 11:15:36 +0000
Date: Thu, 02 Jul 2026 19:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Taeyang Lee <0wn@theori.io>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/urgent 1/4] kernel/events/core.c:4739:1:
 error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
Message-ID: <202607021949.zL9JHdEP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   91a15888098678641edd3ef4f5d66fa7e77dcc28
commit: f60c8830996ca8e468f96cc3ae79aab1e6fbfb12 [1/4] perf/core: Detach event groups during remove_on_exec
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607021949.zL9JHdEP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021949.zL9JHdEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021949.zL9JHdEP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/events/core.c: In function 'perf_event_exit_event':
>> kernel/events/core.c:4739:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4739 | {
         | ^
>> kernel/events/core.c:4774:1: warning: empty declaration
    4774 | struct perf_read_data {
         | ^~~~~~
>> kernel/events/core.c:4780:37: error: storage class specified for parameter 'perf_scope_cpu_topology_cpumask'
    4780 | static inline const struct cpumask *perf_scope_cpu_topology_cpumask(unsigned int scope, int cpu);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:4780:37: warning: parameter 'perf_scope_cpu_topology_cpumask' declared 'inline'
>> kernel/events/core.c:4780:28: warning: 'gnu_inline' attribute ignored [-Wattributes]
    4780 | static inline const struct cpumask *perf_scope_cpu_topology_cpumask(unsigned int scope, int cpu);
         |                            ^~~~~~~
>> kernel/events/core.c:4780:37: error: 'no_instrument_function' attribute applies only to functions
    4780 | static inline const struct cpumask *perf_scope_cpu_topology_cpumask(unsigned int scope, int cpu);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:4783:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4783 | {
         | ^
   kernel/events/core.c:4812:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4812 | {
         | ^
   kernel/events/core.c:4856:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4856 | {
         | ^
   kernel/events/core.c:4867:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4867 | {
         | ^
   kernel/events/core.c:4885:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4885 | {
         | ^
   kernel/events/core.c:4958:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    4958 | {
         | ^
   kernel/events/core.c:5035:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5035 | {
         | ^
   kernel/events/core.c:5047:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5047 | {
         | ^
   kernel/events/core.c:5057:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5057 | {
         | ^
   kernel/events/core.c:5073:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5073 | {
         | ^
   kernel/events/core.c:5096:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5096 | {
         | ^
   kernel/events/core.c:5170:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5170 | {
         | ^
   kernel/events/core.c:5245:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5245 | {
         | ^
   kernel/events/core.c:5250:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5250 | {
         | ^
   kernel/events/core.c:5258:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5258 | {
         | ^
   kernel/events/core.c:5265:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5265 | {
         | ^
>> kernel/events/core.c:5298:13: error: storage class specified for parameter 'perf_event_free_filter'
    5298 | static void perf_event_free_filter(struct perf_event *event);
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5301:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5301 | {
         | ^
>> kernel/events/core.c:5311:13: error: storage class specified for parameter 'ring_buffer_attach'
    5311 | static void ring_buffer_attach(struct perf_event *event,
         |             ^~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5315:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5315 | {
         | ^
   kernel/events/core.c:5324:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5324 | {
         | ^
   kernel/events/core.c:5344:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5344 | {
         | ^
   kernel/events/core.c:5354:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5354 | {
         | ^
   kernel/events/core.c:5364:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5364 | {
         | ^
   kernel/events/core.c:5374:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5374 | {
         | ^
   kernel/events/core.c:5395:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5395 | {
         | ^
   kernel/events/core.c:5401:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5401 | {
         | ^
   kernel/events/core.c:5409:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5409 | {
         | ^
   kernel/events/core.c:5416:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5416 | {
         | ^
>> kernel/events/core.c:5462:13: error: storage class specified for parameter '__detach_global_ctx_data'
    5462 | static void __detach_global_ctx_data(void);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:593,
                    from arch/x86/include/asm/current.h:11,
                    from arch/x86/include/asm/processor.h:17,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from kernel/events/core.c:11:
>> include/linux/percpu-rwsem.h:31:37: error: storage class specified for parameter '__percpu_rwsem_rc_global_ctx_data_rwsem'
      31 | static DEFINE_PER_CPU(unsigned int, __percpu_rwsem_rc_##name);          \
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:103:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     103 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   include/linux/percpu-rwsem.h:31:8: note: in expansion of macro 'DEFINE_PER_CPU'
      31 | static DEFINE_PER_CPU(unsigned int, __percpu_rwsem_rc_##name);          \
         |        ^~~~~~~~~~~~~~
   include/linux/percpu-rwsem.h:44:9: note: in expansion of macro '__DEFINE_PERCPU_RWSEM'
      44 |         __DEFINE_PERCPU_RWSEM(name, static)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5463:1: note: in expansion of macro 'DEFINE_STATIC_PERCPU_RWSEM'
    5463 | DEFINE_STATIC_PERCPU_RWSEM(global_ctx_data_rwsem);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/percpu-rwsem.h:31:37: error: section attribute not allowed for '__percpu_rwsem_rc_global_ctx_data_rwsem'
      31 | static DEFINE_PER_CPU(unsigned int, __percpu_rwsem_rc_##name);          \
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:103:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     103 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   include/linux/percpu-rwsem.h:31:8: note: in expansion of macro 'DEFINE_PER_CPU'
      31 | static DEFINE_PER_CPU(unsigned int, __percpu_rwsem_rc_##name);          \
         |        ^~~~~~~~~~~~~~
   include/linux/percpu-rwsem.h:44:9: note: in expansion of macro '__DEFINE_PERCPU_RWSEM'
      44 |         __DEFINE_PERCPU_RWSEM(name, static)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5463:1: note: in expansion of macro 'DEFINE_STATIC_PERCPU_RWSEM'
    5463 | DEFINE_STATIC_PERCPU_RWSEM(global_ctx_data_rwsem);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fs/super_types.h:13:
>> kernel/events/core.c:5463:28: error: storage class specified for parameter 'global_ctx_data_rwsem'
    5463 | DEFINE_STATIC_PERCPU_RWSEM(global_ctx_data_rwsem);
         |                            ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-rwsem.h:32:38: note: in definition of macro '__DEFINE_PERCPU_RWSEM'
      32 | is_static struct percpu_rw_semaphore name = {                           \
         |                                      ^~~~
   kernel/events/core.c:5463:1: note: in expansion of macro 'DEFINE_STATIC_PERCPU_RWSEM'
    5463 | DEFINE_STATIC_PERCPU_RWSEM(global_ctx_data_rwsem);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/percpu-rwsem.h:32:18: error: parameter 'global_ctx_data_rwsem' is initialized
      32 | is_static struct percpu_rw_semaphore name = {                           \
         |                  ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-rwsem.h:44:9: note: in expansion of macro '__DEFINE_PERCPU_RWSEM'
      44 |         __DEFINE_PERCPU_RWSEM(name, static)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5463:1: note: in expansion of macro 'DEFINE_STATIC_PERCPU_RWSEM'
    5463 | DEFINE_STATIC_PERCPU_RWSEM(global_ctx_data_rwsem);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:5464:19: error: storage class specified for parameter 'global_ctx_data_ref'
    5464 | static refcount_t global_ctx_data_ref;
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5468:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5468 | {
         | ^
   kernel/events/core.c:5519:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5519 | {
         | ^
   kernel/events/core.c:5540:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5540 | {
         | ^
   kernel/events/core.c:5559:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5559 | {
         | ^
   kernel/events/core.c:5575:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5575 | {
         | ^
   kernel/events/core.c:5588:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5588 | {
         | ^
   kernel/events/core.c:5603:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5603 | {
         | ^
   kernel/events/core.c:5649:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5649 | {
         | ^
   kernel/events/core.c:5669:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5669 | {
         | ^
   kernel/events/core.c:5702:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5702 | {
         | ^
   kernel/events/core.c:5715:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5715 | {
         | ^
   kernel/events/core.c:5726:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5726 | {
         | ^
>> kernel/events/core.c:5743:13: error: storage class specified for parameter 'perf_free_addr_filters'
    5743 | static void perf_free_addr_filters(struct perf_event *event);
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:5747:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5747 | {
         | ^
>> kernel/events/core.c:5803:13: error: storage class specified for parameter 'mediated_pmu_unaccount_event'
    5803 | static void mediated_pmu_unaccount_event(struct perf_event *event);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:7,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20:
>> include/linux/cleanup.h:211:61: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                             ^
   kernel/events/core.c:5805:1: note: in expansion of macro 'DEFINE_FREE'
    5805 | DEFINE_FREE(__free_event, struct perf_event *, if (_T) __free_event(_T))
         | ^~~~~~~~~~~
   kernel/events/core.c:5809:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5809 | {
         | ^
   kernel/events/core.c:5839:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5839 | {
         | ^
   kernel/events/core.c:5854:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5854 | {
         | ^
   kernel/events/core.c:5902:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5902 | {
         | ^
   kernel/events/core.c:5922:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    5922 | {
         | ^
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5:
>> kernel/events/core.c:6022:19: error: storage class specified for parameter 'perf_event_release_kernel'
    6022 | EXPORT_SYMBOL_GPL(perf_event_release_kernel);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:6022:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    6022 | EXPORT_SYMBOL_GPL(perf_event_release_kernel);
         | ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler.h:165:17: error: storage class specified for parameter '__UNIQUE_ID_addressable_perf_event_release_kernel_594'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:6022:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    6022 | EXPORT_SYMBOL_GPL(perf_event_release_kernel);
         | ^~~~~~~~~~~~~~~~~
>> kernel/events/core.c:6022:1: error: parameter '__UNIQUE_ID_addressable_perf_event_release_kernel_594' is initialized
   kernel/events/core.c:6022:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:165:17: error: section attribute not allowed for '__UNIQUE_ID_addressable_perf_event_release_kernel_594'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:6022:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    6022 | EXPORT_SYMBOL_GPL(perf_event_release_kernel);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:79:9: error: expected declaration specifiers before 'asm'
      79 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:6022:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    6022 | EXPORT_SYMBOL_GPL(perf_event_release_kernel);
         | ^~~~~~~~~~~~~~~~~
   kernel/events/core.c:6028:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    6028 | {
         | ^
   kernel/events/core.c:6034:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    6034 | {
         | ^
   kernel/events/core.c:6063:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    6063 | {
         | ^
   kernel/events/core.c:6073:19: error: storage class specified for parameter 'perf_event_read_value'
    6073 | EXPORT_SYMBOL_GPL(perf_event_read_value);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:6073:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    6073 | EXPORT_SYMBOL_GPL(perf_event_read_value);
         | ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:165:17: error: storage class specified for parameter '__UNIQUE_ID_addressable_perf_event_read_value_595'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/events/core.c:6073:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    6073 | EXPORT_SYMBOL_GPL(perf_event_read_value);
         | ^~~~~~~~~~~~~~~~~
   kernel/events/core.c:6073:1: error: parameter '__UNIQUE_ID_addressable_perf_event_read_value_595' is initialized
   kernel/events/core.c:6073:1: warning: 'used' attribute ignored [-Wattributes]
   include/linux/compiler.h:165:17: error: section attribute not allowed for '__UNIQUE_ID_addressable_perf_event_read_value_595'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:15:24: note: in definition of macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/compiler.h:273:9: note: in expansion of macro '__UNIQUE_ID'


vim +4739 kernel/events/core.c

889ff015066151 kernel/perf_event.c   Frederic Weisbecker 2010-01-09  4682  
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4683  /*
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar         2009-09-21  4684   * Enable all of a task's events that have been marked enable-on-exec.
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4685   * This expects task == current.
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4686   */
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08 @4687  static void perf_event_enable_on_exec(struct perf_event_context *ctx)
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4688  {
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4689  	struct perf_event_context *clone_ctx = NULL;
487f05e18aa4ef kernel/events/core.c  Alexander Shishkin  2017-01-19  4690  	enum event_type_t event_type = 0;
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4691  	struct perf_cpu_context *cpuctx;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar         2009-09-21  4692  	struct perf_event *event;
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4693  	unsigned long flags;
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4694  	int enabled = 0;
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4695  
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4696  	local_irq_save(flags);
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4697  	if (WARN_ON_ONCE(current->perf_event_ctxp != ctx))
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4698  		goto out;
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4699  
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4700  	if (!ctx->nr_events)
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4701  		goto out;
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4702  
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4703  	cpuctx = this_cpu_ptr(&perf_cpu_context);
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4704  	perf_ctx_lock(cpuctx, ctx);
5d95a2af973d47 kernel/events/core.c  Peter Zijlstra      2024-08-07  4705  	ctx_time_freeze(cpuctx, ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4706  
487f05e18aa4ef kernel/events/core.c  Alexander Shishkin  2017-01-19  4707  	list_for_each_entry(event, &ctx->event_list, event_entry) {
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4708  		enabled |= event_enable_on_exec(event, ctx);
487f05e18aa4ef kernel/events/core.c  Alexander Shishkin  2017-01-19  4709  		event_type |= get_event_type(event);
487f05e18aa4ef kernel/events/core.c  Alexander Shishkin  2017-01-19  4710  	}
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4711  
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4712  	/*
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4713  	 * Unclone and reschedule this context if we enabled any event.
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4714  	 */
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4715  	if (enabled) {
211de6eba89605 kernel/events/core.c  Peter Zijlstra      2014-09-30  4716  		clone_ctx = unclone_ctx(ctx);
2d17cf1abcbe8a kernel/events/core.c  Peter Zijlstra      2024-08-07  4717  		ctx_resched(cpuctx, ctx, NULL, event_type);
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4718  	}
3e349507d12de9 kernel/events/core.c  Peter Zijlstra      2016-01-08  4719  	perf_ctx_unlock(cpuctx, ctx);
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4720  
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4721  out:
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4722  	local_irq_restore(flags);
211de6eba89605 kernel/events/core.c  Peter Zijlstra      2014-09-30  4723  
211de6eba89605 kernel/events/core.c  Peter Zijlstra      2014-09-30  4724  	if (clone_ctx)
211de6eba89605 kernel/events/core.c  Peter Zijlstra      2014-09-30  4725  		put_ctx(clone_ctx);
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4726  }
57e7986ed14241 kernel/perf_counter.c Paul Mackerras      2009-06-30  4727  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08 @4728  static void perf_remove_from_owner(struct perf_event *event);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08 @4729  static void perf_event_exit_event(struct perf_event *event,
da916e96e2dedc kernel/events/core.c  Peter Zijlstra      2024-10-25  4730  				  struct perf_event_context *ctx,
c418d8b4d7a43a kernel/events/core.c  Thaumy Cheng        2025-12-09  4731  				  struct task_struct *task,
f60c8830996ca8 kernel/events/core.c  Taeyang Lee         2026-06-14  4732  				  unsigned long detach_flags)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4733  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4734  /*
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4735   * Removes all events from the current task that have been marked
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4736   * remove-on-exec, and feeds their values back to parent events.
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4737   */
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4738  static void perf_event_remove_on_exec(struct perf_event_context *ctx)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08 @4739  {
bd27568117664b kernel/events/core.c  Peter Zijlstra      2022-10-08  4740  	struct perf_event_context *clone_ctx = NULL;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4741  	struct perf_event *event, *next;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4742  	unsigned long flags;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4743  	bool modified = false;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4744  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4745  	mutex_lock(&ctx->mutex);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4746  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4747  	if (WARN_ON_ONCE(ctx->task != current))
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4748  		goto unlock;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4749  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4750  	list_for_each_entry_safe(event, next, &ctx->event_list, event_entry) {
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4751  		if (!event->attr.remove_on_exec)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4752  			continue;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4753  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4754  		if (!is_kernel_event(event))
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4755  			perf_remove_from_owner(event);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4756  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4757  		modified = true;
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4758  
f60c8830996ca8 kernel/events/core.c  Taeyang Lee         2026-06-14  4759  		perf_event_exit_event(event, ctx, ctx->task, DETACH_GROUP);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4760  	}
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4761  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4762  	raw_spin_lock_irqsave(&ctx->lock, flags);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4763  	if (modified)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4764  		clone_ctx = unclone_ctx(ctx);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4765  	raw_spin_unlock_irqrestore(&ctx->lock, flags);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4766  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4767  unlock:
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4768  	mutex_unlock(&ctx->mutex);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4769  
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4770  	if (clone_ctx)
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4771  		put_ctx(clone_ctx);
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4772  }
2e498d0a74e5b8 kernel/events/core.c  Marco Elver         2021-04-08  4773  
0492d4c5b8c4dc kernel/events/core.c  Peter Zijlstra      2015-09-03 @4774  struct perf_read_data {
0492d4c5b8c4dc kernel/events/core.c  Peter Zijlstra      2015-09-03  4775  	struct perf_event *event;
0492d4c5b8c4dc kernel/events/core.c  Peter Zijlstra      2015-09-03  4776  	bool group;
7d88962e230c83 kernel/events/core.c  Sukadev Bhattiprolu 2015-09-03  4777  	int ret;
0492d4c5b8c4dc kernel/events/core.c  Peter Zijlstra      2015-09-03  4778  };
0492d4c5b8c4dc kernel/events/core.c  Peter Zijlstra      2015-09-03  4779  
a48a36b316ae5d kernel/events/core.c  Kan Liang           2024-08-02 @4780  static inline const struct cpumask *perf_scope_cpu_topology_cpumask(unsigned int scope, int cpu);
a48a36b316ae5d kernel/events/core.c  Kan Liang           2024-08-02  4781  

:::::: The code at line 4739 was first introduced by commit
:::::: 2e498d0a74e5b88a6689ae1b811f247f91ff188e perf: Add support for event removal on exec

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
