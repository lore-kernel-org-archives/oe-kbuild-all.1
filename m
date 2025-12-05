Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A7F3B8D7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764973527; cv=none; b=PHpDNgV4Zn0RUEStUZRr3eDQEaoDWZ1SVbq4wNr1SCYX5WwEyqFj8wwDTMphRXXiN/DKqdZp2tSyPmH9qww7+n9UEyhy/SGT79d2IO4vffohBCO23smI2vQNh9EqGh/9ycUDP6dTfqutX6pTf5TFrVxZwhtc31rSdviCC9tDXd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764973527; c=relaxed/simple;
	bh=4MajvzBWnu4RjqxRaCiEJeD+ULQO67C1cwJw79wjiwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqeOYIOXwy9II1AyGG0okfMImPcMQSjJnA8SF9bkr6fqoKWHoTYxKfUVVtDGbAp17dH/IYllgUon0lFx/X0oonxakbUF2n7DgkrBGkD9NlJaJEEIj/Smafj62yZFR9LXlwZ2naG/vVW6L81N6syc0WmjcjNbWiipL+W7eu1a5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYyrR+eM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYyrR+eM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764973525; x=1796509525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MajvzBWnu4RjqxRaCiEJeD+ULQO67C1cwJw79wjiwI=;
  b=eYyrR+eM7FRQMf67jJI+BU9N8ShcR6FUt/luXyxgNS0RGCYn62iwfNHB
   EAaduCGxYE5tx/m+1bZDQ89ZUHL7RZK7GxLRf9otSGFI7WDAeF8iOYyBw
   w7nxAF644Ucjd2CHiFgMBIM1P6ugS3aoiMPYNZt1u2IyLGJi02tXb/cKh
   CLwEXJK0tmUZXC7YaaSMDGBTKU2KmIpiiMehaUqyM9kqtU0dqLg6PdjUM
   C4TvZ3gbQ/wnomj89a8Th7PT09Tgte2j1mafKUbeG5dlwm53NOSLa3a9l
   Q6v0ERea/gE+qaIoV7gEVqXdgYuUEafFtriBXtvG13E2OUS44P87JIz+J
   Q==;
X-CSE-ConnectionGUID: jUvzT+rETKKRbAL2Y8tvMw==
X-CSE-MsgGUID: 5oHwO9mpTrCR5W0oUobKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="69606021"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="69606021"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 14:25:24 -0800
X-CSE-ConnectionGUID: 9zPZXT6eSbKumg6sGAUY3w==
X-CSE-MsgGUID: t+A5ae4rSgS4OZIQ8ckYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="196177282"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2025 14:25:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vReEr-00000000Fb3-1axT;
	Fri, 05 Dec 2025 22:25:21 +0000
Date: Sat, 6 Dec 2025 06:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wen Chen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_tp.c:42:5: warning: no previous prototype for
 'ubcore_set_tp_attr'
Message-ID: <202512060607.MyfYJLh0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 48c0dc7e6efc81a43d09cc96efcd43f68c0ed145 [3479/3479] urma: added functions for getting and setting TP attribute fields.
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060607.MyfYJLh0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060607.MyfYJLh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060607.MyfYJLh0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_tp.c:16:5: warning: no previous prototype for 'ubcore_get_tp_list' [-Wmissing-prototypes]
      16 | int ubcore_get_tp_list(struct ubcore_device *dev, struct ubcore_get_tp_cfg *cfg,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_tp.c:42:5: warning: no previous prototype for 'ubcore_set_tp_attr' [-Wmissing-prototypes]
      42 | int ubcore_set_tp_attr(struct ubcore_device *dev, const uint64_t tp_handle,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_tp.c:65:5: warning: no previous prototype for 'ubcore_get_tp_attr' [-Wmissing-prototypes]
      65 | int ubcore_get_tp_attr(struct ubcore_device *dev, const uint64_t tp_handle,
         |     ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_set_tp_attr +42 drivers/ub/urma/ubcore/ubcore_tp.c

    41	
  > 42	int ubcore_set_tp_attr(struct ubcore_device *dev, const uint64_t tp_handle,
    43			       const uint8_t tp_attr_cnt, const uint32_t tp_attr_bitmap,
    44			       const struct ubcore_tp_attr_value *tp_attr,
    45			       struct ubcore_udata *udata)
    46	{
    47		int ret;
    48	
    49		if (dev == NULL || dev->ops == NULL || dev->ops->set_tp_attr == NULL ||
    50		    tp_attr == NULL) {
    51			ubcore_log_err("Invalid parameter.\n");
    52			return -EINVAL;
    53		}
    54	
    55		ret = dev->ops->set_tp_attr(dev, tp_handle, tp_attr_cnt, tp_attr_bitmap,
    56					    tp_attr, udata);
    57		if (ret != 0)
    58			ubcore_log_err("Failed to set tp attributions, ret: %d.\n",
    59				       ret);
    60	
    61		return ret;
    62	}
    63	EXPORT_SYMBOL(ubcore_set_tp_attr);
    64	
  > 65	int ubcore_get_tp_attr(struct ubcore_device *dev, const uint64_t tp_handle,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
