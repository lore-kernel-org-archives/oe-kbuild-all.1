Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9815C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 01:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727658041; cv=none; b=kUuIgpoO4QvpZDuAa3spe6MFH6ehZtCrb+BV8xHhJIwzfKQM8kdTYSUCCqDQMHVW63m9WJJNvOUO0a2adSdYesWqSa1BcJV95U8iI0HFCrCE9CDE8WDXv8XWxeFB3ZozcrnUXV7M/EpnixEVSwMFv1cU+yf6xF04jNmlk+Ri7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727658041; c=relaxed/simple;
	bh=ooMS6hx7A6GOZSYy4sKpqeaDTLCqjb3Cz/PGiV8TGow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A9x8DIceg+zL8sU8yCyLhJlpC6SyLjrG+PDo64zCvUHP/PB0gnRDu8g8mf/WQUHaEbxtLC1Y+0C8NnZKLDlCGY+hRdIyIig9m8MRjUHWTbGw8T3kXH0MmSj6SGZ7FxGEMwzAFU3h37GOOckf/S0zF8tBWa88CfGCuNygg93jPzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxxKIQPv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxxKIQPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727658040; x=1759194040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ooMS6hx7A6GOZSYy4sKpqeaDTLCqjb3Cz/PGiV8TGow=;
  b=ZxxKIQPvVU+nZtDrrzrpw1CO3zuRU7kFtUDu1U5myDlCqwMs9VYvCh84
   AAvGaUuPaX9sooWG65qUiY1j4hbLw0I+2CnTQh0IDI+z3ZLcFKqaqIzcp
   khiq/+BHLSWBhMOnea/Kc8QUZbymlzApmxavyf2WSTCh33vaO9ZgCyJNt
   IGRA79YmRRhTncQWl8wECdN9wwrft9UcrnYNh9YlMVtTjkYj5C/9LcJKS
   NRo3WRk0kLO7b3020wfm3KQeu3C4D+rkQDrD7ZaYIuTkrelhhATrqIDx2
   OSslbTlmo38L1TFRE8uC7ZX/wyY2edngnHx6370gtMED2VF/7zuEfM6CH
   w==;
X-CSE-ConnectionGUID: b0rGUlWgTZ2Oq7VcOYJ0kg==
X-CSE-MsgGUID: J0llyBCZT/ilHY5FTh76Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44191546"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="44191546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 18:00:39 -0700
X-CSE-ConnectionGUID: cY3Jl3JVThG69tdDGEC7FQ==
X-CSE-MsgGUID: 0AnENBjoSkiwBERxcOXX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73408539"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2024 18:00:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv4m9-000OrB-1o;
	Mon, 30 Sep 2024 01:00:33 +0000
Date: Mon, 30 Sep 2024 09:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12017/12031] mm/memcontrol.c:6287:12: warning:
 'mem_cgroup_bind_blkio_show' defined but not used
Message-ID: <202409300839.3XARZneM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: a12bb1a43d7ac2aa80348a912ccaea98cd50bd98 [12017/12031] rue/io: add bufio isolation based for cgroup v1
config: x86_64-buildonly-randconfig-003-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300839.3XARZneM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300839.3XARZneM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300839.3XARZneM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:3012:6: warning: no previous prototype for 'memory_qos_update' [-Wmissing-prototypes]
    3012 | void memory_qos_update(void)
         |      ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:3027:5: warning: no previous prototype for 'memory_qos_prio_reclaim_ratio_update' [-Wmissing-prototypes]
    3027 | int memory_qos_prio_reclaim_ratio_update(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:3132:5: warning: no previous prototype for 'mem_cgroup_notify_prio_change' [-Wmissing-prototypes]
    3132 | int mem_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'mem_cgroup_shrink_pagecache':
   mm/memcontrol.c:4225:63: warning: variable 'pre_used' set but not used [-Wunused-but-set-variable]
    4225 |         unsigned long pages_used, pages_max, goal_pages_used, pre_used;
         |                                                               ^~~~~~~~
   mm/memcontrol.c: At top level:
   mm/memcontrol.c:4382:15: warning: no previous prototype for 'mem_cgroup_pagecache_get_reclaim_pages' [-Wmissing-prototypes]
    4382 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'mem_cgroup_meminfo_read_comm':
   mm/memcontrol.c:5955:30: error: implicit declaration of function 'mem_cgroup_nr_lru_pages'; did you mean 'mem_cgroup_trylock_pages'? [-Werror=implicit-function-declaration]
    5955 |                 mem_active = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_ANON) | BIT(LRU_ACTIVE_FILE), false);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                              mem_cgroup_trylock_pages
   mm/memcontrol.c: At top level:
   mm/memcontrol.c:7222:6: warning: no previous prototype for 'charge_dying_memcgs' [-Wmissing-prototypes]
    7222 | void charge_dying_memcgs(struct mem_cgroup *memcg)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:10240:6: warning: no previous prototype for 'reap_slab' [-Wmissing-prototypes]
   10240 | void reap_slab(struct mem_cgroup *memcg)
         |      ^~~~~~~~~
