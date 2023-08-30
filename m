Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E093FFB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693406271; x=1724942271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1BP7Go9GIBYSc1WmHj6Rffp86FcpVFyQabRFz3cxtI=;
  b=nR0iuVWwElyxAiqRbapDv4jXmNzQgeXkgtYT5Mgbf2a9vnKGtqzyqYMC
   CxFe6SnfJllnPXt6xbszYUTjKpb3KmDS3YIFHBKQckClkkZ8v2SoB044X
   nNU11Xj9ARCzXbAw+ZnIyQ1k6MVOGd4kWrfz3KIiBt1mULm/q9hiCKCFC
   mAWODxBw7s3M+uW3oHMmdsyotg1M5FAlWgXJBChthzF6CQPP51OgNR443
   K/xc39Q/X+HhgNBzSipLdHK+fliI/ToWv3HzttB5tb1mnNgMS97qJL8UG
   6w8p0rKgRVz6EahtkmhORPLqolxMvH62w6uXy6TyJdvUrKXozEnf7jC9K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379412916"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="379412916"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 07:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853748060"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="853748060"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2023 07:37:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbMKI-0009u7-20;
	Wed, 30 Aug 2023 14:37:46 +0000
Date: Wed, 30 Aug 2023 22:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 1/5] include/linux/sysctl.h:148:45: warning:
 'struct file' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <202308302240.Lcg7J346-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: b3d9978143d4fa8d26fb6efee0a4e615ad987715 [1/5] sysctl: API extension for handling sysctl
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308302240.Lcg7J346-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308302240.Lcg7J346-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308302240.Lcg7J346-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/ucount.c:4:
>> include/linux/sysctl.h:148:45: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     148 |         int (*open) (struct inode *, struct file *);
         |                                             ^~~~
   include/linux/sysctl.h:149:48: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         int (*release) (struct inode *, struct file *);
         |                                                ^~~~
   include/linux/sysctl.h:150:33: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     150 |         ssize_t (*read) (struct file *, char *, size_t *, loff_t *);
         |                                 ^~~~
   include/linux/sysctl.h:151:34: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     151 |         ssize_t (*write) (struct file *, char *, size_t *, loff_t *);
         |                                  ^~~~
--
   In file included from fs/proc/proc_sysctl.c:6:
>> include/linux/sysctl.h:148:45: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     148 |         int (*open) (struct inode *, struct file *);
         |                                             ^~~~
   include/linux/sysctl.h:149:48: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         int (*release) (struct inode *, struct file *);
         |                                                ^~~~
   include/linux/sysctl.h:150:33: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     150 |         ssize_t (*read) (struct file *, char *, size_t *, loff_t *);
         |                                 ^~~~
   include/linux/sysctl.h:151:34: warning: 'struct file' declared inside parameter list will not be visible outside of this definition or declaration
     151 |         ssize_t (*write) (struct file *, char *, size_t *, loff_t *);
         |                                  ^~~~
   fs/proc/proc_sysctl.c: In function 'proc_sys_call_handler':
   fs/proc/proc_sysctl.c:599:47: error: passing argument 1 of 'table->fops.write' from incompatible pointer type [-Werror=incompatible-pointer-types]
     599 |                 error = table->fops.write(iocb->ki_filp, kbuf, &count, &iocb->ki_pos);
         |                                           ~~~~^~~~~~~~~
         |                                               |
         |                                               struct file *
   fs/proc/proc_sysctl.c:599:47: note: expected 'struct file *' but argument is of type 'struct file *'
   fs/proc/proc_sysctl.c:601:46: error: passing argument 1 of 'table->fops.read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     601 |                 error = table->fops.read(iocb->ki_filp, kbuf, &count, &iocb->ki_pos);
         |                                          ~~~~^~~~~~~~~
         |                                              |
         |                                              struct file *
   fs/proc/proc_sysctl.c:601:46: note: expected 'struct file *' but argument is of type 'struct file *'
   fs/proc/proc_sysctl.c: In function 'proc_sys_open':
   fs/proc/proc_sysctl.c:656:47: error: passing argument 2 of 'table->fops.open' from incompatible pointer type [-Werror=incompatible-pointer-types]
     656 |                 ret = table->fops.open(inode, filp);
         |                                               ^~~~
         |                                               |
         |                                               struct file *
   fs/proc/proc_sysctl.c:656:47: note: expected 'struct file *' but argument is of type 'struct file *'
   fs/proc/proc_sysctl.c: In function 'proc_sys_release':
   fs/proc/proc_sysctl.c:677:50: error: passing argument 2 of 'table->fops.release' from incompatible pointer type [-Werror=incompatible-pointer-types]
     677 |                 ret = table->fops.release(inode, filp);
         |                                                  ^~~~
         |                                                  |
         |                                                  struct file *
   fs/proc/proc_sysctl.c:677:50: note: expected 'struct file *' but argument is of type 'struct file *'
   cc1: some warnings being treated as errors
--
   kernel/bpf/cgroup.c:795: warning: Function parameter or member 'new_prog' not described in '__cgroup_bpf_replace'
   kernel/bpf/cgroup.c:795: warning: Excess function parameter 'type' description in '__cgroup_bpf_replace'
   kernel/bpf/cgroup.c:1359: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_skb'
   kernel/bpf/cgroup.c:1359: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_skb'
   kernel/bpf/cgroup.c:1439: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sk'
   kernel/bpf/cgroup.c:1439: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sk'
   kernel/bpf/cgroup.c:1467: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sock_addr'
   kernel/bpf/cgroup.c:1467: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sock_addr'
   kernel/bpf/cgroup.c:1512: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sock_ops'
   kernel/bpf/cgroup.c:1512: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sock_ops'
>> kernel/bpf/cgroup.c:1686: warning: Function parameter or member 'file' not described in '__cgroup_bpf_run_filter_sysctl'
   kernel/bpf/cgroup.c:1686: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sysctl'
   kernel/bpf/cgroup.c:1686: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sysctl'


vim +148 include/linux/sysctl.h

   146	
   147	struct ctl_fops {
 > 148		int (*open) (struct inode *, struct file *);
   149		int (*release) (struct inode *, struct file *);
   150		ssize_t (*read) (struct file *, char *, size_t *, loff_t *);
   151		ssize_t (*write) (struct file *, char *, size_t *, loff_t *);
   152	};
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
