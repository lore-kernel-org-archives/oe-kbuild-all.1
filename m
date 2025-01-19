Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA803366
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737245002; cv=none; b=NI/HvZ0gAmFaHuRe6qC6ooUBxTdR7LBbgRQOlDEbbdF+fNFUHRFmjdkom/KBZH9q0DYrcqKWjWvSY0fTv8yMJaBb0ct2CDucHsgGHhEY/lzihipiujKk1GgqztSQksmrK0f5zCULlZZY7HIKcqy0XhcOSGNXcU62rvsWNU0zzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737245002; c=relaxed/simple;
	bh=mBVbYgYqJy82oVKCGcIzApJpppsSr6PU9sYKrZ5sgNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I11+ISOuzCg0uv3I6VOoa1BDUh1q4AqAALE2NO0TwqNVLGgI3wGfNQolHxiZwo6XZdpjcSwmjKnhm4yTGNcgcuAUcvOt3FTJgC70I8SBzJdkjCRvF5/nHN4rbk1Mx8X9N3tse5hhja9b8cUc1QCQjKGbl4WbxK6VdO5P5ncTiHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFEtapT3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFEtapT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737245001; x=1768781001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBVbYgYqJy82oVKCGcIzApJpppsSr6PU9sYKrZ5sgNE=;
  b=hFEtapT3hnaeNqFX42yyMllEcbLEtc34dwUODDWPsCV3+YaU/vVtfjmC
   eyi10CmAHjxidowA2IWI5aI3Gi4MVp1To7R8kJSxfq6f1qj8EW/tDPvSV
   OmiKRyqMoHTcvi5sMeB1oUW0HF/GYWAIaBT92nYvt1BGgMgPJkNU2rrsT
   Uns++RdU3nYzZfDvaLsgMfJLLmMQkpD3elTt4wZlfC8N+H9ph/oqqHn1d
   d1h7HIqEvaQUnxX1jfWU+d3GEyBRatoFalDE3w3X2FklxTG4zm9ztK4m6
   EYa+zcedB/CpdE5HcVaQRgDu2UkU8Pd5VxvEE1UYf53ctWQhDf4IyM/Ha
   w==;
X-CSE-ConnectionGUID: ROAiKMsAR9afw3gD4kVqLA==
X-CSE-MsgGUID: LmubEoZHSnaLiuHya6DgNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37525015"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37525015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 16:03:20 -0800
X-CSE-ConnectionGUID: Mut2MyqGSh+av9pRdPtVHQ==
X-CSE-MsgGUID: 4e3lFjU/Sc+EIcKrjeEHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111241527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jan 2025 16:03:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZImb-000Ux5-0B;
	Sun, 19 Jan 2025 00:03:17 +0000
Date: Sun, 19 Jan 2025 08:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 324/324]
 drivers/rpmsg/mtk_rpmsg_mbox.c:33:5: warning: no previous prototype for
 'mtk_mbox_send'
Message-ID: <202501190700.UdJcvzMY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5c75fa9e727eeea4f1aac71a5838a1bdc76d0dd
commit: 0b263763b3a9ab1dd29c899035ef2660eea35d14 [324/324] CHROMIUM: mailbox: add tinysys mailbox
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250119/202501190700.UdJcvzMY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190700.UdJcvzMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190700.UdJcvzMY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rpmsg/mtk_rpmsg_mbox.c:33:5: warning: no previous prototype for 'mtk_mbox_send' [-Wmissing-prototypes]
      33 | int mtk_mbox_send(struct mtk_rpmsg_endpoint *mept,
         |     ^~~~~~~~~~~~~
--
>> drivers/soc/mediatek/mtk-mbox.c:23:6: warning: no previous prototype for 'mtk_memcpy_to_tinysys' [-Wmissing-prototypes]
      23 | void mtk_memcpy_to_tinysys(void __iomem *dest, const void *src, uint32_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mbox.c:39:6: warning: no previous prototype for 'mtk_memcpy_from_tinysys' [-Wmissing-prototypes]
      39 | void mtk_memcpy_from_tinysys(void *dest, const void __iomem *src, uint32_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mbox.c:356:5: warning: no previous prototype for 'mtk_mbox_set_base_reg' [-Wmissing-prototypes]
     356 | int mtk_mbox_set_base_reg(struct mtk_mbox_device *mbdev, unsigned int mbox,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mbox.c:846:6: warning: no previous prototype for 'mtk_mbox_print_recv' [-Wmissing-prototypes]
     846 | void mtk_mbox_print_recv(struct mtk_mbox_device *mbdev,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mbox.c:864:6: warning: no previous prototype for 'mtk_mbox_print_send' [-Wmissing-prototypes]
     864 | void mtk_mbox_print_send(struct mtk_mbox_device *mbdev,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-mbox.c:876:6: warning: no previous prototype for 'mtk_mbox_print_minfo' [-Wmissing-prototypes]
     876 | void mtk_mbox_print_minfo(struct mtk_mbox_device *mbdev,
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/mtk_mbox_send +33 drivers/rpmsg/mtk_rpmsg_mbox.c

    32	
  > 33	int mtk_mbox_send(struct mtk_rpmsg_endpoint *mept,
    34			    struct mtk_rpmsg_channel_info_mbox *mchan, void *buf,
    35			    unsigned int len, unsigned int wait)
    36	{
    37		struct mtk_mbox_device *mbdev;
    38		unsigned int status;
    39		unsigned long flags;
    40		int ret;
    41	
    42		if (WARN_ON(len > mchan->send_slot_size) || WARN_ON(!buf))
    43			return -EINVAL;
    44	
    45		mbdev = mept->mdev->mbdev;
    46	
    47		spin_lock_irqsave(&mchan->channel_lock, flags);
    48		status = mtk_mbox_check_send_irq(mbdev, mchan->mbox,
    49						 mchan->send_pin_index);
    50		if (status != 0) {
    51			spin_unlock_irqrestore(&mchan->channel_lock, flags);
    52			return MBOX_PIN_BUSY;
    53		}
    54		spin_unlock_irqrestore(&mchan->channel_lock, flags);
    55	
    56		ret = mtk_mbox_write(mbdev, mchan->mbox, mchan->send_slot, buf,
    57				     len * MBOX_SLOT_SIZE);
    58		if (ret != MBOX_DONE)
    59			return ret;
    60	
    61		/*
    62		 * Ensure that all writes to SRAM are committed before sending the
    63		 * interrupt to mbox.
    64		 */
    65		mb();
    66	
    67		ret = mtk_mbox_trigger_irq(mbdev, mchan->mbox,
    68					   BIT(mchan->send_pin_index));
    69		if (ret != MBOX_DONE)
    70			return ret;
    71	
    72		return ret;
    73	}
    74	EXPORT_SYMBOL_GPL(mtk_mbox_send);
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