>> mm/memcontrol.c:6287:12: warning: 'mem_cgroup_bind_blkio_show' defined but not used [-Wunused-function]
    6287 | static int mem_cgroup_bind_blkio_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:6225:16: warning: 'mem_cgroup_bind_blkio_write' defined but not used [-Wunused-function]
    6225 | static ssize_t mem_cgroup_bind_blkio_write(struct kernfs_open_file *of,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mem_cgroup_bind_blkio_show +6287 mm/memcontrol.c

  6224	
> 6225	static ssize_t mem_cgroup_bind_blkio_write(struct kernfs_open_file *of,
  6226					char *buf, size_t nbytes, loff_t off)
  6227	{
  6228		struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
  6229		struct cgroup_subsys_state *css;
  6230		struct path path;
  6231		char *pbuf;
  6232		int ret;
  6233	
  6234		if (!rue_io_enabled())
  6235			return -EPERM;
  6236	
  6237		buf = strstrip(buf);
  6238	
  6239		/* alloc memory outside mutex */
  6240		pbuf = kzalloc(PATH_MAX, GFP_KERNEL);
  6241		if (!pbuf)
  6242			return -ENOMEM;
  6243		strscpy(pbuf, buf, PATH_MAX - 1);
  6244	
  6245		mutex_lock(&memcg_max_mutex);
  6246	
  6247		if (memcg->bind_blkio) {
  6248			WARN_ON(!memcg->bind_blkio_path);
  6249			kfree(memcg->bind_blkio_path);
  6250			memcg->bind_blkio_path = NULL;
  6251			css_put(memcg->bind_blkio);
  6252			memcg->bind_blkio = NULL;
  6253	
  6254			wb_memcg_offline(memcg);
  6255			INIT_LIST_HEAD(&memcg->cgwb_list);
  6256		}
  6257	
  6258		if (!strnlen(buf, PATH_MAX)) {
  6259			mutex_unlock(&memcg_max_mutex);
  6260			kfree(pbuf);
  6261			return nbytes;
  6262		}
  6263	
  6264		ret = kern_path(pbuf, LOOKUP_FOLLOW, &path);
  6265		if (ret)
  6266			goto err;
  6267	
  6268		css = css_tryget_online_from_dir(path.dentry, &io_cgrp_subsys);
  6269		if (IS_ERR(css)) {
  6270			ret = PTR_ERR(css);
  6271			path_put(&path);
  6272			goto err;
  6273		}
  6274		path_put(&path);
  6275	
  6276		memcg->bind_blkio_path = pbuf;
  6277		memcg->bind_blkio = css;
  6278		mutex_unlock(&memcg_max_mutex);
  6279		return nbytes;
  6280	
  6281	err:
  6282		kfree(pbuf);
  6283		mutex_unlock(&memcg_max_mutex);
  6284		return ret;
  6285	}
  6286	
> 6287	static int mem_cgroup_bind_blkio_show(struct seq_file *m, void *v)
  6288	{
  6289		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  6290	
  6291		if (memcg->bind_blkio_path)
  6292			seq_printf(m, "%s\n", memcg->bind_blkio_path);
  6293	
  6294		return 0;
  6295	}
  6296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
