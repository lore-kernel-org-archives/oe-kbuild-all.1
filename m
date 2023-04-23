Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5140E370
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682247429; x=1713783429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FmptGx7GTlvhJmxDKR6fcMvI82Zqt3ApJIIvDRUx80=;
  b=MZOEJ94ou+2KV022Zlr1i6wDDvLXCxlU7qLy9FbhZ/PessRT+SEVAKgW
   LXJDC3cuhNa/s1t8J4mavT2hW6Zb4mOARF7LlTj+83m9z4O55vYcl922I
   HEI64rMQEhwZVjs4jnzfvKghTrDsIbd3LYxw3R28Ntlp37ie0N35ntXNp
   +PGK58X6poQxJywrsBeuYhm/lcyLYdvU4JrY0or7dTMrZPCz75kaUbgv+
   /kDZ1r2maBCBAtaxpK6YwYtPQ5D7VE8QG8y82r/9t8P1Op4oywdHzxp0F
   Go5wgeMu6Fwxn1+OxPUPy+LHbj/HlL7Cx8crleLFzxHuW+wNRQTs/Vkp2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="346292494"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="346292494"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 03:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="762093759"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="762093759"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Apr 2023 03:57:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqXP1-000hr8-0s;
	Sun, 23 Apr 2023 10:57:07 +0000
Date: Sun, 23 Apr 2023 18:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:exportfs_encode_fid 1/5] fs/exportfs/expfs.c:384:19:
 error: use of undeclared identifier 'exportfs_encode_ino32_fh'; did you mean
 'exportfs_encode_inode_fh'?
Message-ID: <202304231820.fBvSuTUV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux exportfs_encode_fid
head:   bb00689c5acaa4e530780be87b78cec7a906e298
commit: 7f28e1e3124eb9e62dddde7feb827b27cdb74caa [1/5] exportfs: make ->encode_fh() a mandatory method
config: riscv-randconfig-r015-20230423 (https://download.01.org/0day-ci/archive/20230423/202304231820.fBvSuTUV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/amir73il/linux/commit/7f28e1e3124eb9e62dddde7feb827b27cdb74caa
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il exportfs_encode_fid
        git checkout 7f28e1e3124eb9e62dddde7feb827b27cdb74caa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231820.fBvSuTUV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/exportfs/expfs.c:384:19: error: use of undeclared identifier 'exportfs_encode_ino32_fh'; did you mean 'exportfs_encode_inode_fh'?
   EXPORT_SYMBOL_GPL(exportfs_encode_ino32_fh);
                     ^~~~~~~~~~~~~~~~~~~~~~~~
                     exportfs_encode_inode_fh
   include/linux/export.h:151:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
                                                          ^
   include/linux/export.h:147:50: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
                                                           ^
   include/linux/export.h:140:56: note: expanded from macro '__EXPORT_SYMBOL'
   #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
                                                            ^
   include/linux/export.h:87:16: note: expanded from macro '___EXPORT_SYMBOL'
           extern typeof(sym) sym;                                                 \
                         ^
   include/linux/exportfs.h:226:12: note: 'exportfs_encode_inode_fh' declared here
   extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
              ^
   1 error generated.


vim +384 fs/exportfs/expfs.c

   344	
   345	/**
   346	 * generic_encode_ino32_fh - generic export_operations->encode_fh function
   347	 * @inode:   the object to encode
   348	 * @fh:      where to store the file handle fragment
   349	 * @max_len: maximum length to store there
   350	 * @parent:  parent directory inode, if wanted
   351	 *
   352	 * This generic encode_fh function assumes that the 32 inode number
   353	 * is suitable for locating an inode, and that the generation number
   354	 * can be used to check that it is still valid.  It places them in the
   355	 * filehandle fragment where export_decode_fh expects to find them.
   356	 */
   357	int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
   358				    struct inode *parent)
   359	{
   360		struct fid *fid = (void *)fh;
   361		int len = *max_len;
   362		int type = FILEID_INO32_GEN;
   363	
   364		if (parent && (len < 4)) {
   365			*max_len = 4;
   366			return FILEID_INVALID;
   367		} else if (len < 2) {
   368			*max_len = 2;
   369			return FILEID_INVALID;
   370		}
   371	
   372		len = 2;
   373		fid->i32.ino = inode->i_ino;
   374		fid->i32.gen = inode->i_generation;
   375		if (parent) {
   376			fid->i32.parent_ino = parent->i_ino;
   377			fid->i32.parent_gen = parent->i_generation;
   378			len = 4;
   379			type = FILEID_INO32_GEN_PARENT;
   380		}
   381		*max_len = len;
   382		return type;
   383	}
 > 384	EXPORT_SYMBOL_GPL(exportfs_encode_ino32_fh);
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
