Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0301C28EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681225775; x=1712761775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OfE8LZYaidiRnsR47FVeG9AtUrWZHKX8WBBuHra3QI=;
  b=FeySDAO+O7AObpd8y5sVvpCIKoHE4VN9F7BJQBAJpGtlq4WXvLuD4cjz
   Ku+u9se3RsLnaqH5pJmnyWvqx+Eb19O0gSHzIDFdHW68sxr0fUVDITidZ
   TSoQxlgw7fnyJKGYI5AOEN+JaAYcHlpbx1Pp2+iheIZTB8VPijbhrS4c8
   WXKUr/KdT5QNo//5iWjxwmtboLIXQoIB2DWrz761hb8sfxrqgpbx6mVvU
   XA3QyWlYi61QH5R2WpoJYijGtR2Auju0HHLoR4otgAIi+uDlofDP8IpYo
   uFsxVOGN0UcZx6TcMZPaRxpLIf0jGnppVYW8nQkyM4CDPa1YayHFBXCc8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323275923"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323275923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 08:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="718990083"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="718990083"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Apr 2023 08:09:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmFcQ-000WQ5-0T;
	Tue, 11 Apr 2023 15:09:14 +0000
Date: Tue, 11 Apr 2023 23:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org
Subject: [xiang-erofs:dev-test 17/17] fs/erofs/inode.c:296: undefined
 reference to `z_erofs_aops'
Message-ID: <202304112232.IFr8fsS7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   64be79d41fc0aefc57b4127f949e9995e739398e
commit: 64be79d41fc0aefc57b4127f949e9995e739398e [17/17] erofs: get rid of z_erofs_fill_inode()
config: powerpc-randconfig-r022-20230410 (https://download.01.org/0day-ci/archive/20230411/202304112232.IFr8fsS7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/commit/?id=64be79d41fc0aefc57b4127f949e9995e739398e
        git remote add xiang-erofs https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
        git fetch --no-tags xiang-erofs dev-test
        git checkout 64be79d41fc0aefc57b4127f949e9995e739398e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112232.IFr8fsS7-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/erofs/inode.o: in function `erofs_fill_inode':
>> fs/erofs/inode.c:296: undefined reference to `z_erofs_aops'
>> powerpc-linux-ld: fs/erofs/inode.c:296: undefined reference to `z_erofs_aops'


vim +296 fs/erofs/inode.c

   245	
   246	static int erofs_fill_inode(struct inode *inode)
   247	{
   248		struct erofs_inode *vi = EROFS_I(inode);
   249		struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
   250		void *kaddr;
   251		unsigned int ofs;
   252		int err = 0;
   253	
   254		trace_erofs_fill_inode(inode);
   255	
   256		/* read inode base data from disk */
   257		kaddr = erofs_read_inode(&buf, inode, &ofs);
   258		if (IS_ERR(kaddr))
   259			return PTR_ERR(kaddr);
   260	
   261		/* setup the new inode */
   262		switch (inode->i_mode & S_IFMT) {
   263		case S_IFREG:
   264			inode->i_op = &erofs_generic_iops;
   265			if (erofs_inode_is_data_compressed(vi->datalayout))
   266				inode->i_fop = &generic_ro_fops;
   267			else
   268				inode->i_fop = &erofs_file_fops;
   269			break;
   270		case S_IFDIR:
   271			inode->i_op = &erofs_dir_iops;
   272			inode->i_fop = &erofs_dir_fops;
   273			inode_nohighmem(inode);
   274			break;
   275		case S_IFLNK:
   276			err = erofs_fill_symlink(inode, kaddr, ofs);
   277			if (err)
   278				goto out_unlock;
   279			inode_nohighmem(inode);
   280			break;
   281		case S_IFCHR:
   282		case S_IFBLK:
   283		case S_IFIFO:
   284		case S_IFSOCK:
   285			inode->i_op = &erofs_generic_iops;
   286			init_special_inode(inode, inode->i_mode, inode->i_rdev);
   287			goto out_unlock;
   288		default:
   289			err = -EFSCORRUPTED;
   290			goto out_unlock;
   291		}
   292	
   293		if (erofs_inode_is_data_compressed(vi->datalayout)) {
   294			if (!erofs_is_fscache_mode(inode->i_sb) &&
   295			    inode->i_sb->s_blocksize_bits == PAGE_SHIFT) {
 > 296				inode->i_mapping->a_ops = &z_erofs_aops;
   297				err = 0;
   298			} else {
   299				err = -EOPNOTSUPP;
   300			}
   301			goto out_unlock;
   302		}
   303		inode->i_mapping->a_ops = &erofs_raw_access_aops;
   304		mapping_set_large_folios(inode->i_mapping);
   305	#ifdef CONFIG_EROFS_FS_ONDEMAND
   306		if (erofs_is_fscache_mode(inode->i_sb))
   307			inode->i_mapping->a_ops = &erofs_fscache_access_aops;
   308	#endif
   309	
   310	out_unlock:
   311		erofs_put_metabuf(&buf);
   312		return err;
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
