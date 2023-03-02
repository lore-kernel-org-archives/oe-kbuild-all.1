Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9BD524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677790177; x=1709326177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmPWPKAFOzjI3NZuEmMBFGzwrCeaANejgvMzMz3YtO0=;
  b=Lvx+jvSvdKoHONHYbfr0Ik7QOFkD2eBBRLM8EDtM0D1WwxKDwYsL/PMs
   QSw6L7PqJRrZKYsSaYUMf4bi/+p55aye7WmFSmhlL16nRwAnl/bqw+UwV
   3k4qV/kaislFjZiPsdG30xV29RfO3YzVElucgKukqYsUkY49XzoySneIt
   dIum1eW1RyVFWamXgMdFiOa+cWBOgWNIMopFNflG/tFKnRhrcslHcXQXu
   IfE8wKG81X5o+eMzivU6eYPvNt6BHxoHJsT/msB1flHbDWJc5pTnXhaBx
   dK6n5Oc76YMUQp9TphbiK+f15t5CG00g5TTHzh26dZsg91axqNi/42WTI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337164232"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="337164232"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739251357"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="739251357"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 12:49:33 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXprp-0000sK-0C;
	Thu, 02 Mar 2023 20:49:33 +0000
Date: Fri, 3 Mar 2023 04:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.10.y 224/658] ld:
 warning: orphan section `.debug_rnglists' from `fs/f2fs/iostat.o' being
 placed in section `.debug_rnglists'
Message-ID: <202303030451.omTCmRgh-lkp@intel.com>
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
head:   96c28582d8552c93401eab0b17b0e38a698d6db5
commit: d20508aceea5646b6855617cbd4ff2b0e7d18b63 [224/658] f2fs: separate out iostat feature
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230303/202303030451.omTCmRgh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.10.y
        git checkout d20508aceea5646b6855617cbd4ff2b0e7d18b63
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030451.omTCmRgh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: orphan section `.debug_rnglists' from `fs/autofs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/autofs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/autofs/root.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/autofs/root.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/autofs/symlink.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/autofs/symlink.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/autofs/waitq.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/autofs/waitq.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/autofs/expire.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/autofs/expire.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/autofs/dev-ioctl.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/autofs/dev-ioctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/namei.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/namei.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/util.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/util.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/dir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/dir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/readdir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/readdir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/copy_up.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/copy_up.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/overlayfs/export.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/overlayfs/export.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/balloc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/balloc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/dir.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/dir.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/file.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/file.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/ialloc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/ialloc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/inode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/inode.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/lowlevel.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/namei.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/namei.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/partition.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/partition.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/super.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/super.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/truncate.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/truncate.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/symlink.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/symlink.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/directory.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/directory.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/misc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/misc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/udftime.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `fs/udf/unicode.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `fs/udf/unicode.o' being placed in section `.debug_line_str'
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
>> ld: warning: orphan section `.debug_rnglists' from `fs/f2fs/iostat.o' being placed in section `.debug_rnglists'
>> ld: warning: orphan section `.debug_line_str' from `fs/f2fs/iostat.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `security/keys/compat.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/compat.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/proc.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/proc.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `security/keys/sysctl.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/keys/keyctl_pkey.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/keys/keyctl_pkey.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/commoncap.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/commoncap.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/min_addr.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/min_addr.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/security.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/security.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/lsm_audit.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/lsm_audit.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `security/device_cgroup.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `security/integrity/iint.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `security/integrity/iint.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/api.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/api.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/cipher.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/cipher.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/compress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/memneq.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/crypto_engine.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/crypto_engine.o' being placed in section `.debug_line_str'
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
   ld: warning: orphan section `.debug_rnglists' from `crypto/dh.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/dh.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/dh_helper.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/dh_helper.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsapubkey.asn1.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsaprivkey.asn1.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/rsa.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsa.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsa_helper.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/rsa-pkcs1pad.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/rsa-pkcs1pad.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/acompress.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/acompress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/scompress.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/scompress.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/algboss.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/algboss.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_line_str' from `crypto/testmgr.o' being placed in section `.debug_line_str'
   ld: warning: orphan section `.debug_rnglists' from `crypto/hmac.o' being placed in section `.debug_rnglists'
   ld: warning: orphan section `.debug_line_str' from `crypto/hmac.o' being placed in section `.debug_line_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
