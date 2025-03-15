Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C967CB666
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742007807; cv=none; b=riso6mmDZ48czyuvGqUEYXbMJYuOvo1dJCognWh4aOxyggDMnr8U6bAD9Igy+f/MfGmYHgvlA1Aq59Xykpdw+MAA8Aoi0fikotylJyQpYOluf1YY4R6hVGpl5MJmgJZUMRXMY81K0iGhjeuSyHRGrAnPfJc34BCO3gnAMpBU0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742007807; c=relaxed/simple;
	bh=xN7u2QzVf/7qN9pHbZ+Z0Od5+cfZ69eigsmmau16844=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNjE0GG+AWjZveduG3GVIhaMTnOaaMtWY9kFehhKW+5GdlfVcFK0MDJhPlEFrlBI9RueeUR0CAAxzeUNTnjI1SlAv4x8J/BSXaQJFS5djoa80X71UzA6LIWOS2LJJrSDUeSdIHpC0oYZBVHbhEkGqdXYaawbTdgQtlTg6cOz0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpiWsm3Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpiWsm3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742007805; x=1773543805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xN7u2QzVf/7qN9pHbZ+Z0Od5+cfZ69eigsmmau16844=;
  b=mpiWsm3Q+n4KQ8Y2S5MFWqCuEFn2LRizcDi+o3DuqS+Mc/Kk9SfBuOfj
   lcHkKhlhS6VxBryMjR4DZ1Uk9cBhqROu7AuDHraMHH+XQ0fRqTRyw5A4x
   Yerm3e3IbkX3C+5xzi/IraDQZEhsjfAoezrTZeSql5Vs7A70lerVJY64i
   HMwlN9OZSO0F2bAeJuKjIj9iqKMFG9b1Z03Yes5PsmOwRIxfZ1JWkd2HO
   oj8+0c3bkyrizaqhB5bciZDwlGtP/p3NIOZLcI0vMios1lf9Waep/39NG
   RxqLB7ta30Ec7TdiFUbTEieACSrkEI4dkSLEVQhwaWp8HF4lRE1CSvdEo
   A==;
X-CSE-ConnectionGUID: mUAUojd3TtKkzMHV0apcyA==
X-CSE-MsgGUID: wKOYmzbxR1+vf3tCgw1Mtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43080666"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43080666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 20:03:24 -0700
X-CSE-ConnectionGUID: MKqmp/VSQuCG6peJICDhkw==
X-CSE-MsgGUID: BjV9FObHQ7quM8KENhlHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="144643649"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2025 20:03:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttHny-000B1T-0k;
	Sat, 15 Mar 2025 03:03:19 +0000
Date: Sat, 15 Mar 2025 11:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [linux-next:master 8170/11207] drivers/media/i2c/lt6911uxe.c:446:21:
 error: 'v4l2_subdev_s_stream_helper' undeclared here (not in a function);
 did you mean 'v4l2_subdev_is_streaming'?
Message-ID: <202503151002.HacBN2LO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: e49563c3be09d4639ccff8ca68ef63b6f6c8456d [8170/11207] media: i2c: add lt6911uxe hdmi bridge driver
config: arm64-randconfig-r112-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151002.HacBN2LO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250315/202503151002.HacBN2LO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151002.HacBN2LO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/i2c/lt6911uxe.c:446:21: error: 'v4l2_subdev_s_stream_helper' undeclared here (not in a function); did you mean 'v4l2_subdev_is_streaming'?
     446 |         .s_stream = v4l2_subdev_s_stream_helper,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     v4l2_subdev_is_streaming
>> drivers/media/i2c/lt6911uxe.c:456:20: error: 'v4l2_subdev_get_fmt' undeclared here (not in a function); did you mean 'v4l2_subdev_notify'?
     456 |         .get_fmt = v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
         |                    v4l2_subdev_notify
>> drivers/media/i2c/lt6911uxe.c:460:31: error: 'v4l2_subdev_get_frame_interval' undeclared here (not in a function); did you mean 'v4l2_subdev_frame_interval'?
     460 |         .get_frame_interval = v4l2_subdev_get_frame_interval,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               v4l2_subdev_frame_interval
>> drivers/media/i2c/lt6911uxe.c:703:1: warning: data definition has no type or storage class
     703 | module_i2c_driver(lt6911uxe_i2c_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911uxe.c:703:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
>> drivers/media/i2c/lt6911uxe.c:703:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/media/i2c/lt6911uxe.c:694:26: warning: 'lt6911uxe_i2c_driver' defined but not used [-Wunused-variable]
     694 | static struct i2c_driver lt6911uxe_i2c_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~~


vim +446 drivers/media/i2c/lt6911uxe.c

   444	
   445	static const struct v4l2_subdev_video_ops lt6911uxe_video_ops = {
 > 446		.s_stream = v4l2_subdev_s_stream_helper,
   447	};
   448	
   449	/*
   450	 * lt6911uxe provides editable EDID for customers, but only can be edited like
   451	 * updating flash. Due to this limitation, it is not possible to implement
   452	 * EDID support.
   453	 */
   454	static const struct v4l2_subdev_pad_ops lt6911uxe_pad_ops = {
   455		.set_fmt = lt6911uxe_set_format,
 > 456		.get_fmt = v4l2_subdev_get_fmt,
   457		.enable_streams = lt6911uxe_enable_streams,
   458		.disable_streams = lt6911uxe_disable_streams,
   459		.enum_mbus_code = lt6911uxe_enum_mbus_code,
 > 460		.get_frame_interval = v4l2_subdev_get_frame_interval,
   461		.s_dv_timings = lt6911uxe_s_dv_timings,
   462		.g_dv_timings = lt6911uxe_g_dv_timings,
   463		.query_dv_timings = lt6911uxe_query_dv_timings,
   464		.enum_dv_timings = lt6911uxe_enum_dv_timings,
   465		.dv_timings_cap = lt6911uxe_dv_timings_cap,
   466		.get_mbus_config = lt6911uxe_get_mbus_config,
   467	};
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
