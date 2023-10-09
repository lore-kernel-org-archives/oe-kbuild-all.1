Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0BE37C8C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFdyspy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696878210; x=1728414210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0TymFwR5qheiVXJ0UVQ5C+FPqwsgz6Z75ANDlhsz0A=;
  b=bFdyspy66oh77IstiHLJxqdYzwCkbJZBUbo1Gv2Tsuf9xiPVAJYG4qOa
   7gRF4UX6KQbmlvfC5JXW5TeA324eb0pIzyl4PMFn86LPd6HbaZzZLlgHE
   4jJc/GSQ1cPnALitBwRKvaNsc8MvD8l2ZiP7hMBJylTp5VDAccv6wrJws
   OHkH9K2rYxWXuNbEsIqfkmxvfON9VcrN54O60djAzQWHVNu3ndTQ5s/78
   IwOYgkPjbQl1Mgvcry45vwRxKhYirm4HuItmwkqjfaRIwgc+cJgg085kH
   DIu2cEs1JeT6JasaFyQ8NoIbRPsVAbJWz2Huv8SCJSG8aXptxJ5TtUP/v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363578246"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363578246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 12:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782595236"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782595236"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Oct 2023 12:03:28 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpvXK-0000Y2-0o;
	Mon, 09 Oct 2023 19:03:26 +0000
Date: Tue, 10 Oct 2023 03:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2430/30000]
 drivers/cpufreq/cpufreq_times.c:400:37: warning: 'uid_time_in_state_fops'
 defined but not used
Message-ID: <202310100204.m3rFQupi-lkp@intel.com>
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
commit: 6d2b4b4435deb19b2bc2d59fc7a1d825d588d7d0 [2430/30000] ANDROID: cpufreq: times: track per-uid time in state
config: arm-randconfig-004-20231010 (https://download.01.org/0day-ci/archive/20231010/202310100204.m3rFQupi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100204.m3rFQupi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100204.m3rFQupi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cpufreq_times.c:400:37: warning: 'uid_time_in_state_fops' defined but not used [-Wunused-const-variable=]
     400 | static const struct file_operations uid_time_in_state_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~


vim +/uid_time_in_state_fops +400 drivers/cpufreq/cpufreq_times.c

   399	
 > 400	static const struct file_operations uid_time_in_state_fops = {
   401		.open		= uid_time_in_state_open,
   402		.read		= seq_read,
   403		.llseek		= seq_lseek,
   404		.release	= seq_release,
   405	};
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
