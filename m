Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C9388E6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 03:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773287562; cv=none; b=SyfYHo1mfr6R48XIrC1rtOPraE/zHhxbEgmaolSNEj3GUSfuwBRg8nmo08PqCXGoFGzwKtoT503BSftn6mJRgXqR+eBoqTztubVynWKhWOmY3oqfMq+pudwTkHVkGiGwLUXH+60CFK/Xe0sPSvFepqB6A7EGd5QyxS8rLvJNYtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773287562; c=relaxed/simple;
	bh=NYSMMxWAdzwBiR4jQuYBqPNH2GBmxUx4Fg6ov9K48nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeTr6hZqoiOnfSdXtgiGMqiGeThwwag43MpHZ8a7irJNCqhBssiU/HPmVF7MNifCr8TqRs4HAFPD63bpEyOiR2AxJYwfjsiy4iretV3s4Yo9Pl4/DJgmji7b0XzI+5oOvU3cE3I0gVbOmP62eqv5zVfo+4aSyquqGxiCAUg7ZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EruP8z4C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EruP8z4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773287559; x=1804823559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NYSMMxWAdzwBiR4jQuYBqPNH2GBmxUx4Fg6ov9K48nQ=;
  b=EruP8z4CyDX6S6VBEfBLxOfrVSF1ehhmWZhAW9CNY6g8Kl2GOk4sIee1
   dBXwwKSWfB5LF2b/I3m3D+fJV6z/r0Ilgwgx6L++CG1kD/If/596Nqwmg
   Q93Lu3HexmmNkEbgnS+EF67aWRIk+ouAwIoI9uFdtA9AZhpez0GFsElSz
   Sppab+AmXSvwLfjCZEXA0st5P3qcTrXao1+4hhj9sbQGGmUwdf9KAeryw
   PdhyyhngYkwVidg2VS5cDnZCm+JZZs326qp6QCvxS8AgVLlb6/3NMlWBm
   K3A3b91rUX7EjgswroN0EOaJ2r34EPDxv+jpxbEpeBjJCE9Jj3kX58NwB
   A==;
X-CSE-ConnectionGUID: /7E/N27wQ4q4ituZAtpsDA==
X-CSE-MsgGUID: +F4z+k9wSqy14zJQiTA34A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91749604"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="91749604"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 20:52:31 -0700
X-CSE-ConnectionGUID: pDOIVSnKRbS+/9aixbbHnA==
X-CSE-MsgGUID: P2LnaImdTJCJ3J9r9AYWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="220863665"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Mar 2026 20:52:28 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0X60-0000000022d-32hF;
	Thu, 12 Mar 2026 03:52:24 +0000
Date: Thu, 12 Mar 2026 11:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Nhat Pham <hoangnhat.pham@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 10/11] mm/zsmalloc: Handle single object charge migration
 in migrate_zspage
Message-ID: <202603121115.dm3Z6KvA-lkp@intel.com>
References: <20260311195153.4013476-11-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311195153.4013476-11-joshua.hahnjy@gmail.com>

Hi Joshua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v7.0-rc3]
[cannot apply to akpm-mm/mm-everything next-20260311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-zsmalloc-Rename-zs_object_copy-to-zs_obj_copy/20260312-035531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260311195153.4013476-11-joshua.hahnjy%40gmail.com
patch subject: [PATCH 10/11] mm/zsmalloc: Handle single object charge migration in migrate_zspage
config: arc-randconfig-001-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121115.dm3Z6KvA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121115.dm3Z6KvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121115.dm3Z6KvA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zsmalloc.c: In function 'zs_compact.part.28':
>> mm/zsmalloc.c:1696:15: warning: 's_idx' is used uninitialized in this function [-Wuninitialized]
     unsigned int s_idx, d_idx;
                  ^~~~~


vim +/s_idx +1696 mm/zsmalloc.c

  1686	
  1687	#ifdef CONFIG_MEMCG
  1688	static void zs_migrate_objcg(struct zspage *s_zspage, struct zspage *d_zspage,
  1689				     unsigned long used_obj, unsigned long free_obj,
  1690				     struct zs_pool *pool, int size)
  1691	{
  1692		struct zpdesc *s_zpdesc, *d_zpdesc;
  1693		struct obj_cgroup *objcg;
  1694		struct mem_cgroup *memcg;
  1695		struct lruvec *l;
> 1696		unsigned int s_idx, d_idx;
  1697		unsigned int s_off, d_off;
  1698		int charges[4], nids[4], partial;
  1699		int s_bytes_in_page, d_bytes_in_page;
  1700		int i;
  1701	
  1702		if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
  1703			goto out;
  1704	
  1705		obj_to_location(used_obj, &s_zpdesc, &s_idx);
  1706		obj_to_location(free_obj, &d_zpdesc, &d_idx);
  1707	
  1708		objcg = s_zspage->objcgs[s_idx];
  1709		if (!objcg)
  1710			goto out;
  1711	
  1712		/*
  1713		 * The object migration here can touch up to 4 nodes.
  1714		 * Instead of breaking down all possible combinations of node changes,
  1715		 * just uncharge entirely from the source and charge entirely to the
  1716		 * destination, even if there is are node overlaps between src and dst.
  1717		 */
  1718		s_off = (s_idx * size) % PAGE_SIZE;
  1719		d_off = (d_idx * size) % PAGE_SIZE;
  1720		s_bytes_in_page = min_t(int, size, PAGE_SIZE - s_off);
  1721		d_bytes_in_page = min_t(int, size, PAGE_SIZE - d_off);
  1722	
  1723		charges[0] = -s_bytes_in_page;
  1724		nids[0] = page_to_nid(zpdesc_page(s_zpdesc));
  1725		charges[1] = -(size - s_bytes_in_page); /* 0 if object doesn't span */
  1726		if (charges[1])
  1727			nids[1] = page_to_nid(zpdesc_page(get_next_zpdesc(s_zpdesc)));
  1728	
  1729		charges[2] = d_bytes_in_page;
  1730		nids[2] = page_to_nid(zpdesc_page(d_zpdesc));
  1731		charges[3] = size - d_bytes_in_page; /* 0 if object doesn't span */
  1732		if (charges[3])
  1733			nids[3] = page_to_nid(zpdesc_page(get_next_zpdesc(d_zpdesc)));
  1734	
  1735		rcu_read_lock();
  1736		memcg = obj_cgroup_memcg(objcg);
  1737		for (i = 0; i < 4; i++) {
  1738			if (!charges[i])
  1739				continue;
  1740	
  1741			l = mem_cgroup_lruvec(memcg, NODE_DATA(nids[i]));
  1742			partial = (PAGE_SIZE * charges[i]) / size;
  1743			mod_memcg_lruvec_state(l, pool->compressed_stat, charges[i]);
  1744			mod_memcg_lruvec_state(l, pool->uncompressed_stat, partial);
  1745		}
  1746		rcu_read_unlock();
  1747	
  1748		dec_node_page_state(zpdesc_page(s_zpdesc), pool->uncompressed_stat);
  1749		inc_node_page_state(zpdesc_page(d_zpdesc), pool->uncompressed_stat);
  1750	
  1751	out:
  1752		d_zspage->objcgs[d_idx] = s_zspage->objcgs[s_idx];
  1753		s_zspage->objcgs[s_idx] = NULL;
  1754	}
  1755	#else
  1756	static void zs_migrate_objcg(struct zspage *s_zspage, struct zspage *d_zspage,
  1757				     unsigned long used_obj, unsigned long free_obj,
  1758				     struct zs_pool *pool, int size)
  1759	{
  1760	}
  1761	#endif
  1762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
