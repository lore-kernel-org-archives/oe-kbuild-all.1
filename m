Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA92BE033
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505595; cv=none; b=MDSDZS4T9xgiCTDKYIywZNgyMu8zAddQ5nKiU+Ork8OCTB0Q9VJ1LcCNzgmkwTKGvvOmw+6CtU0sUfsR271lKAegFfa4XL7T6oNR8uUvctQnH7LcbgT6ng13wf8zpSS30ahfEwQh8A0ARLTPrnML2Wf1c1h3nLE7ls0Qy1EKTBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505595; c=relaxed/simple;
	bh=k0Rp9WoJJ7VDS+zyCONiYvqoxqGOtRveMuWaDX7azBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=joyJF5MZ0nPuOJ2Q4MPzQzNst2J/W12BC+6qxyXKWzzdX+fo6eLth88ggzMrFbK/pU3hUbHS/CJdXFKfaKkS7kQhVjg5qpBwqZOFd/swofDdVn1eVJn5RNG3/d5a+FwLaPqgdorT0nu1Bl6IAdCeY52J+xtglVo3drVlcdYL7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEQ6dWOG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEQ6dWOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785505593; x=1817041593;
  h=date:from:to:cc:subject:message-id;
  bh=k0Rp9WoJJ7VDS+zyCONiYvqoxqGOtRveMuWaDX7azBw=;
  b=cEQ6dWOGkaPLA+/X6zZAJ113pklVcXYqSl+4Bshe/xFyFZpAlRBCHb4x
   CxI2i3s+IGfrwy7SpYZ+0ozcN3feYhbd1FFnPfylm6vTj83B3ws5jpzUo
   TTXgXnGC3X3Lc5i44u4ueOCW7Ya9P7m1OQWMoUv+7WS4RBK4Um1MDZ0Li
   5wIJUuXhVVrjy9MQ3YsR8EVkMt0n5eldginTFE3WClJVvpEIMtrDra3rz
   eq7WYNMdnMOgJI91GURrpeQF7fYIYTqbv3gWX1yllNq2fQ1GpUJJy8PRX
   NgLfbGa9OGqfzresu1yt7ByriGZPnAacH5IJcegW5gdpHwHRlrwTnZ012
   g==;
X-CSE-ConnectionGUID: 7nGZ3v75QZmM7xXHXDI7+A==
X-CSE-MsgGUID: oPtzdnc/Rz2GcJDEo9ncmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="108924916"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="108924916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 06:46:32 -0700
X-CSE-ConnectionGUID: xy3FOWvYQDWKcZxhEWeSrg==
X-CSE-MsgGUID: cuYwKX/oQX+fG15gHkutTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298787387"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2026 06:46:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpnZF-0000000012n-0jNT;
	Fri, 31 Jul 2026 13:46:29 +0000
Date: Fri, 31 Jul 2026 21:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 123/700]
 drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h:408:20: warning: 'ssd210_info'
 defined but not used
Message-ID: <202607312141.XgeX6Tkj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 1da83ee3f578f365c0db6f0114717ad4c13bf841 [123/700] pinctrl: mstar: ssd210 pinctrl
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607312141.XgeX6Tkj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312141.XgeX6Tkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312141.XgeX6Tkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/mstar/pinctrl-ssd210.c:19:
   drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h:112:9: error: 'GROUPNAME_PWM1_MODE6' undeclared here (not in a function); did you mean 'GROUPNAME_PWM1_MODE1'?
     112 |         GROUPNAME_PWM1_MODE6,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         GROUPNAME_PWM1_MODE1
   drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h:198:9: error: 'GROUPNAME_PWM3_MODE6' undeclared here (not in a function); did you mean 'GROUPNAME_PWM3_MODE4'?
     198 |         GROUPNAME_PWM3_MODE6,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         GROUPNAME_PWM3_MODE4
   drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h:334:9: error: 'GROUPNAME_I2C1_MODE2' undeclared here (not in a function); did you mean 'GROUPNAME_I2C0_MODE2'?
     334 |         GROUPNAME_I2C1_MODE2,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         GROUPNAME_I2C0_MODE2
   drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h:337:9: error: 'GROUPNAME_I2C1_MODE7' undeclared here (not in a function); did you mean 'GROUPNAME_I2C1_MODE4'?
     337 |         GROUPNAME_I2C1_MODE7,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         GROUPNAME_I2C1_MODE4
   In file included from drivers/pinctrl/mstar/pinctrl-ssd210.c:17:
>> drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h:408:20: warning: 'ssd210_info' defined but not used [-Wunused-const-variable=]
     408 | MSTAR_PINCTRL_INFO(ssd210);
         |                    ^~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.h:401:75: note: in definition of macro 'MSTAR_PINCTRL_INFO'
     401 | #define MSTAR_PINCTRL_INFO(_chip) static const struct msc313_pinctrl_info _chip##_info = { \
         |                                                                           ^~~~~


vim +/ssd210_info +408 drivers/pinctrl/mstar/pinctrl-ssd210-ssd210.h

   407	
 > 408	MSTAR_PINCTRL_INFO(ssd210);
   409	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
