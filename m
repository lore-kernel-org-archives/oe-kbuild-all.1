Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC918A6D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223151; cv=none; b=jRxwrBfrfIjDhOGQDS2K7FflH4v7zlnuRMobRuoGUGYaWBOuMYLtSQoWep9BTwsWAHT/qTeOvNcN7MLqDrrM42ApV9g5lJ6FdNuxrsKBS17lL9pqkCm2+MUv6+1RFe8JUOwA1R6bHmjAhQ1hyKq/5DrceXXF2sjoRQvhwqIYciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223151; c=relaxed/simple;
	bh=zHrT8DXVQxNTKpEB6JmhY20fCYzRtAcp7tQ5wgcBc+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzu7CjrN84437IyxqtgS2p71fWTPpU7xsBJYFnjrzSVm/BEGq/7ymo4Hy0UoH8vGxscFSlxT4Yk42knku0lbMcAF4CAxt6ObJ6aaGERM5RRzVkxNNT9ffI/E9FTLhwMcIvBeb8fjZebU4Q9xLDoWx9IwHBxFR5hCQuMkmz3sadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW8w7BC1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW8w7BC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223149; x=1757759149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zHrT8DXVQxNTKpEB6JmhY20fCYzRtAcp7tQ5wgcBc+s=;
  b=OW8w7BC1jwW5J8EGxboL92h6iZiMUhlLaDvMD05Q8bhu7W1psad+BW3j
   P1ugqjY9UcuBviN225FrsKyofbjCAAQ6pbsFLXC48CXij4IpuFRUL8vDe
   90MuBtDi2dIY4sc3Je8GbN83W8M4xaplUE/p6ikCcsmBk1nVmhxeMAh6J
   bx/V+stTnQbIaI2Ax98SPtw8biOYLPwNvdkz0PAz4zkO/qvovQt/Tm74q
   90kvZiLOsjyC6HR/PtvMx0cZ4p0YSz49VvLxJntmjlCs+KufX9Jcp8tJU
   JOZICplIem3DnaQEOCG0kDb4O8sU8Y5QfjZyWTXvzygXxdHCiAh2yAbI2
   A==;
X-CSE-ConnectionGUID: nw/sV+13StGhc37OgWyq3g==
X-CSE-MsgGUID: m/qSEV2JT8Cw3DYdhtZI2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25216212"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25216212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:25:49 -0700
X-CSE-ConnectionGUID: lSa5v6sDSF+3jdaP+WUKUw==
X-CSE-MsgGUID: wHvfNsqkQAiMCfdNQiPlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72373505"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 03:25:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp3Un-0006Lm-2d;
	Fri, 13 Sep 2024 10:25:45 +0000
Date: Fri, 13 Sep 2024 18:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29758/30000] drivers/acpi/numa/hmat.c:726:6:
 warning: no previous prototype for 'hmat_restore_target'
Message-ID: <202409131803.dBKueHy8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [29758/30000] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-randconfig-076-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131803.dBKueHy8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131803.dBKueHy8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131803.dBKueHy8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/hmat.c:726:6: warning: no previous prototype for 'hmat_restore_target' [-Wmissing-prototypes]
     726 | void hmat_restore_target(int nid)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/hmat_restore_target +726 drivers/acpi/numa/hmat.c

   725	
 > 726	void hmat_restore_target(int nid)
   727	{
   728		struct memory_target *target;
   729		int pxm;
   730	
   731		pxm = node_to_pxm(nid);
   732		target = find_mem_target(pxm);
   733		if (!target)
   734			return;
   735	
   736		mutex_lock(&target_lock);
   737		hmat_register_target_cache(target);
   738		hmat_register_target_perf(target, 0);
   739		hmat_register_target_perf(target, 1);
   740		mutex_unlock(&target_lock);
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
