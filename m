Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A8192D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729376949; cv=none; b=K6hBU31xJW5Y16zsKe3+QrGrId3npIP1FFCtweCOPVr23awvOxfJ/wmxeu7pKnJZpLyx3G8RjgQ2MtrkxxDG13kczR8KphGmlInFv5WEd2ZJhPK5dYtuCV3r8EuVJ9jx5CJl4MxaueeUOxxSq1tGKdfLvgxmKzwxuHBmmBrKtmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729376949; c=relaxed/simple;
	bh=muZAwiRkDqqLUBju7YNR60QLqu6terqB4mRLe7+Al7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq7+PZ8j1TSV4a94ciew6w79NoGG/GOBeCS1HDsMj79W0SEW2VXlNUE36/iTYnIgzKedJlD247U3U8SQgBG035ekc+lRhHJjbJmRRCA61+FSZahZI8zp0f7OrsXSbOnRp786tCoWSTz4HUstuIoJfFTF5+KJv24Hf3jKY1gzbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMiYKpL0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMiYKpL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729376947; x=1760912947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=muZAwiRkDqqLUBju7YNR60QLqu6terqB4mRLe7+Al7s=;
  b=DMiYKpL0l7YdVmUuIdf/QtWz4vFNLYPLENG4s+XA97vBqiUHvweUWhYB
   N707/MNeab1lIKbkIlfM5WHoSdrsIMpMeR0L8r4KlIDFmonRjHq0IVeM2
   JnlejbY+hzbQoMxmfm41YwWVfT1nSH4bey9fhcE+KRsmkNfGjJoqnqbpb
   wgC4n3j86DlZrwlQ17Muca7fUtWn2gQPUjM3s59PLW8C5dm809lSZdl4/
   +7WfxoA4/9aFbjDHIXcH0+NU3NZgQt2dhIqjkstPzvimV52KTiHIZU/x2
   v8IAVq9OpvU2FqPvu9DSZzva/GQVnyIni3BfehBwlSQ4Ntqy055l64XVr
   A==;
X-CSE-ConnectionGUID: eS83jEdqS0u6soj7ZHU9kg==
X-CSE-MsgGUID: /SXDuLSGQyiiaf9a/r/v0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29003712"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29003712"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 15:29:04 -0700
X-CSE-ConnectionGUID: hwajUgiES6y/6616LfBjDg==
X-CSE-MsgGUID: SB3MkjPoQVCbg2HfZWftxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83963291"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 15:29:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2HwT-000PcB-0l;
	Sat, 19 Oct 2024 22:29:01 +0000
Date: Sun, 20 Oct 2024 06:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/6] staging: vc04_services: Simplify (no)callback bulk
 transfer code paths
Message-ID: <202410200601.QoauW748-lkp@intel.com>
References: <20241017133629.216672-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017133629.216672-5-umang.jain@ideasonboard.com>

Hi Umang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/staging-vchiq_core-Subsume-offset-in-struct-vchiq_bulk/20241017-213946
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241017133629.216672-5-umang.jain%40ideasonboard.com
patch subject: [PATCH 4/6] staging: vc04_services: Simplify (no)callback bulk transfer code paths
config: powerpc64-randconfig-r111-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200601.QoauW748-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410200601.QoauW748-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200601.QoauW748-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:342:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[addressable] [assigned] userdata @@     got void [noderef] __user *userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:342:38: sparse:     expected void *[addressable] [assigned] userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:342:38: sparse:     got void [noderef] __user *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:557:47: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] [assigned] bulk_userdata @@     got void *bulk_userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:557:47: sparse:     expected void [noderef] __user *[addressable] [assigned] bulk_userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:557:47: sparse:     got void *bulk_userdata

