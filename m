Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E42E338B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742081384; cv=none; b=qJe8ejEqgR3qqbsrz5+G/IV8FWTt3CZFeIXc35VKi7cGSZxWnSBkVfbKl4RaSMT3w2e/d37zPSuviTgwkdIa9xo4NmojzDzDy6+80+I0qrsWXHtam9kcACp+u46i3QFxRz2wX7AJygA7a1zgo8L0hZWXGt6aYqHodimeVa4YtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742081384; c=relaxed/simple;
	bh=1uCu2yjhZCgzq8A26Se4SNOn0elVoUbQNF4QHLE6Ytg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXrKlBXVsx9kqGAKLQHlZha0UNmwhp9XN4UgIYX4OJpLEM6bhNYyLUSiUW8GTU4otmUjPb4Tzh+4haA5wqC7rZwp8lh/g3yZsz2OT1ldj3L0XKZhp7vSm+0GOEI3Orqc1oZxCp1FNlq0ZpI0g2/2U9TGqztVuGPpfZTD/84e7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLP0Wgkz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLP0Wgkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742081382; x=1773617382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1uCu2yjhZCgzq8A26Se4SNOn0elVoUbQNF4QHLE6Ytg=;
  b=SLP0WgkzA6yBmvze7ktAU19wwCKWiKqigLxpnToXgbX6O3BqSDfADcRx
   klrIP6LNTNOfmdH0Ftoc5hcpg/GTm8HfXnTtnGgZaLZA0cPzuT6Z64FFQ
   SyIt+1NifRZZmB515uJ7ivANdwML5GFPrMcdQ5EYAHBKffQWhbPMWVu6k
   HuYpKAzncHM4Qc/NN8CMjDsmy7FtSsTZOyv23Y+GPcMtv0r0vf10vjxuY
   +QbO9QYx95/YaWfJEPwDLHvWOnGdyjIyD+Zn6bKWtpBfeaiDhFiGFOkZR
   pHBl8/d5Kz6wSq8KKZIWqFRy1pJ6K7LcP1TdlsBQAQ6u0su7xwJy1VZGO
   g==;
X-CSE-ConnectionGUID: PG8LipgIRpO/yk/B5k1bbw==
X-CSE-MsgGUID: 0jb6OIS3THS3x8XMmFUAuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="42454068"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="42454068"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 16:29:41 -0700
X-CSE-ConnectionGUID: SVZiwoUNTAS+EEqtE2S//g==
X-CSE-MsgGUID: OR4Sj66XTR2Yso0FyJT7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="121636888"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2025 16:29:34 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttawd-000BiB-2d;
	Sat, 15 Mar 2025 23:29:31 +0000
Date: Sun, 16 Mar 2025 07:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de,
	bhelgaas@google.com, bp@alien8.de, catalin.marinas@arm.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH hyperv-next v6 03/11] Drivers: hv: Enable VTL mode for
 arm64
Message-ID: <202503160607.GJqd9Ku7-lkp@intel.com>
References: <20250315001931.631210-4-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-4-romank@linux.microsoft.com>

Hi Roman,

kernel test robot noticed the following build errors:

[auto build test ERROR on d9608f6dc3e3229a40e1db1dab573d6882f38c2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detecting-hypervisor-presence/20250315-082319
base:   d9608f6dc3e3229a40e1db1dab573d6882f38c2a
patch link:    https://lore.kernel.org/r/20250315001931.631210-4-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v6 03/11] Drivers: hv: Enable VTL mode for arm64
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250316/202503160607.GJqd9Ku7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160607.GJqd9Ku7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160607.GJqd9Ku7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_system_desc_base':
>> arch/x86/hyperv/hv_vtl.c:84:28: error: 'struct ldttss_desc' has no member named 'base3'; did you mean 'base0'?
      84 |         return ((u64)desc->base3 << 32) | ((u64)desc->base2 << 24) |
         |                            ^~~~~
         |                            base0
   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_ap_entry':
>> arch/x86/hyperv/hv_vtl.c:96:35: error: 'secondary_startup_64' undeclared (first use in this function); did you mean 'secondary_startup_64_fn'?
      96 |         ((secondary_startup_64_fn)secondary_startup_64)(&boot_params, &boot_params);
         |                                   ^~~~~~~~~~~~~~~~~~~~
         |                                   secondary_startup_64_fn
   arch/x86/hyperv/hv_vtl.c:96:35: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_bringup_vcpu':
   arch/x86/hyperv/hv_vtl.c:116:19: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     116 |         u64 rip = (u64)&hv_vtl_ap_entry;
         |                   ^
   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_system_desc_base':
   arch/x86/hyperv/hv_vtl.c:86:1: warning: control reaches end of non-void function [-Wreturn-type]
      86 | }
         | ^


vim +84 arch/x86/hyperv/hv_vtl.c

3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  81  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  82  static inline u64 hv_vtl_system_desc_base(struct ldttss_desc *desc)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  83  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10 @84  	return ((u64)desc->base3 << 32) | ((u64)desc->base2 << 24) |
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  85  		(desc->base1 << 16) | desc->base0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  86  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  87  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  88  static inline u32 hv_vtl_system_desc_limit(struct ldttss_desc *desc)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  89  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  90  	return ((u32)desc->limit1 << 16) | (u32)desc->limit0;
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  91  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  92  
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  93  typedef void (*secondary_startup_64_fn)(void*, void*);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  94  static void hv_vtl_ap_entry(void)
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  95  {
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10 @96  	((secondary_startup_64_fn)secondary_startup_64)(&boot_params, &boot_params);
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  97  }
3be1bc2fe9d2e4f Saurabh Sengar 2023-04-10  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
