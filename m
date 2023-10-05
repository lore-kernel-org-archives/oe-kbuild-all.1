Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1F1A580
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiBW6DJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696524105; x=1728060105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HbUG7Rv0Ju1W5Hclvy9ngdGEK4mpsOL5FNmIat5bcSg=;
  b=QiBW6DJNzzn0obTe6tpZ5bn4XtNMqjOyEw0CEQiXZVt/2qjkSSadsh7s
   JZriTPcaDOtWe1oy8PkizyvWRhrc7kOa2G7dWj60s+QUW/352SOKn/RME
   nCwVDvBoJb3iwKhR3Dp1mqZENDB/uMkB4MJL9l6fOK4NdwXan/IQWhqfS
   qo6gGY3wkW0ExfwNLWyOqiHnnZXnkBMg6TJCHRBND8+17PcYWBaZs7R3q
   +JXQegCbx1Qxd20Dv2P0FH+g/DMi6EbgWh1IzmQ0ETu2diehM6i7Mueno
   xEQBhENtr98s4nL9AryYvMap2i2QIR+rXUASNsdav485K/6GpZMKHu6A3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380832323"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="380832323"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 09:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="1083098623"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="1083098623"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Oct 2023 09:41:41 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoRPu-000LfC-33;
	Thu, 05 Oct 2023 16:41:38 +0000
Date: Fri, 6 Oct 2023 00:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 6/7] fs/tracefs/event_inode.c:909:6: warning:
 no previous declaration for 'eventfs_remove_events_dir'
