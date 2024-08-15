Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EEC82498
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 22:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723761934; cv=none; b=i5dFLLurKVzLpHOklHAGvxdJW+xIgWlKEFJ9dlEEqYIgHpAu6HyDJC96aW/9jo6IOqRBHsRKIq9cp6slojxfPbapydCUjzve5YfAdnR5FVdKGwGsWxQwpq/jWQ0/1Fpp1tpVbp0LdUIQYskPq6mk5+emOqHd0Md+Bvdnxv9xgMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723761934; c=relaxed/simple;
	bh=877FMroqJhy9DWG4uXIco0i5TeyduLwkh4oX42+DmcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWbW60Ni25EF1PFJO4/gjhWN0KVzVKfBS7DNHU8qH8W7I+cm8KifnpZr1A7GWzsZuMmWkZZ5G/4jsAyQGyk/AMe1s60Aib5TcbsW5S5izg9XBcXY0ZIzcJTewOIFt4XmYSY7JsTPxDLo166vk3vWBvDnYKODT012oYxnHDzXlEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtTXfwr8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtTXfwr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723761932; x=1755297932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=877FMroqJhy9DWG4uXIco0i5TeyduLwkh4oX42+DmcA=;
  b=RtTXfwr8C8NvL47p/myltFFYRktYRbJRFKD0Pf8Ig9ejI49R3T2Cgxn/
   6N7myYiEOHhvDegRqvRRh84tJy2tEtXiy4CYrg6PXJngU71lGkz14ibu/
   uUNE4QY225Nue3jm8dFdD6DlkLdlnbYXFcTC9IBlxEal6j7Nj+B7BA07H
   W7JV4jRiUmG9AkxiBhiB59wrCA/IrK/xhNIwtoqDPguWMLkRDpNIntwnM
   E2L8ZSpRaDjXtOWkXFIc/XMwKTA99ZzgJIO3bxylZjCkr5havm1FI6do6
   eDXbJKy0cHHMwMcnWexXp5fwpz1rKlC5gM7Ry4qjt2e33cN3qtskNojUv
   g==;
X-CSE-ConnectionGUID: oWwQrv3cRMuHTRalYxUCWw==
X-CSE-MsgGUID: 9DxenHf4TbebwCvRGDwxrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21595623"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="21595623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 15:45:31 -0700
X-CSE-ConnectionGUID: ENIPMY5yStC9MyXc+uB2ww==
X-CSE-MsgGUID: dKO4jN44Q7Sl2zFrsUd1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59166909"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2024 15:45:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sejDh-0005gw-2H;
	Thu, 15 Aug 2024 22:45:25 +0000
Date: Fri, 16 Aug 2024 06:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7868/9905] mm/memcontrol.c:5468:38: error: 'struct
 mem_cgroup' has no member named 'cgwb_list'
Message-ID: <202408160603.g5pU2Im4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   b1c0a766b14e9c4e6a7c89abbe12fab2dec0f410
commit: 538ec11bed96705095c3bef55945ae15746ada71 [7868/9905] io/tqos: merge buffer io limit series patch from brookxu, and rework some function.
config: arm64-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240816/202408160603.g5pU2Im4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160603.g5pU2Im4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160603.g5pU2Im4-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'mem_cgroup_meminfo_read_comm':
   mm/memcontrol.c:5170:30: error: implicit declaration of function 'mem_cgroup_nr_lru_pages'; did you mean 'mem_cgroup_trylock_pages'? [-Wimplicit-function-declaration]
    5170 |                 mem_active = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_ANON) | BIT(LRU_ACTIVE_FILE), false);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                              mem_cgroup_trylock_pages
   mm/memcontrol.c: In function 'mem_cgroup_bind_blkio_write':
>> mm/memcontrol.c:5468:38: error: 'struct mem_cgroup' has no member named 'cgwb_list'
    5468 |                 INIT_LIST_HEAD(&memcg->cgwb_list);
         |                                      ^~
