Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72C1C691
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCJCdFyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699628262; x=1731164262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qGyZlPpgP1T82GSHPKKbHb/XoZ0hwM4aoUOcU5zY/CM=;
  b=lCJCdFyrnUkdpETWquLFPxIwdG05aPxeVz7E4RVVlo7usc4ux4b5cDdr
   WccMxI2chmgADP9N/AeFiqDxiIuBnrXu45+3mYeoLfdhnRhy9Bi9RYbTV
   O5yVeN047YeQ01WlHe4SyOv11/y5u76Cy5AzqIwhNr1n/YBlnzdIlywGl
   jXigR1uhLAJNtqolb/X7nZ4GbppyOFXHWGfrZdyp0Bkzuh0WRMVkwEsIq
   g5JKY/2RgpsmmHm3lrrb8bCO8F+/m4Rr5fM9WelnuoifPJFrmLsc7ACJe
   RtACHot06XwYibMOFsOkkGqPpeBpp8fVvKKdQWBjmJy2bYTXJgyVZuHk9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387354942"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387354942"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 06:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="880984524"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="880984524"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 06:57:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Sx0-0009fO-1Q;
	Fri, 10 Nov 2023 14:57:38 +0000
Date: Fri, 10 Nov 2023 22:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 7243/27787]
 fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits from
 constant value (5346434e49 becomes 46434e49)
Message-ID: <202311102224.5L2s5aji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d43ac48de222318c621dccb5b140e46676779736
commit: 6a5003146f8798ddd9f3f912c516208af7106a1b [7243/27787] ANDROID: Incremental fs: Fix four error-path bugs
config: i386-randconfig-061-20231110 (https://download.01.org/0day-ci/archive/20231110/202311102224.5L2s5aji-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102224.5L2s5aji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102224.5L2s5aji-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/incfs/data_mgmt.c: note: in included file:
>> fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
--
   fs/incfs/vfs.c: note: in included file:
>> fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   fs/incfs/vfs.c:1257:48: sparse: sparse: non size-preserving integer to pointer cast
   fs/incfs/vfs.c:2181:23: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)

vim +318 fs/incfs/data_mgmt.h

   295	
   296	/*
   297	 * Collects pending reads and saves them into the array (reads/reads_size).
   298	 * Only reads with serial_number > sn_lowerbound are reported.
   299	 * Returns how many reads were saved into the array.
   300	 */
   301	int incfs_collect_pending_reads(struct mount_info *mi, int sn_lowerbound,
   302					struct incfs_pending_read_info *reads,
   303					int reads_size);
   304	
   305	int incfs_collect_logged_reads(struct mount_info *mi,
   306				       struct read_log_state *start_state,
   307				       struct incfs_pending_read_info *reads,
   308				       int reads_size);
   309	struct read_log_state incfs_get_log_state(struct mount_info *mi);
   310	int incfs_get_uncollected_logs_count(struct mount_info *mi,
   311					     const struct read_log_state *state);
   312	
   313	static inline struct inode_info *get_incfs_node(struct inode *inode)
   314	{
   315		if (!inode)
   316			return NULL;
   317	
 > 318		if (inode->i_sb->s_magic != (long) INCFS_MAGIC_NUMBER) {
   319			/* This inode doesn't belong to us. */
   320			pr_warn_once("incfs: %s on an alien inode.", __func__);
   321			return NULL;
   322		}
   323	
   324		return container_of(inode, struct inode_info, n_vfs_inode);
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
