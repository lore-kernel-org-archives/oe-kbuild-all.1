Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDCB17C98E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726691450; cv=none; b=S2HQ64jipZLEVyaEtEYa9B9iOehgU/xbQIYFJ3lff9HLLHOx7JWrSWd1PoW3xprnBkFFl8iW73zLXu40ckj473+BXTTq9UYKpkXf14FWt2L5oD0RmHkeVFMSXOrM1N5I6Y0ckVuvtWMxguW59gkcy/R7J6pinmgnjQ8NLMFs/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726691450; c=relaxed/simple;
	bh=Xn46/km7zRGKCkXMQMnAsHr01HTLgJe6+JfdmhQ77QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVJp51p1lGhxzDzaNXNJaW2joInJzbDIT5Bm/LAjwlov0EzCjUro5XO5ZAQVmcQ7JrjL4dlNVvRpZgAtebJ7Gd24mmU3uFLVS8ZPw3caJGCpOdg5o3hKD6oM2eEc8Wqx/PMNntxo2CZvmqy9yccqnNcsS+hRr9CdpM1uOug6SlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUEGgS1p; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUEGgS1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726691449; x=1758227449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xn46/km7zRGKCkXMQMnAsHr01HTLgJe6+JfdmhQ77QU=;
  b=NUEGgS1pSNkQsDQT9s65BGpn3/cnMal1d/JiY3TivdOJ9AJ19VyyWoAy
   pCZcKOuWqOWIy3y5zn0LKseHj7x1pgLEfvPKk+aR0AMmhGLS4OaBxH0pX
   tJc7mbWeDLlcvsJcMW1bmu9wKwsdF50mPxlKUp2yQK+S8+d29c+f18/pm
   flTm0CqAh7JDexkIZcjWudh6a4wvYQArGOuMyLWz+DfGicEOUjQB1e0Iw
   xK6V0dWhz6r8K5hjF89b/e88LBjZt/l5iVwrhoNDFz+u1MLH9lWtaQsfg
   CaH4lFPflr/UCEfZBrYtbIHaWOUkFNslwezk0+A7jU6IzjkF3Hww9U8QH
   g==;
X-CSE-ConnectionGUID: zDewHS/CREu4LgPj5+amFg==
X-CSE-MsgGUID: eGSZe0+DREuOa6e6UCDe3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25719894"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="25719894"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 13:30:49 -0700
X-CSE-ConnectionGUID: qAFibhFQSJamU8VZcCOhmw==
X-CSE-MsgGUID: rpfmRvAsTDegFwFNsh9LUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="100417104"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Sep 2024 13:30:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr1K1-000Cc4-1Z;
	Wed, 18 Sep 2024 20:30:45 +0000
Date: Thu, 19 Sep 2024 04:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/50 7/9] drivers/watchdog/mtk_wdt.c:589:37:
 warning: 'wk_proc_cmd_fops' defined but not used
Message-ID: <202409190450.77YfBhRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/50
head:   b3bf5911a5d9f6eb8112d294ffaf5f474dccc686
commit: 83ffbaceffed1cd47a6f67fb20e39737dfb2d01a [7/9] [wifi] adding wifi-related changes outside driver-directory
config: arm-randconfig-004-20240917 (https://download.01.org/0day-ci/archive/20240919/202409190450.77YfBhRy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190450.77YfBhRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190450.77YfBhRy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/mtk_wdt.c:589:37: warning: 'wk_proc_cmd_fops' defined but not used [-Wunused-const-variable=]
     589 | static const struct file_operations wk_proc_cmd_fops = {
         |                                     ^~~~~~~~~~~~~~~~


vim +/wk_proc_cmd_fops +589 drivers/watchdog/mtk_wdt.c

   588	
 > 589	static const struct file_operations wk_proc_cmd_fops = {
   590		.owner = THIS_MODULE,
   591		.open = wk_proc_cmd_open,
   592		.read = seq_read,
   593		.write = wk_proc_cmd_write,
   594		.llseek = seq_lseek,
   595		.release = single_release,
   596	};
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
