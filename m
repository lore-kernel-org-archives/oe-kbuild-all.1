Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0DC64A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588944; cv=none; b=Sgnqm9A58fmlw5uC8eox/kBXaMugNh+gpeNpp0AhA1qfNVnRN0r8BhhjyGRHYFUyLGNkxdzhlmB/3DtXcQCqGh4s3ap75A849Y7dGjgz7O/il087vlpvo6jhuyKKqiNtvjhYiCSLgb7uyVZjVx1hXEafJ/pluAxKozlh2GO+e18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588944; c=relaxed/simple;
	bh=nhQ0hcga5jl6ofTCn8WpnE9CaWFHd/2CvQysOoJXwnE=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding; b=CC6Li4Ef03Yoeab4x+CwZg227CqELxW6e4g8XSZ+Fsj41LPfGFzicdAAEM5PSZXaqracCv3JxyBibV3lF58eWIByhaDSRiz1lk40/FoPBL4sfxjfamVFDv6FsWsAQyeBzjBKI1KC/KlVE7Gz9ddmxsmS94UgJx3NM+/VKMOh0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gf37xqYj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gf37xqYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705588942; x=1737124942;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nhQ0hcga5jl6ofTCn8WpnE9CaWFHd/2CvQysOoJXwnE=;
  b=gf37xqYjNXmdS6j1L9ulQH21Uc3s3lu8zmgJJSxLC5YIUqHF7Aw1O6DJ
   FpLbw7SOkpOp/EDzsPaohIjkLBPANcbXhXw4vzyxTpnk0n9dlq16QB2oP
   hYZw/CAF/bZqvAfEmlmwpsaHzHNEzk33OvCvyIvyh4+rRSbpHG0ul/W3N
   UvFbkpFFUywh5emmoFNuRHSP5awryeTf8KvVsuNug5uTiUYVFM7oauRLw
   oOfj+4BOXaMQmstpyffz173LJhpzAI5J+imvZAVEn7NJ2hzz6/rBsQId/
   SiPO/q6gqpgvYJ4GBdxUvIe13uftSlAtmxix6Wx8Fkc7gbx+3waGaYFpv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19059545"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="19059545"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 06:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="331096"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jan 2024 06:42:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQTay-000338-1Q;
	Thu, 18 Jan 2024 14:42:16 +0000
Date: Thu, 18 Jan 2024 22:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21385/21559]
 drivers/tee/optee/core.c:618:24: warning: returning 'void *' from a function
 with return type 'int' makes integer from pointer without a cast
Message-ID: <202401182214.N2WXEFKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8135318753544d6f8afa1f01a47c81fbccb59e39
commit: 595311cf7e49c781dd26782e4b45fd54bbfb3e40 [21385/21559] optee: model OP-TEE as a platform device/driver
config: arm64-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20240118/202401182214.N2WXEFKb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182214.N2WXEFKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182214.N2WXEFKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tee/optee/core.c: In function 'optee_probe':
>> drivers/tee/optee/core.c:618:24: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
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
