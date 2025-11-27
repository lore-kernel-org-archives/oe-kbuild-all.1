Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B54224B06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 01:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764208779; cv=none; b=FqYWN8DM8ioKxWsxvjuL47udHdYZsmxJm3c9sf4UIK5TaxGmH2a+yYHRjoGWBVypblm6EQGh7hx2RW7FSlnoisoDAYwG6Ts4LQaA84T0Iib0/HhjrRwoW0YBHs5VBH5CIHZjJDhX8MULt1A3fzAHDUefsErWGDXvlggQIRDSsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764208779; c=relaxed/simple;
	bh=/iTY5lK+GbVbpicqPvPbabWVnqm2qRHYTtm+0dMiuCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haeleeeUNorQzkl+XSxGYQVBYrLbMX3oxE/+VqOh43LYUxGvTARTERnESS0AGRXHYiLCO4j8II4Zm7AoNlh/ogl1hqNel5+eq6cEUlbCs/herPGK9iA3ID5+lR1w/WXds+D6cYNf8ooVzOI1ZDbF48GNk9LIS/YgEcCG47tfn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzaj84Uy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzaj84Uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764208777; x=1795744777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/iTY5lK+GbVbpicqPvPbabWVnqm2qRHYTtm+0dMiuCA=;
  b=hzaj84UyB7kGswEYom3ZPvoZPOiGPGBVw6B4rdIuadQYD71jI0N70Onn
   P7k3fLlSNXT72+ci2xE33KJYCL255FWfJj6/sRu//Rt76qLH4FJZSpMeG
   5uATJK0FVL+u84DURoZfY+OgQVvDs7/dz4BwOgkvHND87oEFuwjVEp5lz
   dpJDopssqQnO+qzmJtjorRwixgJfC1phVdOtFMysArNScOyMKERcOqBXY
   dxw8a/DIaNekHegTHjd5QqaNsGfSdqKDWS1lA9GfHu8V1Oo2AT/mSVfhZ
   05zthNrsfbs+zErIILc3iC5YluQf7OWQkbpXpWCPXZjlT6kb5oQRnG4mE
   w==;
X-CSE-ConnectionGUID: kA5+yoh9QFqcddyE6kon6g==
X-CSE-MsgGUID: Syxfxl4/QC6+ARigY5wR7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65439489"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65439489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 17:59:37 -0800
X-CSE-ConnectionGUID: dOnZxvv5TN6aBUKek9C2pg==
X-CSE-MsgGUID: kq4D3beKReSkhCcAnWR2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193907601"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 17:59:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORIC-000000003Yb-2ohe;
	Thu, 27 Nov 2025 01:59:32 +0000
Date: Thu, 27 Nov 2025 09:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@thingy.jp>, geert@linux-m68k.org
Cc: oe-kbuild-all@lists.linux.dev, kas@kernel.org, mingo@kernel.org,
	seanjc@google.com, bp@alien8.de, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH] m68k: implement runtime consts
Message-ID: <202511270956.hzGiPzdZ-lkp@intel.com>
References: <20251127000505.2117956-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127000505.2117956-1-daniel@thingy.jp>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-m68k/for-next]
[also build test WARNING on geert-m68k/for-linus linus/master v6.18-rc7 next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Palmer/m68k-implement-runtime-consts/20251127-080652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
patch link:    https://lore.kernel.org/r/20251127000505.2117956-1-daniel%40thingy.jp
patch subject: [PATCH] m68k: implement runtime consts
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251127/202511270956.hzGiPzdZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270956.hzGiPzdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270956.hzGiPzdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/dcache.c:38:
   arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
>> arch/m68k/include/asm/runtime-const.h:28:29: warning: unused variable 'end' [-Wunused-variable]
      28 |         const unsigned long end = start + sizeof(*value);
         |                             ^~~
   arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_shift':
   arch/m68k/include/asm/runtime-const.h:51:29: warning: unused variable 'end' [-Wunused-variable]
      51 |         const unsigned long end = start + sizeof(*insn);
         |                             ^~~


vim +/end +28 arch/m68k/include/asm/runtime-const.h

    13	
    14	#define runtime_const_ptr(sym) ({				\
    15		typeof(sym) __ret;					\
    16		asm_inline("1:\t"					\
    17			"mov.l #0xcafef00d,%0\n\t"			\
    18			".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
    19			".long 1b - .\n\t"				\
    20			".popsection"					\
    21			: "=a" (__ret));				\
    22		__ret; })
    23	
    24	static inline void __runtime_fixup_ptr(void *where, unsigned long val)
    25	{
    26		u32 *value = where + 2;
    27		const unsigned long start = ((unsigned long) where) + 2;
  > 28		const unsigned long end = start + sizeof(*value);
    29	
    30		*value = val;
    31	
    32		flush_icache_range(start, end);
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
