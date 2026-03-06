Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900DB3E7161
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811724; cv=none; b=bgt8PCcP5XNhMNV+Y80Nlh62C6vrwuTc+OaWHbzvlDhFO7wljH2xBFD3lxp5t/kyLKlzJUnC0kDOBWM4YJd137pK4T372OzVxXgOfskYtBRS15VL67FYqJZug1BmDnPEt8OW7f3dfXPYvOWH3Ry6m0+1KyG2F0j8CykRxIAj3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811724; c=relaxed/simple;
	bh=umyrFu3WOwFJbNni3/EL5Fr1sY4WnckVP+5RxfSer/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cR55c0NfMCD/E3C7ncsYQllAvrKZ8uKW0Fd4I9FVg6cARxgW/1zmnCOwvyga4RBTnsglQJ9bZJy+a3jT3a11WFOhQ2v4jwgPsoVjpgRgnNVnHnqVIWRXZv8I89qtTIwWcS4jCCLPxK+i8IQbCYCCbma/4m608JNPpuOkiYgobfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPdhnYsP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPdhnYsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772811721; x=1804347721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umyrFu3WOwFJbNni3/EL5Fr1sY4WnckVP+5RxfSer/Y=;
  b=BPdhnYsPJFlZiLn+4oOaWFZSoQ7DGnDvx/N7dyl/AKIkfQ1qMTdbGGy/
   vSIiFj+wQUOy7Kjb1P2hRjcNVhCiyx41eqWBVLfzEoDrF91z8/YmTCtU2
   6LUcREoWVe39Im5Yfj2YEzBxSP6HFdLpimkhK9NGW4hh3a0VqJaEK8Ne2
   sybVG8owP07jx/oeB1iZz4oqIGSzVm1BQV5FYCR6Tem2D25/id9EN0Jfc
   hJ86klU3rRYuRGzP/+XY5BspNPMXr5qIyRRNmXf8DoIpIG0Kzp191v2Sh
   Ibtg0fvlFgHDhpTnGMMsUNjj04WSqoYlFT1+EmUsX5tDuTnLkjCynEp0a
   w==;
X-CSE-ConnectionGUID: e6kYriapSgGXFfurTYTNLg==
X-CSE-MsgGUID: I9Qz+mqUT1WcAiHuS6vN/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73116635"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73116635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:42:00 -0800
X-CSE-ConnectionGUID: 1FFWmMl6SCiiy4dZU2gJlQ==
X-CSE-MsgGUID: TyeDGX56RHWbLqcVF1eSsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="224020148"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 07:41:53 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyXJF-00000000105-0p0h;
	Fri, 06 Mar 2026 15:41:49 +0000
Date: Fri, 6 Mar 2026 23:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, david@kernel.org, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, ypodemsk@redhat.com, hughd@google.com,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
	hpa@zytor.com, arnd@arndb.de, lorenzo.stoakes@oracle.com,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, shy828301@gmail.com,
	riel@surriel.com, jannh@google.com, jgross@suse.com,
	seanjc@google.com, pbonzini@redhat.com
Subject: Re: [PATCH v6 2/2] x86/tlb: skip redundant sync IPIs for native TLB
 flush
Message-ID: <202603062315.vLgD8smL-lkp@intel.com>
References: <20260304021046.18550-3-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304021046.18550-3-lance.yang@linux.dev>

Hi Lance,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20260305]
[cannot apply to tip/x86/core arnd-asm-generic/master peterz-queue/sched/core tip/x86/mm linus/master v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lance-Yang/mm-mmu_gather-prepare-to-skip-redundant-sync-IPIs/20260304-101422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260304021046.18550-3-lance.yang%40linux.dev
patch subject: [PATCH v6 2/2] x86/tlb: skip redundant sync IPIs for native TLB flush
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260306/202603062315.vLgD8smL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062315.vLgD8smL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062315.vLgD8smL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/tlb.c:1841:13: warning: no previous prototype for 'native_pv_tlb_init' [-Wmissing-prototypes]
    1841 | void __init native_pv_tlb_init(void)
         |             ^~~~~~~~~~~~~~~~~~


vim +/native_pv_tlb_init +1841 arch/x86/mm/tlb.c

  1839	
  1840	#ifndef CONFIG_PARAVIRT
> 1841	void __init native_pv_tlb_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
