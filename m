Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A311B81F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 01:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712108604; cv=none; b=kkTGH+0yxmSCxgXLvVL688fKUKMvsciviYZdSctYI3E5ICdob4vaUEPxnFH+se5qdbplfgzIDez3XSii+TeeIyJi70wYnVarAzkN4Vl9pAXq+7w9bj/dL/tj+ILqc9kWGcmdr8YIGoGIG7hvF87OKMYjTeQ8HKnE/g8tic6o1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712108604; c=relaxed/simple;
	bh=A8ymelhv8DOG4e48aiMQfhfD1fOOHGCvTLUAi8XbSG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBJ+ml8VHO+4uj5oh6J8itX6B1Z0RefqUHGYT1So5RIZ0hDg5X//iEYiPYXE6CQQX0tgJtsOji06jo1WWjfN0XAv6auR/FLJot4ajW38W4Z6e+sXafR66KhrEphTE1sgeOSvir9txTc1qEk08uwdCVVU5tAoYZWvX/v22AIov4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wc+n7KqJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wc+n7KqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712108602; x=1743644602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A8ymelhv8DOG4e48aiMQfhfD1fOOHGCvTLUAi8XbSG4=;
  b=Wc+n7KqJ0G86VvIk+k7cMZSQ2CxAcpiDqHNWMKiP8e4zGtqAzqwpWGkH
   AXDEnyRJfGvTIfdptcvAHxHbTGpHFRRognJ4fx18CQ1eL9OSYCWtLMTWV
   p6KlOr55KEfY5HLwF6XIy8LglMTzA5zYd0fUUQhRuQCxdpJ7b5G+Ks92A
   iFmBR4CLQTumLC6zg7iZixAQQ8VerD/pz1966mXrHiXeGxSjA2CGWp2sC
   7Chcd6Ih7Cu8ksiFL9DFKVmnNpV/2gKhCSVmbH/x7lLyZ9LcoG6sJyvdI
   kRemjQAG+SnJtE2gPKJuTwiF4zY+F+MuT5ST5csTGcSab7qJAsJ0WTWCp
   g==;
X-CSE-ConnectionGUID: 5NRFOG2AQHSVrAmZEFeMFQ==
X-CSE-MsgGUID: rKSYFgPUQv+0/nyB8mwGOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18681600"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18681600"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 18:43:19 -0700
X-CSE-ConnectionGUID: TmDir2iuRXiS2GvkV3GL4w==
X-CSE-MsgGUID: q4fzq66OQRiKOPuZ1uuWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22901529"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2024 18:43:19 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrpem-0001k9-2h;
	Wed, 03 Apr 2024 01:43:16 +0000
Date: Wed, 3 Apr 2024 09:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 35/51] drivers/iio/industrialio-trigger.c:260:19:
 error: implicit declaration of function 'find_and_set_bit'; did you mean
 'test_and_set_bit'?
Message-ID: <202404030945.Xsb01eSt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: b6c22106d74128f60a207e9460ec83eb616ea396 [35/51] Revert "ssd"
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240403/202404030945.Xsb01eSt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030945.Xsb01eSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030945.Xsb01eSt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/industrialio-trigger.c: In function 'iio_trigger_get_irq':
>> drivers/iio/industrialio-trigger.c:260:19: error: implicit declaration of function 'find_and_set_bit'; did you mean 'test_and_set_bit'? [-Werror=implicit-function-declaration]
     260 |         int ret = find_and_set_bit(trig->pool, CONFIG_IIO_CONSUMERS_PER_TRIGGER);
         |                   ^~~~~~~~~~~~~~~~
         |                   test_and_set_bit
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from drivers/iio/industrialio-trigger.c:8:
   drivers/iio/industrialio-trigger.c: In function 'viio_trigger_alloc':
>> drivers/iio/industrialio-trigger.c:569:25: error: 'struct iio_trigger' has no member named 'pool_lock'
     569 |         mutex_init(&trig->pool_lock);
         |                         ^~
   include/linux/mutex.h:63:23: note: in definition of macro 'mutex_init'
      63 |         __mutex_init((mutex), #mutex, &__key);                          \
         |                       ^~~~~
   cc1: some warnings being treated as errors


vim +260 drivers/iio/industrialio-trigger.c

   256	
   257	/* Trigger Consumer related functions */
   258	static int iio_trigger_get_irq(struct iio_trigger *trig)
   259	{
 > 260		int ret = find_and_set_bit(trig->pool, CONFIG_IIO_CONSUMERS_PER_TRIGGER);
   261	
   262		return ret < CONFIG_IIO_CONSUMERS_PER_TRIGGER ? ret + trig->subirq_base : -ENOMEM;
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
