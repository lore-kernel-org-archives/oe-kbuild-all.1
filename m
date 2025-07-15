Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE8274670
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582976; cv=none; b=naSPKOOs1VK9JDGtk/RYIS8uRbObRF91LjFW6QScL1U5nflqD9yWi6bWh8rI2F4Pc7b3iX2b68rwbK0ZTI5d9GzX5cvPpzfdSGoAMh7YqdJvkRwZg/D58oHGbyGH9PRAWGt5rk8cEPsU41Z1zmSJ0Tc19rYm+H8Fj3SV1WJVqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582976; c=relaxed/simple;
	bh=O1RTTa1rg+kgsTT7eBb+1NRsvLS4FlKzZtCybtfBAgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0m0e7c3qaKOhwTPqUqoi1+4WrykhNxT6gMSuqmwvxpt4wAtjsOhslhLeJjyiuVkbbRwDsO90j8QyHeIivlBg1w8jfZZOLLnNNHz6VOgTOnpTmDQJ2+njGfGYoLwGOo4HRMH+KiawYxUawIJfWoZMwdpDaTXuMPZOsHiQ4aXNQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5xo9dTt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5xo9dTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752582975; x=1784118975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1RTTa1rg+kgsTT7eBb+1NRsvLS4FlKzZtCybtfBAgo=;
  b=K5xo9dTtcR7dCR87Vg2TvOyyr3J0OxOLHKb1gU/B7tlR21qgEQjKYfUg
   O0ajOJCnmFTgnZ6nSI9V/0hzk6k/HWWNOUd6Pd6cjIx0OX1C3+kxY04LQ
   7qFUxHCIXs4h3sIvCnptXYX4pmyJFmqPXxccKbK5urdRQ4Dlwh9TXgLJH
   HGqtEfv20+hbjOw6vBXu/T0pFqWcu44rL5ecOHCm1cd/1J7zOWHxnuoV9
   4luWCBKJKtWFkBgukZTO0z6VsrqHhCEnuZaHy6RK/xlMi76hp9PcC4blk
   s0WaHu1MZvH2Sj5LdtbUiBBME0EoTT5z7Hqujq6Hm7+pftAYjpdNDUYV0
   Q==;
X-CSE-ConnectionGUID: JUCQ2N1nSnWKTS7I311fMA==
X-CSE-MsgGUID: aihdELBZTaSIKrutNo9TxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66248952"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="66248952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 05:36:14 -0700
X-CSE-ConnectionGUID: wrmd6uEOS7W869s4bcGkng==
X-CSE-MsgGUID: 12bnxO2pQGGuwI9RVstqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157320389"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jul 2025 05:36:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubetD-000A3h-0p;
	Tue, 15 Jul 2025 12:36:07 +0000
Date: Tue, 15 Jul 2025 20:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1731/1731]
 include/asm-generic/atomic-instrumented.h:33:9: warning: 'wait_req' may be
 used uninitialized
Message-ID: <202507152045.SLxyTVEc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ryusuke,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   eabd480503b5c662a59778c9fa8c1a8f611d724e
commit: 6741506ca02825b90e77088e8fce01c3d02edfdd [1731/1731] nilfs2: fix unexpected freezing of nilfs_segctor_sync()
config: x86_64-buildonly-randconfig-004-20250715 (https://download.01.org/0day-ci/archive/20250715/202507152045.SLxyTVEc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152045.SLxyTVEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152045.SLxyTVEc-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:265,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:186,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
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
                    from include/linux/mm.h:10,
                    from include/linux/pagemap.h:8,
                    from fs/nilfs2/segment.c:11:
   fs/nilfs2/segment.c: In function 'nilfs_segctor_sync':
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
