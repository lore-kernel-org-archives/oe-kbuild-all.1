Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64539DF6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722003721; cv=none; b=VCeiHUoDeecUuGlp6mWSM2hzqiOaFx0qs37TZpTy11kTvtniGw2GmVrDZib6VBjyO7KK7vp83ONwSeMDZCA3slTY/oa7kfvk7c+4/NevuZ6iFceGR2lLWfuZhT1el7z1wkTnJS9ocZoh9BAPJTzit64b9PloMe7FeN70L9psz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722003721; c=relaxed/simple;
	bh=AOlbY9BG26dy2Sx+0dhpIaqvcJWw0W7KkP8pvQTh+LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCLcgXZE+t6O+MSjZLm69jwFO3jjmu2rP3Bwoq3k6MXj6CKjEEUh5rNMaibwrcsTu6DloRnUyz1EHCLXW3pk9Y1CqyFmOtkWDgEfPqIPdhKYBb+Z9Z0rjvaOLbIAUJVULLb+Lm8mZ47zauNnDFAE63Uop9sIPlwZ32KbkrqQWvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2mejcdn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2mejcdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722003720; x=1753539720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOlbY9BG26dy2Sx+0dhpIaqvcJWw0W7KkP8pvQTh+LY=;
  b=k2mejcdnolNMlcVdtJ4+LymCHHAk2zFguVvs+IA7UvXypuvGMNDmT0fB
   NbPa19NmBRgxg/1To8LDdQqktvUb5Lq2ma74+nAwfnPR9OjUMSyGKOCla
   wEjmpX1gmO5FdVlZHj9L+NV5DLInmycrPuSDrBIH8nSDNP6URTpNIvDZj
   4CSd+OqsGWGqyGymmGDcflfTs7paOlXH3akb7LzBd1mWpzT5Z+Of5D14h
   dIJUCL+e75aGyRPeEZGZttvgS9jylOrcxtDPHdg42Uogx6DawTdIXxrzw
   Dj1t9gNpvq31B7U0P/69OreBcUGtcbXc0KNNmF/LsqAQM/yBOy56aMWsk
   w==;
X-CSE-ConnectionGUID: yuCam1a1R2i5MnbmZl21Kw==
X-CSE-MsgGUID: 8ObOupGHS9aPNLmJHyaIKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="37313324"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="37313324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 07:21:59 -0700
X-CSE-ConnectionGUID: uqcu/o2ARMWvUqs3tgTKgg==
X-CSE-MsgGUID: T0La76LWSmiwSrpD2CKvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="90743888"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jul 2024 07:21:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXLpS-000pBA-08;
	Fri, 26 Jul 2024 14:21:54 +0000
Date: Fri, 26 Jul 2024 22:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 3/4] mm: migrate: add isolate_folio_to_list()
Message-ID: <202407262129.FJbkroy1-lkp@intel.com>
References: <20240725011647.1306045-4-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725011647.1306045-4-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-memory-failure-add-unmap_posioned_folio/20240725-091923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240725011647.1306045-4-wangkefeng.wang%40huawei.com
patch subject: [PATCH 3/4] mm: migrate: add isolate_folio_to_list()
config: x86_64-randconfig-004-20240726 (https://download.01.org/0day-ci/archive/20240726/202407262129.FJbkroy1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407262129.FJbkroy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407262129.FJbkroy1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/memory-failure.o: in function `mf_isolate_folio':
>> mm/memory-failure.c:2662:(.text+0x2e8a): undefined reference to `isolate_folio_to_list'


vim +2662 mm/memory-failure.c

  2659	
  2660	static bool mf_isolate_folio(struct folio *folio, struct list_head *pagelist)
  2661	{
> 2662		bool isolated = isolate_folio_to_list(folio, pagelist);
  2663	
  2664		/*
  2665		 * If we succeed to isolate the folio, we grabbed another refcount on
  2666		 * the folio, so we can safely drop the one we got from get_any_page().
  2667		 * If we failed to isolate the folio, it means that we cannot go further
  2668		 * and we will return an error, so drop the reference we got from
  2669		 * get_any_page() as well.
  2670		 */
  2671		folio_put(folio);
  2672		return isolated;
  2673	}
  2674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
