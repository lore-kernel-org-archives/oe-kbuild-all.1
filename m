Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180C186E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 04:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694666404; x=1726202404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x1XEQroU67ojXwQE6K8sFSl98mzsqDlAsADVZdYJetc=;
  b=EF1m8/A4eL4FCLxGfBihwmfhPVieqaR17+I5MAkPuHQrbYYb4+HxB4FY
   A7QZCvq9J5Z01NmuVmdYtvZ1Z6PDwaox+C7OksaftVHjdkG8Hp7PxtFI2
   zTTa5kzJi7Fi3VvXh9mYfBPrJd0REm6XVb2WpBxwjUFoWRdMB5l8BlIZl
   5WAmGYlDEhy9B+39HGqg3+BEaUPwiSLQgRy85AG/T6yXF+9ThY51q1+Lg
   RiIUAF773/nu6CKSgYSgN0KYvAaiQAa9haxv/yI+CPUYTw3zhjmUSPX3u
   452qA1Jyi4RnigrHPxKpkxxkYXae6oj1Fe0K6tfCiuqgoLSx8bD/B0yaP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358281949"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="358281949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 21:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="744388390"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="744388390"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Sep 2023 21:39:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qge8w-0001A1-2h;
	Thu, 14 Sep 2023 04:39:54 +0000
Date: Thu, 14 Sep 2023 12:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Yakunin, Dmitry (Nebius)" <zeil@nebius.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] cgroup: list all subsystem states in debugfs
 files
Message-ID: <202309141215.f6BJAyTt-lkp@intel.com>
References: <20230911075437.74027-2-zeil@nebius.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911075437.74027-2-zeil@nebius.com>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc1 next-20230913]
[cannot apply to tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yakunin-Dmitry-Nebius/cgroup-list-all-subsystem-states-in-debugfs-files/20230911-155716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230911075437.74027-2-zeil%40nebius.com
patch subject: [RFC PATCH 1/3] cgroup: list all subsystem states in debugfs files
config: i386-randconfig-063-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141215.f6BJAyTt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141215.f6BJAyTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141215.f6BJAyTt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/cgroup/cgroup.c:6619:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6619:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6619:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c:6622:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6622:43: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6622:43: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/cgroup/cgroup.c:7078:6: sparse: sparse: symbol 'css_debugfs_seqfile_start' was not declared. Should it be static?
>> kernel/cgroup/cgroup.c:7090:6: sparse: sparse: symbol 'css_debugfs_seqfile_next' was not declared. Should it be static?
>> kernel/cgroup/cgroup.c:7101:6: sparse: sparse: symbol 'css_debugfs_seqfile_stop' was not declared. Should it be static?
>> kernel/cgroup/cgroup.c:7106:5: sparse: sparse: symbol 'css_debugfs_seqfile_show' was not declared. Should it be static?
   kernel/cgroup/cgroup.c:3064:9: sparse: sparse: context imbalance in 'cgroup_lock_and_drain_offline' - wrong count at exit
   kernel/cgroup/cgroup.c:6386:12: sparse: sparse: context imbalance in 'cgroup_css_set_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6502:9: sparse: sparse: context imbalance in 'cgroup_css_set_put_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6522:5: sparse: sparse: context imbalance in 'cgroup_can_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6571:9: sparse: sparse: context imbalance in 'cgroup_cancel_fork' - unexpected unlock
   kernel/cgroup/cgroup.c:7084:22: sparse: sparse: context imbalance in 'css_debugfs_seqfile_start' - wrong count at exit
   kernel/cgroup/cgroup.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'css_debugfs_seqfile_stop' - unexpected unlock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
