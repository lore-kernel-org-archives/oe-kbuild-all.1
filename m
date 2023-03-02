Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FF10FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 19:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677784654; x=1709320654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtTu9ds3wetZTvRYG6sxH+PJHOUuXieapsM5mCyyM1o=;
  b=QQfzoff1O7m4updnJsNCWN+DKCe62453Lg3D8Tu6lWfaHEq5PznUblwy
   9qPzMAuB/CxqAC4gNR8tPUD05fUPNvwJsYi2X0LwBonezi5tXp+2HrTIc
   1ovu5d8KriUfUb5FtEwrnhsVQ7v9UTCOyJBC0o1VLenvs7Hzoe889WUtN
   YJI0oBGlKaTYh7YIGXH2fzshd5NCMXjQf7mKVIN9DvAAVsk6jY2AqQOFb
   ruOuCT3nCzZs0+edFOPpUkvC1QcYlxAHVLWwkqRmiJpdNP+h+3HpRnSQH
   8btj66XjshErjG6OrWpdgajNFr7whf82Xr32iCzQER0VglTQt23FMaEYN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337140602"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="337140602"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 11:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004267074"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="1004267074"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 11:17:30 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXoQj-0000o2-0x;
	Thu, 02 Mar 2023 19:17:29 +0000
Date: Fri, 3 Mar 2023 03:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.10.y 261/658] ld:
 warning: orphan section `.debug_rnglists' from `fs/erofs/pcpubuf.o' being
 placed in section `.debug_rnglists'
Message-ID: <202303030314.a6ZHPE2c-lkp@intel.com>
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
head:   96c28582d8552c93401eab0b17b0e38a698d6db5
commit: f1f52c7608b860a80dcec3dcfcc0861e5aaf95d3 [261/658] erofs: introduce multipage per-CPU buffers
config: i386-randconfig-a014 (https://download.01.org/0day-ci/archive/20230303/202303030314.a6ZHPE2c-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.10.y
        git checkout f1f52c7608b860a80dcec3dcfcc0861e5aaf95d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030314.a6ZHPE2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/dir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/dir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/xattr.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/xattr.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/glock.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/glock.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/glops.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/glops.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/log.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/log.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/lops.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/lops.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/main.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/main.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/meta_io.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/meta_io.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/aops.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/aops.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/dentry.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/dentry.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/export.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/export.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/ops_fstype.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/ops_fstype.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/quota.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/quota.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/recovery.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/recovery.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/rgrp.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/rgrp.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/sys.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/sys.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/trans.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/trans.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/gfs2/util.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/gfs2/util.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/xattr.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/xattr.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/acl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/acl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/verity.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/verity.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/compress.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/f2fs/compress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/efivarfs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/efivarfs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/efivarfs/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/efivarfs/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/efivarfs/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/efivarfs/super.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `security/keys/gc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/gc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/key.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/key.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/keyring.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/keyring.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/keyctl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/keyctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `security/keys/permission.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/process_keys.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/process_keys.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/request_key.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/request_key.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/request_key_auth.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/request_key_auth.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/user_defined.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/user_defined.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/proc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/proc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `security/keys/sysctl.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `crypto/ahash.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/ahash.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/shash.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/shash.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/akcipher.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/akcipher.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/kpp.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/kpp.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsapubkey.asn1.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsaprivkey.asn1.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/rsa.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsa.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsa_helper.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/rsa-pkcs1pad.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsa-pkcs1pad.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/sm2signature.asn1.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/sm2.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/sm2.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/acompress.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/acompress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/scompress.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/scompress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/algboss.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/algboss.o' being placed in section `.debug_line_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
