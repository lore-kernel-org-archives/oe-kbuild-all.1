Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699733DEFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553105; cv=none; b=euAq1s9dlkzMFMN4AQB4NbuU1nn6nVV+vi9awQU6S6sSL1SnZ6TlMxi3f6dUrp7nBF6SAC5cycX7f+BN2eEcFgq6JW2RZLvQvBqCDOV4rSBHKT1E1Ombl+8/5z9vZlHqsj4a2aKft2ZhrbZXd0tvqCCYlTlKZTJSGvBn/UOnSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553105; c=relaxed/simple;
	bh=bpNuwUZoEFygV0rMKpCsOi7Apav8GlxIv60B1qEmbF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkGl6JZ4IVfEmDeUkFpvJ+2hSFRu/Z8zdAFM/Ihp13sYK2puyhMguAimqrgOLLkqmBg4pQlGRB229dGCw3QoUnzl8GlcMOxxw8RmPPAlQ5PZS5be16c+kblZX6x7WRdZQvpTzNSS+VPE/Sq15HYB9uU1XcoH+BUXQ7gChhjyMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjC2Rslx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjC2Rslx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763553103; x=1795089103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpNuwUZoEFygV0rMKpCsOi7Apav8GlxIv60B1qEmbF4=;
  b=GjC2RslxixGB7UJ58luCx4is+kb20EWbBdinV2qoZadGC2FPA1n+vNqW
   iiILAF1XFXl0+FE3xN8s3yH/Jlv83Sz1NO6PMNsOQ1KbOrnV91V2lVejP
   MdIMmPB89ce9P0jkihmxhGvEmbf2L4iO4AokHaNz2tmOhmBxAl5hZCbzf
   wLkODYa6p80+5FjVp8TziozTkyh5LAII7wBG7PhPN44w/jJxg1qcACBmB
   BXszmvcZa6rxFg91jWh5Ycl2wLWBnIxspfdDu4kQYQj7xs47XuHqevUt3
   35VFByk5FhkWdyl3oW1dFbyEICYVfU0GlznO97BT37LiAO7/UHkPjnbpl
   g==;
X-CSE-ConnectionGUID: aOYcew8kRtmGfUv96HJdfA==
X-CSE-MsgGUID: vIaILe21Te2xY6dSpmC1Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76270950"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76270950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:51:42 -0800
X-CSE-ConnectionGUID: qAAMdLnRSCC91o/1+HcmUg==
X-CSE-MsgGUID: yX/suS7cR6aIeoC9azpZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190695713"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2025 03:51:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLgio-0002qP-2i;
	Wed, 19 Nov 2025 11:51:38 +0000
Date: Wed, 19 Nov 2025 19:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3278/3278] include/linux/xsched.h:309:29: error:
 array has incomplete element type 'struct cgroup_file'
Message-ID: <202511191942.8hZlsAYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dfb9bd9242c2350c127d51a126976ed386e9cc48
commit: aafde051ac61687823976cc892fb3c416101d694 [3278/3278] xsched: Add support for CFS quota for cgroups
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191942.8hZlsAYZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191942.8hZlsAYZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191942.8hZlsAYZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/xsched/vstream.c:23:
   include/linux/xsched.h:276:29: error: field has incomplete type 'struct cgroup_subsys_state'
     276 |         struct cgroup_subsys_state css;
         |                                    ^
   include/linux/kthread.h:219:8: note: forward declaration of 'struct cgroup_subsys_state'
     219 | struct cgroup_subsys_state;
         |        ^
   In file included from kernel/xsched/vstream.c:23:
>> include/linux/xsched.h:309:29: error: array has incomplete element type 'struct cgroup_file'
     309 |         struct cgroup_file xcu_file[NR_XCU_FILE_TYPES];
         |                                    ^
   include/linux/xsched.h:309:9: note: forward declaration of 'struct cgroup_file'
     309 |         struct cgroup_file xcu_file[NR_XCU_FILE_TYPES];
         |                ^
   2 errors generated.


vim +309 include/linux/xsched.h

   272	
   273	/* Xsched scheduling control group */
   274	struct xsched_group {
   275		/* Cgroups controller structure */
   276		struct cgroup_subsys_state css;
   277	
   278		/* Control group settings: */
   279		int sched_class;
   280		int prio;
   281	
   282		/* Bandwidth setting: shares value set by user */
   283		u64 shares_cfg;
   284		u64 shares_cfg_red;
   285		u32 weight;
   286		u64 children_shares_sum;
   287	
   288		/* Bandwidth setting: maximal quota in period */
   289		s64 quota;
   290		/* record the runtime of operators during the period */
   291		s64 runtime;
   292		s64 period;
   293		struct hrtimer quota_timeout;
   294		struct work_struct refill_work;
   295	
   296		struct xsched_group_xcu_priv perxcu_priv[XSCHED_NR_CUS];
   297	
   298		/* Groups hierarchcy */
   299		struct xsched_group *parent;
   300		struct list_head children_groups;
   301		struct list_head group_node;
   302	
   303		spinlock_t lock;
   304	
   305		/* for XSE to move in perxcu */
   306		struct list_head members;
   307	
   308		/* to control the xcu.{period, quota, shares} files shown or not */
 > 309		struct cgroup_file xcu_file[NR_XCU_FILE_TYPES];
   310		struct work_struct file_show_work;
   311	};
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
