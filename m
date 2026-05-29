Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307062E4257
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 00:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016060; cv=none; b=oLzX6R+V+wVydWxdNvMRGxwCKUNfrkxvhsF+X8JIiFN6I+AwpIJ8tQUErj0tlvhAaGnXnTa/gLmlzEg82ypaYb8f1EeIHJGBZK5VTrc9Q3A0osieA7Yo7EiOjFi8dMVlxG+2KwJUgWV1vSRuqN8SR8fRFVvTQsivbgK5aGkttlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016060; c=relaxed/simple;
	bh=5poO97aZ9a/DKyRz/fxWTEdgToEtopFLQbWlwLS0T9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AtHhOsP2cO1LPMi+cVsAXWZ91mxNzxxJ7sXabt+BiGr9SE5bG5MSL6s1SQNf8ljF3YMp5R5cbXLjBxsXsWQhPJacYjESD86LfI+/kvpyRE1FfhiOszS2+8ZBn6CGYbwj4I75otCKIwuyYZ4yGCXY3z0emprP7NCg25pKLoMXfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfsX27t2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfsX27t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780016059; x=1811552059;
  h=date:from:to:cc:subject:message-id;
  bh=5poO97aZ9a/DKyRz/fxWTEdgToEtopFLQbWlwLS0T9E=;
  b=SfsX27t2ayw7T3/jptGZCeYLevwB328o/tEyYp3lli5Oy4xRvaOcrkDa
   lfJd+NQC5cB/pceU5fUPOL+bMRYQARMH2t0XOO5eyDkgSHoA+6PplEOgA
   m64x1t6V4bv/uSUt8hqVumu8XSJOMo2S1dwOxu/x1ornnSglOG/+DAL/i
   9Vg2J4slLZmVdXrJHcZrn/ax7tKe3uH05cH9ba6iihTzKT2am5sMx8VSa
   MGuHSHczyu2yxM2vPXBiQuCTkeC900cu6uAfG3Sy5Jn82CMcFXYVMEBND
   e4aqGXJxwukSIK7ZK8KvkbdzWVdkj+2chQx3Y0jF9EEZgUkeMKwWGGxjl
   w==;
X-CSE-ConnectionGUID: uUNC82J+QlGimNNsKRA2SQ==
X-CSE-MsgGUID: ehsyhAyHQpezHX/UJwbTmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91980009"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="91980009"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 17:54:19 -0700
X-CSE-ConnectionGUID: 0r/+gA6ITKy9tocTzWw7+A==
X-CSE-MsgGUID: PZ/8X3usTUuGif0NlrlwbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238307384"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2026 17:54:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSlUN-000000006bs-0bZY;
	Fri, 29 May 2026 00:54:15 +0000
Date: Fri, 29 May 2026 08:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_tests 11/17]
 kernel/trace/rv/monitors/nomiss/nomiss.c:316:29: error: no member named 'cpu'
 in 'struct thread_info'
Message-ID: <202605290832.T7nOvzzn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_tests
head:   e80dca0c73116dfe91cb0db9439d5c45b6756e1d
commit: 3cc8057564929524a32a4092676ec3253a9fcbae [11/17] rv: Add KUnit tests for some DA/HA monitors
config: x86_64-randconfig-103-20260528 (https://download.01.org/0day-ci/archive/20260529/202605290832.T7nOvzzn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290832.T7nOvzzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290832.T7nOvzzn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/nomiss/nomiss.c:316:29: error: no member named 'cpu' in 'struct thread_info'
     316 |                 task_thread_info(target)->cpu = 0;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:317:28: error: no member named 'cpu' in 'struct thread_info'
     317 |                 task_thread_info(other)->cpu = 0;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~  ^
   2 errors generated.


vim +316 kernel/trace/rv/monitors/nomiss/nomiss.c

   297	
   298	void rv_test_nomiss(struct kunit *test)
   299	{
   300		struct task_struct *target, *other;
   301		struct rv_kunit_ctx *ctx = test->priv;
   302	
   303		da_prepare_test(test, &rv_this);
   304		target = kunit_kzalloc(test, sizeof(struct task_struct), GFP_KERNEL);
   305		KUNIT_ASSERT_NOT_NULL(test, target);
   306		other = kunit_kzalloc(test, sizeof(struct task_struct), GFP_KERNEL);
   307		KUNIT_ASSERT_NOT_NULL(test, other);
   308	
   309		if (IS_ENABLED(CONFIG_SMP)) {
   310			if (!IS_ENABLED(CONFIG_THREAD_INFO_IN_TASK)) {
   311				target->stack = kunit_kzalloc(test, sizeof(struct thread_info), GFP_KERNEL);
   312				KUNIT_ASSERT_NOT_NULL(test, target->stack);
   313				other->stack = kunit_kzalloc(test, sizeof(struct thread_info), GFP_KERNEL);
   314				KUNIT_ASSERT_NOT_NULL(test, other->stack);
   315			}
 > 316			task_thread_info(target)->cpu = 0;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
