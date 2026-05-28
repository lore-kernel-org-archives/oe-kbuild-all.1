Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740DB32B117
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005866; cv=none; b=PMlwroonxKPKprDyjvMy+Z4TpbWOyFP4Lc0WjNlJk1AKGJEtJ1FQ1NGS5gbDzEaIijvS7RxpqF3pjvk1iSUhs3GS5dg/+Dir2ZIK77B7OzbzR95lpx3lI6J64Qcyn/faKuKRsrdiRcxEbWHv2N3I8zGUscAJrtv9PgytyKvy45o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005866; c=relaxed/simple;
	bh=KXANSzq3npn4gHxXw7HD8cjwtP8lf3LwPWFpqLA0t9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpd7s3+XeCjAujfQBJR7mtrN/Z8Uq7Lq/C3fvPNEZvmXvkubRC6Wxd7aXtKdewhlt93wvdSrOsheTR35Y59fWji0GZfHh7c9IzPh9IaWJK7D0paZbH/jl4kMUZ40n1DEfy29mWdpp2e9+jbp2cUYziLiZWHNcYa0z08g/h6kV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZmp3/gX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZmp3/gX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780005865; x=1811541865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KXANSzq3npn4gHxXw7HD8cjwtP8lf3LwPWFpqLA0t9A=;
  b=FZmp3/gXMFc/oh5k6+tVVXfqHPhbNtWk6TVwYwZaS57C5DDka36lWB7U
   7gXIyYVQ7oeMSx77G9TJZKAXM6YtyQWEybVM9aHMkcpsfBDovldSBDHjf
   Zj9vGyQV7xW9W0M/ykf1Xc+/o2gcbcjMiyDgs7Cv+8VMTzxvQoiVPzetG
   FfaSkB5TXmJ3ESOYYgLWTelZjQaPP+D+w2qrDcRwHLLSsbShDi5G1O6de
   k72w9eoCtWilHCE0PUbe32FN9igYyAZ7iouGVfiM8CI49sgZD+YpOle7l
   8OhGdhgiLjPTgUaEe/OECCw1cgL5apDvDsacumryf2fIlaFqZMDNs69kk
   Q==;
X-CSE-ConnectionGUID: 8BaqXXlNRt692jDbqKWA4w==
X-CSE-MsgGUID: 3vGdWJC5T7GcV3I2NZ5QwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91970925"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="91970925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 15:04:24 -0700
X-CSE-ConnectionGUID: Fc2NBKKYTg+jKwKxusjcqQ==
X-CSE-MsgGUID: eyQdqu0WRjunSGv5FH/+OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242770782"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2026 15:04:22 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSipw-000000000bN-1AZ2;
	Thu, 28 May 2026 22:04:20 +0000
Date: Fri, 29 May 2026 00:03:48 +0200
From: kernel test robot <lkp@intel.com>
To: liuqiqi@kylinos.cn, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	ying.huang@linux.alibaba.com, Qiqi Liu <liuqiqi@kylinos.cn>
Subject: Re: [PATCH 1/1] mm/memory-tier: add node_tier_id as stable tier
 identifier
Message-ID: <202605282306.klBh1nb2-lkp@intel.com>
References: <20260528134212.240492-2-liuqiqi@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528134212.240492-2-liuqiqi@kylinos.cn>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on rppt-memblock/for-next rppt-memblock/fixes linus/master v7.1-rc5 next-20260528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liuqiqi-kylinos-cn/mm-memory-tier-add-node_tier_id-as-stable-tier-identifier/20260528-214338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260528134212.240492-2-liuqiqi%40kylinos.cn
patch subject: [PATCH 1/1] mm/memory-tier: add node_tier_id as stable tier identifier
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605282306.klBh1nb2-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282306.klBh1nb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282306.klBh1nb2-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'free_area_init_node':
>> mm/mm_init.c:1713:14: error: 'pg_data_t' {aka 'struct pglist_data'} has no member named 'node_tier_id'
    1713 |         pgdat->node_tier_id = -1;
         |              ^~


vim +1713 mm/mm_init.c

  1698	
  1699	static void __init free_area_init_node(int nid)
  1700	{
  1701		pg_data_t *pgdat = NODE_DATA(nid);
  1702		unsigned long start_pfn = 0;
  1703		unsigned long end_pfn = 0;
  1704	
  1705		/* pg_data_t should be reset to zero when it's allocated */
  1706		WARN_ON(pgdat->nr_zones || pgdat->kswapd_highest_zoneidx);
  1707	
  1708		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
  1709	
  1710		pgdat->node_id = nid;
  1711		pgdat->node_start_pfn = start_pfn;
  1712		pgdat->per_cpu_nodestats = NULL;
> 1713		pgdat->node_tier_id = -1;
  1714	
  1715		if (start_pfn != end_pfn) {
  1716			pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
  1717				(u64)start_pfn << PAGE_SHIFT,
  1718				end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
  1719	
  1720			calculate_node_totalpages(pgdat, start_pfn, end_pfn);
  1721		} else {
  1722			pr_info("Initmem setup node %d as memoryless\n", nid);
  1723	
  1724			reset_memoryless_node_totalpages(pgdat);
  1725		}
  1726	
  1727		alloc_node_mem_map(pgdat);
  1728		pgdat_set_deferred_range(pgdat);
  1729	
  1730		free_area_init_core(pgdat);
  1731		lru_gen_init_pgdat(pgdat);
  1732	}
  1733	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
