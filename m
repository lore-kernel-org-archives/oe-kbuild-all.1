Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB421C38
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677827274; x=1709363274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZBTCP4WvKA6V3aV27u5TskAQj0c8nZmZyLMxpmlqeeo=;
  b=Ew0+XRjHcZ4ZW5oQ9nWTMyjM9Voa2LyPgn1SZRII3mK3O5TeH5XM1Biv
   39gYOo5cdLz4i7h63liVVhNZD29oiyVYTAxHMqwD88Ntr2o0/8gphdLw2
   UL92m0czHla1d8YBtRJDc6UeKyG8LoMnoJotnk0LfiFK10j7WgQXZh5ND
   SSjLw84nDZrg5TrYRqRYynuUZTc4hIKIC5byju5phsCNbSLSf1hJYm8Ac
   tCc26JjHSAwklh6htI0P9zVU0ojeecuG66wjsnC4eA16RuLN+aOjZjpD7
   m6IxJjBOxzjBOfPzwQF2PZ2WobZ7I0gRU3nJR/9O7NEpLoT3IDFQj1klV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337293051"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="337293051"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 23:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785168870"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="785168870"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2023 23:07:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXzWC-0001Hu-0s;
	Fri, 03 Mar 2023 07:07:52 +0000
Date: Fri, 3 Mar 2023 15:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 1647/9999] fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits
 from constant value (5346434e49 becomes 46434e49)
Message-ID: <202303031458.ffUHcc1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   ef8b9b38090e63de841d55b568aa5f60c587f14c
commit: 4c79cf5d012528485d0f2433eddab96b0c116776 [1647/9999] ANDROID: Incremental fs: Fix four error-path bugs
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230303/202303031458.ffUHcc1E-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/4c79cf5d012528485d0f2433eddab96b0c116776
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout 4c79cf5d012528485d0f2433eddab96b0c116776
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031458.ffUHcc1E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/incfs/data_mgmt.c: note: in included file:
>> fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   fs/incfs/data_mgmt.c: In function 'incfs_process_new_hash_block':
   fs/incfs/data_mgmt.c:1026:28: warning: variable 'mi' set but not used [-Wunused-but-set-variable]
    1026 |         struct mount_info *mi = NULL;
         |                            ^~
--
   fs/incfs/vfs.c: note: in included file:
>> fs/incfs/data_mgmt.h:318:44: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   fs/incfs/vfs.c:1256:48: sparse: sparse: non size-preserving integer to pointer cast
   fs/incfs/vfs.c:2180:23: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   fs/incfs/vfs.c: In function 'ioctl_create_file':
   fs/incfs/vfs.c:1256:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1256 |                               (u8 __user *)args.signature_info,
         |                               ^
   In file included from fs/incfs/vfs.c:19:
   fs/incfs/vfs.c: In function 'incfs_mount_fs':
   include/uapi/linux/incrementalfs.h:21:28: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '357661101641' to '1178816073' [-Woverflow]
      21 | #define INCFS_MAGIC_NUMBER (0x5346434e49ul)
         |                            ^
   fs/incfs/vfs.c:2180:23: note: in expansion of macro 'INCFS_MAGIC_NUMBER'
    2180 |         sb->s_magic = INCFS_MAGIC_NUMBER;
         |                       ^~~~~~~~~~~~~~~~~~

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
https://github.com/intel/lkp-tests
