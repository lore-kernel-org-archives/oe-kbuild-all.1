Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015B336EDA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427581; cv=none; b=DIcz6zWPwqiFz3vpl6ra7NdDJ2hKpTOkz1XYv2xVThlKbarCyJP6n1T6UsDEZ6J139Msbm7ZvSBGHFQkBNDtQ7nMLEdBaIptv4gEo0FO+Lo6mHuuDzODH8EfjsxjXS05Le7xfLbA06fKo0LWWL9AwW5BKIVDh6Llmo9qrpM6Y94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427581; c=relaxed/simple;
	bh=muW5TVaBmMsaWDDVNl5YEZ/oD/ZS8NjJCUcCla9kUyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmX6mqyDjqdUcKwsWqFEYb8E8XwBp0jLkJ0tBDnVu7XE8uf4AKFQk9wgpV+dIxl14ShRplJgbC+y5BKZ6oq/J57iB8ypQM86o5iH83viAzdGEadCslYNefa+/XrNfNy2TIoo3rwAikqTYr+xiEHZRhP7eSdB3UmEzHu0Db1MKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3LhbUcR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3LhbUcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771427579; x=1802963579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=muW5TVaBmMsaWDDVNl5YEZ/oD/ZS8NjJCUcCla9kUyc=;
  b=e3LhbUcRc251X2QZi1tlIdPw118BupAtf5wUvwl/SNDSz9IPDyW3i4Pl
   /Tbe4MpEqiWAE3niekSpR2ow7ca5Q+s5zJZA7dj1dN7YcG2B6vkvoa83g
   ulGAYr89PjosOHovP5V1T03wRJJA6ypTXSOGyoA7uZuf6fNPDrCuLH6lK
   L6upKZznLRVjTc/dJtQ5mgfeg4vMAskJ8cb7z0K4rp9fxxcls62Kfk4px
   +Jtm7tv+zPBCHStTdToX1D8XbnG2bsM5L5yWPC9cEyua7Yu3oMWyZky5Z
   aHbb4vycBKy91O7K1XOH4ceQALMxT32K42stsMywPVvqHE5CzaXIBaP42
   g==;
X-CSE-ConnectionGUID: vdKpFeBHSE+v8BBK9kEU3w==
X-CSE-MsgGUID: 8+qoyL/eSRi6GxDyMFjCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83221377"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83221377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 07:12:58 -0800
X-CSE-ConnectionGUID: 0XCVxOZwSV69Gsc3l2kwNg==
X-CSE-MsgGUID: a9rrL5sxRv6wzSUohccJKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="237211841"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Feb 2026 07:12:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsjEU-000000012SO-1WmU;
	Wed, 18 Feb 2026 15:12:54 +0000
Date: Wed, 18 Feb 2026 23:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "Xin Li (Intel)" <xin@zytor.com>
Subject: Re: [PATCH v3 10/16] x86/msr: Use the alternatives mechanism for
 RDMSR
