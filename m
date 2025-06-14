Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A086338
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 23:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749942405; cv=none; b=raHTDaAT70VVAHA/JPH2wlWA0nAFh2APmowL+jZUIxeKGMZYTeR1CfsCegQJAXZBXLmyREMRTL3IjukIyKBwCZyBXMEduDxUMf/71L3kPHBHV6QAD/j0vJOA2PtD8d2raBXDRiyFmsL3W9RwEE43ILAcO0ftZSma2ttOX0wAC8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749942405; c=relaxed/simple;
	bh=G4YE4jMw2zGtFAlquCW+q8rgEIFseXySJRCrDVxI08Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4vBCY8SnU3d8HqNlsOwcVfuNGZSLBp+9NJq2WnoevMZmXRLTrehwSMJO2pdQcfkOWimyaEa1u10MQl0kYRmoYd1mcSF55whPfrhC99V60CfdDmov6Qi9ChisxfqYivD2j7gMvHsD1Al211KAWWFstjSHMY7Vh0aabxA4YnUVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNnETIXO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNnETIXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749942404; x=1781478404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4YE4jMw2zGtFAlquCW+q8rgEIFseXySJRCrDVxI08Q=;
  b=fNnETIXODyD9Pv5N77q4Z1xrdrIU8bRoPv8jOaMImSmcmYm+0P91sQp1
   t6+FPrmKT1MR3ugi6th8ZLgTO8wJ/goP3Hs9Wzp5EZD9nC6vMLTODn9qw
   bZl9dC36+MMZS6atQXWjLJGTrAEZvuzyetq8xF/1ASS8IS7g23mneP/pm
   y1yPmFIz32UoVvmOdG39Yj4G2Tndlm4xr4JHPriD3l7EUu+I9Pl3dDT8C
   snk/6WBf+esx0Z97Ei2mXg2DPwm7oqup2L52oTXwV/mDwO7WSN86LprbQ
   lVqp5k177k7fyFv9CUpmK/pBnWqpK/MlMDp+tGi+6NkBOn1Qk2/6rIYG9
   A==;
X-CSE-ConnectionGUID: gW/Q+M1uTMemdymLXTNfzw==
X-CSE-MsgGUID: geyx+OoLTDKhYe2Qx2XNYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52044952"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52044952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 16:06:43 -0700
X-CSE-ConnectionGUID: xx3ct4VoTz6An9NRu03d/w==
X-CSE-MsgGUID: 1wsLAKGhSsGzaf8Yk3rbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148602300"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2025 16:06:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQZxQ-000Dw8-1z;
	Sat, 14 Jun 2025 23:06:40 +0000
Date: Sun, 15 Jun 2025 07:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v2 3/4] bpf: Runtime part of fast-path termination
 approach
Message-ID: <202506150616.UcavOr5r-lkp@intel.com>
References: <20250614064056.237005-4-sidchintamaneni@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614064056.237005-4-sidchintamaneni@gmail.com>

Hi Siddharth,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Chintamaneni/bpf-Introduce-new-structs-and-struct-fields/20250614-144332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250614064056.237005-4-sidchintamaneni%40gmail.com
patch subject: [RFC bpf-next v2 3/4] bpf: Runtime part of fast-path termination approach
config: arc-randconfig-002-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150616.UcavOr5r-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150616.UcavOr5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150616.UcavOr5r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:41:10: fatal error: asm/insn.h: No such file or directory
      41 | #include <asm/insn.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +41 kernel/bpf/syscall.c

  > 41	#include <asm/insn.h>
    42	#include <asm/text-patching.h>
    43	#include <asm/irq_regs.h>
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
