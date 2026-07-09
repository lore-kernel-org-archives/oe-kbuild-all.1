Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F839A7EA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 16:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783615683; cv=none; b=bT1yEMQq+k0hfPfQ/UTcsRkvOVQfkKG/FPA8ev0NwNpBf4XxTdUCooVPxo1Jm40S3eXQE4878UZXwgZ01lTMoxr/PTyFnd5DQ2hffSverXx6sdvxaHNzY/7z6oQjYfNnOcZ9nJFz9atY7p09WwqBqfGpp+biFkOYMlAqcPneAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783615683; c=relaxed/simple;
	bh=/6l37cheRL7iRGmMjFcm/2gWy5FZSLG8YI56bmjmiqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hnZ+CLsSo5yueoFcMVm3LAyYyZpwvp3oAd4cCQxakEiwG1JcauquKKKiHrEXWUnwe1GmHBmHoLRyP70wr/SZfee3vgiEDoC863u8LvP1RJYXSMz28NDSPrwbeuLawHtV+fBT2drJMoBVR+T8OTpM/eTBcsrFYLot8tLFtAjvRig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmYi7cxN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmYi7cxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783615681; x=1815151681;
  h=date:from:to:cc:subject:message-id;
  bh=/6l37cheRL7iRGmMjFcm/2gWy5FZSLG8YI56bmjmiqk=;
  b=HmYi7cxNmhpxuy3K/Dv46cXYp7E8S8pAAfLXj+hAuLTo3ffbiYO/MJGL
   SR9NXiDOOhL8GOndSjFL06AcwzIvxpYEWPYVqKsL9s37n4F/Xj1UszFJp
   V4w66+0f04ChpndzNgCILqM0dlllHCFbkAPRjTCW1QGE1Z9Dwd2kXqRaC
   sWzUNRPEKSjUeSSgRrpUTmXkhLzbiyi8jxawIjx+dzrSM1Lx55ytvcCzG
   G/s3PSIvQAEMiCDttSG2QilwCH13zhoJsTpdPXLFWy+AcrMD+QDGI5a1Z
   F09c3N3JRJfmmmDe1xVAmHJs+yUKNHgEQkfi+Xpn6sxe4/BDsmQRCH42f
   Q==;
X-CSE-ConnectionGUID: caNSRJKAQu2uzmQc6wMONQ==
X-CSE-MsgGUID: YcX8YtTcTROPbXMdZuVa4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88219957"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88219957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 09:48:01 -0700
X-CSE-ConnectionGUID: YoyOc2cbTu62lRDFkNewoA==
X-CSE-MsgGUID: VxGXE+lDQ3qVRLXX1kkHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258505521"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2026 09:47:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whruY-00000000Hu7-3Zj1;
	Thu, 09 Jul 2026 16:47:51 +0000
Date: Fri, 10 Jul 2026 00:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-06 1/1]
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:112:18: warning: variable 'hwirq' set
 but not used
