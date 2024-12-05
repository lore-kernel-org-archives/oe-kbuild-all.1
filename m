Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60DC22576F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 18:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422923; cv=none; b=hbU3KN2CkmLNcVnFYELgIgzx2SM3N27VB6h8w2CL63G3WX8NjKY8l/o/Uimn2JgrqQuzloBfTKc+UPXsH+UmXmL70/y67aW8o+pgeCDOBb41YDFbAhoDSurWn51Q/SW48i7MVsOeb4T0JkoUCL0jvgDIgcGo45c3p500NU7j4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422923; c=relaxed/simple;
	bh=DOzF7zTOFZ5fLjc3/FidwJq88gcdl0SPdr8PZKuzcxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tP9kTUxzJhr8PwzuPcoEQ1vox2hNNPSOH+CGzy4vFlVOJUKOTcahrS22k+ZtZQ9xP1XiG5uRYES+oaY5ptGvw9ET6X7Rw60L7wJ9vo6Vz4v7LeZiHg7wflTMmo6QrfpB2XdK1CVRTGg62DWlqlufeRMhB3c/TiFm4ChvT4W2L6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4nefIUA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4nefIUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733422921; x=1764958921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DOzF7zTOFZ5fLjc3/FidwJq88gcdl0SPdr8PZKuzcxc=;
  b=S4nefIUA4QIt3I/ZxbKPjD5XW3UJt1N7fmI6p3FCa7HwlEfk644IUv3Y
   LL/+Ob3YYMTzJlowdm++yV/ojUmfFmsB+kY464wf4qWbYqfQhpOKIS4yf
   UZNbMScnp11r5BkWwW+HBcffySdMhajoEntoWlq2zXSHlcJxlpo5OGfIg
   MdMExhB7r/oM6oXv2icPqXSjZGXqlkHdPL8g97BTlVWx42upgsJvPVrf2
   WLr26himwTfeuBtoEMceWrkRtOQNjbifHIvAD1K90tSho23j4ggCHbhic
   wouO6Astz4PMFfySlhY1/vOkyiqsJpwlkGrA4Uz9w3URCs2oi2vWUzZTS
   g==;
X-CSE-ConnectionGUID: XYPDMgAUSamODpO09vGtZg==
X-CSE-MsgGUID: 7BOFns4rRbW4Ls/ULTC2MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45143701"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="45143701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 10:22:00 -0800
X-CSE-ConnectionGUID: PNxlfSYZRn+bnXc7PU9wYA==
X-CSE-MsgGUID: ggFJd72WS1eoRszGgMS6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94998884"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2024 10:21:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJGU8-0000IJ-1b;
	Thu, 05 Dec 2024 18:21:56 +0000
Date: Fri, 6 Dec 2024 02:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/7] x86/boot: Disable UBSAN in early boot code
Message-ID: <202412060246.tOeGwyJY-lkp@intel.com>
References: <20241205112804.3416920-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205112804.3416920-13-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/core linus/master v6.13-rc1 next-20241205]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-sev-Avoid-WARN-s-and-panic-s-in-early-boot-code/20241205-193120
base:   tip/master
patch link:    https://lore.kernel.org/r/20241205112804.3416920-13-ardb%2Bgit%40google.com
patch subject: [PATCH v4 4/7] x86/boot: Disable UBSAN in early boot code
config: x86_64-buildonly-randconfig-005-20241205 (https://download.01.org/0day-ci/archive/20241206/202412060246.tOeGwyJY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060246.tOeGwyJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060246.tOeGwyJY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/head64.o: in function `rip_rel_ptr':
>> arch/x86/include/asm/asm.h:120: undefined reference to `level4_kernel_pgt'


vim +120 arch/x86/include/asm/asm.h

0e2e160033283e2 H. Peter Anvin 2018-06-21  115  
1c811d403afd73f Ard Biesheuvel 2024-02-03  116  #ifndef __ASSEMBLY__
1c811d403afd73f Ard Biesheuvel 2024-02-03  117  #ifndef __pic__
1c811d403afd73f Ard Biesheuvel 2024-02-03  118  static __always_inline __pure void *rip_rel_ptr(void *p)
1c811d403afd73f Ard Biesheuvel 2024-02-03  119  {
1c811d403afd73f Ard Biesheuvel 2024-02-03 @120  	asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
1c811d403afd73f Ard Biesheuvel 2024-02-03  121  
1c811d403afd73f Ard Biesheuvel 2024-02-03  122  	return p;
1c811d403afd73f Ard Biesheuvel 2024-02-03  123  }
1c811d403afd73f Ard Biesheuvel 2024-02-03  124  #define RIP_REL_REF(var)	(*(typeof(&(var)))rip_rel_ptr(&(var)))
1c811d403afd73f Ard Biesheuvel 2024-02-03  125  #else
1c811d403afd73f Ard Biesheuvel 2024-02-03  126  #define RIP_REL_REF(var)	(var)
1c811d403afd73f Ard Biesheuvel 2024-02-03  127  #endif
1c811d403afd73f Ard Biesheuvel 2024-02-03  128  #endif
1c811d403afd73f Ard Biesheuvel 2024-02-03  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
