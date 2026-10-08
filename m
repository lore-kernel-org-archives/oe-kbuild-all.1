Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E291F936
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791421379; cv=none; b=OU1MUmgXSMLelj6/Oj8zR3U6clmH+3zNOTXDscSGmMRG/s/vf/GNk8e4UomVL1x7MdfIUxoiexAiUbT/ELKeX1y3ogMj3Y/vRPfD4vLv1IbQ+o9NwZemBATfA+94tjyS8t11YnSqmmP8CKqF6MX/NdlASFfkOcQ9+10xoyLUqeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791421379; c=relaxed/simple;
	bh=TjncdWNGh1IWxVe+GBrNghl0rStOIX2MkxuO/ht5074=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t6qXBmtRNdclO8SPQPSKJyoDn3TxjkBVfL7SyBnzfEzuHrckI8DUNWfLhzjAF2qFWxGpJKqKPkWWplswvF6rONIBdLNgPywYJFLK9K+JaQJzflhIHoS3fOgXHAi1IWMZzJcwrQ8WlNYW7qKHaGfr7FD/MC0THU9sWT76F2YGtQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7Xn0uO/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7Xn0uO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791421376; x=1822957376;
  h=date:from:to:cc:subject:message-id;
  bh=TjncdWNGh1IWxVe+GBrNghl0rStOIX2MkxuO/ht5074=;
  b=g7Xn0uO/4JNHHd4LMHUn3r9Crl+HNvT0e5k16EGbLzXznbxTZh/s1vMP
   NDqq9y2ytNucfUA8jdNtKidWgetdeB2atMjzhLaq3Ngg4J9cTQv131MSR
   1ZLadtEstZM9wdpq/MQ+lrTfyHc3wmWiz5LtAw3FSpwr5AjB2RuZWV+Sx
   vkldV+fiPiJcQcJsSJFrHEJ58NL7qFlUA8rni3gPUyP/VUytQaQLCCAkA
   Snv8vVi3TmSD0nfUelqN3yOO9Cuf6NVfvxwySGhK0i9sz7rJujwHdYuL8
   TDXlKehSv8PdIWfj2wuwYdVJlNYAdfs4GfhTcz9n3d/AScHIyk1J4Zj9l
   Q==;
X-CSE-ConnectionGUID: dwrG1wPaRDqyZ0nJH5niMw==
X-CSE-MsgGUID: YHJzMfz8TnGUTtkVGKTtmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="204695"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="204695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 18:02:56 -0700
X-CSE-ConnectionGUID: Uyj7g7ZxS3uCjDnAAPakbA==
X-CSE-MsgGUID: 2jTTl1xwQ4+yARpkAixHDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="321901"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 18:02:54 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEcX5-000000004Sd-3bp9;
	Thu, 08 Oct 2026 01:02:51 +0000
Date: Thu, 08 Oct 2026 03:02:21 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:310:65: sparse:
 sparse: incorrect type in argument 6 (different address spaces)
Message-ID: <202610080240.vLglPDOv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c7ad8c94d6193bff72b385b1cf3fb753de09f780
commit: 206030f6a92bd97997fba8ebb86e78058edecb97 [1/1] staging: vchiq_core: Factor out bulk transfer for blocking mode
config: arm-randconfig-r2309-20261006 (https://download.01.org/0day-ci/archive/20261008/202610080240.vLglPDOv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080240.vLglPDOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 206030f6a92b ("staging: vchiq_core: Factor out bulk transfer for blocking mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080240.vLglPDOv-lkp@intel.com/

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