vim +342 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

   283	
   284	static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
   285					      struct vchiq_queue_bulk_transfer *args,
   286					      enum vchiq_bulk_dir dir,
   287					      enum vchiq_bulk_mode __user *mode)
   288	{
   289		struct vchiq_service *service;
   290		struct bulk_waiter_node *waiter = NULL, *iter;
   291		struct vchiq_bulk bulk_params = {};
   292		void *userdata;
   293		int status = 0;
   294		int ret;
   295	
   296		service = find_service_for_instance(instance, args->handle);
   297		if (!service)
   298			return -EINVAL;
   299	
   300		if (args->mode == VCHIQ_BULK_MODE_BLOCKING) {
   301			waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
   302			if (!waiter) {
   303				ret = -ENOMEM;
   304				goto out;
   305			}
   306	
   307			bulk_params.uoffset = args->data;
   308			bulk_params.mode = args->mode;
   309			bulk_params.size = args->size;
   310			bulk_params.dir = dir;
   311			bulk_params.userdata = &waiter->bulk_waiter;
   312	
   313			status = vchiq_bulk_xfer_blocking(instance, args->handle,
   314							  &bulk_params);
   315		} else if (args->mode == VCHIQ_BULK_MODE_WAITING) {
   316			mutex_lock(&instance->bulk_waiter_list_mutex);
   317			list_for_each_entry(iter, &instance->bulk_waiter_list,
   318					    list) {
   319				if (iter->pid == current->pid) {
   320					list_del(&iter->list);
   321					waiter = iter;
   322					break;
   323				}
   324			}
   325			mutex_unlock(&instance->bulk_waiter_list_mutex);
   326			if (!waiter) {
   327				dev_err(service->state->dev,
   328					"arm: no bulk_waiter found for pid %d\n", current->pid);
   329				ret = -ESRCH;
   330				goto out;
   331			}
   332			dev_dbg(service->state->dev, "arm: found bulk_waiter %pK for pid %d\n",
   333				waiter, current->pid);
   334			userdata = &waiter->bulk_waiter;
   335	
   336			status = vchiq_bulk_xfer_waiting(instance, args->handle, userdata);
   337		} else {
   338			bulk_params.uoffset = args->data;
   339			bulk_params.mode = args->mode;
   340			bulk_params.size = args->size;
   341			bulk_params.dir = dir;
 > 342			bulk_params.userdata = args->userdata;
   343	
   344			status = vchiq_bulk_xfer_callback(instance, args->handle,
   345							  &bulk_params);
   346		}
   347	
   348		if (!waiter) {
   349			ret = 0;
   350			goto out;
   351		}
   352	
   353		if ((status != -EAGAIN) || fatal_signal_pending(current) ||
   354		    !waiter->bulk_waiter.bulk) {
   355			if (waiter->bulk_waiter.bulk) {
   356				/* Cancel the signal when the transfer completes. */
   357				spin_lock(&service->state->bulk_waiter_spinlock);
   358				waiter->bulk_waiter.bulk->userdata = NULL;
   359				spin_unlock(&service->state->bulk_waiter_spinlock);
   360			}
   361			kfree(waiter);
   362			ret = 0;
   363		} else {
   364			const enum vchiq_bulk_mode mode_waiting =
   365				VCHIQ_BULK_MODE_WAITING;
   366			waiter->pid = current->pid;
   367			mutex_lock(&instance->bulk_waiter_list_mutex);
   368			list_add(&waiter->list, &instance->bulk_waiter_list);
   369			mutex_unlock(&instance->bulk_waiter_list_mutex);
   370			dev_dbg(service->state->dev, "arm: saved bulk_waiter %pK for pid %d\n",
   371				waiter, current->pid);
   372	
   373			ret = put_user(mode_waiting, mode);
   374		}
   375	out:
   376		vchiq_service_put(service);
   377		if (ret)
   378			return ret;
   379		else if (status == -EINVAL)
   380			return -EIO;
   381		else if (status == -EAGAIN)
   382			return -EINTR;
   383		return 0;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
