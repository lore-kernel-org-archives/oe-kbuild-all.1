Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558F1944C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvtEn87/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700338123; x=1731874123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8pSC+uSH0dYmp8GfvebVlsZxSCObqYNZI9X2tzyhhI=;
  b=PvtEn87/CoXgbI+xFOLiO9QOmdBAyt5i9Pzhm4GvbIsf++Kmo4iOvZlj
   nRiYOzuIu4oapGIVL0R+0NTXYqDVU/sENPn9Z6K+Z7zeEubCppDMfKC0a
   U7NnFtvmfqr0oMgM1KvZKbQhhb+e0OvFRe+kxIJj0Ocw9URJByWa/yxx4
   H5sO6TO3l7ZAXo9OI2Z8DkL5E0e6LPN0VV92mTTrAhZIiZ90/uOApFwfR
   ffYSBsIOb6PmehssxkgORLcuzu0Ab43u3CyT3C9YQ3KC/7B5wrzHYUJc7
   NKTFi90fuH1vnDwZcZXdjR6FlG231hkQ0lKg2YQjTYwa2+CmUEYxFEqbR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="13005572"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="13005572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 12:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="7163884"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2023 12:08:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4RcL-0004FT-2H;
	Sat, 18 Nov 2023 20:08:37 +0000
Date: Sun, 19 Nov 2023 04:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Vrabel <david.vrabel@citrix.com>,
	Paul Durrant <paul.durrant@citrix.com>
Subject: drivers/xen/manage.c:337:60: warning: '%s' directive output may be
 truncated writing up to 95 bytes into a region of size 12
Message-ID: <202311190459.zOWcFodz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05aa69b096a089dc85391e36ccdce76961694e22
commit: 44b3c7af02ca2701b6b90ee30c9d1d9c3ae07653 xenbus: advertise control feature flags
date:   7 years ago
config: x86_64-randconfig-r031-20230816 (https://download.01.org/0day-ci/archive/20231119/202311190459.zOWcFodz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190459.zOWcFodz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190459.zOWcFodz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/node.h:17,
                    from include/linux/cpu.h:16,
                    from include/linux/stop_machine.h:4,
                    from drivers/xen/manage.c:12:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:440:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     440 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/xen/manage.c: In function 'shutdown_event':
>> drivers/xen/manage.c:337:60: warning: '%s' directive output may be truncated writing up to 95 bytes into a region of size 12 [-Wformat-truncation=]
     337 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                                                            ^~
   In function 'setup_shutdown_watcher',
       inlined from 'shutdown_event' at drivers/xen/manage.c:349:2:
   drivers/xen/manage.c:337:17: note: 'snprintf' output between 9 and 104 bytes into a destination of size 20
     337 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     338 |                          shutdown_handlers[idx].command);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +337 drivers/xen/manage.c

   333	
   334		for (idx = 0; idx < ARRAY_SIZE(shutdown_handlers); idx++) {
   335			if (!shutdown_handlers[idx].flag)
   336				continue;
 > 337			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   338				 shutdown_handlers[idx].command);
   339			xenbus_printf(XBT_NIL, "control", node, "%u", 1);
   340		}
   341	
   342		return 0;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
