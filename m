Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0772E0B5B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865739; cv=none; b=L2Lf26rkQ+58Cv3COOlrHLRrx5WYoa2nydAoZQJ98KQfg5vENPHkRGWXN7SLdV+DlAf+calNxiGx7LDHP5RPIbTzo0EH123YdemRzANQQLQYudZGhYFcgNwMR+8p6qFIbzzaalCg/qk23FMgQ185e78UiTwQA5zjsLCY3SCYYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865739; c=relaxed/simple;
	bh=fI1l5Jy6ued3SR2iCbcnewJf88qXRvdeHfan3RUlLvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4HQJy6JkJsYhVC8CuNUpRZCysDXd28TfLPVBOoiRAEQ+0AsVArQJ84xZjgOe8XkQ5VDQgOqH5KfanL1Ws20jz9iVIea16TRBTr90kK+EL2SOO6fUvXpJQa3NTdR0+c9RymNRCKMfFFh4n15KekHLyzikkYfQ6SCJWDr2LsmOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJJMEJ6J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJJMEJ6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760865737; x=1792401737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fI1l5Jy6ued3SR2iCbcnewJf88qXRvdeHfan3RUlLvE=;
  b=lJJMEJ6Jp84E3FVT3snRVuMLj54feq4AwwKoEiSL8zXyxZHMinAV5cM7
   CdArqg0/B0k9h3zw51geg2YJi63mLhCMVm/ZVvBSU2kjE/jb5ubjKhsoE
   BBSEWi0cSIFfwiPLLVe85Y+brqzihlahPVdAWp0ZRCJr82X8WsdBZaTDO
   67aEw6Zmb41au+8o+qeuGA/l5h6bDoxYSSiYjO/3lIuly1Z0qjH1dlRjJ
   lQ95bErbRHkdrQtYf4NPIatroNm+0r0gwp/vf5glgYNDs0zDB4ZjPDkzJ
   6RZrlyX3Jv2kZaSRT66aCu0ul97WuE4pM8k85hEO4/dTr46rRu9pD90N1
   w==;
X-CSE-ConnectionGUID: 8k2SMA8+Qn+ts4cACd8ogw==
X-CSE-MsgGUID: 5a1En4vMSKu0l7DM63UkJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85637110"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="85637110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 02:22:16 -0700
X-CSE-ConnectionGUID: TUOF0yiVQCqHiEQRWRZRxQ==
X-CSE-MsgGUID: Lr2X+fIvRu+Ib9iR7xjqLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="220246411"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2025 02:22:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAPbM-0008zF-0j;
	Sun, 19 Oct 2025 09:21:30 +0000
Date: Sun, 19 Oct 2025 17:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch v2 16/16] multikernel: Integrate Kexec HandOver
 framework for DTB preservation
Message-ID: <202510191644.1TvCshk3-lkp@intel.com>
References: <20251019061631.2235405-17-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019061631.2235405-17-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on powerpc/fixes robh/for-next linus/master v6.18-rc1]
[cannot apply to powerpc/next next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/kexec-Introduce-multikernel-support-via-kexec/20251019-141940
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251019061631.2235405-17-xiyou.wangcong%40gmail.com
patch subject: [RFC Patch v2 16/16] multikernel: Integrate Kexec HandOver framework for DTB preservation
config: i386-buildonly-randconfig-002-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191644.1TvCshk3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191644.1TvCshk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191644.1TvCshk3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/setup.h:72,
                    from arch/x86/kernel/ebda.c:6:
>> include/linux/kexec_handover.h:173:44: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
     173 | static inline int mk_kexec_finalize(struct kimage *target_image)
         |                                            ^~~~~~
--
   ld: arch/x86/kernel/trampoline_64_bsp.o: in function `startup_32_vector_bsp':
>> (.x86_trampoline_bsp+0x1ec): undefined reference to `__KERNEL32_CS'


vim +173 include/linux/kexec_handover.h

   172	
 > 173	static inline int mk_kexec_finalize(struct kimage *target_image)
   174	{
   175		return -EOPNOTSUPP;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
