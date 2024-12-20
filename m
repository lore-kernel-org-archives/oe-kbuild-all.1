Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F32582
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687307; cv=none; b=kSeT4b9+3X6wauHXS8mTD1HlK8ibF++ExDshtojxrrs/kslBeqqUMQWD5muAs5WpaYgScDYs3V7ycPwEYCAOxPRN+0Cs1newUdcp75Iz/uSC/vBUak7xfQC4oqpupErlfl8pfUfT+o51WyjJHP0/3+RKmQqJ249c+wUQxnLcRDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687307; c=relaxed/simple;
	bh=02d+7gXtpzjWUjRrG1zbJI1L4dKxuY7tExnLX/YWtS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebPHN2HWwiO9JvKmUxhwunwdJiscZVwf7SSvC8EnDtaTaHsHHxENOT3X5pbnGMqlMEoJE5NSV487fJmLqMBD6r/9+FR6AmGIeK7vb8cMD3uZ+l9ByYGH/zBrFS9NFkuXf8SvvI2piZ6Jrk3D+I0ZQXK7GFojVwxuez28ARvwmdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGoY5T3Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGoY5T3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734687305; x=1766223305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02d+7gXtpzjWUjRrG1zbJI1L4dKxuY7tExnLX/YWtS0=;
  b=jGoY5T3YLhJnv5nCg9psiSFm9CYssgYMJ3PlBETUv7Mm44c91bHK1/3W
   Izg/cHHzJ5BSuHCyIjS2O2WHENQOVQL1RspoCTRGP0DUoKFPJueo3lw+s
   tXrwBKJkqZO3MZowkbHyeviWqIvwKRPqR+yIM4X9mEDX48WcRI+9dKJ08
   CC28vd7ugjeONp6Er93SjljTTOHaLqYZXo8MNESNtNQ0hEzrU3rK/7puC
   U1KE7N0EXB1183Ot+mvLnj53LyChm2VGg1muIZoDYp8RkgRc74XobVDYB
   G7aNotwcpe5a86Z9Z8Lfo8IJluwjFbT9zC7ATnxjE4/EEYO7nplzyTHI4
   Q==;
X-CSE-ConnectionGUID: 7h6KtDauSPWlAcCREd1cPA==
X-CSE-MsgGUID: Qg4MnZVDRXCGf+vBGbWTog==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45838542"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45838542"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 01:35:04 -0800
X-CSE-ConnectionGUID: qNEFTiG1SG+blWpR8tC1tQ==
X-CSE-MsgGUID: HgqBPqcRTAONxZieoATagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98662982"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 01:35:03 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOZPR-00011Q-0I;
	Fri, 20 Dec 2024 09:35:01 +0000
Date: Fri, 20 Dec 2024 17:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1341/1341] mm/share_pool.c:1043:9:
 error: implicit declaration of function 'sysctl_compaction_handler'; did you
 mean 'sysctl_memcg_qos_handler'?
Message-ID: <202412201754.UDg3QqQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: d45b33b72c530e64219ad997947a33f6e07d339c [1341/1341] share pool: Try to compact when memory is insufficient
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201754.UDg3QqQf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201754.UDg3QqQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201754.UDg3QqQf-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_compact_nodes':
>> mm/share_pool.c:1043:9: error: implicit declaration of function 'sysctl_compaction_handler'; did you mean 'sysctl_memcg_qos_handler'? [-Werror=implicit-function-declaration]
    1043 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         sysctl_memcg_qos_handler
   mm/share_pool.c: At top level:
   mm/share_pool.c:2482:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2482 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   mm/share_pool.c:2363:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2363 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   In file included from mm/share_pool.c:22:
   In function 'memalloc_noreclaim_restore',
       inlined from 'sp_alloc' at mm/share_pool.c:1374:4:
   include/linux/sched/mm.h:278:58: warning: 'noreclaim_flag' may be used uninitialized [-Wmaybe-uninitialized]
     278 |         current->flags = (current->flags & ~PF_MEMALLOC) | flags;
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   mm/share_pool.c: In function 'sp_alloc':
   mm/share_pool.c:1238:22: note: 'noreclaim_flag' was declared here
    1238 |         unsigned int noreclaim_flag;
         |                      ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1043 mm/share_pool.c

  1039	
  1040	static unsigned long last_jiffies;
  1041	static void sp_compact_nodes(struct work_struct *work)
  1042	{
> 1043		sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
  1044	
  1045		kfree(work);
  1046	}
  1047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
