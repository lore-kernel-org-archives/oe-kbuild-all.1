Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D343812E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 18:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288294; cv=none; b=pLLl9pAT/TdClsC0KdkRPUIcg1TIQzfZQQOJPV+43c+2/F/eDvP6PlYd1DzBFDNbBp7tn9Yw85zvg/TRaqpkLI3deuWqRrDQADG4MYg+Y1+q4ma6RVkWk55BBltiIDex8jWsKFydeyY7vQLmCAwbIUQlNmsOEPg1UT6OjqabDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288294; c=relaxed/simple;
	bh=5Xccl7oYHSGvcwfjAihmnWjZCjiiMcTxFHSX9mrpqTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fysBWoNzJro5A7gTQGCpt8+8U0bioFmRmV7aTlIOGV3PAuESF8RcYHtCg+W2jh6Ucp52rOHYijZHuCLNc3Jd0QydI0hwf5DW5GXW9IyeACya1CITN6QsbkfFXszeyfwlCALG9Zakm6xwdLYSCMyoPtT7pB2KB1Hzr2GVoBxgq+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsprlMUE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsprlMUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781288293; x=1812824293;
  h=date:from:to:cc:subject:message-id;
  bh=5Xccl7oYHSGvcwfjAihmnWjZCjiiMcTxFHSX9mrpqTE=;
  b=RsprlMUExiDLObHIIqy63Q0f1Ens3xAVxQDUBxi60i741NlBB6zL0ke0
   gahwaMJ/xXnBkQwSVxqd5rQAZh9GzlwlnOQSRWxXCgk0oslGEeBMeO6X3
   6pD7KSTn36SPxKkmCOTPy+j2j+9ZgOwWJeb73bmCx3RElNGw6lUieI3Fp
   MkPJD+phP6OopsztLGM9S4szDEKBrZZMyS5j6Fg1wSjHgTqcq7rOp19kf
   TeZ3hnV21RSQ4YZfZu+/A8ywUekwa5kTjlLtEor5k/EQD7agc97vp9TA9
   qfjS5tjbu0QOTK43LIACqkngatjGXjDPkMuzqYKaTQ0oemaQzi7kUaexA
   w==;
X-CSE-ConnectionGUID: /7qiCnQbRGue8AKF0S7vKw==
X-CSE-MsgGUID: zyaMdpP3QQqKRS+6+Ofr5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82031215"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82031215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 11:18:12 -0700
X-CSE-ConnectionGUID: 0XRtl7GYQ4+iv4b5GeKSsQ==
X-CSE-MsgGUID: JwCsuqAiRXySaxouMVWy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="244462984"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 11:18:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY6SG-00000000PBL-1nOZ;
	Fri, 12 Jun 2026 18:18:08 +0000
Date: Sat, 13 Jun 2026 02:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Eliza Balas <eliza.balas@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 26771/27391]
 drivers/net/mqnic/mqnic_irq.c:108:62: warning: 'snprintf' output may be
 truncated before the last format character
Message-ID: <202606130205.hDCA5lSW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 5df21ca246e1457998e7b8460a088a74f6157c98 [26771/27391] drivers: net: Add Corundum MQNIC driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260613/202606130205.hDCA5lSW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130205.hDCA5lSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130205.hDCA5lSW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/mqnic/mqnic_irq.c: In function 'mqnic_irq_init_platform':
>> drivers/net/mqnic/mqnic_irq.c:108:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     108 |                 snprintf(irq->name, sizeof(irq->name), "%s-%u", mdev->name, k);
         |                                                              ^
   drivers/net/mqnic/mqnic_irq.c:108:17: note: 'snprintf' output between 3 and 20 bytes into a destination of size 19
     108 |                 snprintf(irq->name, sizeof(irq->name), "%s-%u", mdev->name, k);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +108 drivers/net/mqnic/mqnic_irq.c

    82	
    83	int mqnic_irq_init_platform(struct mqnic_dev *mdev)
    84	{
    85		struct platform_device *pdev = mdev->pfdev;
    86		struct device *dev = mdev->dev;
    87		int k;
    88	
    89		// Allocate IRQs
    90		mdev->irq_count = platform_irq_count(pdev);
    91	
    92		// Set up interrupts
    93		for (k = 0; k < mdev->irq_count; k++) {
    94			int irqn;
    95			struct mqnic_irq *irq;
    96			int ret;
    97	
    98			irqn = platform_get_irq(pdev, k);
    99			if (irqn < 0)
   100				return irqn;
   101	
   102			irq = devm_kzalloc(dev, sizeof(*irq), GFP_KERNEL);
   103			if (!irq)
   104				return -ENOMEM;
   105	
   106			ATOMIC_INIT_NOTIFIER_HEAD(&irq->nh);
   107	
 > 108			snprintf(irq->name, sizeof(irq->name), "%s-%u", mdev->name, k);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
