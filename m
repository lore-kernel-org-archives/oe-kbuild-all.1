Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4D217F52
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729892920; cv=none; b=BGjvkz3FGMYoXfUKHwiLjITYSTY0OEKa9AC/37qLJ1m8EcPt6GRlsHpHoRczHuw+7QD6Y06z5fgBD2Joy9yrGY2iLG59OWx5HyCXKwfLwt4MjsE2rFAiW46wWIjdyC4FACT7QjGcAI1ijz841Z4vsvXriLlHInqXpwsCBofgHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729892920; c=relaxed/simple;
	bh=JAS/iPkz8cylLUgje5Rn9je38NyZq1KG42cdDChUXpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBagZzHXHdHf1TULpaCJELsW2wkCu3VNmKa2BFJNnluY1xF1OFikEEv82rpGCFMN/LMHSTDc1/e7b0NLIo4xWGF3W+ecaCPhewgXnQpvpScIqjKucXf0OHuTkeYoP6gI5vYPrwlv7NOkn4b3kJ5ghP8gVBqdaOGxIXHl4zcC5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyiEF3gk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyiEF3gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729892919; x=1761428919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAS/iPkz8cylLUgje5Rn9je38NyZq1KG42cdDChUXpA=;
  b=HyiEF3gkUqiDj1DREcl1+Km4lkTl1D9FJb1YZOLtVXGhEwVLmGlD+uaa
   A47ZytkbRXs85K+jzQExhU/MzJFHQD76fEgwYSo1SuxWVAsLFYCfZXVBn
   UBS7FMy4bvJcOyjErM8idYIrWocOD+e6laMD65y9bJQytg6X4xbOO5wgu
   zyQXspLzlBzvlSD/mK1f2tE836GIv0Z6gusOjZsphHI12y32iXSn2n54h
   mMZQi2upuZNrWI+H3mKTXvcGYBwaT5r71TGzNzFFRXsiy4YCTGRXMC16c
   +H/YymOUBdU2pd9oi92QfFWRrkqZpGR0xvzKkGmvAT7WYtdjx+YVk70bE
   w==;
X-CSE-ConnectionGUID: 4wcFzPMRTjaEypraA+imeQ==
X-CSE-MsgGUID: Fp32O6qPTUmhr07HLygi+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29690783"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29690783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:48:33 -0700
X-CSE-ConnectionGUID: jq4UhSJbST+sqO6Nafj3UA==
X-CSE-MsgGUID: jcjjWSKhSaqf93LSkNj7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80945888"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 14:48:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4SAX-000YvF-0V;
	Fri, 25 Oct 2024 21:48:29 +0000
Date: Sat, 26 Oct 2024 05:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 6/10] drivers/virtio/virtio_msg_ffa.c:275:29:
 error: 'struct device' has no member named 'dma_ops'
Message-ID: <202410260557.DnimnWM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   1ee7d4424b5fb877c9020b7426879470c2d47125
commit: 9434751ce7a253179363e854b6ed1796f62a338a [6/10] virtio: msg: Add DMA OPs support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241026/202410260557.DnimnWM9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260557.DnimnWM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260557.DnimnWM9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_ffa.c: In function 'virtio_msg_ffa_probe':
>> drivers/virtio/virtio_msg_ffa.c:275:29: error: 'struct device' has no member named 'dma_ops'
     275 |                 ffa_dev->dev.dma_ops = &virtio_msg_dma_ops;
         |                             ^
   drivers/virtio/virtio_msg_ffa.c: At top level:
   drivers/virtio/virtio_msg_ffa.c:86:12: warning: 'vmsg_ffa_bus_error' defined but not used [-Wunused-function]
      86 | static int vmsg_ffa_bus_error(struct virtio_msg_ffa_device *vmfdev)
         |            ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +275 drivers/virtio/virtio_msg_ffa.c

   252	
   253	static int virtio_msg_ffa_probe(struct ffa_device *ffa_dev)
   254	{
   255		struct virtio_msg_ffa_device *vmfdev;
   256		struct device *dev = &ffa_dev->dev;
   257		struct virtio_msg_device *vmdev;
   258		u64 features, count;
   259		int ret, i;
   260	
   261		vmfdev = devm_kzalloc(dev, sizeof(*vmfdev), GFP_KERNEL);
   262		if (!vmfdev)
   263			return -ENOMEM;
   264	
   265		ffa_dev->ops->msg_ops->mode_32bit_set(ffa_dev);
   266	
   267		ida_init(&vmfdev->area_id_map);
   268	
   269		vmfdev->ffa_dev = ffa_dev;
   270		INIT_LIST_HEAD(&vmfdev->area_list);
   271		mutex_init(&vmfdev->lock);
   272	
   273		/* Set DMA OPs for the channel bus device */
   274		if (IS_REACHABLE(CONFIG_VIRTIO_MSG_DMA_OPS))
 > 275			ffa_dev->dev.dma_ops = &virtio_msg_dma_ops;
   276	
   277		ret = vmsg_ffa_bus_activate(vmfdev, &features, &count);
   278		if (ret)
   279			goto ida_free;
   280	
   281		/* We only support direct messages for now */
   282		if (!(features & VIRTIO_MSG_FFA_FEATURE_DIRECT_MSG_SUPP)) {
   283			ret = -ENODEV;
   284			goto out;
   285		}
   286	
   287		/* FIXME: Don't support indirect messages for now */
   288		features &= ~VIRTIO_MSG_FFA_FEATURE_INDIRECT_MSG_SUPP;
   289	
   290		if (!count) {
   291			ret = -ENODEV;
   292			goto out;
   293		}
   294	
   295		ret = vmsg_ffa_bus_configure(vmfdev, features);
   296		if (ret)
   297			goto out;
   298	
   299		vmfdev->vmdevs = devm_kcalloc(dev, count, sizeof(*vmfdev->vmdevs), GFP_KERNEL);
   300		if (!vmfdev->vmdevs) {
   301			ret = -ENOMEM;
   302			goto out;
   303		}
   304	
   305		for (i = 0; i < count; i++) {
   306			vmdev = &vmfdev->vmdevs[i];
   307			vmdev->dev_id = i;
   308			vmdev->ops = &vmf_ops;
   309			vmdev->vdev.dev.parent = &ffa_dev->dev;
   310			vmdev->priv = vmfdev;
   311	
   312			/*
   313			 * Register all virtio devices, they will fetch their ids and
   314			 * register the right device type.
   315			 */
   316			ret = virtio_msg_register(vmdev);
   317			if (ret)
   318				pr_err("Failed to register virtio msg device with id: %d\n", i);
   319		}
   320	
   321		ffa_dev_set_drvdata(ffa_dev, vmfdev);
   322		return 0;
   323	
   324	out:
   325		vmsg_ffa_bus_deactivate(vmfdev);
   326	ida_free:
   327		ida_destroy(&vmfdev->area_id_map);
   328		return ret;
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
