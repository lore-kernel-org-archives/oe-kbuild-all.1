Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD817E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677295639; x=1708831639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQAOq98iUhgmZo3RtQlldIpOzqTFof6VzMiE3UuRt8M=;
  b=Sic7qIokwtlEEqWXKI+vkuCoyp7/6MatLYfDPmXHAv4PQCe52xkj7cGU
   U4FAWBtYN5MuPmkLa94QOl2kcvhMNPEAAEzCs2fHoSQvIKpOwNoKpP6ET
   vZ5QNG73G2meAUJGEKjQ47d9/xP5ptpURRCeKb1Bic9e8iQhZbWS2WzMa
   LPtY57YWKOWxwFlVJlGZXIfZJC6L+aqGxFT7VexPGuUufUHAXwvPoX4KL
   /oFPv1VKSVcSJAHNLGoP0k6Huxn/AYyAVPjOX6Qqur9olg49KBywxNxMK
   CkryViKualB4iliaUy6TVkBdpfUj0blYZeUNBAslanCp0OiziRVI6W/+h
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335060352"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="335060352"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 19:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="666358154"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="666358154"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2023 19:27:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVlDP-0002sb-1K;
	Sat, 25 Feb 2023 03:27:15 +0000
Date: Sat, 25 Feb 2023 11:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:af/dev.btrfs 10/11] fs/btrfs/fs.h:173:56:
 warning: left shift count >= width of type
Message-ID: <202302251144.IPOtICDl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block af/dev.btrfs
head:   91361976f98a5766c0c00110ad28f6dd3b3a7de3
commit: 3afc14e1a169a4643f51ebdcf743a8efdb7f78b2 [10/11] btrfs: Add wq_cpu_set mount option
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302251144.IPOtICDl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/3afc14e1a169a4643f51ebdcf743a8efdb7f78b2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block af/dev.btrfs
        git checkout 3afc14e1a169a4643f51ebdcf743a8efdb7f78b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251144.IPOtICDl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/ctree.h:39,
                    from fs/btrfs/ref-verify.c:9:
>> fs/btrfs/fs.h:173:56: warning: left shift count >= width of type [-Wshift-count-overflow]
     173 |         BTRFS_MOUNT_WQ_CPU_SET                  = (1UL << 32),
         |                                                        ^~
--
   In file included from fs/btrfs/ctree.h:39,
                    from fs/btrfs/delayed-inode.h:17,
                    from fs/btrfs/super.c:30:
>> fs/btrfs/fs.h:173:56: warning: left shift count >= width of type [-Wshift-count-overflow]
     173 |         BTRFS_MOUNT_WQ_CPU_SET                  = (1UL << 32),
         |                                                        ^~
   fs/btrfs/super.c: In function 'parse_wq_cpu_set':
   fs/btrfs/super.c:352:26: error: assignment to expression with array type
     352 |         info->wq_cpu_set = mask;
         |                          ^


vim +173 fs/btrfs/fs.h

   134	
   135	/*
   136	 * Flags for mount options.
   137	 *
   138	 * Note: don't forget to add new options to btrfs_show_options()
   139	 */
   140	enum {
   141		BTRFS_MOUNT_NODATASUM			= (1UL << 0),
   142		BTRFS_MOUNT_NODATACOW			= (1UL << 1),
   143		BTRFS_MOUNT_NOBARRIER			= (1UL << 2),
   144		BTRFS_MOUNT_SSD				= (1UL << 3),
   145		BTRFS_MOUNT_DEGRADED			= (1UL << 4),
   146		BTRFS_MOUNT_COMPRESS			= (1UL << 5),
   147		BTRFS_MOUNT_NOTREELOG   		= (1UL << 6),
   148		BTRFS_MOUNT_FLUSHONCOMMIT		= (1UL << 7),
   149		BTRFS_MOUNT_SSD_SPREAD			= (1UL << 8),
   150		BTRFS_MOUNT_NOSSD			= (1UL << 9),
   151		BTRFS_MOUNT_DISCARD_SYNC		= (1UL << 10),
   152		BTRFS_MOUNT_FORCE_COMPRESS      	= (1UL << 11),
   153		BTRFS_MOUNT_SPACE_CACHE			= (1UL << 12),
   154		BTRFS_MOUNT_CLEAR_CACHE			= (1UL << 13),
   155		BTRFS_MOUNT_USER_SUBVOL_RM_ALLOWED	= (1UL << 14),
   156		BTRFS_MOUNT_ENOSPC_DEBUG		= (1UL << 15),
   157		BTRFS_MOUNT_AUTO_DEFRAG			= (1UL << 16),
   158		BTRFS_MOUNT_USEBACKUPROOT		= (1UL << 17),
   159		BTRFS_MOUNT_SKIP_BALANCE		= (1UL << 18),
   160		BTRFS_MOUNT_CHECK_INTEGRITY		= (1UL << 19),
   161		BTRFS_MOUNT_CHECK_INTEGRITY_DATA	= (1UL << 20),
   162		BTRFS_MOUNT_PANIC_ON_FATAL_ERROR	= (1UL << 21),
   163		BTRFS_MOUNT_RESCAN_UUID_TREE		= (1UL << 22),
   164		BTRFS_MOUNT_FRAGMENT_DATA		= (1UL << 23),
   165		BTRFS_MOUNT_FRAGMENT_METADATA		= (1UL << 24),
   166		BTRFS_MOUNT_FREE_SPACE_TREE		= (1UL << 25),
   167		BTRFS_MOUNT_NOLOGREPLAY			= (1UL << 26),
   168		BTRFS_MOUNT_REF_VERIFY			= (1UL << 27),
   169		BTRFS_MOUNT_DISCARD_ASYNC		= (1UL << 28),
   170		BTRFS_MOUNT_IGNOREBADROOTS		= (1UL << 29),
   171		BTRFS_MOUNT_IGNOREDATACSUMS		= (1UL << 30),
   172		BTRFS_MOUNT_NODISCARD			= (1UL << 31),
 > 173		BTRFS_MOUNT_WQ_CPU_SET			= (1UL << 32),
   174	};
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
