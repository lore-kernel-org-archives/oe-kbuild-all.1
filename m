Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E90392819
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469276; cv=none; b=iVAasjhS+Wt5MqWQMvS85WsotA1dSEOd0sJyArxFwGiDapPEtaHTxDa2xweDBcQozoWQxPPKfUCrENgNfTOdGc/QHQeL89TWBNrVY5zSLi/3fhqCFJIsRJKs9MDteGLGQPUnjxYfUt9HEvTao8ILjVFql38OzFEJNdRNp6hPPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469276; c=relaxed/simple;
	bh=J0yqBwRT3dM4ltqjrwa03RiQ2QMKHzHE3OH/tAiMb+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c3HfIll4vpU0PDunloABjBs3y8JelC0MoAanJ17DKX5izcZcOpPbc5BaefINFasPujmafpcaNVGxbvoKX5m0KEAmzgkEWeHr6cPeutCy1bg53ppIQbk6nq5r+e7s7hvu7ei1oOFqMFSwdOmo+2mw9RSfEAdYc/kaYLDtMwCjf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzlhLKHe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzlhLKHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780469275; x=1812005275;
  h=date:from:to:cc:subject:message-id;
  bh=J0yqBwRT3dM4ltqjrwa03RiQ2QMKHzHE3OH/tAiMb+4=;
  b=KzlhLKHead7sP7m0JNhYbgh+hDoWXASF0KR9zXuC1lKE/EBW+vYTTaYe
   ZcRaGIFcnV5lphudEtY2rhJKfwO/04xIBvH0ahDUUl9BmcRZKFtNelZ5b
   TFjpXh9cAc4CZqDikC83sw+nOilL2bB3gXcDn9A1j7NIZ7cFmQGDJAmxK
   9HuLH0Y4ketLaBobV2m2J6HjlDT+ko/zZUD1weB8gHrRyR8sIMJ/p3Wmk
   s5BSNzORXlxSp2ZKIiWxvpRZ3ZGiI8IAZaqoyM3BDqUsWLu149ZB9/CWh
   OuhE/27IEhcZDtq9wbUzooyXmlklACtLmJQ1w24n33TX8qJNyml5+ajgb
   g==;
X-CSE-ConnectionGUID: htmGiTpVTx6ePhBI3uDBnQ==
X-CSE-MsgGUID: WlrvnJ3iRHeHrLoQ5BKcpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81263255"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81263255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 23:47:55 -0700
X-CSE-ConnectionGUID: mNOGIQSCTS2PHwwUxzIE5A==
X-CSE-MsgGUID: vtibQeGvQLmeukoZt9sfZw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2026 23:47:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUfOI-00000000D2M-3d3b;
	Wed, 03 Jun 2026 06:47:50 +0000
Date: Wed, 03 Jun 2026 14:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 2/2]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:310:65: sparse:
 sparse: incorrect type in argument 6 (different address spaces)