Message-ID: <202607100023.nJU24Zvb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-06
head:   102b2c3312173055008d88fecfc284803b012f11
commit: 083e750c9f5f4c3bf61161330fb84d7c8e8bb417 [1/1] vfio/fsl-mc: Block calling interrupt handler without trigger
config: arm-randconfig-001 (https://download.01.org/0day-ci/archive/20260710/202607100023.nJU24Zvb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100023.nJU24Zvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100023.nJU24Zvb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c: In function 'vfio_fsl_mc_set_irq_trigger':
>> drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:112:18: warning: variable 'hwirq' set but not used [-Wunused-but-set-variable=]
     112 |         int ret, hwirq;
         |                  ^~~~~


vim +/hwirq +112 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c

cc0ee20bd96971c Diana Craciun   2020-10-05  105  
2e0d29561f593a5 Diana Craciun   2020-10-05  106  static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
2e0d29561f593a5 Diana Craciun   2020-10-05  107  				       unsigned int index, unsigned int start,
2e0d29561f593a5 Diana Craciun   2020-10-05  108  				       unsigned int count, u32 flags,
2e0d29561f593a5 Diana Craciun   2020-10-05  109  				       void *data)
2e0d29561f593a5 Diana Craciun   2020-10-05  110  {
cc0ee20bd96971c Diana Craciun   2020-10-05  111  	struct fsl_mc_device *mc_dev = vdev->mc_dev;
cc0ee20bd96971c Diana Craciun   2020-10-05 @112  	int ret, hwirq;
cc0ee20bd96971c Diana Craciun   2020-10-05  113  	struct vfio_fsl_mc_irq *irq;
cc0ee20bd96971c Diana Craciun   2020-10-05  114  	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
cc0ee20bd96971c Diana Craciun   2020-10-05  115  	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
cc0ee20bd96971c Diana Craciun   2020-10-05  116  
159246378d8483b Diana Craciun   2020-10-15  117  	if (!count && (flags & VFIO_IRQ_SET_DATA_NONE))
159246378d8483b Diana Craciun   2020-10-15  118  		return vfio_set_trigger(vdev, index, -1);
159246378d8483b Diana Craciun   2020-10-15  119  
cc0ee20bd96971c Diana Craciun   2020-10-05  120  	if (start != 0 || count != 1)
2e0d29561f593a5 Diana Craciun   2020-10-05  121  		return -EINVAL;
cc0ee20bd96971c Diana Craciun   2020-10-05  122  
da119f387e94642 Jason Gunthorpe 2021-08-05  123  	mutex_lock(&vdev->vdev.dev_set->lock);
cc0ee20bd96971c Diana Craciun   2020-10-05  124  	ret = fsl_mc_populate_irq_pool(mc_cont,
cc0ee20bd96971c Diana Craciun   2020-10-05  125  			FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
cc0ee20bd96971c Diana Craciun   2020-10-05  126  	if (ret)
cc0ee20bd96971c Diana Craciun   2020-10-05  127  		goto unlock;
cc0ee20bd96971c Diana Craciun   2020-10-05  128  
cc0ee20bd96971c Diana Craciun   2020-10-05  129  	ret = vfio_fsl_mc_irqs_allocate(vdev);
cc0ee20bd96971c Diana Craciun   2020-10-05  130  	if (ret)
cc0ee20bd96971c Diana Craciun   2020-10-05  131  		goto unlock;
da119f387e94642 Jason Gunthorpe 2021-08-05  132  	mutex_unlock(&vdev->vdev.dev_set->lock);
cc0ee20bd96971c Diana Craciun   2020-10-05  133  
cc0ee20bd96971c Diana Craciun   2020-10-05  134  	if (flags & VFIO_IRQ_SET_DATA_EVENTFD) {
cc0ee20bd96971c Diana Craciun   2020-10-05  135  		s32 fd = *(s32 *)data;
cc0ee20bd96971c Diana Craciun   2020-10-05  136  
cc0ee20bd96971c Diana Craciun   2020-10-05  137  		return vfio_set_trigger(vdev, index, fd);
cc0ee20bd96971c Diana Craciun   2020-10-05  138  	}
cc0ee20bd96971c Diana Craciun   2020-10-05  139  
d86a6d47bcc6b41 Thomas Gleixner 2021-12-10  140  	hwirq = vdev->mc_dev->irqs[index]->virq;
cc0ee20bd96971c Diana Craciun   2020-10-05  141  
cc0ee20bd96971c Diana Craciun   2020-10-05  142  	irq = &vdev->mc_irqs[index];
cc0ee20bd96971c Diana Craciun   2020-10-05  143  
cc0ee20bd96971c Diana Craciun   2020-10-05  144  	if (flags & VFIO_IRQ_SET_DATA_NONE) {
083e750c9f5f4c3 Alex Williamson 2024-03-29  145  		if (irq->trigger)
083e750c9f5f4c3 Alex Williamson 2024-03-29  146  			eventfd_signal(irq->trigger, 1);
cc0ee20bd96971c Diana Craciun   2020-10-05  147  
cc0ee20bd96971c Diana Craciun   2020-10-05  148  	} else if (flags & VFIO_IRQ_SET_DATA_BOOL) {
cc0ee20bd96971c Diana Craciun   2020-10-05  149  		u8 trigger = *(u8 *)data;
cc0ee20bd96971c Diana Craciun   2020-10-05  150  
083e750c9f5f4c3 Alex Williamson 2024-03-29  151  		if (trigger && irq->trigger)
083e750c9f5f4c3 Alex Williamson 2024-03-29  152  			eventfd_signal(irq->trigger, 1);
cc0ee20bd96971c Diana Craciun   2020-10-05  153  	}
cc0ee20bd96971c Diana Craciun   2020-10-05  154  
cc0ee20bd96971c Diana Craciun   2020-10-05  155  	return 0;
cc0ee20bd96971c Diana Craciun   2020-10-05  156  
cc0ee20bd96971c Diana Craciun   2020-10-05  157  unlock:
da119f387e94642 Jason Gunthorpe 2021-08-05  158  	mutex_unlock(&vdev->vdev.dev_set->lock);
cc0ee20bd96971c Diana Craciun   2020-10-05  159  	return ret;
cc0ee20bd96971c Diana Craciun   2020-10-05  160  

:::::: The code at line 112 was first introduced by commit
:::::: cc0ee20bd96971c10eba9a83ecf1c0733078a083 vfio/fsl-mc: trigger an interrupt via eventfd

:::::: TO: Diana Craciun <diana.craciun@oss.nxp.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
