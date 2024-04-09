Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F15A54729
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 02:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712629942; cv=none; b=ISkvcAADt1RQRyQ5tcJyfDecvy2z0HqcwVNCPNuuFPnsNd98GynpwsrbRNhrgEAB/gzERi0q0BYjTcB/zdAT//36XRR3gw8bE1wClSmR3lcGAR0gY9i0GJnkS7KK+PmuKcifTXLvmXlve/YSlyYbjDghkFoFZd+h7imlsLE/Pnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712629942; c=relaxed/simple;
	bh=+dLhn3QOSc8XCGXSzI0B6UIrUd6uipXc4Ax/ZO9eRfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YDxK//x8qE5Zmah4iiLtOYrsVVW3e8yGthRvx+P82BuVtkCgC6eeadBZiwdetAWxkRRiPkj/tCy78GpEPOmoLO4QWW3CPcD6b2tagS+RYx8f89au3FuSSYh5KLbDjZ9g+A91Xh8yJgFyB6XpK6mZvTCt7+4CtrMzyDmAXWXxSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eym9RTXY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eym9RTXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712629940; x=1744165940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+dLhn3QOSc8XCGXSzI0B6UIrUd6uipXc4Ax/ZO9eRfY=;
  b=eym9RTXYj8MTI0XOKIHpoUzATq4SphZiQb6SvGe8jaMZTLvwX11jy/ZJ
   O1rYV2NIOpAvsjRg9rPgyncWLbg9r+w1P4zxO0Q3v18J3bAr60oaUtHsK
   bQ+uA/7yQP3kImlux9d7y1Jhu1ldT2JhAgFXoDiIQ8bp03SND8OlvQ7OR
   d0b9AiRtLadmyvFAzcxHj+KVEMeJ57tE5w/Up2xgT8UDnXoFVHT5HUQ16
   ssJPqR5b2GdJfKQFkorH7eXKCdrGprO4xCgKbSprdI3UE8ld13dsgQGub
   kZlvYX0ix/Naskb9NNtuW6yBksl1X9AsX/Qouz7igWqDS28t65nwzIjGM
   w==;
X-CSE-ConnectionGUID: n8QvZR1MR+GseFr5ked1qg==
X-CSE-MsgGUID: B2YahQ3pS++zdUSbtp1Pug==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8160552"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="8160552"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 19:32:19 -0700
X-CSE-ConnectionGUID: 2EPzJeO/RTmlPYqfF7Up7g==
X-CSE-MsgGUID: wxK8VbDrQlWstLWZeATFcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="20196209"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Apr 2024 19:32:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru1HS-0005dm-2s;
	Tue, 09 Apr 2024 02:32:14 +0000
Date: Tue, 9 Apr 2024 10:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wei Tian <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21385/22056]
 drivers/tee/optee/core.c:618:31: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202404091014.UzbOQtd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Ard,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   11b92ddca3376d425d16b81adebee1e8033e3df0
commit: 595311cf7e49c781dd26782e4b45fd54bbfb3e40 [21385/22056] optee: model OP-TEE as a platform device/driver
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240409/202404091014.UzbOQtd8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404091014.UzbOQtd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091014.UzbOQtd8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/optee/core.c:618:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got void * @@
   drivers/tee/optee/core.c:618:31: sparse:     expected int
   drivers/tee/optee/core.c:618:31: sparse:     got void *
   drivers/tee/optee/core.c: In function 'optee_probe':
   drivers/tee/optee/core.c:618:24: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     618 |                 return ERR_PTR(-EINVAL);
         |                        ^~~~~~~~~~~~~~~~

vim +618 drivers/tee/optee/core.c

