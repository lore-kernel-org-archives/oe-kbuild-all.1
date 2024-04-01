Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB4A33982
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 22:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712012176; cv=none; b=dSyX5df1sMT/Hd/QmM/SaFULOkM9z5Iqy31rJw0m+j61TgduBg+zwy3XbUG1GQeKAm8Ubw9PnR2h0csh1W2wjSdxMB9pS6YgYTa/yhPAI4Fncc/US3k0VnIvpSq1IolFEyECoLh4aaJ/X6Vd23LX/mDYZ9+F3R8E8qLknRyThv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712012176; c=relaxed/simple;
	bh=RaL6tkw2WHSrubbDvKrijZ/GzjrmMTAQE3FRcQDJ0yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLmoXVEGkS5WyvtYAJMJhFeMZc4Qnl37cOqZni4PkuVQ4NIK7dDo6zhnZNp1Wqd5G+3m/6WqdK9QaiWMx0Y1S0Dg0XxRmlsFimUzoVS0YT2J0u6Bd9cPI70942XNyyfNmT7BN2RpyK3IfuoqDh7YWfkiZXQ2jlM3pvGllT60BYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8UsfP68; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8UsfP68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712012175; x=1743548175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RaL6tkw2WHSrubbDvKrijZ/GzjrmMTAQE3FRcQDJ0yw=;
  b=R8UsfP68hyKFE7rMPOKgNI6ZACA8v+lNZBqFcqLTyvL2Mg6jjS3JlUUC
   z3D9D9fEuqIi+hXMQa4n2eSyrFRY4hf1rGLl6kTiJKHQm3G6jaq+VkMys
   KTZZ8G5vzcfyjqBgtuq/MFrty98VcvzjBzPgbowFeP0LHx4NvB+MO4Ir2
   adfZQR651msmQc+WvfdwT2qJOjMSD8vUCJu4PiIug3ZeKpALGlxnwX36A
   Y4lf4rwW1dBfIFshiWjOE/DGMn1f+Gav1FZYvy/ty9e/MGVnelby9Gm0y
   othY7UpGmejqx8obgq6qhkgGbkZCUFZ+cyl4T44iKheA+XgV6PVu3mlix
   A==;
X-CSE-ConnectionGUID: QYLryGabQdGzvfW0eFFoAw==
X-CSE-MsgGUID: QN4+jsZBTtqW3xZ8vyORhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7015048"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7015048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 15:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="17928119"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2024 15:56:13 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrQZU-0000ej-36;
	Mon, 01 Apr 2024 22:56:09 +0000
Date: Tue, 2 Apr 2024 06:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18200/22019] mm/share_pool.c:1043:9:
 error: implicit declaration of function 'sysctl_compaction_handler'
Message-ID: <202404020659.7QBKhQPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca07979c0a7054331b91c892163a0d214cffcbe
commit: d45b33b72c530e64219ad997947a33f6e07d339c [18200/22019] share pool: Try to compact when memory is insufficient
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240402/202404020659.7QBKhQPa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240402/202404020659.7QBKhQPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020659.7QBKhQPa-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c:59:5: sparse: sparse: symbol 'enable_mdc_default_group' was not declared. Should it be static?
   mm/share_pool.c:1043:9: sparse: sparse: undefined identifier 'sysctl_compaction_handler'
   mm/share_pool.c: In function 'sp_compact_nodes':
>> mm/share_pool.c:1043:9: error: implicit declaration of function 'sysctl_compaction_handler' [-Werror=implicit-function-declaration]
    1043 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
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


vim +/sysctl_compaction_handler +1043 mm/share_pool.c

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
