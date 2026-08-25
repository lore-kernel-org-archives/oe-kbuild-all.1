Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0D447ACFF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664624; cv=none; b=N3uqKvrmvmlnPJRkbOQsMLnmBVKyB3aUVnf5Oi73qiAzWmLJCiHTn4LGbCfcmuoId0w1KQUeUXq45+r3JK+Z5voJG9k/PEZzW1GfvhOXU07bYkN/DkToz/NYYda5wvRaaSvwx5aW0YYPgYI/nn/yOgveT2sxfcxnxUb/8s/4OzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664624; c=relaxed/simple;
	bh=c9Nacj099i9lPcssMyGzzh2RUKgFpgy/wc1032AQhHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNWiBZFXPQiuY6TtCdwUUghAMG6yOgBx7jIzmvxgJL5q1oAnWPFKIM2ZwxOfyMoj75Ol9VMgbDxLnltpfh2kw2jZnD/GAJ8Q5wY0Ddb+VyZEnbC0J0RWpxDLRZx2QffgR49WsqHBFvrUQbQBvqQTx/C7M8gE0Zg7DS9owi/AjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0GU8Aap; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0GU8Aap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787664621; x=1819200621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c9Nacj099i9lPcssMyGzzh2RUKgFpgy/wc1032AQhHQ=;
  b=U0GU8AapE0o6UDZVDjSEvY9qMW/u89HOVXnUql32TSHkH7MG+/qYcciU
   qAuAOgRH6rn+5CH6X2Ip5gJif/XN13/mwWQhIzRy/mBNcFn77Mjspq4pU
   FSqvru/5xRyJ732QHjKO4Mfowa3bqIAyFk1zxIqJw8lNgJ5TQDT6KJOUH
   maxCW/VLWVWX6maIAoq9KrMt5jL+AiOUDdHbtpG6gXxHyilmiKVJAsYMe
   3ZFuRqWfVKPy0YsQ53pxAePXNRL557wOZJmDt3SY6sE2RAsaLXqSeT8DD
   xancmLXeyKDdatCfUKDw0U9AnwhD5jHhGOdswB6kB3orfwJIiqWL2o9Ps
   g==;
X-CSE-ConnectionGUID: yFLBM56BRf29nGNnZa4vCA==
X-CSE-MsgGUID: 67s7mUgmTbOzD5efdfkEFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87895804"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87895804"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 06:30:19 -0700
X-CSE-ConnectionGUID: MEWBwBDZRsa/qt+torgjBg==
X-CSE-MsgGUID: 9HFvW8+aQ0+q20RIrypkow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267857094"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 06:30:16 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyrEC-000000005uV-3vgb;
	Tue, 25 Aug 2026 13:30:12 +0000
Date: Tue, 25 Aug 2026 21:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] mm: workingset: account MGLRU pages in
 count_shadow_nodes()
Message-ID: <202608252128.XbcsGfzh-lkp@intel.com>
References: <20260824091631.836473-1-hui.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824091631.836473-1-hui.zhu@linux.dev>

Hi Hui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/mm-workingset-account-MGLRU-pages-in-count_shadow_nodes/20260824-171630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260824091631.836473-1-hui.zhu%40linux.dev
patch subject: [PATCH] mm: workingset: account MGLRU pages in count_shadow_nodes()
config: parisc-randconfig-002-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252128.XbcsGfzh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252128.XbcsGfzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252128.XbcsGfzh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:657:22: warning: 'count_lru_gen_pages' defined but not used [-Wunused-function]
     657 | static unsigned long count_lru_gen_pages(struct lruvec *lruvec)
         |                      ^~~~~~~~~~~~~~~~~~~


vim +/count_lru_gen_pages +657 mm/workingset.c

   650	
   651	#ifdef CONFIG_LRU_GEN
   652	/*
   653	 * The per-generation counters are eventually consistent and may go
   654	 * transiently negative while batched updates are pending, so clamp
   655	 * the sum at zero.
   656	 */
 > 657	static unsigned long count_lru_gen_pages(struct lruvec *lruvec)
   658	{
   659		struct lru_gen_folio *lrugen = &lruvec->lrugen;
   660		long nr_pages = 0;
   661		int gen, type, zone;
   662	
   663		if (!lrugen->enabled)
   664			return 0;
   665	
   666		for (gen = 0; gen < MAX_NR_GENS; gen++) {
   667			for (type = 0; type < ANON_AND_FILE; type++) {
   668				long *cnt = lrugen->nr_pages[gen][type];
   669	
   670				for (zone = 0; zone < MAX_NR_ZONES; zone++)
   671					nr_pages += READ_ONCE(cnt[zone]);
   672			}
   673		}
   674	
   675		if (nr_pages <= 0)
   676			return 0;
   677	
   678		return nr_pages;
   679	}
   680	#endif
   681	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