Message-ID: <202606031439.hiZP0C2z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   55a3e1d7ad67cda1b71ae576bcb3e6552410b78f
commit: 206030f6a92bd97997fba8ebb86e78058edecb97 [2/2] staging: vchiq_core: Factor out bulk transfer for blocking mode
config: arm-randconfig-r111-20260603 (https://download.01.org/0day-ci/archive/20260603/202606031439.hiZP0C2z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031439.hiZP0C2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 206030f6a92b ("staging: vchiq_core: Factor out bulk transfer for blocking mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031439.hiZP0C2z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:310:65: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void [noderef] __user *userdata @@     got void *[assigned] userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:310:65: sparse:     expected void [noderef] __user *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:310:65: sparse:     got void *[assigned] userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:338:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] userdata @@     got void [noderef] __user *userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:338:26: sparse:     expected void *[assigned] userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:338:26: sparse:     got void [noderef] __user *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:554:47: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] [assigned] bulk_userdata @@     got void *bulk_userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:554:47: sparse:     expected void [noderef] __user *[addressable] [assigned] bulk_userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:554:47: sparse:     got void *bulk_userdata
--
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void [noderef] __user *userdata @@     got struct bulk_waiter * @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse:     expected void [noderef] __user *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse:     got struct bulk_waiter *
--
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3130:58: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *userdata @@     got void [noderef] __user *userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3130:58: sparse:     expected void *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3130:58: sparse:     got void [noderef] __user *userdata

vim +310 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

   283	
   284	static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
   285					      struct vchiq_queue_bulk_transfer *args,
   286					      enum vchiq_bulk_dir dir,
   287					      enum vchiq_bulk_mode __user *mode)
   288	{
   289		struct vchiq_service *service;
   290		struct bulk_waiter_node *waiter = NULL, *iter;
   291		void *userdata;
   292		int status = 0;
   293		int ret;
   294	
   295		service = find_service_for_instance(instance, args->handle);
   296		if (!service)
   297			return -EINVAL;
   298	
   299		if (args->mode == VCHIQ_BULK_MODE_BLOCKING) {
   300			waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
   301			if (!waiter) {
   302				ret = -ENOMEM;
   303				goto out;
   304			}
   305	
   306			userdata = &waiter->bulk_waiter;
   307	
   308			status = vchiq_bulk_xfer_blocking_interruptible(instance, args->handle,
   309									NULL, args->data, args->size,
 > 310									userdata, dir);
   311	
   312			goto bulk_transfer_handled;
   313		} else if (args->mode == VCHIQ_BULK_MODE_WAITING) {
   314			mutex_lock(&instance->bulk_waiter_list_mutex);
   315			list_for_each_entry(iter, &instance->bulk_waiter_list,
   316					    list) {
   317				if (iter->pid == current->pid) {
   318					list_del(&iter->list);
   319					waiter = iter;
   320					break;
   321				}
   322			}
   323			mutex_unlock(&instance->bulk_waiter_list_mutex);
   324			if (!waiter) {
   325				dev_err(service->state->dev,
   326					"arm: no bulk_waiter found for pid %d\n", current->pid);
   327				ret = -ESRCH;
   328				goto out;
   329			}
   330			dev_dbg(service->state->dev, "arm: found bulk_waiter %pK for pid %d\n",
   331				waiter, current->pid);
   332			userdata = &waiter->bulk_waiter;
   333	
   334			status = vchiq_bulk_xfer_waiting_interruptible(instance, args->handle, userdata);
   335	
   336			goto bulk_transfer_handled;
   337		} else {
   338			userdata = args->userdata;
   339		}
   340	
   341		status = vchiq_bulk_transfer(instance, args->handle, NULL, args->data, args->size,
   342					     userdata, args->mode, dir);
   343	
   344	bulk_transfer_handled:
   345		if (!waiter) {
   346			ret = 0;
   347			goto out;
   348		}
   349	
   350		if ((status != -EAGAIN) || fatal_signal_pending(current) ||
   351		    !waiter->bulk_waiter.bulk) {
   352			if (waiter->bulk_waiter.bulk) {
   353				/* Cancel the signal when the transfer completes. */
   354				spin_lock(&service->state->bulk_waiter_spinlock);
   355				waiter->bulk_waiter.bulk->userdata = NULL;
   356				spin_unlock(&service->state->bulk_waiter_spinlock);
   357			}
   358			kfree(waiter);
   359			ret = 0;
   360		} else {
   361			const enum vchiq_bulk_mode mode_waiting =
   362				VCHIQ_BULK_MODE_WAITING;
   363			waiter->pid = current->pid;
   364			mutex_lock(&instance->bulk_waiter_list_mutex);
   365			list_add(&waiter->list, &instance->bulk_waiter_list);
   366			mutex_unlock(&instance->bulk_waiter_list_mutex);
   367			dev_dbg(service->state->dev, "arm: saved bulk_waiter %pK for pid %d\n",
   368				waiter, current->pid);
   369	
   370			ret = put_user(mode_waiting, mode);
   371		}
   372	out:
   373		vchiq_service_put(service);
   374		if (ret)
   375			return ret;
   376		else if (status == -EINVAL)
   377			return -EIO;
   378		else if (status == -EAGAIN)
   379			return -EINTR;
   380		return 0;
   381	}
   382	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
