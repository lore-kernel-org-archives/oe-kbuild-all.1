Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF515CE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688648848; x=1720184848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+8M/6Xd5u0YHtOJ7ae7ZB/eIjQAnN1If0rWNKM0lwI=;
  b=bE1l39GE+SrqjO6g8CxPfgoG+hkPvSCBMrkcSz64Ax9rQOtxAkLNe3Th
   PK36GzHfdtnSB/WT5NkmIkl0YlXpr7hkKlIDScwCU1BT1dZBcI1NEF+7A
   5et1Ze4Bqs8TvWly4iXFbuvUplBOOI1p3GzQfPrHr302I0X3q+ZuLfc28
   7ja2v9QjrPc0SeTzhrtMDMEzHLVdQkLmmW+7qd4yA32EDj2t2RUSeU8Zx
   c6TgFMnJm/7J8THy0wKHaDEOqGxZ/TfCNnoj9Y7j6GaqGmd8eHA6PJYwg
   3pAf2C9bmfZSmq16nNm/6Sv8w3S2rIo+MaW504QhjdJEmpQd3r57csad2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="367088512"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="367088512"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 06:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="893541981"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="893541981"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Jul 2023 06:07:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHOhh-0001Ks-09;
	Thu, 06 Jul 2023 13:07:25 +0000
Date: Thu, 6 Jul 2023 21:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.10.y 261/757] ld:
 warning: orphan section `.debug_rnglists' from `fs/erofs/pcpubuf.o' being
 placed in section `.debug_rnglists'
Message-ID: <202307062157.wE4ABmWf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.10.y
head:   aa1da5e725e58f84703aa2b66a717c15891cf67f
commit: f1f52c7608b860a80dcec3dcfcc0861e5aaf95d3 [261/757] erofs: introduce multipage per-CPU buffers
config: x86_64-randconfig-x004-20230706 (https://download.01.org/0day-ci/archive/20230706/202307062157.wE4ABmWf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307062157.wE4ABmWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307062157.wE4ABmWf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/direct.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/direct.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/dat.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/dat.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/recovery.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/recovery.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/the_nilfs.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/the_nilfs.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/segbuf.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/segbuf.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/segment.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/segment.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/cpfile.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/cpfile.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/sufile.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/sufile.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/ifile.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/ifile.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/alloc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/alloc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/gcinode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/gcinode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/ioctl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/ioctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/sysfs.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/sysfs.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/datastream.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/datastream.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/btree.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/btree.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/debug.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/debug.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/io.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/io.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/befs/linuxvfs.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/befs/linuxvfs.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/debugfs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/debugfs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/debugfs/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/debugfs/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/tracefs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/tracefs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/dir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/dir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/namei.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/namei.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/hash.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/hash.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/inline.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/inline.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/checkpoint.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/checkpoint.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/gc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/gc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/data.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/data.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/node.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/node.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/segment.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/segment.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/recovery.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/recovery.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/shrinker.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/shrinker.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/extent_cache.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/extent_cache.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/sysfs.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/sysfs.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/iostat.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/iostat.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/pstore/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/pstore/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/pstore/platform.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/pstore/platform.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/pstore/zone.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/pstore/zone.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/pstore/blk.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/pstore/blk.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/data.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/data.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/namei.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/namei.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/dir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/dir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/utils.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/utils.o' being placed in section `.debug_line_str'
>> ld: warning: orphan section `.debug_rnglists' from `fs/erofs/pcpubuf.o' being placed in section `.debug_rnglists'
>> ld: warning: orphan section `.debug_line_str' from `fs/erofs/pcpubuf.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/decompressor.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/decompressor.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/zmap.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/zmap.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/erofs/zdata.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/erofs/zdata.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/zonefs/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/zonefs/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/compat.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/compat.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/util.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/util.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/msgutil.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/msgutil.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/msg.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/msg.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/sem.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/sem.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/shm.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/shm.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/syscall.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/syscall.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/ipc_sysctl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/ipc_sysctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/mqueue.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/mqueue.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/namespace.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/namespace.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/mq_sysctl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/mq_sysctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/gc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/gc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/key.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/key.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/keyring.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/keyring.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/keyctl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/keyctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/permission.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/permission.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/process_keys.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/process_keys.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/request_key.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/request_key.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/request_key_auth.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/request_key_auth.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/user_defined.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/user_defined.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/compat.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/compat.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/proc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/proc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `security/keys/sysctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/persistent.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/persistent.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/keyctl_pkey.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/keyctl_pkey.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/encrypted-keys/encrypted.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/encrypted-keys/encrypted.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/encrypted-keys/ecryptfs_format.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/encrypted-keys/ecryptfs_format.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/commoncap.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/commoncap.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/min_addr.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/min_addr.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/security.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/security.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/lsm_audit.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/lsm_audit.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/audit.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/audit.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/common.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/common.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/condition.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/condition.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/domain.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/domain.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/environ.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/environ.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/gc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/gc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/group.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/group.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/load_policy.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/load_policy.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/memory.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/memory.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/mount.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/mount.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/network.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/network.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/realpath.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/realpath.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/securityfs_if.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/tomoyo/securityfs_if.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/tomoyo/tomoyo.o' being placed in section `.debug_rnglists'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
