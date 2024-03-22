Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3482D7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 22:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148264; cv=none; b=htMp+MY0dzJWZnyVQd5LaD61O52XycfQdT7SOsfGgOCF+A86mtHWGM7wA9ACqeLNWRMKXolvLmaCChjcL90nhGP7/Ruc61lHln3xH0/yeADqM2KA5YJUWBZQbPy1Zyv3n2G9DzBB6LDFMhbYR9gdFDfaeEgr+jWXjmhbWIcwwOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148264; c=relaxed/simple;
	bh=DbflLE33/rKt/AudZIJCR8VykTo/QvSDb8YSFpIub7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZBOS0LgPdaogI0WxbTzvqXM+EY/7LuqpbNoD22XbbZ+ttHLvx2cCcjwv5KcGMqDBwJmC5dMJukVDdUGvIR6puMayjUkGgZerszT2I6C/rB/dwlIME2L2uVpBSS6nC9gHfvazzycd7eU5e5u+RT+SgfQoLV3vTur432bZaIdj08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKit82dn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKit82dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711148262; x=1742684262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbflLE33/rKt/AudZIJCR8VykTo/QvSDb8YSFpIub7E=;
  b=aKit82dn56ewodmoXb3o+0eCdq+VTsxOZYYE1HINDnD97ZJ4HjQgKTHZ
   GE+BSDcteWUju8WUFhex5lSn09kPTrZ6nixNyq09oTrB3SOlLTEChF+M0
   fWEjBThhvZ+9Ucu1/BGNeZ7eaIQPNyYAWgEXbEkfiLSZ+WxG+lpGOTmzb
   1MQm7+Fkf+09J1O2rmlTiX2M88rmE7sC3cmx7EhTq2TEhqyjjKO7DoilC
   74DuzPeibC3TPzsLz23HVQ27ZM9ClXYcIpE+2cTnunTZtw9L/Qgb/pPsF
   y4VXf8/mzt8zAVIvCHWc8GMvI3rPmGGWLFkVno37WRwbNQ3wUuratbwUp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6081367"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6081367"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 15:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="19740443"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2024 15:57:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnnpS-000KgF-24;
	Fri, 22 Mar 2024 22:57:38 +0000
Date: Sat, 23 Mar 2024 06:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24372/30000]
 drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: warning: no previous
 prototype for 'inspur_drm_interrupt'
Message-ID: <202403230614.AetkQYPg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   459341c4b4845b283c7a884e6a0dc4bd8cdb89e6
commit: b9d65551a3adfa87a7c5d33391187ee60a1b501d [24372/30000] drm: add inspur drm driver support
config: x86_64-randconfig-006-20240323 (https://download.01.org/0day-ci/archive/20240323/202403230614.AetkQYPg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230614.AetkQYPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230614.AetkQYPg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: mm/vmscan.o: in function `kernel_swap_check':
>> mm/vmscan.c:3481: undefined reference to `kernel_swap_enabled'
>> ld: mm/vmscan.c:3481: undefined reference to `kernel_swap_enabled'
>> ld: mm/vmscan.c:3481: undefined reference to `kernel_swap_enabled'
   ld: drivers/video/fbdev/ls2k500sfb.o: in function `ls2k500sfb_events_fn':
>> drivers/video/fbdev/ls2k500sfb.c:246: undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:246: undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:246: undefined reference to `fg_console'
--
>> drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: warning: no previous prototype for 'inspur_drm_interrupt' [-Wmissing-prototypes]
      30 | irqreturn_t inspur_drm_interrupt(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/inspur/inspur_drm_drv.c: In function 'inspur_pci_probe':
   drivers/gpu/drm/inspur/inspur_drm_drv.c:379:36: warning: unused variable 'priv' [-Wunused-variable]
     379 |         struct inspur_drm_private *priv;
         |                                    ^~~~


vim +/inspur_drm_interrupt +30 drivers/gpu/drm/inspur/inspur_drm_drv.c

    27	
    28	
    29	DEFINE_DRM_GEM_FOPS(inspur_fops);
  > 30	irqreturn_t inspur_drm_interrupt(int irq, void *arg)
    31	{
    32		struct drm_device *dev = (struct drm_device *)arg;
    33		struct inspur_drm_private *priv =
    34			(struct inspur_drm_private *)dev->dev_private;
    35		u32 status;
    36	
    37		status = readl(priv->mmio + INSPUR_RAW_INTERRUPT);
    38	
    39		if (status & INSPUR_RAW_INTERRUPT_VBLANK(1)) {
    40			writel(INSPUR_RAW_INTERRUPT_VBLANK(1),
    41			       priv->mmio + INSPUR_RAW_INTERRUPT);
    42			drm_handle_vblank(dev, 0);
    43		}
    44	
    45		return IRQ_HANDLED;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
