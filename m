Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CC4366
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 00:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738800423; cv=none; b=rDD1PE9OYlj1Vf1LD5wKlcQXSfTFza4/9GS+JNXdMXFGh9dRr08aSqsmarZNwsAlEqu5eO97gEpFq9e2xuLPOAdU185Ejaynh/UMzpGjRA3E/T38TdFk5vrcLgRJm33o9Fao7Y6xf0qo/yajSDF0K/q5Xt9ige0DICjAreEXdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738800423; c=relaxed/simple;
	bh=3AT13HBPnouMMLlNvJ9wILxwZyeSrpl65BZqsutXtFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FT8BQQr88/ZAqp99FHNVBewX7gYGNV17+xllkRgR6ZIkpCX7Sv8TY8M8/oySng+ckO2MLEDB9CdvPTBprUGtXyyuyjwbwmI/xnvvCMux4usRiZO/ZSl7UBON3SAh3wU3gougN8RC9J2nustGHH1fefI4UgRcYOgBboAYXUwDM0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md3MnrsF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md3MnrsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738800421; x=1770336421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3AT13HBPnouMMLlNvJ9wILxwZyeSrpl65BZqsutXtFY=;
  b=md3MnrsFdH38kAin/HmGdF772Se1StPkXY1Mji2/DOO9OS1e4ilN8wfm
   hoKWQvznaMkl4lSASr0KbRUnDVbfpLRiJHfHICZB3hvHVLnwYPOCmx3XB
   lbEg0RWufH9ZTvJ+7wOgpEtFk1d9egyr5d2hdQAIS9mQRMGYdxkYj+kpo
   Zi0x6cXXX3bJgemCs5bk8J+J5hYWzlEU0SAsjmo4sXpoV02UfAnFGUNGp
   NOGcT5RB7/r4jAb5pZ9Fnk1i6LqW41LsOJIARDYAPxsYtINj/3X/Tr/Wp
   HorxVnfnSonU2jDgeKFm4UDXDJi9mZTqqdjxIyDr51MNAWyDtg3ZM1+1X
   Q==;
X-CSE-ConnectionGUID: bUq6rLltTsGyeifRhzIDww==
X-CSE-MsgGUID: oeR81HmAQSa8daBAKUQ8PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43048828"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="43048828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 16:07:00 -0800
X-CSE-ConnectionGUID: QgePSfS8TsOAhf5XKJtadA==
X-CSE-MsgGUID: 2EBFa8r/SOKQ/ihTYRX6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116011340"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 16:07:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfpQ0-000wF7-29;
	Thu, 06 Feb 2025 00:06:56 +0000
Date: Thu, 6 Feb 2025 08:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192] cc1: warning: /drivers/iommu: No
 such file or directory
Message-ID: <202502060830.23wrFh8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 36fc2778b8dbb6d266a4a22c4e70de85a84ac019 [192/192] CHROMIUM: interconnect: mediatek: add emi driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250206/202502060830.23wrFh8I-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060830.23wrFh8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060830.23wrFh8I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: /drivers/iommu: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/misc/mediatek/mtk-interconnect: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/misc/mediatek/qos: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/misc/mediatek/vcp/include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/misc/mediatek/vcp/rv: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
