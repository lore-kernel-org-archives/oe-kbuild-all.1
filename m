Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA115AC7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695367169; x=1726903169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IczMJV895+7bVxvLinBA0/ZBTTigWJGgjqPBgeNCGSM=;
  b=c+j70k/KoKK6mP9XNPCBBZWqIAS7U+SB65OiTTdeUjY1ffwLF73Kd8ML
   osQSniBXlVnCVfLHd62tarLl4ttvFljAhmqHsBw1keDA2Oy5wkvZOsRbI
   AI81mF+6jBA9Az4deM+UlPeEju55qGBjUC+GqU2E4yU0oA3eXAcb3CoYA
   35pCMzOM02lBUUHJYFkWk3xAMdZBOuVrYeoVxuJaX0XDzUZTGJyR9G4M3
   MbV/GWYQa6bEUAnG4DaoCbL5/MeR1deZfreTfZIKVeJDna7QjbOHvf1Ig
   bDjZ4g7ii6FDXY7rak/tR58Yj0wpyq7TQI7+DzcXzdiSpAYXPznL61myX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="444865029"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="444865029"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 00:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="890716280"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="890716280"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2023 00:18:34 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjaRh-0000Gn-2o;
	Fri, 22 Sep 2023 07:19:25 +0000
Date: Fri, 22 Sep 2023 15:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 1468/9999]
 drivers/cpufreq/cpufreq_times.c:397:37: warning: 'uid_time_in_state_fops'
 defined but not used
Message-ID: <202309221508.opdrKh21-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 909377233dd545687a3440e332ea321faada048c [1468/9999] ANDROID: cpufreq: times: track per-uid time in state
config: x86_64-buildonly-randconfig-006-20230922 (https://download.01.org/0day-ci/archive/20230922/202309221508.opdrKh21-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221508.opdrKh21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221508.opdrKh21-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cpufreq_times.c:397:37: warning: 'uid_time_in_state_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations uid_time_in_state_fops = {
                                        ^~~~~~~~~~~~~~~~~~~~~~


vim +/uid_time_in_state_fops +397 drivers/cpufreq/cpufreq_times.c

   396	
 > 397	static const struct file_operations uid_time_in_state_fops = {
   398		.open		= uid_time_in_state_open,
   399		.read		= seq_read,
   400		.llseek		= seq_lseek,
   401		.release	= seq_release,
   402	};
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
