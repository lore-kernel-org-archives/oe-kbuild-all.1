Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98A26B764
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768952; cv=none; b=L6XGKyYGUmu2bMRICNq3c+fl5MzAd1Sf+516JW1FlxoOmAfoPHveCDcU31DaZBeVfiVUd2LntLcH8kmY7b5CsWOITAHgJ7ygrfyOAtnWaxQOsFXizFcE3juFOQL/2s44FFw328pcIbOhxmjZPpO2Igh95EvDWQP1LwlvhMWdpxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768952; c=relaxed/simple;
	bh=FHGMwOuDMyqUbdmwF7i7VTLEoZIkyO/zzJwWJ2VhDBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oejzp61lnFAcNNC7VPFuCOQearKBvKqUCnwpg9rexi+2tQ4DI8CWAcjYBQecD0MMkqmatHG5MMAR32mccELOBKNnBn4wKh1d3WY0uQyAFkTS8T4Toh+v0ezflIAD2UYpHLaoMkHSs/+o6wk6+95KQi2faCREF2oBNYNXiCur8kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFzeGrKG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFzeGrKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769768950; x=1801304950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHGMwOuDMyqUbdmwF7i7VTLEoZIkyO/zzJwWJ2VhDBI=;
  b=TFzeGrKGmuFJy7j42Sjn8/5eboD9NVWohRy83ZLs+44GF9+5mJpX9Q8b
   nX0vEajvkAKhcPwWuX05xy8NqC+1iwIvVEZ3jg5cLgQ1+oJwn3hYYif/j
   cUAdEgxlkNOQAJDOHHNPRkCvK1Kr/4CSQ0Md7CFzUmyHWBAsFG6WyV0vm
   N5SJPNauZjMxlS4iLHRjV+N5kJ5QxxXSJ4O82SF6q63pvydHQsQ3fPm4b
   kxIAq1eMNbzmm7GXwbY3L3EokB2ZVQC5hKynSODa/wr5UtFAiT99R+Mnw
   1Dt2pTy6tBSRq3hicJMtHlgpsVHWBkBrIrHiTuXmqEcXsXCsa9VY8thDP
   w==;
X-CSE-ConnectionGUID: S19dmqXeQKW6PlqiUxufJg==
X-CSE-MsgGUID: /Rmk+SP3Sj2M7aTok2FqZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70997000"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70997000"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 02:29:09 -0800
X-CSE-ConnectionGUID: map7TzjeSMuclFBRztNn6Q==
X-CSE-MsgGUID: vo+SFuKvQPyHGzrU5yiCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208418862"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2026 02:29:05 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vllkN-000000002Tv-1g7X;
	Fri, 30 Jan 2026 10:29:03 +0000
Date: Fri, 30 Jan 2026 11:28:47 +0100
From: kernel test robot <lkp@intel.com>
To: Jason Miu <jasonmiu@google.com>, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Changyuan Lyu <changyuanl@google.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v8 1/2] kho: Adopt radix tree for preserved memory
 tracking
Message-ID: <202601301107.1CQsWeRT-lkp@intel.com>
References: <20260130005739.3163049-2-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130005739.3163049-2-jasonmiu@google.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on 33a647c659ffa5bdb94abc345c8c86768ff96215]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Miu/kho-Adopt-radix-tree-for-preserved-memory-tracking/20260130-090027
base:   33a647c659ffa5bdb94abc345c8c86768ff96215
patch link:    https://lore.kernel.org/r/20260130005739.3163049-2-jasonmiu%40google.com
patch subject: [PATCH v8 1/2] kho: Adopt radix tree for preserved memory tracking
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601301107.1CQsWeRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301107.1CQsWeRT-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/kho/abi/kexec_handover.h
   ERROR: Cannot find file ./include/linux/kho/abi/memblock.h
   WARNING: No kernel-doc for file ./include/linux/kho/abi/memblock.h
   ERROR: Cannot find file ./include/linux/kho/abi/kexec_handover.h
   WARNING: No kernel-doc for file ./include/linux/kho/abi/kexec_handover.h
>> ERROR: Cannot find file ./include/linux/kho_radix_tree.h
   WARNING: No kernel-doc for file ./include/linux/kho_radix_tree.h
   ERROR: Cannot find file ./include/linux/kref.h
   WARNING: No kernel-doc for file ./include/linux/kref.h
   ERROR: Cannot find file ./include/linux/rslib.h
   ERROR: Cannot find file ./include/linux/rslib.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
