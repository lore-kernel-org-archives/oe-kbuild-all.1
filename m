Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79522DF5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992131; cv=none; b=HmLSLwyDGI+ocTja3cFqkURIvt9JgU5MXEiUIUHX23K6OwViTvVSBnHlI0E9tVemGQ6z2UeePzVho6v9TfXt3X+UJ4i1Yjao0Q065hbFD2yATMmbCVLLe3RqkEaFL55/T+vosRzYLuIe83kkng51GoyvHnwRxLa7iYUjefg0VV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992131; c=relaxed/simple;
	bh=m8uaoc0aJ8WwnCFzt2b+ANcV1afsfOeUWsAHEkvGwek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lNZAl7XvRNA6NryQICL6A3dxaGRIKzUpBfsl0w0zzh+Vs2+rVVgfg0SD0mdQrbeSMr5EourjML+lujHyhKHUUPqs/4yUT7FBgYKBvzMQaw2pBREOaw4adTUVyONjTIcijZdal8sABNBD/fTqi1mrhGuhP2vrSTX5suyFyl1GezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXlvc3fq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXlvc3fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729992128; x=1761528128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m8uaoc0aJ8WwnCFzt2b+ANcV1afsfOeUWsAHEkvGwek=;
  b=gXlvc3fqcYIF81nQ2GHMRTvDLskW01776nYI0GXN0UiddNHG8PJ1k1Pg
   5lmPtxqUeP/tNiYhY0ZcWAORJ6LWpYVZof58QUFLtKPAZbIVyejEwGF/i
   QHVN5GTlZ9VP7+VBk7VOSoqgPmM1xoWaBbatJpkmsKRKEOaREOBiepYSf
   sT9iO4Ix85aCzZvMni0DJvtnZABxuzd76WfrSCV/beGaIS61PO4wrYygc
   cTbRuoL95PEJB2Kh/eZhoUltEoa3X87eIk/kquJlLmxsXhqgt3Uc8+8wX
   9xNPQ8tYRhjbIpUtJPdK6lKAUaYYLmBYjE/eeJo2yrQKl52cpoUQjMdo2
   Q==;
X-CSE-ConnectionGUID: Lg73EcujQIqk0lAOzrZYVA==
X-CSE-MsgGUID: BHSo4K/pRpmD33+lQycCUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47087585"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47087585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 18:22:05 -0700
X-CSE-ConnectionGUID: TuwKJ+lBQsSbB1iZJOYfTg==
X-CSE-MsgGUID: 5RnjQNoQQeyagVYVv++cCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="80857187"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2024 18:22:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ryj-000aEy-1Q;
	Sun, 27 Oct 2024 01:22:01 +0000
Date: Sun, 27 Oct 2024 09:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 23167/23866]
 include/asm-generic/atomic-instrumented.h:33:9: warning: 'wait_req' may be
 used uninitialized
Message-ID: <202410270910.yAllU1Un-lkp@intel.com>
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
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 6741506ca02825b90e77088e8fce01c3d02edfdd [23167/23866] nilfs2: fix unexpected freezing of nilfs_segctor_sync()
config: x86_64-buildonly-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270910.yAllU1Un-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270910.yAllU1Un-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270910.yAllU1Un-lkp@intel.com/

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
