Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697765E089
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 20:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709931165; cv=none; b=ITH2XUhM5rsMd/yiaecd2xMYsizgN+JiQD9UTEtVbHAS78UyPwvZdyIKxqMH53RwJQeFhwiuSL7ZOY1D/bdmIBVRXUVrsapZVbkF2P1wMA2873qAj+YBy5RngTpczE6g8K5SBAbMZr8/u+446aL3OA/AIdd7UoC72cZCsdSe9Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709931165; c=relaxed/simple;
	bh=yUlQc2JaaHr99TETPKIRv6aotfBV9inxW5E8hx5dZj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LONVTKjxFcAYCbScbFiVA+ZnZblE7tUnlchVC1+YZ9pTjXhX4sFWpXWP31RaYRM4J78olLTSkP5icsnH0ffmyJt8DducUDRJFT+JXXEaAD5lYc5yN5NVnAIXRipNDEBJZ8Zfdemkl9I2n06ZwsPmG/JNazVnzciwqM7K0kg2ddQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4GvxywX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4GvxywX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709931164; x=1741467164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yUlQc2JaaHr99TETPKIRv6aotfBV9inxW5E8hx5dZj4=;
  b=b4GvxywXpKh/1+rzpKLKVgdf1S7FEr1DtjdoEV9xfE3NHPbww82J37/y
   A4WOhbS/12umGihfJgNgqpfuYsdWtZY8GyBk9J88qQbe1cS4DP4JyUCV1
   f19kbTBv5e5JLdcAFrJUSogh/oxkFnEeCKq8GZ/YoFbJF5vLpF051XWny
   CHHdGxt5Q5OWJ/kcFF8O5p9Qe6LF7npeV0XkJTI5zMnczW0o4OPFUaGPa
   skr9U4ZSHjbcHrZvsvgnrZ9Y5ahjNc2/4m3vnkI1jYYRMFe1KRkYdDGaV
   raqRuDWRlnUwEoZvanVzIhVWZzbZwDcVSQfrWgw4L4EKIaN7EYwvtw0Yh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="27140622"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="27140622"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 12:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="41540944"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2024 12:52:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rihCB-0006hz-2B;
	Fri, 08 Mar 2024 20:51:59 +0000
Date: Sat, 9 Mar 2024 04:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26653/27434] mm/memcontrol.c:6774:12:
 warning: 'mem_cgroup_bind_blkio_show' defined but not used
