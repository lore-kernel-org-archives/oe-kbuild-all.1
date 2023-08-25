Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E119CA60
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 15:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692975920; x=1724511920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5whZTqu6FfuQGAhMB7nTohwzXoGQk3z7TQ1Uogbd2TU=;
  b=OfI5WxCzlRjUBE0Tg6BFDyn3wMCbGuIzwzbBbsko90+zk65eaXGv8XMU
   8b9CozPzeJITqPqvrRvdp/cW2Nt/jiZtYCNhhJKT/xdiaUzRQ+DnuuZAH
   e1Dih7fuLjqztpwDm+yl/XdQ5oFe837e2OboXuBNac8ldN92hdN/RCpVV
   w+jhxfWAFlQw1r/Gkv7w1AVX4ASiQUt0va4gz77YMVRo9HCFkznIBYir+
   F0fnMc/y0Hp0yep0K5954pIRgS4Ja5LR3Gm92AeE63ISXY7rulAIjoJZH
   ZbTQuqNeabHl1cp+ywZZkn/xsQ2hwJR8dnJVFAr7cm3CGzY4/BIbrprDT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355058976"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="355058976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 08:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766974362"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="766974362"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 08:05:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZYNB-0003il-0o;
	Fri, 25 Aug 2023 15:05:17 +0000
Date: Fri, 25 Aug 2023 23:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 3914/30000]
 drivers/cpufreq/cpufreq_times.c:397:37: warning: 'uid_time_in_state_fops'
 defined but not used
Message-ID: <202308252316.gN60V6Sv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   c399249bc92003dde1c005501c03056039f0ccce
commit: b2ca4f89094256a09a463ee6c3b341f46b5113f8 [3914/30000] ANDROID: cpufreq: times: track per-uid time in state
config: x86_64-buildonly-randconfig-001-20230824 (https://download.01.org/0day-ci/archive/20230825/202308252316.gN60V6Sv-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252316.gN60V6Sv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252316.gN60V6Sv-lkp@intel.com/

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
