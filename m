Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BDD2AE96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734693737; cv=none; b=o+63DaYadyZOerlF0pNNpbCT8n2wECGRKMBMLuHudHivP1oiBsp4Uf4gq9Xf4hHY569C3opyyWqHOtoOch180MxS/qzJSu3G7NUSjqQsTS7ZH1m1tJk6dv7gCVrPFhqrwia8/rC0HKP16G6iSfL8MyEfQzg/zJss9Q/C7OWUGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734693737; c=relaxed/simple;
	bh=1NBexAG9EL6hvfyHwoOJHYa9WKCiVJvjGW0BTfwtN5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WD1yYbsHKDitwp1nc2r2KkdddcUKKAoHAH5qyNtKApFqhjAoazvaivhAHMZYejWYjorEb7KzBoYESZ0jRfTZjJW+chInSdFRSMH3UID+tjGiFHCeJ8IpqXJ+UPCps3Y7JaAE4KKM9vNgVgSTiL5lqpgvR3KWLZyashHSadVwoSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LihXVzb+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LihXVzb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734693734; x=1766229734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NBexAG9EL6hvfyHwoOJHYa9WKCiVJvjGW0BTfwtN5I=;
  b=LihXVzb+7OMkeuj5Z986CCiEkt1ME3NZCLInu5TXYliKliN5SflWP36p
   byUCojU2caT+348E6F3oVxMQR5klA9CzXpBX4L9TRjG4KS+K2NLUz7dqj
   0OGcu5Bum9e33vChNpDv79LxTa4XBwA+EwIFlyQCp8W7JeO9+YzSFTwaH
   pSP2qZzPWfsY20up800KHXg4gozPZqa1/fdwc4wEp8/A8wvKumypejzpy
   YEtBLZK01ZeqKBxCb/pPX2JikJn1KR1Dx8WcAYKxkFTdAgjX0B/kJEx1M
   nmkabh/TbELwtp17f9C3TO4Tjdvd5JGbDwBwjo8DR9IBb2ypD9hI8UOAe
   g==;
X-CSE-ConnectionGUID: DAGRen/VTba1mVNG+NCW6g==
X-CSE-MsgGUID: dQ9mXgTNR86K4/PXzBmfww==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35457302"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35457302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:22:13 -0800
X-CSE-ConnectionGUID: FqWop9nZTde12GqmMJq5/g==
X-CSE-MsgGUID: s1CgmN3fTAK5akjXCRsRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103566831"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2024 03:22:12 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOb58-00015b-0a;
	Fri, 20 Dec 2024 11:22:10 +0000
Date: Fri, 20 Dec 2024 19:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1341/1341] mm/share_pool.c:3736:12:
 warning: 'proc_overview_show' defined but not used
Message-ID: <202412201919.863TCPHL-lkp@intel.com>
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
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: 1cfc25ccec44c17c19c892bd31d00d8f6fb23f9b [1341/1341] share_pool: Add proc node to show process overview info
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201919.863TCPHL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201919.863TCPHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201919.863TCPHL-lkp@intel.com/

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