>> mm/memcontrol.c:5477:56: error: 'io_cgrp_subsys' undeclared (first use in this function); did you mean 'misc_cgrp_subsys'?
    5477 |         css = css_tryget_online_from_dir(path.dentry, &io_cgrp_subsys);
         |                                                        ^~~~~~~~~~~~~~
         |                                                        misc_cgrp_subsys
   mm/memcontrol.c:5477:56: note: each undeclared identifier is reported only once for each function it appears in
   mm/memcontrol.c:5494:46: error: 'struct mem_cgroup' has no member named 'cgwb_list'
    5494 |                         INIT_LIST_HEAD(&memcg->cgwb_list);
         |                                              ^~
--
   kernel/cgroup/cgroup.c: In function 'cgroup_migrate_prepare_dst':
>> kernel/cgroup/cgroup.c:2790:48: error: 'io_cgrp_id' undeclared (first use in this function); did you mean 'misc_cgrp_id'?
    2790 |                         css = dst_cset->subsys[io_cgrp_id];
         |                                                ^~~~~~~~~~
         |                                                misc_cgrp_id
   kernel/cgroup/cgroup.c:2790:48: note: each undeclared identifier is reported only once for each function it appears in
   kernel/cgroup/cgroup.c: In function 'get_cgroup_from_task':
   kernel/cgroup/cgroup.c:3962:34: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpuset_cgrp_id'?
    3962 |         cgrp = task_cgroup(task, cpuacct_cgrp_id);
         |                                  ^~~~~~~~~~~~~~~
         |                                  cpuset_cgrp_id


vim +5468 mm/memcontrol.c

  5439	
  5440	/**
  5441	 * bind memcg to a blkcg.
  5442	 * NULL str    : clear this configure.
  5443	 * illegal str : do nothing.
  5444	 * legal str   : replace configure.
  5445	 */
  5446	static ssize_t mem_cgroup_bind_blkio_write(struct kernfs_open_file *of,
  5447					char *buf, size_t nbytes, loff_t off)
  5448	{
  5449		struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
  5450		struct cgroup_subsys_state *css;
  5451		struct cgroup_subsys_state *orig_css;
  5452		struct path path;
  5453		char *pbuf;
  5454		int ret;
  5455	
  5456		buf = strstrip(buf);
  5457		/* alloc memory outside mutex */
  5458		pbuf = kzalloc(PATH_MAX, GFP_KERNEL);
  5459		if (!pbuf)
  5460			return -ENOMEM;
  5461		strncpy(pbuf, buf, PATH_MAX - 1);
  5462		mutex_lock(&memcg_max_mutex);
  5463	
  5464		/* 0 len means clear configure. */
  5465		if (!strnlen(buf, PATH_MAX)) {
  5466			memcg_blkio_free(memcg);
  5467			wb_memcg_offline(memcg);
> 5468			INIT_LIST_HEAD(&memcg->cgwb_list);
  5469	
  5470			mutex_unlock(&memcg_max_mutex);
  5471			kfree(pbuf);
  5472			return nbytes;
  5473		}
  5474		ret = kern_path(pbuf, LOOKUP_FOLLOW, &path);
  5475		if (ret)
  5476			goto err;
> 5477		css = css_tryget_online_from_dir(path.dentry, &io_cgrp_subsys);
  5478		if (IS_ERR(css)) {
  5479			ret = PTR_ERR(css);
  5480			path_put(&path);
  5481			goto err;
  5482		}
  5483		path_put(&path);
  5484	
  5485		/* if there exists old css, just free. */
  5486		orig_css = get_blkio_css(memcg);
  5487		if (orig_css) {
  5488			if (orig_css == css) {
  5489				ret = -EEXIST;
  5490				goto err;
  5491			} else {
  5492				memcg_blkio_free(memcg);
  5493				wb_memcg_offline(memcg);
  5494				INIT_LIST_HEAD(&memcg->cgwb_list);
  5495			}
  5496		}
  5497	
  5498		/* we store this two into memcg->nodeinfo */
  5499		set_blkio_path(memcg, pbuf);
  5500		set_blkio_css(memcg, css);
  5501	
  5502		mutex_unlock(&memcg_max_mutex);
  5503		return nbytes;
  5504	
  5505	 err:
  5506		kfree(pbuf);
  5507		mutex_unlock(&memcg_max_mutex);
  5508		return ret;
  5509	}
  5510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
