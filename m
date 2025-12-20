Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E527B33B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766259709; cv=none; b=aXKKGb6VQooki9abU2a2+5qynbsQN+QGhlf9PEaD6M/dFGkbPOzWiKrEjd10VK+Dxbk8Q0ovX6ZmmJwBxM6wpRW+Lg7m43i4bOdWQxQqMLlA//JvTAr020Pn311mfe5rC+pfj9brYpb6aNYGlr3hMmcQor6K2Qt7/HDCD59aaHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766259709; c=relaxed/simple;
	bh=NWwHWHB/jF6xTbzUUDKsfrDpUiOcoOlvcS+Zhix0sMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhFgg1MasSake7wtz5aPG8sM3mcQ36GMB7R4tEcGPr9u3hjTIGVo3ROwcKf6YPbXQTpmf0hrIXpHZts3SGgyTJZoz6ExQAo1mHnle894tTNwhmTVU0ojcOj522p+0jQVI1CyFs4utvm8BXya3lqeFTwtkdYQMz6hzQWw/IfOrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ux79b2Gz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ux79b2Gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766259707; x=1797795707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NWwHWHB/jF6xTbzUUDKsfrDpUiOcoOlvcS+Zhix0sMA=;
  b=Ux79b2Gz1mxHhfoT7UnijfLU83AI53GqhteDwcxhnvOWO1Fiz8KICh/k
   puFGKe2XdFfSQyYC+/sxq+YLbWXs6mG8OqqsnqHp76wLh7ZLEhhLcbq8s
   lHio4IYDBS1ntOOIbTEAsJZUTe4L6EUToyTWxGhl6zeVcOQia+Plmd/iQ
   Zbk3+GQo88QaMpBHHNgpYcQokODy6Yh/vLZ5monymTnCS0zvzrBmJ6mvw
   HoU9irMHb7cQ6I0zn737EgW66sBgxL9IvxRadR5+gRqW2k4MPTktBEe+p
   aL/rWICjgXUQDsZBV4z759w9vP62QpCajR0ac8kOzT3ds1mf/2+sMChEz
   Q==;
X-CSE-ConnectionGUID: JIzJ+KvuQtKHZ7FC/B8TLQ==
X-CSE-MsgGUID: xrjy4TM8QxaZLAn8g8g1uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68261931"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68261931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:41:47 -0800
X-CSE-ConnectionGUID: gHjFpKNSQyiIYNTK84EARA==
X-CSE-MsgGUID: TuentxGVSZa5/eAEV5uxJw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 11:41:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2pk-000000004lA-0oGz;
	Sat, 20 Dec 2025 19:41:44 +0000
Date: Sat, 20 Dec 2025 20:41:19 +0100
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/7] mm: introduce BPF kfuncs to access memcg
 statistics and events
Message-ID: <202512202046.yz81Ka7L-lkp@intel.com>
References: <20251220041250.372179-5-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220041250.372179-5-roman.gushchin@linux.dev>

Hi Roman,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Gushchin/mm-declare-memcg_page_state_output-in-memcontrol-h/20251220-121603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251220041250.372179-5-roman.gushchin%40linux.dev
patch subject: [PATCH bpf-next v2 4/7] mm: introduce BPF kfuncs to access memcg statistics and events
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251220/202512202046.yz81Ka7L-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202046.yz81Ka7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202046.yz81Ka7L-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/bpf_memcontrol.o: in function `bpf_mem_cgroup_usage':
>> mm/bpf_memcontrol.c:103:(.text+0x60a): undefined reference to `mem_cgroup_usage'


vim +103 mm/bpf_memcontrol.c

    93	
    94	/**
    95	 * bpf_mem_cgroup_usage - Read memory cgroup's usage
    96	 * @memcg: memory cgroup
    97	 *
    98	 * Returns current memory cgroup size in bytes.
    99	 * For the root memory cgroup it returns an approximate value.
   100	 */
   101	__bpf_kfunc unsigned long bpf_mem_cgroup_usage(struct mem_cgroup *memcg)
   102	{
 > 103		return mem_cgroup_usage(memcg, false) * PAGE_SIZE;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
