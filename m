Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521F83CC7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Aug 2025 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755425790; cv=none; b=buqsWnhzmAFrkBMNGilRLlEXuIWaHn8MbE9JEpNAVos84I/SffuBdBlk1uJ7wxdag3NpeIFkPpKGk1PiZdN5R8CbHtY3JZtmVA9J+aff91ZmpAZyyhY1KE00cGxJnHZ0035j5ZvEKzkEBvCCs3JLMivpPNX88mPbE5fT4BR2N70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755425790; c=relaxed/simple;
	bh=+A14c1W+X+e9ckEeG7fLA+HMWihm8ocOrIT9CAvB0SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRQGuaG8q1RhE3kJ6t2AANvJVqND3yzPS4esRNLaJcMFbdwZr7wldIgI9NHf+5MgCeQFKd0762u3ffTfFGrILFRrPuALSRNe9tWojHigJtBlGaModKs+naAyFICQlDXgblb2nzRviNUlh3SUb3yW0V0cZ9egncHu7BSu3H3lTRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nC1S9mxC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nC1S9mxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755425788; x=1786961788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+A14c1W+X+e9ckEeG7fLA+HMWihm8ocOrIT9CAvB0SA=;
  b=nC1S9mxCmxxSUD37U/vwY0JEoTRFjzfilt53HEF0HwXkDEMjuW1kdQBo
   TlXnVykvrVvEKBevK6E46pxiX3foWQ64iknVibrlJGqZZWT07BjEnZ5oK
   ncSnv041Nfa5OyRC9hU2AAliwR1PTFLKvxb+8Xd1GkMESNw4xi26OdkNd
   Q5P0a8nPB2n25RAMPPkaB/CMtflgkeF8TgUF+pZRqOY8RCDkK0eXahWcc
   le3w0HYJ/7gOcbBzqHBLZfpfw/iaXwtIi7f4niE2DLOqJET3Hl1qexRcB
   soneRN8qLVyFs8032CY0yCDet+ug8wXtXdfHyh2IwwRK5BfYpw/lZqgm8
   Q==;
X-CSE-ConnectionGUID: sCJBS7p0Qha5g6hEAmvN1w==
X-CSE-MsgGUID: PM2zddnWQru3o+oFg1KLaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61511057"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61511057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 03:16:28 -0700
X-CSE-ConnectionGUID: +9d8gx9kSNufnReCk+lhMw==
X-CSE-MsgGUID: krM7rEmbTX6xWVFMAnBwOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166847320"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2025 03:16:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unaQz-000DT9-0i;
	Sun, 17 Aug 2025 10:16:20 +0000
Date: Sun, 17 Aug 2025 18:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] mm/migrate: Fix NULL movable_ops if CONFIG_ZSMALLOC=m
Message-ID: <202508171758.8m5jQYdz-lkp@intel.com>
References: <20250817083534.2398601-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817083534.2398601-1-chenhuacai@loongson.cn>

Hi Huacai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/mm-migrate-Fix-NULL-movable_ops-if-CONFIG_ZSMALLOC-m/20250817-163814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250817083534.2398601-1-chenhuacai%40loongson.cn
patch subject: [PATCH V3] mm/migrate: Fix NULL movable_ops if CONFIG_ZSMALLOC=m
config: x86_64-buildonly-randconfig-002-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171758.8m5jQYdz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508171758.8m5jQYdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508171758.8m5jQYdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zsmalloc.c: In function 'zs_init':
>> mm/zsmalloc.c:2249:13: warning: unused variable 'rc' [-Wunused-variable]
    2249 |         int rc;
         |             ^~


vim +/rc +2249 mm/zsmalloc.c

  2246	
  2247	static int __init zs_init(void)
  2248	{
> 2249		int rc;
  2250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
