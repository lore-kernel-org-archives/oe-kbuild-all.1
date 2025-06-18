Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93B8286437
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238675; cv=none; b=FsnTFwbl8Xh0LRP9TuRooWocvOxS5dOv4Fju44Od9Jdf8Kbr1VB/UpZfNW2BGy/vxnN53SPD2bpc7FqdkFtic6660HhyVbxeHtKZ5kl+tKuPONNtQibqldht9IXpAxV/RP5b8+Jnz9J2EaJ27vXMsDGGhbh3rRzGPi1tUfhOZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238675; c=relaxed/simple;
	bh=PWNvdSaziAup4RWfy12KJGjLQI2CMDroOzbq5Mgk024=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOw+0k9qO7FwXUBwYRiEp/8aPMx5r8PhNY32fSSw2qn3deAjza4vHiv2f1N978VeTWlEb7F4ve1AhRuOIbmswvbrW9UVQHCRo0IzWztVkiVWLHKsHOE1I55CttvC6OKes63oyfdTnvEFm8KLimwN/gaWg/LNt7wikUtmc1oxpkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Az6Xg2hm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Az6Xg2hm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750238674; x=1781774674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PWNvdSaziAup4RWfy12KJGjLQI2CMDroOzbq5Mgk024=;
  b=Az6Xg2hmwJ7w9D9tm2+UzAjBMc4vlaYOXA0pjzkkT80Jl9sozqiRtFYE
   EiuT4XCzZrAvPH3Lz7IlHIokbCpSSMC2Bn15Fbajxv8Q+7UunUCoMveby
   FPSZi1DvGrciD5tEnG3u95BIDuolU9Mhw+9sMe40oKJNfLPKg0Kmjpgd9
   38agd9p1grkdabMAhqNT1POmAQuZ2qUQlRAJGe0iD+R+FmI2jPr8aaD3T
   conhjJtqMJt3tm31QuDt9hMHq3HvH9oN6nmWvAur4xcWgxK0YYqwu3Gi2
   8q0apyZuNzbHtWGP7sz40dlyH6/fJObi/aelzDi/hPoMSGtnpo+xbsAdZ
   A==;
X-CSE-ConnectionGUID: 5LRZj5+zQ56Mr8bd/y1tXA==
X-CSE-MsgGUID: LazqNu8/ScG50wQFORizgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51671189"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="51671189"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:23:24 -0700
X-CSE-ConnectionGUID: 3QHtJ84aTrmimsVTdFpWdQ==
X-CSE-MsgGUID: jLUaDcu4Tf+BvtKRBO/PGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="150187662"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jun 2025 02:23:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRp0r-000Jas-0T;
	Wed, 18 Jun 2025 09:23:21 +0000
Date: Wed, 18 Jun 2025 17:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] mm: introduce snapshot_page()
Message-ID: <202506181657.pEAayfYp-lkp@intel.com>
References: <48d49e3371c35a2da6f4c42d5d9f14b6476ff734.1750170418.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48d49e3371c35a2da6f4c42d5d9f14b6476ff734.1750170418.git.luizcap@redhat.com>

Hi Luiz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Capitulino/mm-introduce-snapshot_page/20250617-222946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/48d49e3371c35a2da6f4c42d5d9f14b6476ff734.1750170418.git.luizcap%40redhat.com
patch subject: [RFC 1/3] mm: introduce snapshot_page()
config: sh-randconfig-002-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181657.pEAayfYp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181657.pEAayfYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181657.pEAayfYp-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/util.c: In function 'set_flags':
>> mm/util.c:1182:13: error: implicit declaration of function 'folio_test_idle'; did you mean 'folio_test_slab'? [-Wimplicit-function-declaration]
    1182 |         if (folio_test_idle(folio))
         |             ^~~~~~~~~~~~~~~
         |             folio_test_slab


vim +1182 mm/util.c

  1174	
  1175	static void set_flags(struct page_snapshot *ps, const struct folio *folio,
  1176			      const struct page *page)
  1177	{
  1178		if (is_huge_zero_folio(folio))
  1179			ps->flags |= PAGE_SNAPSHOT_PG_HUGE_ZERO;
  1180		if (folio_ref_count(folio) == 0 && is_free_buddy_page(page))
  1181			ps->flags |= PAGE_SNAPSHOT_PG_FREE;
> 1182		if (folio_test_idle(folio))
  1183			ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
  1184	}
  1185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
