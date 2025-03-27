Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8D017BA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743055976; cv=none; b=g9eosMvbcPK1ucAGPyKNesfOxRQoOC/xphojxQ1C4nWg5lIToOvIEhecq2nmG/FtuunIZiCV4/oam+g8z0PwQgZoeDb4jLPc+G5JnoLCiRYbmYx4cigwGUKQtk7h9qMJzl8kHchWKauGEze9PcaKHZOZwnBvqfSJzU4sKe617lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743055976; c=relaxed/simple;
	bh=D3dgqXwJwK6WgcyxruitQplArl0UcFmwQ352E0VTStE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZFaCvncoGw4u3d3fvl3cLXuVSm/ML81uOMJzlxkv9jK2ymBrhUU9xGzc6+QXhqgrYqqUC+kKwi+WlLbipIJC8ichwzebkbsiHVDPKd8nNMh8QorsCl/6GyrYMt4W4EVw/eFm8KHNwpp74fk9cK//4lzUyrPO3540DWOIi9T6wgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WySJqTl+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WySJqTl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743055975; x=1774591975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3dgqXwJwK6WgcyxruitQplArl0UcFmwQ352E0VTStE=;
  b=WySJqTl+jXcgt53CG1lTe/aIU3wmGphT+Nfe2uuZeL1gMQJsja4WRug+
   Yt//NuKM8ZqEqFH8QPCD64JBsYvp2ma8Dy5auliSoG2fPlxQzjepP7PuB
   a03He8BHre68GRFL5z2hDWy9G+PDU6YpQjL73e7CFRf3t5tnTtGxD2GYn
   6Litrxf4Yt9ghvZm6aRSypy7ertepaFyJzkwDdcg8QOsz21vYQhzyUrUA
   3kzdBFc/9CLS3ovAMUIvdQYO0c0mTlqaZ2NlgyvK7gZx77hWHLYv3OhX5
   vMleRbsnKcq7JoAT9gYv4yijnCW81qDOncoNpxZ2o4X6ymWI0by0+SHWr
   Q==;
X-CSE-ConnectionGUID: A6NbMUoCQ2OgLmdZLdEzbQ==
X-CSE-MsgGUID: GEuQT7IQSa6VKzB4iF98Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31973177"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="31973177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 23:12:53 -0700
X-CSE-ConnectionGUID: TXVHZKhwSPaizSVJ1BLX8A==
X-CSE-MsgGUID: mreLfEZ3QPePPm6iqawJDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="125856495"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2025 23:12:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txgTw-0006Pz-2o;
	Thu, 27 Mar 2025 06:12:48 +0000
Date: Thu, 27 Mar 2025 14:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yifan Qiao <qiaoyifan4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1523/1523]
 include/asm-generic/atomic-instrumented.h:33:9: warning: 'wait_req' may be
 used uninitialized
Message-ID: <202503271341.WPxyfHvo-lkp@intel.com>
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
head:   69d39b683755039471781fee8dc7ed96952f771b
commit: 6741506ca02825b90e77088e8fce01c3d02edfdd [1523/1523] nilfs2: fix unexpected freezing of nilfs_segctor_sync()
config: x86_64-buildonly-randconfig-001-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271341.WPxyfHvo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271341.WPxyfHvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271341.WPxyfHvo-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:265,
                    from include/linux/atomic.h:7,
                    from arch/x86/include/asm/thread_info.h:54,
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
