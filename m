Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EAD125B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692266199; x=1723802199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsWpC++TQC8qpE1JlIXk3V45GTgj5Zo+SkNPuf6h5/Y=;
  b=GeYa5jUYk33x4//1cNGm1uWGR5an1xtb9OEVlsk3SH3GtS1anfUMYmul
   yIg7g5I2h8ExDrrojt1eAn/N9QBPdb56bNYy/G6edMzl1nesurDsiGVU3
   HsxzbAEDmWDemfVqTnIKk3neHTmVq90ypHIyKCWgWBFBxTKpTe8n4wZ0h
   A50pDRWob3HVW6p4OE8zp6lICyTMpjqphlS5CZJPAfCN2C4RZqZ1XTwdF
   yMR5XhWjrMbTtrSztFHVq8Oxwp+uXqFQPqxBp4ElFkdvDnNyOJumf7kt2
   6YKW40VVBTqkACtE+xGRuIB3dfv8R16P06FBvF/26xb+I69Y+Z1Tg3B7j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357730632"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="357730632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="981090624"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="981090624"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 02:56:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWZk3-00011Z-1A;
	Thu, 17 Aug 2023 09:56:35 +0000
Date: Thu, 17 Aug 2023 17:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Vagin <avagin@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 2144/10848] kernel/seccomp.c:151: warning:
 Function parameter or member 'requests' not described in 'notification'
Message-ID: <202308171742.AncabIG1-lkp@intel.com>
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
commit: 4943b66df18a0e8aedd006792ed73257cd2da8f8 [2144/10848] seccomp: don't use semaphore and wait_queue together
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230817/202308171742.AncabIG1-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171742.AncabIG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171742.AncabIG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/seccomp.c:133: warning: Function parameter or member 'setfd' not described in 'seccomp_kaddfd'
   kernel/seccomp.c:133: warning: Function parameter or member 'list' not described in 'seccomp_kaddfd'
>> kernel/seccomp.c:151: warning: Function parameter or member 'requests' not described in 'notification'
   kernel/seccomp.c:563: warning: Function parameter or member 'tsk' not described in 'seccomp_filter_release'
   kernel/seccomp.c:583: warning: Function parameter or member 'flags' not described in 'seccomp_sync_threads'


vim +151 kernel/seccomp.c

7cf97b12545503 Sargun Dhillon    2020-06-02  103  
7cf97b12545503 Sargun Dhillon    2020-06-02  104  /**
7cf97b12545503 Sargun Dhillon    2020-06-02  105   * struct seccomp_kaddfd - container for seccomp_addfd ioctl messages
7cf97b12545503 Sargun Dhillon    2020-06-02  106   *
7cf97b12545503 Sargun Dhillon    2020-06-02  107   * @file: A reference to the file to install in the other task
7cf97b12545503 Sargun Dhillon    2020-06-02  108   * @fd: The fd number to install it at. If the fd number is -1, it means the
7cf97b12545503 Sargun Dhillon    2020-06-02  109   *      installing process should allocate the fd as normal.
7cf97b12545503 Sargun Dhillon    2020-06-02  110   * @flags: The flags for the new file descriptor. At the moment, only O_CLOEXEC
7cf97b12545503 Sargun Dhillon    2020-06-02  111   *         is allowed.
0ae71c7720e3ae Rodrigo Campos    2021-05-17  112   * @ioctl_flags: The flags used for the seccomp_addfd ioctl.
7cf97b12545503 Sargun Dhillon    2020-06-02  113   * @ret: The return value of the installing process. It is set to the fd num
7cf97b12545503 Sargun Dhillon    2020-06-02  114   *       upon success (>= 0).
7cf97b12545503 Sargun Dhillon    2020-06-02  115   * @completion: Indicates that the installing process has completed fd
7cf97b12545503 Sargun Dhillon    2020-06-02  116   *              installation, or gone away (either due to successful
7cf97b12545503 Sargun Dhillon    2020-06-02  117   *              reply, or signal)
7cf97b12545503 Sargun Dhillon    2020-06-02  118   *
7cf97b12545503 Sargun Dhillon    2020-06-02  119   */
7cf97b12545503 Sargun Dhillon    2020-06-02  120  struct seccomp_kaddfd {
7cf97b12545503 Sargun Dhillon    2020-06-02  121  	struct file *file;
7cf97b12545503 Sargun Dhillon    2020-06-02  122  	int fd;
7cf97b12545503 Sargun Dhillon    2020-06-02  123  	unsigned int flags;
0ae71c7720e3ae Rodrigo Campos    2021-05-17  124  	__u32 ioctl_flags;
7cf97b12545503 Sargun Dhillon    2020-06-02  125  
42eb0d54c08a03 Christoph Hellwig 2021-03-25  126  	union {
42eb0d54c08a03 Christoph Hellwig 2021-03-25  127  		bool setfd;
7cf97b12545503 Sargun Dhillon    2020-06-02  128  		/* To only be set on reply */
7cf97b12545503 Sargun Dhillon    2020-06-02  129  		int ret;
42eb0d54c08a03 Christoph Hellwig 2021-03-25  130  	};
7cf97b12545503 Sargun Dhillon    2020-06-02  131  	struct completion completion;
7cf97b12545503 Sargun Dhillon    2020-06-02  132  	struct list_head list;
6a21cc50f0c7f8 Tycho Andersen    2018-12-09 @133  };
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  134  
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  135  /**
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  136   * struct notification - container for seccomp userspace notifications. Since
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  137   * most seccomp filters will not have notification listeners attached and this
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  138   * structure is fairly large, we store the notification-specific stuff in a
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  139   * separate structure.
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  140   *
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  141   * @request: A semaphore that users of this notification can wait on for
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  142   *           changes. Actual reads and writes are still controlled with
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  143   *           filter->notify_lock.
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  144   * @next_id: The id of the next request.
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  145   * @notifications: A list of struct seccomp_knotif elements.
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  146   */
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  147  struct notification {
4943b66df18a0e Andrei Vagin      2023-03-07  148  	atomic_t requests;
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  149  	u64 next_id;
6a21cc50f0c7f8 Tycho Andersen    2018-12-09  150  	struct list_head notifications;
6a21cc50f0c7f8 Tycho Andersen    2018-12-09 @151  };
e2cfabdfd07564 Will Drewry       2012-04-12  152  

:::::: The code at line 151 was first introduced by commit
:::::: 6a21cc50f0c7f87dae5259f6cfefe024412313f6 seccomp: add a return code to trap to userspace

:::::: TO: Tycho Andersen <tycho@tycho.ws>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