Message-ID: <202602182222.WEBLSQRj-lkp@intel.com>
References: <20260218082133.400602-11-jgross@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218082133.400602-11-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260218]
[cannot apply to tip/x86/core kvm/queue kvm/next kvm/linux-next tip/x86/tdx]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-alternative-Support-alt_replace_call-with-instructions-after-call/20260218-163031
base:   linus/master
patch link:    https://lore.kernel.org/r/20260218082133.400602-11-jgross%40suse.com
patch subject: [PATCH v3 10/16] x86/msr: Use the alternatives mechanism for RDMSR
config: x86_64-randconfig-076-20260218 (https://download.01.org/0day-ci/archive/20260218/202602182222.WEBLSQRj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182222.WEBLSQRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182222.WEBLSQRj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_crash.c: In function 'hv_hvcrash_ctxt_save':
>> arch/x86/hyperv/hv_crash.c:216:24: error: too few arguments to function '__rdmsr'
     216 |         ctxt->gsbase = __rdmsr(MSR_GS_BASE);
         |                        ^~~~~~~
   In file included from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/delay.h:14,
                    from arch/x86/hyperv/hv_crash.c:40:
   arch/x86/include/asm/msr.h:167:29: note: declared here
     167 | static __always_inline bool __rdmsr(u32 msr, u64 *val, int type)
         |                             ^~~~~~~
   arch/x86/hyperv/hv_crash.c:217:22: error: too few arguments to function '__rdmsr'
     217 |         ctxt->efer = __rdmsr(MSR_EFER);
         |                      ^~~~~~~
   arch/x86/include/asm/msr.h:167:29: note: declared here
     167 | static __always_inline bool __rdmsr(u32 msr, u64 *val, int type)
         |                             ^~~~~~~
   arch/x86/hyperv/hv_crash.c:218:21: error: too few arguments to function '__rdmsr'
     218 |         ctxt->pat = __rdmsr(MSR_IA32_CR_PAT);
         |                     ^~~~~~~
   arch/x86/include/asm/msr.h:167:29: note: declared here
     167 | static __always_inline bool __rdmsr(u32 msr, u64 *val, int type)
         |                             ^~~~~~~
   arch/x86/hyperv/hv_crash.c: In function 'crash_nmi_callback':
   arch/x86/hyperv/hv_crash.c:282:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     282 |         u64 status;
         |             ^~~~~~


vim +/__rdmsr +216 arch/x86/hyperv/hv_crash.c

94212d34618c26 Mukesh Rathor 2025-10-06  192  
94212d34618c26 Mukesh Rathor 2025-10-06  193  /* Save essential context */
94212d34618c26 Mukesh Rathor 2025-10-06  194  static void hv_hvcrash_ctxt_save(void)
94212d34618c26 Mukesh Rathor 2025-10-06  195  {
94212d34618c26 Mukesh Rathor 2025-10-06  196  	struct hv_crash_ctxt *ctxt = &hv_crash_ctxt;
94212d34618c26 Mukesh Rathor 2025-10-06  197  
94212d34618c26 Mukesh Rathor 2025-10-06  198  	asm volatile("movq %%rsp,%0" : "=m"(ctxt->rsp));
94212d34618c26 Mukesh Rathor 2025-10-06  199  
94212d34618c26 Mukesh Rathor 2025-10-06  200  	ctxt->cr0 = native_read_cr0();
94212d34618c26 Mukesh Rathor 2025-10-06  201  	ctxt->cr4 = native_read_cr4();
94212d34618c26 Mukesh Rathor 2025-10-06  202  
94212d34618c26 Mukesh Rathor 2025-10-06  203  	asm volatile("movq %%cr2, %0" : "=a"(ctxt->cr2));
94212d34618c26 Mukesh Rathor 2025-10-06  204  	asm volatile("movq %%cr8, %0" : "=a"(ctxt->cr8));
94212d34618c26 Mukesh Rathor 2025-10-06  205  
94212d34618c26 Mukesh Rathor 2025-10-06  206  	asm volatile("movl %%cs, %%eax" : "=a"(ctxt->cs));
94212d34618c26 Mukesh Rathor 2025-10-06  207  	asm volatile("movl %%ss, %%eax" : "=a"(ctxt->ss));
94212d34618c26 Mukesh Rathor 2025-10-06  208  	asm volatile("movl %%ds, %%eax" : "=a"(ctxt->ds));
94212d34618c26 Mukesh Rathor 2025-10-06  209  	asm volatile("movl %%es, %%eax" : "=a"(ctxt->es));
94212d34618c26 Mukesh Rathor 2025-10-06  210  	asm volatile("movl %%fs, %%eax" : "=a"(ctxt->fs));
94212d34618c26 Mukesh Rathor 2025-10-06  211  	asm volatile("movl %%gs, %%eax" : "=a"(ctxt->gs));
94212d34618c26 Mukesh Rathor 2025-10-06  212  
94212d34618c26 Mukesh Rathor 2025-10-06  213  	native_store_gdt(&ctxt->gdtr);
94212d34618c26 Mukesh Rathor 2025-10-06  214  	store_idt(&ctxt->idtr);
94212d34618c26 Mukesh Rathor 2025-10-06  215  
94212d34618c26 Mukesh Rathor 2025-10-06 @216  	ctxt->gsbase = __rdmsr(MSR_GS_BASE);
94212d34618c26 Mukesh Rathor 2025-10-06  217  	ctxt->efer = __rdmsr(MSR_EFER);
94212d34618c26 Mukesh Rathor 2025-10-06  218  	ctxt->pat = __rdmsr(MSR_IA32_CR_PAT);
94212d34618c26 Mukesh Rathor 2025-10-06  219  }
94212d34618c26 Mukesh Rathor 2025-10-06  220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
