Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30F8F44
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712847943; cv=none; b=XgAIz44CzXtvlBY1BGNNXVlMvUgFmnPvQJgQUntx0el+NIlvXWV4X1YZX5tQRYUBwoqES2PcZcsOoiR4CQDvIqmOkZi0ZLh3tXiMVURbJUnoCJU4Ch+0r0x+sL689XVnsymg22fu3P6y749I6Eppbs0tjua7eCswFOpaBYLIq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712847943; c=relaxed/simple;
	bh=ls2fA+WRVfVbufDPApqHrh7gnY2MEvzhYWkFz6cy8Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbzgeaSofA4U/U7qSNCAsrtMp4CGs6I2v3+rR78ipwp0+7I3OacNK8C6erZeFz78+Rywq9mnC/JW0YSeJPZeFmty1TvYpExmPkz1Rmg18lyMalXDu12huLJg912lvWR1R6Abk3ET54lMGjb/VVO701T6QozfpSUfbeQ3Qnld20U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+gA1BKp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+gA1BKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712847943; x=1744383943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ls2fA+WRVfVbufDPApqHrh7gnY2MEvzhYWkFz6cy8Qs=;
  b=l+gA1BKpsfNy10TrtV/91xXJsqnbCummCua88RF9xSBz9z78vUHUDDLI
   UWuzNc5jTqruVbiizyYYWrSvuXMeHNL+qy4qxtAfCoMTFQuA0gBEp6mZM
   QLpRDC5Lw7zk4GxBjfMLz6j6MqXL6A64oAMWDnEmmqiMNgnKeq5jZWq3a
   DBwRICzgUJY8dHIoZL/f733B2OCoRJgyTEePuGXgl/xfSPNKt3gakzPhb
   8b+wZdQji/Z8cmqjbBy30wZ9NZ1jcInQio/456AF1ybwtQDIcC9Doy0FC
   82gxq2dcydU6Za/ZSpAnTyLzsNEjPJC7xoD73FCJUkGd8/07Pgw0WxGXT
   Q==;
X-CSE-ConnectionGUID: wtu8suLmRhiZ6GGKNQE/Lg==
X-CSE-MsgGUID: AOrejCOySgGPWkSf4Z9H/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18867180"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18867180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 08:05:38 -0700
X-CSE-ConnectionGUID: WZYgShtqSf2BS0UcWl3ufA==
X-CSE-MsgGUID: 8AeKBUoYTaCKNx4Gn4CDNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="44210238"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Apr 2024 08:05:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruvzX-0008iT-3D;
	Thu, 11 Apr 2024 15:05:31 +0000
Date: Thu, 11 Apr 2024 23:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 5/20] drivers/uio/uio.c:446: warning:
 expecting prototype for uio_interrupt(). Prototype was for
 uio_interrupt_handler() instead
Message-ID: <202404112227.mIATKoTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   dc806bd48abc1b8a4ae72709a37e65db42a32048
commit: f8a27dfa4b82d442af1c0645a5acc70cc97c67f6 [5/20] uio: use threaded interrupts
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240411/202404112227.mIATKoTb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112227.mIATKoTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112227.mIATKoTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/uio/uio.c:446: warning: expecting prototype for uio_interrupt(). Prototype was for uio_interrupt_handler() instead


vim +446 drivers/uio/uio.c

beafc54c4e2fba Hans J. Koch  2006-12-07  439  
beafc54c4e2fba Hans J. Koch  2006-12-07  440  /**
beafc54c4e2fba Hans J. Koch  2006-12-07  441   * uio_interrupt - hardware interrupt handler
beafc54c4e2fba Hans J. Koch  2006-12-07  442   * @irq: IRQ number, can be UIO_IRQ_CYCLIC for cyclic timer
beafc54c4e2fba Hans J. Koch  2006-12-07  443   * @dev_id: Pointer to the devices uio_device structure
beafc54c4e2fba Hans J. Koch  2006-12-07  444   */
f8a27dfa4b82d4 Chris Packham 2024-04-09  445  static irqreturn_t uio_interrupt_handler(int irq, void *dev_id)
beafc54c4e2fba Hans J. Koch  2006-12-07 @446  {
beafc54c4e2fba Hans J. Koch  2006-12-07  447  	struct uio_device *idev = (struct uio_device *)dev_id;
57c5f4df0a5a0e Xiubo Li      2018-07-06  448  	irqreturn_t ret;
beafc54c4e2fba Hans J. Koch  2006-12-07  449  
57c5f4df0a5a0e Xiubo Li      2018-07-06  450  	ret = idev->info->handler(irq, idev->info);
beafc54c4e2fba Hans J. Koch  2006-12-07  451  	if (ret == IRQ_HANDLED)
f8a27dfa4b82d4 Chris Packham 2024-04-09  452  		ret = IRQ_WAKE_THREAD;
beafc54c4e2fba Hans J. Koch  2006-12-07  453  
beafc54c4e2fba Hans J. Koch  2006-12-07  454  	return ret;
beafc54c4e2fba Hans J. Koch  2006-12-07  455  }
beafc54c4e2fba Hans J. Koch  2006-12-07  456  

:::::: The code at line 446 was first introduced by commit
:::::: beafc54c4e2fba24e1ca45cdb7f79d9aa83e3db1 UIO: Add the User IO core code

:::::: TO: Hans J. Koch <hjk@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
