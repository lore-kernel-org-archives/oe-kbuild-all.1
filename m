Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28403A1E63
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767655364; cv=none; b=Av3Mnfw/shLd5qUJs53c98N7W7YzniX8sTOTkyY7GOQ/GSNvfYQ6NNmdV4kkHca7SIOtP3JnD8i9rIfIa5J4mlsOkrORVt2FUAiBQdO6kusmO5/82frLt7/H5jAgaSyjTWrpsvdKKxfip17uBGnHSUFkcJ4u8xf9ASt7dQo8sdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767655364; c=relaxed/simple;
	bh=6/yM9OMsM8OQPqy28FDi5X7FQWTBeTqp0N4om8f8ahU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rRzEupaMFmrjuXmtunt0wy+M/XI+7DCGidqBn1TTfJjBNOWjf17fSS/iBRSR8V/YQork5oh5Cff+Ak1zuE/uAkY2rDkZ8T2F22TPsRfzKZuy1lcmY10Js0mJsFDeBcPg9K+OGIzWrZT+Rg9Iv+EhZ6I04CdFDiAr1Wu6fbpIK+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J36FWUTP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J36FWUTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767655363; x=1799191363;
  h=date:from:to:cc:subject:message-id;
  bh=6/yM9OMsM8OQPqy28FDi5X7FQWTBeTqp0N4om8f8ahU=;
  b=J36FWUTP2lB5maSQ6G7rFMODPAQsM0qjrFna75H52OIdYiX7Y55hkvKs
   Yg7K1jKEeH1OyoYgxs5kd2euNwLZQno/nEt5kNQhjgzlQ85UPPYjgZQNT
   dfg78cezc0uE3us4JBQ8RDB2aS3wKD8cl1v3MSgoXgEEmEBpc3oiIdfeq
   BuN9p9NPgukiRcNcEtXWjpzBNFaRnX45eQA2IpaWsIl0KpL+ylw+uRkI+
   KI+nTSFt8Y49Eav2sNjgPpvhxbTvrjihJQvO9DglW7tK0o3XQLRtfiwXk
   qBihYlcrdpEaYgUVRfE/wD3OfCMfZp27bnKCbfWQBwbhQ9IIFo01ZNVYw
   g==;
X-CSE-ConnectionGUID: MpeZTak2SQO374l5M2YbdQ==
X-CSE-MsgGUID: 6lSYLequQrOziAhrkGwJGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68930025"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68930025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 15:22:42 -0800
X-CSE-ConnectionGUID: DHQpWZQcRvixbgVDNqidKw==
X-CSE-MsgGUID: rOwDZ+3vQna/2FG7kXv3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202517349"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Jan 2026 15:22:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vctuI-000000001CP-2tKk;
	Mon, 05 Jan 2026 23:22:38 +0000
Date: Tue, 06 Jan 2026 00:22:03 +0100
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 26/28]
 kernel/trace/rv/rv_monitors_test.c:41:42: warning: initialization left-hand
 side might be a candidate for a format attribute
Message-ID: <202601060035.2apzs2OJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   e50630dce77a6316bf4ba69e1af30004a302bc24
commit: a3a107602a180742b0a05704b5c554f5ba056bf0 [26/28] rv: Add KUnit tests for some DA/HA monitors
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260106/202601060035.2apzs2OJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060035.2apzs2OJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060035.2apzs2OJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:55,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from kernel/trace/rv/rv_monitors_test.h:3,
                    from kernel/trace/rv/rv_monitors_test.c:10:
   kernel/trace/rv/rv_monitors_test.c: In function 'rv_trigger_test_init':
>> kernel/trace/rv/rv_monitors_test.c:41:42: warning: initialization left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]
      41 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |                                          ^~~~~~~~
   include/linux/typecheck.h:21:30: note: in definition of macro 'typecheck_fn'
      21 | ({      typeof(type) __tmp = function; \
         |                              ^~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:41:9: note: in expansion of macro 'kunit_activate_static_stub'
      41 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/rv/rv_monitors_test.c:11:
>> kernel/trace/rv/rv_monitors_test.c:41:42: warning: argument 2 of '__kunit_activate_static_stub' might be a candidate for a format attribute [-Wsuggest-attribute=format]
      41 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |                                          ^~~~~~~~
   include/kunit/static_stub.h:97:44: note: in definition of macro 'kunit_activate_static_stub'
      97 |         __kunit_activate_static_stub(test, real_fn_addr, replacement_addr);     \
         |                                            ^~~~~~~~~~~~


vim +41 kernel/trace/rv/rv_monitors_test.c

  > 10	#include "rv_monitors_test.h"
    11	#include <kunit/static_stub.h>
    12	#include <kunit/test-bug.h>
    13	#include <linux/kernel.h>
    14	#include <linux/rv.h>
    15	
    16	static void stub_rv_react(struct rv_monitor *monitor, const char *msg, ...)
    17	{
    18		struct rv_kunit_ctx *ctx = kunit_get_current_test()->priv;
    19	
    20		++ctx->reactions;
    21	}
    22	
    23	static int stub_rv_get_task_monitor_slot(void)
    24	{
    25		return 0;
    26	}
    27	
    28	static void stub_rv_put_task_monitor_slot(int slot)
    29	{
    30	}
    31	
    32	static int rv_trigger_test_init(struct kunit *test)
    33	{
    34		struct rv_kunit_ctx *ctx;
    35	
    36		ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
    37		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
    38	
    39		test->priv = ctx;
    40	
  > 41		kunit_activate_static_stub(test, rv_react, stub_rv_react);
    42		kunit_activate_static_stub(test, rv_get_task_monitor_slot,
    43					   stub_rv_get_task_monitor_slot);
    44		kunit_activate_static_stub(test, rv_put_task_monitor_slot,
    45					   stub_rv_put_task_monitor_slot);
    46	
    47		return 0;
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
