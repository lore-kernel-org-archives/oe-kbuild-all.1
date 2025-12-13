Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38378254841
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592814; cv=none; b=gdr85cy0LXulL1Fa1YS2IX5XVb1nljqDxiVTjm3w51PcjqdH/5f+YlyI4Fq/4sznqhV8lJJcX/w8YaeMPRK85sK3gesWSO8QgLJ3kqQjg9B/LcwHDnpB0vY7KSHGf7NaxcWzIRKQ40R5nBiPO5BJvxYpAmJ1ifPeGDgr9u7mSZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592814; c=relaxed/simple;
	bh=3f6YPJZX5hPR7rIXBpNRq8mkic+PiRrnhf2uVW2+/6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDCF7kcnUe8ltwlnQfJ5yAKFljdAm9X/2iPUAMqS6d0qjKrmrqmIAR0LuM7AzR9DwmLIP+UaGjuQvVqmpesMWbfREoQ7c+99OJIg04nikaJ1L1Xe4SCDcxaG55A4jlgMKmBFKZHCwk5G8Y/jKal332aoqo/TiyzXISZpc1R0OQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lO7JmFEW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lO7JmFEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592812; x=1797128812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3f6YPJZX5hPR7rIXBpNRq8mkic+PiRrnhf2uVW2+/6E=;
  b=lO7JmFEWbr65sinCgjpa+abdsvVGnDd2U8B51ZTRUvcpPGw9Xx4kUu/T
   v9k/Eb+IGAoe08raQPWa8uiaxxr/OkwWvyIjZb64SkL1LOL5u9nUWFwtT
   F1j+2lVu25ZujQdY65nl6wUckcB+tw/SebzaedmiM1wCBlVKxMBm1M6PU
   PS6DlYVom2JX3xoEYv9ZcHSzEiKzg3ZZ4N+AXtnvbz7+tO/13dSlI3oUv
   GTQKmaEDKBcZDalG6T0cyeFETytcCSvaMaeTFnMIDFr5hOXyBHTwb5SCq
   R9Tnp8WTVietzUjHz2zrDw9WksRL4Y/068NN4r8n+tamoFEjrzKpuXqTW
   Q==;
X-CSE-ConnectionGUID: zgCbXIN/Q1i9LQiTyZov5Q==
X-CSE-MsgGUID: zP5NahloR/+zl7jN8fkkLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71224357"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71224357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:26:52 -0800
X-CSE-ConnectionGUID: jZashz7GS7+bNQJIOiRojA==
X-CSE-MsgGUID: MfsDmFQSTiuHZupVwZ1JGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202161481"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 18:26:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFLM-000000006wJ-1z2y;
	Sat, 13 Dec 2025 02:26:48 +0000
Date: Sat, 13 Dec 2025 10:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:134:6: warning: variable
 'value_back' set but not used
Message-ID: <202512131040.ErvjOWkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 996e18349e58a3ace519f9c0f32f4e62fc46ec2c [3541/3541] Add support Zhaoxin GPIO pinctrl
config: x86_64-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131040.ErvjOWkV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131040.ErvjOWkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131040.ErvjOWkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:134:6: warning: variable 'value_back' set but not used [-Wunused-but-set-variable]
     134 |         u16 value_back = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:257:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     257 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:277:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     277 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:337:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     337 |         int base_offset = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:340:6: warning: variable 'value_read' set but not used [-Wunused-but-set-variable]
     340 |         u16 value_read;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:371:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     371 |         int base_offset = 0;
         |             ^
   6 warnings generated.


vim +/value_back +134 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c

   128	
   129	static void zhaoxin_gpio_set_gpio_mode_and_pull(struct zhaoxin_pinctrl *pctrl, unsigned int pin,
   130			bool isup)
   131	{
   132		u16 tmp = 0;
   133		u16 value;
 > 134		u16 value_back = 0;
   135	
   136		if (isup)
   137			tmp = ZHAOXIN_PULL_UP_10K|1;
   138		else
   139			tmp = ZHAOXIN_PULL_DOWN|1;
   140		value = zx_pad_read16(pctrl, pin);
   141	
   142		//for gpio
   143		if (pin <= 0x32 && pin >= 0x29) {
   144			if (isup) {
   145				value &= (~(ZHAOXIN_PULL_DOWN));
   146				value |= tmp;
   147			} else {
   148				value &= (~(ZHAOXIN_PULL_UP));
   149				value |= tmp;
   150			}
   151			value &= ~(0x1);
   152			zx_pad_write16(pctrl, pin, value);
   153			value_back = zx_pad_read16(pctrl, pin);
   154		} else {// for pgpio
   155			if (isup) {
   156				value &= (~(ZHAOXIN_PULL_DOWN));
   157				value |= tmp;
   158			} else {
   159				value &= (~(ZHAOXIN_PULL_UP));
   160				value |= tmp;
   161			}
   162			value |= 0x1;
   163			zx_pad_write16(pctrl, pin, value);
   164			value_back = zx_pad_read16(pctrl, pin);
   165		}
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
