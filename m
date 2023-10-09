Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B390156E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsHj5Zmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696888459; x=1728424459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/RsAffHXOTiE+iR1Fsg4WJlTzEhyVpy0tVa/hX/8Wwk=;
  b=XsHj5Zmre/Yg9apQce06XrdDpi+reI6FR5+VqxZyLZsYaxjQuJ7aQqiZ
   BmRZM/KFvX76aU6BSUcxAND6mcTunaw5W0G6Vj5bd67sr2XqMqZm4ZY6i
   HN9CWXLJGis4iv+xBx3AFrqa+Zzw3WzzyBukO8/u83acHvyahLVwlqJgM
   A6UI5NHvCHZEBCzfOZgLJhvZm9K4eWd++SPE22lCOa/aDzuTaqbDh/x5n
   MDDrfCippPmTx1vS5xBMCB+JQP8cI/S5beulHo1L1dlrSmNk10SPrx+U1
   U/ODA64848B8tLhVLgRd531kSaDyjNGYXKggPnrOAwA0d8Sg1JB3jeYpb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387087408"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="387087408"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 14:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756859332"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="756859332"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 09 Oct 2023 14:54:17 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpyCd-0000jg-0y;
	Mon, 09 Oct 2023 21:54:15 +0000
Date: Tue, 10 Oct 2023 05:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 157/30000]
 drivers/misc/uid_sys_stats.c:182:37: warning: 'uid_remove_fops' defined but
 not used
Message-ID: <202310100552.AF7VPZ8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   5759bbcc0d24a0f84f9021cf06f02a08c4e739fe
commit: 0ae8088521d9d7c7aba2d364e3188628fffb076f [157/30000] ANDROID: uid_cputime: Adds accounting for the cputimes per uid.
config: arm64-randconfig-002-20231010 (https://download.01.org/0day-ci/archive/20231010/202310100552.AF7VPZ8W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100552.AF7VPZ8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100552.AF7VPZ8W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/uid_sys_stats.c:182:37: warning: 'uid_remove_fops' defined but not used [-Wunused-const-variable=]
     182 | static const struct file_operations uid_remove_fops = {
         |                                     ^~~~~~~~~~~~~~~
   drivers/misc/uid_sys_stats.c:128:37: warning: 'uid_stat_fops' defined but not used [-Wunused-const-variable=]
     128 | static const struct file_operations uid_stat_fops = {
         |                                     ^~~~~~~~~~~~~


vim +/uid_remove_fops +182 drivers/misc/uid_sys_stats.c

   181	
 > 182	static const struct file_operations uid_remove_fops = {
   183		.open		= uid_remove_open,
   184		.release	= single_release,
   185		.write		= uid_remove_write,
   186	};
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
