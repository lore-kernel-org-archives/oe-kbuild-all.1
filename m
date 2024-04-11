Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AFA1DDD10
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712855240; cv=none; b=p5EdGSPbbHzymsCe9KdZi5AtdaY/6XWpBb+M/+6eYKVAGExWgCSE+4J0mG+Po/5xOf/Zpqihp5MBxL0O6MKArc7xknDRqHNaEYDFzr0FUc1wPZZgXUplbuf4T1/rRQEdXR2QpUp3R7Hy2ZyV/x+HsFGVcl/aCOCS+m8iT69w+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712855240; c=relaxed/simple;
	bh=dL7N/nQUDYIUQ7luRRBMxuRVs4JTPSbPh/y44Br5D8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W3yCdQ/JurTokHGSOELM6i/ZYAQFN9ei2vuXQh+k65KqNrlTCk8uFCilUMB4Ww69VSmwGdIFlEtAy/LoS2RRvi00Z78HjZ6K3O4UMnERuqw/gARX0dKZB0ajtw2cVmNFQfb0h5RcMpOZXG6PgiNUpqeVMUqk+RzGcZLixK+erQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJ8h0Cgo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJ8h0Cgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712855239; x=1744391239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dL7N/nQUDYIUQ7luRRBMxuRVs4JTPSbPh/y44Br5D8E=;
  b=RJ8h0CgouC5sWMGzg2W1deJUGhO0qSyIm1tovtLX1vEboGD0l9ZeATRO
   B1olu42j2r2RQciEaPxYTTL6cza/HcoeqOsOTKcs1TJFPd/ikAp2CWu/Y
   HkEBlhn+uhivmdvfzCeeOFzqRxFGIwRJIhid49KqDpp10q4dAwNs5kHSZ
   hFNTW+E9EKKEwUbt3i/jhttTQFiEmaoEShnjNr/EmDz8Lc71mVduYBMb/
   WHj+GSxU1Gu/5un5b59bqCpO308TTc8Q6GUyAdypectrNdU585nFHZbc3
   K5eidXLdimNS2IaqbsIsRf9/VBWZp3O5ht6sVWtR8Y5aTjgiwpTTv8AWN
   g==;
X-CSE-ConnectionGUID: 8EntZdLoSWCB+hAoSk/2LA==
X-CSE-MsgGUID: wEkbB3DxR3qyeN1UroCrzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12132836"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12132836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 10:07:18 -0700
X-CSE-ConnectionGUID: jTEFLtaqR5yIaGRHw0wZOQ==
X-CSE-MsgGUID: VIIYoQrXTTqv+af2fq3MXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20989757"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2024 10:07:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruxt5-0008qL-1s;
	Thu, 11 Apr 2024 17:06:59 +0000
Date: Fri, 12 Apr 2024 01:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4367/5464] memory.c:undefined reference to
 `mthp_stats'
Message-ID: <202404120101.dAQBAzh3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4118d9533ff3a5d16efb476a0d00afceecd92cf5
commit: d9130022adbe6e6ab115ae0714417cdaa49d88c7 [4367/5464] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
config: sparc64-randconfig-r025-20230724 (https://download.01.org/0day-ci/archive/20240412/202404120101.dAQBAzh3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120101.dAQBAzh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120101.dAQBAzh3-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: mm/memory.o: in function `count_mthp_stat':
>> memory.c:(.text+0xee0): undefined reference to `mthp_stats'
>> sparc64-linux-ld: memory.c:(.text+0xee4): undefined reference to `mthp_stats'
   sparc64-linux-ld: mm/huge_memory.o: in function `count_mthp_stat.constprop.0':
>> huge_memory.c:(.text+0x1778): undefined reference to `mthp_stats'
   sparc64-linux-ld: huge_memory.c:(.text+0x1780): undefined reference to `mthp_stats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
