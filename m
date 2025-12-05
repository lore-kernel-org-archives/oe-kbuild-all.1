Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430831A814
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944515; cv=none; b=KQzGFfvMsTw+mtXKj/uZFyHvp7WQjuN+zo6u4JpML4HjMs8d6e3GMJKZDRilOz/uvKRHBluVd4cLSscLDZ5pruWFtG1bwyAF6/prhni9+sTGpRy19kbzjPZ0HInIQgKNrbKhw2RIGP+k+Nd5eUJXFPmpxak3UNYbp1JuIyvBm4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944515; c=relaxed/simple;
	bh=H2Jl8A3NgI+88Xbl6vGPohdRmfyN/cSUoNcxcQ4sHvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMYpUS3I7e1BaqapDQHa+CPFPAmBjfHXR0WnDNFKGObX0VPLOTwjQ3jD7+3xkrudNdQvohIKEsXFSv0VynvT2afaYYYk9XDrzthbemCbXNeTotiBtbKAPDTotEV5H21cQo3tr3VDCcCWRGjbQ5vYcjD31l+75gtecNy2iUpZIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRL5Rkqf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRL5Rkqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764944512; x=1796480512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2Jl8A3NgI+88Xbl6vGPohdRmfyN/cSUoNcxcQ4sHvM=;
  b=HRL5RkqfsJK8yJeVnGFDEJAi3TxjxNHD22BsA4yMOEYxXbKuJttGIYJy
   4DOdJOy4dbkFcFlP/AhxGop5vFV6yROWh+pFIcClUf7umZOYerCojp309
   hD8hL8bXUn9jUFwvCkxRbpsnxjhx7R+bzQUujLklYjQwrSGAJvLOzBd5C
   XV9FtQhO3FLxl16U5/67L8aga2Z2zR2alUgZDeaXX8b6lweiZPH/r7JbN
   z+N0777BMiqL9a4o3tcXMPboZPv+p+IIxEfROFl/uX5aQ7EoaFRq+VlpQ
   xEoO+WYH9SaZ4Miyv1Oz3iC01OHGwbWM60u8oQvZE1JiGm7Zv7NUomgSJ
   Q==;
X-CSE-ConnectionGUID: hHJUboj2TrqrtKCu+0HZfQ==
X-CSE-MsgGUID: nPQNw7GnSVGz8ZRSzwmZgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70828175"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="70828175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 06:21:51 -0800
X-CSE-ConnectionGUID: 0TNin9s6QXqOSrbpVmAiRQ==
X-CSE-MsgGUID: tBdrxX8MQPy8hSaZvNZwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194961171"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 06:21:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRWgt-00000000F49-3nnp;
	Fri, 05 Dec 2025 14:21:47 +0000
Date: Fri, 5 Dec 2025 22:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v24 21/28] riscv: kernel command line option to opt out
 of user cfi
Message-ID: <202512052239.zgQE0f0g-lkp@intel.com>
References: <20251204-v5_user_cfi_series-v24-21-ada7a3ba14dc@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-v5_user_cfi_series-v24-21-ada7a3ba14dc@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20251205-040616
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251204-v5_user_cfi_series-v24-21-ada7a3ba14dc%40rivosinc.com
patch subject: [PATCH v24 21/28] riscv: kernel command line option to opt out of user cfi
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251205/202512052239.zgQE0f0g-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052239.zgQE0f0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052239.zgQE0f0g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:282:7: error: use of undeclared identifier 'riscv_nousercfi'
     282 |             (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI))
         |              ^~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:292:7: error: use of undeclared identifier 'riscv_nousercfi'
     292 |             (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI))
         |              ^~~~~~~~~~~~~~~
   2 errors generated.


vim +/riscv_nousercfi +282 arch/riscv/kernel/cpufeature.c

   277	
   278	static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
   279					const unsigned long *isa_bitmap)
   280	{
   281		if (!IS_ENABLED(CONFIG_RISCV_USER_CFI) ||
 > 282		    (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI))
   283			return -EINVAL;
   284	
   285		return 0;
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
