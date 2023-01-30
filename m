Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31829AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 21:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675112782; x=1706648782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1f5NC6KvRLJAVspICHJDjY1fdX8aKHaGELiYlCGw7sI=;
  b=MOimyKdzMvN84GCPa0cwXw1VkiBShLj/u29+5uBfvben7ps3eZcx7O7M
   sJLhMO0V7VSepX9XKtVZa6m02hi2msrr5PYTsnr5kTJ3OKnnzMrXhA8Nv
   sb8hSBInAJjpBfJUCWZt5kcuDSs+28LqMsg+rPosMc5bqzx5IsJqpqgrn
   uNzfaX2gcVAjLWf9z+iY11ttKDfd+Jw/6LIpGqTLLqL5uJsxGL+wPId4u
   KQUMC6yc1UAem7sbkl8nOLdOkKASUgGOjCnKDf+o4LDcNizVvYAGCyuI2
   9/w/dlbrbkxJg/45OQsLYJdEGXXKJ4IFe0lIpKtI5B/pzCZ0J6JrXT7S/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308019547"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="308019547"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 13:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="666225470"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="666225470"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jan 2023 13:06:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMbM3-0003uA-2V;
	Mon, 30 Jan 2023 21:06:19 +0000
Date: Tue, 31 Jan 2023 05:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Seth Forshee <sforshee@kernel.org>
Subject: [vfs-idmapping:b4/fs-acl-remove-generic-xattr-handlers 2/9]
 sysctl.c:(.text+0x14c4): multiple definition of `posix_acl_listxattr';
 init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
Message-ID: <202301310458.eweQwi4G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-acl-remove-generic-xattr-handlers
head:   d62ca8f8268fbd7f6e1c53dff832a4a46ef7ac2c
commit: b02a998708f0481423e28d34df82b07be9e05317 [2/9] xattr: simplify listxattr helpers
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230131/202301310458.eweQwi4G-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=b02a998708f0481423e28d34df82b07be9e05317
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping b4/fs-acl-remove-generic-xattr-handlers
        git checkout b02a998708f0481423e28d34df82b07be9e05317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/nfsacl.h:11,
                    from include/linux/nfs_xdr.h:5,
                    from include/linux/nfs_fs.h:38,
                    from init/do_mounts.c:22:
>> include/linux/posix_acl.h:158:5: warning: no previous prototype for 'posix_acl_listxattr' [-Wmissing-prototypes]
     158 | int posix_acl_listxattr(struct inode *inode, char **buffer,
         |     ^~~~~~~~~~~~~~~~~~~
--
   arc-elf-ld: kernel/sysctl.o: in function `posix_acl_listxattr':
>> sysctl.c:(.text+0x14c4): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: mm/shmem.o: in function `posix_acl_listxattr':
   shmem.c:(.text+0x370c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/namei.o: in function `posix_acl_listxattr':
   namei.c:(.text+0x47a8): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/inode.o: in function `posix_acl_listxattr':
   inode.c:(.text+0x2550): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/xattr.o: in function `posix_acl_listxattr':
   xattr.c:(.text+0x9f8): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/ext2/file.o: in function `posix_acl_listxattr':
   file.c:(.text+0x8c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/ext2/ialloc.o: in function `posix_acl_listxattr':
   ialloc.c:(.text+0x22c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/ext2/inode.o: in function `posix_acl_listxattr':
   inode.c:(.text+0x1620): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/ext2/namei.o: in function `posix_acl_listxattr':
   namei.c:(.text+0x828): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/ext2/super.o: in function `posix_acl_listxattr':
   super.c:(.text+0x52c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/ext2/xattr.o: in function `posix_acl_listxattr':
   xattr.c:(.text+0x78c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/client.o: in function `posix_acl_listxattr':
   client.c:(.text+0x1c64): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/dir.o: in function `posix_acl_listxattr':
   dir.c:(.text+0x3bc0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/file.o: in function `posix_acl_listxattr':
   file.c:(.text+0x11b0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/getroot.o: in function `posix_acl_listxattr':
   getroot.c:(.text+0x0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/inode.o: in function `posix_acl_listxattr':
   inode.c:(.text+0x2304): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/super.o: in function `posix_acl_listxattr':
   super.c:(.text+0x1494): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/io.o: in function `posix_acl_listxattr':
   io.c:(.text+0x2c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/direct.o: in function `posix_acl_listxattr':
   direct.c:(.text+0x11d0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/pagelist.o: in function `posix_acl_listxattr':
   pagelist.c:(.text+0xbdc): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/read.o: in function `posix_acl_listxattr':
   read.c:(.text+0x8b8): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/symlink.o: in function `posix_acl_listxattr':
   symlink.c:(.text+0x138): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/unlink.o: in function `posix_acl_listxattr':
   unlink.c:(.text+0x3a4): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/write.o: in function `posix_acl_listxattr':
   write.c:(.text+0x1d2c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/namespace.o: in function `posix_acl_listxattr':
   namespace.c:(.text+0x488): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/mount_clnt.o: in function `posix_acl_listxattr':
   mount_clnt.c:(.text+0x1e8): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfstrace.o: in function `posix_acl_listxattr':
   nfstrace.c:(.text+0x6b98): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/export.o: in function `posix_acl_listxattr':
   export.c:(.text+0x238): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/sysfs.o: in function `posix_acl_listxattr':
   sysfs.c:(.text+0xd0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/fs_context.o: in function `posix_acl_listxattr':
   fs_context.c:(.text+0x1588): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/sysctl.o: in function `posix_acl_listxattr':
   sysctl.c:(.text+0x0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfs2super.o: in function `posix_acl_listxattr':
   nfs2super.c:(.text+0x0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/proc.o: in function `posix_acl_listxattr':
   proc.c:(.text+0xce0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfs2xdr.o: in function `posix_acl_listxattr':
   nfs2xdr.c:(.text+0xb08): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfs3super.o: in function `posix_acl_listxattr':
   nfs3super.c:(.text+0x0): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfs3client.o: in function `posix_acl_listxattr':
   nfs3client.c:(.text+0x130): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfs3proc.o: in function `posix_acl_listxattr':
   nfs3proc.c:(.text+0xf1c): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/nfs/nfs3xdr.o: in function `posix_acl_listxattr':
   nfs3xdr.c:(.text+0x1640): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/lockd/clntlock.o: in function `posix_acl_listxattr':
   clntlock.c:(.text+0x240): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here
   arc-elf-ld: fs/lockd/clntproc.o: in function `posix_acl_listxattr':
   clntproc.c:(.text+0x584): multiple definition of `posix_acl_listxattr'; init/do_mounts.o:do_mounts.c:(.text+0x38c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
