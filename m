Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784674DDB49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408565; cv=none; b=T62h30ZLvhXEkIaK7pNP8Hw1ef7OMXCHRZR5nCHZAEna3TlT30RpoREeOk7fEFfFAxdUnihTRdoHuLb3+DChOgKKUuSaN760MuZkPYrpqz1+2pdxDyVjwoLXLhyDK+k55QkeEgINxA/1casycyT90s0NLiKxcVLX548GmubjUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408565; c=relaxed/simple;
	bh=77brUS25yikxYWqeetSsQpAjv40JOtWXMJuGkkfFIos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyPQ4JgTmIda0YP9CPCCv9zTt+sQL27xylbv7uA97kaQ3rJTqxH8lxdNZJfFtpKmOfBJfkPuHsLK3hAfnCwyiIB9FAZWG8c0sAEx4IomLo4CGzwntRpvNlrb/7hdyNRkPH1Y355fnovJsGPoTixT5Bf3yHsYve3lVVq1VbkXycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJxe/3mc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJxe/3mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792408562; x=1823944562;
  h=date:from:to:cc:subject:message-id;
  bh=77brUS25yikxYWqeetSsQpAjv40JOtWXMJuGkkfFIos=;
  b=WJxe/3mchv7uItuAIeLp9wJiVBq6dyK/NNDS0cEJ3QxWLKFzqVttdfb9
   nOhH67l+L8Wqpja1o0wjeC9Xp9NJSb3tZCnmRhUjLrO4jdFV1a7IkUwuj
   HcwI0/Y30vTeXuUnGr1qWqA92Uj4Ipwc95Bmlkuh0RzIQilK3Dsq/feLe
   VWMx0Q/jcX9oA/to+uHggetIbakLh+qLxD9qvrvB5jG033fDgtIPDMxhc
   GP7JPZhVApK4Syi+FEbDDptZE+wTW+7s5wxUj2mHGkLQEj5ITE/DgmtB5
   zkM7OkLaxhrnDTaE/E87aO0s6ITw7UbfAG8ik5Vbm+xLNccr0VLm26oGt
   g==;
X-CSE-ConnectionGUID: PY9HuogpTV2ZImNklaGmsg==
X-CSE-MsgGUID: uwpMt6AIQ8eHeOtL1s/Olw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="986039"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="986039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:16:01 -0700
X-CSE-ConnectionGUID: BSGZpkZ0SvCzJHWNvuv8Qg==
X-CSE-MsgGUID: pUWdBxu4T5KsPAOMK+uisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2594518"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 04:16:00 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIlLR-000000005ax-47Xr;
	Mon, 19 Oct 2026 11:15:58 +0000
Date: Mon, 19 Oct 2026 13:15:30 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:112:11: warning: variable 'hwirq' set
 but not used
Message-ID: <202610191314.KoKMIgtr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alex,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   48e3cd973485465613da6d71fa17139773546573
commit: 083e750c9f5f4c3bf61161330fb84d7c8e8bb417 [1/1] vfio/fsl-mc: Block calling interrupt handler without trigger
config: arm-randconfig-2001-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191314.KoKMIgtr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191314.KoKMIgtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191314.KoKMIgtr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:112:11: warning: variable 'hwirq' set but not used [-Wunused-but-set-variable]
     112 |         int ret, hwirq;
         |                  ^
   1 warning generated.


vim +/hwirq +112 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c

