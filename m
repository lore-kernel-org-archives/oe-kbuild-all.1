Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61F3FE49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="IcA+EQWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hsjk0KftmCzpYLqdO+a8uHUti+dC25lI4vbX7EQkY60=;
  b=IcA+EQWuwYa5kazJdt4pXG49VPDNPG6pncK2OJKbm7oFiWTdNS77rtgl
   1nJ5K+F+RmERolxm0qTKbqyjvZX1ogZFeAYZDWCGebSP2/h354Ut6uRvC
   mBfYdv8aRx3k5zEG/zUFwowWTFi2v8v3HyiP4O9rCJRkYQkJBaFu/3xXg
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,235,1694728800"; 
   d="scan'208";a="131967795"
Received: from dhcp-138-246-3-50.dynamic.eduroam.mwn.de (HELO hadrien) ([138.246.3.50])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 20:16:02 +0200
Date: Wed, 18 Oct 2023 20:16:01 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
cc: Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8657/13299] fs/tracefs/event_inode.c:782:11-21:
 ERROR: ei is NULL but dereferenced. (fwd)
Message-ID: <70e7bace-561c-95f-1117-706c2c220bc@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

See the goto fail on line 738.

julia

---------- Forwarded message ----------
Date: Thu, 19 Oct 2023 02:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8657/13299] fs/tracefs/event_inode.c:782:11-21:
    ERROR: ei is NULL but dereferenced.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 5790b1fb3d672d9a1fe3881a7181dfdbe741568f [8657/13299] eventfs: Remove eventfs_file and just use eventfs_inode
:::::: branch date: 14 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-052-20231018 (https://download.01.org/0day-ci/archive/20231019/202310190142.oAl4P1Iw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190142.oAl4P1Iw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310190142.oAl4P1Iw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/tracefs/event_inode.c:782:11-21: ERROR: ei is NULL but dereferenced.

vim +782 fs/tracefs/event_inode.c

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
c1504e51023847 Ajay Kaher              2023-07-28  737  	if (!ei)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
