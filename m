Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F026538F91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yfg7oSjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272623; x=1732808623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=goqek3qDBNz8MM6ijuUhNOltQNBWjQV4aMgFhOabqzY=;
  b=Yfg7oSjIABS2DdZ22LhVbybl53wUDPB/iVntXMsiRLkZld0arfv4mV8M
   +zY4KGkT2r+gk4+1UxaSUV1HW6yYX0EWgsi0d1w1nUbtFGoOSe9M7Bmxv
   /C7six/totjnoKaXM3sD2mh+epQGExWk0Fe5MGyhrZDSTUBymqMtzn9wq
   vOEpMYCP3hpmhwcqgM2XK3irldwbXDMb1yXb9CPjMoDJA4QwtQrphCDM9
   Rxps82xWdYt0BcePJ/LjAAna8ZPVtGc2OiKIbB6zNZIJv0n8h7QzK4Gql
   erjXPgol96z6JMUkHKo2Y4bEZ+HZay5NQwpQxjiTe5alK69nr1ZFyI47E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392925495"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392925495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772724588"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772724588"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 07:43:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mit-0000PA-32;
	Wed, 29 Nov 2023 15:43:35 +0000
Date: Wed, 29 Nov 2023 23:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
Message-ID: <202311292250.RUfWGNgx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
commit: 70dd375afcfe1839321ea8a65749404a99f0e773 [179/192] zswap: make shrinking memcg-aware
config: x86_64-randconfig-r112-20231129 (https://download.01.org/0day-ci/archive/20231129/202311292250.RUfWGNgx-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292250.RUfWGNgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292250.RUfWGNgx-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'mem_cgroup_from_entry':
   mm/zswap.c:298:24: error: implicit declaration of function 'obj_cgroup_memcg'; did you mean 'obj_cgroup_put'? [-Werror=implicit-function-declaration]
     return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
                           ^~~~~~~~~~~~~~~~
                           obj_cgroup_put
   mm/zswap.c:298:55: warning: pointer/integer type mismatch in conditional expression
     return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
                                                          ^
   mm/zswap.c: In function 'shrink_worker':
>> mm/zswap.c:825:17: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
      css_get(&memcg->css);
                    ^~
   cc1: some warnings being treated as errors


vim +825 mm/zswap.c

   798	
   799	static void shrink_worker(struct work_struct *w)
   800	{
   801		struct zswap_pool *pool = container_of(w, typeof(*pool),
   802							shrink_work);
   803		struct mem_cgroup *memcg;
   804		int ret, failures = 0;
   805	
   806		/* global reclaim will select cgroup in a round-robin fashion. */
   807		do {
   808			spin_lock(&zswap_pools_lock);
   809			memcg = pool->next_shrink =
   810				mem_cgroup_iter_online(NULL, pool->next_shrink, NULL, true);
   811	
   812			/* full round trip */
   813			if (!memcg) {
   814				spin_unlock(&zswap_pools_lock);
   815				if (++failures == MAX_RECLAIM_RETRIES)
   816					break;
   817	
   818				goto resched;
   819			}
   820	
   821			/*
   822			 * Acquire an extra reference to the iterated memcg in case the
   823			 * original reference is dropped by the zswap offlining callback.
   824			 */
 > 825			css_get(&memcg->css);
   826			spin_unlock(&zswap_pools_lock);
   827	
   828			ret = shrink_memcg(memcg);
   829			mem_cgroup_put(memcg);
   830	
   831			if (ret == -EINVAL)
   832				break;
   833			if (ret && ++failures == MAX_RECLAIM_RETRIES)
   834				break;
   835	
   836	resched:
   837			cond_resched();
   838		} while (!zswap_can_accept());
   839	}
   840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
