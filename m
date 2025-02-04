Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6563207643
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659459; cv=none; b=I3YcZCRr5RKnBQZ6obcc7SlEWcMHMmS4fZ/60MwRz231QYwo3Z+YvKCcOy/42mzNFFhEALXfwT4wQQhtZ46hyEgWJTIZ2XJmjDn0JUnoxSViTWdMWX+alh0FGWodBwBcv1bFZgxQtX+sxK3pspFS9Cdt0+cUBw7Qn5PKFuyWbnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659459; c=relaxed/simple;
	bh=BNRoJxv1dnIkxqSy6Y9SXM6+X27Ha3znH8kQ0V5KmYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fr79CA4It21087aGpl1+x8x2/KoV5KQPkNS01u5NGrrrM+v8mgWWkajHLJaXwpTcW+sqvPS1ZZMyfAV3hylc3zhr0g5/m2YBMnbd6c43Uo0WoN3OhoMUgsZbcWG5wFKazxyVK48bjCY2ZATPmIFRNMS84dF3BC7C9Qp51nY9V4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfp0BtRX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfp0BtRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738659458; x=1770195458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNRoJxv1dnIkxqSy6Y9SXM6+X27Ha3znH8kQ0V5KmYg=;
  b=kfp0BtRX77xMhJH2Px4VSgP8bOp9nF0fGRvqfqpHWXE15SAOEf/40IRn
   vm4uKu0/7IqtlHUqVYZy0unW5q2ULnIcHdwdqygq7huywARFHknmjp1Qc
   3SS6HQLh63EKQicr8PN6CzxVxfByXARNAT0G9sy2VGagr9y9NNV9zfjro
   T9QXbpVQBxRzQpZ7Ox726VWkhVrAxLuV2rwHG2S+5cZ0fBxLqYUeXXUOe
   7EhATlohpC65FufKtvj+FKWXLacOUhielOKNBP1WawdvJo0YmoJbJp8Cq
   6LF3L40SqaRvADxSwCcQSoXKEl9ts1fYyKr1nxjzPhzZmDXYx+k0I8/Zu
   g==;
X-CSE-ConnectionGUID: 2GRa21SNTvCh6bXUrFHcKQ==
X-CSE-MsgGUID: 9FBssts/RPuHbJ3uHB4jFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39330853"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39330853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:57:37 -0800
X-CSE-ConnectionGUID: lOvLaNnzRK+Qq1GnvWlqgA==
X-CSE-MsgGUID: u2JG4qJQQpaafBTpU9FDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111116627"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Feb 2025 00:57:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfEkQ-000sEX-14;
	Tue, 04 Feb 2025 08:57:34 +0000
Date: Tue, 4 Feb 2025 16:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170] drivers/media/i2c/gc5035.c:1518:46:
 warning: 'gc5035_internal_ops' defined but not used
Message-ID: <202502041639.mFDcnyy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 2aa4f6ff52e147c3d01a521323fa3ccf4e8c42cf [170/170] BACKPORT: media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250204/202502041639.mFDcnyy0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041639.mFDcnyy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041639.mFDcnyy0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/gc5035.c:1518:46: warning: 'gc5035_internal_ops' defined but not used [-Wunused-const-variable=]
    1518 | static const struct v4l2_subdev_internal_ops gc5035_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:402:5: warning: no previous prototype for 'vsp1_entity_init_state' [-Wmissing-prototypes]
     402 | int vsp1_entity_init_state(struct v4l2_subdev *subdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/gc5035_internal_ops +1518 drivers/media/i2c/gc5035.c

  1517	
> 1518	static const struct v4l2_subdev_internal_ops gc5035_internal_ops = {
  1519		.init_state = gc5035_init_state,
  1520	};
  1521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
