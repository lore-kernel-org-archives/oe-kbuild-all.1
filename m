Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7A313523
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772147707; cv=none; b=XHsHS6oLTZJdibh9DxWW3XkmzyTYyxVb7FYIsYzsQqXOWsrI3hSEzM9Fr3elJJZDltjWffeSAkRlS4Uk4PV0iTYUjbGyEUwV55F1qx1HmES/vKyRjY2mbRN7s5b6DPenLvVrN/qM4GDMJK37/8m6UqrzCFHDXLhBwf59aEyxtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772147707; c=relaxed/simple;
	bh=1QULWzsr2e2b65ZGOCuixqf1C/tdqrHaHG9NUQlBUIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsm7+FHPaaQ2gWi7Rwq7y6NbFtqV48D1WxRr/2bfD7EzoUvMoK18+CIeh6Qgi7aGDy1nRpllD1fDk8Fj+Vt75QEVNZr7Dn2SfoZM4/vr67PYQLwwoIiku7meDQAXCWeEyJX5K1QrjUH3GQ8Bbp3ReXIikLiSfL2SMbUiclT02cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8huUQ1R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8huUQ1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772147705; x=1803683705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1QULWzsr2e2b65ZGOCuixqf1C/tdqrHaHG9NUQlBUIw=;
  b=d8huUQ1RLygragnRwAKRZRcNzJxpYU7BsG6Qc7YrriAlfbPDIWd621oj
   9n07ZbUk/sWPXjBPpIXKtLNAKP/7NtwdwpnJqgzh3aAxpCzHFPX4huVBv
   o4E0uLZOaMvgKNve4QeVwooe68ot4RS5Xt9aKhLYHtOBiPYbHmmm6nPYs
   BNoV3GqlrYx/bvYld9k/zhom/EIVIx1tLh2m5PevwCpEpIyoUEH/o53aM
   MaqQVGqQy5wps00pdE9NFGe9oJmiXoT/NR1Uli2qlMZmXb7d87fJ3bJPe
   buYMhQfnY36iersSSGZu0OMRK1VY8EEJp/XmLGJfFHwvQPN7YVndjG3Po
   Q==;
X-CSE-ConnectionGUID: UMctGB0dTNmVlkBrGfMZyw==
X-CSE-MsgGUID: 9u+9j9s8RzOxA9x7zH+sMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77092919"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77092919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 15:15:04 -0800
X-CSE-ConnectionGUID: 2Ujo1zZdSja+vhUZQWZEDg==
X-CSE-MsgGUID: aHK2O8JZRiaf+uBUehWdPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216623051"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2026 15:14:56 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvkYm-000000009zL-36dX;
	Thu, 26 Feb 2026 23:14:31 +0000
Date: Fri, 27 Feb 2026 07:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Nhat Pham <hoangnhat.pham@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 5/8] mm/zsmalloc,zswap: Redirect zswap_entry->obcg to
 zpdesc
Message-ID: <202602270738.SxqPEs3Q-lkp@intel.com>
References: <20260226192936.3190275-6-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226192936.3190275-6-joshua.hahnjy@gmail.com>

Hi Joshua,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260226]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-zsmalloc-Rename-zs_object_copy-to-zs_obj_copy/20260227-033239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260226192936.3190275-6-joshua.hahnjy%40gmail.com
patch subject: [PATCH 5/8] mm/zsmalloc,zswap: Redirect zswap_entry->obcg to zpdesc
config: x86_64-buildonly-randconfig-004-20260227 (https://download.01.org/0day-ci/archive/20260227/202602270738.SxqPEs3Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270738.SxqPEs3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270738.SxqPEs3Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_lru_add':
>> mm/zswap.c:626:25: error: implicit declaration of function 'obj_cgroup_memcg'; did you mean 'obj_cgroup_get'? [-Wimplicit-function-declaration]
     626 |         memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
         |                         ^~~~~~~~~~~~~~~~
         |                         obj_cgroup_get
>> mm/zswap.c:626:49: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
     626 |         memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
         |                                                 ^
   mm/zswap.c: In function 'zswap_lru_del':
   mm/zswap.c:639:49: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
     639 |         memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
         |                                                 ^


vim +626 mm/zswap.c

   607	
   608	static void zswap_lru_add(struct list_lru *list_lru, struct zswap_entry *entry,
   609				  struct obj_cgroup *objcg)
   610	{
   611		int nid = entry_to_nid(entry);
   612		struct mem_cgroup *memcg;
   613	
   614		/*
   615		 * Note that it is safe to use rcu_read_lock() here, even in the face of
   616		 * concurrent memcg offlining:
   617		 *
   618		 * 1. list_lru_add() is called before list_lru_one is dead. The
   619		 *    new entry will be reparented to memcg's parent's list_lru.
   620		 * 2. list_lru_add() is called after list_lru_one is dead. The
   621		 *    new entry will be added directly to memcg's parent's list_lru.
   622		 *
   623		 * Similar reasoning holds for list_lru_del().
   624		 */
   625		rcu_read_lock();
 > 626		memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
   627		/* will always succeed */
   628		list_lru_add(list_lru, &entry->lru, nid, memcg);
   629		rcu_read_unlock();
   630	}
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
