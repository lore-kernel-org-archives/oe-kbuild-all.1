Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4A168CE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689058792; x=1720594792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95qPuB9LiPAzR3Zr/sHAHzID4BNKTfg7u10Ks1d7ab0=;
  b=m1EyD49OKYKEd/hgbhBWp4FfFJhtxhd42DWYpwVuzv6DnWIJm/JVsmbt
   0RT1qcV/UzwGBOQILrlFKSYsN/9bL+hew39Ix3XbkPcPgEmRvtyuLnJ9j
   Z1suACAXfR8hXs2KTkmlZLiXGvDaR+4v7lnsSj86qwxbvDUUqjjE389c9
   sjiBRJ/Q8gfG3omPUseDAGHAKj7B4RixKcKso0JwT2XXbhFfqkrztcJL7
   jwEsKiEjNIeDwvVeKn1hOxWWvpr7Wdx0LEwJioSdlGGK0Nn/HOJHam7yi
   iAHgNm6t5HY2KIB5j4CpC+ayKVt/ZXS5O7NOj1iLFtwcv98D6b6wFRg6X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="364580321"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="364580321"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="671265493"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="671265493"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2023 23:59:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ7Ld-0004Qd-3A;
	Tue, 11 Jul 2023 06:59:45 +0000
Date: Tue, 11 Jul 2023 14:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/rfc/eventfs 28/28] fs/tracefs/event_inode.c:236:13:
 warning: unused variable 'idx'
Message-ID: <202307111415.tc8g7M63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/rfc/eventfs
head:   1dc48374bb8ad8aec6d7244267f9b36e0512d3bb
commit: 1dc48374bb8ad8aec6d7244267f9b36e0512d3bb [28/28] tracefs: Add RCU and global mutex for eventfs
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230711/202307111415.tc8g7M63-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111415.tc8g7M63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111415.tc8g7M63-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/tracefs/event_inode.c: In function 'eventfs_post_create_dir':
>> fs/tracefs/event_inode.c:236:13: warning: unused variable 'idx' [-Wunused-variable]
     236 |         int idx;
         |             ^~~
   fs/tracefs/event_inode.c: At top level:
   fs/tracefs/event_inode.c:184:23: warning: 'eventfs_create_dir' defined but not used [-Wunused-function]
     184 | static struct dentry *eventfs_create_dir(const char *name, umode_t mode,
         |                       ^~~~~~~~~~~~~~~~~~
   fs/tracefs/event_inode.c:108:23: warning: 'eventfs_create_file' defined but not used [-Wunused-function]
     108 | static struct dentry *eventfs_create_file(const char *name, umode_t mode,
         |                       ^~~~~~~~~~~~~~~~~~~


vim +/idx +236 fs/tracefs/event_inode.c

   225	
   226	/**
   227	 * eventfs_post_create_dir - post create dir routine
   228	 * @ef: eventfs_file of recently created dir
   229	 *
   230	 * Files with-in eventfs dir should know dentry of parent dir
   231	 */
   232	static void eventfs_post_create_dir(struct eventfs_file *ef)
   233	{
   234		struct eventfs_file *ef_child;
   235		struct tracefs_inode *ti;
 > 236		int idx;
   237	
   238		/* srcu lock already held */
   239		/* fill parent-child relation */
   240		list_for_each_entry_srcu(ef_child, &ef->ei->e_top_files, list,
   241					 srcu_read_lock_held(&eventfs_srcu)) {
   242			ef_child->d_parent = ef->dentry;
   243		}
   244	
   245		ti = get_tracefs(ef->dentry->d_inode);
   246		ti->private = ef->ei;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
