Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B37483
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688644467; x=1720180467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLTQ61LcsGe1n6SkA8Cun72hw0sjb7sUfYnwTQdlWXc=;
  b=foXtxj+R7krZIh9/Pdds0qVq67z/EhOZxYiWQjTP1fkflmnqNrI2GJh3
   nZmOGwqcq+hUJiv2eGg+UY5djYJRzkH2vP4GMDaND7ERgujPb5UNfGonv
   YAROHptrGONjwgNbAd0z55ua+btNLlP2YhscESrJB2FuJvT9a0bVEPorO
   DiXDlSM/jd8RWQ48jkk0NTAvnpROVl1m0YZusQsWitdODYVX0n+rlxjO6
   doHAQ07CdaJCpiOc1rp8BPY+xTw9kTL9PdVh9pQZmfErJ+q11Yug0cX+W
   y0sO05nKDXzUq9GmfXN/26ISYN65qOCqoC/DX2FDJDf82tjljPpaJKc8N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="394338342"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="394338342"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 04:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="809628456"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="809628456"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2023 04:54:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHNZ1-0001IU-1j;
	Thu, 06 Jul 2023 11:54:23 +0000
Date: Thu, 6 Jul 2023 19:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.10.y 224/757] ld:
 warning: orphan section `.debug_rnglists' from `fs/f2fs/iostat.o' being
 placed in section `.debug_rnglists'
Message-ID: <202307061949.wto9gr12-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daeho,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.10.y
head:   aa1da5e725e58f84703aa2b66a717c15891cf67f
commit: d20508aceea5646b6855617cbd4ff2b0e7d18b63 [224/757] f2fs: separate out iostat feature
config: x86_64-randconfig-x003-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061949.wto9gr12-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061949.wto9gr12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061949.wto9gr12-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/namei.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/namei.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/page.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/page.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/mdt.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/mdt.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/btnode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/btnode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/bmap.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/bmap.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/nilfs2/btree.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/nilfs2/btree.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/debug.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/debug.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/xattr.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/xattr.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/acl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/acl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/verity.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/verity.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/compress.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/compress.o' being placed in section `.debug_line_str'
>> ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/iostat.o' being placed in section `.debug_rnglists'
>> ld: warning: orphan section `.debug_line_str' from `fs/f2fs/iostat.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/vboxsf/dir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/vboxsf/dir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/vboxsf/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/vboxsf/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/vboxsf/utils.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/vboxsf/utils.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/vboxsf/vboxsf_wrappers.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/vboxsf/vboxsf_wrappers.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/vboxsf/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/vboxsf/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/mqueue.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/mqueue.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `ipc/msgutil.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `ipc/msgutil.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `security/keys/compat_dh.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/compat_dh.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/proc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/proc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `security/keys/sysctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/dh.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/dh.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `security/lsm_audit.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/lsm_audit.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/device_cgroup.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/device_cgroup.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/integrity/iint.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/integrity/iint.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/integrity/integrity_audit.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/integrity/integrity_audit.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/api.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/api.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/cipher.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/cipher.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/compress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/memneq.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/algapi.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/algapi.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/scatterwalk.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/scatterwalk.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/proc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/proc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/aead.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/aead.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/geniv.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/geniv.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/skcipher.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/skcipher.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/seqiv.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/seqiv.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/echainiv.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/echainiv.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/ahash.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/ahash.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/shash.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/shash.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/akcipher.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/akcipher.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/kpp.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/kpp.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/dh.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/dh.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/dh_helper.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/dh_helper.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsapubkey.asn1.o' being placed in section `.debug_line_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
