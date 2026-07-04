Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A61F3B8A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783132165; cv=none; b=bjpmcYqI/M/uArxHWPNtPok0bQkksyICa7i8/xYe0V+a9a93dfgF7xbnFdNiHc98y5Rqidfoncr6afanC8zJk6j8T6p9U1BHfVSGppUmbzDv9syg30y50UcS00AtvDaaV7muDpiep0Sk0E+mNHldT56uG9E0/tdXSBb1quVZIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783132165; c=relaxed/simple;
	bh=YZPxXC6VdganJKZzmNQUDUuDmCdZpS2PjzUJCmteC0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dpf8nLe5RBxVc/+c56tmevFWxSZ8tBzzookmIgXyhjNNoI3PpGWl/z6M177dKjKDlauyMQrRHXmH3RSMBZyoX7WXYRdmdJnUsgMlzljfKSUxmHbHmMSEysofM3S4iO6zxgQJ2T892y/XyvfeN3xn/E/g950Ea4Vw1Yhf2ZkCoIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRbRgBLe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRbRgBLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783132163; x=1814668163;
  h=date:from:to:cc:subject:message-id;
  bh=YZPxXC6VdganJKZzmNQUDUuDmCdZpS2PjzUJCmteC0s=;
  b=DRbRgBLe5OnATK5jOhD5KqJVxCzQlbk4tF5oczJAcaNXsOzoVrx79s9l
   o/yqcs4u6QOURu++xAQ0j4+fRKZ23AVuGTsVMoGrtmVnL2LPzQh+lNk9O
   Syew0xPyle+dz8bBuB9A8pe/kirlocfkdyZc4N01GAZ/29eLD2gHF1+06
   XVslHpvaDkelOWxwMIfe1YSND/eNGSP6LBT7AdGyKeMgl/SvUE2BudTAz
   cKekTLlvY9xrAIV9VDgwHK7NsbXF3Fsmmd3jQMdVk+xPFAEUHy+5C1q3S
   N6mNiz1DW68rzzM5iBGYkZ6BdEgJfXsMYOLuUyWDmGCb9Ee30GT/rVETU
   A==;
X-CSE-ConnectionGUID: ZwLAvYsRTBiTQS6DgAezRQ==
X-CSE-MsgGUID: Nc0IItr1Tz2R3qUIPyIRjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="109414356"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="109414356"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:29:23 -0700
X-CSE-ConnectionGUID: 9Nc+3+ZsTwSqrty96kj/cQ==
X-CSE-MsgGUID: aLb2xtXqQkSfWhCXc01rew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252168030"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2026 19:29:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfq86-00000000Cm3-2KjS;
	Sat, 04 Jul 2026 02:29:18 +0000
Date: Sat, 04 Jul 2026 10:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 11/12]
 drivers/accel/adla/adla_job.c:251:15-22: WARNING opportunity for memdup_user
Message-ID: <202607041042.bTOQaUv8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   6a683103bab0575a7d69e0120848527b5c9e1fba
commit: 119db09982ec102b61dafe617a5c1595bea127e1 [11/12] accel: adla: Add driver for Amlogic NPU
config: openrisc-randconfig-r053-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041042.bTOQaUv8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041042.bTOQaUv8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/adla/adla_job.c:251:15-22: WARNING opportunity for memdup_user

vim +251 drivers/accel/adla/adla_job.c

   228	
   229	int adla_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *filp) {
   230		struct drm_adla_submit *submit = data;
   231		struct adla_device *adla = container_of(dev, struct adla_device, drm);
   232		struct adla_file *afile = filp->driver_priv;
   233		struct adla_job *job;
   234		int ret = 0;
   235		u32 id;
   236	
   237		if (/*submit->config_size == 0 || */submit->config_size > SZ_1M)
   238			return -EINVAL;
   239	
   240		job = kzalloc(sizeof (*job), GFP_KERNEL);
   241		if (!job)
   242			return -ENOMEM;
   243	
   244		job->adla = adla;
   245		job->output_modules = submit->output_modules;
   246		job->active_modules = submit->active_modules;
   247		job->fence_modules = submit->fence_modules;
   248		job->dep = submit->dep;
   249	
   250		job->config_size = submit->config_size;
 > 251		job->config = kmalloc(submit->config_size, GFP_KERNEL);
   252		if (!job->config) { ret = -ENOMEM; goto err_free_job; }
   253	
   254		if (copy_from_user(job->config, u64_to_user_ptr(submit->config_ptr),
   255				   submit->config_size)) {
   256			ret = -EFAULT;
   257			goto err_free_config;
   258		}
   259	
   260		job->fixup_count = submit->fixup_count;
   261		if (job->fixup_count) {
   262			job->fixups = kmalloc_array(job->fixup_count,
   263						    sizeof(struct adla_fixup), GFP_KERNEL);
   264			if (!job->fixups) { ret = -ENOMEM; goto err_free_config; }
   265	
   266			if (copy_from_user(job->fixups, u64_to_user_ptr(submit->fixup_ptr),
   267					   job->fixup_count * sizeof(struct adla_fixup))) {
   268				ret = -EFAULT;
   269				goto err_free_fixups;
   270			}
   271		}
   272	
   273		ret = xa_alloc(&adla->pending_jobs, &id, job, xa_limit_32b, GFP_KERNEL);
   274		if (ret) {
   275			dev_err(adla->drm.dev, "xa_alloc failed: %d\n", ret);
   276			goto err_free_fixups;
   277		}
   278	
   279		job->id = id;
   280	
   281		ret = drm_sched_job_init(&job->base, &afile->entity, 1, filp,
   282					 filp->client_id);
   283		if (ret) {
   284			dev_err(adla->drm.dev, "drm_sched_job_init failed: %d\n", ret);
   285			goto err_xa_erase;
   286		}
   287	
   288		drm_sched_job_arm(&job->base);
   289		job->done_fence = dma_fence_get(&job->base.s_fence->finished);
   290		xa_store(&adla->pending_jobs, id, job->done_fence, GFP_KERNEL);
   291		drm_sched_entity_push_job(&job->base);
   292	
   293		submit->out_job_id = id;
   294	
   295		return 0;
   296	
   297	err_xa_erase:
   298		xa_erase(&adla->pending_jobs, id);
   299	err_free_fixups:
   300		kfree(job->fixups);
   301	err_free_config:
   302		kfree(job->config);
   303	err_free_job:
   304		kfree(job);
   305		return ret;
   306	}
   307	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
