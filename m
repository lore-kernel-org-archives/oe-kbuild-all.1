Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EBD280
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695569325; x=1727105325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYYt0Pghqnlzny8r4Fev0y9Rj/Sw6Wv7+CrUiZjPeMg=;
  b=JrXOssfU4RillxGtwX0e/LBvsJ/wK68petW4DX5yqsYqT9UZOUEEZ+zs
   /8IQhKvJK/eEd4bEuy6S9K1NntJ2l4+IPpFlbUy2GV9HsIcklFGoeTwhr
   iFUPWbZb8m9NE9tMzuimWik9o6iaxKy5tYyl5sBMPnlqPZkmXsQJcO//8
   9/SgGyizACxqE9VXNKTbOfXEWzK7JHhQM5bA7dEHWXIl9QYN7IPVRCOfS
   eJISyI0R3fIhCMvu4YQPnhoLebJdnV3eZ3UHHPwXd29P1uDgjaePWg2K4
   ECKdHmOffgcE0sJp06VVtC6qWd/bT1AZiCXcOhqTC5AoKvCNgQIM7aZZ+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447589478"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="447589478"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 08:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995113760"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="995113760"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2023 08:28:43 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkR2H-00001B-16;
	Sun, 24 Sep 2023 15:28:41 +0000
Date: Sun, 24 Sep 2023 23:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 262/4608]
 net/wireless/wext-proc.c:122:36: warning: 'wireless_seq_ops' defined but not
 used
Message-ID: <202309242304.zZjJjsgh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   46112c304156d3932c5e1efb77f41bebc96d6652
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/4608] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: x86_64-buildonly-randconfig-003-20230913 (https://download.01.org/0day-ci/archive/20230924/202309242304.zZjJjsgh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309242304.zZjJjsgh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309242304.zZjJjsgh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/wext-proc.c:122:36: warning: 'wireless_seq_ops' defined but not used [-Wunused-const-variable=]
     122 | static const struct seq_operations wireless_seq_ops = {
         |                                    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/wireless_seq_ops +122 net/wireless/wext-proc.c

3d23e349d807177 Johannes Berg 2009-09-29  121  
3d23e349d807177 Johannes Berg 2009-09-29 @122  static const struct seq_operations wireless_seq_ops = {
3d23e349d807177 Johannes Berg 2009-09-29  123  	.start = wireless_dev_seq_start,
3d23e349d807177 Johannes Berg 2009-09-29  124  	.next  = wireless_dev_seq_next,
3d23e349d807177 Johannes Berg 2009-09-29  125  	.stop  = wireless_dev_seq_stop,
3d23e349d807177 Johannes Berg 2009-09-29  126  	.show  = wireless_dev_seq_show,
3d23e349d807177 Johannes Berg 2009-09-29  127  };
3d23e349d807177 Johannes Berg 2009-09-29  128  

:::::: The code at line 122 was first introduced by commit
:::::: 3d23e349d807177eaf519d444677cee86b1a04cf wext: refactor

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
