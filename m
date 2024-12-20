Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249943C2F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734677753; cv=none; b=Sa5TiBsxPiZHYsO2YEyOmh6mADk0b9LDD8hpNsxnlly5gsL6xBXIIpxtClNZP4xhBChX7UqsC0y5AFHQqMPztNdRWvZ5cKHPVomCE79wvqa3T5HCc2T1iZ03zXn0OHwWT98ZBrwahogOf5XIJsZ4gCES7TjzgCFib5xUnIKxTLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734677753; c=relaxed/simple;
	bh=QHQuCqs/My+pwYfDYuICKMgr5GqpnDYtAoFVMuwaQQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=subFOuGc68Km10j4liaTwyuZj3d+0emnTN0APHbRmyzZ1JRfE+tIq7+r+NQG5cafGZ9gBYgSAHOudoXj0McZf3RNOawQy280maQUSrDIftXni713vCoSCLUPTxHhGJPttkljrRdcDn/NvWZ90TX2vigtWLV6dTR4FiV55+Qcbs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHNYFRxm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHNYFRxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734677751; x=1766213751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHQuCqs/My+pwYfDYuICKMgr5GqpnDYtAoFVMuwaQQE=;
  b=kHNYFRxmMCDELZFHTxqg6pCah2NE5NeqI/KyJDgKa2GNHnUrjuPlaouH
   GHDqplVrf/HabG7hbfUGL5XOXzxD1viv+YsVVA8PBhN+aZw0rJ17VaOoM
   CNaqm3HlyFojqqxizn0c03aeORf2WWdFFJ/GqmRurB5NJB4RWgcjGb68C
   jJPn/pok5kC/5vCKqU+ewUZqfBDaO9xU+QkDz7VEFvO3xm7TUDlbTF5dW
   3wbxCpuJIZY+hDdFH60iNGhhW4IOcHadle/HuxTy0Ba48413UlT04atpr
   /GJU03QvgvaaHsmfJCE+fsxvD5k8jEeHAOLTqRK4L+MZaUJxhryuuSVK4
   g==;
X-CSE-ConnectionGUID: I9bDmHukT1qrZXHKCf5gqQ==
X-CSE-MsgGUID: YkcVws5eRae2YdZ9jiQ2rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="22814280"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="22814280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 22:55:50 -0800
X-CSE-ConnectionGUID: 9h5t4ktoQeyo+rqRGIbVHA==
X-CSE-MsgGUID: EOGtBvoQQLWA4G/5N1oUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121711370"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2024 22:55:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOWvL-0000vW-1e;
	Fri, 20 Dec 2024 06:55:47 +0000
Date: Fri, 20 Dec 2024 14:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1341/1341] mm/share_pool.c:2121:12:
 warning: 'proc_stat_show' defined but not used
Message-ID: <202412201455.A4yCBFrP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [1341/1341] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201455.A4yCBFrP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201455.A4yCBFrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201455.A4yCBFrP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c:2235:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2235 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
>> mm/share_pool.c:2121:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2121 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:1069: warning: Function parameter or member 'size' not described in 'sp_alloc'
   mm/share_pool.c:1069: warning: Function parameter or member 'sp_flags' not described in 'sp_alloc'
   mm/share_pool.c:1069: warning: Function parameter or member 'spg_id' not described in 'sp_alloc'
   mm/share_pool.c:1582: warning: Function parameter or member 'uva' not described in '__sp_walk_page_range'
   mm/share_pool.c:1582: warning: Function parameter or member 'size' not described in '__sp_walk_page_range'
   mm/share_pool.c:1582: warning: Function parameter or member 'tsk' not described in '__sp_walk_page_range'
   mm/share_pool.c:1582: warning: Function parameter or member 'sp_walk_data' not described in '__sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'uva' not described in 'sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'size' not described in 'sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'tsk' not described in 'sp_walk_page_range'
   mm/share_pool.c:1931: warning: Function parameter or member 'sp_walk_data' not described in 'sp_walk_page_range'


vim +/proc_stat_show +2121 mm/share_pool.c

  2120	
> 2121	static int proc_stat_show(struct seq_file *seq, void *offset)
  2122	{
  2123		/* print the file header */
  2124		seq_printf(seq, "%-12s %-10s %-18s\n",
  2125			   "Process ID", "Group ID", "Aligned Apply(KB)");
  2126		/* print kthread buff_module_guard_work */
  2127		seq_printf(seq, "%-12s %-10s %-18ld\n",
  2128			   "guard", "-", byte2kb(kthread_stat.amount));
  2129		idr_for_each(&sp_stat_idr, idr_proc_stat_cb, seq);
  2130		return 0;
  2131	}
  2132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
