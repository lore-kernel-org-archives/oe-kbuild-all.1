Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA563ECF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 04:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdBf0F/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698639387; x=1730175387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0XKXzqC08zPy9LPLxnqiVhRGWsGtknoGSw+LisUgUQ=;
  b=OdBf0F/N4ucaLkaveZdRhsC3KpoKEMI+tmZILT08L6nN6NTzjkOlLmKr
   vvdG6QxNviMJz/HaMVrb0nrT0kHGAV7X+kOsBqBfarcTUob3eGSa1v/gF
   8XGm5o7t3pjs5jYmoFrGM0x/MHOpDAUJjpirjDeTRoKIhfYC1j8odq9nD
   8874izRPrhwJVk3QZ11ZdzjnGb7AAUfpuhbzt6Y9FhU4l5pgJ8XwNP53G
   eBLLi6YPrllKVyUetRec92e52cFkoCjOy2jRBTr83gTnUK8vkjBSCTXTD
   bMoChK7pwVqlPJQs3Ow7uWmsD53A+QhfE4s7kPT1oDQZ9TcUehzq+OOxC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="368224949"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="368224949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 21:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="795156675"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="795156675"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Oct 2023 21:16:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxJhP-000D2d-0n;
	Mon, 30 Oct 2023 04:16:23 +0000
Date: Mon, 30 Oct 2023 12:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/core 22/22] fs/tracefs/event_inode.c:187: warning:
 Function parameter or member 'attr' not described in 'create_file'
Message-ID: <202310301225.vJemUpaL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   ae395d53794e7057c9a756e26865549a6b1a0840
commit: ae395d53794e7057c9a756e26865549a6b1a0840 [22/22] eventfs: Save ownership and mode
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310301225.vJemUpaL-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301225.vJemUpaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301225.vJemUpaL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:187: warning: Function parameter or member 'attr' not described in 'create_file'
>> fs/tracefs/event_inode.c:231: warning: Function parameter or member 'ei' not described in 'create_dir'
>> fs/tracefs/event_inode.c:231: warning: Excess function parameter 'name' description in 'create_dir'
   fs/tracefs/event_inode.c:966: warning: Function parameter or member 'head' not described in 'eventfs_remove_rec'
   fs/tracefs/event_inode.c:966: warning: Function parameter or member 'level' not described in 'eventfs_remove_rec'


vim +187 fs/tracefs/event_inode.c

