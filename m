Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C1383A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628106; cv=none; b=N8nadbM/v079ARTXdIpw0b2gVVVitUXUJzkAR7ab1QNMBvSwy6kXOnxtM8IcAKftgAwYorNG+L+CGsHeM+df8Nater9mVo8QFzPl6Yp8btgNu+uKcytvQyL4Vwe5GPkjN1RwPfc81uv7Mly4Gpru2rvQi2InS9yp7p0+lpF1hO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628106; c=relaxed/simple;
	bh=USzkQvfOAHo/ucHWKzq6QwfuDMl3WN17E7lO3eZ/OO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf3YJnR7rdZLOTgLMIzx5VdY+jgLFH3fBkEu2dRNJhOp+68wxOTtjynXrB/freh1hNxA1to1WnDRfkLxfn3T9pZdbBElT++BkKpGxGCQzhvK9td3FPd2B/KktTIuntzQXR1XcNi1ucOqoeL82aJ0I+JLCtJxdEzTexxQSuYnqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvQSxnDm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvQSxnDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748628104; x=1780164104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USzkQvfOAHo/ucHWKzq6QwfuDMl3WN17E7lO3eZ/OO4=;
  b=fvQSxnDmqeHmsHagl0fS75/0vFBnuuV0goOtyVwRXc9Xs0zSQAxD0ty0
   hqKjYVYXGrNAi6k50l+r/K3GPEbRJPhUiBIdNMmqci2pA3W+gMF2F5DQL
   2qlUtdeHDc03EQHGOQxHtKVtZswyAVReEx2MyVKygNjfFjGly09ajsAKB
   W6X63Xy2E49Hrhm6+UTEgEM4zIS5lK5ak+LsOT9tYB4mwC8etYHqyGcLx
   vRGs2E4oKo1/HjA+ffTvnvfstX+ljuvsn3KPtx13wFbh1k9wwrOe7ZuI4
   0K2VzVUPR9no9taqbj7oNALKTWrWcWx9ZMrrQ9bqFllvzwGslcSuzCF6N
   Q==;
X-CSE-ConnectionGUID: GOVtN23jREukizvOA5WmjQ==
X-CSE-MsgGUID: 0ItwTdjKRJewedmwdYUc5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38359355"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="38359355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:01:44 -0700
X-CSE-ConnectionGUID: /s1I72NmRQiIXqzn77n6RA==
X-CSE-MsgGUID: KbrrUcMYRECd8G0I2PWj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149084012"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 May 2025 11:01:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL432-000XrM-38;
	Fri, 30 May 2025 18:01:40 +0000
Date: Sat, 31 May 2025 02:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] memcontrol: Wait for draining of remote stocks to
 avoid OOM when charging
Message-ID: <202505310149.Oc5JgZJq-lkp@intel.com>
References: <20250530151858.672391-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530151858.672391-1-mkoutny@suse.com>

Hi Michal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Koutn/memcontrol-Wait-for-draining-of-remote-stocks-to-avoid-OOM-when-charging/20250530-231950
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250530151858.672391-1-mkoutny%40suse.com
patch subject: [RFC PATCH] memcontrol: Wait for draining of remote stocks to avoid OOM when charging
config: sh-randconfig-002-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310149.Oc5JgZJq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310149.Oc5JgZJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310149.Oc5JgZJq-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol-v1.c: In function 'mem_cgroup_resize_max':
>> mm/memcontrol-v1.c:1475:25: error: too few arguments to function 'drain_all_stock'; expected 2, have 1
    1475 |                         drain_all_stock(memcg);
         |                         ^~~~~~~~~~~~~~~
   In file included from mm/memcontrol-v1.c:17:
   mm/memcontrol-v1.h:27:6: note: declared here
      27 | void drain_all_stock(struct mem_cgroup *root_memcg, bool sync);
         |      ^~~~~~~~~~~~~~~
   mm/memcontrol-v1.c: In function 'mem_cgroup_force_empty':
   mm/memcontrol-v1.c:1505:9: error: too few arguments to function 'drain_all_stock'; expected 2, have 1
    1505 |         drain_all_stock(memcg);
         |         ^~~~~~~~~~~~~~~
   mm/memcontrol-v1.h:27:6: note: declared here
      27 | void drain_all_stock(struct mem_cgroup *root_memcg, bool sync);
         |      ^~~~~~~~~~~~~~~


vim +/drain_all_stock +1475 mm/memcontrol-v1.c

