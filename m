Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF938DC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DF5QPtEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697558142; x=1729094142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mw59znxu3MEWeYoTxhq1GBdxbFDY/CI74H7al6iqB6I=;
  b=DF5QPtEJ3MmMa5JwfL4na1QsuWDWTrxrPrd+GRi5R4yP7TwDcNbCWh3q
   3dMyXgzxpD2C3z9elH4JDTGWp+CJH7e2BMBYn+pBGBLjZ0hik2idqBNgV
   VuVs0bcjV5XBtljQioSoX2KTSYoRUYoYYgGJUN2fUvZDxf1qk+JL5GLtJ
   2iIy1cDoqnsBqAEUtuYrzzq5CXVPDY6z3XYdhcuE+vr7ixn1pD5VIaKZA
   g5/E8I1rX4I/e3uo3d1fQYj/1G4juhohtZzmhs/jyxhJeq4f2zvrkBCNN
   ifXr6eAC3IWwNyHTWD3cE5/cSx7UtmSBJoVceLKQ3xhu3oFFgU9kJ0e6T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="416895835"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="416895835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 08:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872620134"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="872620134"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2023 08:55:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsmPx-0009ll-2I;
	Tue, 17 Oct 2023 15:55:37 +0000
Date: Tue, 17 Oct 2023 23:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v2 3/9] cgroup: Add a new helper for cgroup1
 hierarchy
Message-ID: <202310172347.Jp1j3Umf-lkp@intel.com>
References: <20231017124546.24608-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017124546.24608-4-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup-Make-operations-on-the-cgroup-root_list-RCU-safe/20231017-204729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231017124546.24608-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next v2 3/9] cgroup: Add a new helper for cgroup1 hierarchy
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310172347.Jp1j3Umf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172347.Jp1j3Umf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172347.Jp1j3Umf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup-v1.c:1277: warning: expecting prototype for task_cgroup_id_within_hierarchy(). Prototype was for task_get_cgroup1_within_hierarchy() instead


vim +1277 kernel/cgroup/cgroup-v1.c

  1265	
  1266	/**
  1267	 * task_cgroup_id_within_hierarchy - Acquires the associated cgroup of a task
  1268	 * within a specific cgroup1 hierarchy. The cgroup1 hierarchy is identified by
  1269	 * its hierarchy ID.
  1270	 * @tsk: The target task
  1271	 * @hierarchy_id: The ID of a cgroup1 hierarchy
  1272	 *
  1273	 * On success, the cgroup is returned. On failure, ERR_PTR is returned.
  1274	 * We limit it to cgroup1 only.
  1275	 */
  1276	struct cgroup *task_get_cgroup1_within_hierarchy(struct task_struct *tsk, int hierarchy_id)
> 1277	{
  1278		struct cgroup *cgrp = ERR_PTR(-ENOENT);
  1279		struct cgroup_root *root;
  1280	
  1281		rcu_read_lock();
  1282		list_for_each_entry(root, &cgroup_roots, root_list) {
  1283			/* cgroup1 only*/
  1284			if (root == &cgrp_dfl_root)
  1285				continue;
  1286			if (root->hierarchy_id != hierarchy_id)
  1287				continue;
  1288			spin_lock_irq(&css_set_lock);
  1289			cgrp = task_cgroup_from_root(tsk, root);
  1290			if (!cgrp || !cgroup_tryget(cgrp))
  1291				cgrp = ERR_PTR(-ENOENT);
  1292			spin_unlock_irq(&css_set_lock);
  1293			break;
  1294		}
  1295		rcu_read_unlock();
  1296		return cgrp;
  1297	}
  1298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
