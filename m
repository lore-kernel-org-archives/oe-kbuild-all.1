Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1C14F9EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507604; cv=none; b=qheRRVNDi7PxqIL2dMdOuJo/PCfB5q22R1RSjbU9Xl9iOMtDVGTIppnI5/Jl5/wnFfAlnFyorcGuOmELz9p6qS54C2FYVcgYso3l4zLSiBHErOCTJDCQhlssYwBfQi/bpjtKoDgJvUwxHiye6HeqA9E/Vj3OVRmPTAxnbR4iga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507604; c=relaxed/simple;
	bh=jsAzbLXghaIZr/Sa8Coe1aei7Hn/vidgzfFq2R6N19k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJHBMW4J2VepSwZwEl/XUkpMdoZOTqxqlFusxxDnD6MtCsvAamfocJHt/bxZsT6aYiR1DvQx0ZJm63KRZwnKevkd6/tLPnGMrmNzSg1qv/7xSizr6EG3V2xgwjpmm2LwuamaYOw5kgTyR9MHk54911ZDUI3On+01XYkzwHWNv2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJL5M4fJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJL5M4fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745507603; x=1777043603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jsAzbLXghaIZr/Sa8Coe1aei7Hn/vidgzfFq2R6N19k=;
  b=TJL5M4fJPaxzsqfxezvcCJ6efkBd8S/CKafXokcSHAhF2wj/yZt88Wcb
   hfjznzbyQeOqLiNQSnqO21S2lMcm/0KN4Sngov900v6lCIC6rCTJe6EBa
   qWMciCwSmqf4fJKgVhU4KS7LIm+BC050pENJQUyYc6Mifs4jvdrx0Neyu
   V9o6L1KCPcF5BUrvcBcrNkkVrfDB5EFwAQaekLYeLB291iKBjyE6FpHNR
   HsEkC3arcPdosoaHHU9yVTUYJ8wyzYNR0cYXYMlPR2ZQnFGqal4kSgpny
   iE/iYprV5BYQw/RdkYj5zL1KFhLAD0i4BZ4tIDpjzQ66G9FFyUbbpBGlv
   w==;
X-CSE-ConnectionGUID: plLWJL7JScyRhVTxPGvaog==
X-CSE-MsgGUID: aKQOv34uR/SZabXkGCrJeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57788595"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="57788595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 08:13:22 -0700
X-CSE-ConnectionGUID: IQ0Dg/H0Ryimq9uOv16Grw==
X-CSE-MsgGUID: t8P7BWP5S7mykfWxjDu3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132384022"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Apr 2025 08:13:21 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7yGM-0004G1-3B;
	Thu, 24 Apr 2025 15:13:18 +0000
Date: Thu, 24 Apr 2025 23:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH PoC 08/11] x86/boot: Move startup code out of __head
 section
Message-ID: <202504242345.Zs1dvyW7-lkp@intel.com>
References: <20250423110948.1103030-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423110948.1103030-21-ardb+git@google.com>

Hi Ard,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 121c335b36e02d6aefb72501186e060474fdf33c]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-linkage-Add-SYM_PI_ALIAS-macro-helper-to-emit-symbol-aliases/20250423-191433
base:   121c335b36e02d6aefb72501186e060474fdf33c
patch link:    https://lore.kernel.org/r/20250423110948.1103030-21-ardb%2Bgit%40google.com
patch subject: [RFC PATCH PoC 08/11] x86/boot: Move startup code out of __head section
config: x86_64-buildonly-randconfig-006-20250424 (https://download.01.org/0day-ci/archive/20250424/202504242345.Zs1dvyW7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504242345.Zs1dvyW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504242345.Zs1dvyW7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: Unexpected GOT entries detected!
   ld: vmlinux.o: in function `__pi_startup_64_load_idt':
>> (.text+0x1525c3): undefined reference to `__pi_memset'
>> ld: (.text+0x15262d): undefined reference to `__pi_memcpy'
   ld: vmlinux.o: in function `__pi_startup_64_setup_gdt_idt':
>> (.init.text+0x42254): undefined reference to `__pi_latent_entropy'
   ld: vmlinux.o: in function `__pi___startup_64':
   (.init.text+0x422d5): undefined reference to `__pi_latent_entropy'
   ld: .tmp_vmlinux1: hidden symbol `__pi_memcpy' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