ea1e879631ffdf Roman Gushchin 2024-06-24  1438  
ea1e879631ffdf Roman Gushchin 2024-06-24  1439  static int mem_cgroup_resize_max(struct mem_cgroup *memcg,
ea1e879631ffdf Roman Gushchin 2024-06-24  1440  				 unsigned long max, bool memsw)
ea1e879631ffdf Roman Gushchin 2024-06-24  1441  {
ea1e879631ffdf Roman Gushchin 2024-06-24  1442  	bool enlarge = false;
ea1e879631ffdf Roman Gushchin 2024-06-24  1443  	bool drained = false;
ea1e879631ffdf Roman Gushchin 2024-06-24  1444  	int ret;
ea1e879631ffdf Roman Gushchin 2024-06-24  1445  	bool limits_invariant;
ea1e879631ffdf Roman Gushchin 2024-06-24  1446  	struct page_counter *counter = memsw ? &memcg->memsw : &memcg->memory;
ea1e879631ffdf Roman Gushchin 2024-06-24  1447  
ea1e879631ffdf Roman Gushchin 2024-06-24  1448  	do {
ea1e879631ffdf Roman Gushchin 2024-06-24  1449  		if (signal_pending(current)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  1450  			ret = -EINTR;
ea1e879631ffdf Roman Gushchin 2024-06-24  1451  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  1452  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  1453  
ea1e879631ffdf Roman Gushchin 2024-06-24  1454  		mutex_lock(&memcg_max_mutex);
ea1e879631ffdf Roman Gushchin 2024-06-24  1455  		/*
ea1e879631ffdf Roman Gushchin 2024-06-24  1456  		 * Make sure that the new limit (memsw or memory limit) doesn't
ea1e879631ffdf Roman Gushchin 2024-06-24  1457  		 * break our basic invariant rule memory.max <= memsw.max.
ea1e879631ffdf Roman Gushchin 2024-06-24  1458  		 */
ea1e879631ffdf Roman Gushchin 2024-06-24  1459  		limits_invariant = memsw ? max >= READ_ONCE(memcg->memory.max) :
ea1e879631ffdf Roman Gushchin 2024-06-24  1460  					   max <= memcg->memsw.max;
ea1e879631ffdf Roman Gushchin 2024-06-24  1461  		if (!limits_invariant) {
ea1e879631ffdf Roman Gushchin 2024-06-24  1462  			mutex_unlock(&memcg_max_mutex);
ea1e879631ffdf Roman Gushchin 2024-06-24  1463  			ret = -EINVAL;
ea1e879631ffdf Roman Gushchin 2024-06-24  1464  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  1465  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  1466  		if (max > counter->max)
ea1e879631ffdf Roman Gushchin 2024-06-24  1467  			enlarge = true;
ea1e879631ffdf Roman Gushchin 2024-06-24  1468  		ret = page_counter_set_max(counter, max);
ea1e879631ffdf Roman Gushchin 2024-06-24  1469  		mutex_unlock(&memcg_max_mutex);
ea1e879631ffdf Roman Gushchin 2024-06-24  1470  
ea1e879631ffdf Roman Gushchin 2024-06-24  1471  		if (!ret)
ea1e879631ffdf Roman Gushchin 2024-06-24  1472  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  1473  
ea1e879631ffdf Roman Gushchin 2024-06-24  1474  		if (!drained) {
ea1e879631ffdf Roman Gushchin 2024-06-24 @1475  			drain_all_stock(memcg);
ea1e879631ffdf Roman Gushchin 2024-06-24  1476  			drained = true;
ea1e879631ffdf Roman Gushchin 2024-06-24  1477  			continue;
ea1e879631ffdf Roman Gushchin 2024-06-24  1478  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  1479  
ea1e879631ffdf Roman Gushchin 2024-06-24  1480  		if (!try_to_free_mem_cgroup_pages(memcg, 1, GFP_KERNEL,
68cd9050d871e4 Dan Schatzberg 2024-01-03  1481  				memsw ? 0 : MEMCG_RECLAIM_MAY_SWAP, NULL)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  1482  			ret = -EBUSY;
ea1e879631ffdf Roman Gushchin 2024-06-24  1483  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  1484  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  1485  	} while (true);
ea1e879631ffdf Roman Gushchin 2024-06-24  1486  
ea1e879631ffdf Roman Gushchin 2024-06-24  1487  	if (!ret && enlarge)
ea1e879631ffdf Roman Gushchin 2024-06-24  1488  		memcg1_oom_recover(memcg);
ea1e879631ffdf Roman Gushchin 2024-06-24  1489  
ea1e879631ffdf Roman Gushchin 2024-06-24  1490  	return ret;
ea1e879631ffdf Roman Gushchin 2024-06-24  1491  }
ea1e879631ffdf Roman Gushchin 2024-06-24  1492  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
