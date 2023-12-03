Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33835179A6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiUI/04l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701633375; x=1733169375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aeqNMSuaPmA7FpnOx2KM9BPxQPupevKwYbUxsDXfbbg=;
  b=jiUI/04lA/EJFsiZn35x5AsaczpIEmL6Ck7/Ts6eEAK7P01HB3sPZ7HT
   RRuEqT2VF/jLgSrDZBK0gO8UubyIqXSdYG39pmrSqxthx/mR9iSP8/Kz7
   CutNAR9ricLjvgnll8W1aQNqdjZPvW/mOpRo4yoxTC+xs+ZAwwBQZKlhH
   2NFj0FfW/We7ObqOPXZ2EAOJovzI6jLFvbOOYxkYFyU48zXYIGNtlrM3y
   dsf9feBqGnh/Nj+0WxP2eBfGRyi2pwzk/xCEiOD+wNGuhAMaiMyBQgCkR
   U9rbNnCJ1Fg1rno3gtBEjDwK32Tjv25tCnMm0ttc1QkkFMOqxJlAg2Zz7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373090509"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373090509"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 11:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746605019"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="746605019"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2023 11:56:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9sZT-00072a-0d;
	Sun, 03 Dec 2023 19:56:07 +0000
Date: Mon, 4 Dec 2023 03:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Vrabel <david.vrabel@citrix.com>,
	Paul Durrant <paul.durrant@citrix.com>
Subject: drivers/xen/manage.c:337:60: warning: '%s' directive output may be
 truncated writing up to 95 bytes into a region of size 12
Message-ID: <202312040309.sACmAKoo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 44b3c7af02ca2701b6b90ee30c9d1d9c3ae07653 xenbus: advertise control feature flags
date:   7 years ago
config: x86_64-randconfig-015-20231009 (https://download.01.org/0day-ci/archive/20231204/202312040309.sACmAKoo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312040309.sACmAKoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312040309.sACmAKoo-lkp@intel.com/

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