Message-ID: <202310060017.E2IdM1Oz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   f5d9e8e08f81c9e7c723de7abcce106808f0770c
commit: 5790b1fb3d672d9a1fe3881a7181dfdbe741568f [6/7] eventfs: Remove eventfs_file and just use eventfs_inode
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060017.E2IdM1Oz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060017.E2IdM1Oz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060017.E2IdM1Oz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:909:6: warning: no previous declaration for 'eventfs_remove_events_dir' [-Wmissing-declarations]
    void eventfs_remove_events_dir(struct dentry *dentry)
         ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> kernel/trace/trace_events.c:2285:5: warning: no previous declaration for 'system_callback' [-Wmissing-declarations]
    int system_callback(const char *name, umode_t *mode, void **data,
        ^~~~~~~~~~~~~~~

smatch warnings:
fs/tracefs/event_inode.c:782 eventfs_create_events_dir() error: we previously assumed 'ei' could be null (see line 737)

vim +/eventfs_remove_events_dir +909 fs/tracefs/event_inode.c

c1504e51023847 Ajay Kaher              2023-07-28  710  
c1504e51023847 Ajay Kaher              2023-07-28  711  /**
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  712)  * eventfs_create_events_dir - create the top level events directory
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  713)  * @name: The name of the top level directory to create.
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  714)  * @parent: Parent dentry for this file in the tracefs directory.
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  715)  * @entries: A list of entries that represent the files under this directory
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  716)  * @size: The number of @entries
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  717)  * @data: The default data to pass to the files (an entry may override it).
c1504e51023847 Ajay Kaher              2023-07-28  718   *
c1504e51023847 Ajay Kaher              2023-07-28  719   * This function creates the top of the trace event directory.
c1504e51023847 Ajay Kaher              2023-07-28  720   */
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  721) struct eventfs_inode *eventfs_create_events_dir(const char *name, struct dentry *parent,
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  722) 						const struct eventfs_entry *entries,
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  723) 						int size, void *data)
c1504e51023847 Ajay Kaher              2023-07-28  724  {
c1504e51023847 Ajay Kaher              2023-07-28  725  	struct dentry *dentry = tracefs_start_creating(name, parent);
c1504e51023847 Ajay Kaher              2023-07-28  726  	struct eventfs_inode *ei;
c1504e51023847 Ajay Kaher              2023-07-28  727  	struct tracefs_inode *ti;
c1504e51023847 Ajay Kaher              2023-07-28  728  	struct inode *inode;
c1504e51023847 Ajay Kaher              2023-07-28  729  
e24709454c4582 Steven Rostedt (Google  2023-09-05  730) 	if (security_locked_down(LOCKDOWN_TRACEFS))
e24709454c4582 Steven Rostedt (Google  2023-09-05  731) 		return NULL;
e24709454c4582 Steven Rostedt (Google  2023-09-05  732) 
c1504e51023847 Ajay Kaher              2023-07-28  733  	if (IS_ERR(dentry))
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  734) 		return (struct eventfs_inode *)dentry;
c1504e51023847 Ajay Kaher              2023-07-28  735  
c1504e51023847 Ajay Kaher              2023-07-28  736  	ei = kzalloc(sizeof(*ei), GFP_KERNEL);
c1504e51023847 Ajay Kaher              2023-07-28 @737  	if (!ei)
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  738) 		goto fail;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  739) 
c1504e51023847 Ajay Kaher              2023-07-28  740  	inode = tracefs_get_inode(dentry->d_sb);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  741) 	if (unlikely(!inode))
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  742) 		goto fail;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  743) 
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  744) 	if (size) {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  745) 		ei->d_children = kzalloc(sizeof(*ei->d_children) * size, GFP_KERNEL);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  746) 		if (!ei->d_children)
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  747) 			goto fail;
c1504e51023847 Ajay Kaher              2023-07-28  748  	}
c1504e51023847 Ajay Kaher              2023-07-28  749  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  750) 	ei->dentry = dentry;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  751) 	ei->entries = entries;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  752) 	ei->nr_entries = size;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  753) 	ei->data = data;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  754) 	ei->name = kstrdup_const(name, GFP_KERNEL);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  755) 	if (!ei->name)
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  756) 		goto fail;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  757) 
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  758) 	INIT_LIST_HEAD(&ei->children);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  759) 	INIT_LIST_HEAD(&ei->list);
c1504e51023847 Ajay Kaher              2023-07-28  760  
c1504e51023847 Ajay Kaher              2023-07-28  761  	ti = get_tracefs(inode);
9879e5e1c528d1 Steven Rostedt (Google  2023-09-06  762) 	ti->flags |= TRACEFS_EVENT_INODE | TRACEFS_EVENT_TOP_INODE;
c1504e51023847 Ajay Kaher              2023-07-28  763  	ti->private = ei;
c1504e51023847 Ajay Kaher              2023-07-28  764  
c1504e51023847 Ajay Kaher              2023-07-28  765  	inode->i_mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
c1504e51023847 Ajay Kaher              2023-07-28  766  	inode->i_op = &eventfs_root_dir_inode_operations;
c1504e51023847 Ajay Kaher              2023-07-28  767  	inode->i_fop = &eventfs_file_operations;
c1504e51023847 Ajay Kaher              2023-07-28  768  
c1504e51023847 Ajay Kaher              2023-07-28  769  	/* directory inodes start off with i_nlink == 2 (for "." entry) */
c1504e51023847 Ajay Kaher              2023-07-28  770  	inc_nlink(inode);
c1504e51023847 Ajay Kaher              2023-07-28  771  	d_instantiate(dentry, inode);
c1504e51023847 Ajay Kaher              2023-07-28  772  	inc_nlink(dentry->d_parent->d_inode);
c1504e51023847 Ajay Kaher              2023-07-28  773  	fsnotify_mkdir(dentry->d_parent->d_inode, dentry);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  774) 	tracefs_end_creating(dentry);
88f349b4a83aab Ajay Kaher              2023-07-28  775  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  776) 	/* Will call dput when the directory is removed */
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  777) 	dget(dentry);
88f349b4a83aab Ajay Kaher              2023-07-28  778  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  779) 	return ei;
88f349b4a83aab Ajay Kaher              2023-07-28  780  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  781)  fail:
5790b1fb3d672d Steven Rostedt (Google  2023-10-04 @782) 	kfree(ei->d_children);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  783) 	kfree(ei);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  784) 	tracefs_failed_creating(dentry);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  785) 	return ERR_PTR(-ENOMEM);
88f349b4a83aab Ajay Kaher              2023-07-28  786  }
5bdcd5f5331a27 Ajay Kaher              2023-07-28  787  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  788) static void free_ei(struct rcu_head *head)
5bdcd5f5331a27 Ajay Kaher              2023-07-28  789  {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  790) 	struct eventfs_inode *ei = container_of(head, struct eventfs_inode, rcu);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  791  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  792) 	kfree_const(ei->name);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  793) 	kfree(ei->d_children);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  794) 	kfree(ei);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  795  }
5bdcd5f5331a27 Ajay Kaher              2023-07-28  796  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  797  /**
5bdcd5f5331a27 Ajay Kaher              2023-07-28  798   * eventfs_remove_rec - remove eventfs dir or file from list
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  799)  * @ei: eventfs_inode to be removed.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  800   *
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  801)  * This function recursively remove eventfs_inode which
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  802)  * contains info of file or dir.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  803   */
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  804) static void eventfs_remove_rec(struct eventfs_inode *ei, struct list_head *head, int level)
5bdcd5f5331a27 Ajay Kaher              2023-07-28  805  {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  806) 	struct eventfs_inode *ei_child;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  807  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  808) 	if (!ei)
5bdcd5f5331a27 Ajay Kaher              2023-07-28  809  		return;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  810  	/*
5bdcd5f5331a27 Ajay Kaher              2023-07-28  811  	 * Check recursion depth. It should never be greater than 3:
5bdcd5f5331a27 Ajay Kaher              2023-07-28  812  	 * 0 - events/
5bdcd5f5331a27 Ajay Kaher              2023-07-28  813  	 * 1 - events/group/
5bdcd5f5331a27 Ajay Kaher              2023-07-28  814  	 * 2 - events/group/event/
5bdcd5f5331a27 Ajay Kaher              2023-07-28  815  	 * 3 - events/group/event/file
5bdcd5f5331a27 Ajay Kaher              2023-07-28  816  	 */
5bdcd5f5331a27 Ajay Kaher              2023-07-28  817  	if (WARN_ON_ONCE(level > 3))
5bdcd5f5331a27 Ajay Kaher              2023-07-28  818  		return;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  819  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  820  	/* search for nested folders or files */
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  821) 	list_for_each_entry_srcu(ei_child, &ei->children, list,
5bdcd5f5331a27 Ajay Kaher              2023-07-28  822  				 lockdep_is_held(&eventfs_mutex)) {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  823) 		eventfs_remove_rec(ei_child, head, level + 1);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  824  	}
5bdcd5f5331a27 Ajay Kaher              2023-07-28  825  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  826) 	list_del_rcu(&ei->list);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  827) 	list_add_tail(&ei->del_list, head);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  828  }
5bdcd5f5331a27 Ajay Kaher              2023-07-28  829  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  830) static void unhook_dentry(struct dentry **dentry, struct dentry **list)
5bdcd5f5331a27 Ajay Kaher              2023-07-28  831  {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  832) 	if (*dentry) {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  833) 		unsigned long ptr = (unsigned long)*list;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  834  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  835  		/* Keep the dentry from being freed yet */
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  836) 		dget(*dentry);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  837  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  838  		/*
5bdcd5f5331a27 Ajay Kaher              2023-07-28  839  		 * Paranoid: The dget() above should prevent the dentry
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  840) 		 * from being freed and calling eventfs_set_ei_status_free().
5bdcd5f5331a27 Ajay Kaher              2023-07-28  841  		 * But just in case, set the link list LSB pointer to 1
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  842) 		 * and have eventfs_set_ei_status_free() check that to
5bdcd5f5331a27 Ajay Kaher              2023-07-28  843  		 * make sure that if it does happen, it will not think
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  844) 		 * the d_fsdata is an eventfs_inode.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  845  		 *
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  846) 		 * For this to work, no eventfs_inode should be allocated
5bdcd5f5331a27 Ajay Kaher              2023-07-28  847  		 * on a odd space, as the ef should always be allocated
5bdcd5f5331a27 Ajay Kaher              2023-07-28  848  		 * to be at least word aligned. Check for that too.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  849  		 */
5bdcd5f5331a27 Ajay Kaher              2023-07-28  850  		WARN_ON_ONCE(ptr & 1);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  851  
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  852) 		(*dentry)->d_fsdata = (void *)(ptr | 1);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  853) 		*list = *dentry;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  854) 		*dentry = NULL;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  855  	}
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  856) }
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  857) /**
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  858)  * eventfs_remove - remove eventfs dir or file from list
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  859)  * @ei: eventfs_inode to be removed.
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  860)  *
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  861)  * This function acquire the eventfs_mutex lock and call eventfs_remove_rec()
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  862)  */
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  863) void eventfs_remove_dir(struct eventfs_inode *ei)
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  864) {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  865) 	struct eventfs_inode *tmp;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  866) 	LIST_HEAD(ei_del_list);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  867) 	struct dentry *dentry_list = NULL;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  868) 	struct dentry *dentry;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  869) 	int i;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  870) 
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  871) 	if (!ei)
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  872) 		return;
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  873) 
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  874) 	mutex_lock(&eventfs_mutex);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  875) 	eventfs_remove_rec(ei, &ei_del_list, 0);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  876) 
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  877) 	list_for_each_entry_safe(ei, tmp, &ei_del_list, del_list) {
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  878) 		for (i = 0; i < ei->nr_entries; i++)
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  879) 			unhook_dentry(&ei->d_children[i], &dentry_list);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  880) 		unhook_dentry(&ei->dentry, &dentry_list);
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  881) 		call_srcu(&eventfs_srcu, &ei->rcu, free_ei);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  882  	}
5bdcd5f5331a27 Ajay Kaher              2023-07-28  883  	mutex_unlock(&eventfs_mutex);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  884  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  885  	while (dentry_list) {
5bdcd5f5331a27 Ajay Kaher              2023-07-28  886  		unsigned long ptr;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  887  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  888  		dentry = dentry_list;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  889  		ptr = (unsigned long)dentry->d_fsdata & ~1UL;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  890  		dentry_list = (struct dentry *)ptr;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  891  		dentry->d_fsdata = NULL;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  892  		d_invalidate(dentry);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  893  		mutex_lock(&eventfs_mutex);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  894  		/* dentry should now have at least a single reference */
5bdcd5f5331a27 Ajay Kaher              2023-07-28  895  		WARN_ONCE((int)d_count(dentry) < 1,
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  896) 			  "dentry %px (%s) less than one reference (%d) after invalidate\n",
5790b1fb3d672d Steven Rostedt (Google  2023-10-04  897) 			  dentry, dentry->d_name.name, d_count(dentry));
5bdcd5f5331a27 Ajay Kaher              2023-07-28  898  		mutex_unlock(&eventfs_mutex);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  899  		dput(dentry);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  900  	}
5bdcd5f5331a27 Ajay Kaher              2023-07-28  901  }
5bdcd5f5331a27 Ajay Kaher              2023-07-28  902  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  903  /**
5bdcd5f5331a27 Ajay Kaher              2023-07-28  904   * eventfs_remove_events_dir - remove eventfs dir or file from list
5bdcd5f5331a27 Ajay Kaher              2023-07-28  905   * @dentry: events's dentry to be removed.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  906   *
5bdcd5f5331a27 Ajay Kaher              2023-07-28  907   * This function remove events main directory
5bdcd5f5331a27 Ajay Kaher              2023-07-28  908   */
5bdcd5f5331a27 Ajay Kaher              2023-07-28 @909  void eventfs_remove_events_dir(struct dentry *dentry)

:::::: The code at line 909 was first introduced by commit
:::::: 5bdcd5f5331a276a3ddf1fba8605986d0d15298a eventfs: Implement removal of meta data from eventfs

:::::: TO: Ajay Kaher <akaher@vmware.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