cc0ee20bd96971 Diana Craciun   2020-10-05  105  
2e0d29561f593a Diana Craciun   2020-10-05  106  static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
2e0d29561f593a Diana Craciun   2020-10-05  107  				       unsigned int index, unsigned int start,
2e0d29561f593a Diana Craciun   2020-10-05  108  				       unsigned int count, u32 flags,
2e0d29561f593a Diana Craciun   2020-10-05  109  				       void *data)
2e0d29561f593a Diana Craciun   2020-10-05  110  {
cc0ee20bd96971 Diana Craciun   2020-10-05  111  	struct fsl_mc_device *mc_dev = vdev->mc_dev;
cc0ee20bd96971 Diana Craciun   2020-10-05 @112  	int ret, hwirq;
cc0ee20bd96971 Diana Craciun   2020-10-05  113  	struct vfio_fsl_mc_irq *irq;
cc0ee20bd96971 Diana Craciun   2020-10-05  114  	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
cc0ee20bd96971 Diana Craciun   2020-10-05  115  	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
cc0ee20bd96971 Diana Craciun   2020-10-05  116  
159246378d8483 Diana Craciun   2020-10-15  117  	if (!count && (flags & VFIO_IRQ_SET_DATA_NONE))
159246378d8483 Diana Craciun   2020-10-15  118  		return vfio_set_trigger(vdev, index, -1);
159246378d8483 Diana Craciun   2020-10-15  119  
cc0ee20bd96971 Diana Craciun   2020-10-05  120  	if (start != 0 || count != 1)
2e0d29561f593a Diana Craciun   2020-10-05  121  		return -EINVAL;
cc0ee20bd96971 Diana Craciun   2020-10-05  122  
da119f387e9464 Jason Gunthorpe 2021-08-05  123  	mutex_lock(&vdev->vdev.dev_set->lock);
cc0ee20bd96971 Diana Craciun   2020-10-05  124  	ret = fsl_mc_populate_irq_pool(mc_cont,
cc0ee20bd96971 Diana Craciun   2020-10-05  125  			FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
cc0ee20bd96971 Diana Craciun   2020-10-05  126  	if (ret)
cc0ee20bd96971 Diana Craciun   2020-10-05  127  		goto unlock;
cc0ee20bd96971 Diana Craciun   2020-10-05  128  
cc0ee20bd96971 Diana Craciun   2020-10-05  129  	ret = vfio_fsl_mc_irqs_allocate(vdev);
cc0ee20bd96971 Diana Craciun   2020-10-05  130  	if (ret)
cc0ee20bd96971 Diana Craciun   2020-10-05  131  		goto unlock;
da119f387e9464 Jason Gunthorpe 2021-08-05  132  	mutex_unlock(&vdev->vdev.dev_set->lock);
cc0ee20bd96971 Diana Craciun   2020-10-05  133  
cc0ee20bd96971 Diana Craciun   2020-10-05  134  	if (flags & VFIO_IRQ_SET_DATA_EVENTFD) {
cc0ee20bd96971 Diana Craciun   2020-10-05  135  		s32 fd = *(s32 *)data;
cc0ee20bd96971 Diana Craciun   2020-10-05  136  
cc0ee20bd96971 Diana Craciun   2020-10-05  137  		return vfio_set_trigger(vdev, index, fd);
cc0ee20bd96971 Diana Craciun   2020-10-05  138  	}
cc0ee20bd96971 Diana Craciun   2020-10-05  139  
d86a6d47bcc6b4 Thomas Gleixner 2021-12-10  140  	hwirq = vdev->mc_dev->irqs[index]->virq;
cc0ee20bd96971 Diana Craciun   2020-10-05  141  
cc0ee20bd96971 Diana Craciun   2020-10-05  142  	irq = &vdev->mc_irqs[index];
cc0ee20bd96971 Diana Craciun   2020-10-05  143  
cc0ee20bd96971 Diana Craciun   2020-10-05  144  	if (flags & VFIO_IRQ_SET_DATA_NONE) {
083e750c9f5f4c Alex Williamson 2024-03-29  145  		if (irq->trigger)
083e750c9f5f4c Alex Williamson 2024-03-29  146  			eventfd_signal(irq->trigger, 1);
cc0ee20bd96971 Diana Craciun   2020-10-05  147  
cc0ee20bd96971 Diana Craciun   2020-10-05  148  	} else if (flags & VFIO_IRQ_SET_DATA_BOOL) {
cc0ee20bd96971 Diana Craciun   2020-10-05  149  		u8 trigger = *(u8 *)data;
cc0ee20bd96971 Diana Craciun   2020-10-05  150  
083e750c9f5f4c Alex Williamson 2024-03-29  151  		if (trigger && irq->trigger)
083e750c9f5f4c Alex Williamson 2024-03-29  152  			eventfd_signal(irq->trigger, 1);
cc0ee20bd96971 Diana Craciun   2020-10-05  153  	}
cc0ee20bd96971 Diana Craciun   2020-10-05  154  
cc0ee20bd96971 Diana Craciun   2020-10-05  155  	return 0;
cc0ee20bd96971 Diana Craciun   2020-10-05  156  
cc0ee20bd96971 Diana Craciun   2020-10-05  157  unlock:
da119f387e9464 Jason Gunthorpe 2021-08-05  158  	mutex_unlock(&vdev->vdev.dev_set->lock);
cc0ee20bd96971 Diana Craciun   2020-10-05  159  	return ret;
cc0ee20bd96971 Diana Craciun   2020-10-05  160  

:::::: The code at line 112 was first introduced by commit
:::::: cc0ee20bd96971c10eba9a83ecf1c0733078a083 vfio/fsl-mc: trigger an interrupt via eventfd

:::::: TO: Diana Craciun <diana.craciun@oss.nxp.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
