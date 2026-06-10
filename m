Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959FB352F95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125078; cv=none; b=AYyeuPBFNVzONMaVOU6J7Kkyea2XwlcGlahL2BBLNNYd46T5oErwuMonRlHExXyin9Xmc83TKUnBPXvliNViDjdohWU66nvDRNbkKHIGgvEMAN0yWctJnlFXyYT4lkHTWhzsUaGiDZE1uw1DrAjd4GM+SJqgLNIHtjgkYr23kPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125078; c=relaxed/simple;
	bh=q6FiXZY/j5YuhQLvlVa3VnejylmiONQ3vGkSHgpj0Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHV/vQ85brVOq/qKOtYp1PWXj8PBV+3peTw1EfuTctyx1+sDFLIpsgaPbmL2TxQmuioDx7IJLYjj06rNRhmtY7or7xEVTDfndWMHIFVxwkT1cQmkXyKse16HwaRX7XX+TkLkiBG16g+113KkLHADnFWkuF8SSHl7x5CURjgYnps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z92SXuiL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z92SXuiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781125078; x=1812661078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6FiXZY/j5YuhQLvlVa3VnejylmiONQ3vGkSHgpj0Ws=;
  b=Z92SXuiLSTQfP1tVhIwNJkGGlnbphBO5XdEclmfj9up4LE4JPvP2xPA3
   6vhT8IDAq35qbsuR5/novP9qbuQNT/CLdsMcnh3ufY8cS6IbMy4nmMLW/
   Z/aKCI27ZZJYzoA8f4/zV5RfN3joOLrEynizNeKEiaDal8Lze8LIJuqDz
   XdFpmNEdB28qwW8LQDNO0hlsanKlE92YycGBp1f3s+Q00rQe9w+aHEoNp
   4DNQmh+x0SLS5QU7rF9PZgiw+/KKyAWNZXQrQb6RWxjKomEodRbg1QEbx
   KzuS15y7Pwy1HXXD7bk9TlsuUsJx7jKbNKQpi7oSBCwKJuvV4Ku59jNlu
   A==;
X-CSE-ConnectionGUID: Ndin5vFrRU+u2rNDO8sVKg==
X-CSE-MsgGUID: GyfnXdogSEiXG4JI+A8l8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81670625"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81670625"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 13:57:58 -0700
X-CSE-ConnectionGUID: ScDz+liFRbC+coxUyRfGPQ==
X-CSE-MsgGUID: 2+hJQl8DQsy+iBkrZXj0vA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2026 13:57:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXPzi-00000000LuA-0tiY;
	Wed, 10 Jun 2026 20:57:50 +0000
Date: Thu, 11 Jun 2026 04:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: sk@gentwo.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org, Sayali Kulkarni <sskulkarni@amperecomputing.com>
Subject: Re: [PATCH 2/2] arm64: tlbflush: Reset active_cpu on ASID rollover
Message-ID: <202606110405.ytZbcvhH-lkp@intel.com>
References: <20260609213615.2788698-3-sk@gentwo.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609213615.2788698-3-sk@gentwo.org>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on kvmarm/next soc/for-next linus/master v7.1-rc7 next-20260609]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sk-gentwo-org/arm64-tlbflush-Reset-active_cpu-on-ASID-rollover/20260610-063444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260609213615.2788698-3-sk%40gentwo.org
patch subject: [PATCH 2/2] arm64: tlbflush: Reset active_cpu on ASID rollover
config: arm64-randconfig-r132-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110405.ytZbcvhH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110405.ytZbcvhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110405.ytZbcvhH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/mm/context.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:169:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:169:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)

vim +169 arch/arm64/include/asm/cmpxchg.h

10b663aef1c2479 Catalin Marinas 2012-03-05  168  
305d454aaa292be Will Deacon     2015-10-08 @169  __CMPXCHG_GEN()
305d454aaa292be Will Deacon     2015-10-08  170  __CMPXCHG_GEN(_acq)
305d454aaa292be Will Deacon     2015-10-08  171  __CMPXCHG_GEN(_rel)
305d454aaa292be Will Deacon     2015-10-08  172  __CMPXCHG_GEN(_mb)
10b663aef1c2479 Catalin Marinas 2012-03-05  173  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
