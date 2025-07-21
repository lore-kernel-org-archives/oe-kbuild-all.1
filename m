Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF278F3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 01:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753061178; cv=none; b=IebnvOPstF9MgC9WKf16RlBnHHkMIgwwWQkEY2U1uBvTGoIybERi+HvRjq904GAyT6ArpoQ//vGykv8GlWsMUZcYLgrkvJJ+MEceuXrF0Ghd441U2hARU3lTMPUt5hK78sGpw392s6yXIOyrxsiIm69a9N+hGPDYiv4X+5dNuxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753061178; c=relaxed/simple;
	bh=pvhRCHGIucYdujSap+8QzPuzACWS4wsHi36ZbyRIfzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6NEHfH1lxjo2i+TazUQhorRI0KN7kvwUt7I+CpOV8LiM+RtKLWWJ9O3DVLLxLDZikl7vndxDTnGragow3HDAApXIVddzNVnDSUgL0d3HtLIoi5J9tAjQ7FKhbRFuNcni5p+nNZ6/Nec9d7aoLQYoEk2nFojpI5OTtRKoj/qQ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Om70YqmI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Om70YqmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753061176; x=1784597176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pvhRCHGIucYdujSap+8QzPuzACWS4wsHi36ZbyRIfzU=;
  b=Om70YqmIyM/YEoCrh19E7sUh/Ru6u0KnWZUv6nfmn+k8x1uHo3DWkaLT
   y9mQTfNGXqDpjFzVgIiZ3Iy/Rgbpu2la7HS97Ia/2XsL0LM4h5A5mvH3m
   6ii8ZCYGNuPdX412VNSM2uOuiUKdwRB08A8+9lgrFfYYwVxaDYEurYOOu
   aLP3TJOdIFHsumdtNfaiBW8DhHW9Al21zFU8lMz7e2zFywrkJOdvX5V21
   OmptQjH7RSZULpoZwZpg5c2b23mkoz6kB3bIuuUTLZ5kREEvKzwjYmNRu
   E6fz606x9DP6Q3Cd/5jJZGUFROUTdG2yjzNZq0D1gPiLznSdI7DA6Ugig
   Q==;
X-CSE-ConnectionGUID: 81ftF8B6QZ6yXeLjaxiPPg==
X-CSE-MsgGUID: 4CtE0f2eSQScblUfnZ80jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="72838313"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="72838313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 18:26:16 -0700
X-CSE-ConnectionGUID: yx9QBkAFRLO48bxGjUoV0A==
X-CSE-MsgGUID: cBbe1sc/RRGUKZYvF5ur8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="162920814"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2025 18:26:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udfIA-000GOD-0D;
	Mon, 21 Jul 2025 01:26:10 +0000
Date: Mon, 21 Jul 2025 09:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to
 generic code
Message-ID: <202507210919.wPRFLcKb-lkp@intel.com>
References: <20250718223345.1075521-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718223345.1075521-7-samitolvanen@google.com>

Hi Sami,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0ee30d937c147fc14c4b49535181d437cd2fde7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Sami-Tolvanen/cfi-add-C-CFI-type-macro/20250719-063535
base:   0ee30d937c147fc14c4b49535181d437cd2fde7a
patch link:    https://lore.kernel.org/r/20250718223345.1075521-7-samitolvanen%40google.com
patch subject: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to generic code
config: arm-randconfig-r072-20250721 (https://download.01.org/0day-ci/archive/20250721/202507210919.wPRFLcKb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210919.wPRFLcKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210919.wPRFLcKb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:2:41: error: expected '%<type>' or "<type>"
       2 |         .pushsection    .data..ro_after_init,"aw",@progbits     
         |                                                   ^
>> <inline asm>:3:21: error: expected STT_<TYPE_IN_UPPER_CASE>, '#<type>', '%<type>' or "<type>"
       3 |         .type   cfi_bpf_hash,@object                            
         |                              ^
>> <inline asm>:9:19: error: .popsection without corresponding .pushsection
       9 |         .popsection                                             
         |                                                                 ^
   <inline asm>:10:41: error: expected '%<type>' or "<type>"
      10 |         .pushsection    .data..ro_after_init,"aw",@progbits     
         |                                                   ^
   <inline asm>:11:29: error: expected STT_<TYPE_IN_UPPER_CASE>, '#<type>', '%<type>' or "<type>"
      11 |         .type   cfi_bpf_subprog_hash,@object                            
         |                                      ^
   <inline asm>:17:19: error: .popsection without corresponding .pushsection
      17 |         .popsection                                             
         |                                                                 ^
   6 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
