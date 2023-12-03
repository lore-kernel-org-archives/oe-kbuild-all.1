Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08057A3B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9dC+QMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585180; x=1733121180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4OAkahF0bBJzKDBPfgxrcW/iCyBN5+YRtt0Z5Yo1vxE=;
  b=m9dC+QMnb6fzSu2nXY3IWjFraoPaFlAyB2Nh7GT5F9D5YwGC0sKkxrjb
   UYfW37yH+6C924FubZ2PUnzyeTKIocY8+pmfgMsvJPvghujh3hwq2Gqbe
   lM2tTkv9yQgSWPNiMqLzxbMHpTI1JEgtDHrxXDmpt55pjkNEEa3snUlG2
   gdeKChdLefz8Fb05+UGiIoO3Zx+7fUtgeL0QqMuy3NUidIBMPgr9fiy4g
   YaMRo180tKgqo5g7ACyDn3Fe/qm0o8d2B0mvc1m/3u/9TkCmMdcLUtJYc
   eK45PaMkgEM/JK505PAVjUQFYQA+on4n4Qc+q3Ce7iXikJWOVwXIORe0c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180436"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081654"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081654"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006MH-3C;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Kurtz <djkurtz@chromium.org>
Subject: drivers/base/power/domain_governor.c:236: warning: cannot understand
 function prototype: 'struct dev_power_governor pm_domain_always_on_gov = '
Message-ID: <202312030241.E2FA2zJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: c84e358718a66f76ac0de1681d15d8d0c68fcdab soc: Mediatek: Add SCPSYS power domain driver
date:   8 years ago
config: x86_64-buildonly-randconfig-006-20230906 (https://download.01.org/0day-ci/archive/20231203/202312030241.E2FA2zJY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312030241.E2FA2zJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312030241.E2FA2zJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/pm_domain.h:12,
                    from drivers/base/power/domain_governor.c:10:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:424:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     424 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
>> drivers/base/power/domain_governor.c:236: warning: cannot understand function prototype: 'struct dev_power_governor pm_domain_always_on_gov = '


vim +236 drivers/base/power/domain_governor.c

e59a8db8d9b7c0 Rafael J. Wysocki 2012-01-14  232  
925b44a273aa8c Mark Brown        2011-12-08  233  /**
925b44a273aa8c Mark Brown        2011-12-08  234   * pm_genpd_gov_always_on - A governor implementing an always-on policy
925b44a273aa8c Mark Brown        2011-12-08  235   */
925b44a273aa8c Mark Brown        2011-12-08 @236  struct dev_power_governor pm_domain_always_on_gov = {

:::::: The code at line 236 was first introduced by commit
:::::: 925b44a273aa8c4c23c006c1228aacd538eead09 PM / Domains: Provide an always on power domain governor

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