ae395d53794e70 Steven Rostedt (Google  2023-10-29  170) 
63940449555e79 Ajay Kaher              2023-07-28  171  /**
63940449555e79 Ajay Kaher              2023-07-28  172   * create_file - create a file in the tracefs filesystem
63940449555e79 Ajay Kaher              2023-07-28  173   * @name: the name of the file to create.
63940449555e79 Ajay Kaher              2023-07-28  174   * @mode: the permission that the file should have.
63940449555e79 Ajay Kaher              2023-07-28  175   * @parent: parent dentry for this file.
63940449555e79 Ajay Kaher              2023-07-28  176   * @data: something that the caller will want to get to later on.
63940449555e79 Ajay Kaher              2023-07-28  177   * @fop: struct file_operations that should be used for this file.
63940449555e79 Ajay Kaher              2023-07-28  178   *
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  179)  * This function creates a dentry that represents a file in the eventsfs_inode
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  180)  * directory. The inode.i_private pointer will point to @data in the open()
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  181)  * call.
63940449555e79 Ajay Kaher              2023-07-28  182   */
63940449555e79 Ajay Kaher              2023-07-28  183  static struct dentry *create_file(const char *name, umode_t mode,
ae395d53794e70 Steven Rostedt (Google  2023-10-29  184) 				  struct eventfs_attr *attr,
63940449555e79 Ajay Kaher              2023-07-28  185  				  struct dentry *parent, void *data,
63940449555e79 Ajay Kaher              2023-07-28  186  				  const struct file_operations *fop)
63940449555e79 Ajay Kaher              2023-07-28 @187  {
a3760079177765 Ajay Kaher              2023-07-28  188  	struct tracefs_inode *ti;
a3760079177765 Ajay Kaher              2023-07-28  189  	struct dentry *dentry;
a3760079177765 Ajay Kaher              2023-07-28  190  	struct inode *inode;
a3760079177765 Ajay Kaher              2023-07-28  191  
a3760079177765 Ajay Kaher              2023-07-28  192  	if (!(mode & S_IFMT))
a3760079177765 Ajay Kaher              2023-07-28  193  		mode |= S_IFREG;
a3760079177765 Ajay Kaher              2023-07-28  194  
a3760079177765 Ajay Kaher              2023-07-28  195  	if (WARN_ON_ONCE(!S_ISREG(mode)))
63940449555e79 Ajay Kaher              2023-07-28  196  		return NULL;
a3760079177765 Ajay Kaher              2023-07-28  197  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  198) 	WARN_ON_ONCE(!parent);
a3760079177765 Ajay Kaher              2023-07-28  199  	dentry = eventfs_start_creating(name, parent);
a3760079177765 Ajay Kaher              2023-07-28  200  
a3760079177765 Ajay Kaher              2023-07-28  201  	if (IS_ERR(dentry))
a3760079177765 Ajay Kaher              2023-07-28  202  		return dentry;
a3760079177765 Ajay Kaher              2023-07-28  203  
a3760079177765 Ajay Kaher              2023-07-28  204  	inode = tracefs_get_inode(dentry->d_sb);
a3760079177765 Ajay Kaher              2023-07-28  205  	if (unlikely(!inode))
a3760079177765 Ajay Kaher              2023-07-28  206  		return eventfs_failed_creating(dentry);
a3760079177765 Ajay Kaher              2023-07-28  207  
ae395d53794e70 Steven Rostedt (Google  2023-10-29  208) 	/* If the user updated the directory's attributes, use them */
ae395d53794e70 Steven Rostedt (Google  2023-10-29  209) 	update_inode_attr(inode, attr, mode);
ae395d53794e70 Steven Rostedt (Google  2023-10-29  210) 
ae395d53794e70 Steven Rostedt (Google  2023-10-29  211) 	inode->i_op = &eventfs_file_inode_operations;
a3760079177765 Ajay Kaher              2023-07-28  212  	inode->i_fop = fop;
a3760079177765 Ajay Kaher              2023-07-28  213  	inode->i_private = data;
a3760079177765 Ajay Kaher              2023-07-28  214  
a3760079177765 Ajay Kaher              2023-07-28  215  	ti = get_tracefs(inode);
a3760079177765 Ajay Kaher              2023-07-28  216  	ti->flags |= TRACEFS_EVENT_INODE;
a3760079177765 Ajay Kaher              2023-07-28  217  	d_instantiate(dentry, inode);
a3760079177765 Ajay Kaher              2023-07-28  218  	fsnotify_create(dentry->d_parent->d_inode, dentry);
a3760079177765 Ajay Kaher              2023-07-28  219  	return eventfs_end_creating(dentry);
c1504e51023847 Ajay Kaher              2023-07-28  220  };
c1504e51023847 Ajay Kaher              2023-07-28  221  
63940449555e79 Ajay Kaher              2023-07-28  222  /**
63940449555e79 Ajay Kaher              2023-07-28  223   * create_dir - create a dir in the tracefs filesystem
63940449555e79 Ajay Kaher              2023-07-28  224   * @name: the name of the file to create.
63940449555e79 Ajay Kaher              2023-07-28  225   * @parent: parent dentry for this file.
63940449555e79 Ajay Kaher              2023-07-28  226   *
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  227)  * This function will create a dentry for a directory represented by
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  228)  * a eventfs_inode.
63940449555e79 Ajay Kaher              2023-07-28  229   */
ae395d53794e70 Steven Rostedt (Google  2023-10-29  230) static struct dentry *create_dir(struct eventfs_inode *ei, struct dentry *parent)
63940449555e79 Ajay Kaher              2023-07-28 @231  {
a3760079177765 Ajay Kaher              2023-07-28  232  	struct tracefs_inode *ti;
a3760079177765 Ajay Kaher              2023-07-28  233  	struct dentry *dentry;
a3760079177765 Ajay Kaher              2023-07-28  234  	struct inode *inode;
a3760079177765 Ajay Kaher              2023-07-28  235  
ae395d53794e70 Steven Rostedt (Google  2023-10-29  236) 	dentry = eventfs_start_creating(ei->name, parent);
a3760079177765 Ajay Kaher              2023-07-28  237  	if (IS_ERR(dentry))
a3760079177765 Ajay Kaher              2023-07-28  238  		return dentry;
a3760079177765 Ajay Kaher              2023-07-28  239  
a3760079177765 Ajay Kaher              2023-07-28  240  	inode = tracefs_get_inode(dentry->d_sb);
a3760079177765 Ajay Kaher              2023-07-28  241  	if (unlikely(!inode))
a3760079177765 Ajay Kaher              2023-07-28  242  		return eventfs_failed_creating(dentry);
a3760079177765 Ajay Kaher              2023-07-28  243  
ae395d53794e70 Steven Rostedt (Google  2023-10-29  244) 	/* If the user updated the directory's attributes, use them */
ae395d53794e70 Steven Rostedt (Google  2023-10-29  245) 	update_inode_attr(inode, &ei->attr, S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO);
ae395d53794e70 Steven Rostedt (Google  2023-10-29  246) 
a3760079177765 Ajay Kaher              2023-07-28  247  	inode->i_op = &eventfs_root_dir_inode_operations;
a3760079177765 Ajay Kaher              2023-07-28  248  	inode->i_fop = &eventfs_file_operations;
a3760079177765 Ajay Kaher              2023-07-28  249  
a3760079177765 Ajay Kaher              2023-07-28  250  	ti = get_tracefs(inode);
a3760079177765 Ajay Kaher              2023-07-28  251  	ti->flags |= TRACEFS_EVENT_INODE;
a3760079177765 Ajay Kaher              2023-07-28  252  
a3760079177765 Ajay Kaher              2023-07-28  253  	inc_nlink(inode);
a3760079177765 Ajay Kaher              2023-07-28  254  	d_instantiate(dentry, inode);
a3760079177765 Ajay Kaher              2023-07-28  255  	inc_nlink(dentry->d_parent->d_inode);
a3760079177765 Ajay Kaher              2023-07-28  256  	fsnotify_mkdir(dentry->d_parent->d_inode, dentry);
a3760079177765 Ajay Kaher              2023-07-28  257  	return eventfs_end_creating(dentry);
63940449555e79 Ajay Kaher              2023-07-28  258  }
63940449555e79 Ajay Kaher              2023-07-28  259  

:::::: The code at line 187 was first introduced by commit
:::::: 63940449555e799d387f316993ad824476c16953 eventfs: Implement eventfs lookup, read, open functions

:::::: TO: Ajay Kaher <akaher@vmware.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
