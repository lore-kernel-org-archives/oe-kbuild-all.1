Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836102D47E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551954; cv=none; b=O7Qde4leL5l0qGqk4dPGynDj9DP4TLkFHfvdrwdGz91L8Yo2vtan8H2fn8PQfOlaKXumDgcKnTcToRcCbhlOab1rp0bf5LMXSRiYBlQRW+93kXSzRj3qpBGZrU5xvpCuAF7vtPxu1uxJwKiZTL24VJNEfWco3XfQok3Ezw2mFeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551954; c=relaxed/simple;
	bh=HoL2gkxwD0MZAKQd7n56cvFSuDeJhbqmBsPziE50YgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpbu7m1PIkYJI5HBf7/FrEB+zHf63k1ZePFjJcU2Y+qO0GRze2qKLYHyDDB9guSJsfrnFOufeDjNz3U6/CxKAmld8FiK/u3OpaSM0a43OK6zOMMvanJulOtIvjSaJxXmPuR5/Ho/VW56iRhK8XYp+JVYB2Y61uLu/zZG/chP8kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk/Mo9h+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk/Mo9h+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761551952; x=1793087952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HoL2gkxwD0MZAKQd7n56cvFSuDeJhbqmBsPziE50YgU=;
  b=hk/Mo9h+pPYzNbg5HzM3t+cesqMeFhcOB9DHASJFpFUh29UAdsl6JTps
   gCg2q8h9W3OmZ89eBmjedAy1n8sIbweuZH9vX46OkczGXQbIXFjDY4eH0
   MGmbhYwT0orpEP15QBAOLW2zErHQncFH4etyO4B7iYG+DMlydCpchxFMi
   z8bdpQZ6BGFxl084L5MAKK9Y4g1NPmC/EJyjqFx5x9pOxgi0sw1fmwsBH
   MMX/P2A5n1bSw7Tb3MGstTigfUN0+dDpqm/nS+zGmNXYQ5hF5OwtuPEgR
   qEYu2ejV6rCvPqV7GDe7tocb/fyKxRIudxdENxdbmbH84ZHl/xjTwsdE0
   w==;
X-CSE-ConnectionGUID: geiEWzl8TkuIf/rBAElsaA==
X-CSE-MsgGUID: pe7Qyhb7TdGzp/koKyg/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62832828"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="62832828"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 00:59:12 -0700
X-CSE-ConnectionGUID: 7LVjEtYCT4SyxA45gWLSew==
X-CSE-MsgGUID: 60VYmLYZRuOi9vBB69xniA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Oct 2025 00:59:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDI8C-000Gbt-0p;
	Mon, 27 Oct 2025 07:59:08 +0000
Date: Mon, 27 Oct 2025 15:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: arch/riscv/kernel/tests/kprobes/test-kprobes.c:42:undefined
 reference to `kunit_binary_assert_format'
Message-ID: <202510271638.Gc22TPof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: f2fab612824ffc8314d3a752724dd37a3ce27a31 riscv: Add kprobes KUnit test
date:   6 weeks ago
config: riscv-randconfig-r051-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271638.Gc22TPof-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271638.Gc22TPof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271638.Gc22TPof-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/tests/kprobes/test-kprobes.o: in function `test_kprobe_riscv':
>> arch/riscv/kernel/tests/kprobes/test-kprobes.c:42:(.text+0x198): undefined reference to `kunit_binary_assert_format'
>> riscv64-linux-ld: arch/riscv/kernel/tests/kprobes/test-kprobes.c:44:(.text+0x1bc): undefined reference to `__kunit_do_failed_assertion'
>> riscv64-linux-ld: arch/riscv/kernel/tests/kprobes/test-kprobes.c:38:(.text+0x1d0): undefined reference to `kunit_binary_assert_format'
   riscv64-linux-ld: arch/riscv/kernel/tests/kprobes/test-kprobes.c:38:(.text+0x1f4): undefined reference to `__kunit_do_failed_assertion'
>> riscv64-linux-ld: arch/riscv/kernel/tests/kprobes/test-kprobes.c:31:(.text+0x246): undefined reference to `kunit_unary_assert_format'
   riscv64-linux-ld: arch/riscv/kernel/tests/kprobes/test-kprobes.c:24:(.text+0x262): undefined reference to `__kunit_do_failed_assertion'


vim +42 arch/riscv/kernel/tests/kprobes/test-kprobes.c

    12	
    13	static void test_kprobe_riscv(struct kunit *test)
    14	{
    15		unsigned int num_kprobe = 0;
    16		long (*func)(void);
    17		struct kprobe *kp;
    18		int i;
    19	
    20		while (test_kprobes_addresses[num_kprobe])
    21			num_kprobe++;
    22	
    23		kp = kcalloc(num_kprobe, sizeof(*kp), GFP_KERNEL);
    24		KUNIT_EXPECT_TRUE(test, kp);
    25		if (!kp)
    26			return;
    27	
    28		for (i = 0; i < num_kprobe; ++i) {
    29			kp[i].addr = test_kprobes_addresses[i];
    30			kp[i].pre_handler = kprobe_dummy_handler;
  > 31			KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp[i]));
    32		}
    33	
    34		for (i = 0;; ++i) {
    35			func = test_kprobes_functions[i];
    36			if (!func)
    37				break;
  > 38			KUNIT_EXPECT_EQ_MSG(test, KPROBE_TEST_MAGIC, func(), "function %d broken", i);
    39		}
    40	
    41		for (i = 0; i < num_kprobe; ++i)
  > 42			unregister_kprobe(&kp[i]);
    43		kfree(kp);
  > 44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
