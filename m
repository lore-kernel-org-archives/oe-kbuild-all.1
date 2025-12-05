Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE7E3148DB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938153; cv=none; b=LxB0cLYx/EYlHeS3spz5NsHognIzGNVbTTpq0pw0kQ2mkbVwg3LFSYwTXl1p0hhkQuf1LjhmHeV0wjiegr3DbInQhsj0+otU0+z/2n+bPrWc5E1iQpROn2SbLTzfB46ZMhaRSWfD/SWszvXOsd7ESznTud77/6qngCTkAeD1LGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938153; c=relaxed/simple;
	bh=RMrh4XhewGTlM9UIDG4XHoZIDZpjgxodSZcJCRHeQqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRD7iTBDCl95UAO0VRLe2/+f4j88RBOVS790xQXaWJF9IU3wh+ioaZ0vjq7WZ9EEbpozh/6duLQFSMZQwwzXyL5U5BKU9/AYpAGLzzpBzPD3DSfm/CpQ1P5AuOUCJ1irF5OYwfxF4q5M2pCJ/dfAM859H/XGLDU5dvLpmWFw5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJUlvtW/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJUlvtW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764938150; x=1796474150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RMrh4XhewGTlM9UIDG4XHoZIDZpjgxodSZcJCRHeQqM=;
  b=HJUlvtW/u6KMy3OBFVmU9UyXZB47O+AKqOcQ22udtPCoGJ2eQIcVtqxt
   JmNCWQd6WCUQbguj5RzvoclFMeyADwE3LQgqtqtss2aJ7lj9knk2tkk2K
   /Ridbw7QtM2ntEeJwIK31eV4UIF1Ca0zzGv2BouCZoKLDz4lgTlrWp/gh
   LPaG+V4qPvWiWS9lCPRPqZARzBW/hG581extW7adNdxV8ARxAXGffCLa2
   h4dXDswhk6wPr90utGyfXuSBFz7gGGzNHZi/h4lvgXwjOQ0WdxBXnOdMW
   Yj+ArUGLdg0Ome31a1OpZsqFpzOAdrz1l7u20pHVbnLlxqeozJR4JeW5V
   g==;
X-CSE-ConnectionGUID: 4iWXKcHSTzyKnWRZEeM7Tg==
X-CSE-MsgGUID: eaVbfYuFRCi758jkz9KtbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78080778"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78080778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 04:35:47 -0800
X-CSE-ConnectionGUID: IRk87KE6RSWuKQFD+9jdyA==
X-CSE-MsgGUID: hhyuT03VTPGV2fgb4YVrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194936373"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 04:35:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRV2F-00000000Eyb-0bT8;
	Fri, 05 Dec 2025 12:35:43 +0000
Date: Fri, 5 Dec 2025 20:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v24 21/28] riscv: kernel command line option to opt out
 of user cfi
Message-ID: <202512052014.vx8MOa3t-lkp@intel.com>
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
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20251205/202512052014.vx8MOa3t-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052014.vx8MOa3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052014.vx8MOa3t-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/cpufeature.c: In function 'riscv_cfilp_validate':
>> arch/riscv/kernel/cpufeature.c:282:14: error: 'riscv_nousercfi' undeclared (first use in this function)
     282 |             (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI))
         |              ^~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:282:14: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/cpufeature.c: In function 'riscv_cfiss_validate':
   arch/riscv/kernel/cpufeature.c:292:14: error: 'riscv_nousercfi' undeclared (first use in this function)
     292 |             (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI))
         |              ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


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
