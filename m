Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8CC305046
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764166280; cv=none; b=JneFZyeaX6F49nwrV6lGPhoNK3b5cjRMXOZG6mkxAXl7qa23OTb+sbPKOmZi27QrD7B59Thph/S2ejxtoQyL8ppXCdpSLf5wuaHjlXEy9svCErYJw84iG/WPTBH5jPwBh2PRq3BXm4sXi+Us57EHLo6aoyoMOOmJ+iWDAKhI/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764166280; c=relaxed/simple;
	bh=o8jgU3F2mh3KRkTM73geuyExdjIfR9o0Hq8fLvxfpok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTpJ4VGqfPmW4ECmdcNcpyWqBUX0AXXWLuNtPGHEaAwzJNzupZJRoDZjeVjKjIF1dUK62dp0pVnQ96xBLAPXVtaSx3pqfrJ+IewintYcUQsRy+6Ls1ekMPXr1zVa2uVntk1vfskF19EcmN+8jd1oNO3K4ewnLqww1lNjRhSdmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgbMHwWV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgbMHwWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764166279; x=1795702279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8jgU3F2mh3KRkTM73geuyExdjIfR9o0Hq8fLvxfpok=;
  b=DgbMHwWVtAbm10WvA3MfnDC5LZFFSBAIITriLwFPJoYG4/03xH6w9wMO
   Cv0m2ZBSHYpijTJKrtgDsc/6IIMSlk9pY78O9YXH9SBbnTNvEl/8wTIjP
   EFwzHP8MGUFR0gH7dZAbeFETYgs4GFauTMEA/5nUEW2ilhzuIqn1VzuQK
   a7v8xY37COHloyT7lvkRT10PHXUCdwn/5aef0hbMlHIQACNNMDjrIK/Zo
   1J/GJNTOVK7nhF8S7cc2W1ugoj59mxJ42JfINwqnd35zfG5hAnFrQnJDt
   bJJ01NjX05reYBc64cc4EEnXiVjki8d46JlJHdVlL+Mf6alk2q8M9SHY+
   w==;
X-CSE-ConnectionGUID: MGLVGypPS9+F5tSt6u+eBA==
X-CSE-MsgGUID: 5Faj2mGUSwCdobyRx5R3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66161736"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66161736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 06:11:19 -0800
X-CSE-ConnectionGUID: KgKwye/IR9yGwfoyXCdgaA==
X-CSE-MsgGUID: JB/DoB9qTeCxVLnd2PzXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193379602"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2025 06:11:17 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOGEl-000000001Dp-1yPS;
	Wed, 26 Nov 2025 14:11:15 +0000
Date: Wed, 26 Nov 2025 15:10:30 +0100
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <202511261539.RGBE3ddC-lkp@intel.com>
References: <20251125080542.3721829-2-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125080542.3721829-2-wangyushan12@huawei.com>

Hi Yushan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.18-rc7]
[cannot apply to next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20251125-160816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20251125080542.3721829-2-wangyushan12%40huawei.com
patch subject: [RFC PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251126/202511261539.RGBE3ddC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261539.RGBE3ddC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261539.RGBE3ddC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/misc/hisi_l3c.h:22:9: error: unknown type name 'size_t'
      22 |         size_t lock_size;
         |         ^~~~~~
   ./usr/include/misc/hisi_l3c.h:7:1: note: 'size_t' is defined in header '<stddef.h>'; this is probably fixable by adding '#include <stddef.h>'
       6 | #include <linux/types.h>
     +++ |+#include <stddef.h>
       7 | 
>> ./usr/include/misc/hisi_l3c.h:23:9: error: unknown type name 'bool'
      23 |         bool address_alignment;
         |         ^~~~
   ./usr/include/misc/hisi_l3c.h:24:9: error: unknown type name 'size_t'
      24 |         size_t max_lock_size;
         |         ^~~~~~
   ./usr/include/misc/hisi_l3c.h:24:9: note: 'size_t' is defined in header '<stddef.h>'; this is probably fixable by adding '#include <stddef.h>'
   ./usr/include/misc/hisi_l3c.h:25:9: error: unknown type name 'size_t'
      25 |         size_t min_lock_size;
         |         ^~~~~~
   ./usr/include/misc/hisi_l3c.h:25:9: note: 'size_t' is defined in header '<stddef.h>'; this is probably fixable by adding '#include <stddef.h>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
