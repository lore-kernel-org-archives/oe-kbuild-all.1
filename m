Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360F58C0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691882608; x=1723418608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pf0Xhypu3xlRJmsAVibcTFHzsI6Mz2y0IH4Ydeh3q9k=;
  b=nq3WfeqkZHBtLIcqY7O7gqHH2eLMrNMYilujlMxHAk9B/0yp8f51WAoP
   O1StiInv5+2IFASKpeQamxoCMw3qpF8UF2NHDSRpbUpz8oO5Fr1Dls4LN
   Zjfq5E6cCQm5ETx7OqKcQJJqkJOTb4VyO3x6B4f/vAA5yMETyY9TEz+cl
   XBnXmWHUmwg8fmR8EqJ2a+EwPs/LVsFE5x/FoEDAcsnc9rFG+TblymOHG
   E0bUFjawJ7v2STY3/5Fp7A/5ilDywNYimfmdfLXTEQVFRZmonLrIfWaDI
   NYpNzN1gNKY6+z4RC1TIQN3srtLSYofcMG58C2GxkAx1p3+IZHCuawZZX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="435747966"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="435747966"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 16:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="682895850"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="682895850"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Aug 2023 16:23:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUxx8-0008qe-0X;
	Sat, 12 Aug 2023 23:23:26 +0000
Date: Sun, 13 Aug 2023 07:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/3] ERROR: modpost:
 "fuse_get_bpf_prog" [fs/fuse/fuse.ko] undefined!
Message-ID: <202308130741.u1ZnRGpt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b730973f764cff5425b32f80f46405a7385b64a8
commit: f5f4199c102aa676998b42abff60d071385c1c0c [1/3] ANDROID: fuse-bpf v1.1
config: i386-randconfig-i061-20230813 (https://download.01.org/0day-ci/archive/20230813/202308130741.u1ZnRGpt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130741.u1ZnRGpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130741.u1ZnRGpt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

   WARNING: modpost: module dax uses symbol iget5_locked from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module dax uses symbol inode_init_once from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module dax uses symbol unlock_new_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module pstore uses symbol sync_filesystem from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module pstore uses symbol clear_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: "fuse_get_bpf_prog" [fs/fuse/fuse.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:138:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:294:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:1256:24: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c: note: in included file (through include/linux/compat.h, include/linux/filter.h, fs/fuse/fuse_i.h):
   include/linux/fs.h:3520:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3520:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3520:20: sparse:     got int
   include/linux/fs.h:3520:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3520:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3520:20: sparse:     got int
   fs/fuse/backing.c:2041:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2042:18: sparse:   also defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
