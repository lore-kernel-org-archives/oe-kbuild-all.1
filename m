Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AE40862
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727679538; cv=none; b=uL1xoTjUeIXjEWjSuBMhANv7Tw+CrEuHpVXCRnhUIJ4kH+T/akaSWZZ5HlI5dgxCOfpOxiI3L1pGokEPmimFqlJPpHxkqxzHjB1SEYl2wYVlBSMLXeGalSWzwHG3WphZoiB7EYUxyvfORUGzOWXisSEUGGbg7n9Z1j/ZCDDVeC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727679538; c=relaxed/simple;
	bh=UaoFOZFASWUOXp1Vd2qu4ebtxBV7SARyabkh4kgIQkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3+bjDNBjq99lBrZg3d96UcLfEN8p0MSeuUdpJxxlhObl4hhxhoXEaSXihPH5iEaNUV6O8fPcMBYUxk5cXsra6weSeTHolMyVu1SRnudcmzQdMRyh3aQB3bHnwz7CfaZniwjxLvu2BMGWINyEPBWHfz4s6OUOi8Nm9C4+JrzK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoM6jN1w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoM6jN1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727679537; x=1759215537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UaoFOZFASWUOXp1Vd2qu4ebtxBV7SARyabkh4kgIQkg=;
  b=IoM6jN1w6IJDefTKJ/+MNNtoGisbp0ePnwH3blv7P7h3zhCnBEfFJPSD
   zN18HclvdNJXOpYFdwdeJ1Cx72C6Zt0hOnuk14D9rq24EAl6aivCUNm2M
   U+nbhiHwBKWJoQv5ljt2MhPL09P6yhLnO5YLcku30noIieUZbU9WgZGDO
   a0QbxyYIuFQXmjIT8c8I+Fj1oZDUoYq/Q4wzoUtiJdu3IP64s/tVB0wwL
   SjW4dFYTvYSnShUhd+WAzmmLZpi2sEOTsdunkrP09/soA2JIK9E/C3T4E
   SGhzON8GiICCsEo2IxS6NxtMA3Vnny16ZElfQJO1nD207NI6L9IkUDiV7
   w==;
X-CSE-ConnectionGUID: Vidy3h1TSRqPkV9j4IsKUA==
X-CSE-MsgGUID: bBcjb0zDTGKc5QHRp7OPGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26631004"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26631004"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 23:58:56 -0700
X-CSE-ConnectionGUID: TIm5aCsRTzKCufBwKcK+Zw==
X-CSE-MsgGUID: IcWniVHRSM6z9AwK7nELhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="78020116"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2024 23:58:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svAMu-000P9T-1w;
	Mon, 30 Sep 2024 06:58:52 +0000
Date: Mon, 30 Sep 2024 14:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rebase 139/439] ERROR: modpost:
 "rz_mtu3_shared_reg_update_bit" [drivers/counter/rz-mtu3-cnt.ko] undefined!
Message-ID: <202409301454.i4ILmlRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
head:   f8d1ff00b72f9b6d102d07fa33d364e7da2af7b6
commit: e544d5fcd49b65933f663d0bea057b975c884171 [139/439] mfd: rz-mtu3: Link time dependencies
config: x86_64-buildonly-randconfig-006-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301454.i4ILmlRq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301454.i4ILmlRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301454.i4ILmlRq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/hwmon/smsc47m1.o: section mismatch in reference: smsc47m1_driver (section: .data) -> smsc47m1_remove (section: .exit.text)
>> ERROR: modpost: "rz_mtu3_shared_reg_update_bit" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_shared_reg_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_8bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_16bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_32bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_16bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_32bit_ch_read" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_8bit_ch_write" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_is_enabled" [drivers/counter/rz-mtu3-cnt.ko] undefined!
ERROR: modpost: "rz_mtu3_enable" [drivers/counter/rz-mtu3-cnt.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
