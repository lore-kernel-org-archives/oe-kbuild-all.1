Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C09C5235
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D08z3qh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696699160; x=1728235160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r6yw0sIzU6y7DVDso1GIiDZur1TIbOJTJcSPfIssUoc=;
  b=D08z3qh/qYghvzm4JnBWhD/WIj2+FEl7uHyvYrO9wPg+lr6JRa4k2jO6
   ERaV6i0oKofRQfj5VivgKALq+WeZw/zI6DsRxug+68ekNRCOQO4kUoUD3
   x1ugyB6yPW5rUVhKA5flhGc4rN2hqPH+RORpybRriiDkKoriOrCH+cEvI
   tlRPrS3SdBK6LTp7UiQ8ruV0qJRWaB42T8dyrTT3C7Oswpsccr5AsRDLA
   wc8TQjaQQSbY1cXzwJswxy9mF+PUwdhXWnCwHvJ3Ax5emuN5m27nCopJ5
   r7mZOi3xAXsgmfHEwkStipV/iZFrKqOC3IyX7YOZEzfwNxWq+aSRwFZis
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="382809834"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="382809834"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 10:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="1083855205"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="1083855205"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Oct 2023 10:19:18 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpAxQ-0004dZ-0A;
	Sat, 07 Oct 2023 17:19:16 +0000
Date: Sun, 8 Oct 2023 01:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/8] cgroup: Add new helpers for cgroup1
 hierarchy
Message-ID: <202310080147.tCzExe9f-lkp@intel.com>
References: <20231007140304.4390-3-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007140304.4390-3-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup-Don-t-have-to-hold-cgroup_mutex-in-task_cgroup_from_root/20231007-220510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231007140304.4390-3-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 2/8] cgroup: Add new helpers for cgroup1 hierarchy
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231008/202310080147.tCzExe9f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310080147.tCzExe9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310080147.tCzExe9f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup-v1.c:1275: warning: Function parameter or member 'tsk' not described in 'task_cgroup1_id_within_hierarchy'
>> kernel/cgroup/cgroup-v1.c:1275: warning: expecting prototype for task_cgroup_id_within_hierarchy(). Prototype was for task_cgroup1_id_within_hierarchy() instead
>> kernel/cgroup/cgroup-v1.c:1307: warning: Function parameter or member 'tsk' not described in 'task_ancestor_cgroup1_id_within_hierarchy'
>> kernel/cgroup/cgroup-v1.c:1307: warning: expecting prototype for task_ancestor_cgroup_id_within_hierarchy(). Prototype was for task_ancestor_cgroup1_id_within_hierarchy() instead


vim +1275 kernel/cgroup/cgroup-v1.c

  1265	
  1266	/**
  1267	 * task_cgroup_id_within_hierarchy - Retrieves the associated cgroup ID from
  1268	 * a task within a specific cgroup1 hierarchy.
  1269	 * @task: The task to be tested
  1270	 * @hierarchy_id: The hierarchy ID of a cgroup1
  1271	 *
  1272	 * We limit it to cgroup1 only.
  1273	 */
  1274	u64 task_cgroup1_id_within_hierarchy(struct task_struct *tsk, int hierarchy_id)
> 1275	{
  1276		struct cgroup_root *root;
  1277		struct cgroup *cgrp;
  1278		u64 cgid = 0;
  1279	
  1280		spin_lock_irq(&css_set_lock);
  1281		list_for_each_entry(root, &cgroup_roots, root_list) {
  1282			/* cgroup1 only*/
  1283			if (root == &cgrp_dfl_root)
  1284				continue;
  1285			if (root->hierarchy_id != hierarchy_id)
  1286				continue;
  1287			cgrp = task_cgroup_from_root(tsk, root);
  1288			WARN_ON_ONCE(!cgrp);
  1289			cgid = cgroup_id(cgrp);
  1290			break;
  1291		}
  1292		spin_unlock_irq(&css_set_lock);
  1293		return cgid;
  1294	}
  1295	
  1296	/**
  1297	 * task_ancestor_cgroup_id_within_hierarchy - Retrieves the associated ancestor
  1298	 * cgroup ID from a task within a specific cgroup1 hierarchy.
  1299	 * @task: The task to be tested
  1300	 * @hierarchy_id: The hierarchy ID of a cgroup1
  1301	 * @ancestor_level: level of ancestor to find starting from root
  1302	 *
  1303	 * We limit it to cgroup1 only.
  1304	 */
  1305	u64 task_ancestor_cgroup1_id_within_hierarchy(struct task_struct *tsk, int hierarchy_id,
  1306						      int ancestor_level)
> 1307	{
  1308		struct cgroup *cgrp, *ancestor;
  1309		struct cgroup_root *root;
  1310		u64 cgid = 0;
  1311	
  1312		spin_lock_irq(&css_set_lock);
  1313		list_for_each_entry(root, &cgroup_roots, root_list) {
  1314			/* cgroup1 only*/
  1315			if (root == &cgrp_dfl_root)
  1316				continue;
  1317			if (root->hierarchy_id != hierarchy_id)
  1318				continue;
  1319	
  1320			cgrp = task_cgroup_from_root(tsk, root);
  1321			WARN_ON_ONCE(!cgrp);
  1322			ancestor = cgroup_ancestor(cgrp, ancestor_level);
  1323			if (!ancestor)
  1324				break;
  1325	
  1326			cgid = cgroup_id(ancestor);
  1327			break;
  1328		}
  1329		spin_unlock_irq(&css_set_lock);
  1330		return cgid;
  1331	}
  1332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
