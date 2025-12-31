Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F126F2A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179858; cv=none; b=cxZGO8CPC1B+H+sIuqf4BbaCVdOir6dh1TuTkKAOI+ij7Z3gOMFSejlnOmC01Cn5NTtwo9C6eJz/2gJ+BAo9+IDoE78gTz/Re8ifrTneLaR+Ezs098fQ44zshbPUKj9Q3LBd3TWKzoPU29YvTZyv6d+Cm1qF4qYrLIM+zsMJhQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179858; c=relaxed/simple;
	bh=hzzze2N6+Sdkuo+XWVKURrk0n2l4mHfCOju2YHMHTgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NsTV3GR4z/vqzY6YSJ33hcWaBRU64W0Pte/t84Grq0HBiPppZdUYVq2dWXT+xC+Fq7FjwHjQzfLkU8P+7nGH37JEA/WwoUBeoQ4vaII+mwNcic0xN4MgWIeB4bPxxaeeNWJJoGCi2i71BC0BnnVMPiqTj4QTyElFrHBw8163cqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBouaW3p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBouaW3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767179856; x=1798715856;
  h=date:from:to:cc:subject:message-id;
  bh=hzzze2N6+Sdkuo+XWVKURrk0n2l4mHfCOju2YHMHTgE=;
  b=FBouaW3pvp+BSgvtjBZKkncOc97k73qdm79YPajmbV+hwy4OqjSiBLES
   lIlGgF81Xay7ReqsdyMrr1ud0HHxEpgcaZMc/zS0lViTEb6TiUBDrNNwC
   KoOfne3v5fmyPuRfx1TujnBiM9xsm/L2Uli3mchCDOyRqaGxnjY+Dvc3S
   Py0hk9xb9SYEU+PcMUh+U1sSYj5nVVcrmqRNGu/ACrXvR4wnzVnyDijiE
   GWiC7OHw3QjISBNUiGG4SIJUfHHCNoNX/QWhxsv38Q4kLPt/cMqaSpUeW
   IQkhzUWdLtfoUc7OL9Uzlh3eyUBFz2GXGHluEecqQmUdmlz45g1LhCG2Q
   g==;
X-CSE-ConnectionGUID: RpN+sCldQkaz9skHT9+ToA==
X-CSE-MsgGUID: xMzMX4GzQvSf0co7Oiiiow==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="94213179"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="94213179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 03:17:34 -0800
X-CSE-ConnectionGUID: Ood549eoRK2X3FtdQwIXNQ==
X-CSE-MsgGUID: vX2thABPRjaBO3CXTp9Mfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201658110"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2025 03:17:33 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vauCp-0000000018z-0jXa;
	Wed, 31 Dec 2025 11:17:31 +0000
Date: Wed, 31 Dec 2025 19:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/readahead.c:151:51:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202512311908.4UgkJd6G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ecd8c13eebd9ac39eaa1b45d9fe23ff020c4e68c
commit: 14abb0c187843dc59614b0a461b291623ec1b3b6 [2/2] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: arm-randconfig-r112-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311908.4UgkJd6G-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311908.4UgkJd6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311908.4UgkJd6G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/readahead.c:151:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/readahead.c:151:51: sparse:     expected unsigned int *flags
   mm/readahead.c:151:51: sparse:     got restricted gfp_t *

vim +151 mm/readahead.c

   146	
   147	gfp_t readahead_gfp_mask(struct address_space *x)
   148	{
   149		gfp_t mask = __readahead_gfp_mask(x);
   150	
 > 151		trace_android_rvh_set_readahead_gfp_mask(&mask);
   152		return mask;
   153	}
   154	EXPORT_SYMBOL_GPL(readahead_gfp_mask);
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
