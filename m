Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349E18D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731801746; cv=none; b=Gl+4rFYRmIKQGPh9zbp+qLtYTYG+qRwjU0eghxJvvu5FJEdxal+9Pvvu7rxX9j/iWxEoxj/FO555zy0nbt8cZx8/+Ii3HoUzVFQGnmgLOCwid18TN1SXWcWhj7tosIzT0z5Utk/o7uVRIxoBgL+0w6gFVjyq6YWwSGZ5bj4dpLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731801746; c=relaxed/simple;
	bh=DorU+fincB+wUs80ingtW090UheSZsA8c49Z+t1ey4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HkCE/G9EWNi/xSUTbm422+z4PF5FTyjhJ569O3zry95cdePTQFRb5H7i5VWsBtt86Iv7PlgQaBE19yGy9DEKiDfYm4tp23ewda2ZIRrhjwOYAmkjp1J2vmhYKZGwQXcXe/kPSW4VetKePJVkn+QuM796QaKLe0LGrbIqbQUnNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx/A3P2r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx/A3P2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731801744; x=1763337744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DorU+fincB+wUs80ingtW090UheSZsA8c49Z+t1ey4w=;
  b=hx/A3P2rDrDFsroG5LopllOGgKoUMGepk02H+77TFt2PVDwTdfeLmzSM
   mXJ3JIvJRFVYndyAbPV4XiK4saFOvOR3qockCERi1g6Tn+r24ObflTLtO
   HZuFEs0yy8TRj9mWagDNlIdKSTeoDYJWsZWTmiaiBK176xAgpn3twjNcH
   c/xAwLiJgUhFmTJ1wOv8+ZC3n5t+EulXqUlV1P9WpvAJ8QSxw8Eph2dEh
   YBVvNTLqLnb6TFiYjoY6aHm0TTM9ibJoYB+AkcljxyV1RmKMSYxfAycqv
   jHmHCoRspuVVuPFDpJW6ovVh17awqf1w7s8hV8aLukjqR1C19JTpvfFWA
   g==;
X-CSE-ConnectionGUID: NVfmnnhETDCocW1wUYb+AA==
X-CSE-MsgGUID: 2LwxLNe5SNOzCB0tI2Q4gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31881958"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31881958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:02:23 -0800
X-CSE-ConnectionGUID: CPl5mGRgSl2ZWF5NtrQ5+A==
X-CSE-MsgGUID: elrnib0AQbyQjdVJ/QUswg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93341566"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2024 16:02:22 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCSk7-0001Az-1U;
	Sun, 17 Nov 2024 00:02:19 +0000
Date: Sun, 17 Nov 2024 08:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] mm/share_pool.c:3736:12:
 warning: 'proc_overview_show' defined but not used
Message-ID: <202411170716.qehM7edl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: 1cfc25ccec44c17c19c892bd31d00d8f6fb23f9b [1297/1297] share_pool: Add proc node to show process overview info
config: arm64-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170716.qehM7edl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170716.qehM7edl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170716.qehM7edl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_group_id_by_pid':
   mm/share_pool.c:840:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     840 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_compact_nodes':
   mm/share_pool.c:1689:9: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'sysctl_memcg_qos_handler'? [-Werror=implicit-function-declaration]
    1689 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         sysctl_memcg_qos_handler
   mm/share_pool.c: At top level:
>> mm/share_pool.c:3736:12: warning: 'proc_overview_show' defined but not used [-Wunused-function]
    3736 | static int proc_overview_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:3693:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    3693 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:3635:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    3635 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/proc_overview_show +3736 mm/share_pool.c

  3735	
> 3736	static int proc_overview_show(struct seq_file *seq, void *offset)
  3737	{
  3738		seq_printf(seq, "%-8s %-16s %-9s %-9s %-9s %-10s %-10s %-8s\n",
  3739			   "PID", "COMM", "SP_ALLOC", "SP_K2U", "SP_RES", "Non-SP_RES",
  3740			   "Non-SP_Shm", "VIRT");
  3741	
  3742		down_read(&sp_proc_stat_sem);
  3743		idr_for_each(&sp_proc_stat_idr, idr_proc_overview_cb, seq);
  3744		up_read(&sp_proc_stat_sem);
  3745		return 0;
  3746	}
  3747	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
