Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5681749
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917367; cv=none; b=AW0nu1D8HmyiJ9/OWEGV5CchqSlI3Yq1I+Nf+inis3ORmYVl2Y/Eetmb1jIkatfuIX/0++XaNgLhZPBMHDcEyCOXQnNXO176DpSAEH6nA1DSsvNaKEOZjvThzoLBXs7FZromDo3D/6VXiIjtrPwsb1UsUiBmBATpThafQYmgkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917367; c=relaxed/simple;
	bh=iv+C1HZxzkwzdBrMqV5AKD5Z05Lu3O7Jvw+mKpN7Olk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbfYaAY2tzjdtIEW2fU7X8xS0Parhm7gk7S40KeYCfxpOtXvB2ueSg4RkBMZkwZI7B7DCyWziMI+IW6QKi1cjkwZkizmGbOtOmaygijyEyBvkJF3WwXLWqXP/lrIJ9ui2t76vBxTxptv3rJNGbaVaw2KvvU2SH8R/NGSI3oO9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXxkGsNw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXxkGsNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728917366; x=1760453366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iv+C1HZxzkwzdBrMqV5AKD5Z05Lu3O7Jvw+mKpN7Olk=;
  b=VXxkGsNwZtTpQDdU3CMSt/WnPSL1/7cJqkHSbpDfKm8Rhb5ZG33S/EDi
   jPvxUl2sF/kpZm8RCu4EngJ2OyaEBzUH0BZyY/fvvTcUlTuAxas1r/44b
   MRZ7yyKy8V/mmUHXk8T5g4acx05lSUgrEDQY9MoEyRnDeI8gUJsDP3W4n
   VGGs8HRHnrFsYCWw86jzsqWYQvG2XBO4nOH3w4R0DeW1DmV9e+CLs7GNP
   jN0qX0FiMzyFumyf+JJNgbsHGWIOoWXccIcShmrXWjcn8yELBiUkzj+PU
   bnHLkUt9lH4Gm4VlgXtbOZ3bWDDqyIy03346UQc9SaEElurQFI+D8ZabI
   g==;
X-CSE-ConnectionGUID: myQQRcghTaC4sBbNrJCGxg==
X-CSE-MsgGUID: 3oYDmcznQeimWluA7X2dPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28362459"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28362459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:49:25 -0700
X-CSE-ConnectionGUID: SZPReLnhTtK43Kb2dxd0aA==
X-CSE-MsgGUID: 4j31P8pFSBy6W3pDcpXlVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="82357268"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 07:49:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0MNt-000Fq8-21;
	Mon, 14 Oct 2024 14:49:21 +0000
Date: Mon, 14 Oct 2024 22:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC/RFT 3/3] kernel: converge common shadow stack flow
 agnostic to arch
Message-ID: <202410142234.xsR8s5Mp-lkp@intel.com>
References: <20241010-shstk_converge-v1-3-631beca676e7@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-shstk_converge-v1-3-631beca676e7@rivosinc.com>

Hi Deepak,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-Introduce-ARCH_HAS_USER_SHADOW_STACK/20241011-083424
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241010-shstk_converge-v1-3-631beca676e7%40rivosinc.com
patch subject: [PATCH RFC/RFT 3/3] kernel: converge common shadow stack flow agnostic to arch
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241014/202410142234.xsR8s5Mp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410142234.xsR8s5Mp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142234.xsR8s5Mp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/usershstk.c: In function 'shstk_setup':
>> kernel/usershstk.c:223:30: warning: unused variable 'shstk' [-Wunused-variable]
     223 |         struct thread_shstk *shstk = &current->thread.shstk;
         |                              ^~~~~
   kernel/usershstk.c: In function 'shstk_alloc_thread_stack':
   kernel/usershstk.c:251:30: warning: unused variable 'shstk' [-Wunused-variable]
     251 |         struct thread_shstk *shstk = &tsk->thread.shstk;
         |                              ^~~~~


vim +/shstk +223 kernel/usershstk.c

   220	
   221	int shstk_setup(void)
   222	{
 > 223		struct thread_shstk *shstk = &current->thread.shstk;
   224		unsigned long addr, size;
   225	
   226		/* Already enabled */
   227		if (is_shstk_enabled(current))
   228			return 0;
   229	
   230		/* Also not supported for 32 bit */
   231		if (!cpu_supports_shadow_stack() ||
   232			(IS_ENABLED(CONFIG_X86_64) && in_ia32_syscall()))
   233			return -EOPNOTSUPP;
   234	
   235		size = adjust_shstk_size(0);
   236		addr = alloc_shstk(0, size, 0, false);
   237		if (IS_ERR_VALUE(addr))
   238			return PTR_ERR((void *)addr);
   239	
   240		set_shstk_ptr_and_enable(addr + size);
   241		set_shstk_base_size(current, addr, size);
   242	
   243		set_thread_shstk_status(true);
   244	
   245		return 0;
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
