Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AD1BC5C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724290215; cv=none; b=OoYwzrhLcISXe5LReLexrHdAldqgdo3vz6IXpzLFh5t05kVofNVCdQumrm84Fqg5slMTq6SEbTcGxCfS4312jppM5+1BdtFpB7YM1yyRyBn1NDusK8KpYzr+6AM3CqtKOOcNrR9AFJOLgxiUtehT2gs272/Sac6dmgsQN1v4log=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724290215; c=relaxed/simple;
	bh=kNc6YZgDUjCrvphTHKF+SmMikmDK02Hjzcucee4EMR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1KHFQUmWt82Ils3tz/7iA1/RGKp6q01Jlmsu/u87rXVQ3+tq7Zs3GzQome3BCQASv3via5LEIVcPixLUnz21q7F/tXAmKmUyExVeYxB5jF55w4+C+QUfTEdVo7ZEAovIdlaP3AlfxD8nQcjPQI/t0xLQ1e/9aKYUGacjARp8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl6GpT9S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl6GpT9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724290213; x=1755826213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kNc6YZgDUjCrvphTHKF+SmMikmDK02Hjzcucee4EMR4=;
  b=Vl6GpT9StiVCUn8HjxHNkcfv6/FIsoChBAwjdk68jOAilR2cPg5VuAKZ
   qI0FNXLMFhW1+yi3DaWvAtWIqQvPX6gewacvKL/zvpYj5kCS+1qT/ZsaX
   4xzJL77tKyXBD78Psbear9vmsz8F3loABFt5oQujv0lMTZsklyOnc7Wn7
   aRuTs7B/PkNdqgWyIyg93J3BdGnvD6TZU6ygoNRBV4oUQLZT/GtG3CgHO
   nhLTif6dAvu9v67qLUD3gGKtfghFrOTVUNwLsHOaAhXFSqlesyCFb1I1L
   ZnXmYqeEGHUH5+bwLbSXso3aIpYwvJ9yDguXC2XhJsvE3ZED9F6fyoFgK
   A==;
X-CSE-ConnectionGUID: ywh7TSKeQTmTEnpDOSirPw==
X-CSE-MsgGUID: rGJ+/a3ZRy+2HucxjExgng==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33834827"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33834827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 18:30:13 -0700
X-CSE-ConnectionGUID: vpLqAcngSpaxmMJwHeQdvg==
X-CSE-MsgGUID: rNm77fiMTR+8oSTfLjFnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61269992"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 18:30:11 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgweP-000C8W-1b;
	Thu, 22 Aug 2024 01:30:09 +0000
Date: Thu, 22 Aug 2024 09:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Haitao Huang <haitao.huang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 05/16] x86/sgx: Implement basic EPC misc cgroup
 functionality
Message-ID: <202408220921.dv8xRSTx-lkp@intel.com>
References: <20240821015404.6038-6-haitao.huang@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821015404.6038-6-haitao.huang@linux.intel.com>

Hi Haitao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Haitao-Huang/x86-sgx-Replace-boolean-parameters-with-enums/20240821-095959
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240821015404.6038-6-haitao.huang%40linux.intel.com
patch subject: [PATCH v16 05/16] x86/sgx: Implement basic EPC misc cgroup functionality
config: x86_64-randconfig-123-20240822 (https://download.01.org/0day-ci/archive/20240822/202408220921.dv8xRSTx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220921.dv8xRSTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220921.dv8xRSTx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/sgx/epc_cgroup.c:62:27: sparse: sparse: symbol 'sgx_cgroup_ops' was not declared. Should it be static?
   arch/x86/kernel/cpu/sgx/epc_cgroup.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/sgx_cgroup_ops +62 arch/x86/kernel/cpu/sgx/epc_cgroup.c

    61	
  > 62	const struct misc_res_ops sgx_cgroup_ops = {
    63		.alloc = sgx_cgroup_alloc,
    64		.free = sgx_cgroup_free,
    65	};
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
