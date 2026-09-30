Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C2C3F23BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802351; cv=none; b=dYyjfvxAqcE1jPgYGUPTiqLD0OaSNXuGPhFPEWVhGzBZ5IthySzv3nYZxsU7b3iTB9w1VrYglF//8dhWq3FUNEeEdTp7F/gj30L1ug700618M4VIWZRaHNZVa5O4H5hYreiMbFMpG/8SJZywdG8HhKXjWIo05HPNBAcnjDODEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802351; c=relaxed/simple;
	bh=5xivkkgKRiSPFA6SaJl9JOtLihfBMbXMxEQ/oo9KsLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BH2Ljjj+megKV1c55aS2Q+8Pqm044m1GWZkk1NDh6thSEScHij6/KqOhrIj2NDGrihuBwjt9f3lrFefvB51PjIMrQr9Lh2wVtWB7NLwYtnTQCri7zgqqPEn11jBL6jHPZ88/YMYuswPmkTc+27kTWA+ke7faDhWO7Ev8w0x7Rk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0jvTTCb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0jvTTCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790802350; x=1822338350;
  h=date:from:to:cc:subject:message-id;
  bh=5xivkkgKRiSPFA6SaJl9JOtLihfBMbXMxEQ/oo9KsLg=;
  b=Z0jvTTCbIyXiuWh8GQps9AEOgI0t8irX+tkQnba1c8BTjPyYsam4ljaz
   mC1xJenP7MCsPMJq+67X12vHke2gsBV3C26nyUFUMKRTbQBMaiPj+oWDW
   GMHHtp/SEimVYj/e16EnWbfoZFjU2Xy+ixKNiYErgHf5GEobE9mDTCICG
   HLcbwL5PclzCsKtXm7OYo3bBQath6sVfoFXvvNon+d9QFYq2HY0+FU7Yt
   HsxH/Az6rgWmH72YCl+bvJZFUeOvq/LdIeqCMYIe9SPTRG3pbntZsFrvz
   ewvOUKjzMRYmW7svf5AHf7Sph3Y9X8HrE6ZGcCj6ScGkcTClgpb540nbM
   g==;
X-CSE-ConnectionGUID: hvm1OYmIT3KfSDCVnHm6/w==
X-CSE-MsgGUID: 73LXHIuiS7CK8msK3Rlj2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94264549"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="94264549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 14:05:50 -0700
X-CSE-ConnectionGUID: IS++SwhnQF6Cm4FVBV7WMA==
X-CSE-MsgGUID: zS5sNQjcTOme30um4KmvTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="274998543"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2026 14:05:48 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC1Uo-0000000020B-03VC;
	Wed, 30 Sep 2026 21:05:46 +0000
Date: Wed, 30 Sep 2026 23:04:57 +0200
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [linux-next:master 11196/12559]
 drivers/reset/reset-dr1v90.c:114:20: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202609302313.Ux3U0CdC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: 9fd565971072d2d7158e15178f84b0273e294e70 [11196/12559] reset: anlogic: add support for Anlogic DR1V90 resets
config: s390-randconfig-r2304-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302313.Ux3U0CdC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302313.Ux3U0CdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302313.Ux3U0CdC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/reset/reset-dr1v90.c:114:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *platform_data @@
   drivers/reset/reset-dr1v90.c:114:20: sparse:     expected void [noderef] __iomem *base
   drivers/reset/reset-dr1v90.c:114:20: sparse:     got void *platform_data

vim +114 drivers/reset/reset-dr1v90.c

   101	
   102	static int dr1v90_reset_probe(struct auxiliary_device *adev,
   103				      const struct auxiliary_device_id *id)
   104	{
   105		struct dr1v90_reset_controller *rstc;
   106		struct device *dev = &adev->dev;
   107	
   108		rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
   109		if (!rstc)
   110			return -ENOMEM;
   111	
   112		spin_lock_init(&rstc->lock);
   113	
 > 114		rstc->base = dev->platform_data;
   115		rstc->rcdev.dev = dev;
   116		rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
   117		rstc->rcdev.of_node = dev->parent->of_node;
   118		rstc->rcdev.ops = &dr1v90_reset_control_ops;
   119		rstc->rcdev.owner = THIS_MODULE;
   120	
   121		return devm_reset_controller_register(dev, &rstc->rcdev);
   122	}
   123	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
