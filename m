Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F6747F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720070255; cv=none; b=sQbMwDWaACOzlpRyZMUFoR0xsTU1t6AOTr+m7yjjhJ0NzznWGLOHGIJrrstOkowojH0K3Opl3qM2d5r4481ihbCOhMO2ADlDiUoYRKTTuOAm/uEgeDTm2AlKpc95AW/7OmukuND2jPeGoT59nsJvtB9U+/CgJBT/9nl7PJdMXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720070255; c=relaxed/simple;
	bh=xNoNYHBopBUh83boDhDF3eGjETFbc52PNtY89nRIhJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5YLPpz4ZBcgJJrxlaImbKPKwcaopmWg15FVGfua7CM9K1JZio8BfM2WPEzukmxWRqA1oXWgmN5CrW54Ab5z44h4qAer73sEQESOeruRlhkI4Nos9IICe4YIJ7TpiXYHpPFpOQ8P8zAi8jpplSsK6bDcf2olLe6vtwGUeKi0iaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8o7bUnZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8o7bUnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720070252; x=1751606252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xNoNYHBopBUh83boDhDF3eGjETFbc52PNtY89nRIhJc=;
  b=A8o7bUnZL5MbA3NnjGIpB6g+PhYijcz927tL3Dr43Ty9E0Ci/6gxCtXy
   mOl4GMYaMraQvWBE+Y32ZCNZ0tuAGUtvcelNdmQ6i5tBuqcHsLFxrgMAn
   6agvUwoEehKQkvDK0Oj7g9XfVKK9heq4OyjV1AMVX8QPptvNqJzN7bZ9C
   QM1fxZCmmRsu8evswgsKKqiSfHHsZyflU8uCVTVP3/oIaKy8gIKaa0Q+h
   pFFqQB8Yx6/KtYNugmzcXtX+NA15fsm1fq3A+XrJtF/elJEQdCkXenMRm
   p3MrsbOgzWbZHRhct2IrTnne70IKrt+Ss3ufKdvEwc5MQO9jFLppBPcnY
   A==;
X-CSE-ConnectionGUID: k2bsCyMzStCVVb2DFrO/zQ==
X-CSE-MsgGUID: eCcjvSQhSzeUseRblDksBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27930051"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27930051"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 22:17:32 -0700
X-CSE-ConnectionGUID: mQmjq9lMQ2SqiNGCSGs3Mw==
X-CSE-MsgGUID: OceHYJ4WRHebj4rwTcZQeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="77212871"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2024 22:17:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPEqV-000QaY-2H;
	Thu, 04 Jul 2024 05:17:27 +0000
Date: Thu, 4 Jul 2024 13:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 23159/23203]
 include/asm-generic/atomic-instrumented.h:33:9: warning: 'wait_req' may be
 used uninitialized
Message-ID: <202407041352.YmlrzTKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3747e12f550e11fcfb6878af5c6e88f3e4af0d1f
commit: 6741506ca02825b90e77088e8fce01c3d02edfdd [23159/23203] nilfs2: fix unexpected freezing of nilfs_segctor_sync()
config: x86_64-buildonly-randconfig-005-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041352.YmlrzTKf-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041352.YmlrzTKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041352.YmlrzTKf-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:265,
                    from arch/x86/include/asm/msr.h:67,
                    from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_bits.h:22,
                    from include/linux/thread_info.h:14,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:11,
                    from include/linux/pagemap.h:8,
                    from fs/nilfs2/segment.c:11:
   In function 'atomic_set',
       inlined from 'nilfs_segctor_sync' at fs/nilfs2/segment.c:2175:2:
>> include/asm-generic/atomic-instrumented.h:33:9: warning: 'wait_req' may be used uninitialized [-Wmaybe-uninitialized]
      33 |         kasan_check_write(v, sizeof(*v));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:265,
                    from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:10:
   include/linux/kasan-checks.h: In function 'nilfs_segctor_sync':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   fs/nilfs2/segment.c:2170:43: note: 'wait_req' declared here
    2170 |         struct nilfs_segctor_wait_request wait_req;
         |                                           ^~~~~~~~


vim +/wait_req +33 include/asm-generic/atomic-instrumented.h

b06ed71a624ba0 Dmitry Vyukov 2018-01-29  30  
b06ed71a624ba0 Dmitry Vyukov 2018-01-29  31  static __always_inline void atomic_set(atomic_t *v, int i)
b06ed71a624ba0 Dmitry Vyukov 2018-01-29  32  {
a35353bb9eb199 Dmitry Vyukov 2018-01-29 @33  	kasan_check_write(v, sizeof(*v));
b06ed71a624ba0 Dmitry Vyukov 2018-01-29  34  	arch_atomic_set(v, i);
b06ed71a624ba0 Dmitry Vyukov 2018-01-29  35  }
b06ed71a624ba0 Dmitry Vyukov 2018-01-29  36  

:::::: The code at line 33 was first introduced by commit
:::::: a35353bb9eb1990a44a0d7585f99e9589bcdb682 locking/atomic, asm-generic: Add KASAN instrumentation to atomic operations

:::::: TO: Dmitry Vyukov <dvyukov@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
