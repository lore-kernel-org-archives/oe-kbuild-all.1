Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61D23C6A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687476231; x=1719012231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tB9biJbGhlYUNNP749DkoBb6kUPhjam5CU9I7VeKhCM=;
  b=JF7Dp+AV7zB2GOLwFBxb/T8BxDl+LT90BGXIYYyVtNSs5EhTjZKhj+v+
   gmP/nUjfPulX1IqxSR20rVOuUvHcBKExwkfCr3w+UjyGEwRotaCGB/0sS
   +cFmeWjV1+/TGEyqtXM9ilYlUEqhAV7qjJJOzbO+Y1W+eDXyhcds8SjOW
   2lDcC/GT+zyUAochr8xYqi+IfH5lXn4MpTaNJz1S1uhpXsLBC9LdeQJnx
   Fj3etJZBmTnUmnWAKRYgigFMuwrqYGy6aAW53wXe0Sw/BOgI64NQxUh/I
   hyfDR3leSQ1dMt4GOct0Qa1Z6p5YsjvFncPuU55XDkiYIdSU546k0jGAB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390509514"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="390509514"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="889265509"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="889265509"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Jun 2023 16:23:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCTeW-0007ol-0H;
	Thu, 22 Jun 2023 23:23:48 +0000
Date: Fri, 23 Jun 2023 07:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime.2 18/30] fs/orangefs/namei.c:424:38: error: 'struct
 inode' has no member named 'i_ctime'; did you mean 'i_atime'?
Message-ID: <202306230704.ntkIcJol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime.2
head:   5b9567fb85f565a8040b60442ba1ab492f90f555
commit: 39526ea50940d2e1fb34b10cf70d775ecf32e684 [18/30] fs: rename i_ctime field to __i_ctime
config: nios2-randconfig-r035-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230704.ntkIcJol-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230704.ntkIcJol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230704.ntkIcJol-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/orangefs/namei.c: In function 'orangefs_rename':
>> fs/orangefs/namei.c:424:38: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     424 |                 new_dentry->d_inode->i_ctime = current_time(new_dentry->d_inode);
         |                                      ^~~~~~~
         |                                      i_atime
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/namei.c:12:
   fs/orangefs/orangefs-debug.h: At top level:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +424 fs/orangefs/namei.c

