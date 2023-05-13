Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DAA4C6B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 18:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684001657; x=1715537657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEcEblRmSG64+ThCq2FF44raWG1qq9n53F1RYHCItak=;
  b=hJYD0JFtCug2SO3FpgmKcSDVSjWy0vHZw4r1akbwX3pQDaPGuMRugxNe
   hfBvrryTjeXvcivxK5ZScIeLB6l6sZ7ux2zsh4Ra9kuTzrpVwJ491jL9B
   6zZ2JueCZg817d/sFJRTeFhsRV7EU6XRyZHP7hfym0YMbjnTLXNhgsrGk
   EigQBYS54uYfUSasYJ6obN/rNO3UkUJCHNbs39BsUS9Z3lPxhwdb6JwT9
   o6Afy0fMyv2GjS1n7FxZxt/dVam+ErFfFT1JeO5j7iXnKAocJHf3JStY+
   0yNYXEoO9SpAVKLZ6vjMY4pEV7Mkop5tDoBhhxgRDdn63h6PRsWdDopud
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330595681"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="330595681"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 11:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="765492157"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="765492157"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 May 2023 11:14:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxtl0-0005d6-24;
	Sat, 13 May 2023 18:14:14 +0000
Date: Sun, 14 May 2023 02:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>
Subject: [stable:linux-4.19.y 27/9999] fs/ubifs/ioctl.c:174: Error:
 unrecognized opcode `csrs sstatus,a3'
Message-ID: <202305140230.7MbEpzXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: 08ae5ec4be5a6d9e97bebb93d916d666e1763572 [27/9999] ubifs: Reject unsupported ioctl flags explicitly
config: riscv-randconfig-r006-20230511 (https://download.01.org/0day-ci/archive/20230514/202305140230.7MbEpzXY-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=08ae5ec4be5a6d9e97bebb93d916d666e1763572
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 08ae5ec4be5a6d9e97bebb93d916d666e1763572
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=fs/ubifs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140230.7MbEpzXY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ubifs/ioctl.c: Assembler messages:
>> fs/ubifs/ioctl.c:174: Error: unrecognized opcode `csrs sstatus,a3'
>> fs/ubifs/ioctl.c:174: Error: unrecognized opcode `csrc sstatus,a3'
   fs/ubifs/ioctl.c:165: Error: unrecognized opcode `csrs sstatus,a5'
   fs/ubifs/ioctl.c:165: Error: unrecognized opcode `csrc sstatus,a5'


vim +174 fs/ubifs/ioctl.c

1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  154  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  155  long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  156  {
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  157  	int flags, err;
496ad9aa8ef4480 Al Viro            2013-01-23  158  	struct inode *inode = file_inode(file);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  159  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  160  	switch (cmd) {
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  161  	case FS_IOC_GETFLAGS:
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  162  		flags = ubifs2ioctl(ubifs_inode(inode)->flags);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  163  
a9f2fc0e251e71a Artem Bityutskiy   2008-12-23  164  		dbg_gen("get flags: %#x, i_flags %#x", flags, inode->i_flags);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  165  		return put_user(flags, (int __user *) arg);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  166  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  167  	case FS_IOC_SETFLAGS: {
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  168  		if (IS_RDONLY(inode))
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  169  			return -EROFS;
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  170  
2e1496707560ecf Serge E. Hallyn    2011-03-23  171  		if (!inode_owner_or_capable(inode))
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  172  			return -EACCES;
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  173  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14 @174  		if (get_user(flags, (int __user *) arg))
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  175  			return -EFAULT;
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  176  
08ae5ec4be5a6d9 Hou Tao            2019-02-09  177  		if (flags & ~UBIFS_SUPPORTED_IOCTL_FLAGS)
08ae5ec4be5a6d9 Hou Tao            2019-02-09  178  			return -EOPNOTSUPP;
08ae5ec4be5a6d9 Hou Tao            2019-02-09  179  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  180  		if (!S_ISDIR(inode->i_mode))
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  181  			flags &= ~FS_DIRSYNC_FL;
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  182  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  183  		/*
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  184  		 * Make sure the file-system is read-write and make sure it
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  185  		 * will not become read-only while we are changing the flags.
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  186  		 */
a561be7100cd610 Al Viro            2011-11-23  187  		err = mnt_want_write_file(file);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  188  		if (err)
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  189  			return err;
a9f2fc0e251e71a Artem Bityutskiy   2008-12-23  190  		dbg_gen("set flags: %#x, i_flags %#x", flags, inode->i_flags);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  191  		err = setflags(inode, flags);
2a79f17e4a641a2 Al Viro            2011-12-09  192  		mnt_drop_write_file(file);
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  193  		return err;
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  194  	}
d475a507457b5ca Richard Weinberger 2016-10-20  195  	case FS_IOC_SET_ENCRYPTION_POLICY: {
d475a507457b5ca Richard Weinberger 2016-10-20  196  #ifdef CONFIG_UBIFS_FS_ENCRYPTION
e021986ee4119e4 Richard Weinberger 2016-10-19  197  		struct ubifs_info *c = inode->i_sb->s_fs_info;
d475a507457b5ca Richard Weinberger 2016-10-20  198  
e021986ee4119e4 Richard Weinberger 2016-10-19  199  		err = ubifs_enable_encryption(c);
e021986ee4119e4 Richard Weinberger 2016-10-19  200  		if (err)
e021986ee4119e4 Richard Weinberger 2016-10-19  201  			return err;
e021986ee4119e4 Richard Weinberger 2016-10-19  202  
ec9160dacdb08ea Richard Weinberger 2016-12-13  203  		return fscrypt_ioctl_set_policy(file, (const void __user *)arg);
d475a507457b5ca Richard Weinberger 2016-10-20  204  #else
d475a507457b5ca Richard Weinberger 2016-10-20  205  		return -EOPNOTSUPP;
d475a507457b5ca Richard Weinberger 2016-10-20  206  #endif
d475a507457b5ca Richard Weinberger 2016-10-20  207  	}
d475a507457b5ca Richard Weinberger 2016-10-20  208  	case FS_IOC_GET_ENCRYPTION_POLICY: {
d475a507457b5ca Richard Weinberger 2016-10-20  209  #ifdef CONFIG_UBIFS_FS_ENCRYPTION
ec9160dacdb08ea Richard Weinberger 2016-12-13  210  		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
d475a507457b5ca Richard Weinberger 2016-10-20  211  #else
d475a507457b5ca Richard Weinberger 2016-10-20  212  		return -EOPNOTSUPP;
d475a507457b5ca Richard Weinberger 2016-10-20  213  #endif
d475a507457b5ca Richard Weinberger 2016-10-20  214  	}
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  215  
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  216  	default:
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  217  		return -ENOTTY;
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  218  	}
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  219  }
1e51764a3c2ac05 Artem Bityutskiy   2008-07-14  220  

:::::: The code at line 174 was first introduced by commit
:::::: 1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d UBIFS: add new flash file system

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
