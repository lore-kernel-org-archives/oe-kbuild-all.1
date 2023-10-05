Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996C107A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRp8jbpU"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696518439; x=1728054439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D+W5oukmCml/06lHbIAyAT/X3YvaE2FH4MNCMRrHV5k=;
  b=YRp8jbpUlXQDglmtYC0cJpdEtm/Kyt58MFvFoDcAoE7OhX0MF7bOSLR5
   wSID59HPG1HsZKXlUBqIDIbHc1UhROCl9qGVntixmrJD5EWEbaVJPeBMi
   ojJpvczVO08SHu1OFMYQskeMmde0yfcz6hb8sSSDoW5sbVqiFWRL269Hv
   zVRFm+2GBzdjrZHt5SRL/moHoAm1/9Sd/spu3EXUGgR94r134h98dw5NU
   y6snIIkQwOLAF3av21T5Gr0k6s9S2QpYXsW0vKE7qp1Xa7k2P6cIPFbcT
   seJ3gYEmdu1EJH/PM404t0if9pI00PiGHGOZ7NR7gFFhYAm3PhEUJWRna
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414487848"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="414487848"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 08:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="751795602"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="751795602"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Oct 2023 08:06:44 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoPw0-000LXI-1W;
	Thu, 05 Oct 2023 15:06:40 +0000
Date: Thu, 5 Oct 2023 23:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [for-next][PATCH 6/7] eventfs: Remove eventfs_file and just use
 eventfs_inode
Message-ID: <202310052216.4SgqasWo-lkp@intel.com>
References: <20231005015351.632548413@goodmis.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005015351.632548413@goodmis.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc4 next-20231005]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Expand-all-ring-buffers-individually/20231005-095439
base:   linus/master
patch link:    https://lore.kernel.org/r/20231005015351.632548413%40goodmis.org
patch subject: [for-next][PATCH 6/7] eventfs: Remove eventfs_file and just use eventfs_inode
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310052216.4SgqasWo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310052216.4SgqasWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052216.4SgqasWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:909:6: warning: no previous prototype for 'eventfs_remove_events_dir' [-Wmissing-prototypes]
     909 | void eventfs_remove_events_dir(struct dentry *dentry)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> fs/tracefs/event_inode.c:805: warning: Function parameter or member 'head' not described in 'eventfs_remove_rec'
