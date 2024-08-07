Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89B13B7BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 23:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723071626; cv=none; b=pWaqXT6io0Fu1ANNx1l1k24peirFoxbtWwKHdDgP2zVN2ekznOrO9AxaKjlwiaK8Ic0MvEs+nLPWZYD3Ja/TRb7Ryl6EFPy+rJjyvv1Yc/SH/Sz1SEK5V7rrRyajb5DpwJu2xJOA7M/PoREETu22ktEmD5bTEYiT5CvTGP1dPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723071626; c=relaxed/simple;
	bh=4NMc3ZYKhO/vN8Z446Lrue7n1aNRFulI6tPKyI6v+To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/zj8XwJA3fCYU7TMD6MfOoyTUO9cGCzhxElKyA6riUr3Oe7x/YKILhWqkOxZI0IYYediWgn8+SUbE7iPJgsU1hKipkQSNNsGMy/VvkWjWC4gZb4BnUAvBdqIJjpPdYFat+utkWZN6DZwft+e9GbI3OHdLSbbjChbQcGRAWCUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDy5a+Nd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDy5a+Nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723071623; x=1754607623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NMc3ZYKhO/vN8Z446Lrue7n1aNRFulI6tPKyI6v+To=;
  b=XDy5a+Nd5cEcsRbbffuMuSK3kWaQnftAYkCp8bFeyW4SMM3Ys271cTyP
   u0eIjXi6Ngvx9he+RJ/AUBy9Qit0hpvnSkoJmRBJYrgK+Im4fEjd0XPGu
   2/BxRBeBPVI5uDjMBd6v3zXNVUI5wGZzlGejjgG1Ay0Amzsv/SHIeP4R7
   s5ir0iophgSL4uG2H3KttZjKSve4Kn9aEBFFnNVgk61sbJSDqdbaiZWNx
   1NxzWvgU9ybbtO661btW4hcsr2Hj0GxLfzJ6JHpTDnKOYXk7rLmWjaxVt
   wk3sw2hU2x0vkcM3Jb5TmuOfKxeay8jdKmxtDjdjTJJ+UoLDJEtU/m9tK
   A==;
X-CSE-ConnectionGUID: Lg+yEo9jT2WYM5le63DQhQ==
X-CSE-MsgGUID: rQDcxCzZR8mJW8LiOi+mjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20834975"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="20834975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 16:00:22 -0700
X-CSE-ConnectionGUID: C7kqh7xyQEW6q0/z29bNKw==
X-CSE-MsgGUID: dXUNZF+BTcO2hC/eik904Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="87674908"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2024 16:00:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbpdi-0005mW-32;
	Wed, 07 Aug 2024 23:00:18 +0000
Date: Thu, 8 Aug 2024 07:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:sigh 3/4] drivers/hwmon/tvs-mpfs.c:359:32: error:
 'mpfs_reset_ids' undeclared here (not in a function); did you mean
 'mpfs_tvs_ids'?
Message-ID: <202408080620.vq6y2W8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git sigh
head:   916c5e78cc2298270e3725643cc99d5a1f31ba99
commit: 6bae4cc15d793779880649ae801756ff86816a3a [3/4] hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408080620.vq6y2W8D-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080620.vq6y2W8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080620.vq6y2W8D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/auxiliary_bus.h:11,
                    from drivers/hwmon/tvs-mpfs.c:8:
>> drivers/hwmon/tvs-mpfs.c:359:32: error: 'mpfs_reset_ids' undeclared here (not in a function); did you mean 'mpfs_tvs_ids'?
     359 | MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
         |                                ^~~~~~~~~~~~~~
   include/linux/module.h:250:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:250:21: error: '__mod_auxiliary__mpfs_reset_ids_device_table' aliased to undefined symbol 'mpfs_reset_ids'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/hwmon/tvs-mpfs.c:359:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     359 | MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
         | ^~~~~~~~~~~~~~~~~~~


vim +359 drivers/hwmon/tvs-mpfs.c

   352	
   353	static const struct auxiliary_device_id mpfs_tvs_ids[] = {
   354		{
   355			.name = "mailbox_mpfs.tvs-mpfs",
   356		},
   357		{ }
   358	};
 > 359	MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
