Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF3635
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424413; cv=none; b=a84tZRCtujKRkcbNixX0A+zAewY2ZotSDDuWOrVqIueA/Ay2J4i8dTXu1WxfRpSjemOJPEaxrn+DmqrJmxJ4UXY4HpyeScejNYpJJsGWz4L6ds/ajVpUJmFHrxq33Fvt09iqm7+iysnN+AbRdzf3GyP0c53mJJIgVpFqtWU1m/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424413; c=relaxed/simple;
	bh=N7+Tit0TKYpEJm5NWnVhw9St9WnsK2y8w4W1tDwOzas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sW3/NudJl6puF/zS8BGOp1kiEm8/Z4YR1et+JOBnBGX1swrX7haa+/Tyr4de9+HYVYX9F5AJngdShgFreM4/jnI43FgSD8kO4aDDw5USIp1YjsC2XrkHNncKfS9jsLUp7xp6aHGDmMbsvyElzfs1IWAveEOx7T6CFcRYdUdTvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PavYao81; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PavYao81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725424411; x=1756960411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7+Tit0TKYpEJm5NWnVhw9St9WnsK2y8w4W1tDwOzas=;
  b=PavYao81GlAz1if7kWOX0B0PSYCRIOtgWYecP8vKOTfweSN0Z+xN4VYa
   QUmNIAgmbVgoC9JIYMS/5XEK297H4q9J7a1j6SgZVKpLq6B77xPR14bwK
   2dhH9UHfUihI1Ocr6eIt6Ic4YcGPjPAg1ZIwHCipHHnWmlAhZ6/xmZU8c
   AYObDUng59bUFPwzpCe0lXM463KFlvgqNjlidDKqt5dOpDlQsaRlIw+fA
   rZ5SN6kWVtkGicaCRXyA12OFsFq1OI90dUXwgDd82G9Q01qlaSqervmfK
   PzBTxeVfnmZQ7eKQisi62mv6K3gPYA8qg4ew7Fz2abFMGwA7/MufwCXqi
   w==;
X-CSE-ConnectionGUID: 5eepLbggQEmMPVfabxfWXg==
X-CSE-MsgGUID: UX/IRo+8QCmAyxgdOnyjXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23570846"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23570846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 21:31:49 -0700
X-CSE-ConnectionGUID: ktrIdsbqS8CtjZzr5qJnjw==
X-CSE-MsgGUID: EMV9DTSlSeKucy5upaZ7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="64784147"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2024 21:31:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slhgI-0007Xl-0y;
	Wed, 04 Sep 2024 04:31:46 +0000
Date: Wed, 4 Sep 2024 12:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: arm-linux-gnueabi-ld:
 drivers/net/dsa/realtek/rtl8366rb.c:980:undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202409041221.YNEn6wcn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88fac17500f4ea49c7bac136cf1b27e7b9980075
commit: 32d617005475a71ebcc4ec8b2791e8d1481e9a10 net: dsa: realtek: add LED drivers for rtl8366rb
date:   4 months ago
config: arm-randconfig-r062-20240812 (https://download.01.org/0day-ci/archive/20240904/202409041221.YNEn6wcn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041221.YNEn6wcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041221.YNEn6wcn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/dsa/realtek/rtl8366rb.o: in function `rtl8366rb_setup_led':
   drivers/net/dsa/realtek/rtl8366rb.c:953:(.text.unlikely+0x6ac): undefined reference to `led_init_default_state_get'
>> arm-linux-gnueabi-ld: drivers/net/dsa/realtek/rtl8366rb.c:980:(.text.unlikely+0x850): undefined reference to `devm_led_classdev_register_ext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
