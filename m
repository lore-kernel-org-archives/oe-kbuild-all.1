Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6EC13A87A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 04:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730349844; cv=none; b=iqkHce/5YAL2FRvctcW3/UONZYjWDA/r+8eGJee8TRovdtga27vXOUVt5+EHveyahR8Oa5y1ZfqSLB3/cUtM6UsA8bGryVxc2IbBmyes1k7w6m84FiLWtKQFlKSYrE3hSo/ykgUjvYPHNRvwgP5d13WG7wewHvefP5YqGzG0x7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730349844; c=relaxed/simple;
	bh=2Y2Ys5Az5V0kqWt8HrsL4xfs3d7PnhiVTcziBnsosQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jp1fgmFBdq0KZLjmOl89ravtKEgyFi/eMnYyiyyrTDTSUuLNKvE++JGu4AQrwXCOeqos6WSEizYc3Vc6xg405qQ3MI4lGEBjGqyDzKqXgu73oZ4tw1LPtSdX0qzwjJEpRJylshdpqI3dfBioqAZaS1iB6Dpv9wsoyJuxMBZrKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CH9dxAgi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CH9dxAgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730349841; x=1761885841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Y2Ys5Az5V0kqWt8HrsL4xfs3d7PnhiVTcziBnsosQ0=;
  b=CH9dxAgiLfXAyLpuIFILDbpIaj+v3xs0iciAyI1EWu+QVMPcRZHP9HNT
   0rfTY34eelGvohyCbQcoXSeAPQHxgVkuX7IqFPy8a/WGAyCKdi6VWYxm4
   MFKxFEiuoJYZgtnL5T2xhJsVsQcSjDoRDW7HTeS2htYk+W4POrgUap6C4
   VJGEpDvRUb6rQI5vgwwVvwa2d+jHaTqxujHaFkGARFYBsCd7B0eZ09nGY
   Jt8sgBPrnkQ0xA5EFAJC62w1K+pY+OrxEZSkG07SHdleGojgwU9nWA7qH
   1NYClYEfKp0LoWaSPrHuqAij3SElw1/YWi6ss66HlohKZZn594ODXKI/V
   Q==;
X-CSE-ConnectionGUID: z+lGIbGtRrC88tTxdGlAdg==
X-CSE-MsgGUID: 5s0k2opjTQ+Q0Bt7elo3cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40621871"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40621871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 21:43:57 -0700
X-CSE-ConnectionGUID: hfG9txWGSECUEfFo0sXLQw==
X-CSE-MsgGUID: 4kgyi3AsRtS/LZd6Q6HeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87118553"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 21:43:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6N2G-000ffm-0y;
	Thu, 31 Oct 2024 04:43:52 +0000
Date: Thu, 31 Oct 2024 12:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/13046] kernel/cgroup/sli.c:642:15: sparse:
 sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be
 static?
Message-ID: <202410311241.7r7VaEfg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/13046] sli: backport sli function from tk3
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241031/202410311241.7r7VaEfg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311241.7r7VaEfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311241.7r7VaEfg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/sli.c:642:15: sparse: sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be static?
>> kernel/cgroup/sli.c:1247:27: sparse: sparse: dubious: !x & y
>> kernel/cgroup/sli.c:1247:29: sparse: sparse: restricted fmode_t degrades to integer
>> kernel/cgroup/sli.c:1337:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   kernel/cgroup/sli.c:1337:24: sparse:     expected restricted __poll_t
   kernel/cgroup/sli.c:1337:24: sparse:     got int
   kernel/cgroup/sli.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/get_cgroup_from_task_id +642 kernel/cgroup/sli.c

   641	
 > 642	struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
   643	{
   644		int id;
   645		struct cgroup *cgrp;
   646	
   647		id = cpuacct_cgrp_id;
   648		switch (event_nr) {
   649	#if IS_ENABLED(CONFIG_MEMCG)
   650		case SLI_MEM_EVENT:
   651			id = memory_cgrp_id;
   652			break;
   653	#endif
   654		default:
   655			break;
   656		}
   657	
   658		/* First, try to get cpuacct/mem cgroup for V1*/
   659		cgrp = task_cgroup(task, id);
   660		if (cgrp && cgrp->level)
   661			return cgrp;
   662	
   663		/*
   664		 * If can not find cpuacct/mem cgroup or cpuacct/mem cgroup is root, just return
   665		 * dfl_cgrp.
   666		 */
   667		cgrp = task_dfl_cgroup(task);
   668	
   669		return cgrp;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
