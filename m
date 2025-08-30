Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC9211290
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583049; cv=none; b=r/sYITtgfKzzE1wbc6oRyzvrvtIAIlfxqIAVw5MMZxqdBg5LQ87IQPdeaDy4yunSvWmEfwNuMuICUPHJjHA9NfAERNI9ZfJ0Ad/MjCvGV4B9ZPYofBI8ikia7kRPckfxnZgduWqI1z0qujJjG6eA26pBTC+rUDl3LXfubcKb4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583049; c=relaxed/simple;
	bh=hfeHD711+piUZ3254K2YUFI0gkNk950h1YCbkga9thA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EAWme1mdjTkdHBAsPH5DODxaX/U5hAo3Vbbf/OCNdkHKeJ+0tiJ6DbVU35GiCvMvTRd/9wo0HkZswXYylNHFc0os3NhMfgv+CNEmE02WNX+DEKpgngAQHpTnnby/Lk5tszKmiw+4gIS4M8TzKZwzM2WlOADW3jx1VztpuboT9Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgW6KZYl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgW6KZYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756583047; x=1788119047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hfeHD711+piUZ3254K2YUFI0gkNk950h1YCbkga9thA=;
  b=TgW6KZYlwXDVYlBsUh7k5mjwBVPtJzkrdcHaTFA+0O08EAYfbg+hQZ+c
   6n6fdvMXLilsg6bunXDny2p9ZV7BYMrUhcymhdHX3xVTUju/FaE/OnqpX
   glX11xI6RM2+zGtL6iwbgTUVkOjoYnrU6JnKISvjkr5sIywhxUlp0oqx9
   8rkth6duTaW1b14DnpCbQN//fCZyWtykZNnvnqnLuoH4gNCIECS4dt/E3
   iLm0qcQaeKuZXANlKNcN6ZG+zXGzXQECdQ5UI07OgurXZe1exLspGo+Aj
   Fn+9ItqVZz9kj8L2+ZQ3yyyiQWFY3v/1XO0tpH0UiilfvchJ+j5nLY6bm
   w==;
X-CSE-ConnectionGUID: gPjWB0eFQ++Ge8Tv4ln/ug==
X-CSE-MsgGUID: Lb8Fa8QBTVum4ENyIg0aNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58984880"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58984880"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 12:44:07 -0700
X-CSE-ConnectionGUID: 0sp7KuPJS4iIp6en1eS7BQ==
X-CSE-MsgGUID: 81yxIGExRSOCLAP68hIbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171428758"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2025 12:44:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usRTh-000Ve5-18;
	Sat, 30 Aug 2025 19:43:32 +0000
Date: Sun, 31 Aug 2025 03:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for LEDS_GPIO when selected by PCENGINES_APU2
Message-ID: <202508310324.QAvdAZ09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: i386-kismet-CONFIG_LEDS_GPIO-CONFIG_PCENGINES_APU2-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310324.QAvdAZ09-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310324.QAvdAZ09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310324.QAvdAZ09-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_GPIO when selected by PCENGINES_APU2
   WARNING: unmet direct dependencies detected for SND_CTL_LED
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_GPIO
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
     Selected by [y]:
     - PCENGINES_APU2 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=y] && LEDS_CLASS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
