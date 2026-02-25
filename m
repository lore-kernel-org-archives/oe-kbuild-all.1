Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976B3B8BD1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026376; cv=none; b=FIjUgp0YdzykLwtjpH7RCOGAoXfpgPnx5DoiD15wpTGdh4rYOGV0u4ymeXLTuU46kfqcLFz83DUmB+MkmQfB7c/LSFA9oNMF+/hAm7aLcyFIJSRJzImU/XxkY/Wkjq1v4mv2aiSpoQx8rPX1jz5Mn15NALSR+f7FCI7zggVF+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026376; c=relaxed/simple;
	bh=d9r/KECvT02jL336jn6dy9EmCuV7SKiK7Su71W1ypnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BOwKTapYfNLq0XSMJPHE2mAL7MyrhIw5svmJwxlT1Ngqbnxiz86mcFX1uNfG5V9f279rrrGQinzaMSazzisWPDAxOgYc4AEN1kV4BY9MGk8evI3EHUfBUHC/WE6DraMFc6lFfrI5RaLe9TsK1QbbH1KhletdpeCy9BGK2UMeU1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlVwB/Tw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlVwB/Tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772026375; x=1803562375;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d9r/KECvT02jL336jn6dy9EmCuV7SKiK7Su71W1ypnU=;
  b=hlVwB/Twm8Fx+9fcxIxkAD3zu5PDJFXYvOdFCZSpSndhvUfvkuBxElCx
   A2DkM1KYO4kq3/I8qPYj/ynstFsbH+nyaS4NYV4L9gYe3PsZL8Lko24CR
   CQGCDTvXAJqzNQPqkuYzMic3+TSnrZjbFXCEMa4JPcSWHT7NcI0bErg8p
   HPv7elWba54dHeEB/x/I/uAq2cIkEqaS2StiKRinc6y3lEUI3iiSAdSxZ
   F2p/HgL4mTDK3AusioqbOlwqrHKBot3hvhp2Cy1OJv1ZDhpEN7CwbptHK
   T8HR7g0gdOIp2lGfh6XsupF00P0jnJzbKlBMd7CSaMWCO7oUmcYKL79y6
   A==;
X-CSE-ConnectionGUID: fN1EsgMkQ1uR4b6OZnBbcg==
X-CSE-MsgGUID: Yjd2Dde7SFeGT2LpHcod+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95679604"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="95679604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:32:55 -0800
X-CSE-ConnectionGUID: AO1CdmHZT72zvdr2sXR05A==
X-CSE-MsgGUID: 6dwk4nmsTAibQsIkzsszWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="220727748"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2026 05:32:53 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvF0D-000000005pf-21ON;
	Wed, 25 Feb 2026 13:32:37 +0000
Date: Wed, 25 Feb 2026 21:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:sched/preempt-dynamic-optimizations 1/1]
 kernel/sched/core.c:7455:13: warning: no previous prototype for
 'dynamic_cond_resched'
Message-ID: <202602252143.hft7gnDD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git sche=
d/preempt-dynamic-optimizations
head:   16adb0d62633d31709c26ea63ab9de6ec1bbdf4e
commit: 16adb0d62633d31709c26ea63ab9de6ec1bbdf4e [1/1] sched: Avoid generat=
ing cond_resched() code when CONFIG_ARCH_HAS_PREEMPT_LAZY=3Dy
config: loongarch-randconfig-001-20260225 (https://download.01.org/0day-ci/=
archive/20260225/202602252143.hft7gnDD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260225/202602252143.hft7gnDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252143.hft7gnDD-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7455:13: warning: no previous prototype for 'dynamic=
_cond_resched' [-Wmissing-prototypes]
    7455 | int __sched dynamic_cond_resched(void)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/dynamic_cond_resched +7455 kernel/sched/core.c

48f24c4da1ee7f3 kernel/sched.c      Ingo Molnar        2006-07-03  7448 =20
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7449  # =
 define might_resched_dynamic_enabled	__cond_resched
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7450  # =
 define might_resched_dynamic_disabled ((void *)&__static_call_return0)
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7451  DE=
FINE_STATIC_CALL_RET0(might_resched, __cond_resched);
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7452  EX=
PORT_STATIC_CALL_TRAMP(might_resched);
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7453  # =
elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7454  st=
atic DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07 @7455  in=
t __sched dynamic_cond_resched(void)
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7456  {
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7457  	i=
f (!static_branch_unlikely(&sk_dynamic_cond_resched))
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7458  		=
return 0;
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7459  	r=
eturn __cond_resched();
700a78335fc28a5 kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  746=
0  }
04746ed80bcf313 kernel/sched/core.c Ingo Molnar        2024-04-07  7461  EX=
PORT_SYMBOL(dynamic_cond_resched);
700a78335fc28a5 kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  746=
2 =20

:::::: The code at line 7455 was first introduced by commit
:::::: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out k=
ernel/sched/syscalls.c from kernel/sched/core.c

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
