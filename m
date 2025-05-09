Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C024466B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746817910; cv=none; b=M9Mj8g/2LBEBoVSl5eiEKmjbeUUkgwxgnEzlSZ2+0M7d3o8VwZTjfj2hZcET95TMEF2xJVDV5kFs+le5iZGDGejS+LH8RQAxz34njT4drOI9cgUhn5vEtVXqGqT8lLOv8d6ZZ/cJY+7VjObYnh/JjPhPGrUmlXP+Vmw/iGPE9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746817910; c=relaxed/simple;
	bh=rUkYFDJ3A/3qp1fFYcFH6P5hJZNW5UVyyRRKB8k4QN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn5Khn3YAcxN+RkzC8sJ9aH1H4ijV7/C4s50rM/dm+3aC35OoEcdhSUN+wzR6FNfsPvzgUGbisI8EvXtgCSIYELpHkxyT+8Wcey7kY2ca6Pd7AGqpuj+DofmNSe6/hc4DGHWBm5LDUrDpBeQpsC5pG5aPXzGr7DoeOn8HGLP5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlyFA9CT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlyFA9CT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746817908; x=1778353908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rUkYFDJ3A/3qp1fFYcFH6P5hJZNW5UVyyRRKB8k4QN4=;
  b=GlyFA9CT0pSBOfb6gCHsaG3kFKUwC6X+Ufj8uDAOdWgx4pfFwtDlssrJ
   to0VDRQ2j0miAFuh9KfW2tV2BVoRppWoC0tDXaIerSGaTugFDWL5qoXa/
   cX2fPKCwG5HBrV+Ti2/Z/mwoD5cdMNOZUZK1NdndQjMTDE3U8dUfy7bdn
   KrCLp8Cn6+6Ugk3DcgA19TUAezVXAm5DxfKdUF83OBqpNeMJ9tRTnPFQQ
   We3vXvdNvsp4H8+zlEcY9XwwKfql9SA3WeifGmYUQb8cZuOyZHf75cpTH
   wNkFjqFqyRQRnrP+mku9dOMAJZHolyuFKsKgDwWVlrn+ap8xNpi3pE5rE
   A==;
X-CSE-ConnectionGUID: bTS+6TKjSLiDDwVvD+/UZA==
X-CSE-MsgGUID: FQHPu/XxSdymh0NPLGt8tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48663552"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48663552"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:11:48 -0700
X-CSE-ConnectionGUID: +3NlKtYXSRaW8DZI2RKcHw==
X-CSE-MsgGUID: e4rgKIguTUii1dsMQbduCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136656594"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2025 12:11:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDT8K-000COX-2Z;
	Fri, 09 May 2025 19:11:44 +0000
Date: Sat, 10 May 2025 03:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC next v2 5/5] ucount: add rlimit cache for ucount
Message-ID: <202505100258.uXDFTc4e-lkp@intel.com>
References: <20250509072054.148257-6-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509072054.148257-6-chenridong@huaweicloud.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250508]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/user_namespace-add-children-list-node/20250509-153709
base:   next-20250508
patch link:    https://lore.kernel.org/r/20250509072054.148257-6-chenridong%40huaweicloud.com
patch subject: [RFC next v2 5/5] ucount: add rlimit cache for ucount
config: i386-buildonly-randconfig-004-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100258.uXDFTc4e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100258.uXDFTc4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100258.uXDFTc4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/ucount.o: in function `rlimit_drain_type_cache':
>> ucount.c:(.text+0x417): undefined reference to `ns_next_child_pre'
>> ld: ucount.c:(.text+0x48a): undefined reference to `ns_next_child_pre'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
