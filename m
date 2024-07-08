Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EDE146D74
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720466660; cv=none; b=Whmp0TixntMMGp1L6hNEgYhBrdl3QOi0Z4NPyPsSUkLzAeC80kJPi59anW+GfFjn14WEUJEA+EEX3k4F798Ih8PiKq5pwBZ8QVeZaOC+dizr8jTSb545D/eCVyqzb0ztabs65R2VmnMNPyH4O7c1ly3mPwB5f0gyzXrNZsz5IKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720466660; c=relaxed/simple;
	bh=FrXI15WCZBvAtK8nAp5+t8FhVSaVEK0hsP9nc3WoRyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSUELGzDfKS4iUoUp0vHQlMVYqrF5E0Dbeb8uhWnMXRzJz5ASOmhsgS1Rd0jeZTCa52NAxQxTiEKs/vBEqimF/wpFL1cghnidHuuk8H7G4u8JvW4eQ0KxuqsBZELxWHsTqNNJuGy8RflXlI8jgKW5oRQeAyGnsl3sEu6kdEn7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbvL5AT1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbvL5AT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720466659; x=1752002659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrXI15WCZBvAtK8nAp5+t8FhVSaVEK0hsP9nc3WoRyg=;
  b=bbvL5AT17Hq4FFTi6UcTAix92Xq2PICxOOO+cbVOQTyajPOfNHAXNja5
   +nZEXjj66j9xg16EqVqS860HVtTC1hOi/u22yLioj4AZr3rNPEUlu1yos
   ebEp+/gxqbGfpioHK+K84HpE6Jsa7xcyqs1b+gbqLk747QQo3p5cwD3OX
   ebtElmE2sXg3tCrLQFuejbTJ9Q3NIZ8uhz1AaecGxHy9tT02ntjFyAWk2
   6whZ6eMs6foG4PdRMmVWyjkdurJOuL2DWSVbnO7SBfuCgNSsmYyR7Q/2O
   TpXiHKIthV6PTRmS8CIR4qUPX0gPsqXX4A66GtepU7DU9bBYcZ6BaUG01
   Q==;
X-CSE-ConnectionGUID: rvlfep7LRLWLA+lohngNrw==
X-CSE-MsgGUID: o/2kh2DqSISyUGh2/g+W1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35127285"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="35127285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 12:24:18 -0700
X-CSE-ConnectionGUID: H2/ioc+4S/Wxrb0j2JriEQ==
X-CSE-MsgGUID: lozdbj19QqW2ZfGs7g0v9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="85144230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2024 12:24:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQtyA-000Vz6-0k;
	Mon, 08 Jul 2024 19:24:14 +0000
Date: Tue, 9 Jul 2024 03:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 5/10] irq-renesas-rzg2l.c:undefined reference
 to `of_irq_parse_one'
Message-ID: <202407090332.YxOi85AT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   f0f7ffc6e56c3059be073f733b1c2f515b3eb287
commit: a11ef735cee6734659b9469062ffc2378981c921 [5/10] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240709/202407090332.YxOi85AT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090332.YxOi85AT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090332.YxOi85AT-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o:(.data+0x0): undefined reference to `platform_irqchip_probe'
   sparc64-linux-ld: drivers/irqchip/irq-renesas-rzg2l.o: in function `rzg2l_irqc_common_init':
>> irq-renesas-rzg2l.c:(.text.unlikely+0x108): undefined reference to `of_irq_parse_one'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
