Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28926ACC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 04:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730003894; cv=none; b=AaQwj+ciRkAsjSMNISwqX7QDH8NPtxKcpD+jVS2PGc0f2P3bYCLPvOKdSSzNwZ344Ggi4OlCEZwLGKRpXRhOgjqMpgZhlj6SXKs2+tThD+iLd1fAloqAjoW00wVd47hDc5TYdtaLBeaZEGdcmb8YCjvpbzQ0H5Ncxg0hr/8u/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730003894; c=relaxed/simple;
	bh=tVM2M1FGQEg6FRvfqtoP9wCLqdQ1Pc8YdUg/lXbeO3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWvKj3SEA/2volvXgogy1e24Gh90Dm/gbmBb8X62+hViu7uDp91TCvuyMg6L5F47nT/pIurUcz5FrCkkCuQpZ79gG6qGHj4ORzy37NsbroDRA2p8SeLhIU4GDSb3q+FCZWi3X79vDT5tvH/nzQXaJVoQMTXnKkgNf6p3uj48mJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVZ4PoUF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVZ4PoUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730003892; x=1761539892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tVM2M1FGQEg6FRvfqtoP9wCLqdQ1Pc8YdUg/lXbeO3g=;
  b=RVZ4PoUFm5RM1OZiGpxjYQQDmHZAyuEcg6HhW0jIYlOBZC3N5+AR0WEo
   6hY4npUwhYtcOEBOeq6rlKz4ukH7HkhMIW/yFAakCHnnNfZ/heJnGU0oX
   3Hesnhax2zTNx/rI/LIosPan4DkiqWMjhwJrhBrywnrQkz8E6UpLfUDtZ
   K8GDrUHplPcYVFQQoOzhT8fW9vXAI1zs9zDRJ4ES0F1dBb6pkrGuUhRQL
   nGTP65csVNqzZFvoyPb1dCudX4Mvm/Q68YYTun0Yu3FONbHksIoJ8UPry
   YLQm5IlICA916h+T6Fnvgrhbe42bp3qJaaxT+jgdm6kQUBMMj3FYprjSf
   w==;
X-CSE-ConnectionGUID: LrNLqdDvSRKE9yk4A3NRyg==
X-CSE-MsgGUID: JJCwPAW4RPCjcvdM7kKHyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32491946"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="32491946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:38:09 -0700
X-CSE-ConnectionGUID: +omFZIFiRgadSQh/NWWbfQ==
X-CSE-MsgGUID: g/VU5udOQ6Kf1j3hJ/8r2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="112140443"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2024 21:38:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4v2U-000aMe-0d;
	Sun, 27 Oct 2024 04:38:06 +0000
Date: Sun, 27 Oct 2024 12:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: mitigate large folios usage and swap thrashing
 for nearly full memcg
Message-ID: <202410271232.sVI4Oc2G-lkp@intel.com>
References: <20241027001444.3233-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027001444.3233-1-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-mitigate-large-folios-usage-and-swap-thrashing-for-nearly-full-memcg/20241027-081537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241027001444.3233-1-21cnbao%40gmail.com
patch subject: [PATCH RFC] mm: mitigate large folios usage and swap thrashing for nearly full memcg
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241027/202410271232.sVI4Oc2G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271232.sVI4Oc2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271232.sVI4Oc2G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4543: warning: expecting prototype for mem_cgroup_swapin_precharge_large_folio(). Prototype was for mem_cgroup_precharge_large_folio() instead


vim +4543 mm/memcontrol.c

  4529	
  4530	/**
  4531	 * mem_cgroup_swapin_precharge_large_folio: Precharge large folios.
  4532	 *
  4533	 * @mm: mm context of the victim
  4534	 * @entry: swap entry for which the folio will be allocated
  4535	 *
  4536	 * If we are arriving the edge of an almost full memcg, return error so that
  4537	 * swap-in and anon faults can quickly fall back to small folios to avoid swap
  4538	 * thrashing.
  4539	 *
  4540	 * Returns 0 on success, an error code on failure.
  4541	 */
  4542	int mem_cgroup_precharge_large_folio(struct mm_struct *mm, swp_entry_t *entry)
> 4543	{
  4544		struct mem_cgroup *memcg = NULL;
  4545		unsigned short id;
  4546		bool has_margin;
  4547	
  4548		if (mem_cgroup_disabled())
  4549			return 0;
  4550	
  4551		rcu_read_lock();
  4552		if (entry) {
  4553			id = lookup_swap_cgroup_id(*entry);
  4554			memcg = mem_cgroup_from_id(id);
  4555		}
  4556		if (!memcg || !css_tryget_online(&memcg->css))
  4557			memcg = get_mem_cgroup_from_mm(mm);
  4558		has_margin = mem_cgroup_has_margin(memcg);
  4559		rcu_read_unlock();
  4560	
  4561		css_put(&memcg->css);
  4562		return has_margin ? 0 : -ENOMEM;
  4563	}
  4564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
