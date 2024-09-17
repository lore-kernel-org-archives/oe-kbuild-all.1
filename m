Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360F6291E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726573030; cv=none; b=g8A1R+UGRUTUzJ6N5SmqP46a4YOA9GXUl3tAlRrIQzY0slkY9rqmpNtYhmAvIVgiqG8NmV8wineWs7kS/gDl2wpUpnssHHPHSjgpJ94IW2vcZL8Z1NUoZHTF77mG0hFU6kakDH0+T6PX9GtC7ut2iJOXl5/NlPag0Z3QFE49iW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726573030; c=relaxed/simple;
	bh=VxdvmEvY2NXDOIavHEy4Nd/kYc3qyPDEkq+L0wBCpYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SW3yBwOj77DqxGtbTFD0G8D519NNPi67kdq07nRqhJuIjn0im2K+7HMAFV5lTfhAdJFgKGPg0uQXX43EyU5zJ7Qlr41uuH106gnbpxTSEUCplD7xhzZpN1z7elHxy3ygI/qor5v2uz2YmyW9+EFREHKnTCZJXfJWIRpDqILr1MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lS+NMGWV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lS+NMGWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726573029; x=1758109029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VxdvmEvY2NXDOIavHEy4Nd/kYc3qyPDEkq+L0wBCpYM=;
  b=lS+NMGWVUjavt6/ZUbwcuod5eZDWmLM9/ttz9B3AEgLvYHwINsPmuLSS
   5vBTmvDKmDu9SSTQ7ceisVPeQdcPFzzXCP6MX08n0L9vCYGQm9xFK54wv
   owstIyOLHaEbrqgx0VT1U28xBYdInuD9HXlydbU292Uws6Im8g/6C+p/Y
   ZrGJDh5Daa4CARGCbhubvRUD/NpGb4KDQHrtewHEEmrN8ptTE1vyQMYYe
   olPyGaG89/e6aaGEvqxZHMPJKS53RtMLWH6rP+AQVpjCn0hWjfsj38bPo
   6kFaxDvN0XAaWfZKNI05T6c9XBiWStP2WDEDjf/WhiKKhSt8afZA+o2FC
   w==;
X-CSE-ConnectionGUID: 5vZqE/VlRkSRo6JIo4+fHA==
X-CSE-MsgGUID: CGtg8oW/TVujPGf4/jdlVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25302803"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25302803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 04:37:08 -0700
X-CSE-ConnectionGUID: 1pHhikaJTAa/Ds+cvQggLQ==
X-CSE-MsgGUID: yavdcrrzTFqYu/m/fUWfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="92456697"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2024 04:37:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqWVz-000B6E-2b;
	Tue, 17 Sep 2024 11:37:03 +0000
Date: Tue, 17 Sep 2024 19:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [linux-next:master 12061/12283] mm/khugepaged.c:435:undefined
 reference to `shmem_hpage_pmd_enabled'
Message-ID: <202409171905.9gqKNeeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
commit: 8b07e88e36961c4785dd13dbdbb5d7977b458940 [12061/12283] mm: shmem: fix khugepaged activation policy for shmem
config: loongarch-randconfig-s042-20221209 (https://download.01.org/0day-ci/archive/20240917/202409171905.9gqKNeeL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171905.9gqKNeeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171905.9gqKNeeL-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: mm/khugepaged.o: in function `hugepage_pmd_enabled':
>> mm/khugepaged.c:435:(.text+0x2338): undefined reference to `shmem_hpage_pmd_enabled'


vim +435 mm/khugepaged.c

   415	
   416	static bool hugepage_pmd_enabled(void)
   417	{
   418		/*
   419		 * We cover the anon, shmem and the file-backed case here; file-backed
   420		 * hugepages, when configured in, are determined by the global control.
   421		 * Anon pmd-sized hugepages are determined by the pmd-size control.
   422		 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
   423		 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
   424		 */
   425		if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
   426		    hugepage_global_enabled())
   427			return true;
   428		if (test_bit(PMD_ORDER, &huge_anon_orders_always))
   429			return true;
   430		if (test_bit(PMD_ORDER, &huge_anon_orders_madvise))
   431			return true;
   432		if (test_bit(PMD_ORDER, &huge_anon_orders_inherit) &&
   433		    hugepage_global_enabled())
   434			return true;
 > 435		if (shmem_hpage_pmd_enabled())
   436			return true;
   437		return false;
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
