Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650EA375F76
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534193; cv=none; b=IEni08cbZdQCP5Cfhu1DGeHZb1FbVdmLiMx10hkWm94UUiVjHmrT5lm2BC/es4IGtRNGJxlr3oc2HBa3OvAFwzxwosNWuaztG7cw6SYoLQY9GseGY+fc+04N9Li8TMGrnPkEp1+YBpipjwveEOGbjAd7KnoNxivfASJSISJfCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534193; c=relaxed/simple;
	bh=rWYnWNor3/q7153QzS3pjP24rVn1bcXwJDuAC2slP5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TpKqbCn4I/XufmzEedYifmqzmkT7A/mK4C9v7KKLLsDSkHRJWFLkOAbO/+d6GE4UCjv950Uplgxh9PMEQseFKRVvs4nJwtmVyn6xwMoxwQbryRKnZ+M0o38wefROoa7a2KOzP2bzFjF6Sd42T3AjsGf0rUE37xANXCgEZ99cDfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fG6+2eFa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fG6+2eFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534193; x=1807070193;
  h=date:from:to:cc:subject:message-id;
  bh=rWYnWNor3/q7153QzS3pjP24rVn1bcXwJDuAC2slP5s=;
  b=fG6+2eFaoywgW/H8B+ypFfjwi8bSqD7ENY67xcHY7/0Gojm1UFPEcUru
   zjVThLJGwJxDxbNz/oGYuJB4YvQpmeW1MGFbZa7NGNDg36Glr8qA9z4G7
   sClzAuuN4bSCAG7zddeMPFiwdUjeMxWVIP86Vmx03iFScBmZ8Dol9wb/F
   DWYcRck+qVeFlgBjd1g2p2DOjjEUXcM9zHgkLLkqM/Tn8XDl8T91bY1eE
   wJJ3UNi9QKVG4R7UJB7PGxCWe0wvJCEQfCkzi3Ep0kqN1okc/A5Aci5Tf
   4G42sI8LfGprX80+uidCpwp7y/MxxXWjaGymPKobYFhJfXUlvJ1ub4LUe
   Q==;
X-CSE-ConnectionGUID: H91Ci3+fRoCRF8U69QaMxg==
X-CSE-MsgGUID: cFh/GhX0RDqHVDllUEUsrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563833"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563833"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:31 -0700
X-CSE-ConnectionGUID: t2nb+iWrQKCN8cYed8saqA==
X-CSE-MsgGUID: X5t7VBLSQ52FJTrvLRM0yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926702"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:29 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY8-0000000004j-08CY;
	Tue, 07 Apr 2026 03:56:24 +0000
Date: Tue, 07 Apr 2026 11:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 57/98]
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:31: error: macro
 'KUNIT_ASSERT_EQ' requires 3 arguments, but only 2 given
Message-ID: <202604042032.4DPjmCo6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   dbf3e2d8d5ab9b4a26ad41d244565a4970faec68
commit: aac85b2b324f8d3c2713ee49c1258f6718fa34a5 [57/98] drm/ttm: Check the dma_resv_lock() return value
config: loongarch-randconfig-002-20260404 (https://download.01.org/0day-ci/archive/20260404/202604042032.4DPjmCo6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604042032.4DPjmCo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604042032.4DPjmCo6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_test.c: In function 'ttm_bo_reserve_interrupted':
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:31: error: macro 'KUNIT_ASSERT_EQ' requires 3 arguments, but only 2 given
     227 |         KUNIT_ASSERT_EQ(err, 0);
         |                               ^
   In file included from include/drm/drm_kunit_helpers.h:10,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:13,
                    from drivers/gpu/drm/ttm/tests/ttm_bo_test.c:17:
   include/kunit/test.h:1411:9: note: macro 'KUNIT_ASSERT_EQ' defined here
    1411 | #define KUNIT_ASSERT_EQ(test, left, right) \
         |         ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:9: error: 'KUNIT_ASSERT_EQ' undeclared (first use in this function); did you mean 'KUNIT_ASSERTION'?
     227 |         KUNIT_ASSERT_EQ(err, 0);
         |         ^~~~~~~~~~~~~~~
         |         KUNIT_ASSERTION
   drivers/gpu/drm/ttm/tests/ttm_bo_test.c:227:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/KUNIT_ASSERT_EQ +227 drivers/gpu/drm/ttm/tests/ttm_bo_test.c

   211	
   212	static void ttm_bo_reserve_interrupted(struct kunit *test)
   213	{
   214		struct ttm_buffer_object *bo;
   215		struct task_struct *task;
   216		int err;
   217	
   218		bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
   219	
   220		task = kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-reserve");
   221	
   222		if (IS_ERR(task))
   223			KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
   224	
   225		/* Take a lock so the threaded reserve has to wait */
   226		err = dma_resv_lock(bo->base.resv, NULL);
 > 227		KUNIT_ASSERT_EQ(err, 0);
   228	
   229		wake_up_process(task);
   230		msleep(20);
   231		err = kthread_stop(task);
   232	
   233		dma_resv_unlock(bo->base.resv);
   234	
   235		KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
   236	}
   237	#endif /* IS_BUILTIN(CONFIG_DRM_TTM_KUNIT_TEST) */
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
