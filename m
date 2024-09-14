Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C92A1D0150
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726324207; cv=none; b=W6yy5dGW5IJcoEU3yH4u5zPL+HYzAm9NDLsMPd2pMq7oxcm7MbCHmPKN6qB8T+thalyc+TRWCi63GLcDKEObYAV1JsvlyKjfPQ5lt25Lv1XlSACmUnpPWzDoYiC8B6LaV5BlJcPyiOpFJFdBkXv6GciEkqM7+qtG6p1/xVZqI/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726324207; c=relaxed/simple;
	bh=4o2q39bd+tjH61l9lFF8QHfs7KrQp+/YFz81FMQ4YTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+fPnG7HJ+a4qJlaO1d2N+uKma6E9WOKuSESjVYKeZY9xhNFhQnnojF1ZMfjNiMikKN5SqgxWSA39n2FGWBWwmVVW8MLGDm5KLDZQxS7SZ+cyX4FVJhjvRTxnZVQBe8l9Oq0I7tnr7SD4PcC2nAFxJlY9JY3+scfXvzlfziAaO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImdOQ8QI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImdOQ8QI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726324205; x=1757860205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4o2q39bd+tjH61l9lFF8QHfs7KrQp+/YFz81FMQ4YTE=;
  b=ImdOQ8QI0hNL9oia9YaJpQqRL/md+xOV1H2P9YWdkXI0i++MtA3PtYRv
   IuMKV/DV8R7JOstCUSMWM1wWpDb5RAggVDotjOB1XGyXAWvoWsY54ftqU
   eKzlhStDtCBBmZ46I1rsoe9tldObfc22mKQCRHePn7dkxpPR0w3CMd9X4
   E4QTHeOrsOACZ5MwS0uVyp5uItNVlg5fBSzDUTOzPA3FR7se+Z+a6SYia
   d9e2kd5f87pj+/rtawOLezdcw88Xuohr0jvpj3O41qRDJ9+3RQfqXemOJ
   V9/aHhCOcPM2UtvhfAUbmJcvnBSGW/+39r/pZez26Cc9zna1GRDzwTX7l
   g==;
X-CSE-ConnectionGUID: 0UBVwtJvQz6fwXVLkmQyWg==
X-CSE-MsgGUID: vXKn+j+0SfKgxfrhGHbivQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="24700513"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="24700513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:30:05 -0700
X-CSE-ConnectionGUID: egfKYnimSZ+/7Xb7zpXeGw==
X-CSE-MsgGUID: R3aofmepQG6KUX+004LFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="69188347"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2024 07:30:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spTmj-0007qA-1n;
	Sat, 14 Sep 2024 14:30:01 +0000
Date: Sat, 14 Sep 2024 22:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 5723/30000]
 fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits from
 constant value (5346434e49 becomes 46434e49)
Message-ID: <202409142232.4RMnwnDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   b41e3369a8f2bf2fc08e19da3d8c061981f4db89
commit: 6a5003146f8798ddd9f3f912c516208af7106a1b [5723/30000] ANDROID: Incremental fs: Fix four error-path bugs
config: i386-randconfig-062-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142232.4RMnwnDO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142232.4RMnwnDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142232.4RMnwnDO-lkp@intel.com/

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
