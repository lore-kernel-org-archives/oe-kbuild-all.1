Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65315C14B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 03:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729049733; cv=none; b=m1H6gJNtFcwkh9+7abcTe+RTRjRM6wdDyZ2F0fu51LChDtVLECciGC57tC0MvrVse7WbiEBRi8QAAzxBKmGc3mSwyCFGKhUmS9iPemTHVkI22w/JEm6TCurAKC8ZKsGmOCJAPHHHC2vCnftQ1CT/k2pgbWpqq5aCoDMFT2TKKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729049733; c=relaxed/simple;
	bh=2r0XWTddl4yepUFkW3TBdzMPf3nP/Gk+Qv9s97Xf9wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+SOkHvfIQ/M5/viekLF+74SdqZLZYXUlDLY6OoH+c0/1/6TaTlCo4L6wt5cFLcpAnwGlN5tI0+nHYmFyVYIyd632RGbMXPuGku0v2EuOc9XyvktTb7NJMGc4sNxp3h8ZSCjbwZpUUDLh6KXaDW3TQigawUimpnHcfKZLXapjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0cpWyMU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0cpWyMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729049732; x=1760585732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2r0XWTddl4yepUFkW3TBdzMPf3nP/Gk+Qv9s97Xf9wA=;
  b=n0cpWyMU7OwmYfk0quYBCGeHaXZ8LWtw3eF0GWIo/5IiBTQNUQpZ3C6J
   enSvp2NBZBEe726GhNf5yEnhV03KDVW93PFeobZhyDi6jb45sxO6xeBB0
   +MVlZL7FkZHTgwCHgSQaFdq2OiEWfBteNREsKQIJJQ2TBw8aWhfErqsHS
   ek+wN83DpNDyL8YEBIK+OO5+F2621nk44pQnku1s18gase9uRLI9slHnN
   fuuRs8iWf/mEulg8Y+nZlUGIgtsUK3/0NO90EK+zrqbjRviOxNYzro2Ya
   feAnzvDKNb3COgUr0xcsXCp/lhL4EYD/hMM0Bu3llLTPjTsnORSGE/AId
   w==;
X-CSE-ConnectionGUID: AYIb+W+tQGSi7NTYNeABfQ==
X-CSE-MsgGUID: FwCSVwnpQ2mxVC6GlCU8DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32172022"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32172022"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:35:31 -0700
X-CSE-ConnectionGUID: PvAJ2EOlT7m/4Ep04kkTsA==
X-CSE-MsgGUID: QKb2nEhkRxCIbCN4KSp/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="82877817"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 20:35:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0uoq-000KEB-05;
	Wed, 16 Oct 2024 03:35:28 +0000
Date: Wed, 16 Oct 2024 11:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap6 1/14] include/linux/objpool.h:173:6:
 error: variable 'start' set but not used
Message-ID: <202410161148.VLlWKc1n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap6
head:   6088c779ec288831ae562a401799bcd2fb6d1bea
commit: e6612c6b35959a3057b2b0f87e691e4eb33d6d64 [1/14] objpool: rework objpool_pop()
config: i386-buildonly-randconfig-005-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161148.VLlWKc1n-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161148.VLlWKc1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161148.VLlWKc1n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_debugfs_crc.c:35:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:29:
>> include/linux/objpool.h:173:6: error: variable 'start' set but not used [-Werror,-Wunused-but-set-variable]
     173 |         int start, cpu;
         |             ^
   1 error generated.


vim +/start +173 include/linux/objpool.h

   162	
   163	/**
   164	 * objpool_pop() - allocate an object from objpool
   165	 * @pool: object pool
   166	 *
   167	 * return value: object ptr or NULL if failed
   168	 */
   169	static inline void *objpool_pop(struct objpool_head *pool)
   170	{
   171		void *obj = NULL;
   172		unsigned long flags;
 > 173		int start, cpu;
   174	
   175		/* disable local irq to avoid preemption & interruption */
   176		raw_local_irq_save(flags);
   177	
   178		start = raw_smp_processor_id();
   179		for_each_possible_cpu_wrap(cpu, start) {
   180			obj = __objpool_try_get_slot(pool, cpu);
   181			if (obj)
   182				break;
   183		}
   184		raw_local_irq_restore(flags);
   185	
   186		return obj;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
