Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0543AE702
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770291787; cv=none; b=GCocZj3h7c1zAWO+Tc7WbLHIT3UTClbezsh/RZSWxGyZXCO8ddzHgIZ6eY4dJHx8Ra96laUhaQ6oy6h7F7mOtSTBiO0aXAGYddXru40rTO3saX2uwxPepSeejkOkGBQdWHZHjphuuJR3rqt3U7q6xX3qyHqh9UudWl8ABlRtGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770291787; c=relaxed/simple;
	bh=dyvnEFLL2TB3p/orYqYBF+jZ8F5kSnOuy5qLzAr52c4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Chhc1MutCtbyLQgYCeqGl/gV6AkOlMudil88BUTcsvMlclUSVFbOEIP245nT3xcSyZQkn8bGNN60qwMzuFGQGT1h+zYuYU0L/7GXw8JjQdR36+ZyVcARDilxd5KCr25jlJ8gbnzumdFip9N+edbjwEpY7GDfngTsUf/61XG5P94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JA15FGrb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA15FGrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770291787; x=1801827787;
  h=date:from:to:cc:subject:message-id;
  bh=dyvnEFLL2TB3p/orYqYBF+jZ8F5kSnOuy5qLzAr52c4=;
  b=JA15FGrbEelaNuGC1j08PoPTQ2h0sJiwCta8L8tcxttQPE3lotBhE9pS
   EMsByFgFtIRX8Bj0ZPe+V5xo8VpixtG9zUabJkrCAv9SUPKYaeBUqTYH5
   uv/+6UleixQeOURcX0qZ0+wOtOa/FBPRnxYju+nSNYTGlqSIiDSZmKILQ
   ZSnsMZaykQocijHyhI/fWwDytPOcuRLz4v9m/2nXU9mX6/P8eBICpbrJp
   2DCiRDrV9HiPJIo1BjwZGuU9Q2ye4d4TETW7Anc8uXFi4pEL5Cb963F7F
   rkzBl2ixpOTRJ82JfqW8KkyntJ8MJvAvDx/DSvQgKIoVCfh9YKOqKZfHI
   A==;
X-CSE-ConnectionGUID: 5dckeq26Se2PY218EBZnOA==
X-CSE-MsgGUID: 704vqy0ORH+CCGmU9ev74Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71583732"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71583732"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 03:43:07 -0800
X-CSE-ConnectionGUID: yWM41HA6ROW2Ug0KjVP/Kg==
X-CSE-MsgGUID: VUPXRNvHSYeDV51cK+iEFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="241121248"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2026 03:43:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnxlH-00000000jlY-0Ieh;
	Thu, 05 Feb 2026 11:43:03 +0000
Date: Thu, 05 Feb 2026 19:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/usb/typec/mode_selection.c:261:7: warning: assignment makes pointer
 from integer without a cast
Message-ID: <202602051953.BUpMsZsW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   7fa33ba90b34f99e816cb1719d346f70b5be0627
commit: f49f8d90b43e2a0aa7a011c88529f38c409fbf0b [1/1] ANDROID: usb: typec: Implement mode selection
config: arm-randconfig-004-20260205 (https://download.01.org/0day-ci/archive/20260205/202602051953.BUpMsZsW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602051953.BUpMsZsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051953.BUpMsZsW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/mode_selection.c: In function 'mode_list_clean':
   drivers/usb/typec/mode_selection.c:110:3: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      kfree(ms);
      ^~~~~
      kvfree
   drivers/usb/typec/mode_selection.c: In function 'mode_add_to_list':
   drivers/usb/typec/mode_selection.c:261:9: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
       ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
            ^~~~~~~
            xa_alloc
>> drivers/usb/typec/mode_selection.c:261:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
          ^
   drivers/usb/typec/mode_selection.c: In function 'typec_mode_selection_start':
   drivers/usb/typec/mode_selection.c:292:6: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     sel = kzalloc(sizeof(struct altmode_selection), GFP_KERNEL);
         ^
   cc1: some warnings being treated as errors


vim +261 drivers/usb/typec/mode_selection.c

   250	
   251	static int mode_add_to_list(struct device *dev, void *data)
   252	{
   253		struct list_head *list = (struct list_head *)data;
   254		struct mode_state *ms;
   255	
   256		if (is_typec_altmode(dev)) {
   257			struct typec_altmode *altmode = to_typec_altmode(dev);
   258			const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
   259	
   260			if (pdev && altmode->ops && altmode->ops->activate) {
 > 261				ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
   262				if (!ms)
   263					return -ENOMEM;
   264	
   265				ms->altmode = altmode;
   266				ms->priority = pdev->priority;
   267				INIT_LIST_HEAD(&ms->list);
   268				list_add_tail(&ms->list, list);
   269			}
   270		}
   271	
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
