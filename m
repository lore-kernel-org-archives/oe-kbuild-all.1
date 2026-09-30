Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBE4FDE56
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781982; cv=none; b=Jhm3bu/FU4vriCCNWumngHNlR9oEpB86XGFnlp2yVkMtkcc0vS88cC0FeGjdSae18RJp7bPsESlQmr8ih54YrxBscZP4LXCp18qKvzDfIjVfLE+k8i2Br4ILCqDJXb/nbqbrLRtDqQCpcs4FGBvhUSPWJK7xv1sJCH+9RYdN9XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781982; c=relaxed/simple;
	bh=2Bd57WdxIy/aqyifTvHIOwp92EbJfqcB8f/r7jIkhK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XC5QendgAsaLb3SX+5n/F89GZ4QI/HIdb12vPqJ6mRmKW+0AMvu7YVsz7f+kvXb3jqm3Pm8MvIAYP1M3Q2DoH06N973RB/Gj7M3+jnRIUh+CYyN33uRAi8An5Y+K1n4MMxda4YLPVG7B6oBQZRrys83WQB/e1IKY0WGtgNg+S3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOSRzM/8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOSRzM/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790781975; x=1822317975;
  h=date:from:to:cc:subject:message-id;
  bh=2Bd57WdxIy/aqyifTvHIOwp92EbJfqcB8f/r7jIkhK8=;
  b=dOSRzM/8l/MLtnzUITmL2hvd1MCOBYwfmgqPcp5JwbL1H0eCm7yp5Uqi
   IHF54p6oo7vmz3VJooXg4x2+YMO5JcZut59P0vmUJ9dKlvSi06VXk7ohi
   zHRHfUqcb2zY2cnmlLZxuMEwRdxeQC1Fsrczt2bsVqpY5fMQD7zjRq1Im
   rqbgrRzdZ3lIS0SuNIQP2uFZnqv4H/U0fLTCwc9Y2GxFsBpCYAuvokwHK
   b7ZBepaliklHRYVBmEUKSeBChG36QYsN6WRTaVVgc2pF4YUpWSc/27fiR
   Vv8zdEsa6S9/xBH1+TRY1+H51drnUUoJxNGT21zUe/5kt9c3nnJ0eeEKR
   w==;
X-CSE-ConnectionGUID: Uo404A0KQoeJGHk5r8YmaQ==
X-CSE-MsgGUID: FgWq9xlsQdep6Vz7dtqS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90736955"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90736955"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 08:26:13 -0700
X-CSE-ConnectionGUID: pyoMHPJ1Sb+g6oO6oa2CGA==
X-CSE-MsgGUID: p5cBzfK8TaSmeQo/CoHmlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273526431"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2026 08:26:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBwC7-000000001uh-2Zgp;
	Wed, 30 Sep 2026 15:26:07 +0000
Date: Wed, 30 Sep 2026 17:25:17 +0200
From: kernel test robot <lkp@intel.com>
To: "Abd-Alrhman Masalkhi" <abd.masalkhi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/md/md-ctl.c:501:27: warning: variable 'mddev' is
 uninitialized when used here
Message-ID: <202609301727.iVitGFeh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Abd-Alrhman-Masalkhi/md-make-mddev-lookup-and-ioctl-helpers-non-static/20260928-201223
head:   6b0c58a68cb9e72a888a76dac60d49a88d347118
commit: 6b0c58a68cb9e72a888a76dac60d49a88d347118 md: add a control device for array management
date:   2 days ago
config: arm-randconfig-r2106-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301727.iVitGFeh-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301727.iVitGFeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301727.iVitGFeh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/md-ctl.c:501:27: warning: variable 'mddev' is uninitialized when used here [-Wuninitialized]
     501 |                 return get_raid_version(mddev, (struct mdu_version64 __user *)u);
         |                                         ^~~~~
   drivers/md/md-ctl.c:492:21: note: initialize the variable 'mddev' to silence this warning
     492 |         struct mddev *mddev;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +/mddev +501 drivers/md/md-ctl.c

   486	
   487	static long md_ctl_ioctl(struct file *filp, uint cmd, ulong u)
   488	{
   489		int err;
   490		unsigned int old_cmd;
   491		unsigned int noio_flags = 0;
   492		struct mddev *mddev;
   493		void __user *arg;
   494		struct mdu_ioctl md_ctl;
   495	
   496		err = ctl_ioctl_valid(cmd);
   497		if (err)
   498			return err;
   499	
   500		if (cmd == MD_RAID_VERSION)
 > 501			return get_raid_version(mddev, (struct mdu_version64 __user *)u);
   502	
   503		if (copy_from_user(&md_ctl, (void __user *)u, sizeof(md_ctl)))
   504			return -EFAULT;
   505	
   506		err = ctl_flags_valid(cmd, md_ctl.flags);
   507		if (err)
   508			return err;
   509	
   510		mddev = ctl_find_mddev(&md_ctl);
   511		if (IS_ERR(mddev))
   512			return PTR_ERR(mddev);
   513	
   514		old_cmd = try_convert_ioctl_cmd(cmd, md_ctl.flags);
   515		if (old_cmd) {
   516			err = md_do_ioctl(mddev->gendisk->part0, 0, old_cmd, md_ctl.arg);
   517			goto out;
   518		}
   519	
   520		arg = (void __user *)md_ctl.arg;
   521		switch (cmd) {
   522		case MD_GET_ARRAY_INFO:
   523			err = ctl_get_array_info(mddev, arg);
   524			goto out;
   525	
   526		case MD_GET_DISK_INFO:
   527			err = ctl_get_disk_info(mddev, arg);
   528			goto out;
   529	
   530		case MD_GET_BITMAP_FILE:
   531			err = ctl_get_bitmap_file(mddev, arg);
   532			goto out;
   533		};
   534	
   535		if (!md_is_rdwr(mddev))
   536			flush_work(&mddev->sync_work);
   537	
   538		err = mddev_suspend_and_lock(mddev);
   539		if (err) {
   540			pr_debug("md: ioctl lock interrupted, reason %d, cmd %d\n",
   541				 err, cmd);
   542			goto out;
   543		}
   544		noio_flags = memalloc_noio_save();
   545	
   546		switch (cmd) {
   547		case MD_SET_ARRAY_INFO:
   548			err = ctl_set_array_info(mddev, arg);
   549			break;
   550	
   551		case MD_ADD_NEW_DISK:
   552			err = ctl_add_new_disk(mddev, arg);
   553			break;
   554		}
   555	
   556		if (mddev->hold_active == UNTIL_IOCTL && err != -EINVAL)
   557			mddev->hold_active = 0;
   558	
   559		memalloc_noio_restore(noio_flags);
   560		mddev_unlock_and_resume(mddev);
   561	out:
   562		mddev_put(mddev);
   563		return err;
   564	}
   565	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