595311cf7e49c7 Ard Biesheuvel    2019-12-09  581  
595311cf7e49c7 Ard Biesheuvel    2019-12-09  582  static int optee_probe(struct platform_device *pdev)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  583  {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  584  	optee_invoke_fn *invoke_fn;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  585  	struct tee_shm_pool *pool;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  586  	struct optee *optee = NULL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  587  	void *memremaped_shm = NULL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  588  	struct tee_device *teedev;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  589  	u32 sec_caps;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  590  	int rc;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  591  
595311cf7e49c7 Ard Biesheuvel    2019-12-09  592  	invoke_fn = get_invoke_func(&pdev->dev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  593  	if (IS_ERR(invoke_fn))
595311cf7e49c7 Ard Biesheuvel    2019-12-09  594  		return PTR_ERR(invoke_fn);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  595  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  596  	if (!optee_msg_api_uid_is_optee_api(invoke_fn)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  597  		pr_warn("api uid mismatch\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  598  		return -EINVAL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  599  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  600  
5c5f80307ab27c Jérôme Forissier  2017-11-24  601  	optee_msg_get_os_revision(invoke_fn);
5c5f80307ab27c Jérôme Forissier  2017-11-24  602  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  603  	if (!optee_msg_api_revision_is_compatible(invoke_fn)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  604  		pr_warn("api revision mismatch\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  605  		return -EINVAL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  606  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  607  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  608  	if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  609  		pr_warn("capabilities mismatch\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  610  		return -EINVAL;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  611  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  612  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  613  	/*
4fb0a5eb364d23 Jens Wiklander    2015-04-14  614  	 * We have no other option for shared memory, if secure world
4fb0a5eb364d23 Jens Wiklander    2015-04-14  615  	 * doesn't have any reserved memory we can use we can't continue.
4fb0a5eb364d23 Jens Wiklander    2015-04-14  616  	 */
4fb0a5eb364d23 Jens Wiklander    2015-04-14  617  	if (!(sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM))
4fb0a5eb364d23 Jens Wiklander    2015-04-14 @618  		return ERR_PTR(-EINVAL);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  619  
f58e236c9d665a Volodymyr Babchuk 2017-11-29  620  	pool = optee_config_shm_memremap(invoke_fn, &memremaped_shm, sec_caps);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  621  	if (IS_ERR(pool))
595311cf7e49c7 Ard Biesheuvel    2019-12-09  622  		return PTR_ERR(pool);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  623  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  624  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  625  	if (!optee) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  626  		rc = -ENOMEM;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  627  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  628  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  629  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  630  	optee->invoke_fn = invoke_fn;
d885cc5e0759fc Volodymyr Babchuk 2017-11-29  631  	optee->sec_caps = sec_caps;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  632  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  633  	teedev = tee_device_alloc(&optee_desc, NULL, pool, optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  634  	if (IS_ERR(teedev)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  635  		rc = PTR_ERR(teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  636  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  637  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  638  	optee->teedev = teedev;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  639  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  640  	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  641  	if (IS_ERR(teedev)) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  642  		rc = PTR_ERR(teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  643  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  644  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  645  	optee->supp_teedev = teedev;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  646  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  647  	rc = tee_device_register(optee->teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  648  	if (rc)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  649  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  650  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  651  	rc = tee_device_register(optee->supp_teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  652  	if (rc)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  653  		goto err;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  654  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  655  	mutex_init(&optee->call_queue.mutex);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  656  	INIT_LIST_HEAD(&optee->call_queue.waiters);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  657  	optee_wait_queue_init(&optee->wait_queue);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  658  	optee_supp_init(&optee->supp);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  659  	optee->memremaped_shm = memremaped_shm;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  660  	optee->pool = pool;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  661  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  662  	optee_enable_shm_cache(optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  663  
595311cf7e49c7 Ard Biesheuvel    2019-12-09  664  	platform_set_drvdata(pdev, optee);
595311cf7e49c7 Ard Biesheuvel    2019-12-09  665  
4fb0a5eb364d23 Jens Wiklander    2015-04-14  666  	pr_info("initialized driver\n");
595311cf7e49c7 Ard Biesheuvel    2019-12-09  667  	return 0;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  668  err:
4fb0a5eb364d23 Jens Wiklander    2015-04-14  669  	if (optee) {
4fb0a5eb364d23 Jens Wiklander    2015-04-14  670  		/*
4fb0a5eb364d23 Jens Wiklander    2015-04-14  671  		 * tee_device_unregister() is safe to call even if the
4fb0a5eb364d23 Jens Wiklander    2015-04-14  672  		 * devices hasn't been registered with
4fb0a5eb364d23 Jens Wiklander    2015-04-14  673  		 * tee_device_register() yet.
4fb0a5eb364d23 Jens Wiklander    2015-04-14  674  		 */
4fb0a5eb364d23 Jens Wiklander    2015-04-14  675  		tee_device_unregister(optee->supp_teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  676  		tee_device_unregister(optee->teedev);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  677  		kfree(optee);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  678  	}
4fb0a5eb364d23 Jens Wiklander    2015-04-14  679  	if (pool)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  680  		tee_shm_pool_free(pool);
4fb0a5eb364d23 Jens Wiklander    2015-04-14  681  	if (memremaped_shm)
4fb0a5eb364d23 Jens Wiklander    2015-04-14  682  		memunmap(memremaped_shm);
595311cf7e49c7 Ard Biesheuvel    2019-12-09  683  	return rc;
4fb0a5eb364d23 Jens Wiklander    2015-04-14  684  }
4fb0a5eb364d23 Jens Wiklander    2015-04-14  685  

:::::: The code at line 618 was first introduced by commit
:::::: 4fb0a5eb364d239722e745c02aef0dbd4e0f1ad2 tee: add OP-TEE driver

:::::: TO: Jens Wiklander <jens.wiklander@linaro.org>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
