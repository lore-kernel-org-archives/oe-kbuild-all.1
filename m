Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F246A92E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 00:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767659326; cv=none; b=sB4bhAXbn5HJ+3mMgb1p6N16VLNDAB0MC4jCymBaOcS6T5m+tjghht7tO0GqGgn39m68kqL9wn60vYhgiK1RtYskz8HSdcRNi5MzB8DrGEeDGTmT8391XykWF5yIsd3bvTsbqeBlT2bmWfXpCz8hQYi9YgXSNPkxyjHhRtCuPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767659326; c=relaxed/simple;
	bh=A1BcB6UG4sGleSTTyi8JLGsvw2w73XANkY+T8kogHMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lj8zqiFIPRG3/H2AQ+/WtL6zzIq0IGfrMchyX41LaawlPa/IciGSX2Ib+J00cDFnmWhUXa1/zTUkj4Oeq804p35ZL63gx+Qrk/+p9cXDttp6FxIFvObTZY40AlQqVxFxjZRYpbhZKU+eyJwFSzSD6JUSuoPrSIc2/AxkkyO0+fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jScDK8zg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jScDK8zg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767659323; x=1799195323;
  h=date:from:to:cc:subject:message-id;
  bh=A1BcB6UG4sGleSTTyi8JLGsvw2w73XANkY+T8kogHMw=;
  b=jScDK8zgl8JdbX6mBC/9Uz0nMKlM76sR5FPPLxxIaWs3SLm2Dm0tQXq4
   OwxZfa4r3ff+q8bXScNpo0rF1uUkaAoOJCsxouA3ssLr/3t+bzVfqPein
   CuG9YAqqGNjE9ItsVvm+CfJRZmejJT0LMgDuKzWVYLLru/7q7xF1ET2H0
   Ml7ZcdB06Qxj6NQIb4lmbPREoJ44/kow0wMGUvoGHU+63xRmIwHXn30sv
   gfN39/k57h+2EveLur/+j2HCunq7ygFpZrS95NNUZsbCBBdMJC2mL1Mq7
   x+sCtWlc6FZwQA3x28wF0Rnd9es14AeCQhyasy1vdhi33dLByz1hd4VFg
   Q==;
X-CSE-ConnectionGUID: G9RRNug5RCSQLzw8SqSssQ==
X-CSE-MsgGUID: PR/9gT7iSQmqrOJmx3+A6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68935191"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68935191"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 16:28:42 -0800
X-CSE-ConnectionGUID: Yn1EKm2AQVONi9PEq+gqLw==
X-CSE-MsgGUID: AS0rBfoeTL+Eps9VC/ujtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202288734"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Jan 2026 16:28:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcuwA-000000001Cf-3fEw;
	Tue, 06 Jan 2026 00:28:38 +0000
Date: Tue, 06 Jan 2026 01:27:46 +0100
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 27/28]
 kernel/trace/rv/rv_monitors_test.c:33:40: error: macro "rv_get_current"
 passed 1 arguments, but takes just 0
Message-ID: <202601060122.kvNmHSoK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   e50630dce77a6316bf4ba69e1af30004a302bc24
commit: 351069275c05f144e40e59ea5ec761f4a303d3ac [27/28] rv: Add kunit stubs for current and smp_processor_id()
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260106/202601060122.kvNmHSoK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060122.kvNmHSoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060122.kvNmHSoK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/rv_monitors_test.c:33:40: error: macro "rv_get_current" passed 1 arguments, but takes just 0
      33 | struct task_struct *rv_get_current(void)
         |                                        ^
   In file included from kernel/trace/rv/rv_monitors_test.c:11:
   include/rv/kunit_stubs.h:15:9: note: macro "rv_get_current" defined here
      15 | #define rv_get_current() current
         |         ^~~~~~~~~~~~~~
