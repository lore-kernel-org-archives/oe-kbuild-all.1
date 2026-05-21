Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774F154654
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 03:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335333; cv=none; b=PElXvwPueiRARLzplAoyTM3dSLOjXg6VP1tWiUbaZTjNWOtswcVF6nANLp6FRLBkBJuTQDhpRji2oKuxEH+1GY9Li9A5Paa7zfiZQWomjwMdojwPfaQ3T5JUaKG7UN9KCHWDq7Iz7VkWX7OJQmFMiMkQGsVzgXfAO+Jsky0cRq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335333; c=relaxed/simple;
	bh=eAwe7xC5mOsEIjpQonF9fCnohpBUGfrurPWJtsqOl1Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RHfuqNUojVjez+OwNtpHC+IY78DcX6n6UGvXSgCDyrsztLMq2G52S812DEFWUB58J5LU/h9CpSMg9liqBO761O38G5X09+aEpa4UaqLhAv7xkZeRbwc2QprDnmUODJ/ZduqbqvJ8mMnTC7kK2rNn6Pfm4R8oVYYwUs96+0Hz1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWX6vJnE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWX6vJnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779335333; x=1810871333;
  h=date:from:to:cc:subject:message-id;
  bh=eAwe7xC5mOsEIjpQonF9fCnohpBUGfrurPWJtsqOl1Q=;
  b=kWX6vJnE//Og+dBeSAeGAtNQFRfpD3kYff/SrT0VAIVgufm666taq2Hb
   lpgKDRTiilZwHOkBN1bBTclRi+folGiKv2mkVNXBZAtkV8KT5XagHbCn3
   wzM9+rRqO1s7HVSxXwwfy1P/9/30+NCGTZ4Ss+BZ2uy74x7D1X0B2gRQq
   SjeKvfk7MkhkVDNufwbargO2oDm80WVuxl5RNdenWwOeKaPnk6h3LoRDl
   1rGcbIBpMTl32j1efDLNeLH7crp8CwUgPguj7bIvTEcdr693A6mmXDXPg
   RJ75GQ8zgEwJkfa5sYQKiPoLwTRLsG/eYo/MoeW7J1/B6CQq8GBFk9US+
   Q==;
X-CSE-ConnectionGUID: YwHXYiHJTzGV7aJIHeE9cA==
X-CSE-MsgGUID: 6wPMNuBRSEKi8NhAzwXs0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91639799"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91639799"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 20:48:52 -0700
X-CSE-ConnectionGUID: WAids/d0RemDVUqVDQMqbA==
X-CSE-MsgGUID: 8yxjb5S0RQi/FIvuHdm5Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240267866"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2026 20:48:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPuOu-00000000AlB-145Q;
	Thu, 21 May 2026 03:48:48 +0000
Date: Thu, 21 May 2026 05:47:53 +0200
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: mm/page_alloc.c:620 function parameter 'zone' not
 described in 'superpageblock_clear_has_movable'
Message-ID: <202605210514.LxvUFYME-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260520-231340
head:   f078b5654577f53b34108d1196286629a290924b
commit: c1308f3e774ffef7948accc4311b129a703a670c mm: page_alloc: add per-superpageblock free lists
date:   12 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605210514.LxvUFYME-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210514.LxvUFYME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210514.LxvUFYME-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:620 function parameter 'zone' not described in 'superpageblock_clear_has_movable'
>> Warning: mm/page_alloc.c:1173 function parameter 'sbp' not described in 'pfn_sb_free_area'
>> Warning: mm/page_alloc.c:620 function parameter 'zone' not described in 'superpageblock_clear_has_movable'
>> Warning: mm/page_alloc.c:1173 function parameter 'sbp' not described in 'pfn_sb_free_area'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
