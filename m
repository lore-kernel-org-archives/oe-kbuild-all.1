Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A23233
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 08:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678351821; x=1709887821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ku51Pa4Ui6a6sQeyUMqUe2cjg4dnQ1N2J3QTsfYlpMI=;
  b=Yf34H65XEukKqIOLLu3J7mjvH1ZQ/nHiMTfYAtcsDiaixIFInznxocVj
   IhO8tlDndqQ15DMk4oqD49DneFoTl8OZmcD+faGIHScVQdfGer6rlHeb+
   kxQqJGcfjWDatAW+tI32/W2ikiEz21xHDRo37GuSKHXlxonOm51MhcCND
   KJmKrHn4TmyhnTTP3CNlDkXOUGb4qR53+P4lsuUDXTQzHKLqQk5rH2gCU
   7RZMD+wOyFE/02EqdXm19R3Xx7V9x5ZgpJTaAuYbB/1EBSYCPMtLM5UVz
   bFXzDWDjOaShfQowfBIf5xDazAt39ym1Fn7L1zuleTfDEUqiejVNdhoH/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="364031702"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="364031702"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707525167"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="707525167"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2023 00:50:17 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBya-0002oj-2O;
	Thu, 09 Mar 2023 08:50:16 +0000
Date: Thu, 9 Mar 2023 16:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>
Subject: [stable:linux-4.19.y 2224/5333] fs/ubifs/ioctl.c:175: Error:
 unrecognized opcode `csrs sstatus,a2'
Message-ID: <202303091607.Cc3k9tWi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   5504146b2053f842426834d275002974109f39a6
commit: b98a46d053339fa482c7cf9a71b18fbbe8091489 [2224/5333] ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
config: riscv-randconfig-c024-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091607.Cc3k9tWi-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b98a46d053339fa482c7cf9a71b18fbbe8091489
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout b98a46d053339fa482c7cf9a71b18fbbe8091489
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/ubifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091607.Cc3k9tWi-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ubifs/ioctl.c: Assembler messages:
   fs/ubifs/ioctl.c:166: Error: unrecognized opcode `csrs sstatus,a5'
   fs/ubifs/ioctl.c:166: Error: unrecognized opcode `csrc sstatus,a5'
>> fs/ubifs/ioctl.c:175: Error: unrecognized opcode `csrs sstatus,a2'
>> fs/ubifs/ioctl.c:175: Error: unrecognized opcode `csrc sstatus,a2'


vim +175 fs/ubifs/ioctl.c

1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  155  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  156  long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  157  {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  158  	int flags, err;
496ad9aa8ef448 Al Viro            2013-01-23  159  	struct inode *inode = file_inode(file);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  160  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  161  	switch (cmd) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  162  	case FS_IOC_GETFLAGS:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  163  		flags = ubifs2ioctl(ubifs_inode(inode)->flags);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  164  
a9f2fc0e251e71 Artem Bityutskiy   2008-12-23  165  		dbg_gen("get flags: %#x, i_flags %#x", flags, inode->i_flags);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  166  		return put_user(flags, (int __user *) arg);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  167  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  168  	case FS_IOC_SETFLAGS: {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  169  		if (IS_RDONLY(inode))
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  170  			return -EROFS;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  171  
2e1496707560ec Serge E. Hallyn    2011-03-23  172  		if (!inode_owner_or_capable(inode))
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  173  			return -EACCES;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  174  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14 @175  		if (get_user(flags, (int __user *) arg))
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  176  			return -EFAULT;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  177  
08ae5ec4be5a6d Hou Tao            2019-02-09  178  		if (flags & ~UBIFS_SUPPORTED_IOCTL_FLAGS)
08ae5ec4be5a6d Hou Tao            2019-02-09  179  			return -EOPNOTSUPP;
08ae5ec4be5a6d Hou Tao            2019-02-09  180  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  181  		if (!S_ISDIR(inode->i_mode))
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  182  			flags &= ~FS_DIRSYNC_FL;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  183  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  184  		/*
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  185  		 * Make sure the file-system is read-write and make sure it
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  186  		 * will not become read-only while we are changing the flags.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  187  		 */
a561be7100cd61 Al Viro            2011-11-23  188  		err = mnt_want_write_file(file);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  189  		if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  190  			return err;
a9f2fc0e251e71 Artem Bityutskiy   2008-12-23  191  		dbg_gen("set flags: %#x, i_flags %#x", flags, inode->i_flags);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  192  		err = setflags(inode, flags);
2a79f17e4a641a Al Viro            2011-12-09  193  		mnt_drop_write_file(file);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  194  		return err;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  195  	}
d475a507457b5c Richard Weinberger 2016-10-20  196  	case FS_IOC_SET_ENCRYPTION_POLICY: {
d475a507457b5c Richard Weinberger 2016-10-20  197  #ifdef CONFIG_UBIFS_FS_ENCRYPTION
e021986ee4119e Richard Weinberger 2016-10-19  198  		struct ubifs_info *c = inode->i_sb->s_fs_info;
d475a507457b5c Richard Weinberger 2016-10-20  199  
e021986ee4119e Richard Weinberger 2016-10-19  200  		err = ubifs_enable_encryption(c);
e021986ee4119e Richard Weinberger 2016-10-19  201  		if (err)
e021986ee4119e Richard Weinberger 2016-10-19  202  			return err;
e021986ee4119e Richard Weinberger 2016-10-19  203  
ec9160dacdb08e Richard Weinberger 2016-12-13  204  		return fscrypt_ioctl_set_policy(file, (const void __user *)arg);
d475a507457b5c Richard Weinberger 2016-10-20  205  #else
d475a507457b5c Richard Weinberger 2016-10-20  206  		return -EOPNOTSUPP;
d475a507457b5c Richard Weinberger 2016-10-20  207  #endif
d475a507457b5c Richard Weinberger 2016-10-20  208  	}
d475a507457b5c Richard Weinberger 2016-10-20  209  	case FS_IOC_GET_ENCRYPTION_POLICY: {
d475a507457b5c Richard Weinberger 2016-10-20  210  #ifdef CONFIG_UBIFS_FS_ENCRYPTION
ec9160dacdb08e Richard Weinberger 2016-12-13  211  		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
d475a507457b5c Richard Weinberger 2016-10-20  212  #else
d475a507457b5c Richard Weinberger 2016-10-20  213  		return -EOPNOTSUPP;
d475a507457b5c Richard Weinberger 2016-10-20  214  #endif
d475a507457b5c Richard Weinberger 2016-10-20  215  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  216  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  217  	default:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  218  		return -ENOTTY;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  219  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  220  }
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  221  

:::::: The code at line 175 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
