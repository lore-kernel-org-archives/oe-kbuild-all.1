Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7AF9CA5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695579400; x=1727115400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LeWZPMGE0kUpyvqxV3XS+LqDUjkuInUraTANHBEf1Iw=;
  b=SEghq29WHy9j3I4LoAvhTQ3XpFZ6V40vxQb31PTDzwDw029c1qT1S68K
   Aldww6byd+1mSC9BHHgErS3tUKTHFVm1MtFBEdncuFyuTprpGDoMfGemu
   dZ3Sp7tdB/OlRDYcZwElvvgN20AHwlDAkPuuwCeokddkreTdQJvhbfcTZ
   cUZoUSAp5+sPIpK04JUTdvjXB110AF4tNf0ATd9cMCt2JqasfBInQ1ac7
   9zAHempWqRks0JUzq6e742jM4S4it1i/DX3W9mHIyuBGAyzi/I0osx8j/
   ALWtWn+jWe1V4x82ibd+5SCXndlXilCKMR0I0OMPNFU29ng01G1HhAWmc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445221364"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="445221364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 11:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995134869"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="995134869"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2023 11:16:38 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkTem-0000HD-22;
	Sun, 24 Sep 2023 18:16:36 +0000
Date: Mon, 25 Sep 2023 02:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 3/8] cgroup: Add
 cgroup_get_from_id_within_subsys()
Message-ID: <202309250253.tLz2qzge-lkp@intel.com>
References: <20230922112846.4265-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922112846.4265-4-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Fix-missed-rcu-read-lock-in-bpf_task_under_cgroup/20230922-193148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230922112846.4265-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 3/8] cgroup: Add cgroup_get_from_id_within_subsys()
config: x86_64-randconfig-016-20230925 (https://download.01.org/0day-ci/archive/20230925/202309250253.tLz2qzge-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250253.tLz2qzge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250253.tLz2qzge-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.

All warnings (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_get_from_id_within_subsys':
   kernel/cgroup/cgroup.c:6216:23: warning: array subscript is above array bounds [-Warray-bounds]
      root = cgroup_subsys[ssid]->root;
             ~~~~~~~~~~~~~^~~~~~
>> kernel/cgroup/cgroup.c:6216:23: warning: array subscript is below array bounds [-Warray-bounds]


vim +6216 kernel/cgroup/cgroup.c

  6196	
  6197	/*
  6198	 * cgroup_get_from_id_within_subsys - get the cgroup associated with cgroup id
  6199	 *                                    within specific subsystem
  6200	 * @cgid: cgroup id
  6201	 * @ssid: cgroup subsystem id, -1 for cgroup default tree
  6202	 * On success return the cgrp or ERR_PTR on failure
  6203	 * Only cgroups within current task's cgroup NS are valid.
  6204	 */
  6205	struct cgroup *cgroup_get_from_id_within_subsys(u64 cgid, int ssid)
  6206	{
  6207		struct cgroup_root *root;
  6208		struct kernfs_node *kn;
  6209		struct cgroup *cgrp;
  6210	
  6211		if (ssid == -1) {
  6212			root = &cgrp_dfl_root;
  6213		} else {
  6214			if (ssid >= CGROUP_SUBSYS_COUNT)
  6215				return ERR_PTR(-EINVAL);
> 6216			root = cgroup_subsys[ssid]->root;
  6217		}
  6218	
  6219		kn = kernfs_find_and_get_node_by_id(root->kf_root, cgid);
  6220		if (!kn)
  6221			return ERR_PTR(-ENOENT);
  6222	
  6223		if (kernfs_type(kn) != KERNFS_DIR) {
  6224			kernfs_put(kn);
  6225			return ERR_PTR(-ENOENT);
  6226		}
  6227	
  6228		rcu_read_lock();
  6229	
  6230		cgrp = rcu_dereference(*(void __rcu __force **)&kn->priv);
  6231		if (cgrp && !cgroup_tryget(cgrp))
  6232			cgrp = NULL;
  6233	
  6234		rcu_read_unlock();
  6235		kernfs_put(kn);
  6236	
  6237		if (!cgrp)
  6238			return ERR_PTR(-ENOENT);
  6239	
  6240		return cgrp;
  6241	}
  6242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
