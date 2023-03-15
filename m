Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AA28EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678877446; x=1710413446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOC5Xy20QwRgnSopyIcbMMTDhK8RJhvOHRWg1L7iBUg=;
  b=PSGxGKLMj9eoU3aXqpgcbb+L3TrVNSyQnN8e4i5HgP4iWB/nC9udqgqd
   Tc+/3x1KhA0tFXtUeO7wh4vDKeaas9ym6Y0PF+gMHl6eywU35exR8/m/d
   kCiZMmnJuIiUh1UvqLeBHWPttKomap3qz3qvvkgqqScW0zs44DFPDQbGj
   AJrWELOk1sJe9K32tfkVAUvtLm7csoI4HHD0Vlb3p/19tI7NuMYqGGxEg
   8Ni8X06N7UaqI/RbR+SEeBYkL73Ol8kFODQj3TY46m9GXXV+/FfxxW+y0
   TIVK7CPeOiid9fYQ9QTWjSM+6wNLxBDCCrnXAHvuj4lKT/C8EV4MlW3EM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340034098"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="340034098"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 03:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711884229"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="711884229"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 03:50:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcOiR-0007cV-0p;
	Wed, 15 Mar 2023 10:50:43 +0000
Date: Wed, 15 Mar 2023 18:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Cai Xinchen <caixinchen1@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/4.19 41/42] kernel/cgroup/cgroup.c:2237:9:
 error: implicit declaration of function 'get_online_cpus'; did you mean
 'get_online_mems'?
Message-ID: <202303151816.KSWgiPht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
head:   c791a62cbcc10c6e2c28ea77fb74b95cd33916e3
commit: 5eaeeca9e096543f6f53c4859aa083b739514d36 [41/42] cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230315/202303151816.KSWgiPht-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=5eaeeca9e096543f6f53c4859aa083b739514d36
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.19
        git checkout 5eaeeca9e096543f6f53c4859aa083b739514d36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/cgroup/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151816.KSWgiPht-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_attach_lock':
>> kernel/cgroup/cgroup.c:2237:9: error: implicit declaration of function 'get_online_cpus'; did you mean 'get_online_mems'? [-Werror=implicit-function-declaration]
    2237 |         get_online_cpus();
         |         ^~~~~~~~~~~~~~~
         |         get_online_mems
   kernel/cgroup/cgroup.c: In function 'cgroup_attach_unlock':
>> kernel/cgroup/cgroup.c:2248:9: error: implicit declaration of function 'put_online_cpus'; did you mean 'num_online_cpus'? [-Werror=implicit-function-declaration]
    2248 |         put_online_cpus();
         |         ^~~~~~~~~~~~~~~
         |         num_online_cpus
   cc1: some warnings being treated as errors


vim +2237 kernel/cgroup/cgroup.c

  2211	
  2212	/**
  2213	 * cgroup_attach_lock - Lock for ->attach()
  2214	 * @lock_threadgroup: whether to down_write cgroup_threadgroup_rwsem
  2215	 *
  2216	 * cgroup migration sometimes needs to stabilize threadgroups against forks and
  2217	 * exits by write-locking cgroup_threadgroup_rwsem. However, some ->attach()
  2218	 * implementations (e.g. cpuset), also need to disable CPU hotplug.
  2219	 * Unfortunately, letting ->attach() operations acquire cpus_read_lock() can
  2220	 * lead to deadlocks.
  2221	 *
  2222	 * Bringing up a CPU may involve creating and destroying tasks which requires
  2223	 * read-locking threadgroup_rwsem, so threadgroup_rwsem nests inside
  2224	 * cpus_read_lock(). If we call an ->attach() which acquires the cpus lock while
  2225	 * write-locking threadgroup_rwsem, the locking order is reversed and we end up
  2226	 * waiting for an on-going CPU hotplug operation which in turn is waiting for
  2227	 * the threadgroup_rwsem to be released to create new tasks. For more details:
  2228	 *
  2229	 *   http://lkml.kernel.org/r/20220711174629.uehfmqegcwn2lqzu@wubuntu
  2230	 *
  2231	 * Resolve the situation by always acquiring cpus_read_lock() before optionally
  2232	 * write-locking cgroup_threadgroup_rwsem. This allows ->attach() to assume that
  2233	 * CPU hotplug is disabled on entry.
  2234	 */
  2235	static void cgroup_attach_lock(void)
  2236	{
> 2237		get_online_cpus();
  2238		percpu_down_write(&cgroup_threadgroup_rwsem);
  2239	}
  2240	
  2241	/**
  2242	 * cgroup_attach_unlock - Undo cgroup_attach_lock()
  2243	 * @lock_threadgroup: whether to up_write cgroup_threadgroup_rwsem
  2244	 */
  2245	static void cgroup_attach_unlock(void)
  2246	{
  2247		percpu_up_write(&cgroup_threadgroup_rwsem);
> 2248		put_online_cpus();
  2249	}
  2250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
