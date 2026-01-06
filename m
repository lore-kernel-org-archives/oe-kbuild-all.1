Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2F32E692
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704885; cv=none; b=mY5dMVouCn6SFijvSw+ZPs+WzwBqCrDw4p4fh1k79V5LOXo2/ZNqYQYCsauPCyxf+qKJ5JbIOALxeTmsEWUJ7SegnviJDaFFWPHT4pODQmz/i4rdbnEARm2j0ROkSTAn5H5FX/jIwcKvR+9gpL8EdbJ4waGnYR6sNadxl4GnM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704885; c=relaxed/simple;
	bh=OQxW/KOCzWenMtV0hHFPLDY4i+/ST1tFPIp09r65m3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nDffbM8fLb3OYyz0pKVAL+ItQ1GqH5fkQWuohVkioz+9LXEyJqAXrjvMqKFDFt9hi4fXvQxCL+UYdxzNHeKgkTrucVNRyyhsfJf0SoQWsi2769+D8Mt7K5isKRQ2EA/l5erSrzy+wyIidUlBwrMIuGfNyCfh4s3RaH9pYJiQYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bb0ggOrl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bb0ggOrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767704883; x=1799240883;
  h=date:from:to:cc:subject:message-id;
  bh=OQxW/KOCzWenMtV0hHFPLDY4i+/ST1tFPIp09r65m3k=;
  b=bb0ggOrlY/g7cwi+rrDehg5ltxPXARYPfV6I53TaeAtu8Qpk1cpSXeV9
   3V9tLQJqRdJXoO+aJYhXs0qTol5pBmhURYit8Bjs5TgyTTjDEB5WSRHEE
   X2PrkeJz/oRjB/HPJHPrGm9EdVhZZWNLE6J0wRtJduu5mxN+45PqlpR8W
   dHZOGUZy4njffW3W2Pe8g5wu13neifAw1nsKTTz1cyVH+TciACu19FiBu
   guPMmUfliSf3uVTLkojOZIsDaUAXvYOeapZQYjjSjYwKceZSNB82XEnGd
   lbbYhEzJSnn9f7CLFh/20lgDnPNCfENTjnDdQpF2J1UEWO8dYwC9RChAJ
   w==;
X-CSE-ConnectionGUID: CeV83VimTrytMmEpTpbBMQ==
X-CSE-MsgGUID: 67FhzrwtQmKPQpmTbU2Zig==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80518211"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="80518211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 05:08:02 -0800
X-CSE-ConnectionGUID: FYsKuIi5S5WVzMgKH5Uq9w==
X-CSE-MsgGUID: kMwum9wDR7yQYdJI5NUKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207123338"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jan 2026 05:08:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd6n1-000000001xh-0b9v;
	Tue, 06 Jan 2026 13:07:59 +0000
Date: Tue, 06 Jan 2026 21:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 26/29]
 kernel/trace/rv/rv_monitors_test.h:31: undefined reference to
 `kunit_try_catch_throw'
Message-ID: <202601062145.w6WZ85Vd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   aa87c6b5e8020a853fbc2444ded06a93a7fc1493
commit: 3ee745d478d498ac635a5b08ec641323ddf97615 [26/29] rv: Add KUnit tests for some DA/HA monitors
config: arm-randconfig-003-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062145.w6WZ85Vd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062145.w6WZ85Vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062145.w6WZ85Vd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_test_sco':
>> kernel/trace/rv/rv_monitors_test.h:31: undefined reference to `kunit_try_catch_throw'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_trigger_test_init':
>> include/kunit/test.h:501: undefined reference to `kunit_kmalloc_array'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_trigger_test_init':
>> kernel/trace/rv/rv_monitors_test.c:37: undefined reference to `__kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:37: undefined reference to `__kunit_abort'
>> arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:41: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:42: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:44: undefined reference to `__kunit_activate_static_stub'
>> arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:48: undefined reference to `kunit_ptr_not_err_assert_format'


vim +31 kernel/trace/rv/rv_monitors_test.h

    11	
    12	#define RV_KUNIT_EXPECT_REACTION(test, ctx)                             \
    13		do {                                                            \
    14			KUNIT_EXPECT_EQ(test, ctx->reactions, ++ctx->expected); \
    15			if (ctx->reactions != ctx->expected)                    \
    16				ctx->expected = ctx->reactions;                 \
    17		} while (0)
    18	
    19	#define RV_KUNIT_EXPECT_NO_REACTION(test, ctx)                        \
    20		do {                                                          \
    21			KUNIT_EXPECT_EQ(test, ctx->reactions, ctx->expected); \
    22			if (ctx->reactions != ctx->expected)                  \
    23				ctx->expected = ctx->reactions;               \
    24		} while (0)
    25	
    26	#ifdef CONFIG_RV_MON_SCO
    27	extern void rv_test_sco(struct kunit *test);
    28	#else
    29	static inline void rv_test_sco(struct kunit *test)
    30	{
  > 31		kunit_skip(test, "Monitor not enabled\n");
    32	}
    33	#endif
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