>> kernel/trace/rv/rv_monitors_test.c:34:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      34 | {
         | ^
>> kernel/trace/rv/rv_monitors_test.c:38:24: error: macro "rv_current_cpu" passed 1 arguments, but takes just 0
      38 | int rv_current_cpu(void)
         |                        ^
   include/rv/kunit_stubs.h:16:9: note: macro "rv_current_cpu" defined here
      16 | #define rv_current_cpu() smp_processor_id()
         |         ^~~~~~~~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:39:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      39 | {
         | ^
   In file included from include/linux/spinlock.h:55,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from kernel/trace/rv/rv_monitors_test.h:3,
                    from kernel/trace/rv/rv_monitors_test.c:10:
   kernel/trace/rv/rv_monitors_test.c: In function 'rv_trigger_test_init':
   kernel/trace/rv/rv_monitors_test.c:66:42: warning: initialization left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]
      66 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |                                          ^~~~~~~~
   include/linux/typecheck.h:21:30: note: in definition of macro 'typecheck_fn'
      21 | ({      typeof(type) __tmp = function; \
         |                              ^~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:66:9: note: in expansion of macro 'kunit_activate_static_stub'
      66 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/rv/rv_monitors_test.c:12:
   kernel/trace/rv/rv_monitors_test.c:66:42: warning: argument 2 of '__kunit_activate_static_stub' might be a candidate for a format attribute [-Wsuggest-attribute=format]
      66 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |                                          ^~~~~~~~
   include/kunit/static_stub.h:97:44: note: in definition of macro 'kunit_activate_static_stub'
      97 |         __kunit_activate_static_stub(test, real_fn_addr, replacement_addr);     \
         |                                            ^~~~~~~~~~~~
>> kernel/trace/rv/rv_monitors_test.c:71:42: error: 'rv_get_current' undeclared (first use in this function); did you mean 'get_current'?
      71 |         kunit_activate_static_stub(test, rv_get_current, stub_rv_get_current);
         |                                          ^~~~~~~~~~~~~~
   include/linux/typecheck.h:21:30: note: in definition of macro 'typecheck_fn'
      21 | ({      typeof(type) __tmp = function; \
         |                              ^~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:71:9: note: in expansion of macro 'kunit_activate_static_stub'
      71 |         kunit_activate_static_stub(test, rv_get_current, stub_rv_get_current);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:71:42: note: each undeclared identifier is reported only once for each function it appears in
      71 |         kunit_activate_static_stub(test, rv_get_current, stub_rv_get_current);
         |                                          ^~~~~~~~~~~~~~
   include/linux/typecheck.h:21:30: note: in definition of macro 'typecheck_fn'
      21 | ({      typeof(type) __tmp = function; \
         |                              ^~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:71:9: note: in expansion of macro 'kunit_activate_static_stub'
      71 |         kunit_activate_static_stub(test, rv_get_current, stub_rv_get_current);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/rv/rv_monitors_test.c:72:42: error: 'rv_current_cpu' undeclared (first use in this function); did you mean 'stub_rv_current_cpu'?
      72 |         kunit_activate_static_stub(test, rv_current_cpu, stub_rv_current_cpu);
         |                                          ^~~~~~~~~~~~~~
   include/linux/typecheck.h:21:30: note: in definition of macro 'typecheck_fn'
      21 | ({      typeof(type) __tmp = function; \
         |                              ^~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:72:9: note: in expansion of macro 'kunit_activate_static_stub'
      72 |         kunit_activate_static_stub(test, rv_current_cpu, stub_rv_current_cpu);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rv_get_current +33 kernel/trace/rv/rv_monitors_test.c

  > 11	#include <rv/kunit_stubs.h>
  > 12	#include <kunit/static_stub.h>
    13	#include <kunit/test-bug.h>
    14	#include <linux/kernel.h>
    15	#include <linux/rv.h>
    16	
    17	static void stub_rv_react(struct rv_monitor *monitor, const char *msg, ...)
    18	{
    19		struct rv_kunit_ctx *ctx = kunit_get_current_test()->priv;
    20	
    21		++ctx->reactions;
    22	}
    23	
    24	static int stub_rv_get_task_monitor_slot(void)
    25	{
    26		return 0;
    27	}
    28	
    29	static void stub_rv_put_task_monitor_slot(int slot)
    30	{
    31	}
    32	
  > 33	struct task_struct *rv_get_current(void)
  > 34	{
    35		KUNIT_STATIC_STUB_REDIRECT(rv_get_current);
    36		return current;
    37	}
  > 38	int rv_current_cpu(void)
    39	{
    40		KUNIT_STATIC_STUB_REDIRECT(rv_current_cpu);
    41		return smp_processor_id();
    42	}
    43	
    44	static struct task_struct *stub_rv_get_current(void)
    45	{
    46		struct rv_kunit_ctx *ctx = kunit_get_current_test()->priv;
    47	
    48		return ctx->curr;
    49	}
    50	static int stub_rv_current_cpu(void)
    51	{
    52		struct rv_kunit_ctx *ctx = kunit_get_current_test()->priv;
    53	
    54		return ctx->cpu;
    55	}
    56	
    57	static int rv_trigger_test_init(struct kunit *test)
    58	{
    59		struct rv_kunit_ctx *ctx;
    60	
    61		ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
    62		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
    63	
    64		test->priv = ctx;
    65	
    66		kunit_activate_static_stub(test, rv_react, stub_rv_react);
    67		kunit_activate_static_stub(test, rv_get_task_monitor_slot,
    68					   stub_rv_get_task_monitor_slot);
    69		kunit_activate_static_stub(test, rv_put_task_monitor_slot,
    70					   stub_rv_put_task_monitor_slot);
  > 71		kunit_activate_static_stub(test, rv_get_current, stub_rv_get_current);
  > 72		kunit_activate_static_stub(test, rv_current_cpu, stub_rv_current_cpu);
    73	
    74		return 0;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
