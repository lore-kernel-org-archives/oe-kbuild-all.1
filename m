Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCBB63CB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772850513; cv=none; b=urXVF5oQKe6fIg1mLbXzVxIlibEefWOniooj44inOc053M1tGexKhsJfQ/hCPYPRPt/H43SO8Tv9iMWIvgvQfMjxRQwa+Foh4KA7ybrYcFLLxlkGls1CZwbiH4vM5qCXGIjhmRFvYzuyPZi9uDUS+ryoZc09C9Var4H4mj2MaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772850513; c=relaxed/simple;
	bh=/nZ3hnsv5eZjklpEBQE5S30frgcH2k8r45rHhf1lhbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IGQLlBTPVj7Z4IQX/oJ3vBYFk9niHA3Wezs70lJaEaWsYQxljkzLPoCRyqLXg1w9Xzi1m1Nf/OwO4oH5c7EiSekySMypZFngOGcRQu2/dIi5Su3udx8hVyHBs5YSHWupRzgqGnBG+5WV4/ZOmgL/qz8AAO9TnxzLMc1oY96ZQQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKIFPwS2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKIFPwS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772850511; x=1804386511;
  h=date:from:to:cc:subject:message-id;
  bh=/nZ3hnsv5eZjklpEBQE5S30frgcH2k8r45rHhf1lhbU=;
  b=BKIFPwS2/xpRCsvTG7tS5P3aMBiXOPhCl4IBb4H52KK8ZD0oV/8xCy3o
   9Kd/m260exIzd8ereGVHT2XQAxN9oivfsX5LBJqWGpR2dXUy0d/Gmz2EU
   sHGrXCqS8PjMfEAhytFcwyOEJWDnK5wnhCFHQ82eM8DQt9MjAhHur4n6E
   JYhVooAsASeJjPugZ6ch3XYDm/TFLE/ee1HWy1HrkQbRorrhfhpXuBeg4
   9hxWPoXwJ87IRNxV1DFGcIffb1GFc5r1GULZfwF68a0geD1GC95oLtmNq
   KlncBegoJvtvJfCb00TphDhegsERU37FFB2QFiNA5/Lsr5OcUSGZbucbk
   Q==;
X-CSE-ConnectionGUID: 9IEFVFZaT9yWPMrJg2518g==
X-CSE-MsgGUID: yd+CkSEAT0WVPeCtoi/u/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77840401"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77840401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 18:28:30 -0800
X-CSE-ConnectionGUID: 5LMdCvTjTEmJXYlr/7sbnw==
X-CSE-MsgGUID: uEhywl2gQemdIIzQmeCKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="219166544"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2026 18:28:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyhP0-000000001bF-1AA4;
	Sat, 07 Mar 2026 02:28:26 +0000
Date: Sat, 07 Mar 2026 10:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [acrn:6.17/linux 268/3134]
 drivers/media/i2c/max9x/serdes.h:132:35: warning: 'max9x_regmap_config'
 defined but not used
Message-ID: <202603071049.sXFE7RTY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   d2ae39d099178698dc32d2165a32f4d6d13d107b
commit: 1f44f78a75b6651770fcfbaca9b3e8f3f8b781bc [268/3134] IPU7: media: pci: Add platform data config.
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603071049.sXFE7RTY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071049.sXFE7RTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071049.sXFE7RTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/max9x/max9296.h:25,
                    from drivers/media/i2c/max9x/max9296.c:31:
>> drivers/media/i2c/max9x/serdes.h:132:35: warning: 'max9x_regmap_config' defined but not used [-Wunused-const-variable=]
     132 | static const struct regmap_config max9x_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~
--
>> drivers/media/i2c/max9x/max96717.c:35:35: warning: 'max96717_regmap_config' defined but not used [-Wunused-const-variable=]
      35 | static const struct regmap_config max96717_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/max9x/max96717.h:25,
                    from drivers/media/i2c/max9x/max96717.c:33:
>> drivers/media/i2c/max9x/serdes.h:132:35: warning: 'max9x_regmap_config' defined but not used [-Wunused-const-variable=]
     132 | static const struct regmap_config max9x_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~


vim +/max9x_regmap_config +132 drivers/media/i2c/max9x/serdes.h

f4927c135b40fc Hao Yao 2025-09-30  131  
f4927c135b40fc Hao Yao 2025-09-30 @132  static const struct regmap_config max9x_regmap_config = {
f4927c135b40fc Hao Yao 2025-09-30  133  	.reg_bits = 16,
f4927c135b40fc Hao Yao 2025-09-30  134  	.val_bits = 8,
f4927c135b40fc Hao Yao 2025-09-30  135  };
f4927c135b40fc Hao Yao 2025-09-30  136  

:::::: The code at line 132 was first introduced by commit
:::::: f4927c135b40fcf235caf994b82a1444ca1fcca2 media: ipu7: IPU7 driver release for PTL Beta v6.17 iot

:::::: TO: Hao Yao <hao.yao@intel.com>
:::::: CC: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
