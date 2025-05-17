Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD39915A85E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 19:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509133; cv=none; b=mnbRBVg8t9wq9hhDPoH8QsjKmlJi09g2Vl2OQPtPmeTmPeHZHkei6pQtOCl5JJtrb3FtX4mrt+Bd8PlH9RqiFB20iUjj678hRc3U8miegDD2JwvurYowB0lL0/M43en7z8TKVyiQexeu3vlEBntjPajeCDad6mbcLC5eDX7rwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509133; c=relaxed/simple;
	bh=NTpq7MIF6WKns4Pbh/6owtPXoTlNq/SuW60XnOBEgoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckwp4JEvufDWqESVi1SMF5+cme52AvAh30ZtZCXSDSQMmRFc7MY3wHdNKAGIz6OoqunfjOuaV/ADy6puQqZrzCxmgL91dJ3+2/DRCfXiD85TCW/6FiYM6lHUISqtIU8ox8PDLj43n+86/XOCUBlYySn+FQmtXIa55mmsvxELhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f72ZiCKq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f72ZiCKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747509131; x=1779045131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTpq7MIF6WKns4Pbh/6owtPXoTlNq/SuW60XnOBEgoE=;
  b=f72ZiCKqBKYS1iO8/ZFx37SoyXbvThW4M8hUGc5YL2MXGYMh040RtHSX
   Zm58S2NYIFZ1r9AXgko5tKgtzviYAF4OdONeXBQDvZMWKPH/YCXLOoSRZ
   +uRn07z7Aih97/SP1lejcMiXTyAJyYycRqlLolrNtjT9VWWkJgqg3Vhxv
   VvPf3bdonfSS7JdjPN1p82DzdjYbCslNtpe4NKNF8MapEjQ8iw/amtB4Z
   YP1ZXMagXrwWN1+YE1cwfgOzGKDud+smdrdLZBvmkd+RllfLArfoyk55e
   ixbPgCwmxqOXdcY0jr0YFUaplEcJq2t/6ltBA0rCrTQUvBRoL+swoYE8x
   g==;
X-CSE-ConnectionGUID: IbGDc2gKRISs8XDHu0zBKw==
X-CSE-MsgGUID: jOSwnR3yTMi7wppUkg3DBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="48708831"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="48708831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 12:12:11 -0700
X-CSE-ConnectionGUID: 3nYt0jZrTIOM6cvcHlnEmA==
X-CSE-MsgGUID: DI85sBbFRoqlid1kk/FABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="139879738"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 May 2025 12:12:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGMx5-000KND-0b;
	Sat, 17 May 2025 19:12:07 +0000
Date: Sun, 18 May 2025 03:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 11278/11779] powerpc64-linux-ld:
 drivers/gpio/gpio-mpc8xxx.o:undefined reference to `gpiochip_irq_reqres'
Message-ID: <202505180309.1nosQMkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 7688a54d5b53f2e3160c00f19b00bc601fa3ec98 [11278/11779] gpio: mpc8xxx: Make irq_chip immutable
config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20250518/202505180309.1nosQMkI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180309.1nosQMkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180309.1nosQMkI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: drivers/gpio/gpio-mpc8xxx.o:(.data.rel+0xa8): undefined reference to `gpiochip_irq_reqres'
>> powerpc64-linux-ld: drivers/gpio/gpio-mpc8xxx.o:(.data.rel+0xb0): undefined reference to `gpiochip_irq_relres'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
