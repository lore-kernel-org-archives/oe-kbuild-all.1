Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169C13B787
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042627; cv=none; b=DL7Q+beQFsA26r3YIrfF/UNMUUj658keNxT61++TllE6rzXNUG5h0fygycG4tYi/CPc/P+bnHCcMWj6rJFsGDKKCHELVAwZhH058mCu3EK1pgml8GrNOEzVt1AGzgXwCdimNq9jLtnBgPTdIHeDlKQYKM5cAI0dhqzLpqTkrM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042627; c=relaxed/simple;
	bh=te5qiaT8UFm6Vi70BQaYe2acR4TgN0M9Dw0e4KEWU7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jv+J3NEMPZFkduqD2ZdoLTwILfIXpHWPRGPFxTEY1aCvGiMPry5mR+9ORgk4Pgp+Ml8s5nsf3vwy9nbNkMdOqzIAxCVQaOfJTFsKr9KG2tUcySpPXCvKaYD48a1tywvwPIOIbVU6kermlddO5deuglSVwGGwOQtWGLVh2PRz/hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3TWAS52; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3TWAS52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729042626; x=1760578626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=te5qiaT8UFm6Vi70BQaYe2acR4TgN0M9Dw0e4KEWU7o=;
  b=d3TWAS52LtF5/JNdcR71H2tbO6Bxl19rKClAuRMsJKMFAI1i5Nlq5aY8
   tfpTeo5UOMXRS8R5/RPNExuNb8wiU9D/10zXUV6+KhyYjYcr+G11lpwti
   k+ahFahXR/Nlsw/Mc318qHR4OObPUJ+nAqRy2akNAcOTU9YyLHg71VdH7
   jlr1YhjAATaZqKlNAutvDZgzXw5Oityb2ldciewTIbhSCUnr0mxJoL+G7
   8kr9kfuTHo3L72BADzHFyPWbcQh543gqq/m8/ZONezGymPdxQMvLIgpLE
   aD/4B2O4q3tbNItCrSLHW0Zke9GrXpvIGmjS72pL/DzM8+V4M11Ki/NrV
   w==;
X-CSE-ConnectionGUID: 0Oh6rToGRkWsFuvLmAzMLg==
X-CSE-MsgGUID: +3zzPPJGQO6LqKPuBmqdIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32162876"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32162876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 18:37:05 -0700
X-CSE-ConnectionGUID: 8ongZS+rSuifpaP2DaLIgg==
X-CSE-MsgGUID: KYoAbmtsR4qDWGGG8iRl+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78910945"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2024 18:37:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0syD-000K8f-2g;
	Wed, 16 Oct 2024 01:37:01 +0000
Date: Wed, 16 Oct 2024 09:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap5 1/13] include/linux/objpool.h:173:6:
 error: variable 'start' set but not used
Message-ID: <202410160948.7SEfTmD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap5
head:   d2ce21c762c90540ac4114fe274ffa7bb0627c4c
commit: baca98459e3b3f1c64f4d61deba92fa15a0a1c91 [1/13] objpool: rework objpool_pop()
config: i386-buildonly-randconfig-005-20241016 (https://download.01.org/0day-ci/archive/20241016/202410160948.7SEfTmD4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160948.7SEfTmD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160948.7SEfTmD4-lkp@intel.com/

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
