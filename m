Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C941BD9D9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 01:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030947; cv=none; b=ERpLqhbEt7PAju+ERASWEE0XLG5B2EAkWPgxYV8szHvnGl1Do2I03RLOf7F7nKK5kdqlXOGw1s4iGj/ahWTKcObIhzpKjwueON+PmNu4uTxNkY+/OMXpuBft5cuj/nRXMBk9BnXqEg7Ly5x9YwelrTuWIThWQ3RMhFUrSsrmM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030947; c=relaxed/simple;
	bh=ltx9LvhO7jDkXantAxEy0W4DABjxEuwiQL0xJLNs8Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SADjyJERvjW/MiwzDqdqwb16Chiw+jPLrtSenkEZmwNOEycFpX1qrxYa3WDLXvOj8Cwv06UIodGVqJL9wIw19FDGhWd1gp5GR0qFkFVYIXo1uetibWf0+iaR7o2GOb4wUdrAT3WTe/UWfWECrEZSFzgJzOJWuulD7HenR4evIxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBxLzL8a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBxLzL8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731030946; x=1762566946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ltx9LvhO7jDkXantAxEy0W4DABjxEuwiQL0xJLNs8Zw=;
  b=IBxLzL8aO7jwF1JuyrWSVC3WX00fHS5n2Gd/WxjV++yT0KFlNup+2fqZ
   DwW7bRkAEXeeD/pHaN+I152Cv+O9A5+KRU5YAHy1BP72j088wAn2aSzqw
   A0gRscBg3AOCIoaajoplgfp/BfrxC3y6z36r62dzdLcmnFcoMUUF3LUSW
   QCJvwyR1Lel3VbC+JF2ZUM/cslXrV7634/5F6TB1P8QbWYwFfgmBvEkot
   j3zBJH4evZCDTHiYraez4DPtH756T8uFLrll7hDst8003dImodxxuYKZ0
   pcsPrgbzLGKrPvjrEJTVaomDZn3eRjR7RogRo5Xls5rPDpgfNEPVGbgLL
   Q==;
X-CSE-ConnectionGUID: kSeEHBuUS/2ggzX4a57ucQ==
X-CSE-MsgGUID: 832MlumFT72CtzP2jUJJUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31072775"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31072775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:55:45 -0800
X-CSE-ConnectionGUID: Za+JHk8pRzeOIdKdoS+u/w==
X-CSE-MsgGUID: m353ayLMRJeOm1dE0PYKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89865670"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2024 17:55:41 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9EDr-000qtc-0w;
	Fri, 08 Nov 2024 01:55:39 +0000
Date: Fri, 8 Nov 2024 09:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>, Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, bpf@vger.kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: add bpf_cpu_cycles_to_ns helper
Message-ID: <202411080952.bCRm4YHx-lkp@intel.com>
References: <20241107211206.2814069-2-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107211206.2814069-2-vadfed@meta.com>

Hi Vadim,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/bpf-add-bpf_cpu_cycles_to_ns-helper/20241108-051950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241107211206.2814069-2-vadfed%40meta.com
patch subject: [PATCH bpf-next v4 2/4] bpf: add bpf_cpu_cycles_to_ns helper
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411080952.bCRm4YHx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080952.bCRm4YHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080952.bCRm4YHx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/helpers.c:3030:18: warning: extra tokens at end of #ifdef directive
    3030 | #ifdef IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
         |                  ^
   kernel/bpf/helpers.c: In function 'bpf_get_cpu_cycles':
   kernel/bpf/helpers.c:3033:16: error: implicit declaration of function '__arch_get_hw_counter' [-Wimplicit-function-declaration]
    3033 |         return __arch_get_hw_counter(1, NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c: In function 'bpf_cpu_cycles_to_ns':
   kernel/bpf/helpers.c:3038:38: error: implicit declaration of function '__arch_get_k_vdso_data' [-Wimplicit-function-declaration]
    3038 |         const struct vdso_data *vd = __arch_get_k_vdso_data();
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:3038:38: error: initialization of 'const struct vdso_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/bpf/helpers.c:3040:42: error: invalid use of undefined type 'const struct vdso_data'
    3040 |         return mul_u64_u32_shr(cycles, vd->mult, vd->shift);
         |                                          ^~
   kernel/bpf/helpers.c:3040:52: error: invalid use of undefined type 'const struct vdso_data'
    3040 |         return mul_u64_u32_shr(cycles, vd->mult, vd->shift);
         |                                                    ^~
   kernel/bpf/helpers.c: At top level:
   kernel/bpf/helpers.c:3135:18: warning: extra tokens at end of #ifdef directive
    3135 | #ifdef IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
         |                  ^
   kernel/bpf/helpers.c: In function 'bpf_cpu_cycles_to_ns':
   kernel/bpf/helpers.c:3041:1: warning: control reaches end of non-void function [-Wreturn-type]
    3041 | }
         | ^


vim +3038 kernel/bpf/helpers.c

  3035	
  3036	__bpf_kfunc u64 bpf_cpu_cycles_to_ns(u64 cycles)
  3037	{
> 3038		const struct vdso_data *vd = __arch_get_k_vdso_data();
  3039	
  3040		return mul_u64_u32_shr(cycles, vd->mult, vd->shift);
  3041	}
  3042	#endif
  3043	__bpf_kfunc_end_defs();
  3044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
