Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472BB63D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 19:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682535980; x=1714071980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wMmKhJsPnfod6X2Q9sWRQBQ+EFhpPQLi99UFxdS5mY=;
  b=d5A//46XrRb4HpQN3x/5Rmc0++llquvVOKOcYJk9KsgdzPs3pGyXE6Vn
   I2WjJOEO17ZdtS/KLD9flSZqmwJQnsDHqBeQ6Qq6/Ft2029LEBCK12Kh4
   wsAlO3WykdaMqFNivRN4s6UpgHU7IjDEy2xliAMC9kz3mPzNCIZ6wXoDD
   3VbUXnIsgEy+YL9lZdwuTUtOpHlDoRNKRCbqOJ3WHvJvUW0KwqLhEj1+N
   s+rH5PbL+9zRgN9wDOxx8TOrr9fwrND8D2pRnJ3YzVbxY5LutFsPbXgTx
   833h0jdzsmfBKIZPii/XQmMyJ1gFJ5Rq1XiZkvz8ZawNzr50orI6eVGM7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433498974"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="433498974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 12:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="726682189"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="726682189"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2023 12:05:51 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prkSc-0000TA-1Y;
	Wed, 26 Apr 2023 19:05:50 +0000
Date: Thu, 27 Apr 2023 03:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ruchi Kandoi <kandoiruchi@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [jsarha:topic/cros-sof-v4.19 130/6555]
 kernel/power/wakeup_reason.c:108:12: warning: no previous prototype for
 'wakeup_reason_init'
Message-ID: <202304270335.moYXZd7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ruchi,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: d99dfffb06d060dcfbd86f5cf0360cfe7de67023 [130/6555] ANDROID: power: wakeup_reason: add an API to log wakeup reasons
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230427/202304270335.moYXZd7h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/d99dfffb06d060dcfbd86f5cf0360cfe7de67023
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout d99dfffb06d060dcfbd86f5cf0360cfe7de67023
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270335.moYXZd7h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/wakeup_reason.c:108:12: warning: no previous prototype for 'wakeup_reason_init' [-Wmissing-prototypes]
     108 | int __init wakeup_reason_init(void)
         |            ^~~~~~~~~~~~~~~~~~


vim +/wakeup_reason_init +108 kernel/power/wakeup_reason.c

   104	
   105	/* Initializes the sysfs parameter
   106	 * registers the pm_event notifier
   107	 */
 > 108	int __init wakeup_reason_init(void)
   109	{
   110		int retval;
   111		spin_lock_init(&resume_reason_lock);
   112		retval = register_pm_notifier(&wakeup_reason_pm_notifier_block);
   113		if (retval)
   114			printk(KERN_WARNING "[%s] failed to register PM notifier %d\n",
   115					__func__, retval);
   116	
   117		wakeup_reason = kobject_create_and_add("wakeup_reasons", kernel_kobj);
   118		if (!wakeup_reason) {
   119			printk(KERN_WARNING "[%s] failed to create a sysfs kobject\n",
   120					__func__);
   121			return 1;
   122		}
   123		retval = sysfs_create_group(wakeup_reason, &attr_group);
   124		if (retval) {
   125			kobject_put(wakeup_reason);
   126			printk(KERN_WARNING "[%s] failed to create a sysfs group %d\n",
   127					__func__, retval);
   128		}
   129		return 0;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
