Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7012746A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Apr 2025 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745793628; cv=none; b=lJNosoAv5wC90Y4Qopi0gKLSHZp7GpdB3yVmiUXYlXx/vZZFRAgPhKE5pb8+t3+G4j5EfZd4CrXMOy8Wl8XI+0MjcfrblDJVBCxJmMZ8NcYWfdf2eAdajdL/Fs3rt5aOUcSwvWK17vblXnZ4+6alAnm7u0fQ3eKB9NjIdCIsVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745793628; c=relaxed/simple;
	bh=5Iyyo5qKpzwwKTW4+JRh5I1dfnJZ6Ozfg7GpZG5EMKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX4tVTkR0XhxlWZFanNsHxr2dxJ7NtSNfVkg33IgyEpx3liV3Iw1MHN1ommtpranE5epschYNgTfvInoT1uZEQ2z1EmLDGmuf+ftoADhxehczlno4jfq7pdirTNGf2/Vb4Xgn70LDV3jM7hxxqJTPb28DbSBT4LRGV0e38EbyO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5k2MUSd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5k2MUSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745793626; x=1777329626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Iyyo5qKpzwwKTW4+JRh5I1dfnJZ6Ozfg7GpZG5EMKA=;
  b=j5k2MUSduc9fReUA50jdx7TnIwu2UvdNxQN+g8FVh8NZKq6rNKdqABjL
   nzJGLc011BXCTDTUsQPOCnf8PhRjtqznE9L4e0pZ6yQXU7MXy12SRdBvU
   NCq9UMsCRi2bBG63PaRxboyhxY5nGXqGfQbD5+htT9SlctLAFzVGYDr2A
   7EHPtpnDQBny4sXY7fdO1YXCyVxqzFKbeuNW37ZCUdWnd1lT5j4Y8K5O9
   PnUNaoaALohqvd34gAqzbu3Za4z2ETCeYNfuy3kjeARhK+WjYOsCYTOvE
   UlxzB7s9abUD3nIUoszfPHN2cL8uk2wwd/cWjrIjSl9WO8bnitlkB1Dm7
   Q==;
X-CSE-ConnectionGUID: DtHlSLrhQeqma8RHd57Xew==
X-CSE-MsgGUID: wW/F7BweT6Cfjw5srKgGIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47516249"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47516249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 15:40:25 -0700
X-CSE-ConnectionGUID: oRu79IJFS6GueKB4+pio5Q==
X-CSE-MsgGUID: A/yU9udlTU+xqQlXYvk2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="156581311"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Apr 2025 15:40:25 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Afe-0006UL-0P;
	Sun, 27 Apr 2025 22:40:22 +0000
Date: Mon, 28 Apr 2025 06:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 02/15] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
Message-ID: <202504280617.WgdYSvhd-lkp@intel.com>
References: <20250427092027.1598740-3-xin@zytor.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427092027.1598740-3-xin@zytor.com>

Hi Xin,

kernel test robot noticed the following build errors:

[auto build test ERROR on a5447e92e169dafaf02fd653500105c7186d7128]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Li-Intel/x86-msr-Add-missing-includes-of-asm-msr-h/20250427-212604
base:   a5447e92e169dafaf02fd653500105c7186d7128
patch link:    https://lore.kernel.org/r/20250427092027.1598740-3-xin%40zytor.com
patch subject: [PATCH v4 02/15] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: i386-randconfig-141-20250428 (https://download.01.org/0day-ci/archive/20250428/202504280617.WgdYSvhd-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504280617.WgdYSvhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504280617.WgdYSvhd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/xen/suspend.c:42:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |                 wrmsrq(MSR_IA32_SPEC_CTRL, this_cpu_read(spec_ctrl));
         |                 ^
>> arch/x86/xen/suspend.c:58:3: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |                 rdmsrq(MSR_IA32_SPEC_CTRL, tmp);
         |                 ^
   arch/x86/xen/suspend.c:60:3: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |                 wrmsrq(MSR_IA32_SPEC_CTRL, 0);
         |                 ^
   3 errors generated.


vim +/wrmsrq +42 arch/x86/xen/suspend.c

0e91398f2a5d4e Jeremy Fitzhardinge 2008-05-26  38  
f6eafe3665bcc3 Ian Campbell        2009-11-25  39  static void xen_vcpu_notify_restore(void *data)
f6eafe3665bcc3 Ian Campbell        2009-11-25  40  {
71c208dd54ab97 Juergen Gross       2018-02-26  41  	if (xen_pv_domain() && boot_cpu_has(X86_FEATURE_SPEC_CTRL))
78255eb2397332 Ingo Molnar         2025-04-09 @42  		wrmsrq(MSR_IA32_SPEC_CTRL, this_cpu_read(spec_ctrl));
71c208dd54ab97 Juergen Gross       2018-02-26  43  
f6eafe3665bcc3 Ian Campbell        2009-11-25  44  	/* Boot processor notified via generic timekeeping_resume() */
f6eafe3665bcc3 Ian Campbell        2009-11-25  45  	if (smp_processor_id() == 0)
f6eafe3665bcc3 Ian Campbell        2009-11-25  46  		return;
f6eafe3665bcc3 Ian Campbell        2009-11-25  47  
f46481d0a7cb94 Thomas Gleixner     2015-03-25  48  	tick_resume_local();
f6eafe3665bcc3 Ian Campbell        2009-11-25  49  }
f6eafe3665bcc3 Ian Campbell        2009-11-25  50  
2b953a5e994ce2 Boris Ostrovsky     2015-04-28  51  static void xen_vcpu_notify_suspend(void *data)
2b953a5e994ce2 Boris Ostrovsky     2015-04-28  52  {
71c208dd54ab97 Juergen Gross       2018-02-26  53  	u64 tmp;
71c208dd54ab97 Juergen Gross       2018-02-26  54  
2b953a5e994ce2 Boris Ostrovsky     2015-04-28  55  	tick_suspend_local();
71c208dd54ab97 Juergen Gross       2018-02-26  56  
71c208dd54ab97 Juergen Gross       2018-02-26  57  	if (xen_pv_domain() && boot_cpu_has(X86_FEATURE_SPEC_CTRL)) {
c435e608cf59ff Ingo Molnar         2025-04-09 @58  		rdmsrq(MSR_IA32_SPEC_CTRL, tmp);
71c208dd54ab97 Juergen Gross       2018-02-26  59  		this_cpu_write(spec_ctrl, tmp);
78255eb2397332 Ingo Molnar         2025-04-09  60  		wrmsrq(MSR_IA32_SPEC_CTRL, 0);
71c208dd54ab97 Juergen Gross       2018-02-26  61  	}
2b953a5e994ce2 Boris Ostrovsky     2015-04-28  62  }
2b953a5e994ce2 Boris Ostrovsky     2015-04-28  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