Message-ID: <202403090443.itL3XH7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: a5aa29530f7481ece11a0752dfaefa854ca02b58 [26653/27434] rue/io: add bufio isolation based for cgroup v1
config: arm64-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240309/202403090443.itL3XH7r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090443.itL3XH7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090443.itL3XH7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/page_counter.h:6,
                    from mm/memcontrol.c:28:
   mm/memcontrol.c: In function 'mem_cgroup_get_max':
   include/linux/kernel.h:876:45: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                                             ^
   include/linux/kernel.h:859:30: note: in definition of macro '__cmp'
     859 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:876:25: note: in expansion of macro '__careful_cmp'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/memcontrol.c:2314:32: note: in expansion of macro 'min'
    2314 |                         max += min(READ_ONCE(memcg->swap.max),
         |                                ^~~
   include/linux/kernel.h:876:45: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                                             ^
   include/linux/kernel.h:859:30: note: in definition of macro '__cmp'
     859 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:876:25: note: in expansion of macro '__careful_cmp'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/memcontrol.c:2321:32: note: in expansion of macro 'min'
    2321 |                         max += min(swap, (unsigned long)total_swap_pages);
         |                                ^~~
   mm/memcontrol.c: At top level:
   mm/memcontrol.c:3316:6: warning: no previous prototype for 'memory_qos_update' [-Wmissing-prototypes]
    3316 | void memory_qos_update(void)
         |      ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:3331:5: warning: no previous prototype for 'memory_qos_prio_reclaim_ratio_update' [-Wmissing-prototypes]
    3331 | int memory_qos_prio_reclaim_ratio_update(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'mem_cgroup_shrink_pagecache':
   mm/memcontrol.c:4538:63: warning: variable 'pre_used' set but not used [-Wunused-but-set-variable]
    4538 |         unsigned long pages_used, pages_max, goal_pages_used, pre_used;
         |                                                               ^~~~~~~~
   mm/memcontrol.c: At top level:
   mm/memcontrol.c:4696:15: warning: no previous prototype for 'mem_cgroup_pagecache_get_reclaim_pages' [-Wmissing-prototypes]
    4696 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'mem_cgroup_meminfo_read':
   mm/memcontrol.c:6634:17: error: expected expression before ')' token
    6634 |                 );
         |                 ^
   mm/memcontrol.c:6467:32: warning: variable 'mem_rss_huge' set but not used [-Wunused-but-set-variable]
    6467 |         unsigned long mem_rss, mem_rss_huge;
         |                                ^~~~~~~~~~~~
   mm/memcontrol.c: At top level:
   mm/memcontrol.c:7648:6: warning: no previous prototype for 'charge_dying_memcgs' [-Wmissing-prototypes]
    7648 | void charge_dying_memcgs(struct mem_cgroup *memcg)
         |      ^~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:10336:6: warning: no previous prototype for 'reap_slab' [-Wmissing-prototypes]
   10336 | void reap_slab(struct mem_cgroup *memcg)
         |      ^~~~~~~~~
>> mm/memcontrol.c:6774:12: warning: 'mem_cgroup_bind_blkio_show' defined but not used [-Wunused-function]
    6774 | static int mem_cgroup_bind_blkio_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:6712:16: warning: 'mem_cgroup_bind_blkio_write' defined but not used [-Wunused-function]
    6712 | static ssize_t mem_cgroup_bind_blkio_write(struct kernfs_open_file *of,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_bind_blkio_show +6774 mm/memcontrol.c

  6711	
> 6712	static ssize_t mem_cgroup_bind_blkio_write(struct kernfs_open_file *of,
  6713					char *buf, size_t nbytes, loff_t off)
  6714	{
  6715		struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
  6716		struct cgroup_subsys_state *css;
  6717		struct path path;
  6718		char *pbuf;
  6719		int ret;
  6720	
  6721		if (!rue_io_enabled())
  6722			return -EPERM;
  6723	
  6724		buf = strstrip(buf);
  6725	
  6726		/* alloc memory outside mutex */
  6727		pbuf = kzalloc(PATH_MAX, GFP_KERNEL);
  6728		if (!pbuf)
  6729			return -ENOMEM;
  6730		strncpy(pbuf, buf, PATH_MAX - 1);
  6731	
  6732		mutex_lock(&memcg_max_mutex);
  6733	
  6734		if (memcg->bind_blkio) {
  6735			WARN_ON(!memcg->bind_blkio_path);
  6736			kfree(memcg->bind_blkio_path);
  6737			memcg->bind_blkio_path = NULL;
  6738			css_put(memcg->bind_blkio);
  6739			memcg->bind_blkio = NULL;
  6740	
  6741			wb_memcg_offline(memcg);
  6742			INIT_LIST_HEAD(&memcg->cgwb_list);
  6743		}
  6744	
  6745		if (!strnlen(buf, PATH_MAX)) {
  6746			mutex_unlock(&memcg_max_mutex);
  6747			kfree(pbuf);
  6748			return nbytes;
  6749		}
  6750	
  6751		ret = kern_path(pbuf, LOOKUP_FOLLOW, &path);
  6752		if (ret)
  6753			goto err;
  6754	
  6755		css = css_tryget_online_from_dir(path.dentry, &io_cgrp_subsys);
  6756		if (IS_ERR(css)) {
  6757			ret = PTR_ERR(css);
  6758			path_put(&path);
  6759			goto err;
  6760		}
  6761		path_put(&path);
  6762	
  6763		memcg->bind_blkio_path = pbuf;
  6764		memcg->bind_blkio = css;
  6765		mutex_unlock(&memcg_max_mutex);
  6766		return nbytes;
  6767	
  6768	err:
  6769		kfree(pbuf);
  6770		mutex_unlock(&memcg_max_mutex);
  6771		return ret;
  6772	}
  6773	
> 6774	static int mem_cgroup_bind_blkio_show(struct seq_file *m, void *v)
  6775	{
  6776		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  6777	
  6778		if (memcg->bind_blkio_path)
  6779			seq_printf(m, "%s\n", memcg->bind_blkio_path);
  6780	
  6781		return 0;
  6782	}
  6783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
