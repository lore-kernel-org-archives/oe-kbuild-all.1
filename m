Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE6BE4A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735759528; cv=none; b=BTF6FKvtHVehwNaJtj1GXmt8CVRM78Of0StNN0HzMnPYjemaGm1AkE/KQS2fXM9qlDlS3sK9W1OyOXKkp62qUK/S6idJJDumaZoGEys3spisBzsT3MUJhLjyz51nHnGri34LujdTeh24seVLuULwM0Uewgl2HJyHLMPKs+fb1mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735759528; c=relaxed/simple;
	bh=QsqSMvJf1SxDeMOYU4R7a3S4u1dVYR+2Mj5YMyaRK0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvkNE7zIcHUfXZ5FueOnmX9fJYM4uD823Yvhh31lEyy1W8gOzuzL+Yft2N4TDGG8Pbiu5P7llG8UUHiljK6FPqvcvQ+cdk+S9j4PoVBABWEdYmHeAkEFI/2M0BcdHne0yjiAwQFS/IyOhiI9Dx+si9SwFxwPBMBOW4oMK9zPPIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7QBb6KY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7QBb6KY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735759526; x=1767295526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QsqSMvJf1SxDeMOYU4R7a3S4u1dVYR+2Mj5YMyaRK0Q=;
  b=g7QBb6KYEpBE290iarLt9iyN1l0rD3bVybzdawAC8Mn5Uiz5lJEQ3DEx
   4+VgxEeWIedTK3E3z4GZv2PNW5D5Wj0m5AdO0HKCTWy/Y5fVvlxaokJSR
   fWz2aZadisa9Cy9kdPF8p6sAhLFBDKzw9BrAmW+6GfdSfwEIRx7aLykFf
   qwdlwxbXKk62T1aGNvAFnRGgCfkbYRXzdXmSKe8xOCZYu6d5X35BZBZk1
   nEK0qj+c7jUQgAiM6OFhk3j0JBGWRPHWezveZgYjWplpC3MGnFKDBQoED
   io4m7GKU8F14K+UL3SY7+hvHVHVtTVTPARRqZpNksWpLoAGkFk72NuE0V
   g==;
X-CSE-ConnectionGUID: WtB77XcERi2Q8xj/Q09XMw==
X-CSE-MsgGUID: 3rQhPvgTRKmT47YYk//vcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36025398"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; 
   d="scan'208";a="36025398"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 11:25:25 -0800
X-CSE-ConnectionGUID: Bwj16/fzTOCAkG/yASlj7Q==
X-CSE-MsgGUID: uJeaeJ3BQymADzloyzaKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101800879"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jan 2025 11:25:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT4LK-000820-0b;
	Wed, 01 Jan 2025 19:25:22 +0000
Date: Thu, 2 Jan 2025 03:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Koch <markus@notsyncing.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: drivers/input/joystick/fsia6b.c:152:57: warning: '/input0' directive
 output may be truncated writing 7 bytes into a region of size between 1 and
 32
Message-ID: <202501020303.1WtxWWTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 5d4b45a1dd7b00feab57624035dcdbc1bab2e0f8 Input: add support for the FlySky FS-iA6B RC receiver
date:   5 years ago
config: x86_64-randconfig-a013-20211029 (https://download.01.org/0day-ci/archive/20250102/202501020303.1WtxWWTu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020303.1WtxWWTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020303.1WtxWWTu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/joystick/fsia6b.c: In function 'fsia6b_serio_connect':
>> drivers/input/joystick/fsia6b.c:152:57: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     152 |         snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
         |                                                         ^~~~~~~
   drivers/input/joystick/fsia6b.c:152:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     152 |         snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +152 drivers/input/joystick/fsia6b.c

   126	
   127	static int fsia6b_serio_connect(struct serio *serio, struct serio_driver *drv)
   128	{
   129		struct fsia6b *fsia6b;
   130		struct input_dev *input_dev;
   131		int err;
   132		int i, j;
   133		int sw_id = 0;
   134	
   135		fsia6b = kzalloc(sizeof(*fsia6b), GFP_KERNEL);
   136		if (!fsia6b)
   137			return -ENOMEM;
   138	
   139		fsia6b->packet.ibuf = 0;
   140		fsia6b->packet.offset = 0;
   141		fsia6b->packet.state = SYNC;
   142	
   143		serio_set_drvdata(serio, fsia6b);
   144	
   145		input_dev = input_allocate_device();
   146		if (!input_dev) {
   147			err = -ENOMEM;
   148			goto fail1;
   149		}
   150		fsia6b->dev = input_dev;
   151	
 > 152		snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
   153	
   154		input_dev->name = DRIVER_DESC;
   155		input_dev->phys = fsia6b->phys;
   156		input_dev->id.bustype = BUS_RS232;
   157		input_dev->id.vendor = SERIO_FSIA6B;
   158		input_dev->id.product = serio->id.id;
   159		input_dev->id.version = 0x0100;
   160		input_dev->dev.parent = &serio->dev;
   161	
   162		for (i = 0; i < IBUS_SERVO_COUNT; i++)
   163			input_set_abs_params(input_dev, fsia6b_axes[i],
   164					     1000, 2000, 2, 2);
   165	
   166		/* Register switch configuration */
   167		for (i = 0; i < IBUS_SERVO_COUNT; i++) {
   168			if (switch_config[i] < '0' || switch_config[i] > '3') {
   169				dev_err(&fsia6b->dev->dev,
   170					"Invalid switch configuration supplied for fsia6b.\n");
   171				err = -EINVAL;
   172				goto fail2;
   173			}
   174	
   175			for (j = '1'; j <= switch_config[i]; j++) {
   176				input_set_capability(input_dev, EV_KEY, BTN_0 + sw_id);
   177				sw_id++;
   178			}
   179		}
   180	
   181		err = serio_open(serio, drv);
   182		if (err)
   183			goto fail2;
   184	
   185		err = input_register_device(fsia6b->dev);
   186		if (err)
   187			goto fail3;
   188	
   189		return 0;
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