>> fs/tracefs/event_inode.c:805: warning: Function parameter or member 'level' not described in 'eventfs_remove_rec'
>> fs/tracefs/event_inode.c:864: warning: expecting prototype for eventfs_remove(). Prototype was for eventfs_remove_dir() instead
--
>> kernel/trace/trace_events.c:2285:5: warning: no previous prototype for 'system_callback' [-Wmissing-prototypes]
    2285 | int system_callback(const char *name, umode_t *mode, void **data,
         |     ^~~~~~~~~~~~~~~


vim +/eventfs_remove_events_dir +909 fs/tracefs/event_inode.c

5bdcd5f5331a27 Ajay Kaher              2023-07-28  796  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  797  /**
5bdcd5f5331a27 Ajay Kaher              2023-07-28  798   * eventfs_remove_rec - remove eventfs dir or file from list
6fa46da887d339 Steven Rostedt (Google  2023-10-04  799)  * @ei: eventfs_inode to be removed.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  800   *
6fa46da887d339 Steven Rostedt (Google  2023-10-04  801)  * This function recursively remove eventfs_inode which
6fa46da887d339 Steven Rostedt (Google  2023-10-04  802)  * contains info of file or dir.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  803   */
6fa46da887d339 Steven Rostedt (Google  2023-10-04  804) static void eventfs_remove_rec(struct eventfs_inode *ei, struct list_head *head, int level)
5bdcd5f5331a27 Ajay Kaher              2023-07-28 @805  {
6fa46da887d339 Steven Rostedt (Google  2023-10-04  806) 	struct eventfs_inode *ei_child;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  807  
6fa46da887d339 Steven Rostedt (Google  2023-10-04  808) 	if (!ei)
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
6fa46da887d339 Steven Rostedt (Google  2023-10-04  821) 	list_for_each_entry_srcu(ei_child, &ei->children, list,
5bdcd5f5331a27 Ajay Kaher              2023-07-28  822  				 lockdep_is_held(&eventfs_mutex)) {
6fa46da887d339 Steven Rostedt (Google  2023-10-04  823) 		eventfs_remove_rec(ei_child, head, level + 1);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  824  	}
5bdcd5f5331a27 Ajay Kaher              2023-07-28  825  
6fa46da887d339 Steven Rostedt (Google  2023-10-04  826) 	list_del_rcu(&ei->list);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  827) 	list_add_tail(&ei->del_list, head);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  828  }
5bdcd5f5331a27 Ajay Kaher              2023-07-28  829  
6fa46da887d339 Steven Rostedt (Google  2023-10-04  830) static void unhook_dentry(struct dentry **dentry, struct dentry **list)
5bdcd5f5331a27 Ajay Kaher              2023-07-28  831  {
6fa46da887d339 Steven Rostedt (Google  2023-10-04  832) 	if (*dentry) {
6fa46da887d339 Steven Rostedt (Google  2023-10-04  833) 		unsigned long ptr = (unsigned long)*list;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  834  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  835  		/* Keep the dentry from being freed yet */
6fa46da887d339 Steven Rostedt (Google  2023-10-04  836) 		dget(*dentry);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  837  
5bdcd5f5331a27 Ajay Kaher              2023-07-28  838  		/*
5bdcd5f5331a27 Ajay Kaher              2023-07-28  839  		 * Paranoid: The dget() above should prevent the dentry
6fa46da887d339 Steven Rostedt (Google  2023-10-04  840) 		 * from being freed and calling eventfs_set_ei_status_free().
5bdcd5f5331a27 Ajay Kaher              2023-07-28  841  		 * But just in case, set the link list LSB pointer to 1
6fa46da887d339 Steven Rostedt (Google  2023-10-04  842) 		 * and have eventfs_set_ei_status_free() check that to
5bdcd5f5331a27 Ajay Kaher              2023-07-28  843  		 * make sure that if it does happen, it will not think
6fa46da887d339 Steven Rostedt (Google  2023-10-04  844) 		 * the d_fsdata is an eventfs_inode.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  845  		 *
6fa46da887d339 Steven Rostedt (Google  2023-10-04  846) 		 * For this to work, no eventfs_inode should be allocated
5bdcd5f5331a27 Ajay Kaher              2023-07-28  847  		 * on a odd space, as the ef should always be allocated
5bdcd5f5331a27 Ajay Kaher              2023-07-28  848  		 * to be at least word aligned. Check for that too.
5bdcd5f5331a27 Ajay Kaher              2023-07-28  849  		 */
5bdcd5f5331a27 Ajay Kaher              2023-07-28  850  		WARN_ON_ONCE(ptr & 1);
5bdcd5f5331a27 Ajay Kaher              2023-07-28  851  
6fa46da887d339 Steven Rostedt (Google  2023-10-04  852) 		(*dentry)->d_fsdata = (void *)(ptr | 1);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  853) 		*list = *dentry;
6fa46da887d339 Steven Rostedt (Google  2023-10-04  854) 		*dentry = NULL;
5bdcd5f5331a27 Ajay Kaher              2023-07-28  855  	}
6fa46da887d339 Steven Rostedt (Google  2023-10-04  856) }
6fa46da887d339 Steven Rostedt (Google  2023-10-04  857) /**
6fa46da887d339 Steven Rostedt (Google  2023-10-04  858)  * eventfs_remove - remove eventfs dir or file from list
6fa46da887d339 Steven Rostedt (Google  2023-10-04  859)  * @ei: eventfs_inode to be removed.
6fa46da887d339 Steven Rostedt (Google  2023-10-04  860)  *
6fa46da887d339 Steven Rostedt (Google  2023-10-04  861)  * This function acquire the eventfs_mutex lock and call eventfs_remove_rec()
6fa46da887d339 Steven Rostedt (Google  2023-10-04  862)  */
6fa46da887d339 Steven Rostedt (Google  2023-10-04  863) void eventfs_remove_dir(struct eventfs_inode *ei)
6fa46da887d339 Steven Rostedt (Google  2023-10-04 @864) {
6fa46da887d339 Steven Rostedt (Google  2023-10-04  865) 	struct eventfs_inode *tmp;
6fa46da887d339 Steven Rostedt (Google  2023-10-04  866) 	LIST_HEAD(ei_del_list);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  867) 	struct dentry *dentry_list = NULL;
6fa46da887d339 Steven Rostedt (Google  2023-10-04  868) 	struct dentry *dentry;
6fa46da887d339 Steven Rostedt (Google  2023-10-04  869) 	int i;
6fa46da887d339 Steven Rostedt (Google  2023-10-04  870) 
6fa46da887d339 Steven Rostedt (Google  2023-10-04  871) 	if (!ei)
6fa46da887d339 Steven Rostedt (Google  2023-10-04  872) 		return;
6fa46da887d339 Steven Rostedt (Google  2023-10-04  873) 
6fa46da887d339 Steven Rostedt (Google  2023-10-04  874) 	mutex_lock(&eventfs_mutex);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  875) 	eventfs_remove_rec(ei, &ei_del_list, 0);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  876) 
6fa46da887d339 Steven Rostedt (Google  2023-10-04  877) 	list_for_each_entry_safe(ei, tmp, &ei_del_list, del_list) {
6fa46da887d339 Steven Rostedt (Google  2023-10-04  878) 		for (i = 0; i < ei->nr_entries; i++)
6fa46da887d339 Steven Rostedt (Google  2023-10-04  879) 			unhook_dentry(&ei->d_children[i], &dentry_list);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  880) 		unhook_dentry(&ei->dentry, &dentry_list);
6fa46da887d339 Steven Rostedt (Google  2023-10-04  881) 		call_srcu(&eventfs_srcu, &ei->rcu, free_ei);
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
6fa46da887d339 Steven Rostedt (Google  2023-10-04  896) 			  "dentry %px (%s) less than one reference (%d) after invalidate\n",
6fa46da887d339 Steven Rostedt (Google  2023-10-04  897) 			  dentry, dentry->d_name.name, d_count(dentry));
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
