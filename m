Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E3CF9DA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600075; cv=none; b=tzvjaiL9hHBTROf1b71BeKt5SOnI9ayI4d5/QPdXb5JGYaz2n4tN2kOKg8G6gbaW5jiF14FGiaevIFZX8trkoJUT6+oxmCr1nurJqz+qN/4W30qEvUvl36tAxcE87A7Y8RbfpBiizSABiw2C9daq4PLvI1YmS9leWJ0lL1oNSEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600075; c=relaxed/simple;
	bh=wuTkaSo3Qj6XjjUPHSKNOzcSXfGoyQkdNPaydpr6pCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAupwdT+3OEfrhqFd+Ia3nrMYuvpaqa3/ADX/BplEyEwPgdUC8MaoUg0gAtke989tSWZ0G9Y3lki26C16uj0YH14191S/l3tnrGiurhYgcm74jTLxJYYhDYOpiZIBbjiNTVW1sIpOw5iZNzq5DYl3dmyT+YvRO1c565+x0QFVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/5sXhlh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/5sXhlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709600074; x=1741136074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wuTkaSo3Qj6XjjUPHSKNOzcSXfGoyQkdNPaydpr6pCA=;
  b=S/5sXhlhMDrkswpZeb8g+32nRHo09eZFwv88ucuph5IUJyhRxjLdmFGP
   uJEr3sp73k+XxmOa8Th0NVh0VkhHxPUGiawElwE6ASSaeE1KKLwDacCg/
   DQEFnVjWLVh3v+wPgenjhh0DWOxT5ulP/QeZxkWcmX5wXF02guhavj0MR
   SHCnqSIE32EYTl9neo5VdgUCKRQpEvshRvA3tktB8Vv/DlDo7h4mPzhAT
   SO78wp5PhzzHvcMRWUdGYMBKWrcFxS0txSSH7G/wts8FutgsYAFX+EN8l
   KfpWx0oiw9JOAQ58GPXbeqMREjii8c9ncSTFX8IYKATIxn5UZ5gi0/T+0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15529856"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15529856"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9137071"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 16:54:26 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJ4Z-0002rz-1e;
	Tue, 05 Mar 2024 00:54:23 +0000
Date: Tue, 5 Mar 2024 08:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.mount.api 3/3] fs/openpromfs/inode.c:417:27: error:
 'openpromfs_reconfigure' undeclared here (not in a function); did you mean
 'openprom_reconfigure'?
Message-ID: <202403050807.RSK5Px2v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount.api
head:   0540b5e5fc1fb89be71af08ddfc7c21a22828ec5
commit: 0540b5e5fc1fb89be71af08ddfc7c21a22828ec5 [3/3] openpromfs: finish conversion to the new mount API
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050807.RSK5Px2v-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050807.RSK5Px2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050807.RSK5Px2v-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/openpromfs/inode.c:417:27: error: 'openpromfs_reconfigure' undeclared here (not in a function); did you mean 'openprom_reconfigure'?
     417 |         .reconfigure    = openpromfs_reconfigure,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
         |                           openprom_reconfigure
>> fs/openpromfs/inode.c:358:12: warning: 'openprom_reconfigure' defined but not used [-Wunused-function]
     358 | static int openprom_reconfigure(struct fs_context *fc)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +417 fs/openpromfs/inode.c

   357	
 > 358	static int openprom_reconfigure(struct fs_context *fc)
   359	{
   360		sync_filesystem(fc->root->d_sb);
   361		fc->sb_flags |= SB_NOATIME;
   362		return 0;
   363	}
   364	
   365	static const struct super_operations openprom_sops = {
   366		.alloc_inode	= openprom_alloc_inode,
   367		.free_inode	= openprom_free_inode,
   368		.statfs		= simple_statfs,
   369	};
   370	
   371	static int openprom_fill_super(struct super_block *s, struct fs_context *fc)
   372	{
   373		struct inode *root_inode;
   374		struct op_inode_info *oi;
   375		int ret;
   376	
   377		s->s_flags |= SB_NOATIME;
   378		s->s_blocksize = 1024;
   379		s->s_blocksize_bits = 10;
   380		s->s_magic = OPENPROM_SUPER_MAGIC;
   381		s->s_op = &openprom_sops;
   382		s->s_time_gran = 1;
   383		root_inode = openprom_iget(s, OPENPROM_ROOT_INO);
   384		if (IS_ERR(root_inode)) {
   385			ret = PTR_ERR(root_inode);
   386			goto out_no_root;
   387		}
   388	
   389		simple_inode_init_ts(root_inode);
   390		root_inode->i_op = &openprom_inode_operations;
   391		root_inode->i_fop = &openprom_operations;
   392		root_inode->i_mode = S_IFDIR | S_IRUGO | S_IXUGO;
   393		oi = OP_I(root_inode);
   394		oi->type = op_inode_node;
   395		oi->u.node = of_find_node_by_path("/");
   396		unlock_new_inode(root_inode);
   397	
   398		s->s_root = d_make_root(root_inode);
   399		if (!s->s_root)
   400			goto out_no_root_dentry;
   401		return 0;
   402	
   403	out_no_root_dentry:
   404		ret = -ENOMEM;
   405	out_no_root:
   406		printk("openprom_fill_super: get root inode failed\n");
   407		return ret;
   408	}
   409	
   410	static int openpromfs_get_tree(struct fs_context *fc)
   411	{
   412		return get_tree_single(fc, openprom_fill_super);
   413	}
   414	
   415	static const struct fs_context_operations openpromfs_context_ops = {
   416		.get_tree	= openpromfs_get_tree,
 > 417		.reconfigure	= openpromfs_reconfigure,
   418	};
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
