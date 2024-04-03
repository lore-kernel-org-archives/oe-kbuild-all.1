Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587BF134BD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 01:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712108602; cv=none; b=hCIor25LaZniVhk7vJ2c/l+4qxzxj7MS11FRhLGSG0+BfuhpVL66boegyDwVOSbFaqKpYyXMt39YPnOpNFpbsbY656SBqx29Rnu9XE6pecHd0hg3EhrGJwqWHxyYh0O1BkGq2ZtGigDbaHHWE1zuAQqr/kuZqPeEn8ZSLOMaEVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712108602; c=relaxed/simple;
	bh=J1l18L9NXeXQtBVjbwzXSkZ8sQrt92jcI3J6RU3kb4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RULo3vS/+cfq0cuPh5dOassnnxOaN2SyHiEio3nZu4TtSC65OM3Hfl0FAtKIYb0xqHuAv/BDVm5Ke0sX9FG5sZbktkra0p9v4DYcZ68R1tBZO3EdD4pjM2zvqi6OZoiE7ATHMBH6o1MOjfveZrMRULyqdXymaiCEziD2dURQG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0rHiKAY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0rHiKAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712108600; x=1743644600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1l18L9NXeXQtBVjbwzXSkZ8sQrt92jcI3J6RU3kb4w=;
  b=C0rHiKAYUD9+8QM3/JlpcPswvh8CA9OGYuLOYnkmZpYddZA7ykmu5AT3
   88IHbNhd+ybe3VncDOVEbd3LwjFtJ1AaO33K3Ol8cVOHr32XUlwTkUEeZ
   sv3vQT2C7H3Vt2rH977wmgsioBLj4doOZ6GN8yc76UbyzCflRcxOB4o99
   wX7TGQLxfVXwNk1D/Sg6xV4i8t+pzg57ISK/YMDI/0CE2qYul/puRYVpn
   ge2V09Rro4e7UJCTpEeLRvd0DdrpqbWZRGhV3Gc9x4anO3WDjW7zjVIwO
   Mfsv/XgMss0qzvVzPVsdOuyJyAHvLwC/M+bFkzcd4Ryq1HRq8r3Vf+td/
   A==;
X-CSE-ConnectionGUID: Groe6LXXQt2zj4vmmeBvJQ==
X-CSE-MsgGUID: mf75vjFBR6KBr+9oV8614w==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18681595"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18681595"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 18:43:19 -0700
X-CSE-ConnectionGUID: yzKv6AfbQVuSMPDrNUTe+A==
X-CSE-MsgGUID: qX1Gj8c3ROmaHMAfOqy67g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22901527"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2024 18:43:19 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrpem-0001k7-2d;
	Wed, 03 Apr 2024 01:43:16 +0000
Date: Wed, 3 Apr 2024 09:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 35/51] drivers/iio/industrialio-trigger.c:260:12:
 error: implicit declaration of function 'find_and_set_bit' is invalid in C99
Message-ID: <202404030905.03guIUYj-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240403/202404030905.03guIUYj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030905.03guIUYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030905.03guIUYj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/industrialio-trigger.c:260:12: error: implicit declaration of function 'find_and_set_bit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           int ret = find_and_set_bit(trig->pool, CONFIG_IIO_CONSUMERS_PER_TRIGGER);
                     ^
>> drivers/iio/industrialio-trigger.c:569:20: error: no member named 'pool_lock' in 'struct iio_trigger'
           mutex_init(&trig->pool_lock);
                       ~~~~  ^
   include/linux/mutex.h:63:16: note: expanded from macro 'mutex_init'
           __mutex_init((mutex), #mutex, &__key);                          \
                         ^~~~~
   2 errors generated.


vim +/find_and_set_bit +260 drivers/iio/industrialio-trigger.c

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
