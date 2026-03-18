Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8591C3BF7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795910; cv=none; b=qnsfLxn3Pf8mrowcv6MoXONM5R04QDwHPafauyi3+yBaY9z91dXRZ+YBXM2zvqnNddu9u8HrUIsA3SC07gdiEBRg/9yrVAxSCz4lSRgFTFgpvq15G1ZYWt3a1lNfpUHtzMKwsv0lR+KScm7ZJ37InjD/aVRaNxnAt+pExdO1L+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795910; c=relaxed/simple;
	bh=DqdV9FtuLjFNAw73HM7SkGmefSXM7s8ErntUEXLJrQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCQ+WvBo3xh6FQOZLaK9LnVt36ve/qa0RSPnCitNoaAr+7Jncw+JLgIl2g0pFJ1j8pBzWXDrau9hvLTqHs620ykKuJ0W+GMOIkIGOQEX1JZ459ILjV44OazkIkhAoTkdlncRZv1qyU0ah9zyHuvCDyp/tFsM0/rajVZlL04gZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLnGj+B4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLnGj+B4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773795909; x=1805331909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DqdV9FtuLjFNAw73HM7SkGmefSXM7s8ErntUEXLJrQY=;
  b=SLnGj+B4hq0M5ReF9UAJtkkB6ysFq/0jnoCCllgcuq7swvjSESBlLt/8
   etrN6yCjeJH2JM8wjYWtnuA4/71s2qzrI7OxAjdpRIv8xGaVHaxocJg64
   X4fPMNKqg7d04s8V21e/d/OAwUvOcqWP0A5zoUML5m+ezMShraDfckkU4
   kVQ8uSiSjkIPv3cAAxvA6RMV+SuIw1zWl7H6VWOOOML/Gfg1NsZf+lwtY
   KGR31wj9k8YQudYQfx+WNqferzvUY3X1vw3zSoofa/ECjoY/jgQfs3pIy
   Z/MOBourwkwx5G4eoKsg2R1hKoucsnKYIMZB+dRzfmo0m3cL6+k7AxXbq
   w==;
X-CSE-ConnectionGUID: uopA3EJgQwaOAeEaQiRUtQ==
X-CSE-MsgGUID: HU4n85CCQvqYDn+i6V5yTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92413962"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92413962"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:05:09 -0700
X-CSE-ConnectionGUID: hcXHrC+wSBu51Eo09hRS3w==
X-CSE-MsgGUID: YaSiG27uT6uZUJRofN+SSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226905586"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 18:05:02 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2fLF-000000002Gz-3yzV;
	Wed, 18 Mar 2026 01:04:57 +0000
Date: Wed, 18 Mar 2026 09:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	axelrasmussen@google.com, yuanchu@google.com, david@kernel.org,
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com
Cc: oe-kbuild-all@lists.linux.dev, weixugc@google.com, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry.yoo@oracle.com, jannh@google.com, pfalcato@suse.de,
	baolin.wang@linux.alibaba.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, baohua@kernel.org,
	youngjun.park@lge.com, ziy@nvidia.com, kas@kernel.org,
	willy@infradead.org, yuzhao@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] mm/swapfile: Make folio_put_swap batchable
Message-ID: <202603180953.FNgOslIG-lkp@intel.com>
References: <20260310073013.4069309-8-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310073013.4069309-8-dev.jain@arm.com>

Hi Dev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-rmap-make-nr_pages-signed-in-try_to_unmap_one/20260310-153604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260310073013.4069309-8-dev.jain%40arm.com
patch subject: [PATCH 7/9] mm/swapfile: Make folio_put_swap batchable
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260318/202603180953.FNgOslIG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180953.FNgOslIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180953.FNgOslIG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: mm/swapfile.c:1757 function parameter 'nr_pages' not described in 'folio_dup_swap'
>> Warning: mm/swapfile.c:1780 function parameter 'nr_pages' not described in 'folio_put_swap'
   Warning: mm/swapfile.c:1757 function parameter 'nr_pages' not described in 'folio_dup_swap'
>> Warning: mm/swapfile.c:1780 function parameter 'nr_pages' not described in 'folio_put_swap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
