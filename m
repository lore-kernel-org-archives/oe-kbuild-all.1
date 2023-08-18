Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B38485
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692329207; x=1723865207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4EXaoilKiWGij0usjsJtZX1BZfA2FowQxWPfg1ge10=;
  b=ZVvWr7LdR7ekNrlsW6WS9w95JBm7VB3I6+3MBN0MQFsiujd1uyvLNmSY
   A1hfEgLwElDiSdf1fzsmi8evQ3Zq2VT75C+klHJXLJ+Duul3FvFoEOXYO
   ggOXr4hBZpH2vup/i1eeVhSirRau4KOZNEZ0K6cqWWGoiklLj5KJ/n8cP
   Mstcm2T262I6otGeLSabrHrx7YJC0Sg5nDOQabwT4XlAu8HTvn65g70TJ
   g/z5vAtOQurElUKwT1B9CbWZURoAAoMy78AVvkPQ6mOfHqSlEmpUD4ai7
   55/gjr+EyVDkJf/gqkLVCrBjPVOjCOJg6BLAJCdKDacijrqHxNF1LrHpa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459354582"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="459354582"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 20:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="804979506"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="804979506"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 20:26:44 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWq8J-00023q-2v;
	Fri, 18 Aug 2023 03:26:43 +0000
Date: Fri, 18 Aug 2023 11:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ajay Kaher <akaher@vmware.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [linux-next:master 4907/10848] fs/tracefs/event_inode.c:58: warning:
 Function parameter or member 'del_list' not described in 'eventfs_file'
Message-ID: <202308181108.C2BQ6D3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: 63940449555e799d387f316993ad824476c16953 [4907/10848] eventfs: Implement eventfs lookup, read, open functions
config: microblaze-randconfig-r032-20230817 (https://download.01.org/0day-ci/archive/20230818/202308181108.C2BQ6D3n-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181108.C2BQ6D3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181108.C2BQ6D3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:58: warning: Function parameter or member 'del_list' not described in 'eventfs_file'
>> fs/tracefs/event_inode.c:58: warning: Function parameter or member 'rcu' not described in 'eventfs_file'
>> fs/tracefs/event_inode.c:58: warning: Function parameter or member 'is_freed' not described in 'eventfs_file'


vim +58 fs/tracefs/event_inode.c

c1504e51023847 Ajay Kaher 2023-07-28  29  
c1504e51023847 Ajay Kaher 2023-07-28  30  /**
c1504e51023847 Ajay Kaher 2023-07-28  31   * struct eventfs_file - hold the properties of the eventfs files and
c1504e51023847 Ajay Kaher 2023-07-28  32   *                       directories.
c1504e51023847 Ajay Kaher 2023-07-28  33   * @name:	the name of the file or directory to create
63940449555e79 Ajay Kaher 2023-07-28  34   * @d_parent:   holds parent's dentry
63940449555e79 Ajay Kaher 2023-07-28  35   * @dentry:     once accessed holds dentry
c1504e51023847 Ajay Kaher 2023-07-28  36   * @list:	file or directory to be added to parent directory
c1504e51023847 Ajay Kaher 2023-07-28  37   * @ei:		list of files and directories within directory
c1504e51023847 Ajay Kaher 2023-07-28  38   * @fop:	file_operations for file or directory
c1504e51023847 Ajay Kaher 2023-07-28  39   * @iop:	inode_operations for file or directory
c1504e51023847 Ajay Kaher 2023-07-28  40   * @data:	something that the caller will want to get to later on
c1504e51023847 Ajay Kaher 2023-07-28  41   * @mode:	the permission that the file or directory should have
c1504e51023847 Ajay Kaher 2023-07-28  42   */
c1504e51023847 Ajay Kaher 2023-07-28  43  struct eventfs_file {
c1504e51023847 Ajay Kaher 2023-07-28  44  	const char			*name;
63940449555e79 Ajay Kaher 2023-07-28  45  	struct dentry			*d_parent;
63940449555e79 Ajay Kaher 2023-07-28  46  	struct dentry			*dentry;
c1504e51023847 Ajay Kaher 2023-07-28  47  	struct list_head		list;
c1504e51023847 Ajay Kaher 2023-07-28  48  	struct eventfs_inode		*ei;
c1504e51023847 Ajay Kaher 2023-07-28  49  	const struct file_operations	*fop;
c1504e51023847 Ajay Kaher 2023-07-28  50  	const struct inode_operations	*iop;
63940449555e79 Ajay Kaher 2023-07-28  51  	union {
63940449555e79 Ajay Kaher 2023-07-28  52  		struct list_head	del_list; /* list of eventfs_file to delete */
63940449555e79 Ajay Kaher 2023-07-28  53  		struct rcu_head		rcu; /* eventfs_file to delete */
63940449555e79 Ajay Kaher 2023-07-28  54  		unsigned long		is_freed; /* Freed if one of the above is set */
63940449555e79 Ajay Kaher 2023-07-28  55  	};
c1504e51023847 Ajay Kaher 2023-07-28  56  	void				*data;
c1504e51023847 Ajay Kaher 2023-07-28  57  	umode_t				mode;
c1504e51023847 Ajay Kaher 2023-07-28 @58  };
c1504e51023847 Ajay Kaher 2023-07-28  59  

:::::: The code at line 58 was first introduced by commit
:::::: c1504e5102384762bd06b068e9928b624a8a88c6 eventfs: Implement eventfs dir creation functions

:::::: TO: Ajay Kaher <akaher@vmware.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
