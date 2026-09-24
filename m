Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74D23BF9F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 01:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211973; cv=none; b=lCSJe5a4k9xnBm08nnOJcY6Dkwe8ePKJmHclcClI6V22VVdeeE2MvHRwLbnaVYc1Q3gXiEO5q2rVt4e+zSgvx8NiIdUVwBlFrVbWqa7fF7NK4Me/V78/NbMvYb/JTZq92hZNzLJvM03vSs3zcpOEVjuzSeoJWBuyUwZFkZTl7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211973; c=relaxed/simple;
	bh=zSibxBD1dfUc48wWDq0/sXzmdxYuZGjQaTCv2bVIm38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VCXgx9Ydpf4+OY89FhqhouMAZ7R8tjOy21SfzuaHDRqJuFI40bn/g8sOrOIyYlxOxb9VglnTGH8klBS/PVLq5txK+MxIQAONPOiwhChcD3cvFlftfGA9iE2bj9X1J9yhHMqScyTK2YnXiv5+BQ/olZcD9KLxnEzLNeWZ5iTDl+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBgbFLBj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBgbFLBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790211971; x=1821747971;
  h=date:from:to:cc:subject:message-id;
  bh=zSibxBD1dfUc48wWDq0/sXzmdxYuZGjQaTCv2bVIm38=;
  b=cBgbFLBjtMWj10v9GjlidkO2nk0YMh5C990MWJHtQjjOPg0nJKcmHCpb
   5Td0zVZnoChgJl+384I2j9W4xtT4sjk5M56EJARgE+P4tt1eRFOiPg06V
   3/2xLYk44MZEn9r0la5zgIBx0nApGoLFgKVBf3ZoSxGvFYR3dsBdU+Vgr
   THvJbEvvfj5TBVdMVo/JaqQvxoIOVj2KFQoJa6KpL3U15mAGTRBIIc7XG
   MAKBQsPhTbgPcTM1KEZJIVRzbffpI7dknFpYh8PA0Ao5byvW9ZZqhn5f7
   yxypTOYdymGoAzz2BsaWOMD7j/wAxP41JMCvzlGZ3Kn5s1dSMJGAbnJHP
   w==;
X-CSE-ConnectionGUID: Q9SeRaenQ7aA0d19ztNcCA==
X-CSE-MsgGUID: nAEFzq52RQatq9cpO5p6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94784357"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94784357"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:06:11 -0700
X-CSE-ConnectionGUID: PyI/u+JqTyah+u6LMvPnVg==
X-CSE-MsgGUID: ZnsRU2IOQguKKCj5yRCYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4971511"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 18:06:09 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9XuY-00000000I30-1XSM;
	Thu, 24 Sep 2026 01:06:06 +0000
Date: Thu, 24 Sep 2026 09:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mehmet Fide <mehmet.fide@screeningeagle.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 7345/8910]
 include/linux/pinctrl/consumer.h:110:17: error: 'ENOTSUPP' undeclared; did
 you mean 'EOPNOTSUPP'?
Message-ID: <202609240855.U59akHDO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: b44aec87658e5d1882503ad1208ebf0b052f0ac0 [7345/8910] pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
config: csky-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240855.U59akHDO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240855.U59akHDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240855.U59akHDO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:8:
   include/linux/pinctrl/consumer.h: In function 'pinctrl_gpio_get_config':
>> include/linux/pinctrl/consumer.h:110:17: error: 'ENOTSUPP' undeclared (first use in this function); did you mean 'EOPNOTSUPP'?
     110 |         return -ENOTSUPP;
         |                 ^~~~~~~~
         |                 EOPNOTSUPP
   include/linux/pinctrl/consumer.h:110:17: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/pinctrl/consumer.h: In function 'pinctrl_gpio_set_config':
   include/linux/pinctrl/consumer.h:117:17: error: 'ENOTSUPP' undeclared (first use in this function); did you mean 'EOPNOTSUPP'?
     117 |         return -ENOTSUPP;
         |                 ^~~~~~~~
         |                 EOPNOTSUPP


vim +110 include/linux/pinctrl/consumer.h

   105	
   106	static inline int
   107	pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
   108				unsigned long *config)
   109	{
 > 110		return -ENOTSUPP;
   111	}
   112	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
