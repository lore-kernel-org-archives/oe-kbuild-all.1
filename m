Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EBE1339B1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728159150; cv=none; b=TzgKm4lte3cdZjcfZvD8ZpQEvvFEtyEc20cwK7ZN54D0UwVFaRgwVbDZ66DAQlLA/8ajZ72ERTQ1ZL359akPyg4q07/tnX4Chi4CpaqzjvgOsmBRaodC5DHlF3yQm7FeY2zPPww+gBEzeI91SjyIva8eCd1z/kEygoaXdvvmDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728159150; c=relaxed/simple;
	bh=O1bHSMzY0RzoKVbr2dXVZxa/d3bf6hdFlEVdiyIBdaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbG/dnkcunguyUng/SumqPNvLqgzB7qBfFa6ArJBq2HyBvhzhuBWUQUnDln4NnuWInivzeX20cH/tK22MvvF98UwZEt0QeBXCZHTIqLHOzfd3epMucp20oxPd6lQwA/SkNFdoK8Kz5zTRQ63suq18YTvCSNChlrJg1b0f09tgiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkAG/ISI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkAG/ISI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728159149; x=1759695149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O1bHSMzY0RzoKVbr2dXVZxa/d3bf6hdFlEVdiyIBdaM=;
  b=MkAG/ISI+vaUOPazdL2T80lAlJxuwypk9IiavVQZGbj1MwMFgyoEcRKw
   eHt8b2HnxZe0ZyDvE9EF4gpl6VsHg6AoOo/uyLZQDVsp114o58EYnBO22
   Nq9z3O6ukhKJnJfuAZkRpZer/6ISDr3qljtq02fi04RD51Qp14hyeyAYv
   GlAElnq6D9+3mzzmt7+d1tWeL0z+LmvGCrxBVq45VPEAxmiN4KB6eUnf9
   hA7pRBxCuP/x8A/+enfmkqOvPeaa5tnd+wYIkxmo+zrG2vnvh2rchFHpJ
   5dLd7icrFsFK6IcqYv3j3vqli97zZ9Y3Zd6hBE7KIHVE3gJuanDzX0q33
   w==;
X-CSE-ConnectionGUID: uBclZC/GReKyI20+tcVhyw==
X-CSE-MsgGUID: jZWVyn5pTz2I9H1YS2UwIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27528841"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27528841"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 13:12:27 -0700
X-CSE-ConnectionGUID: 1/h9+fEkQ6KCFwmsxozbtQ==
X-CSE-MsgGUID: Wo5sX4F6TQq/mt5NFrSvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="105803113"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2024 13:12:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxB8Z-0003KE-34;
	Sat, 05 Oct 2024 20:12:23 +0000
Date: Sun, 6 Oct 2024 04:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the
 kstate's migration stream
Message-ID: <202410060159.auLHpHLI-lkp@intel.com>
References: <20241002160722.20025-3-arbn@yandex-team.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002160722.20025-3-arbn@yandex-team.com>

Hi Andrey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Ryabinin/kstate-Add-kstate-a-mechanism-to-migrate-some-kernel-state-across-kexec/20241003-001223
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20241002160722.20025-3-arbn%40yandex-team.com
patch subject: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the kstate's migration stream
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20241006/202410060159.auLHpHLI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060159.auLHpHLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060159.auLHpHLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/machine_kexec_64.c:550:11: warning: variable 'control' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     550 |         else if (kexec_crash_image)
         |                  ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/machine_kexec_64.c:553:37: note: uninitialized use occurs here
     553 |         kexec_mark_range(crashk_res.start, control + PAGE_SIZE - 1, protect);
         |                                            ^~~~~~~
   arch/x86/kernel/machine_kexec_64.c:550:7: note: remove the 'if' if its condition is always true
     550 |         else if (kexec_crash_image)
         |              ^~~~~~~~~~~~~~~~~~~~~~
     551 |                 control = PFN_PHYS(page_to_pfn(kexec_crash_image->control_code_page));
   arch/x86/kernel/machine_kexec_64.c:543:23: note: initialize the variable 'control' to silence this warning
     543 |         unsigned long control;
         |                              ^
         |                               = 0
   1 warning generated.


vim +550 arch/x86/kernel/machine_kexec_64.c

   540	
   541	static void kexec_mark_crashkres(bool protect)
   542	{
   543		unsigned long control;
   544	
   545		kexec_mark_range(crashk_low_res.start, crashk_low_res.end, protect);
   546	
   547		/* Don't touch the control code page used in crash_kexec().*/
   548		if (kexec_image && kexec_image->type & KEXEC_TYPE_MIGRATE)
   549			control = PFN_PHYS(page_to_pfn(kexec_image->control_code_page));
 > 550		else if (kexec_crash_image)
   551			control = PFN_PHYS(page_to_pfn(kexec_crash_image->control_code_page));
   552		/* Control code page is located in the 2nd page. */
   553		kexec_mark_range(crashk_res.start, control + PAGE_SIZE - 1, protect);
   554		control += KEXEC_CONTROL_PAGE_SIZE;
   555		kexec_mark_range(control, crashk_res.end, protect);
   556	}
   557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