274dcf55bd4ab1 Mike Marshall      2015-07-17  377  
e18275ae55e07a Christian Brauner  2023-01-13  378  static int orangefs_rename(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner  2021-01-21  379  			struct inode *old_dir,
274dcf55bd4ab1 Mike Marshall      2015-07-17  380  			struct dentry *old_dentry,
274dcf55bd4ab1 Mike Marshall      2015-07-17  381  			struct inode *new_dir,
1cd66c93ba8cdb Miklos Szeredi     2016-09-27  382  			struct dentry *new_dentry,
1cd66c93ba8cdb Miklos Szeredi     2016-09-27  383  			unsigned int flags)
274dcf55bd4ab1 Mike Marshall      2015-07-17  384  {
8bb8aefd5afb54 Yi Liu             2015-11-24  385  	struct orangefs_kernel_op_s *new_op;
5e7f1d43380445 Martin Brandenburg 2018-02-12  386  	struct iattr iattr;
274dcf55bd4ab1 Mike Marshall      2015-07-17  387  	int ret;
274dcf55bd4ab1 Mike Marshall      2015-07-17  388  
1cd66c93ba8cdb Miklos Szeredi     2016-09-27  389  	if (flags)
1cd66c93ba8cdb Miklos Szeredi     2016-09-27  390  		return -EINVAL;
1cd66c93ba8cdb Miklos Szeredi     2016-09-27  391  
274dcf55bd4ab1 Mike Marshall      2015-07-17  392  	gossip_debug(GOSSIP_NAME_DEBUG,
96b0cffbafb467 Al Viro            2016-05-29  393  		     "orangefs_rename: called (%pd2 => %pd2) ct=%d\n",
96b0cffbafb467 Al Viro            2016-05-29  394  		     old_dentry, new_dentry, d_count(new_dentry));
274dcf55bd4ab1 Mike Marshall      2015-07-17  395  
5e7f1d43380445 Martin Brandenburg 2018-02-12  396  	memset(&iattr, 0, sizeof iattr);
afd9fb2a31797b Martin Brandenburg 2018-02-13  397  	iattr.ia_valid |= ATTR_MTIME | ATTR_CTIME;
afd9fb2a31797b Martin Brandenburg 2018-02-13  398  	iattr.ia_mtime = iattr.ia_ctime = current_time(new_dir);
afd9fb2a31797b Martin Brandenburg 2018-02-13  399  	__orangefs_setattr(new_dir, &iattr);
71680c18c8f22d Martin Brandenburg 2016-06-09  400  
8bb8aefd5afb54 Yi Liu             2015-11-24  401  	new_op = op_alloc(ORANGEFS_VFS_OP_RENAME);
274dcf55bd4ab1 Mike Marshall      2015-07-17  402  	if (!new_op)
274dcf55bd4ab1 Mike Marshall      2015-07-17  403  		return -EINVAL;
274dcf55bd4ab1 Mike Marshall      2015-07-17  404  
8bb8aefd5afb54 Yi Liu             2015-11-24  405  	new_op->upcall.req.rename.old_parent_refn = ORANGEFS_I(old_dir)->refn;
8bb8aefd5afb54 Yi Liu             2015-11-24  406  	new_op->upcall.req.rename.new_parent_refn = ORANGEFS_I(new_dir)->refn;
274dcf55bd4ab1 Mike Marshall      2015-07-17  407  
274dcf55bd4ab1 Mike Marshall      2015-07-17  408  	strncpy(new_op->upcall.req.rename.d_old_name,
274dcf55bd4ab1 Mike Marshall      2015-07-17  409  		old_dentry->d_name.name,
6bdfb48dae8e1b Xiongfeng Wang     2018-01-08  410  		ORANGEFS_NAME_MAX - 1);
274dcf55bd4ab1 Mike Marshall      2015-07-17  411  	strncpy(new_op->upcall.req.rename.d_new_name,
274dcf55bd4ab1 Mike Marshall      2015-07-17  412  		new_dentry->d_name.name,
6bdfb48dae8e1b Xiongfeng Wang     2018-01-08  413  		ORANGEFS_NAME_MAX - 1);
274dcf55bd4ab1 Mike Marshall      2015-07-17  414  
274dcf55bd4ab1 Mike Marshall      2015-07-17  415  	ret = service_operation(new_op,
8bb8aefd5afb54 Yi Liu             2015-11-24  416  				"orangefs_rename",
274dcf55bd4ab1 Mike Marshall      2015-07-17  417  				get_interruptible_flag(old_dentry->d_inode));
274dcf55bd4ab1 Mike Marshall      2015-07-17  418  
274dcf55bd4ab1 Mike Marshall      2015-07-17  419  	gossip_debug(GOSSIP_NAME_DEBUG,
8bb8aefd5afb54 Yi Liu             2015-11-24  420  		     "orangefs_rename: got downcall status %d\n",
274dcf55bd4ab1 Mike Marshall      2015-07-17  421  		     ret);
274dcf55bd4ab1 Mike Marshall      2015-07-17  422  
274dcf55bd4ab1 Mike Marshall      2015-07-17  423  	if (new_dentry->d_inode)
c2050a454c7f12 Deepa Dinamani     2016-09-14 @424  		new_dentry->d_inode->i_ctime = current_time(new_dentry->d_inode);
274dcf55bd4ab1 Mike Marshall      2015-07-17  425  
274dcf55bd4ab1 Mike Marshall      2015-07-17  426  	op_release(new_op);
274dcf55bd4ab1 Mike Marshall      2015-07-17  427  	return ret;
274dcf55bd4ab1 Mike Marshall      2015-07-17  428  }
274dcf55bd4ab1 Mike Marshall      2015-07-17  429  

:::::: The code at line 424 was first introduced by commit
:::::: c2050a454c7f123d7a57fa1d76ff61bd43643abb fs: Replace current_fs_time() with current_time()

:::::: TO: Deepa Dinamani <deepa.kernel@gmail.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
