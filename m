Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8153F176AA4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504169; cv=none; b=QvBPfK3RAM6iI2atm2LdZnKb7bPkHAAjfOR9xxSR7YnXF5delP+zjpwy9MAM1tAHSrPxEomPqJdrvj/6WFLhxwHxYQYdoWC58eArgnwi1TuTqCe9Ys8xmudLDWLRuJPmFzvZuo09hT+w9HQhG2D9Zs/feG6wo3fFHUNn6cPulLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504169; c=relaxed/simple;
	bh=OiXuWQ3gmwLbSqHqvvkM5/qZNddJ4wGH5KpFp9TKDmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=imwDO1DQXGAlf7XwkeVoW0OAMmtQCS7cypQ5SlWgo6SSInHzhTNX5008VZsYTzrHKyKkbyZ31H/iy1sxTL7Zul55iZusv3TToSq2QxvEwiyZtOa3TtRYiEjQe5kRNFrvloEl4xDNgd1xj+/jYBgyshEtXUcvZk7BD/cH+pyVZzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrOFQo7S; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrOFQo7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722504168; x=1754040168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiXuWQ3gmwLbSqHqvvkM5/qZNddJ4wGH5KpFp9TKDmM=;
  b=HrOFQo7ShL8kzYM8K3mzmTtj/cTIrMCtwr/pS9CiiQtKJt3lsib0Hswb
   ASLbS7qNHVItKgKALuCjZ3t32dc5gnU4LVLaTKP48FijtWPCUVfnts3Pt
   VRHegTeGfrlpZeuIY2M5UrZE0/bmIj5HJvCUW5fQdDHwO2aH+EW+VzGZy
   wyr+/I6ikiL/RjdoAk2W2PrxFGh2ohOrLNphhCZPXedqwKrQyWVl1HGoz
   T8uCWuCch2ZLZJDwZo4LhZ8k0LqBl2BBvAojrN32ldiKWaZB+WhiACB5b
   Cr1df2CaaEnL7DjcCGGjt/q++xH6/79fV2Wlhs/JcuTBYL2bR25LcM5oL
   w==;
X-CSE-ConnectionGUID: Tf1YRlJtReCKfZutlyaZVA==
X-CSE-MsgGUID: 1NlkWMeYQbauteas13nBAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31840114"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="31840114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:22:30 -0700
X-CSE-ConnectionGUID: qW7pNx1sS/quvYPP3oNLuw==
X-CSE-MsgGUID: uVM446haSByf6nqQmR54Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54950972"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Aug 2024 02:22:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZS0s-000vPs-2g;
	Thu, 01 Aug 2024 09:22:22 +0000
Date: Thu, 1 Aug 2024 17:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7868/9880] mm/memcontrol.c:5441: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202408011754.8mO4z4tm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   336eee539414035fa6531cd17d4d833f36100834
commit: 538ec11bed96705095c3bef55945ae15746ada71 [7868/9880] io/tqos: merge buffer io limit series patch from brookxu, and rework some function.
config: x86_64-oc_stream_base_config (https://download.01.org/0day-ci/archive/20240801/202408011754.8mO4z4tm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011754.8mO4z4tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011754.8mO4z4tm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:5441: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * bind memcg to a blkcg.


vim +5441 mm/memcontrol.c

  5439	
  5440	/**
> 5441	 * bind memcg to a blkcg.
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
  5468			INIT_LIST_HEAD(&memcg->cgwb_list);
  5469	
  5470			mutex_unlock(&memcg_max_mutex);
  5471			kfree(pbuf);
  5472			return nbytes;
  5473		}
  5474		ret = kern_path(pbuf, LOOKUP_FOLLOW, &path);
  5475		if (ret)
  5476			goto err;
  5477		css = css_tryget_online_from_dir(path.dentry, &io_cgrp_subsys);
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
