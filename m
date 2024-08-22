Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214B1581FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313300; cv=none; b=V37fvVdODk2u3iH84HdZW+gcHcWJl2GYEQO7qiluUfTopn6u58ac5+3RWtiKwjHHWo32PIqUJXkccXomDIEpTeYMKfUPPq2jelhLVnjtSS4wyDz0d8wysFMsZ7efwDnZxlC6gA+wXzs0eTmvZtXJz7m0eYrvBcppDJGWSjanRh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313300; c=relaxed/simple;
	bh=s88qqlqiN8zKURvcVFxxSi32eWKSvINOQb23vHiCbX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq9NwBfE+zNYQivNmONS8FO0fmcv1s5a3U/jTfhjBjSKb4VGKcSJROwC6qU8W8HUpeJKmHZ5tv2Qe4bn+GUN5Tv4lDBOOXaz/sGmR2IIAeZgPU3dTGC1n+jS//4JH96vaarXARmrZ1T+zb+xJgi2QFkVa5CMmT1/kFqrjNziksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpUDJ+ul; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpUDJ+ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724313298; x=1755849298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s88qqlqiN8zKURvcVFxxSi32eWKSvINOQb23vHiCbX8=;
  b=SpUDJ+ul/3r3fz1ZdtzVyJGNccmS70hbN/bB8Suqv7AC0MiVBIEzGhMS
   8Qnbrn++W0c8ztATGeEiFi8QXfDG/KGZLlVaUmQyYSLM61r0uaX65fYop
   aSQdKDYoVpG0P4un8Ks21Z4xvngO8kJGpqsw/Rz6T3AX0eWuK7Y+Vg+73
   zgSj2T4az/gb/D7KlKQCwbDjGBmlr9Wn6gkHtKSf/QmFbAZOV69k6uzuu
   CTt4Qa8LoDCgTsZD48O5aWiaaUcXAVj/G80gzSVfH/i44r611COPYVxQQ
   K4Zg8zrHxiOVHScQmZZOGXuOvkGPPBDCIoMoAPW38iaDQgjBr+MBJP/tP
   w==;
X-CSE-ConnectionGUID: Yf7h+MAyQuGMgjioMZCnNw==
X-CSE-MsgGUID: HNurypEQQFSmMVpDl4CRiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="25605185"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="25605185"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 00:54:58 -0700
X-CSE-ConnectionGUID: 2Qm8O+nIR/a9bOpnjtmZxg==
X-CSE-MsgGUID: xXdMfAZSScy9N2853jRrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="62091337"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Aug 2024 00:54:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh2ek-000CYU-2O;
	Thu, 22 Aug 2024 07:54:54 +0000
Date: Thu, 22 Aug 2024 15:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Revert "mm: skip CMA pages when they are not available"
Message-ID: <202408221518.TZGNDRWD-lkp@intel.com>
References: <20240821193506.1525996-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821193506.1525996-1-usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/Revert-mm-skip-CMA-pages-when-they-are-not-available/20240822-033718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240821193506.1525996-1-usamaarif642%40gmail.com
patch subject: [PATCH] Revert "mm: skip CMA pages when they are not available"
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240822/202408221518.TZGNDRWD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221518.TZGNDRWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221518.TZGNDRWD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:1641:13: warning: 'skip_cma' defined but not used [-Wunused-function]
    1641 | static bool skip_cma(struct folio *folio, struct scan_control *sc)
         |             ^~~~~~~~


vim +/skip_cma +1641 mm/vmscan.c

b4536f0c829c85 Michal Hocko   2017-01-10  1627  
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1628  #ifdef CONFIG_CMA
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1629  /*
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1630   * It is waste of effort to scan and reclaim CMA pages if it is not available
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1631   * for current allocation context. Kswapd can not be enrolled as it can not
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1632   * distinguish this scenario by using sc->gfp_mask = GFP_KERNEL
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1633   */
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1634  static bool skip_cma(struct folio *folio, struct scan_control *sc)
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1635  {
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1636  	return !current_is_kswapd() &&
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1637  			gfp_migratetype(sc->gfp_mask) != MIGRATE_MOVABLE &&
97144ce008f918 Vern Hao       2023-08-25  1638  			folio_migratetype(folio) == MIGRATE_CMA;
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1639  }
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1640  #else
5da226dbfce3a2 Zhaoyang Huang 2023-05-31 @1641  static bool skip_cma(struct folio *folio, struct scan_control *sc)
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1642  {
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1643  	return false;
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1644  }
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1645  #endif
5da226dbfce3a2 Zhaoyang Huang 2023-05-31  1646  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
