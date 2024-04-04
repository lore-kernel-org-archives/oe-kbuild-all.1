Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1884163
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 00:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712189601; cv=none; b=kdeUfPMRFMcwY3jXP/yXLHIIv52UehYKn4CfXsxBzovqI5z+/MRB7LoaP8+1lUwePzcOm08Zla1pzWtqpe+39tnzcgGJATRudyypN6OQAxvTj8UPWdMG54oY89dtfW+Wyyg1l29JKyPGhAq3oHklBQ7HmWQoQwxP+0tUIx/TmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712189601; c=relaxed/simple;
	bh=mnvCL+7j/mcSaKM475DIBJB9fBH9MPBRMs5WdTVWJbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJR3u6ZKNhh2n6VO7g7GDEHlkutJGPATjscPbGhL3PkF57H9xkkWaC0TGvMwRzYlROBmdAp86EpUSzLJPDXpXgSl0w1M8hgVncJI7rovMLoGBA4We1wsNn0yVtx82tF1cdGF6J7ZZAVVmv6a8WYnXGIIFbixcL36TNTIbxYnEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbdAt8q9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbdAt8q9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712189600; x=1743725600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mnvCL+7j/mcSaKM475DIBJB9fBH9MPBRMs5WdTVWJbU=;
  b=MbdAt8q96Pg+Hq0mehMZhGVnx+CUQ590hMYeSTWZpOdyMIPPwoPTYnJZ
   wx5cVT49exQvZXONceib8o/94oK+w6TyGABI21Uh5qUx01O1kZmgn9zCX
   CCG73F0Zr7bCnu/5B+no6+wAQKfy1azNHvEmL1zzS4fIJlCv2MQwmNwkB
   5pQmW8OmjvdLkqMaKkhlZJskj1NoGlpCO+xHP5yC9uXY2hEfCtpWbOpn5
   9zIuwwCv6sS/usNHisiRnbmTTRZf9fiSlmLARssDILKuhR9bH8LLwjsKa
   PpwERVcKkann6rJRAtYGnh9JN01lWTjlPcWEhS0b+w7pGcoUt9P8ag1iy
   Q==;
X-CSE-ConnectionGUID: qQXOpmB2TKitaA4mKd6cYg==
X-CSE-MsgGUID: rCytvKWeTqi4F8Z4fa/iKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18070223"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18070223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 17:13:19 -0700
X-CSE-ConnectionGUID: dMiZJcrxTLyPyW0v6PUSjQ==
X-CSE-MsgGUID: 4lCYdzAeQUSLum8V6UL8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19061088"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Apr 2024 17:13:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsAjD-0000O8-1D;
	Thu, 04 Apr 2024 00:13:15 +0000
Date: Thu, 4 Apr 2024 08:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 1/4] bpf: add special internal-only MOV
 instruction to resolve per-CPU addrs
Message-ID: <202404040813.q1PD4knu-lkp@intel.com>
References: <20240402021307.1012571-2-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402021307.1012571-2-andrii@kernel.org>

Hi Andrii,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-add-special-internal-only-MOV-instruction-to-resolve-per-CPU-addrs/20240402-101450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240402021307.1012571-2-andrii%40kernel.org
patch subject: [PATCH v2 bpf-next 1/4] bpf: add special internal-only MOV instruction to resolve per-CPU addrs
config: x86_64-randconfig-006-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040813.q1PD4knu-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040813.q1PD4knu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040813.q1PD4knu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/net/bpf_jit_comp.o: in function `emit_code':
>> arch/x86/net/bpf_jit_comp.c:31:(.text+0xf2c3): undefined reference to `this_cpu_off'


vim +31 arch/x86/net/bpf_jit_comp.c

f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  23  
5cccc702fd54e5 Joe Perches             2014-12-04  24  static u8 *emit_code(u8 *ptr, u32 bytes, unsigned int len)
0a14842f5a3c0e Eric Dumazet            2011-04-20  25  {
0a14842f5a3c0e Eric Dumazet            2011-04-20  26  	if (len == 1)
0a14842f5a3c0e Eric Dumazet            2011-04-20  27  		*ptr = bytes;
0a14842f5a3c0e Eric Dumazet            2011-04-20  28  	else if (len == 2)
0a14842f5a3c0e Eric Dumazet            2011-04-20  29  		*(u16 *)ptr = bytes;
0a14842f5a3c0e Eric Dumazet            2011-04-20  30  	else {
0a14842f5a3c0e Eric Dumazet            2011-04-20 @31  		*(u32 *)ptr = bytes;
0a14842f5a3c0e Eric Dumazet            2011-04-20  32  		barrier();
0a14842f5a3c0e Eric Dumazet            2011-04-20  33  	}
0a14842f5a3c0e Eric Dumazet            2011-04-20  34  	return ptr + len;
0a14842f5a3c0e Eric Dumazet            2011-04-20  35  }
0a14842f5a3c0e Eric Dumazet            2011-04-20  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
